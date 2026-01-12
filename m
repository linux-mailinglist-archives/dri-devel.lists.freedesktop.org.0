Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC03D1226C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C6910E0EA;
	Mon, 12 Jan 2026 11:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O41eejZR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUh0Hck3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D2710E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CAEeYI1315903
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=; b=O41eejZRHpAWdZ2l
 PNKFKurHrJh3SZCZmFjIu61O9IHVBoqQoULJ3GNgPi6ckTZqoZXR7qOvo9K3ob/r
 GhmbbNrrJby6gbn7Pv4c08c3crkKvnqeBwgeAdPcHzHUvJV3UWSYvXIvGX5yuOPz
 yw/veTUK+ISK8OS/QZBd6FgMVuIE++YzJuwPNRtthTOnqu1lOjmk/hbEeGHwHb1+
 KR25XPxLbeaBJiIIfvqPEtl1sO2DpArY9ko/451iYhyp+27nGNkgRErVb7NoxW49
 70G3LKnr9oYp+oUvu0OKaHa7bQl3BYGyV1f34ILMJKYoHPzQM61P0HcMv4ZYCMx0
 k6d68g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg4cy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f3564e2321so11803311cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215961; x=1768820761;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
 b=jUh0Hck3/rvhzCfgNalAKKrrS6TE8Zd3rRAHLRTFUXgMkGWodrPGvYHwsalkcSBGL7
 BLfUEfMvDJM96iqTU/1UoY9EBAuUgPfWFWrKV+WEeKfyZDOiW9qIVVvO0s5j2Ngx2QF5
 28zuykBseQPllTstd9YPa33R1OXTlFrmvw1NQujDOHsSOQPaCLKkOgwFyWZHJgeDMAAv
 JFhIbz9UZ5Fk5up43+sJadlI9V8TAk2XOKhvlyKXH6RiDbao0gZzQykWXLhnw5y40Nit
 2Kzb+58NAwqwxMlDtgUuVA0/o84FJWcAUEHIcD+vukyg+8U7jLiGIPggIa/0t8mBV8i9
 I1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215961; x=1768820761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
 b=cBEW//No+3gq4/QZBVW1Z9SxWlMh3oMPSrgteUZkr9v+zBR9xMEYtxv7fzpPJPTW3g
 3lKLM4ETeiMNvB7xmc4qk0tQaiKMULIwsW3R/2Q1UKwLFo5YCSfY4gOYja9PuAfbP35L
 N3TYRjQMzGhntBp81imaSdxE2YiFDYE2MUqQY/a+RqX5objezYQagCEDbjW63OPzJq2p
 yxmq042cBnes9GtkmH19fv8naZ5gG7ohd17Ax44GV3fNMfHp+bsO2D+V1B1I0solz4cL
 94CznaLEbRwu1yUiXpHajFAlblYl1Q2FQk2+YvFHvj2Bc2pHl/9LQMfmMWp39sJU/D8t
 0ykg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOJokSYuJSx2KmqV2QPcVhHr9zI0PfMl+gfyvqxW4IDtbcJyfV17nQONnTQyn9Hd9pTtmCC8Ic0KI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQbYjSOnyCr0GkUMnHToMoSUc5ShmIjG+4hp75kP0ZfQ+w22Ma
 G8YIZ9AnbS4ypbT9f/i+QzT9oa/SjtBoIfnFKmzsB45frGKRkHq0dplwn+jh6hwLJm9MDPi/r5t
 OiO37c1RK5VzAL7soJLRJQFVlLDiGEYQxmungb20bVRxY+95sTXf+SNWt2MPl2WYwGXfGs2c=
X-Gm-Gg: AY/fxX4gcXCeMdZbmnBLn5tB5+MC6xjOIgxZXCSgy1WIvSXvfneyFhgFOrIxWqwgyl9
 cPFkX0WgrsFKwhFVNbT6sN9FM/kUtihSW2GAGYKWE9FgVSkVjbDXy0N5ap6V+9dRAcsGH1A1KNq
 psb/2SeifhYAw8zysNzhVd0fo1L6vu8TNBnkpOEXM4yBt4LQHlvXTmIqMMwfN4qeLAaLeUz98Cb
 rZbPfxwAPOy6TsVT3cFYBBqcY+Yxk8cZlyG1HohgNjC+3FERLwxnZ4kRCmOOSk7vVUvBywL+ddV
 ylsBdOoy7ZZP4Gq5uJ2R1rTE3/zAOGuhfvcD9QzgAq8TXlci9wX1RRB4jPWG9HGnChhYnVkD0ul
 RcZgkENVVYhHQemq6e5mf5qc5NjhU2YKbaK0k6ELRQYV5BzMxvAYdbh92B7k0N9gClN0=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ffb4a8df70mr193903141cf.11.1768215960644; 
 Mon, 12 Jan 2026 03:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNv1v7wEqgWI3tjOCT1nA3PXnJ9lceXAcF2SXq40DOYlfVDQzD03ft0+q3tMM/DtBiVV4WlA==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ffb4a8df70mr193902881cf.11.1768215960265; 
 Mon, 12 Jan 2026 03:06:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b871f50cdc4sm209534566b.20.2026.01.12.03.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:05:59 -0800 (PST)
Message-ID: <9b91ee50-9166-46f4-83f0-c7a46bc0ca06@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: don't specify max_channels in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rvonaGS-OTRme3FB9mOno4YTeNmPdNgo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfXyOtU33smRQtF
 Lyr7L+BkhJW32xiC0itWu/AhfnEYu3cpOpdgtvZCmDYAqPZAODUj8tu1k9O/1wm+cI1aAdtE9T0
 YUs0B6ZayACTqsDakFyecW0RP3PNCIyny5fGDGldoiG5DJ+JYgZjrFYxolfkgp3G55gJtUkqPcd
 v6Mh29XrlvkL7BkWXOLGXlfFswA6zxXIBLfAVU6k0hm/gXi1GaA191zxVHLVLBc1LLnMJ0QhBcJ
 jJw+KbPH/uJ+pt3cXJWQF1GkXHC5cO1jstkGbAmpcsq+HbXGsbQcJENJQO0I16FDGWW3E4Rw0XU
 kPMY+NP4sZLeLVDKZPYkZ+hSHjGkZGn4oZjM/VZjr0rdfV6pBEE0brPV2aAmhD2h8aiWSUm02qd
 ZGdIGddXGEDjYPzxe3m71J+BaXPQSA+ejjua+zTCLt8WZHe/kFdxbEGZAeSvQBIyYJO2ifLnp63
 /21XCbMDc2Is1onqLYQ==
X-Proofpoint-ORIG-GUID: rvonaGS-OTRme3FB9mOno4YTeNmPdNgo
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d599 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z5E5LkF8W0bl65O362YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088
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

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;

With the hope that this never changes from a boolean

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

