Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C869A70384
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB2410E56D;
	Tue, 25 Mar 2025 14:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TO/ZQV6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564AE10E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 14:22:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDQDsj018766
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 14:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kp3yGWdT4AV6kkrdyjO2FJdT8nOV4kJcKTIpcQc7Pgs=; b=TO/ZQV6ZSOOIQO6/
 EtuY3avalnKyKRDIYJ5L4diQO64ei0GCwfEGLTRLRfVAUZ/dzhogZfZsGwr9LOfG
 6TsfxYd6uqNSrVZNUlLTFuv07jCOec/l3ioo50XpUDWxWIYIRkN7L3dr850X+yIj
 HNHk3Gu+WKCv8y5y1u+nxfPs/LGlnGX5jev1//5a2WihdrtiE8NxMe1Blu7DCzR1
 am8P3+vZrj7jB6YzVh40dx/1uVJIwXjjB4hDQKb5Dx190G4OrLdmfaSNIRlfSgM8
 7HORa5z9tbLv2cqroJ8L3F7PUPAVoqWOGQp3NkI4MSprpbK3KVzwcDLasnSUFOLz
 ygOT8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnrd3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 14:21:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c3b53373faso799434785a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 07:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742912518; x=1743517318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kp3yGWdT4AV6kkrdyjO2FJdT8nOV4kJcKTIpcQc7Pgs=;
 b=BZwbtdY6zn415GtKmiyD5A9Vl8sH03ELGdR7wF9XP9Pvk+67N9ZAQl/QnhCROfsMxR
 nKWzYike1jTu0oigk4zbEx+nKuMYdYw2SLE2aXORRq4hH2Ccb86TfNcsTGTuleStE1WG
 PDBxXumlmdl6Wi5UAhDIehSDRAWJRdIhQyDnyQED4RhOVa9O8GhyA1jUO6h01WPta0sI
 M74Yt4QV7phM7fE3SoyVzJT1+q1Uu0cO9w7KOlxEZUtyI/TtLlWP4llb2GfDCtgT13Dn
 TybIoaFt9OrxpstVCHfWfxiajC3k1m3QJ6GaM5RjhI05dD8c3x9DMVBjmSOTeKyvBSCm
 S3FA==
X-Gm-Message-State: AOJu0Yywhaqz5ghH0mJ6l6ObnyPOQ1FelAaQM4c65ytmNCGBPPbdpxT6
 odsq6HI4+TQSzEqBDPB1cZTsmOONJYkGWjJoK/4nnwROjF9Nyx7hCIUHqOXkQMXb2seRddQUn5r
 KPgAstpdzvvz5cWXKcj2xAaO/YhBQ/rbo7ntLmrT46qHks90fU3dEYIcJqu59p+KPxMY=
X-Gm-Gg: ASbGncuAXTZIJ/UImpMARHXS0T13EwUNMFxIjoDHdcHoRSqYKWR9HLiP2gal4AVIMiA
 tfuibr16SyF5cUZC8O3qqX3EM9TUSLvrYN+F8ZbPrstKZ3eDt/2MWxv9WXI6/SwF208PGyk+WTK
 2wYyyZNetCAt/2HFNew+VXX8AE3BOhUTPVBSF8PORK4whOOxWc83EmuVPMwEjYZARiwW+vN45pV
 e0qYlQxlyo1VSUdz6zgXMUPqTNfT4a2qvYrDHwkCpTSIt+qYZeIfeDpUgF+eXlltq6MwpyxhzLk
 sAUwa80jZXzPPUTLWU6Py8mdQYH2o34YeEfbx0Of7iAMjBzA5mw4XRkNJunXzxa5QFQ=
X-Received: by 2002:a05:620a:4082:b0:7c5:4194:bbcc with SMTP id
 af79cd13be357-7c5ba1a5851mr2078813085a.29.1742912518308; 
 Tue, 25 Mar 2025 07:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE3gf2K5kIjZtYjJH4qhQtLNFCQgnGxwMyKEgZu4Q/N9eWpJ5iD6eXdGIpzuGP7y89fDMGrg==
X-Received: by 2002:a05:620a:4082:b0:7c5:4194:bbcc with SMTP id
 af79cd13be357-7c5ba1a5851mr2078805785a.29.1742912517757; 
 Tue, 25 Mar 2025 07:21:57 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad65083e4sm1508348e87.171.2025.03.25.07.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 07:21:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC PATCH RESEND v4 0/6] drm/display: dp: add new DPCD access
 functions
Date: Tue, 25 Mar 2025 16:21:55 +0200
Message-ID: <174291251084.2000243.209850835590674876.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
References: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e2bc07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=DZoDOQWOqP-ft6bgs5oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GEmQRNbQHdYvMpcDbLNNAjLZn3c1Kg5f
X-Proofpoint-GUID: GEmQRNbQHdYvMpcDbLNNAjLZn3c1Kg5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250101
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

On Mon, 24 Mar 2025 13:51:18 +0200, Dmitry Baryshkov wrote:
> Existing DPCD access functions return an error code or the number of
> bytes being read / write in case of partial access. However a lot of
> drivers either (incorrectly) ignore partial access or mishandle error
> codes. In other cases this results in a boilerplate code which compares
> returned value with the size.
> 
> As suggested by Jani implement new set of DPCD access helpers, which
> ignore partial access, always return 0 or an error code. Implement
> new helpers using existing functions to ensure backwards compatibility
> and to assess necessity to handle incomplete reads on a global scale.
> Currently only one possible place has been identified, dp-aux-dev, which
> needs to handle possible holes in DPCD.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/display: dp: implement new access helpers
      commit: d8343e115658fb35115e0720f4761ffa0147329a
[2/6] drm/display: dp: change drm_dp_dpcd_read_link_status() return value
      commit: fcbb93f1e48a150159534a1e6ec19e6fdf9196df
[3/6] drm/display: dp: use new DCPD access helpers
      commit: af67978ee37e543e62d6d3f7eba58f8f259423a7
[4/6] drm/display: dp-cec: use new DCPD access helpers
      commit: 97f37939881327e118d6252289973c186377a075
[5/6] drm/display: dp-mst-topology: use new DCPD access helpers
      commit: 2554da0de3e8312c7149d03d702ddc6c1ff5e3de
[6/6] drm/display: dp-tunnel: use new DCPD access helpers
      commit: 95c4ea2e0329b370a53a041a19227f8da3f47481

Best regards,
-- 
With best wishes
Dmitry

