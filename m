Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DBB2F6D3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A6F10E2FB;
	Thu, 21 Aug 2025 11:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="auUqoMJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB50B10E2FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:36:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bA3x003687
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QSQPNWnbfGMjtFsswklhwMt+
 AzX+p4AHQ+dhdCLnYmM=; b=auUqoMJt+D//FknRYaolesGqAYaEt5Tz3jg+EHch
 9b0piKRxqxIqGLH1kyAu5UXmU8AIysXLWOi/wpGYGrobrr5IGLyf5wMxnt37fAkh
 FL+5OKPACmP1/CZju4gVkVn2DDVwVNQQj1xA3ETm73N1U61KvQ5eY4pfZ1uHRdTw
 F2p3b00a2ju7IJZzA31CMwE1kLpzAZTxYQvzA0IxFSX/PFubJHiiBSmRT1UJrVL4
 dkfBd45/1fbd2Wc8e5Rl4F+LALxGfZxVEoDJKI7VhwJ6OR33coeZ2VORvu8qZgVV
 Y+2r//Z3ycuHWMe10ShnG4nL3raLqC4bIlsPS/K66gaBSg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdk3ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:36:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a928da763so19808926d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 04:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755776165; x=1756380965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSQPNWnbfGMjtFsswklhwMt+AzX+p4AHQ+dhdCLnYmM=;
 b=DeYUnr7sZYt8WqDTAyNUxnBQP+CB/xtV5Joe9SSPWRf2CJcXRMQ8maYHy3aLtQijpW
 PUak3RIaPWUq5leqXODlbauODqA6UoYWfnf+xifEKRzS5Bjvv6rCxW/gkWsNwJdGG9/X
 AEFERMS1c8+IYlGbzwqXBIGOCLyVk+jUhgVS4Ud2+TPB5nEqXu2cBVBnpT7rF72Wr5ta
 U9I7gjcMsaLjTazpXtmFJf31ecHf9jPTJMpzRE+vIrCvya7MFq7Fa0CmFsRkLXh+4s/y
 6yprI8CyUihSt+UnxKf9KbWrncvKTycQdJo8q6GTMDscCCsYY/K+94iGtmfL22j6UcN0
 S90g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhFSk0Mc/6f3QhpjprheDX6tlll/E3OzLGvtA30q8YI9nlK7uqxQJ18+UpS3gNZfPuo9aWOE1g3Jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6lzfjDRQPJrFAA3VvQJeqdhe/6Y2stiBw6VGMO2hwF/e30l7n
 jarY8otYoX0+z3TgyxJmzgCWQHn6vwNDH/fDPP0GGEqKbuPmeVqEo/eNNypDsqMJALCh4FORMNc
 1qy8r9uP0/wnh2QHUhi3CuJvmcK+EROfh88v4qO15SzutqvezXFjM3j/leh92RsBxmk3q7bY=
X-Gm-Gg: ASbGncvwl+ZteLT0QmcxRCcpxbNQqwS/EJ/zsl0TxaQgeddoHT/A3pC9dUQEmsBksRm
 XdpwHZheaqGwwC+KDyp0LjpLg9ucO6RTJbjQ+ZOjiUxH13LjFzz4LMRGbMfRc4KXlD5ZRDq8bRT
 Qumw/bofV6FGCpuQyiTmcIqZz6A/iC7xff9CEsXcbSIFaF+UJGnatFmXLZeM82mCK3rckn3o7fq
 QoNIIEFjlx3zF3Lnnys1NcLZCNFw1essACnKplnwRghIuYlwaXy6NPLrM7QYq692eHYd2h62yh0
 0N3SXx3i3SDsH5hPqydeujFe9hjyTMv2QPYDxCgIieJdd6LpcS0a0i6g+ZH+FErY4ep/16uEmUe
 77xIU1/r1a38XHnRR+JVsBZo5HHR/oaJ/VCpdt/WvEPOEK4mezz/B
X-Received: by 2002:a05:6214:4103:b0:709:edff:dcc1 with SMTP id
 6a1803df08f44-70d88ed709cmr15854356d6.29.1755776164907; 
 Thu, 21 Aug 2025 04:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdXhyG9Fflih5ryMZ3T7Ocp2qP4o+AYrv/JF7jOHWIB/TtXYveUPhTv4cTKVkorOvFjzpomA==
