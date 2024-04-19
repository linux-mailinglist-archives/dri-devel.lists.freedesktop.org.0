Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D08AB789
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 01:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E510EBA0;
	Fri, 19 Apr 2024 23:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NBDy1mOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE6710EBA0;
 Fri, 19 Apr 2024 23:43:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JNdIqh025225; Fri, 19 Apr 2024 23:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-type:message-id:date:mime-version:subject:to:cc
 :references:from:in-reply-to; s=qcppdkim1; bh=8U8ngmUrrcLsKX+zeW
 9SkzlBu7dqCRfeWUXhwbNfv90=; b=NBDy1mOW6HhVpSFotuw+31IeyS2cJ6PPxA
 4JgAUW8qoA66Ru3wGQzib6NhWQWVtzL0LWC+cHVvrK1wdCN2UVQhBd4kQG5/BsDt
 uQ+YiSvcCHg1OKl6qa8JeRpj2UJ54yoZsuSPJFD4TnLjV36iWG/z/CzxfzXmErMd
 m+ozww8uNT4DwhhVig8OExL+seXxSTUmvMbo3rW8ZS1rKYklaD//YetcoKyPJTJh
 iL3DNvmdn5kfatwWy60toE9BSrmboxnCmRSWYtuko0fOZxQvgtfaBWKNekDUxtum
 dSfsDfNiEZMjX/UqSORGB5L0F3eA7n8Psr2zBZxB5QR9nkiyCOxg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkt3mh1rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 23:43:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JNhMrC015010
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 23:43:22 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 16:43:21 -0700
Content-Type: multipart/mixed; boundary="------------jPJkR2zjsog9xHLAQWo8XIkw"
Message-ID: <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>
Date: Fri, 19 Apr 2024 16:43:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dTbBVsk8VEA5UWPhR-xASIY7WLo-3y1u
X-Proofpoint-ORIG-GUID: dTbBVsk8VEA5UWPhR-xASIY7WLo-3y1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_16,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190184
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

--------------jPJkR2zjsog9xHLAQWo8XIkw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 3/19/2024 6:21 AM, Dmitry Baryshkov wrote:
> The msm_kms_funcs::check_modified_format() callback is not used by the
> driver. Drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
>   drivers/gpu/drm/msm/msm_kms.h               |  5 ----
>   4 files changed, 66 deletions(-)
> 

I think in this case, I am leaning towards completing the implementation 
rather than dropping it as usual.

It seems its easier to just add the support to call this like the 
attached patch?

