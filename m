Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KEpI4LzpWkxIQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:30:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7DB1DF8D8
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511EA10E5BB;
	Mon,  2 Mar 2026 20:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbWEnB2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CCF10E5BB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772483454; x=1804019454;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xCHsFfvk3wkxua5VMLmMlhpKl8Z/IGzNpHuhXE6Ggis=;
 b=PbWEnB2nb7i1bHYo9lYeICDGDB89FB2DPqViz71QVRmJmPcFDMFgoIRH
 1bOQEd0wul4Hd9QD6WG5Gi3RhLmxuifKZpzkTgxWRKx48qfusrq3BuGFK
 nUtf1mrm5KDQtViaCiN5tqxCRCR09dIyqAs3PQm3IDpHPlGb8GMUNlRVd
 Afuo/G3MWVog+mLUxGRbPtCOtunpcF6/MmoPvh/67MAnA7q08j3LgCmBJ
 rXyMFskpS/Y7FrDRH06krSGquV+Ip230IRgxSlLozhoo3EhxJL7ZfRP31
 XsLTdlUlwpV7BDHzEA+olHA5YGZ3C2XG2NVEb4iHtFcKzCQCQK0PEo09W A==;
X-CSE-ConnectionGUID: 5xDg7feGSCyS66O4YYJ2hQ==
X-CSE-MsgGUID: gJ5dclsCRMagl+i3hkv8fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73692430"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73692430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:30:53 -0800
X-CSE-ConnectionGUID: qBt65wXxSnWnY4xaHiqzuQ==
X-CSE-MsgGUID: qNjqg2/cQz+klMZ+zoLp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="240778920"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.94.253.247])
 ([10.94.253.247])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:30:51 -0800
Message-ID: <68617c15-c13a-488b-8c2b-54a342fcdfae@linux.intel.com>
Date: Mon, 2 Mar 2026 21:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Limit number of maximum contexts and
 doorbells per user
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com
References: <20260225180638.316126-1-maciej.falkowski@linux.intel.com>
 <88c1af96-5593-2554-2e17-269bed38d000@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <88c1af96-5593-2554-2e17-269bed38d000@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: CD7DB1DF8D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:oded.gabbay@gmail.com,m:jeff.hugo@oss.qualcomm.com,m:karol.wachowski@linux.intel.com,m:odedgabbay@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,amd.com:email,intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 2/25/2026 9:50 PM, Lizhi Hou wrote:

> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
I sent v3 with a rebase & refactor to use kzalloc_obj* functions after 
treewide change.
Would you mind to see it and Rev-by again?

