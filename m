Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMU3Es3SnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:21:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24017E36A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD21410E31B;
	Mon, 23 Feb 2026 22:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQ0YBPrm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOqhcq1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FBB10E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:20:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NI4IQn1298512
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3T4PeH87tzer/BxO3NLS+Z5b
 dStUULU/A8xhL/S5OgM=; b=RQ0YBPrml89hdSmkuGU61ND+Zy4XWqOk0uNe+rgn
 VMA+sel3eLgiankD/ScPOZJecycfE4yhtDcj5MiNI5E7XpkonU4BAlKyiLrVjoCN
 xFNDdP46uZ9rXosaJrJjuoh30rknH9j+ArXXIVKW2LgrUStVxiFf+1mUIrEzXGyA
 sDotFZ477vuagQ+Phq+wb44X9HKID2BygdVZgApjk0l0KPfFLbXeEFmbVMRxXJ7K
 PQhrbfF7qK9TPEYQHn+xxti9f5yli/huUq/6rAq6+Njro0N7Q18cD92HCiQacn+m
 tqSOl2lGrj+d/kkg8f/4AJYTnLvwRPUZ/KWm8wG70ZS48A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y22p0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:20:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70ed6c849so4254903185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771885254; x=1772490054;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3T4PeH87tzer/BxO3NLS+Z5bdStUULU/A8xhL/S5OgM=;
 b=TOqhcq1ef5vqSaHuxG1kaR5kO/seOS72uHVFTbYR06MQQJ1Ccr2MHeMBoJXhVAc8jh
 WWeUgrq/EsBe6G8+CT9+ZeyHsbW14bPXWZsjISlrvLnh3e8vQz2Czc6yzRIUrjbFG2k4
 ObC5cOl3NXk8BBQZLNVwPAisQ5eNFbAjmlcdU4EQ1h4o9gnK+pZ8lTjGbyuvuIaGwQBO
 GFiHgHCVrmp7D1OzPaXTIjsv4hGfh/1zdAZe4s5vp1PTGPxF6kIo73f4LXT1fbHEibxO
 pqrn2tvdvLkR9o+cT1ZlZ8j87xRxC0oybgBbATOu06I7QahV7yBt7R1Hi9jCaJTF4suC
 fvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771885254; x=1772490054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3T4PeH87tzer/BxO3NLS+Z5bdStUULU/A8xhL/S5OgM=;
 b=Bz8ChLK2OFS/jqWAyvWy11+/GkumjWjC5pEOeWXy6hpkUvGG2QDKpWxRlThpGV3Z2N
 DDxvBW6jQa9G8UrtSEBHFw1rZlDuYzcpZBNCYy7rsVaMnJQN81cfI3tm7JEea94qmdQu
 oJj/Lf+yXqvuV0oQQGj5S+EHHhur0cJfMHs0YB5S7rv9iA+mwtbN+KM58hJx4eCXmPDT
 C/LItrpI/On3UH5MSOWx8Ht/BCcnuxOPX7nZHnDo3LutjPfn/6zVCKR3twCC1MX2Cxbq
 /RVITJg3hHpwLgSvuXbD3rENfMdefPPcMT/UXfMmb07r2JLH3Xh3/fsSvAVAGBEi3Ia4
 Uu2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHtoC8hdRW2gTM5JrSWfz7JOweXcmwooW0d63bx1JaWzd5x5C0WqHA9TvimqpRv/E/L/18xyVf0NE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2I0LlQYfz++VZV5fxh62ydqAl7OomUZ3FkdEJoxs5KkmLeceu
 mpRKYux7NMIXEDn856qAJj3G7G2xnHbaUrTilTLWUAi0PlgGASdr7BrKdZ4pH0niWJNX+NPn5Dq
 4lIXiRra6uffO2z4xo1uMvDVGZgstqhvNfxlviECCbGDH+RYof0jNALd4ZewFehvgX5Ll7XY=
X-Gm-Gg: AZuq6aLTRxseHSaUf+nIhFNMqwYR18SAgFP8sORyepmIh2Sc4autlVi0WOI6/uwnnR+
 rMfn3N3pbRvjMf42IlWfztCJIL5ttIJApeJYfRwCHHwk6KVTEHuegOkL8Rby9eaZaZ/T1SPVYls
 Gl7U4m0zlbsB2cgnytfmABvw0Krsta3Fydv9yNYACU3cHRHWbKaHwPlrvcW1zE0pd3paHNsysgA
 WRJiOO4CTnfAobw6tpKZw4p6DkTepVE9pg34RJWa8EqZ497iTsSvkQcUqmH53brYZWLMTnZQO5c
 ykJJ/OdhwlZK+bGIkqbZslDxk02/EfGvYozEIzPhU+dN/+ZpIXSQo9i10sAHnqf6LwPHC+5G+21
 EZ9g0HrvCrFJ+6geKa0Mzli53+0hv7UIQhN2mzLDG0hFEmjXu01uxpEgvjgl6JI0MfMcRS7O5vv
 GAMAxxncv1/HgvxiA05awZ5nMk4e1dlknBdjU=