X-Received: by 2002:a05:6214:4103:b0:709:edff:dcc1 with SMTP id
 6a1803df08f44-70d88ed709cmr15853846d6.29.1755776164125; 
 Thu, 21 Aug 2025 04:36:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca00sm3100617e87.93.2025.08.21.04.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 04:36:03 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:36:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 00/10] Add support for RK3588 DisplayPort Controller
Message-ID: <7omsdz6hjhpmzi7a2meem64dm2jrxhivczt3gdi24jyrp5lgjp@iucsgwqtjqzc>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <1ebeae81.8b20.198cc3ac94a.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ebeae81.8b20.198cc3ac94a.Coremail.andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a704a6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=s8YR1HE3AAAA:8
 a=G_1y2J3ZIfkuVtfR3FMA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: zuu_b86vb4RHgPGvjdnkjLek4Et9YAXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX9Jds0Neqj2hU
 p+/cO6i/7+brPUedMq+PJ7+ksLex1S5c0V8+g2xi/ThpTgi7C+w5LXr5aanVAoKgTYZE403pAni
 9j06xgNn8tcRD001fGfeqwgisslsgH8hpG+eFZCwMSrTNaOC/xxaHybUpvqbzsr70aBUDv7CXzb
 Ie5M7m2KzOqCRr08X/kTqgL2Rzu3r8ZyaGtx3q/qNWdB63SP9mM51hxD+oV+EP6FNV9ZLvovTuZ
 O2XtBnvwsb07HMKKcu7cYGIVExAX752BSy4yI10ZXo0QdMXClOUO80GHl3wLYeGtJloposIiPG4
 BPQss/aP6xVI0cLvWo63as6HrqM89xWtnFipSy11o/s558Oou/LvwgTAljAce7Ap9U6xI3E3VZn
 fnzr12J3xionr7bnjZKLViT0PrrhRQ==
X-Proofpoint-ORIG-GUID: zuu_b86vb4RHgPGvjdnkjLek4Et9YAXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
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

On Thu, Aug 21, 2025 at 06:44:21PM +0800, Andy Yan wrote:
> 
> 
> Hello Dmitry,
>     
> 
> At 2025-07-28 16:28:25, "Andy Yan" <andyshrk@163.com> wrote:
> >From: Andy Yan <andy.yan@rock-chips.com>
> >
> >
> >There are two DW DPTX based DisplayPort Controller on rk3588 which
> >are compliant with the DisplayPort Specification Version 1.4 with
> >the following features:
> >
> >* DisplayPort 1.4a
> >* Main Link: 1/2/4 lanes
> >* Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> >* AUX channel 1Mbps
> >* Single Stream Transport(SST)
> >* Multistream Transport (MST)
> >* Type-C support (alternate mode)
> >* HDCP 2.2, HDCP 1.3
> >* Supports up to 8/10 bits per color component
> >* Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> >* Pixel clock up to 594MHz
> >* I2S, SPDIF audio interface
> >
> >The current version of this patch series only supports basic display outputs.
> >I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
> >mode was tested on Rock 5B, DP1 was tested on Rock 5 ITX by Stephen and Piotr.
> >HDCP and audio features remain unimplemented.
> >For RK3588, it's only support SST, while in the upcoming RK3576, it can support
> >MST output.
> 
> 
> 
>  Could you take this series? It would be nice if they could land Linux 6.18.

dim checkpatch complains about the DW library patch:


-:385: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#385: FILE: drivers/gpu/drm/bridge/synopsys/dw-dp.c:323:
+	struct mutex irq_lock;

-:819: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'v != adj->voltage_swing[i]'
#819: FILE: drivers/gpu/drm/bridge/synopsys/dw-dp.c:757:
+		if ((v != adj->voltage_swing[i]) || (p != adj->pre_emphasis[i]))

-:819: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'p != adj->pre_emphasis[i]'
#819: FILE: drivers/gpu/drm/bridge/synopsys/dw-dp.c:757:
+		if ((v != adj->voltage_swing[i]) || (p != adj->pre_emphasis[i]))

