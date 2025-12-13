Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5ECBA462
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 05:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBEA10E952;
	Sat, 13 Dec 2025 04:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVC2IzOf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm5y00aP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672F910E944
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 04:02:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BD3Q3kP2436156
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 04:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=krIrLWAixu9t46zq8ZyDKkJP
 caIYHcMtAO/tuk3uLmE=; b=cVC2IzOf9nucZhnAr3gZ8t3dcvAFn+hYXis/U7wm
 RY0Bu3u1cUK+I/d2xctFSU4nlRmqjr1zcmztMyXZzxyd6o2NF61P4MvGJVmKcAmM
 90yQNRB4+FOGM6tdJpjv6xb5TP/SJPaSrok5S92KPVjUhFgg0C5RtTLj4TTPWCoE
 2vlU2WLGOqqvYCT9t3f4FtNCt5aRn66aszyIChZ9xwxysEj3+nXXfztJTjDMCH7p
 atU9TuChBUHpyw3CWhLL22YxdM94NHJbS/yHClETb7srwigtqqys3mSanmDP9MuC
 u++Mvr5SegvLGmHGHOOt1dvyBbuOjSFE4EyjBQi9SIJ8RQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b107vr19b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 04:02:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2194e266aso371329385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 20:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765598566; x=1766203366;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
 b=Qm5y00aPP+h+NqVrK8QWhJIvu77H06Ps0S3pvXF0yDNirIsHxdO4Yx4volyqoodrz5
 6k14HBifM2IamSNHXYlRIDnnSBR8xtNeha66VHeTR8KUIhllBg6Av9k1t93EXam4S/uj
 xBx4+jccGy6M7yOhP701OCtNWB9mpLX+hxHyiJ4WoMWQZeRsEXuMSLpzimQc34gzaI06
 +mEQCo4b8KeParVuCfyfacFAQtDpxBuVB9xf3Eg+OHh6eQqfvBhm50kH9Ske1jr60UE9
 IXo/cGznJvTHtpdgz8ouKfr+mKbpAxruWtLM+Q2BAODIPV8E+I8iY6Bmv5blXZ/uEuLa
 22ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765598566; x=1766203366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krIrLWAixu9t46zq8ZyDKkJPcaIYHcMtAO/tuk3uLmE=;
 b=mdw1/pCsbr6nigqjVPvyFoMFFIyZ9IkfvPrQKhFSWzCUmQKhsOfcdCcUwSuPB0ANda
 rd++fFDhZRjMnGhH9bC4RKAcy7SrB0wvaD7QBzllIMSG4dagPbNhnq4TIITvZvtUt2KO
 E+UAo6NcuqwU121VF/FUVb5lioeAwph87+AIMu3MzI4UpTFP3pNIAX1BnVds5079Yov/
 DQ+A0MK/jlmMLKNeskEatkRL4EfJLUJMWK1hmKuJsjRap5yrXbo1fjGSXMeetYtSoEJX
 uLiFSy6ggeI3Hu1vusYkoqLHhVqkqMjkqs+t6ugbJOd48Bnj0MWcl48U7DbmdwGcA5Qs
 VFwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDQKZgvBadGeUtjxC/srOB2XBxBkSCRCI573hV7aXN7uI16JRrbQZDy2CS8O4IF+mR7b+qhnViw+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj+zo8aOKMqBY3L7XUTi1KqJ7ZSpW+i08MoTVE35jlZWv6S7iP
 En8De8Xsbvv/sBmGkVj0YIUVlIomhBQDtbSmn1C/ste2zOYL0/767UhO4rIyvh60ejLwXQre28+
 urt8aZh6IETJ+6Zyzouc6MXXpK/mU/VI8EKis2170pg49ahXMzZGCHTcsqG65hfwFUtFnLdM=