X-Received: by 2002:a05:620a:7112:b0:8be:e0c4:26ca with SMTP id
 af79cd13be357-8cb8ca76d0amr1295285485a.61.1771885253917; 
 Mon, 23 Feb 2026 14:20:53 -0800 (PST)
X-Received: by 2002:a05:620a:7112:b0:8be:e0c4:26ca with SMTP id
 af79cd13be357-8cb8ca76d0amr1295279485a.61.1771885253294; 
 Mon, 23 Feb 2026 14:20:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb45938sm1797527e87.69.2026.02.23.14.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 14:20:52 -0800 (PST)
Date: Tue, 24 Feb 2026 00:20:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 08/18] accel/qda: Add per-file DRM context and
 open/close handling
Message-ID: <rnhqwqtd66fmvmyobhrodzoa7x2etzjjh7xhqrn5hkmibms5cd@ucggzznrx7j6>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5NCBTYWx0ZWRfX5QigExT6Z39M
 OLkQmIFetP1IwGDEHfMHkvGxUc9pyRHHLM2T+VibqROwVJGE923dfLBTBVexajgV2Kh7MzywTk4
 8I3Obirub7Js1rHcrrgeN6dGUuyTs8xWuiUStM7lkJ726g/LC699ePtqQfMWimL7NRMt2ujtE4M
 mfAMV5j3jtecda3h+Ri8ezf+qjyELL8WwQvhsRbbtdq9PzrBFESGzdDMG0TUzbm3r+Fqiy41ehS
 baJ1j7W9XLo0ZvK5yZGaQSV2EEQ2e/Bkmmg1J9J3X2e7F6hb2mjcqbLcKRLxZilZ4p75wVhKv89
 hxrKbSgX1wXAxfJNZWQkPki6aBZ3Azk5clVd4Q8BOv8e7mBw1gMY7x/kMX3UpbfY7XbBu7R9u0v
 tNQ086G/xIAr6ew02d1pz11sUlvUikDGOXy2RWiqkVe/O2h3p+o/NfgDebW5RhV/g7VdtRko3Qh
 dIOjytcc9xayLFnnzcQ==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699cd2c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=i04C7yyKdwGZ-rgJMjYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 61AlNF3MclK_2oNnTee6vaGZxjLQsOSw
X-Proofpoint-ORIG-GUID: 61AlNF3MclK_2oNnTee6vaGZxjLQsOSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230194
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AB24017E36A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:39:02AM +0530, Ekansh Gupta wrote:
> Introduce per-file and per-user context for the QDA DRM accelerator
> driver. A new qda_file_priv structure is stored in file->driver_priv
> for each open file descriptor, and a qda_user object is allocated per
> client with a unique client_id generated from an atomic counter in
> qda_dev.
> 
> The DRM driver now provides qda_open() and qda_postclose() callbacks.
> qda_open() resolves the qda_dev from the drm_device, allocates the
> qda_file_priv and qda_user structures, and attaches them to the DRM
> file. qda_postclose() tears down the per-file context and frees the
> qda_user object when the file is closed.
> 
> This prepares the QDA driver to track per-process state for future
> features such as per-client memory mappings, job submission contexts,
> and access control over DSP compute resources.

Start by describing the problem instead of stuffing it to the end. Can
we use something better suited for this task, like IDR?

> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c | 117 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_drv.h |  30 ++++++++++++
>  2 files changed, 147 insertions(+)
> 
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index a9113ec78fa2..bf95fc782cf8 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -12,11 +12,127 @@
>  #include "qda_drv.h"
>  #include "qda_rpmsg.h"
>  
> +static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
> +{
> +	if (!dev)
> +		return NULL;
> +
> +	return (struct qda_drm_priv *)dev->dev_private;
> +}
> +
> +static struct qda_dev *get_qdev_from_drm_device(struct drm_device *dev)
> +{
> +	struct qda_drm_priv *drm_priv;
> +
> +	if (!dev) {
> +		qda_dbg(NULL, "Invalid drm_device\n");
> +		return NULL;
> +	}
> +
> +	drm_priv = get_drm_priv_from_device(dev);
> +	if (!drm_priv) {
> +		qda_dbg(NULL, "No drm_priv in dev_private\n");
> +		return NULL;
> +	}
> +
> +	return drm_priv->qdev;
> +}
> +
> +static struct qda_user *alloc_qda_user(struct qda_dev *qdev)
> +{
> +	struct qda_user *qda_user;
> +
> +	qda_user = kzalloc_obj(*qda_user, GFP_KERNEL);
> +	if (!qda_user)
> +		return NULL;
> +
> +	qda_user->client_id = atomic_inc_return(&qdev->client_id_counter);
> +	qda_user->qda_dev = qdev;
> +
> +	qda_dbg(qdev, "Allocated qda_user with client_id=%u\n", qda_user->client_id);
> +	return qda_user;
> +}
> +
> +static void free_qda_user(struct qda_user *qda_user)
> +{
> +	if (!qda_user)
> +		return;
> +
> +	qda_dbg(qda_user->qda_dev, "Freeing qda_user client_id=%u\n", qda_user->client_id);
> +
> +	kfree(qda_user);
> +}
> +
> +static int qda_open(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct qda_user *qda_user;
> +	struct qda_file_priv *qda_file_priv;
> +	struct qda_dev *qdev;
> +
> +	if (!file) {
> +		qda_dbg(NULL, "Invalid file pointer\n");
> +		return -EINVAL;
> +	}
> +
> +	qdev = get_qdev_from_drm_device(dev);
> +	if (!qdev) {
> +		qda_dbg(NULL, "Failed to get qdev from drm_device\n");
> +		return -EINVAL;
> +	}
> +
> +	qda_file_priv = kzalloc(sizeof(*qda_file_priv), GFP_KERNEL);
> +	if (!qda_file_priv)
> +		return -ENOMEM;
> +
> +	qda_file_priv->pid = current->pid;
> +
> +	qda_user = alloc_qda_user(qdev);
> +	if (!qda_user) {
> +		qda_dbg(qdev, "Failed to allocate qda_user\n");
> +		kfree(qda_file_priv);
> +		return -ENOMEM;
> +	}
> +
> +	file->driver_priv = qda_file_priv;
> +	qda_file_priv->qda_user = qda_user;
> +
> +	qda_dbg(qdev, "Device opened successfully for PID %d\n", current->pid);
> +
> +	return 0;
> +}
> +
> +static void qda_postclose(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct qda_dev *qdev;
> +	struct qda_file_priv *qda_file_priv;
> +	struct qda_user *qda_user;
> +
> +	qdev = get_qdev_from_drm_device(dev);
> +	if (!qdev || atomic_read(&qdev->removing)) {
> +		qda_dbg(NULL, "Device unavailable or removing\n");
> +		return;

Even if it is being removed, no need to free the memory?

> +	}
> +
> +	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
> +	if (qda_file_priv) {
> +		qda_user = qda_file_priv->qda_user;
> +		if (qda_user)
> +			free_qda_user(qda_user);
> +
> +		kfree(qda_file_priv);
> +		file->driver_priv = NULL;
> +	}
> +
> +	qda_dbg(qdev, "Device closed for PID %d\n", current->pid);
> +}
> +
>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>  
>  static struct drm_driver qda_drm_driver = {
>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>  	.fops			= &qda_accel_fops,
> +	.open			= qda_open,
> +	.postclose		= qda_postclose,
>  	.name = DRIVER_NAME,
>  	.desc = "Qualcomm DSP Accelerator Driver",
>  };
> @@ -58,6 +174,7 @@ static void init_device_resources(struct qda_dev *qdev)
>  
>  	mutex_init(&qdev->lock);
>  	atomic_set(&qdev->removing, 0);
> +	atomic_set(&qdev->client_id_counter, 0);
>  }
>  
>  static int init_memory_manager(struct qda_dev *qdev)
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index 2b80401a3741..e0ba37702a86 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -10,6 +10,7 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/rpmsg.h>
> +#include <linux/types.h>
>  #include <linux/xarray.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -20,6 +21,33 @@
>  /* Driver identification */
>  #define DRIVER_NAME "qda"
>  
> +/**
> + * struct qda_file_priv - Per-process private data for DRM file
> + *
> + * This structure tracks per-process state for each open file descriptor.
> + * It maintains the IOMMU device assignment and links to the legacy qda_user
> + * structure for compatibility with existing code.
> + */
> +struct qda_file_priv {
> +	/* Process ID for tracking */
> +	pid_t pid;
> +	/* Pointer to qda_user structure for backward compatibility */
> +	struct qda_user *qda_user;
> +};
> +
> +/**
> + * struct qda_user - Per-user context for remote processor interaction
> + *
> + * This structure maintains per-user state for interactions with the
> + * remote processor, including memory mappings and pending operations.
> + */
> +struct qda_user {
> +	/* Unique client identifier */
> +	u32 client_id;
> +	/* Back-pointer to device structure */
> +	struct qda_dev *qda_dev;
> +};
> +
>  /**
>   * struct qda_drm_priv - DRM device private data for QDA device
>   *
> @@ -52,6 +80,8 @@ struct qda_dev {
>  	struct qda_drm_priv *drm_priv;
>  	/* Flag indicating device removal in progress */
>  	atomic_t removing;
> +	/* Atomic counter for generating unique client IDs */
> +	atomic_t client_id_counter;
>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>  	char dsp_name[16];
>  	/* Compute context-bank (CB) child devices */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
