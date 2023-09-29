Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BE7B2C57
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 08:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445D710E0DD;
	Fri, 29 Sep 2023 06:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786AA10E0DD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YRmvpef7DmMkodSjEcPYrSsgGbUckfXqdYAjBgBvKg0=; b=GrOnxWhrhdEF9h3G7MNfVu4deF
 h0Mf/FJK+WMBn5zWlutJ3QD/wsEVLYOpGddZmKJ3PFNQb1ewHzQFegq8xfLQWDBZj5hZagBWtGJNP
 kJShZ07z+trEkxPogoM9dgZnFoLU7FKM279y7SV1s14puCUYgRrsc5/PXjFWIuWUkBhILe77Kmk0M
 5QueIFuIS9eTZvSkJiL1MYtgpRsH7/2yqUbKE6/g9jP0FJwBTf6o1VlvR8I3N7YDc6+ae5vnMo9q+
 coh/8DyPKoYeLbWl4sbbubqlNbbQMwHFevQuctMJtNArxT65uVESjUpzOMrNoBLzGFtY7BpXZdW2R
 q9MQO4ng==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qm73z-009Xjn-OW
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 08:33:23 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1qm73z-007UdH-IV; Fri, 29 Sep 2023 08:33:23 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.96)
 (envelope-from <itoral@igalia.com>) id 1qm73z-004N1A-1C;
 Fri, 29 Sep 2023 08:33:23 +0200
MIME-Version: 1.0
Date: Fri, 29 Sep 2023 06:33:23 +0000
From: itoral <itoral@igalia.com>
To: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 1/3] drm/v3d: fix up register addresses for V3D 7.x
In-Reply-To: <affd7773-07cb-9a41-1a56-1413cc8a88a7@igalia.com>
References: <20230928114532.167854-1-itoral@igalia.com>
 <20230928114532.167854-2-itoral@igalia.com>
 <affd7773-07cb-9a41-1a56-1413cc8a88a7@igalia.com>
Message-ID: <803c8bfddc49402bdef9048d8ead0420@igalia.com>
X-Sender: itoral@igalia.com
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-28 15:03, Maira Canal wrote:
> Hi Iago,
> 
> On 9/28/23 08:45, Iago Toral Quiroga wrote:
> 
> Please, add a commit message and your s-o-b to the patch. Here is a reference on how to format your patches [1].
> 
> Also, please, run checkpatch on this patch and address the warnings.
> 
> [1] https://docs.kernel.org/process/submitting-patches.html
> 
>> ---
>>   drivers/gpu/drm/v3d/v3d_debugfs.c | 173 +++++++++++++++++-------------
>>   drivers/gpu/drm/v3d/v3d_gem.c     |   3 +
>>   drivers/gpu/drm/v3d/v3d_irq.c     |  47 ++++----
>>   drivers/gpu/drm/v3d/v3d_regs.h    |  51 ++++++++-
>>   drivers/gpu/drm/v3d/v3d_sched.c   |  41 ++++---
>>   5 files changed, 200 insertions(+), 115 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> index 330669f51fa7..90b2b5b2710c 100644
>> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
>> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
>> @@ -12,69 +12,83 @@
>>   #include "v3d_drv.h"
>>   #include "v3d_regs.h"
>>   
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/v3d/v3d_regs.h b/drivers/gpu/drm/v3d/v3d_regs.h
>> index 3663e0d6bf76..9fbcbfedaae1 100644
>> --- a/drivers/gpu/drm/v3d/v3d_regs.h
>> +++ b/drivers/gpu/drm/v3d/v3d_regs.h
>> @@ -57,6 +57,7 @@
>>   #define V3D_HUB_INT_MSK_STS                            0x0005c
>>   #define V3D_HUB_INT_MSK_SET                            0x00060
>>   #define V3D_HUB_INT_MSK_CLR                            0x00064
>> +# define V3D_V7_HUB_INT_GMPV                           BIT(6)
>>   # define V3D_HUB_INT_MMU_WRV                           BIT(5)
>>   # define V3D_HUB_INT_MMU_PTI                           BIT(4)
>>   # define V3D_HUB_INT_MMU_CAP                           BIT(3)
>> @@ -64,6 +65,7 @@
>>   # define V3D_HUB_INT_TFUC                              BIT(1)
>>   # define V3D_HUB_INT_TFUF                              BIT(0)
>>   +/* GCA registers only exist in V3D < 41 */
>>   #define V3D_GCA_CACHE_CTRL                             0x0000c
>>   # define V3D_GCA_CACHE_CTRL_FLUSH                      BIT(0)
>>   @@ -87,6 +89,7 @@
>>   # define V3D_TOP_GR_BRIDGE_SW_INIT_1_V3D_CLK_108_SW_INIT BIT(0)
>>     #define V3D_TFU_CS                                     0x00400
>> +#define V3D_V7_TFU_CS                                  0x00700
> 
> What do you think about something like
> 
> #define V3D_TFU_CS(ver)	(ver >= 71) ? 0x00700 : 0x00400
> 
> I believe that the code would get much cleaner and would avoid a bunch
> of the if statements that you used.
> 
> I would apply this format to all the new registers.