WDYT?

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index e366ab134249..ff0df478c958 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -960,51 +960,6 @@ int dpu_format_populate_layout(
>   	return ret;
>   }
>   
> -int dpu_format_check_modified_format(
> -		const struct msm_kms *kms,
> -		const struct msm_format *msm_fmt,
> -		const struct drm_mode_fb_cmd2 *cmd,
> -		struct drm_gem_object **bos)
> -{
> -	const struct drm_format_info *info;
> -	const struct dpu_format *fmt;
> -	struct dpu_hw_fmt_layout layout;
> -	uint32_t bos_total_size = 0;
> -	int ret, i;
> -
> -	if (!msm_fmt || !cmd || !bos) {
> -		DRM_ERROR("invalid arguments\n");
> -		return -EINVAL;
> -	}
> -
> -	fmt = to_dpu_format(msm_fmt);
> -	info = drm_format_info(fmt->base.pixel_format);
> -	if (!info)
> -		return -EINVAL;
> -
> -	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
> -			&layout, cmd->pitches);
> -	if (ret)
> -		return ret;
> -
> -	for (i = 0; i < info->num_planes; i++) {
> -		if (!bos[i]) {
> -			DRM_ERROR("invalid handle for plane %d\n", i);
> -			return -EINVAL;
> -		}
> -		if ((i == 0) || (bos[i] != bos[0]))
> -			bos_total_size += bos[i]->size;
> -	}
> -
> -	if (bos_total_size < layout.total_size) {
> -		DRM_ERROR("buffers total size too small %u expected %u\n",
> -				bos_total_size, layout.total_size);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>   const struct dpu_format *dpu_get_dpu_format_ext(
>   		const uint32_t format,
>   		const uint64_t modifier)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> index 84b8b3289f18..9442445f1a86 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> @@ -54,21 +54,6 @@ const struct msm_format *dpu_get_msm_format(
>   		const uint32_t format,
>   		const uint64_t modifiers);
>   
> -/**
> - * dpu_format_check_modified_format - validate format and buffers for
> - *                   dpu non-standard, i.e. modified format
> - * @kms:             kms driver
> - * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
> - * @cmd:             fb_cmd2 structure user request
> - * @bos:             gem buffer object list
> - *
> - * Return: error code on failure, 0 on success
> - */
> -int dpu_format_check_modified_format(
> -		const struct msm_kms *kms,
> -		const struct msm_format *msm_fmt,
> -		const struct drm_mode_fb_cmd2 *cmd,
> -		struct drm_gem_object **bos);
>   
>   /**
>    * dpu_format_populate_layout - populate the given format layout based on
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a1f5d7c4ab91..7257ac4020d8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -969,7 +969,6 @@ static const struct msm_kms_funcs kms_funcs = {
>   	.complete_commit = dpu_kms_complete_commit,
>   	.enable_vblank   = dpu_kms_enable_vblank,
>   	.disable_vblank  = dpu_kms_disable_vblank,
> -	.check_modified_format = dpu_format_check_modified_format,
>   	.get_format      = dpu_get_msm_format,
>   	.destroy         = dpu_kms_destroy,
>   	.snapshot        = dpu_kms_mdp_snapshot,
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 0641f6111b93..b794ed918b56 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -96,11 +96,6 @@ struct msm_kms_funcs {
>   	const struct msm_format *(*get_format)(struct msm_kms *kms,
>   					const uint32_t format,
>   					const uint64_t modifiers);
> -	/* do format checking on format modified through fb_cmd2 modifiers */
> -	int (*check_modified_format)(const struct msm_kms *kms,
> -			const struct msm_format *msm_fmt,
> -			const struct drm_mode_fb_cmd2 *cmd,
> -			struct drm_gem_object **bos);
>   
>   	/* misc: */
>   	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
> 
--------------jPJkR2zjsog9xHLAQWo8XIkw
Content-Type: text/plain; charset="UTF-8"; name="modifiers.patch"
Content-Disposition: attachment; filename="modifiers.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9mYi5jCmluZGV4IDgwMTY2ZjcwMmEwZC4uMWViZjE2OTliYTk0IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2ZiLmMKQEAgLTE3NSw2ICsxNzUsNyBAQCBzdGF0aWMgc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqbXNtX2ZyYW1lYnVmZmVyX2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsKIAljb25zdCBzdHJ1Y3Qg
bXNtX2Zvcm1hdCAqZm9ybWF0OwogCWludCByZXQsIGksIG47CisJYm9vbCBpc19tb2RpZmll
ZCA9IGZhbHNlOwogCiAJZHJtX2RiZ19zdGF0ZShkZXYsICJjcmVhdGUgZnJhbWVidWZmZXI6
IG1vZGVfY21kPSVwICglZHglZEAlNC40cylcbiIsCiAJCQltb2RlX2NtZCwgbW9kZV9jbWQt
PndpZHRoLCBtb2RlX2NtZC0+aGVpZ2h0LApAQCAtMjAwLDI4ICsyMDEsNTIgQEAgc3RhdGlj
IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKm1zbV9mcmFtZWJ1ZmZlcl9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCiAKIAltc21fZmItPmZvcm1hdCA9IGZvcm1hdDsKIAorCWlmICht
b2RlX2NtZC0+ZmxhZ3MgJiBEUk1fTU9ERV9GQl9NT0RJRklFUlMpIHsKKwkJZm9yIChpID0g
MDsgaSA8IEFSUkFZX1NJWkUobW9kZV9jbWQtPm1vZGlmaWVyKTsgaSsrKSB7CisJCQlpZiAo
bW9kZV9jbWQtPm1vZGlmaWVyW2ldKSB7CisJCQkJaXNfbW9kaWZpZWQgPSB0cnVlOworCQkJ
CWJyZWFrOworCQkJfQorCQl9CisJfQorCiAJaWYgKG4gPiBBUlJBWV9TSVpFKGZiLT5vYmop
KSB7CiAJCXJldCA9IC1FSU5WQUw7CiAJCWdvdG8gZmFpbDsKIAl9CiAKLQlmb3IgKGkgPSAw
OyBpIDwgbjsgaSsrKSB7Ci0JCXVuc2lnbmVkIGludCB3aWR0aCA9IG1vZGVfY21kLT53aWR0
aCAvIChpID8gaW5mby0+aHN1YiA6IDEpOwotCQl1bnNpZ25lZCBpbnQgaGVpZ2h0ID0gbW9k
ZV9jbWQtPmhlaWdodCAvIChpID8gaW5mby0+dnN1YiA6IDEpOwotCQl1bnNpZ25lZCBpbnQg
bWluX3NpemU7Ci0KLQkJbWluX3NpemUgPSAoaGVpZ2h0IC0gMSkgKiBtb2RlX2NtZC0+cGl0
Y2hlc1tpXQotCQkJICsgd2lkdGggKiBpbmZvLT5jcHBbaV0KLQkJCSArIG1vZGVfY21kLT5v
ZmZzZXRzW2ldOwotCi0JCWlmIChib3NbaV0tPnNpemUgPCBtaW5fc2l6ZSkgeworCWlmIChp
c19tb2RpZmllZCkgeworCQlpZiAoIWttcy0+ZnVuY3MtPmNoZWNrX21vZGlmaWVkX2Zvcm1h
dCkgeworCQkJRFJNX0RFVl9FUlJPUihkZXYtPmRldiwgImNhbid0IGNoZWNrIG1vZGlmaWVk
IGZiIGZvcm1hdFxuIik7CiAJCQlyZXQgPSAtRUlOVkFMOwogCQkJZ290byBmYWlsOworCQl9
IGVsc2UgeworCQkJcmV0ID0ga21zLT5mdW5jcy0+Y2hlY2tfbW9kaWZpZWRfZm9ybWF0KAor
CQkJCQlrbXMsIG1zbV9mYi0+Zm9ybWF0LCBtb2RlX2NtZCwgYm9zKTsKKwkJCWlmIChyZXQp
CisJCQkJZ290byBmYWlsOwogCQl9CisJfSBlbHNlIHsKKwkJZm9yIChpID0gMDsgaSA8IG47
IGkrKykgeworCQkJdW5zaWduZWQgaW50IHdpZHRoID0gbW9kZV9jbWQtPndpZHRoIC8gKGkg
PyBpbmZvLT5oc3ViIDogMSk7CisJCQl1bnNpZ25lZCBpbnQgaGVpZ2h0ID0gbW9kZV9jbWQt
PmhlaWdodCAvIChpID8gaW5mby0+dnN1YiA6IDEpOworCQkJdW5zaWduZWQgaW50IG1pbl9z
aXplOwogCi0JCW1zbV9mYi0+YmFzZS5vYmpbaV0gPSBib3NbaV07CisJCQltaW5fc2l6ZSA9
IChoZWlnaHQgLSAxKSAqIG1vZGVfY21kLT5waXRjaGVzW2ldCisJCQkJKyB3aWR0aCAqIGlu
Zm8tPmNwcFtpXQorCQkJCSsgbW9kZV9jbWQtPm9mZnNldHNbaV07CisKKwkJCWlmIChib3Nb
aV0tPnNpemUgPCBtaW5fc2l6ZSkgeworCQkJCXJldCA9IC1FSU5WQUw7CisJCQkJZ290byBm
YWlsOworCQkJfQorCisJCX0KIAl9CiAKKwlmb3IgKGkgPSAwOyBpIDwgbjsgaSsrKQorCQlt
c21fZmItPmJhc2Uub2JqW2ldID0gYm9zW2ldOworCiAJZHJtX2hlbHBlcl9tb2RlX2ZpbGxf
ZmJfc3RydWN0KGRldiwgZmIsIG1vZGVfY21kKTsKIAogCXJldCA9IGRybV9mcmFtZWJ1ZmZl
cl9pbml0KGRldiwgZmIsICZtc21fZnJhbWVidWZmZXJfZnVuY3MpOwo=

--------------jPJkR2zjsog9xHLAQWo8XIkw--
