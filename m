Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783DCB04816
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 21:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2437E10E34B;
	Mon, 14 Jul 2025 19:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGPQ++58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797DB10E346
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:51:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGRnmj029741
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=cHAxU5EnEHUmmvSd/XnW201tIJmHnogoSkLScD389cU=; b=WG
 PQ++58bGoF+QZqX8R59+SGOPQ5PGrMacju4rWcCYnLEkDxTgEJpKP7YkBwD154sq
 9WiG72nCnuXda1yJIvewzAF2zawQFDgKGOrKExlFBKoLj/C5y2wPx78Nha1PiqBX
 Twqo/auhtkq8WhM6evSTi0ZYi8n2erpzgm1acGEMk5bghAeqxykWQAqEBUU4Ed1M
 6px2RztULwEMNBz7M641NHGu5GdxX+hx+qOrB4EdMRESJYB1B3te87vDc7l/x3OX
 87+DDYTkC0cUF5H7GaNoudRFJssKsuEC7qnwnBxO9NyxB58x4yf3P3OyrQRN9MXf
 LIGd1bQId2+prm6eMjow==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dq0g0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:51:07 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-61573600cd6so979227eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752522667; x=1753127467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cHAxU5EnEHUmmvSd/XnW201tIJmHnogoSkLScD389cU=;
 b=AxOJY2QpVYvWigPowiDblJp9BXxcRlg3c6TiHsEY9Te4MTgAg1O/QJASGByMvlvIjA
 XM8UOqczKYPznaWop8vEmGwdqRUkuc2WxUCHem1EmzlrP0S4Oyq8WpK6+ZzbxY9j9wj+
 Jyjx4A98mx48uumOEME6h2h5Y8xzIz+MoY3qLwgqjvwoZmw8fMAHvhfZH9dLo1+muiaG
 0TquLCxUbq617TgeoXL5yZ3xQKea7/U9mrQgQCf44kWtfeh5sNSvcBkb4q50ATsfvth6
 HfbJG3EPNzcGTNIK/iPqD8L0A34ndwoxfduXCoF3I4ZNiHV3xItGMljWyRTI2lINItHd
 +qrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC8RhvdsjChvU1QKNPsdlVHCPVjNyoJUc0SZDfHfeDgX4Ts8fzmvPM37kca27wcKNONn9U1zTVowY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn3+V4yp7tDTW6p0Y+bTOb0qFDKhU1DM8x8tRQWJm6hCJnIrgL
 eE4vLpJmaC789nIH/cxG7cDVvD8aKNHL95DcnVU3ih6HkqRFu0o+w7cMk2kbE1BX9YZLofjNMId
 iRSAI3CyhZI6T14IxsRyO7HuC0OJSkOPYweJ1CIY7v7FRi05WcU7W4LHE8WFeBqrFgsyLgn8enJ
 3r6YvV7lfih4qhA99QF2wphJyD7nGHhUjDN5x6xJ+tTDU8ug==
X-Gm-Gg: ASbGnctGNU73liVkzwCpXejzNbATH/Ez3vCJz8RZ5zZvsrdW7HDCpcO4ipVxKMf5HAl
 t4xQQqxTnyPpnynZqlvKt6ABh51sCiehhJVIPBe7E8gxe/WhiPs03Si9x64WQm/m7SuIq4nmAg4
 xqsGfGMVWYT+0anYxQtH/KfHfH/hlWn9MQxjCfOdjFEVSWhoZIMzG/
X-Received: by 2002:a05:6820:2b14:b0:613:90e1:729a with SMTP id
 006d021491bc7-615933298d2mr395650eaf.4.1752522666739; 
 Mon, 14 Jul 2025 12:51:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvNOTRr7nTbzGLFYFpm62n4sXgSE9iNBusqXlHlebIghEEjvoyILcY8+9jbV1NxN9chrsAuYDFxtNto888VVg=
