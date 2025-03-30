Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D168A75AF2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 18:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FD310E26A;
	Sun, 30 Mar 2025 16:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa8xr9xf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007F310E26A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:36:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UCwfV5016475
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J9IbJLHzN5Gek81KZ8rQbP94
 oxIGmfBdFVQn3sF3atY=; b=fa8xr9xf4VRxYcMRudOdck7gw+gOU0yTkctt0jYk
 OoKRdloSvJnZg+yq5y5IUKAblD3jQ0BqZm2JAalm3ZIfqfNvddLM25E701Duy0w+
 2gjk7tJpsyPhYxk4qjEIGj6rCS9VJRuLWHEGTytT8qZISGtZAVHGy2XK9KABRCic
 55h4i30u9QRfle6nLc17EvVFxUKCScpHrUAZFkFv9NIyPkiCk1a4gdDduqGBEFOd
 wCAV+oI4jfGR08C9gVFaOQRqEekXCvLuqBCPkf5rxHdKMoMpFKdTaZDNl1CIyWcd
 ISwEWHB2d7ZGUdTlXv9oc77DYnUAoMWiAQ6K075isyx14g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kjjha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:36:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so611978885a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 09:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743352592; x=1743957392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9IbJLHzN5Gek81KZ8rQbP94oxIGmfBdFVQn3sF3atY=;
 b=McwZsxCScVdGuAfFoWGdTq0uIBohkV0iKWgipKzOCdatAmJhpPs72DZfYXst+Brzxu
 gssjfqu8hjB98XVLJaMguyN4tToQFJVpcZ7rIbItmfg68zWupfdkaKNt4+LAJdvXbn/N
 oLkPVprRvbdcdeg/GZ15OwQtcjzxIJnMX0c3sWGGtCO4xt2bzVAEs5mUMQrCG9i+lKwK
 djolYy4xGaCpW4XVtVw+Semdv1ikh5e6QlS1R81njTGlCtXNTDbLjBLcUpI/qKUub6Xv
 jKTgLfpQVVr1EfNbyIH+yMqB+wtZSaNlIteOGjDYLQbp13b2Q7wmUicffiRbDFz1RMK1
 2Qtw==
X-Gm-Message-State: AOJu0YyMX/pnpH6iwFYdJZD3XDbHooAIPtUTLh1sxANvv6LGMvHrUk5F
 ajVq0jGcNZuQxZ8w3fKNlix+EXT4KN5WIIJ7oULAkUQ6g/NyyDk90vQ7MvID/XzmHZXRg/p12Gf
 gwliRQfn3LII40WAIGL4uuFnVzxne4C7jj03NVmR2fNYU7ZEutu66Vh+h78Y9na6jLm4=
X-Gm-Gg: ASbGncugLgu48bFVC4ga9M80mcva3xkYw7slzcp3Xx2ghR0OdwSqVRNHGDrdtCi9/eS
 uAZyr3v0SVUMmbKeHoMjMnp5FpaR9M75EHGPyF7Ycv9iJF7/gHoc4kwdFV2h0aWQ9n1sKFlKWWj
 4zgwBXgIFiyuEwLLSiQwbGXtkW344bs2qOGWsAm6Zqn70jmnpbnp3JnxCT7KcmMe4W3k19xC8HW
 VZtsJazDTHuPQ4tOOgudCoz6UknwV6YN6FPnBupGtIyBT8jcb/gOjudcuiBMamtx2+QYN0EYPcU
 wSi0cXnueMEmDH4kFOkdHk+0UUeSx4e7ykZp6PEXZm7Px4HGmyflCz5qiHnDysC94eZk7jt70jR
 6Qi8=
X-Received: by 2002:a05:620a:4108:b0:7c5:48b8:b4ac with SMTP id
 af79cd13be357-7c69072f371mr927035285a.34.1743352591848; 
 Sun, 30 Mar 2025 09:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEdV5tc6GnhjMZwo8TLqjXFz1vGzqWB4XFi2jQnVxmtoNtcZMKKrRG70w3Gh77iotOX99M3Q==
X-Received: by 2002:a05:620a:4108:b0:7c5:48b8:b4ac with SMTP id
 af79cd13be357-7c69072f371mr927032985a.34.1743352591505; 
 Sun, 30 Mar 2025 09:36:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0957fc65sm921069e87.118.2025.03.30.09.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 09:36:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:36:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org,
 mperttunen@nvidia.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, dmitry.baryshkov@linaro.org, mripard@kernel.org
Subject: Re: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback also
 for SPDIF DAI ops
Message-ID: <h6izcncnqyiyv7nvyvauzjftjvzyhhev6y7wbmdqjyonrdw5ho@4yclxkbukgcs>
References: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e97310 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=rfKdTcLzpojuHggjPigA:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: gCsKnMJCgLgRPHvkKCFZJP3sbJz7TKkl
X-Proofpoint-ORIG-GUID: gCsKnMJCgLgRPHvkKCFZJP3sbJz7TKkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300115
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

On Sat, Mar 29, 2025 at 08:14:33PM +0100, Martin Blumenstingl wrote:
> Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
> prepare implementation. Back then the new callback was only integrated
> with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
> It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
> input code-path).
> 
> With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
> helpers") the DRM subsystem has gained a helper framework which can be
> used by HDMI controller drivers. HDMI controller drivers are often
> tightly coupled with the hdmi-codec because of the so-called HDMI audio
> infoframe (which is often managed by the display controller).
> 
> To allow the new DRM HDMI audio framework to work with the hdmi-codec
> driver for SPDIF inputs we also need to hook up the prepare callback to
> hdmi_codec_spdif_dai_ops. Just hooking into the hw_params callback would
> not be enough as hw_params (is called too early and) doesn't have access
> to the HDMI audio infoframe contents.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1 at [0]:
> - re-sending since there was no feedback
> 
> 
> The following three upstream drivers can use the hdmi-codec with SPDIF
> inputs:
> - drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> - drivers/gpu/drm/rockchip/cdn-dp-core.c
> - drivers/gpu/drm/tegra/hdmi.c
> 
> It would be great if any of the maintainers of these platforms (Cc'ed)
> could confirm that this patch doesn't break anything.
> 
> Mark, Dmitry: who of you would take this patch (Mark via the ASoC
> tree or Dmitry via drm-misc)?

There is no reason for it to go through drm-misc, we picked up only
several API changes in order to ease merging of the patchset. This patch
should go normally via Mark's tree.


-- 
With best wishes
Dmitry
