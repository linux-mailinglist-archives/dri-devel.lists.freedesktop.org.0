Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D931A89B7A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B48010E736;
	Tue, 15 Apr 2025 11:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6HQItCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1233510E73A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:08:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHQF005246
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wK/JFVYlOAXErlNkamOHP5njDdOfVrTDiQoYt7ITYKQ=; b=d6HQItCECyDmG7wO
 X8WhwJIvKV9ZaySz9lxRHK+O1V/8I4z+0o7aDBALfFpSIUkltISo1Qqhlp2oJQ+K
 Ax8guywMPt6HXy5Pl68I0bkYi40S3LYvCuYFimu3VrN8LGIHrsV+kQaDfbUVBDVF
 tnhaUBK+DSEy1yvAT65uZwoTIlj9DlySBq/AJaIAkw3dm3W93Ylb3fFnpPZH3sbu
 CY8Ozr1RDijt4V7BC86NPrpOKY79CuV1r3hKAPgKbm88G2+TxBDj9jH04mFC4/Ql
 JtlEtQGc5GP3YDjFygV2wqwZwga15SzDyqlWcSKhvQu0VWwYYfaeon6u9gpcz7eP
 F4+VCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqktg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:08:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c543ab40d3so796073485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 04:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744715290; x=1745320090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wK/JFVYlOAXErlNkamOHP5njDdOfVrTDiQoYt7ITYKQ=;
 b=qtMedI5Hm8AgOlnT+NxRDYdzA91M5V08QPkZ1PpZg+c+SYnctipuZSdJvAbaKbDaqf
 A0+U9K0QFidsHmYa9q1T2yInvuDDAe1pi4Pyn7PEDiy+aJ8LEkN1AsbTLq1CPbHgSV4d
 j0Py0SBFYNVSC2SQtgBiCmIf3jYUaO/qo2tv8DcFMaDnrOXAXWPPw+/aYJQ6Ru52OVPH
 0XsP2RnK+9nb7YRt90g2UbbogqvwVvk5jCGgli2SwIreAnTKCVchda4fRI06rBnhPuod
 0CQ81M6rky/9B6/bUwk7BnR163y8iYFnWOZWgxdbftu4tJ0Jh/CBmXwt+Sqqc7Lnv6yG
 wIrA==
X-Gm-Message-State: AOJu0Yy3xE+mGhG84y8zp+icXIrjgSh3sIqJtZ4KNA/89mpJwV5TOnUt
 ZG62M3Oyy3vimy1hWKm1Llyb4pyCKSBJYv6cBGWT6XPUZe6On45Mnr96jcZXA2j7sTVELL/FGEu
 NxEoPW+XtaPd098YrIx8cSYBMhbwVkzMLs2KmPRYs1N3mquTQvP9T+Giv0LXG49VHp4c=
X-Gm-Gg: ASbGncv2hGNFwZp6zLcFvMtarmkKWH1PKg9PrUv29ylIqFEuJDvU7kb8gjW1eDfRkT4
 OhLHMCR0K7pzaBEElQaHHvuHi6k0Dp+Fb3C3kIGDHZ5nBgrTCuf0PvbOk1R3nhkjO8A4PbgTeLY
 85GFL99l3njzCQF8AlPTdKDwWDwaDRZjorqesD7XqI6ZDA2+Ko8BHFg6dk2s8x66UcW33kxVyS1
 fP908N4VC/2/M25nT/V31bNYSilXPc8WRgvUn+Z/0crXlewUOihSln5OMjmmN3pqHJJoujKNbGq
 7ZR3Gzxoue3v5ocF19Kj5DTunUBw5lwE2QSXvvT4bBIsI7PBqGKm6iaVKkm08D8=
X-Received: by 2002:a05:620a:2906:b0:7c5:5692:ee95 with SMTP id
 af79cd13be357-7c7af12ae32mr2051838685a.51.1744715290124; 
 Tue, 15 Apr 2025 04:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoUA8N73ZaepWJT0jZ3DvxSynJfsHmBtSCM5bS4zH20AS44fmQeKF7Dcsu9apRm4T/YkvPPQ==
X-Received: by 2002:a05:620a:2906:b0:7c5:5692:ee95 with SMTP id
 af79cd13be357-7c7af12ae32mr2051835685a.51.1744715289698; 
 Tue, 15 Apr 2025 04:08:09 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d56b5d846sm443672e87.181.2025.04.15.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 04:08:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/3] drm/display: hdmi: provide common code to
 get Audio Clock Recovery params
Date: Tue, 15 Apr 2025 14:08:01 +0300
Message-ID: <174471527399.25276.2451594776232891809.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wEdZtByas3kHJSB8_yqfNAswu7p9l0_7
X-Proofpoint-GUID: wEdZtByas3kHJSB8_yqfNAswu7p9l0_7
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe3e1b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=1CIDf1XVFyXLR-mqbVoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150078
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

On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/display: hdmi: provide central data authority for ACR params
      commit: fec450ca15af63649e219060f37a8ec673333726

Best regards,
-- 
With best wishes
Dmitry

