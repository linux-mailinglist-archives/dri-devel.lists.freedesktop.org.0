Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8287C69C07
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8D410E4C2;
	Tue, 18 Nov 2025 13:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix8yE514";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUJ9G811";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CEF10E4C2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:57:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8l7uh2755129
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=; b=Ix8yE514CE4ylJ3o
 Gy2BAVuEO8mDuL6cTd5yKcLWig8ZKEQymgpgWdOTuCgiBDJOEvjTJ66axuvWksz3
 +87pow3Yg/sRpQWG0tsz4OEqAp5kW/F8PmM51axJFvD2PpBoI7g/cUHnh6xHSV8a
 lFuGlYaVoBWLJqASP6dfpMGcF+jTJPlmfDqWbMRsU1RUzZET2HdsMPwD5168tOUd
 Ml8yDrHMApl8TpswPs/kk56kW0y+kFqs7nUtyBBbvlbbB95uXG/Q0U4bfeHnYCoA
 eqJwtjgH5n1RDQYie+YjOgmksRxIZyJ2hop9LSiHvo818c7n4Qc2ih2eYnPZP+y7
 CM3qJQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj0ua9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:57:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7bb2303fe94so4885762b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763474266; x=1764079066;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=;
 b=YUJ9G811Hcuy2tkiir9A+sr2ij+G0C2nXMnpDoSEKt/wr55OtuBLHTNYAXDLH7lA8K
 AxL+3twhX7XvpFwXu7Vs0FLjAA3d+ONjB4sz642A3a+PgnFdn86HcoygaMbr4y75y/b2
 xIF4vlDbxDqzEBQ82J8U4UyLpIYvy8j+dxm/RC7unjTh8ZMzcY4OWEXCXZzPHZqGlgQW
 qU5cj+ziVdQLfa9WcrFKp+lWeEqX0/UVW5AgMJIkHtYkoaE7l7EqvfTOg6xaPZXf9Fgj
 szv2Dc9QgnKAXdJbPTPyU8HlVzOPfeqZLkcYL/wVMX3IoYJuoElZ3gMkz8JToedVWzyf
 g3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763474266; x=1764079066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=;
 b=cS4ePKG5U+Egdsz7yo0yyvy83afWrTlA/yCYe4hi7oy0jVRLTvc0OtMNob0VLEWWw+
 Hq1CQj/WnxezR9qc1wC40wohHkWmO1Ucj3bJicMjfTGtXUxwZNI/JuR094DfnJqXf0B/
 6B+Rl5n8oHXpYWUllvA7TdhZJh+Jd1qgFChSxc+ImAhkBF+bQsTeTj5uyIgnUoHMYxnf
 49BXPzZdHs1/1QlCzvR5Wd+BrZ81rTqgytMrEI3dW8BYhfnu1zjDDyesQJ1ZitMpK7ow
 eQakBHcwkmmJl78O1fpzajzJN+OY2wv1eFlSXORqlOEQqIcfeKou7Y7eGu/tgpN/Wrdo
 hySA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxrvtDpMf8EfviM98oLblty49igo8NkErLScq8f+B3fWmxdGJoaKTVcbYJuT+TEjsD33rZsT5P6nE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxkHPIvgdhrmqeDc2dlWobAAMeXtRcmg63xNF7mHyjtnZJiLSP
 QBJCbbhzS9CsUlzL3mwVHbirMAZQZVAKVog/kqH8G+eY5B0GeiwRUe59ImcBkVG2ULCLzTURrWI
 oHXjns7vyifsxq1dDFCO/hYcm+6qKPptiUrd+TloPCG1p9br46nkcw6MElliBthP98up3QZsKU3
 dq29Y=
X-Gm-Gg: ASbGncsEZ2tw3Y71wY75Oouk3I5LzAEqmJKCcR2cweZIJP4vBV1OhughSowAJjTYvtW
 CFNCnkaMflxCxwZx4ReuXGVYS0z3JIZhDBpNbd6uKrfoVVvv1WxGUAzy1JIWb1c//f3Qn7PCdqa
 MprHFRi1Ub86RyUOO+ngC6I16UYys23SzPyE/V7ijRjgSuCem0s3sSkZhozNBDkdx/fk/Gjdlw3
 LS5txYe6cSqeXvmHr4e20PEOla+JAWyerwLWjrnwS3EQpgYKjoxAz7+46ZsDuEWyg4PZefNC9IN
 8JEWWrYw26pMnLzjECZyprv1uqmO7ixdJ4BLr00lrNOkABFt6TTS5WhPCY4ouWc/IINSyCZq88d
 4wxvJHiNcIr2NuMIakZKY6g==
X-Received: by 2002:a05:6a20:4315:b0:34e:4352:6c65 with SMTP id
 adf61e73a8af0-35ba229d49emr17831541637.38.1763474266318; 
 Tue, 18 Nov 2025 05:57:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqQweym02veXOx11FsV5HRruhgX6qp3xUFZXeCsTWnKmjWpJgtrfqH5Z+hC1UT51q4UkoBCg==
X-Received: by 2002:a05:6a20:4315:b0:34e:4352:6c65 with SMTP id
 adf61e73a8af0-35ba229d49emr17831508637.38.1763474265862; 
 Tue, 18 Nov 2025 05:57:45 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b9250d195fsm16600843b3a.18.2025.11.18.05.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:57:45 -0800 (PST)
Message-ID: <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 19:27:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com, jordan@cosmicpenguin.net,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
 marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
 sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bmTL5rrzu65wtD-nAeM-qzimYpb7RKDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMSBTYWx0ZWRfXxSrJxA8LVW/m
 +WVg7Iirvw8oYMGhgCaIQbHqCSuHi4mNIZcUMfDuAm6kqDJn9VrqgvAqHRyHtL8aHZN6/1qmp5O
 9V7BDm+fcx3PkgrJZHjySrWVnOVII4xGMpK4v1tXlAsLc8bNtULTT5z+iTOLuh01IcMAbL7JMDu
 hc/Fl2OadM40EwX6vrDKC1px6sm5j7OMjxFQrsKpXZfjIs/xJBOBWv2To7YMKoNPwKoOGaF1A43
 fjiMJm4DnXT5ffIzBBbJNRFxvowMD6Tjn3ojJd0a+lT2BVcxT8an3ah3cV97Mr+a7/IvdsW8UYy
 iaknIz51JW5AV6VLEsdWxF0TZ8s02fwD+3/B2p+ukaY9NjHI5hAf0EefDIK0tjly9sg3dS733EA
 IgShEqlz811XTzIGYS5iPjy1Vp4szg==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c7b5b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=73rUxmhrSfcUVL-5kvkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: bmTL5rrzu65wtD-nAeM-qzimYpb7RKDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180111
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

On 11/17/2025 6:55 PM, Alok Tiwari wrote:
> Currently, a6xx_show() dereferences state before checking whether it is
> NULL or an error pointer.This can lead to invalid memory access if state
> is invalid.
> 
> Move the IS_ERR_OR_NULL(state) check to the top of the function before
> any use of state.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 4c7f3c642f6a..e408e1d84ade 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		struct drm_printer *p)
>  {
> +	if (IS_ERR_OR_NULL(state))
> +		return;
> +
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu_state *a6xx_state = container_of(state,
>  			struct a6xx_gpu_state, base);

Are you saying that this container_of does a dereference?
I don't think so.

-Akhil.

>  	int i;
>  
> -	if (IS_ERR_OR_NULL(state))
> -		return;
> -
>  	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
>  
>  	adreno_show(gpu, state, p);

