Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E933ACDEA6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 15:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3667210E722;
	Wed,  4 Jun 2025 13:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY0q+1IQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8B410E722
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 13:11:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554AhlVW022637
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Jun 2025 13:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XQvsxDPGz+N4nZmV7ksKBXsD
 n1FjHMoRZnCtDTtfld8=; b=LY0q+1IQAxk4WK8T0Neho23c3g1xaCJAGYo2Ma0D
 ZuBYCbNpeTYdqVof2VF1lmWc+EpctiqGqg2g/J6udDys6cdvvuVXSscc3aM6HOJn
 0gwlcwzKjf6dVeDq45YHDv9l8WYWlYc9Mcz8MspkCkDSy7OP6nPSSn+ZM0NZx0DJ
 rFgiOteNADm/K6KoQSItmwi0SDrLwPlEMeMQcchC8uknQvUE4bzTx0KmeJfQAfAK
 JH09+Hjc+dz+Gq+9HgkEbp04gGFxPtCYjAkOdzzy/ghOz8ctWuZGZvvnxLC25Au7
 Zd0kV2tbCEZRCx8dPKR5SCqJNpwlLt/wvj1bbL0h0ojK3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn00c14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 13:11:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e2872e57so1155703185a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 06:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749042708; x=1749647508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQvsxDPGz+N4nZmV7ksKBXsDn1FjHMoRZnCtDTtfld8=;
 b=e1x3nE+fBKzKLNCMr0a1xCCX2UelszVgywUhA3vKNffAv53l01ET/qrMCfEsTonKDl
 XTEXVRwNRps7NCbl9S3zBVF0AjOe0W2I/nGkMuXER8E9akcdMH4dlREfhVPVDI4n4sp0
 wm7K+TlnQvgclXoknwxac1uug2FTf355NDuT/zAFKOY2RBXDS0R3/hjIZ1v5W1kQorOi
 Hw52z/7hnzlngsUXe8BWlp5BJg2R0f85qzrgoEk4q5HB53hh08k8a2Tc0H2AZBoSPWoa
 FKLPOhTkxQZQBR2dWcyAevy9wc8s44Aeipy10Abqh8CSlKhLIoK+MrTSTjNhSI9raHMQ
 FyGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGerxs30aKSpVG+PoBUJ4JI2zZflqtg2fdCAYZYD8l0or4h+MPxWbvfVm0REignzo8nNNprKYfRCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzERavaRATOk2c/QkGm13Q14SI2rwvuRPc/AQbVKkQS/VBGfABl
 A3D8FHHyAMXDncCVcEeycB0xxvUig0E1+uxF7w4jw1x5HHXorXWgWVczWd8juy7mHBBzReUxjIs
 xoWURMWMqoQs5io1BGE+S9EFe94wjGkbHuRhGUOOCNdY6INE7ObTLlj2xPhrVjseMU+eqFDT8ce
 YEMvDMgQ==
X-Gm-Gg: ASbGncvq6MqUD8dPN7I7WoRU5Cmb4AI6fyLBQPllN4L3AvoUvcCNyo504gvI5HeZVIK
 /9foSuI9a1IYSsaHaShwSOZ+bwumQFPgZ3qoXgXFFC8VIcaTW1ATPzgkJHlWreksDeogtzSQ+QT
 4QgcykafD69jQfxV/CoH2BZ8oh0YvonrAN4lNdMw/NVVKQQth7XLx+6WZU4iDalSYIsV7uqdftK
 7jmQelKygmhZbf1G5i27zz1OpLoEMRJ5WIEGaMr0AlpYuW76L6rDZ3lrBG6EMRizCe1zk12xLhn
 sAkuTLZfluNL963V/oQ9mk+RO6Lr3rN6OHBjaFP03Z9iZaBicSAFTyuvHHZ/OZSWTA6lilyScYk
 =
X-Received: by 2002:a05:620a:3185:b0:7c5:a31c:6e72 with SMTP id
 af79cd13be357-7d2197ad2cdmr446706385a.0.1749042708126; 
 Wed, 04 Jun 2025 06:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTQa9wd7fIpEVhtGaVsz15AkiRD0CT3Fr8ffve1pc6iUT2fQdSSm5Tp2fkdgwlgyGIAfpLLw==
X-Received: by 2002:a05:620a:3710:b0:7cd:31ca:d81 with SMTP id
 af79cd13be357-7d2198e92cdmr491537685a.27.1749042697421; 
 Wed, 04 Jun 2025 06:11:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bd2a5dsm21439851fa.103.2025.06.04.06.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 06:11:36 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:11:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <ifj3ipdlxxv6dnste76q2wwmy4dcvshnfkqekdndg674rgsrdw@vgj2aahqqsdx>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
 <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
 <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
