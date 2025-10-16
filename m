Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E4BE4050
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5D010E9FD;
	Thu, 16 Oct 2025 14:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oK0IvGUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBCC10EA04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:52:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6vtx0016723
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=; b=oK
 0IvGUFq5Jpvs+nDFM/Il2MpT/ilhF7MHPLO+EQjXbkTN5WAB2rI0VHOSOOV+Qzxv
 sRtsBKGetq9wWxLEcY2lXvRoMYL7LPpZ9pIVBfAimdy6R2mv9p6gAudwk8iSrs25
 65FvBqQsyi+Yt4UDL56r1HgrPj1Jwtkn5AOnrPf0622q69XSNno8TLBKC0CUEYol
 ixpON2jXbKn9SfLTwAQqtm6rDhMB2kh0BfyW/hagjxvIxYHeAEDIseAWzJedm9W+
 vK8BUcdjcOH0s4pKDHXdtZfLjAruVuPpD/VTQr//0Fa2Z6QX9Ou1aNUUAQRav4qz
 6q8Ce5vsU3zTX1Onw0lQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtdmg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:52:36 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-3c96de7fe34so233313fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 07:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760626355; x=1761231155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jPmtY2bWstZxGYrHD2oLA4kDgMlBAGLM7cSsgPby8R8=;
 b=AvPiocHfDEAQuObi8B8n1RVCXtyDo3vUvPT6VeF7/CCxhpoIo196Xv3D0mrf6ycyFm
 T/aoysdUWGntabUSvNLRLiasdwc/faL+zSzqj4cRsuAmkwOcFM/xuGrty3R853SsdTMu
 6CNQCTNSgn8qsyPMsu1ZHvK8JeTkAVht0+icZfsszopW4PEc6dd+Pjh9q8Z/ECR/dXqN
 ywPb+YCwNn5mgErpqKna75vPrdCUALshpcndHfNB5oqqDax+kBdo9XapYTxrn7nwKhtb
 LfmgfNDncfAgV6w9P3ergAnd43YVpE3TEktvp58kM8xA761i3W6xvZymMNLNuFsWFFeT
 P/zQ==
X-Gm-Message-State: AOJu0Yy1OzynyMLCrDL47QW997XQgKuCnRuzWxaasoYR7L1JSGLL1VRu
 ZKPKWWXzlT6vQpTrS+trPJajquOaXAWoF3EXmT+uavSiFaX4tfwMD7Acw814kyMGn/vrIKdQNOY
 OUbUZvTCLP5A5GXM0YUeB6Iasu7MyQ8aqGOGvzVgvr9FbogcOxVzQoyVUSN12SSbNNsCGSXgX+F
 oAd5rKo/QGQM18yCUmRzy9hFkuYY+Tu9ZA8JjenynM15xALA==
X-Gm-Gg: ASbGncsnvBT2beFTFsCGNxxVUN5Ai+LfD0uqFrMsmgTd9HI/zHi7AaellEd2INJ9v2H
 9HUeQrPyuEMyT5orGvlrXk3rtc+caFoEQy879+PpHONfSzkYEdtR/6dcSQCLW+R33AMDb5AlP/S
 NmErPK/7UdjoF6B9QjdpOKG+EEPJ/Mz67349Wy0h9S7p+BRkzwuCNwm2mSUsOvUyJm3p8byOQaR
 Q0LqBUK9yJIKLY=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id
 586e51a60fabf-3c98cfa8295mr10085fac.21.1760626355261; 
 Thu, 16 Oct 2025 07:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF39ocujuIwT0Et62sHrBT+rRRN4wBRxOHxmKLmre65EnhOwqDPEsCuGBua+8VJiCAAa15gVkxk2D9mH6TwzQ8=
X-Received: by 2002:a05:6871:2e88:b0:35d:a9e2:fbd1 with SMTP id
 586e51a60fabf-3c98cfa8295mr10075fac.21.1760626354773; Thu, 16 Oct 2025
 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
 <20250718105407.32878-2-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-2-vignesh.raman@collabora.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 07:52:23 -0700
X-Gm-Features: AS18NWBmqrEUHFQlSWdIGqm2-_tBPDNsmr766wJpJByzaFclGFLQ0RGnzuLEsPQ
Message-ID: <CACSVV029ueL_4Y5irmmOwy_9QDQGqDe_1wCGUe22FdefQiNjkw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] drm/ci: disable apq8016 and apq8096 bare-metal jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: XnLmmOe__WgERzBFemf4m4UwbHCSNTPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX2TRgdK95Vb4H
 ySm+kl7qmo2w0NIVGJnPXT9gG04Eat6c15jfnesp5yxdafvW9oPNxkERxdqIZRoZhqbLCg1Zows
 N1+ExxdcU9xaTIVLEi44pdH/vXQMEhMPWigNW9vnshJWcduK+hmu8nLwOUDP0knm532okWKAq+v
 W7eVexKqG2U+orL/MB+5thSmZNSibFCQFbNV4FofqU31+bojXafCcN/HKcEw3DO0+iELthRdGZw
 PxYjBE4Tv/IVGSjH7xxFCu9WJeqfrupna3X5y1DiT9f85VOwpLhMw03Y3hIBpor7MeG+LtRwCme
 bDo05a+lCkarDl4JXhhf7IM3q6BgAWhd2gp3nYvniK8g+aRC+9B1LamLroDWBNMlvcJRH0U3BAH
 xNiTa2iQKA62gFq0YUWEE/5jUF4Akw==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f106b4 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=Gxbm4VOBLxWGKnsTXboA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: XnLmmOe__WgERzBFemf4m4UwbHCSNTPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
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

On Fri, Jul 18, 2025 at 3:54=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> These devices are being moved to LAVA. The jobs will be enabled and the
> job definitions will be updated once the move is complete.

fwiw, the runners are up and running in LAVA now

BR,
-R

> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 81147e86bfd0..53d19ffaaf61 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -148,7 +148,9 @@ msm:sc7180-trogdor-kingoftown:
>      GPU_VERSION: ${DEVICE_TYPE}
>      RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
>
> -msm:apq8016:
> +# FIXME: Disable the bare-metal jobs. These devices are being moved to L=
AVA.
> +# Once the move is complete, update the job definitions accordingly.
> +.msm:apq8016:
>    extends:
>      - .baremetal-igt-arm64
>    stage: msm
> @@ -165,7 +167,7 @@ msm:apq8016:
>    script:
>      - ./install/bare-metal/fastboot.sh || exit $?
>
> -msm:apq8096:
> +.msm:apq8096:
>    extends:
>      - .baremetal-igt-arm64
>    stage: msm
> --
> 2.47.2
>
