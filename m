Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA984B9CFA8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 03:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4662410E031;
	Thu, 25 Sep 2025 01:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZDayied";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B2710E031
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 01:09:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONZYVu027782
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 01:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DbUhjN5CIGWSt9WkjZTIH5uw
 xuwIn+CRrMV8Oz+n67A=; b=DZDayiedObjYn5sPShaRMCrXuWpgoG8g83mwdC4o
 zsMM3TiN5iB2yOV0oFbCpRNLPXroSzKuTXbgcMmWMJqqLPYoccmqPXh5S3sdhveO
 90i6UqZUOoLUIzAQIprL4LvlqoKvnY/qyvMPXk15pTbRxpFxu1l703rrZCGLPQW8
 n0SDz0Ysu7umuMbQpcUQIAe6X2HV/rsTvLqCNHocMMTmM907uRrrSY57evXZYmdl
 F7kftmcyzY1f1+wiVKlAHPxZnooiow4/hDHVgvxRNOJzOhausCigu1YJmwAo+F7A
 9rgXQuZXjCdk7eM4Uqm1vmfru1RExeCpeZPjiFmaKBff/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxku3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 01:09:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d905ce4749so8576201cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 18:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758762591; x=1759367391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DbUhjN5CIGWSt9WkjZTIH5uwxuwIn+CRrMV8Oz+n67A=;
 b=Ai8f36qbL83ijYLLi+c1TRxNnRyBiG4ehFYE3TUlpIdt3Y/8KfGLvtcsMK6HRG+7/E
 aHgEORstUFuMNJCdhkm8irfSdq4SwZMc4cpjx3ajvm3tqdRKiWR7ojazQB9vsroYH5FL
 Rll4msnuyoby4oeB2eSYFebcCFwu4duUaYQTKc3WzQB8D/27exEGZP0QzgrdaJk5kLP6
 8+4bT5YxektMa7Q0HDo3mZZ7AEabj7761Lnq7oU1HijDFZRBuUCQVaFrHKMSsamX/klE
 lrceFkiQ1eDQa9Qb9ewnNc4ea9+CVKr5bp4UIbEgcVQsThj3ExBBbj2pefmaN6P/MRwb
 yizA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrMNSgH0foXZiZZ5pXcAXnMqJezLwsc6pbVfW5dtMIz4q5smlxSrk9YOvs20HYtnvDiNyy1WioTMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI37kl0cK9OR5wCNEfETGpKqxKSTVa4OqJsQoWWhrRnXfV3/Bi
 oDDsz6eqfXYEFRYreBSOl7Bq1WCp6ouo+cW1bGgipjNSu7ykWXAYLWdl2gIoyv8DFY5r4G3m0ap
 WsXL2KVMMZX7kDRWZKUPIpoHxClx428w+SPbovg0zb9CCviE3lebNG2dTsUMSKwV1UiYqRMQ=
X-Gm-Gg: ASbGncv0lWoGN262ZzLeiKaJZ+wkdjNW0Z2fV61K8IV01HZ2ecelqHMn9puaqmgKAsH
 EpMshPBBUwCwTxgBkzODVzETNwYhxQQM1pQdGA5p9PyXZt+PpcVcbSlJHrtQzb2tMMumc5I2ggg
 aRSH/c7Op6jt3Kz4KmovZcdqlVr0maOx3phfrq+YZAVjRPu8GZ9Ly8+FpuUa4+jSdz2J/UixE5d
 8i43DWh1TD/FfLbf+jg/7WHrvSh3+GQ/eI8xYWZ/QlKprNzkA5gQsbphacYIHfWnMMQ30p3rVo3
 oOmELNpQ+K0t/Do1PWnAYHEzcEaft71pUgWCBpuLbhGCnJOBO7ZsuPVUnaNJ8dFkgf2p6WibDu1
 4TUggtMGYBv8CnjIu59KvifVp1vyKmJJBNW1KHDmXnwKH39v/CWol
X-Received: by 2002:ac8:7d8e:0:b0:4ce:dcd9:20e5 with SMTP id
 d75a77b69052e-4da4c39b63dmr22908821cf.61.1758762590693; 
 Wed, 24 Sep 2025 18:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHy06/44VJG9y/4ON5huaolTpEddWVJd1dr3xZtLHQ8wyGirA7dIu3ZPD6BlpqavkK+a5x3g==
X-Received: by 2002:ac8:7d8e:0:b0:4ce:dcd9:20e5 with SMTP id
 d75a77b69052e-4da4c39b63dmr22908561cf.61.1758762590203; 
 Wed, 24 Sep 2025 18:09:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a3252csm183105e87.119.2025.09.24.18.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 18:09:49 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com, dmitry.osipenko@collabora.com,
 granquet@baylibre.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 amergnat@baylibre.com, djkurtz@chromium.org, littlecvr@chromium.org,
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver
 unregistration
Message-ID: <72pgsr4birfy5wtf5umsfkahr7tplnih5wxoj4x33igapaspmg@7iafkarq4hzg>
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
 <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4965f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=O6Y6ztsS-7Sf4rctI10A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: JjnHLNROUwVVnNhBlzJtjnG4BsNAXYO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX3dgsf7iA++2I
 TlcPZgGKFhiRJw0+M82Dp6G8ymQu3OPlmIAqxvsKTA8KtX+Yvx1wfMWrpMcR6BtIL70kKT9ImP9
 187hWPzGD/4FTAHgdQi6omX7Aw7QMveHRzhIuzIqmyn14TTWwTxfqSrVxPSVk66uXJ1+f/gMoTi
 WKsgxkago86dzspJTQskp4OSA2VUvO4AMKT5W9HN6LAXpDznOc3jphY4qCtPjB3Vju4jiIp80k/
 e/mQFCYpUnXfpP0RqoW2D4Qu9k2MjZx8sFktXtNR8XwNLz9vxxU/rUMyfRzVg1c7k/thT2YGunx
 deYMLtQOHEP3aHPe2hcChY3ZI31Oon3Th3r4OrmK+d5bM9PqWXh5V0zEq3rnfcfaVXm+FXrjqVW
 Rho4YW0N
X-Proofpoint-GUID: JjnHLNROUwVVnNhBlzJtjnG4BsNAXYO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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

On Wed, Sep 24, 2025 at 12:37:06PM +0200, AngeloGioacchino Del Regno wrote:
> During probe, this driver is registering two platform devices: one
> for the HDMI Codec driver and one for the DisplayPort PHY driver.
> 
> In the probe function, none of the error cases are unregistering
> any of the two platform devices and this may cause registration
> of multiple instances of those in case this driver returns one or
> more probe deferral(s) in the "wrong" spots.
> 
> In order to fix this, add devm actions to unregister those and
> remove the manual calls to platform_device_unregister in the
> mtk_dp_remove() function, as those would otherwise be redundant.
> 
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 

You can save yourself from all these troubles if you store the
registered device at  connector->hdmi_audio.codec_pdev (see
drm_connector_cleanup()).

And of course, you might use DRM_BRIDGE_OP_DP_AUDIO in order to reduce
code duplication.

-- 
With best wishes
Dmitry