Sure, that sounds good. Thanks!

Iago

> Best Regards,
> - Maíra
> 
>>   /* Stops current job, empties input fifo. */
>>   # define V3D_TFU_CS_TFURST                             BIT(31)
>>   # define V3D_TFU_CS_CVTCT_MASK                         V3D_MASK(23, 16)
>> @@ -96,6 +99,7 @@
>>   # define V3D_TFU_CS_BUSY                               BIT(0)
>>     #define V3D_TFU_SU                                     0x00404
>> +#define V3D_V7_TFU_SU                                  0x00704
>>   /* Interrupt when FINTTHR input slots are free (0 = disabled) */
>>   # define V3D_TFU_SU_FINTTHR_MASK                       V3D_MASK(13, 8)
>>   # define V3D_TFU_SU_FINTTHR_SHIFT                      8
>> @@ -107,38 +111,53 @@
>>   # define V3D_TFU_SU_THROTTLE_SHIFT                     0
>>     #define V3D_TFU_ICFG                                   0x00408
>> +#define V3D_V7_TFU_ICFG                                0x00708
>>   /* Interrupt when the conversion is complete. */
>>   # define V3D_TFU_ICFG_IOC                              BIT(0)
>>     /* Input Image Address */
>>   #define V3D_TFU_IIA                                    0x0040c
>> +#define V3D_V7_TFU_IIA                                 0x0070c
>>   /* Input Chroma Address */
>>   #define V3D_TFU_ICA                                    0x00410
>> +#define V3D_V7_TFU_ICA                                 0x00710
>>   /* Input Image Stride */
>>   #define V3D_TFU_IIS                                    0x00414
>> +#define V3D_V7_TFU_IIS                                 0x00714
>>   /* Input Image U-Plane Address */
>>   #define V3D_TFU_IUA                                    0x00418
>> +#define V3D_V7_TFU_IUA                                 0x00718
>> +/* Image output config (VD 7.x only) */
>> +#define V3D_V7_TFU_IOC                                 0x0071c
>>   /* Output Image Address */
>>   #define V3D_TFU_IOA                                    0x0041c
>> +#define V3D_V7_TFU_IOA                                 0x00720
>>   /* Image Output Size */
>>   #define V3D_TFU_IOS                                    0x00420
>> +#define V3D_V7_TFU_IOS                                 0x00724
>>   /* TFU YUV Coefficient 0 */
>>   #define V3D_TFU_COEF0                                  0x00424
>> -/* Use these regs instead of the defaults. */
>> +#define V3D_V7_TFU_COEF0                               0x00728
>> +/* Use these regs instead of the defaults (V3D 4.x only) */
>>   # define V3D_TFU_COEF0_USECOEF                         BIT(31)
>>   /* TFU YUV Coefficient 1 */
>>   #define V3D_TFU_COEF1                                  0x00428
>> +#define V3D_V7_TFU_COEF1                               0x0072c
>>   /* TFU YUV Coefficient 2 */
>>   #define V3D_TFU_COEF2                                  0x0042c
>> +#define V3D_V7_TFU_COEF2                               0x00730
>>   /* TFU YUV Coefficient 3 */
>>   #define V3D_TFU_COEF3                                  0x00430
>> +#define V3D_V7_TFU_COEF3                               0x00734
>>   +/* V3D 4.x only */
>>   #define V3D_TFU_CRC                                    0x00434
>>     /* Per-MMU registers. */
>>     #define V3D_MMUC_CONTROL                               0x01000
>>   # define V3D_MMUC_CONTROL_CLEAR                        BIT(3)
>> +# define V3D_V7_MMUC_CONTROL_CLEAR                     BIT(11)
>>   # define V3D_MMUC_CONTROL_FLUSHING                     BIT(2)
>>   # define V3D_MMUC_CONTROL_FLUSH                        BIT(1)
>>   # define V3D_MMUC_CONTROL_ENABLE                       BIT(0)
>> @@ -246,7 +265,6 @@
>>     #define V3D_CTL_L2TCACTL                               0x00030
>>   # define V3D_L2TCACTL_TMUWCF                           BIT(8)
>> -# define V3D_L2TCACTL_L2T_NO_WM                        BIT(4)
>>   /* Invalidates cache lines. */
>>   # define V3D_L2TCACTL_FLM_FLUSH                        0
>>   /* Removes cachelines without writing dirty lines back. */
>> @@ -268,7 +286,9 @@
>>   # define V3D_INT_QPU_MASK                              V3D_MASK(27, 16)
>>   # define V3D_INT_QPU_SHIFT                             16
>>   # define V3D_INT_CSDDONE                               BIT(7)
>> +# define V3D_V7_INT_CSDDONE                            BIT(6)
>>   # define V3D_INT_PCTR                                  BIT(6)
>> +# define V3D_V7_INT_PCTR                               BIT(5)
>>   # define V3D_INT_GMPV                                  BIT(5)
>>   # define V3D_INT_TRFB                                  BIT(4)
>>   # define V3D_INT_SPILLUSE                              BIT(3)
>> @@ -350,14 +370,19 @@
>>   #define V3D_V4_PCTR_0_SRC_X(x)                         (V3D_V4_PCTR_0_SRC_0_3 + \
>>   							4 * (x))
>>   # define V3D_PCTR_S0_MASK                              V3D_MASK(6, 0)
>> +# define V3D_V7_PCTR_S0_MASK                           V3D_MASK(7, 0)
>>   # define V3D_PCTR_S0_SHIFT                             0
>>   # define V3D_PCTR_S1_MASK                              V3D_MASK(14, 8)
>> +# define V3D_V7_PCTR_S1_MASK                           V3D_MASK(15, 8)
>>   # define V3D_PCTR_S1_SHIFT                             8
>>   # define V3D_PCTR_S2_MASK                              V3D_MASK(22, 16)
>> +# define V3D_V7_PCTR_S2_MASK                           V3D_MASK(23, 16)
>>   # define V3D_PCTR_S2_SHIFT                             16
>>   # define V3D_PCTR_S3_MASK                              V3D_MASK(30, 24)
>> +# define V3D_V7_PCTR_S3_MASK                           V3D_MASK(31, 24)
>>   # define V3D_PCTR_S3_SHIFT                             24
>>   # define V3D_PCTR_CYCLE_COUNT                          32
>> +# define V3D_V7_PCTR_CYCLE_COUNT                       0
>>     /* Output values of the counters. */
>>   #define V3D_PCTR_0_PCTR0                               0x00680
>> @@ -365,6 +390,7 @@
>>   #define V3D_PCTR_0_PCTRX(x)                            (V3D_PCTR_0_PCTR0 + \
>>   							4 * (x))
>>   #define V3D_GMP_STATUS                                 0x00800
>> +#define V3D_V7_GMP_STATUS                              0x00600
>>   # define V3D_GMP_STATUS_GMPRST                         BIT(31)
>>   # define V3D_GMP_STATUS_WR_COUNT_MASK                  V3D_MASK(30, 24)
>>   # define V3D_GMP_STATUS_WR_COUNT_SHIFT                 24
>> @@ -378,12 +404,14 @@
>>   # define V3D_GMP_STATUS_VIO                            BIT(0)
>>     #define V3D_GMP_CFG                                    0x00804
>> +#define V3D_V7_GMP_CFG                                 0x00604
>>   # define V3D_GMP_CFG_LBURSTEN                          BIT(3)
>>   # define V3D_GMP_CFG_PGCRSEN                           BIT()
>>   # define V3D_GMP_CFG_STOP_REQ                          BIT(1)
>>   # define V3D_GMP_CFG_PROT_ENABLE                       BIT(0)
>>     #define V3D_GMP_VIO_ADDR                               0x00808
>> +#define V3D_V7_GMP_VIO_ADDR                            0x00608
>>   #define V3D_GMP_VIO_TYPE                               0x0080c
>>   #define V3D_GMP_TABLE_ADDR                             0x00810
>>   #define V3D_GMP_CLEAR_LOAD                             0x00814
>> @@ -399,24 +427,28 @@
>>   # define V3D_CSD_STATUS_HAVE_QUEUED_DISPATCH           BIT(0)
>>     #define V3D_CSD_QUEUED_CFG0                            0x00904
>> +#define V3D_V7_CSD_QUEUED_CFG0                         0x00930
>>   # define V3D_CSD_QUEUED_CFG0_NUM_WGS_X_MASK            V3D_MASK(31, 16)
>>   # define V3D_CSD_QUEUED_CFG0_NUM_WGS_X_SHIFT           16
>>   # define V3D_CSD_QUEUED_CFG0_WG_X_OFFSET_MASK          V3D_MASK(15, 0)
>>   # define V3D_CSD_QUEUED_CFG0_WG_X_OFFSET_SHIFT         0
>>     #define V3D_CSD_QUEUED_CFG1                            0x00908
>> +#define V3D_V7_CSD_QUEUED_CFG1                         0x00934
>>   # define V3D_CSD_QUEUED_CFG1_NUM_WGS_Y_MASK            V3D_MASK(31, 16)
>>   # define V3D_CSD_QUEUED_CFG1_NUM_WGS_Y_SHIFT           16
>>   # define V3D_CSD_QUEUED_CFG1_WG_Y_OFFSET_MASK          V3D_MASK(15, 0)
>>   # define V3D_CSD_QUEUED_CFG1_WG_Y_OFFSET_SHIFT         0
>>     #define V3D_CSD_QUEUED_CFG2                            0x0090c
>> +#define V3D_V7_CSD_QUEUED_CFG2                         0x00938
>>   # define V3D_CSD_QUEUED_CFG2_NUM_WGS_Z_MASK            V3D_MASK(31, 16)
>>   # define V3D_CSD_QUEUED_CFG2_NUM_WGS_Z_SHIFT           16
>>   # define V3D_CSD_QUEUED_CFG2_WG_Z_OFFSET_MASK          V3D_MASK(15, 0)
>>   # define V3D_CSD_QUEUED_CFG2_WG_Z_OFFSET_SHIFT         0
>>     #define V3D_CSD_QUEUED_CFG3                            0x00910
>> +#define V3D_V7_CSD_QUEUED_CFG3                         0x0093c
>>   # define V3D_CSD_QUEUED_CFG3_OVERLAP_WITH_PREV         BIT(26)
>>   # define V3D_CSD_QUEUED_CFG3_MAX_SG_ID_MASK            V3D_MASK(25, 20)
>>   # define V3D_CSD_QUEUED_CFG3_MAX_SG_ID_SHIFT           20
>> @@ -429,22 +461,36 @@
>>     /* Number of batches, minus 1 */
>>   #define V3D_CSD_QUEUED_CFG4                            0x00914
>> +#define V3D_V7_CSD_QUEUED_CFG4                         0x00940
>>     /* Shader address, pnan, singleseg, threading, like a shader record. */
>>   #define V3D_CSD_QUEUED_CFG5                            0x00918
>> +#define V3D_V7_CSD_QUEUED_CFG5                         0x00944
>>     /* Uniforms address (4 byte aligned) */
>>   #define V3D_CSD_QUEUED_CFG6                            0x0091c
>> +#define V3D_V7_CSD_QUEUED_CFG6                         0x00948
>> +
>> +#define V3D_V7_CSD_QUEUED_CFG7                         0x0094c
>>     #define V3D_CSD_CURRENT_CFG0                          0x00920
>> +#define V3D_V7_CSD_CURRENT_CFG0                       0x00958
>>   #define V3D_CSD_CURRENT_CFG1                          0x00924
>> +#define V3D_V7_CSD_CURRENT_CFG1                       0x0095c
>>   #define V3D_CSD_CURRENT_CFG2                          0x00928
>> +#define V3D_V7_CSD_CURRENT_CFG2                       0x00960
>>   #define V3D_CSD_CURRENT_CFG3                          0x0092c
>> +#define V3D_V7_CSD_CURRENT_CFG3                       0x00964
>>   #define V3D_CSD_CURRENT_CFG4                          0x00930
>> +#define V3D_V7_CSD_CURRENT_CFG4                       0x00968
>>   #define V3D_CSD_CURRENT_CFG5                          0x00934
>> +#define V3D_V7_CSD_CURRENT_CFG5                       0x0096c
>>   #define V3D_CSD_CURRENT_CFG6                          0x00938
>> +#define V3D_V7_CSD_CURRENT_CFG6                       0x00970
>> +#define V3D_V7_CSD_CURRENT_CFG7                       0x00974
>>     #define V3D_CSD_CURRENT_ID0                            0x0093c
>> +#define V3D_V7_CSD_CURRENT_ID0                         0x00978
>>   # define V3D_CSD_CURRENT_ID0_WG_X_MASK                 V3D_MASK(31, 16)
>>   # define V3D_CSD_CURRENT_ID0_WG_X_SHIFT                16
>>   # define V3D_CSD_CURRENT_ID0_WG_IN_SG_MASK             V3D_MASK(11, 8)
>> @@ -453,6 +499,7 @@
>>   # define V3D_CSD_CURRENT_ID0_L_IDX_SHIFT               0
>>     #define V3D_CSD_CURRENT_ID1                            0x00940
>> +#define V3D_V7_CSD_CURRENT_ID1                         0x0097c
>>   # define V3D_CSD_CURRENT_ID0_WG_Z_MASK                 V3D_MASK(31, 16)
>>   # define V3D_CSD_CURRENT_ID0_WG_Z_SHIFT                16
>>   # define V3D_CSD_CURRENT_ID0_WG_Y_MASK                 V3D_MASK(15, 0)
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
>> index 06238e6d7f5c..efc522e66ebd 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -171,6 +171,8 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
>>   	return fence;
>>   }
>>   +#define V3D_TFU_REG(name) ((v3d->ver < 71) ? V3D_TFU_ ## name : V3D_V7_TFU_ ## name)
>> +
>>   static struct dma_fence *
>>   v3d_tfu_job_run(struct drm_sched_job *sched_job)
>>   {
>> @@ -190,20 +192,22 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
>>     	trace_v3d_submit_tfu(dev, to_v3d_fence(fence)->seqno);
>>   -	V3D_WRITE(V3D_TFU_IIA, job->args.iia);
>> -	V3D_WRITE(V3D_TFU_IIS, job->args.iis);
>> -	V3D_WRITE(V3D_TFU_ICA, job->args.ica);
>> -	V3D_WRITE(V3D_TFU_IUA, job->args.iua);
>> -	V3D_WRITE(V3D_TFU_IOA, job->args.ioa);
>> -	V3D_WRITE(V3D_TFU_IOS, job->args.ios);
>> -	V3D_WRITE(V3D_TFU_COEF0, job->args.coef[0]);
>> -	if (job->args.coef[0] & V3D_TFU_COEF0_USECOEF) {
>> -		V3D_WRITE(V3D_TFU_COEF1, job->args.coef[1]);
>> -		V3D_WRITE(V3D_TFU_COEF2, job->args.coef[2]);
>> -		V3D_WRITE(V3D_TFU_COEF3, job->args.coef[3]);
>> +	V3D_WRITE(V3D_TFU_REG(IIA), job->args.iia);
>> +	V3D_WRITE(V3D_TFU_REG(IIS), job->args.iis);
>> +	V3D_WRITE(V3D_TFU_REG(ICA), job->args.ica);
>> +	V3D_WRITE(V3D_TFU_REG(IUA), job->args.iua);
>> +	V3D_WRITE(V3D_TFU_REG(IOA), job->args.ioa);
>> +	if (v3d->ver >= 71)
>> +		V3D_WRITE(V3D_V7_TFU_IOC, job->args.v71.ioc);
>> +	V3D_WRITE(V3D_TFU_REG(IOS), job->args.ios);
>> +	V3D_WRITE(V3D_TFU_REG(COEF0), job->args.coef[0]);
>> +	if (v3d->ver >= 71 || (job->args.coef[0] & V3D_TFU_COEF0_USECOEF)) {
>> +		V3D_WRITE(V3D_TFU_REG(COEF1), job->args.coef[1]);
>> +		V3D_WRITE(V3D_TFU_REG(COEF2), job->args.coef[2]);
>> +		V3D_WRITE(V3D_TFU_REG(COEF3), job->args.coef[3]);
>>   	}
>>   	/* ICFG kicks off the job. */
>> -	V3D_WRITE(V3D_TFU_ICFG, job->args.icfg | V3D_TFU_ICFG_IOC);
>> +	V3D_WRITE(V3D_TFU_REG(ICFG), job->args.icfg | V3D_TFU_ICFG_IOC);
>>     	return fence;
>>   }
>> @@ -215,7 +219,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>>   	struct v3d_dev *v3d = job->base.v3d;
>>   	struct drm_device *dev = &v3d->drm;
>>   	struct dma_fence *fence;
>> -	int i;
>> +	int i, csd_cfg0_reg, csd_cfg_reg_count;
>>     	v3d->csd_job = job;
>>   @@ -233,10 +237,12 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>>     	v3d_switch_perfmon(v3d, &job->base);
>>   -	for (i = 1; i <= 6; i++)
>> -		V3D_CORE_WRITE(0, V3D_CSD_QUEUED_CFG0 + 4 * i, job->args.cfg[i]);
>> +	csd_cfg0_reg = v3d->ver < 71 ? V3D_CSD_QUEUED_CFG0 : V3D_V7_CSD_QUEUED_CFG0;
>> +	csd_cfg_reg_count = v3d->ver < 71 ? 6 : 7;
>> +	for (i = 1; i <= csd_cfg_reg_count; i++)
>> +		V3D_CORE_WRITE(0, csd_cfg0_reg + 4 * i, job->args.cfg[i]);
>>   	/* CFG0 write kicks off the job. */
>> -	V3D_CORE_WRITE(0, V3D_CSD_QUEUED_CFG0, job->args.cfg[0]);
>> +	V3D_CORE_WRITE(0, csd_cfg0_reg, job->args.cfg[0]);
>>     	return fence;
>>   }
>> @@ -336,7 +342,8 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>>   {
>>   	struct v3d_csd_job *job = to_csd_job(sched_job);
>>   	struct v3d_dev *v3d = job->base.v3d;
>> -	u32 batches = V3D_CORE_READ(0, V3D_CSD_CURRENT_CFG4);
>> +	u32 batches = V3D_CORE_READ(0, (v3d->ver < 71 ? V3D_CSD_CURRENT_CFG4 :
>> +							V3D_V7_CSD_CURRENT_CFG4));
>>     	/* If we've made progress, skip reset and let the timer get
>>   	 * rearmed.