X-Proofpoint-ORIG-GUID: pGopQxBnlAKq28VO3bdqWggQ_4hnNCgg
X-Proofpoint-GUID: pGopQxBnlAKq28VO3bdqWggQ_4hnNCgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMCBTYWx0ZWRfX6CDrcW71JYLF
 mH0Emr9vCzyIdc2zsmuxARg2MypXw8TVFcfbRX3m7J3woAiso0kR1/0WLZuBmxeulGpjqKDV2+y
 3dxeAQoswMSbxxFakdIvcDd3VDxQbPsZRus70CXKUTZGYyhAd6e4U++KA4RacpChSG8zVpOKvvz
 FB64DpNMH7VLY369CjzBQTKGOR9w960Nl4Ul4DB2a68LEm+kEvX75QEa+9YkEBYjTpT1GdvGi+S
 fijrg9f2wlKW8MLCSSE2E+4brFWVYnvw+2j2Zya7wY8YwrGohC4y3eJpmIROaeMF94L2vRfT34P
 4lcLeH1NJZDxFxKz0jWTEWvwSqsX049KVp+eTGLi4S6Zx9LHD2zNA/uayMAWuB4FwpkkH0UvetB
 AcAip64FznW2UHmY1Ul1blryN9yp1oX99bQx0yJcYBHeq/b0ZwCXTQnsOtqHDVHUEZv4GgV3
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=68404615 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=pUtLPF_adMnqGKIR7MYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040100
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

On Tue, Jun 03, 2025 at 10:16:14PM +0800, Xilin Wu wrote:
> On 2025/6/3 22:06:36, Dmitry Baryshkov wrote:
> > On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
> > > On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <lumag@kernel.org>
> > > > 
> > > > The MSM DisplayPort driver implements several HDMI codec functions
> > > > in the driver, e.g. it manually manages HDMI codec device registration,
> > > > returning ELD and plugged_cb support. In order to reduce code
> > > > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > > > integration.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > > > support. Present DRM HDMI Audio support has been written with the HDMI
> > > > and in particular DRM HDMI Connector framework support, however those
> > > > audio helpers can be easily reused for DisplayPort drivers too.
> > > > 
> > > > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > > > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > > > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > > > has to manually (and correctly) implement the get_eld() and plugged_cb
> > > > support.
> > > > 
> > > > Implement necessary integration in drm_bridge_connector and provide an
> > > > example implementation in the msm/dp driver.
> > > > ---
> > > > Changes in v7:
> > > > - Dropped applied patches
> > > > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > > > 
> > > > Changes in v6:
> > > > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> > > >     callbacks to the drm_bridge interface (Maxime)
> > > > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > > > 
> > > > Changes in v5:
> > > > - Rebased on top of linux-next, also handling HDMI audio piece of the
> > > >     MSM HDMI driver.
> > > > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > > > 
> > > > Changes in v4:
> > > > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> > > >     HDMI driver.
> > > > - Drop outdated comment regarding subconnector from the commit message.
> > > > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > > > 
> > > > Changes in v3:
> > > > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> > > >     (Laurent, Maxime)
> > > > - Dropped the subconnector patch (again)
> > > > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > > > 
> > > > Changes in v2:
> > > > - Added drm_connector_attach_dp_subconnector_property() patches
> > > > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > > > ---
> > > >    drivers/gpu/drm/msm/Kconfig         |   1 +
> > > >    drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> > > >    drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> > > >    drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> > > >    drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> > > >    drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> > > >    6 files changed, 31 insertions(+), 170 deletions(-)
> > > > 
> > > 
> > > This change breaks DP audio on the qcs6490 platform, tested on kernel
> > > next-20250528.
> > 
> > I can not confirm this issue here (though I tested it on a different
> > hardware). Do you have any patches on top of linux-next?
> > 
> 
> I have this patch series applied, but I don't think it could be relevant:
> 
> [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
> https://lore.kernel.org/all/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/
> 
> > > 
> > > [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
> > > [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > dai_count 0
> > > [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > Missing hw_params
> > > [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > Invalid parameters
> > > [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
> > > hdmi-audio-codec failed with error -22
> > > [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
> > > on minor 0
> > > 
> > > Manually reverting this change solves the problem.
> > 
> > It is suspicious, since dai_count can not be 0. We set
> > hdmi_audio_max_i2s_playback_channels to 8, which in turn should set the
> > hdmi_codec_pdata.i2s to 1.
> > 
> 
> It suddenly comes to my mind that I'm using a kernel with everything
> compiled as builtin. Could that be a possible issue?

What kernel args are you using? Do you have any kernel debug options
enabled in the .config? I've tested the kernel on RB3 Gen2 and I still
can not confirm the issue (I'm also using an all-in kernel)

I've verified that on a running system I'm getting three HDMI audio
codecs (one from LT9611UXC and two from DP controllers). Each of them
binds immediately to the driver with no issues observed.

-- 
With best wishes
Dmitry