X-Gm-Gg: AY/fxX5yOG0H6OnhvN4eB69VIPzvDD9TFHc2lslB7S42MzgG9Ctym1HDJJyo6plq8gb
 AcnRWfMDp6vgAfe2Bk4ii43D8X2zZSgMXmPIbMMUsQoSHewJ+bwt+Kq2mdS6c28pIKjVKwcZ/Sm
 Isvknh7sZNk7LuS8A7hwnxOnKagsTlziQKTLLkpiBiuimlIDdddLnr9Zu64spmIVtJ1AZAZxFp/
 IaWiNthdv9mKTl1FUPduzqNhY/v1uJ1aMeVV5IIgR94qpyUkxHJJPj/eP4TZml9+RoqIbP8b1il
 iP9iaf0wAuOdWIxfmr6ZMoPAsweaLUrXAgKRO0WSUADj5+G/HKPwiqAcRc8MAj+EOuQ3c+19WOf
 /ExcmDNcwczCv+wBnKyJPP1yKi+YkQZ0QLy1j4PRYhqb4fk9qRjW2aVPk9724JxqwDoninvCv2D
 5GHllR1/xYKgQeyaubjKn5OA4=
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id
 d75a77b69052e-4f1d04df845mr58487741cf.19.1765598566537; 
 Fri, 12 Dec 2025 20:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc4ximOjQPXVj5aYQYKEhiuT3BE6BDth/OUUa2d+dNwwoMbOuQg7anTaVZtZI83QA+Bbx45Q==
X-Received: by 2002:a05:622a:a18:b0:4ee:403:7f3e with SMTP id
 d75a77b69052e-4f1d04df845mr58487511cf.19.1765598566091; 
 Fri, 12 Dec 2025 20:02:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2fa7fe0sm2582787e87.72.2025.12.12.20.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 20:02:44 -0800 (PST)
Date: Sat, 13 Dec 2025 06:02:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add NULL pointer check in
 dpu_crtc_duplicate_state()
Message-ID: <hl7op7zsxzmyttdjv2ijyutnobwjpl2fezaz7ohnlahzatui5y@677c4g676ekn>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
X-Proofpoint-ORIG-GUID: TrDWRp1O1BgHdyzIG6i5SgEgp68HYZAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMCBTYWx0ZWRfX/jrkNWCuf+7v
 j90SN/liT6WtLJR+3WJvuzbHqIrPzEsn6eCW8xgky5xGPQ9ELInz1Eod3mSWxZKObVo36AJD5K8
 KsSn+LqG2xrxg2/VDQveax8Xmu+H+R5a95aZfkQjcPUg+x4gcUEOWndwDw/gUhpWWpq3rw5nDHi
 i8Nx/DDWW1JeLZMgw91SIZwqC9JQlU8xKbLgsxBqGqx6gnsRSn1HQyXGNK/r+qNpfQql7fZmcy5
 4bxvgcuedwvplP5neGVl7SCKX231By/DxIFg16MA4n1BzuXhEsinDJARIFamwYgiqXPj9N5si5s
 fA0PVvwut/WfOYTgKQxrCehO0aW2gncpHCPyaMEPHZ7l+pusbneYqUjsT5n5MZp0zB8u54jniCq
 LYsc1zj8Z6gzI3zRNizDQKdng+crng==
X-Proofpoint-GUID: TrDWRp1O1BgHdyzIG6i5SgEgp68HYZAP
X-Authority-Analysis: v=2.4 cv=Ko9AGGWN c=1 sm=1 tr=0 ts=693ce567 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sfOm8-O8AAAA:8 a=NGQ4gkOAZ6mTdP00BBYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130030
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

On Sat, Dec 13, 2025 at 12:08:16AM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> dpu_crtc_duplicate_state() assumes that crtc->state is always valid,
> but under certain error or teardown paths it may be NULL, leading to
> a NULL-pointer dereference when calling to_dpu_crtc_state().
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Missing Fixes tag.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c39f1908ea654..d03666e14d7de 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1114,7 +1114,12 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>   */
>  static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
> -	struct dpu_crtc_state *cstate, *old_cstate = to_dpu_crtc_state(crtc->state);
> +	struct dpu_crtc_state *cstate, *old_cstate;
> +
> +	if (WARN_ON(!crtc->state))
> +		return NULL;
> +
> +	old_cstate = to_dpu_crtc_state(crtc->state);
>  
>  	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
>  	if (!cstate) {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
