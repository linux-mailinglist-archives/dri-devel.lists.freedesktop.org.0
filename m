Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D7A75BEF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 21:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A2210E28B;
	Sun, 30 Mar 2025 19:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki1PSypQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51C710E28B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 19:26:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDlNqV023365
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 19:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pAHgTy/CACDJNBcxbiqcZgMo
 cw/wyMoGwl1/5JsSoqg=; b=ki1PSypQdYxX22g6f4x0HgB9VJNCi0zLqJxdUL97
 SacGa2FmMl1rO4yXCwd3SsJpWoDgDlR+UB0le2RVqZ7PliEKDVeun5MqqH34kTnc
 3wjlqOi5TGUGFHWL5QaBOZC6NVTn8YnSz0n0q2/FYCMAVfX3SwR1J9xQDm+Yqxc2
 10V9ZNi5ACoB1N1sdbQjyhRQgH05XfPm77nRg9JDEl9aTVt9MmPfvi7slyVTqsvB
 fO0at1J7RajacBB4xNqwP7HEcL+vgaffLzOwdMcPnOisB/s5G+MYNzdVwxPgKhXc
 rFANVRK3vLdKKY2prnv2rsZEWucFTnGyU5Nf5Bq3nvUsWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1aqfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 19:26:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e703so701543685a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 12:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743362800; x=1743967600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pAHgTy/CACDJNBcxbiqcZgMocw/wyMoGwl1/5JsSoqg=;
 b=lmZYsH+z2l1vNp6Hi4+md396yuB0M95lscd9SHqJUXIKgrUay15WRcehmaS5aHTg52
 U8eSYDWX/n868hkagi0YVjRo6JvYmp0WcPdkFa2CjZir1BlUQP+pSDD1LCIlY17pqxcx
 ID1skjiuGh+U/1BWJxfg7G41COhtPFbyuQLImLiCIag+pWCuXjJOQwKNE8oC3PQuT3YA
 f6HTxsuATm13lRrpm0MWLnyWCENiDYTDYbgvFUU4GuCHjKCPHkKKQzlXS57clsaOr/9i
 MY1/pC5uWpkmBMjqCxEhs0TqwR3vireHckwRhoPwkCF0VMrwb3+qvIfXb0XaK9oKhRsF
 rE6g==
X-Gm-Message-State: AOJu0YxgnEzSrSWVQtqqR9rRF0ILYit63wCSAD6ovBzIEVhwXJtTJFV+
 Fa/9GZuqhWpOKC/81PGttDIY+WkIl/ZgCureYrmP0/3ranSEY0GwrABLlKOsq6RJQxXq57hbJNP
 JhIPiga4uE8NyQnuLrnpoxLxaZwVaxxoy2VWAXVx12PflVMI5MNGlPDv8HTKGfXw4YTo=
X-Gm-Gg: ASbGncukVVml4N1dGeqVj/ZHGKxkh3McKNOoz9qW3Ae6scy5iGhiYpU3XDuKx8753fw
 4l5H55CU2hWtnnsDpyjL8e4Hr6vkptFiNbLUUiOXIUtVpM0UI9EDeFBDSL8aEKodQmSsWruMBf/
 LPl9hJfDMeALwzJ+d3duUczbGZ9eXOSOmqA0MhymA47OJlaGsZiDciOmNhIPOxnudA96PKRCxzq
 qgpDef6dto6USSzr5z2EApPJA9DjtsEPgFMI5JS8aVcPuYRQbEDtrydx1uJgC2jG4Wv/8VITk2k
 WK5Yf3QogLuNA2s6dNi3TrOC+LIrnc9K9b5wnGMpEbCMQJQyDtylOIy2+LmUvxi+hoHBLBvweQZ
 jcY0=
X-Received: by 2002:a05:620a:1aa1:b0:7c5:5fa0:4617 with SMTP id
 af79cd13be357-7c69087cc6cmr977665485a.40.1743362799740; 
 Sun, 30 Mar 2025 12:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuzwPAeNbLcInRyGKSU3ltKyTKZ5JZ5WGJJjb7Pq+vWyVd70VYxdrssavMwtCrSJhB7YhpgA==
X-Received: by 2002:a05:620a:1aa1:b0:7c5:5fa0:4617 with SMTP id
 af79cd13be357-7c69087cc6cmr977663785a.40.1743362799399; 
 Sun, 30 Mar 2025 12:26:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0959f429sm949528e87.212.2025.03.30.12.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 12:26:37 -0700 (PDT)
Date: Sun, 30 Mar 2025 22:26:34 +0300
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
Message-ID: <yyxqg6odzlac2434kmzvjccguf6cehhotat2m6r4at7o2ldiuh@rl7y2vv4hetj>
References: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e99af0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8
 a=rfKdTcLzpojuHggjPigA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: _NIfWZ-D2DZ4FBvOlO2kdP8g6yKv-8nC
X-Proofpoint-ORIG-GUID: _NIfWZ-D2DZ4FBvOlO2kdP8g6yKv-8nC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=860 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300136
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


Almost forgot:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
