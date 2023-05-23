Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40670E9B3
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 01:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D53710E556;
	Tue, 23 May 2023 23:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FB910E555;
 Tue, 23 May 2023 23:37:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NNVEOv028842; Tue, 23 May 2023 23:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2DN6xp4uHKFw4MZHpRYw6c+iINNYBc+2no8SX3qmvQI=;
 b=ma5b/lsO6W5GXX+/YTEaOxk7jbvN989Z1QXU/W4RWCloapTYHbRkPTxGZjLS6oRC55Ym
 lqwXhRqFJC2bo/JNaqQuqHkB6eYzzDpQXNIw9uAgmj091S6C3vYsP5v+/oxz+lloZ1B8
 qQ4fZ6wkIHFUmRor9Y/PrfcU+tEjfddDOdVRYiB+slpAdRz2eDnYLXyk1MnI6HGeJkxk
 zQLJCdNg4aDK+Vkp54ihnBR8oZE7EiNw5Jf1DrH+yfN+r/ipdZz/PF5iZT82SnlQ00wR
 Tlom1cnA2ncWmqS1Rksb0iEryYvyGfZTlUEWyl5lPv8sxWoZYZYRH0YHeMZW9rMed16b Nw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qrsx0t5py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 23:37:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NNbU4X018363
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 23:37:30 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 16:37:29 -0700
Message-ID: <8268a40f-7605-207f-3a6c-8965a8a49b60@quicinc.com>
Date: Tue, 23 May 2023 16:37:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: switch dpu_encoder to use
 drm_debugfs_add_file()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
 <20230521192230.9747-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230521192230.9747-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9YP3dx-lrz3cfN2lOUPRNYff-FXb0x1S
X-Proofpoint-GUID: 9YP3dx-lrz3cfN2lOUPRNYff-FXb0x1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_15,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230190
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/21/2023 12:22 PM, Dmitry Baryshkov wrote:
> Use drm_debugfs_add_file() for encoder's status file. This changes the
> name of the status file from encoder%d/status to just encoder%d.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This patch depends on 
https://patchwork.freedesktop.org/patch/538294/?series=118079&rev=1 right?

What is wrong with having a per encoder directory and reading from 
there? It gives room for expanding this to dump more encoder specific 
information.

At the moment it looks light because we have only status but better to 
have a directory per encoder right?

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
>   1 file changed, 11 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index af34932729db..0ac68f44ec74 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -14,6 +14,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_crtc.h>
> +#include <drm/drm_debugfs.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -142,7 +143,6 @@ enum dpu_enc_rc_states {
>    * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
>    *				all CTL paths
>    * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
> - * @debugfs_root:		Debug file system root file node
>    * @enc_lock:			Lock around physical encoder
>    *				create/destroy/enable/disable
>    * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
> @@ -186,7 +186,6 @@ struct dpu_encoder_virt {
>   	struct drm_crtc *crtc;
>   	struct drm_connector *connector;
>   
> -	struct dentry *debugfs_root;
>   	struct mutex enc_lock;
>   	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
>   	void (*crtc_frame_event_cb)(void *, u32 event);
> @@ -2091,7 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   #ifdef CONFIG_DEBUG_FS
>   static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>   {
> -	struct dpu_encoder_virt *dpu_enc = s->private;
> +	struct drm_debugfs_entry *entry = s->private;
> +	struct dpu_encoder_virt *dpu_enc = entry->file.data;
>   	int i;
>   
>   	mutex_lock(&dpu_enc->enc_lock);
> @@ -2110,48 +2110,31 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>   	return 0;
>   }
>   
> -DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
> -
> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	char name[12];
> +	char *name;
>   
>   	if (!drm_enc->dev) {
>   		DPU_ERROR("invalid encoder or kms\n");
> -		return -EINVAL;
> +		return;
>   	}
>   
> -	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
> +	name = devm_kasprintf(drm_enc->dev->dev, GFP_KERNEL, "encoder%u", drm_enc->base.id);
>   
> -	/* create overall sub-directory for the encoder */
> -	dpu_enc->debugfs_root = debugfs_create_dir(name,
> -			drm_enc->dev->primary->debugfs_root);
> -
> -	/* don't error check these */
> -	debugfs_create_file("status", 0600,
> -		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> -
> -	return 0;
> +	drm_debugfs_add_file(drm_enc->dev, name, _dpu_encoder_status_show, dpu_enc);
>   }
>   #else
> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>   {
> -	return 0;
>   }
>   #endif
>   
>   static int dpu_encoder_late_register(struct drm_encoder *encoder)
>   {
> -	return _dpu_encoder_init_debugfs(encoder);
> -}
> -
> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> +	_dpu_encoder_init_debugfs(encoder);
>   
> -	debugfs_remove_recursive(dpu_enc->debugfs_root);
> +	return 0;
>   }
>   
>   static int dpu_encoder_virt_add_phys_encs(
> @@ -2380,7 +2363,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>   static const struct drm_encoder_funcs dpu_encoder_funcs = {
>   		.destroy = dpu_encoder_destroy,
>   		.late_register = dpu_encoder_late_register,
> -		.early_unregister = dpu_encoder_early_unregister,
>   };
>   
>   int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