Best regards,
Maciej
>
> On 2/25/26 10:06, Maciej Falkowski wrote:
>> From: Karol Wachowski <karol.wachowski@linux.intel.com>
>>
>> Implement per-user resource limits to prevent resource exhaustion.
>>
>> Root users can allocate all available contexts (128) and doorbells
>> (255), while non-root users are limited to half of the available
>> resources (64 contexts and 127 doorbells respectively).
>>
>> This prevents scenarios where a single user could monopolize NPU
>> resources and starve other users on multi-user systems.
>>
>> Change doorbell ID and command queue ID allocation errors to debug
>> messages as those are user triggered.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>> v1 -> v2:
>>    - Fixed off-by-one error (Lizhi)
>> ---
>>   drivers/accel/ivpu/ivpu_drv.c | 94 ++++++++++++++++++++++++++++++++---
>>   drivers/accel/ivpu/ivpu_drv.h | 26 ++++++++--
>>   drivers/accel/ivpu/ivpu_job.c | 36 ++++++++++----
>>   3 files changed, 136 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c 
>> b/drivers/accel/ivpu/ivpu_drv.c
>> index 3b6ec8eecf2f..1d9f7d2f71a2 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -68,6 +68,73 @@ bool ivpu_force_snoop;
>>   module_param_named(force_snoop, ivpu_force_snoop, bool, 0444);
>>   MODULE_PARM_DESC(force_snoop, "Force snooping for NPU host memory 
>> access");
>>   +static struct ivpu_user_limits *ivpu_user_limits_alloc(struct 
>> ivpu_device *vdev, uid_t uid)
>> +{
>> +    struct ivpu_user_limits *limits;
>> +
>> +    limits = kzalloc(sizeof(*limits), GFP_KERNEL);
>> +    if (!limits)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    kref_init(&limits->ref);
>> +    atomic_set(&limits->db_count, 0);
>> +    limits->vdev = vdev;
>> +    limits->uid = uid;
>> +
>> +    /* Allow root user to allocate all contexts */
>> +    if (uid == 0) {
>> +        limits->max_ctx_count = ivpu_get_context_count(vdev);
>> +        limits->max_db_count = ivpu_get_doorbell_count(vdev);
>> +    } else {
>> +        limits->max_ctx_count = ivpu_get_context_count(vdev) / 2;
>> +        limits->max_db_count = ivpu_get_doorbell_count(vdev) / 2;
>> +    }
>> +
>> +    hash_add(vdev->user_limits, &limits->hash_node, uid);
>> +
>> +    return limits;
>> +}
>> +
>> +static struct ivpu_user_limits *ivpu_user_limits_get(struct 
>> ivpu_device *vdev)
>> +{
>> +    struct ivpu_user_limits *limits;
>> +    uid_t uid = current_uid().val;
>> +
>> +    guard(mutex)(&vdev->user_limits_lock);
>> +
>> +    hash_for_each_possible(vdev->user_limits, limits, hash_node, uid) {
>> +        if (limits->uid == uid) {
>> +            if (kref_read(&limits->ref) >= limits->max_ctx_count) {
>> +                ivpu_dbg(vdev, IOCTL, "User %u exceeded max ctx 
>> count %u\n", uid,
>> +                     limits->max_ctx_count);
>> +                return ERR_PTR(-EMFILE);
>> +            }
>> +
>> +            kref_get(&limits->ref);
>> +            return limits;
>> +        }
>> +    }
>> +
>> +    return ivpu_user_limits_alloc(vdev, uid);
>> +}
>> +
>> +static void ivpu_user_limits_release(struct kref *ref)
>> +{
>> +    struct ivpu_user_limits *limits = container_of(ref, struct 
>> ivpu_user_limits, ref);
>> +    struct ivpu_device *vdev = limits->vdev;
>> +
>> +    lockdep_assert_held(&vdev->user_limits_lock);
>> +    drm_WARN_ON(&vdev->drm, atomic_read(&limits->db_count));
>> +    hash_del(&limits->hash_node);
>> +    kfree(limits);
>> +}
>> +
>> +static void ivpu_user_limits_put(struct ivpu_device *vdev, struct 
>> ivpu_user_limits *limits)
>> +{
>> +    guard(mutex)(&vdev->user_limits_lock);
>> +    kref_put(&limits->ref, ivpu_user_limits_release);
>> +}
>> +
>>   struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv 
>> *file_priv)
>>   {
>>       struct ivpu_device *vdev = file_priv->vdev;
>> @@ -111,6 +178,7 @@ static void file_priv_release(struct kref *ref)
>>       mutex_unlock(&vdev->context_list_lock);
>>       pm_runtime_put_autosuspend(vdev->drm.dev);
>>   +    ivpu_user_limits_put(vdev, file_priv->user_limits);
>>       mutex_destroy(&file_priv->ms_lock);
>>       mutex_destroy(&file_priv->lock);
>>       kfree(file_priv);
>> @@ -170,7 +238,7 @@ static int ivpu_get_param_ioctl(struct drm_device 
>> *dev, void *data, struct drm_f
>>           args->value = ivpu_hw_dpu_max_freq_get(vdev);
>>           break;
>>       case DRM_IVPU_PARAM_NUM_CONTEXTS:
>> -        args->value = ivpu_get_context_count(vdev);
>> +        args->value = file_priv->user_limits->max_ctx_count;
>>           break;
>>       case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>>           args->value = vdev->hw->ranges.user.start;
>> @@ -232,22 +300,30 @@ static int ivpu_open(struct drm_device *dev, 
>> struct drm_file *file)
>>   {
>>       struct ivpu_device *vdev = to_ivpu_device(dev);
>>       struct ivpu_file_priv *file_priv;
>> +    struct ivpu_user_limits *limits;
>>       u32 ctx_id;
>>       int idx, ret;
>>         if (!drm_dev_enter(dev, &idx))
>>           return -ENODEV;
>>   +    limits = ivpu_user_limits_get(vdev);
>> +    if (IS_ERR(limits)) {
>> +        ret = PTR_ERR(limits);
>> +        goto err_dev_exit;
>> +    }
>> +
>>       file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>>       if (!file_priv) {
>>           ret = -ENOMEM;
>> -        goto err_dev_exit;
>> +        goto err_user_limits_put;
>>       }
>>         INIT_LIST_HEAD(&file_priv->ms_instance_list);
>>         file_priv->vdev = vdev;
>>       file_priv->bound = true;
>> +    file_priv->user_limits = limits;
>>       kref_init(&file_priv->ref);
>>       mutex_init(&file_priv->lock);
>>       mutex_init(&file_priv->ms_lock);
>> @@ -285,6 +361,8 @@ static int ivpu_open(struct drm_device *dev, 
>> struct drm_file *file)
>>       mutex_destroy(&file_priv->ms_lock);
>>       mutex_destroy(&file_priv->lock);
>>       kfree(file_priv);
>> +err_user_limits_put:
>> +    ivpu_user_limits_put(vdev, limits);
>>   err_dev_exit:
>>       drm_dev_exit(idx);
>>       return ret;
>> @@ -344,8 +422,7 @@ static int ivpu_wait_for_ready(struct ivpu_device 
>> *vdev)
>>       ivpu_ipc_consumer_del(vdev, &cons);
>>         if (!ret && ipc_hdr.data_addr != IVPU_IPC_BOOT_MSG_DATA_ADDR) {
>> -        ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n",
>> -             ipc_hdr.data_addr);
>> +        ivpu_err(vdev, "Invalid NPU ready message: 0x%x\n", 
>> ipc_hdr.data_addr);
>>           return -EIO;
>>       }
>>   @@ -454,7 +531,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>>   }
>>     static const struct file_operations ivpu_fops = {
>> -    .owner        = THIS_MODULE,
>> +    .owner = THIS_MODULE,
>>       DRM_ACCEL_FOPS,
>>   #ifdef CONFIG_PROC_FS
>>       .show_fdinfo = drm_show_fdinfo,
>> @@ -593,6 +670,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>       xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
>>       xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
>>       INIT_LIST_HEAD(&vdev->bo_list);
>> +    hash_init(vdev->user_limits);
>>         vdev->db_limit.min = IVPU_MIN_DB;
>>       vdev->db_limit.max = IVPU_MAX_DB;
>> @@ -601,6 +679,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>       if (ret)
>>           goto err_xa_destroy;
>>   +    ret = drmm_mutex_init(&vdev->drm, &vdev->user_limits_lock);
>> +    if (ret)
>> +        goto err_xa_destroy;
>> +
>>       ret = drmm_mutex_init(&vdev->drm, &vdev->submitted_jobs_lock);
>>       if (ret)
>>           goto err_xa_destroy;
>> @@ -718,7 +800,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
>>       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
>>       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_WCL) },
>>       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_NVL) },
>> -    { }
>> +    {}
>>   };
>>   MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
>>   diff --git a/drivers/accel/ivpu/ivpu_drv.h 
>> b/drivers/accel/ivpu/ivpu_drv.h
>> index 78ecddf2831d..0b5aa41151c6 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.h
>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>> @@ -12,6 +12,7 @@
>>   #include <drm/drm_mm.h>
>>   #include <drm/drm_print.h>
>>   +#include <linux/hashtable.h>
>>   #include <linux/pci.h>
>>   #include <linux/xarray.h>
>>   #include <uapi/drm/ivpu_accel.h>
>> @@ -43,7 +44,7 @@
>>   /* SSID 1 is used by the VPU to represent reserved context */
>>   #define IVPU_RESERVED_CONTEXT_MMU_SSID 1
>>   #define IVPU_USER_CONTEXT_MIN_SSID     2
>> -#define IVPU_USER_CONTEXT_MAX_SSID (IVPU_USER_CONTEXT_MIN_SSID + 63)
>> +#define IVPU_USER_CONTEXT_MAX_SSID (IVPU_USER_CONTEXT_MIN_SSID + 128)
>>     #define IVPU_MIN_DB 1
>>   #define IVPU_MAX_DB 255
>> @@ -51,9 +52,6 @@
>>   #define IVPU_JOB_ID_JOB_MASK        GENMASK(7, 0)
>>   #define IVPU_JOB_ID_CONTEXT_MASK    GENMASK(31, 8)
>>   -#define IVPU_NUM_PRIORITIES    4
>> -#define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_PRIORITIES)
>> -
>>   #define IVPU_CMDQ_MIN_ID 1
>>   #define IVPU_CMDQ_MAX_ID 255
>>   @@ -124,6 +122,16 @@ struct ivpu_fw_info;
>>   struct ivpu_ipc_info;
>>   struct ivpu_pm_info;
>>   +struct ivpu_user_limits {
>> +    struct hlist_node hash_node;
>> +    struct ivpu_device *vdev;
>> +    struct kref ref;
>> +    u32 max_ctx_count;
>> +    u32 max_db_count;
>> +    u32 uid;
>> +    atomic_t db_count;
>> +};
>> +
>>   struct ivpu_device {
>>       struct drm_device drm;
>>       void __iomem *regb;
>> @@ -143,6 +151,8 @@ struct ivpu_device {
>>       struct mutex context_list_lock; /* Protects user context 
>> addition/removal */
>>       struct xarray context_xa;
>>       struct xa_limit context_xa_limit;
>> +    DECLARE_HASHTABLE(user_limits, 8);
>> +    struct mutex user_limits_lock; /* Protects user_limits */
>>         struct xarray db_xa;
>>       struct xa_limit db_limit;
>> @@ -190,6 +200,7 @@ struct ivpu_file_priv {
>>       struct list_head ms_instance_list;
>>       struct ivpu_bo *ms_info_bo;
>>       struct xa_limit job_limit;
>> +    struct ivpu_user_limits *user_limits;
>>       u32 job_id_next;
>>       struct xa_limit cmdq_limit;
>>       u32 cmdq_id_next;
>> @@ -287,6 +298,13 @@ static inline u32 ivpu_get_context_count(struct 
>> ivpu_device *vdev)
>>       return (ctx_limit.max - ctx_limit.min + 1);
>>   }
>>   +static inline u32 ivpu_get_doorbell_count(struct ivpu_device *vdev)
>> +{
>> +    struct xa_limit db_limit = vdev->db_limit;
>> +
>> +    return (db_limit.max - db_limit.min + 1);
>> +}
>> +
>>   static inline u32 ivpu_get_platform(struct ivpu_device *vdev)
>>   {
>>       WARN_ON_ONCE(vdev->platform == IVPU_PLATFORM_INVALID);
>> diff --git a/drivers/accel/ivpu/ivpu_job.c 
>> b/drivers/accel/ivpu/ivpu_job.c
>> index 4f8564e2878a..337ed269fd3e 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -173,7 +173,7 @@ static struct ivpu_cmdq *ivpu_cmdq_create(struct 
>> ivpu_file_priv *file_priv, u8 p
>>       ret = xa_alloc_cyclic(&file_priv->cmdq_xa, &cmdq->id, cmdq, 
>> file_priv->cmdq_limit,
>>                     &file_priv->cmdq_id_next, GFP_KERNEL);
>>       if (ret < 0) {
>> -        ivpu_err(vdev, "Failed to allocate command queue ID: %d\n", 
>> ret);
>> +        ivpu_dbg(vdev, IOCTL, "Failed to allocate command queue ID: 
>> %d\n", ret);
>>           goto err_free_cmdq;
>>       }
>>   @@ -215,14 +215,22 @@ static int ivpu_hws_cmdq_init(struct 
>> ivpu_file_priv *file_priv, struct ivpu_cmdq
>>     static int ivpu_register_db(struct ivpu_file_priv *file_priv, 
>> struct ivpu_cmdq *cmdq)
>>   {
>> +    struct ivpu_user_limits *limits = file_priv->user_limits;
>>       struct ivpu_device *vdev = file_priv->vdev;
>>       int ret;
>>   +    if (atomic_inc_return(&limits->db_count) > 
>> limits->max_db_count) {
>> +        ivpu_dbg(vdev, IOCTL, "Maximum number of %u doorbells for 
>> uid %u reached\n",
>> +             limits->max_db_count, limits->uid);
>> +        ret = -EBUSY;
>> +        goto err_dec_db_count;
>> +    }
>> +
>>       ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, 
>> vdev->db_limit, &vdev->db_next,
>>                     GFP_KERNEL);
>>       if (ret < 0) {
>> -        ivpu_err(vdev, "Failed to allocate doorbell ID: %d\n", ret);
>> -        return ret;
>> +        ivpu_dbg(vdev, IOCTL, "Failed to allocate doorbell ID: 
>> %d\n", ret);
>> +        goto err_dec_db_count;
>>       }
>>         if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
>> @@ -231,15 +239,18 @@ static int ivpu_register_db(struct 
>> ivpu_file_priv *file_priv, struct ivpu_cmdq *
>>       else
>>           ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, 
>> cmdq->db_id,
>>                          cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
>> -
>> -    if (!ret) {
>> -        ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d 
>> priority %d\n",
>> -             cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
>> -    } else {
>> +    if (ret) {
>>           xa_erase(&vdev->db_xa, cmdq->db_id);
>>           cmdq->db_id = 0;
>> +        goto err_dec_db_count;
>>       }
>>   +    ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d 
>> priority %d\n",
>> +         cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
>> +    return 0;
>> +
>> +err_dec_db_count:
>> +    atomic_dec(&limits->db_count);
>>       return ret;
>>   }
>>   @@ -298,6 +309,7 @@ static int ivpu_cmdq_unregister(struct 
>> ivpu_file_priv *file_priv, struct ivpu_cm
>>       }
>>         xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
>> +    atomic_dec(&file_priv->user_limits->db_count);
>>       cmdq->db_id = 0;
>>         return 0;
>> @@ -313,6 +325,7 @@ static inline u8 ivpu_job_to_jsm_priority(u8 
>> priority)
>>     static void ivpu_cmdq_destroy(struct ivpu_file_priv *file_priv, 
>> struct ivpu_cmdq *cmdq)
>>   {
>> +    lockdep_assert_held(&file_priv->lock);
>>       ivpu_cmdq_unregister(file_priv, cmdq);
>>       xa_erase(&file_priv->cmdq_xa, cmdq->id);
>>       ivpu_cmdq_free(file_priv, cmdq);
>> @@ -380,8 +393,11 @@ static void ivpu_cmdq_reset(struct 
>> ivpu_file_priv *file_priv)
>>       mutex_lock(&file_priv->lock);
>>         xa_for_each(&file_priv->cmdq_xa, cmdq_id, cmdq) {
>> -        xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
>> -        cmdq->db_id = 0;
>> +        if (cmdq->db_id) {
>> +            xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
>> + atomic_dec(&file_priv->user_limits->db_count);
>> +            cmdq->db_id = 0;
>> +        }
>>       }
>>         mutex_unlock(&file_priv->lock);
