Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A402AFA8D3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 03:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EA010E3E5;
	Mon,  7 Jul 2025 01:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjGjmhOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8CB10E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:21:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566NwJqB012292
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Jul 2025 01:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YGTEHq4IajGxUn2mf1ux8G7XL8Yixn+AipVYC3nee/o=; b=NjGjmhOpTMbWmN33
 mO3imoHpweZEY6jBfi/omYJl/pKFRtYRJ6sMhVkOIIoaIPHQpVMJnFinvQ3in5vT
 6AuvvOwiRY8vANIXvbF7JBu7jjDoy4+PsEqNSJe4nPolGpqmhxGQtNVZ6ZLcGV3d
 ODRIyn+ZQpMyaw8S0r6TOjzc4Yk2tuiPxzXOtiOAvzaiRkO8bPblMqeDACid4fq0
 +FTaL/qHv8RiCybJ3AOCC1fTzHl+FxCKI482mtbYVv1WeCnxWTQHxC0/xX/KTS7q
 I+ngBIkmIhqV1GABdAWgJmjcpasugjNzrMiuDMFdhSE06uNxhfv6kRF3MGUxwKXA
 ZcRsYg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun2813n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 01:21:58 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-4066a4d2d31so717353b6e.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 18:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751851318; x=1752456118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGTEHq4IajGxUn2mf1ux8G7XL8Yixn+AipVYC3nee/o=;
 b=aCs6vZNdOKCftsJNoEeByum8E9TZYojqr6qO/KR1Vol8KKxZMRgF6pB75QMSOJII3Z
 K98LLaBGuhhlldkSZkpKepXyrTFTgFV3CzogID82bysF0Ij83yuyYxwH/3ZpvtGCCqhU
 pihcNf9Ahix5msTm5Dqiq0khVsRXNdfFUlDjsg34eK8zVgTJSJWGwEseIykqJFB1X+c0
 aN3fceC/3Ti4Hp9jb2ck9p5902hxG/eatb3ZjRuyq2wCE13mm2zUrVLivm7zgDFiOtoZ
 uSgIhUdAnFkukbyDlaMvd+DFXli+w0+0T8/AO38Edu/XUIPD7hxG9WDGPnaDvZ49Casf
 /F4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+YsjEfA55Qm8gBWz6rZ8dQBFuiXMFrRav5rihK0t0n4m6S7dg6XnOkj//ldruN4hTvO+S7XRMgNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl3miiUGPvQ5ZDJqQKZ0vGOxIAIP7knfXSXvyP7ZT6JyPxNbvP
 t5lc1dFNQrhz5oAzIIGN/LakmOxUE3T6rIEGXDq8W5vhXHH/caaKzRmxq4zF+5u8b642CoXTD9H
 0a7lUcAwzUDFq4L1x32Ru9jkWj6KmaLtYd8Y6eihmdClMKaZpIUGLi5HgHBfOy058LjegsQNeZo
 gvPh3Hpe6P1evEqjumLz+dsEWhgjTbgkHHZLn37oxIFuQWHg==
X-Gm-Gg: ASbGncvWLT4nWhOGv6OiF2gnf/XzTIR9dXjb+qZf6MscRDMWcbehRfswX5YJwb/oY8P
 iAhGxbJuQKUUJ/0ZEgPiss2qz3GhgNvCzzVfIOQ8HA92hJSMOyAWXVB7rkPQYCsn5gwf2ARTvao
 nbT6Nt1hMjrtWfZmfThq5Z0EZiQ6PDy9HoQSA=
X-Received: by 2002:a05:6808:6c85:b0:40c:fc48:33b5 with SMTP id
 5614622812f47-40d2b968e58mr5796410b6e.12.1751851317876; 
 Sun, 06 Jul 2025 18:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFs2KQvXeA8I+eNNlGJhs4a9HX4VvgO+pAA9xWcKrJk8Ka7dlkr/CtyJI2GXTeTCdlInF915oStCiYnr0X/MU=
X-Received: by 2002:a05:6808:6c85:b0:40c:fc48:33b5 with SMTP id
 5614622812f47-40d2b968e58mr5796393b6e.12.1751851317490; Sun, 06 Jul 2025
 18:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
From: Robin Clark <robin.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 18:21:46 -0700
X-Gm-Features: Ac12FXwpGmCmQ8_MwW7xpPT4fw4jzAuObtuXcAM1LUtEgzggh8phHjbplkb8mVU
Message-ID: <CACSVV02AvJb_mb+Hw1aQPP+WTDTgG+f0n=kK50On1g54HnBuMA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ChLetRZjqs5NUOwX7BVPZX3k3h8MgXbW
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686b2136 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=1Na2Qn3s6HqEfW6eAF4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: ChLetRZjqs5NUOwX7BVPZX3k3h8MgXbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAwNiBTYWx0ZWRfXy5yQ7Vn/DpKN
 kaem8TM4Pwh8+0/b0zCOZLAXy4ZekVrQ7EyZiYxWCU4CX9qGibYOKBC+oo6qp+zkjzvrb+O1iDw
 BCDTZ4MsyxjxZiIHxvzrdidpjP4GKfmpJpZFXnV4QVtrQ3l+T6tfqI4KpcHSZHEfh0dYlhytD9Q
 tk/sElHqyXVMNEGnKMrBpTR8DOPFrWGeTFQ7jC55I374QAZ9+x6xmeQkNzGOsbNC4+FovpFfmir
 lPChdbGlvsnTkW8rHvyMq/UnXlKGG3DFEjiJD/Ep5ezO2umfU6aNvMvzqi5+qzOr4a7PRoY3Ii2
 ky4DzNaLZOM+A9aLtMVRUnlcFXxyA2fr87bNOTPPOlLxJ2HdNUazFXTpW01eEBhdE1rq+4VdFNB
 MiT+pr2JtH4sHVHM0JJQIWTaE0o4BapbqzCnqwLuHN57+AWXVh6X9Bh1i2JWIKP7UuiUmvKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070006
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

On Sun, Jul 6, 2025 at 4:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
>
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: the driver is a part of drivers/soc, but as it got merged through
> drm/msm tree, this fix should also go through the drm/msm tree.

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca09=
4903bb1e7389066 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -12,6 +12,10 @@
>
>  #include <linux/soc/qcom/ubwc.h>
>
> +static const struct qcom_ubwc_cfg_data no_ubwc_data =3D {
> +       /* no UBWC, no HBB */
> +};
> +
>  static const struct qcom_ubwc_cfg_data msm8937_data =3D {
>         .ubwc_enc_version =3D UBWC_1_0,
>         .ubwc_dec_version =3D UBWC_1_0,
> @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_dat=
a =3D {
>  };
>
>  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +       { .compatible =3D "qcom,apq8016", .data =3D &no_ubwc_data },
> +       { .compatible =3D "qcom,apq8074", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8226", .data =3D &no_ubwc_data },
> +       { .compatible =3D "qcom,msm8916", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8939", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8953", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8956", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8974", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8976", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8996", .data =3D &msm8998_data },
>         { .compatible =3D "qcom,msm8998", .data =3D &msm8998_data },
>
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250706-ubwc-no-ubwc-3c5919273e03
>
> Best regards,
> --
> With best wishes
> Dmitry
>