-:1754: CHECK:USLEEP_RANGE: usleep_range is preferred over udelay; see function description of usleep_range() and udelay().
#1754: FILE: drivers/gpu/drm/bridge/synopsys/dw-dp.c:1692:
+	udelay(10);

Could you please take a look and fix those?

> 
> 
> >
> >
> >Changes in v6:
> >- Use drm_dp_vsc_sdp_supported
> >- Store bpc/bpp/color format in dw_dp_bridge_state
> >- Collect Reviewed-by tags
> >- Link to V5: https://lore.kernel.org/linux-rockchip/20250716100440.816351-1-andyshrk@163.com/
> >
> >Changes in v5:
> >- Use drm_dp_read_sink_count_cap instead of the private implementation.
> >- First included in this version.
> >- Link to V4: https://lore.kernel.org/linux-rockchip/20250619063900.700491-1-andyshrk@163.com/
> >
> >Changes in v4:
> >- Drop unnecessary header files
> >- Switch to devm_drm_bridge_alloc
> >- Drop unused function
> >- Add platform_set_drvdata
> >- Link to V3: https://lore.kernel.org/linux-rockchip/20250403033748.245007-1-andyshrk@163.com/
> >
> >
> >Changes in v3:
> >- Rebase on drm-misc-next
> >- Switch to common helpers to power up/down dp link
> >- Only pass parameters to phy that should be set
> >- First introduced in this version.
> >- First introduced in this version.
> >- Add RA620 into bridge chain.
> >- Link to V2: https://lore.kernel.org/linux-rockchip/20250312104214.525242-1-andyshrk@163.com/
> >
> >Changes in v2:
> >- Fix a character encoding issue
> >- Fix compile error when build as module
> >- Add phy init
> >- Only use one dw_dp_link_train_set
> >- inline dw_dp_phy_update_vs_emph
> >- Use dp_sdp
> >- Check return value of drm_modeset_lock
> >- Merge code in atomic_pre_enable/mode_fixup to atomic_check
> >- Return NULL if can't find a supported output format
> >- Fix max_link_rate from plat_data
> >- no include uapi path
> >- switch to drmm_encoder_init
> >- Sort in alphabetical order
> >- Link to V1: https://lore.kernel.org/linux-rockchip/20250223113036.74252-1-andyshrk@163.com/
> >
> >Andy Yan (10):
> >  dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
> >  drm/bridge: synopsys: Add DW DPTX Controller support library
> >  drm/rockchip: Add RK3588 DPTX output support
> >  MAINTAINERS: Add entry for DW DPTX Controller bridge
> >  dt-bindings: display: simple-bridge: Add ra620 compatible
> >  drm/birdge: simple-bridge: Add support for radxa ra620
> >  arm64: dts: rockchip: Add DP0 for rk3588
> >  arm64: dts: rockchip: Add DP1 for rk3588
> >  arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
> >  arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX
> >
> > .../display/bridge/simple-bridge.yaml         |    1 +
> > .../display/rockchip/rockchip,dw-dp.yaml      |  150 ++
> > MAINTAINERS                                   |    8 +
> > arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   30 +
> > .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   30 +
> > .../boot/dts/rockchip/rk3588-rock-5-itx.dts   |   59 +
> > .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   37 +
> > drivers/gpu/drm/bridge/simple-bridge.c        |    5 +
> > drivers/gpu/drm/bridge/synopsys/Kconfig       |    7 +
> > drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
> > drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 2094 +++++++++++++++++
> > drivers/gpu/drm/rockchip/Kconfig              |    9 +
> > drivers/gpu/drm/rockchip/Makefile             |    1 +
> > drivers/gpu/drm/rockchip/dw_dp-rockchip.c     |  150 ++
> > drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    1 +
> > drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    1 +
> > include/drm/bridge/dw_dp.h                    |   20 +
> > 17 files changed, 2604 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> > create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > create mode 100644 drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> > create mode 100644 include/drm/bridge/dw_dp.h
> >
> >-- 
> >2.43.0
> >

-- 
With best wishes
Dmitry