X-Received: by 2002:a05:6820:2b14:b0:613:90e1:729a with SMTP id
 006d021491bc7-615933298d2mr395636eaf.4.1752522666307; Mon, 14 Jul 2025
 12:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
In-Reply-To: <20250714173554.14223-7-daleyo@gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:50:54 -0700
X-Gm-Features: Ac12FXzMmQvS5rnzO5-iDknQYE-6ywvsNV2cxkydI09oPN8GV7Xk6HdI3xrZ3s4
Message-ID: <CACSVV00-DDnQYp-65Pi-XwpEKT1_jYik2=zH_bK_oJiGLxX48A@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzMSBTYWx0ZWRfX3lsM7QrI4Kzz
 W8gE4X5tg4gOd4kEdnanMHxmfXFYL82tzkUqpI2q9m6kyc/zYt789HffEI6G7qpIWXeG0lWbKCr
 evIjIm2VgKrutZcWaIJBk+RnPKg/5fXwhir3cJhRLYPKAoA94FQPMrq+5rPlbrt+FZDBFZYuhHF
 qnZ7Njqp+ecfb/1LmMPqxwiPwl7Yi+qR2lSraXTmqG7OyD39fD4FqSVVcfej8wTjb25O/I1UPaI
 pyGcOUF/CT/v+tdPsM3iz6MzvseKp4SsQWAy2+xlXskVfgJuIqr445seTc35fSavi4v32wFXVid
 TwGS8nMG68Qe6g7SUp4txuVc9DYJlL7KKPG7fOXSAxIrdy//tYXV8XeG5e8K/UtEENi+XxWtQ1/
 Y9cKhLCggiRXhka5ISMm1WjnXRzauQkHNYqT7MP6f9qkUPbz7+1MZ60TyINjKyZ7MBJYjBe3
X-Proofpoint-ORIG-GUID: -UJCUH15OSRAQgcwHvy3tIznlW1p42Zy
X-Proofpoint-GUID: -UJCUH15OSRAQgcwHvy3tIznlW1p42Zy
X-Authority-Analysis: v=2.4 cv=MpZS63ae c=1 sm=1 tr=0 ts=68755fab cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=B0QqisOVu6ZhBNclzXcA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140131
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 14, 2025 at 10:36=E2=80=AFAM Dale Whinham <daleyo@gmail.com> wr=
ote:
>
> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>
> The OLED display in the Surface Pro 11 reports a maximum link rate of
> zero in its DPCD, causing it to fail to probe correctly.
>
> The Surface Pro 11's DSDT table contains some XML with an
> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> (8.1Gbps/HBR3).
>
> Add a quirk to conditionally override the max link rate if its value
> is zero specifically for this model.
>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/d=
p_panel.c
> index 4e8ab75c771b..b2e65b987c05 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -11,6 +11,8 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>
> +#include <linux/dmi.h>
> +
>  #define DP_MAX_NUM_DP_LANES    4
>  #define DP_LINK_RATE_HBR2      540000 /* kbytes */
>
> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel =
*msm_dp_panel)
>         if (rc)
>                 return rc;
>
> +       /*
> +        * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro=
 11
> +        * reports a max link rate of 0 in the DPCD. Fix it to match the
> +        * EDPOverrideDPCDCaps string found in the ACPI DSDT
> +        */
> +       if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> +           dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> +           dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edit=
ion")) {
> +               dpcd[1] =3D DP_LINK_BW_8_1;
> +       }

Not a dp expert myself, but..

In drm_dp_helpers.c there is dpcd_quirk_list[].. which applies quirks
based on the oui ("Organizational Unique ID") of the dp sink.  I think
this would be the correct way to handle this.  Although I guess you'll
need to add a new quirk for this.

Idk if the surface pro 11 has multiple different panel options.  If so
you defn wouldn't want to match on the DMI.

BR,
-R


> +
>         msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pane=
l->aux, dpcd);
>         link_info =3D &msm_dp_panel->link_info;
>         link_info->revision =3D dpcd[DP_DPCD_REV];
> --
> 2.50.1
>
