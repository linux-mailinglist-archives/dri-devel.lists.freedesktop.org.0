Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B607CB93EAB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E915610E51D;
	Tue, 23 Sep 2025 01:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqevwbKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067D210E51E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:58:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHtSdS029332
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wjZBpcuck2b3wq2R80w3BXiH3NCwuHgMqXfKHFPCfUw=; b=UqevwbKuVrII/QtV
 nwG11NVaZ1R6HuGxJB/01OGjPm2+eEpRGoK+UolPuBI21JvO3GbVEISDIWjZKeLS
 BPENgATFfm/GL+JUgAFomijvrXZennRbZFnnHvbk937sIebZrXINrxRg6WIyt+Fx
 vLVxw5PKkSGAOif2n2Dpx93ljmphbhm1V9aoLMq8LUWysIZJ1L6bjS5+unjePSQS
 amv4yZDARGHBEzXfLp7u6kZWmkOcJkM9gyGFG1I8d5sofY5PdckFzlCeOn/DyDgZ
 NJlahtyP157t1jxmC/a2AjY+9MwqXgrQo4fZO5EBHqCobtwgW/HAXaLyzaedJuLA
 0iwkeQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk2mwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:58:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-798ab08dde5so65463746d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758592707; x=1759197507;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wjZBpcuck2b3wq2R80w3BXiH3NCwuHgMqXfKHFPCfUw=;
 b=D1SSMiFwxYFISTrl5WW9mDGT9WCCjUoyyDw5ip/v75ExWbFESAQRkVnlknY2mmhx3O
 nYcfMGfvOEET+YAnc1Ltqs+W75JgylH5HRnmH4p5fbpgW8MUfaQOUxyGNjCXJ5tN3AAr
 ysEjaQoAjnqyNbYnUfM/h1oOk89lM7SP6tCA7LF3yOnpxLmA+O94iJeoyZHD8V9/eUCy
 7usINn1ghxLwntVuCm0R8uFnsUPnss6/pu8zcq4xNkA28Rwn4zqQ7rK2xa7CwK443tNy
 E/mgk1oCXMwtSOenh609HoBajzsQ6sG3XHiPes7KpfT/R76/xjgXGIGZdtU/lOhEeYZl
 i5hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaXJltkdfGMlnxQ56TVDXu9MYxiy+s9BVkBqEOw/koa5/CNLUAvOHRMCb9tnO22JqFUJKsv03QRU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtGOhVI+Gsc6o33A0pxDW4zTby0ZjAMfZa7CpFxMFnF9XxCOWp
 whXKiIWA982iEuU8MDq4cP5Tg6yTQemNEZOk8Im61dmiFBpj2cJPGYqEmSGeTR3V9tQaItoOusH
 k/Uiu/EqPEV12roazbajhbNVhzthQZKZdeLwS1u8DViPIicY7SIg9lEqiUtakw5EJdkDtyRE=
X-Gm-Gg: ASbGnct7T3W5PLbBN8L4V175ODRifhaLH88+uEeWACW6C9sr3tdmp2F2rIPlG/9csNG
 yozwKZmseJmCi/bay0YwiLYZbQn3F2tnRaqgXDtEomkCVtR29J5xqOOBR3z8uYRSh270FFdTpNm
 0e/7oLkHVd6MiJFtttTSut5FBBnJzZToFu9LRgdkIyIhM5iFxtGWmuO1q4cQO3zA56iTDpWmzp/
 nwx3IVO+f1clfN2fvElq/CtpHoxhr4/Hrmten7ZGeQUIuwdtY2DU4gUFCfXOgPAqzLn3j5KZhy1
 0mY2Vc/6EEbjm62HLQ072gH6xA9H6zuAwQqM4oKSe3ITpd5CROWt99+Qc0V8XsdJtFv1MCtdybs
 UMN21yZXuAfZxQk/adbcxNBhvEOkS48jlRQqamThNp2r/VlV7FXUB
X-Received: by 2002:a05:6214:f6c:b0:78e:ea84:768f with SMTP id
 6a1803df08f44-7e705d7bf47mr11043186d6.30.1758592706941; 
 Mon, 22 Sep 2025 18:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2UHfHXJZyQ10p2X6Fpt5TanjCh8LeDMIwT7ePmjsHI9tTKDN1phKB8vhk3eST38TyWHjFsw==
X-Received: by 2002:a05:6214:f6c:b0:78e:ea84:768f with SMTP id
 6a1803df08f44-7e705d7bf47mr11042766d6.30.1758592706397; 
 Mon, 22 Sep 2025 18:58:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57e80683e89sm1357059e87.95.2025.09.22.18.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 18:58:25 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:58:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <7zswcrcfsypbd36mddslreeli2zbrn33nyqkxmwdufakhl2vgm@bb6i6zfgeznh>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-4-uwu@icenowy.me>
 <a46szgmjrwgqhv5issuijyvih4tof3xa45tdhxv4qjplekszpz@55tgbkeby7zr>
 <dacdfabb30fae413949d8bde28a709096ecda4c7.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dacdfabb30fae413949d8bde28a709096ecda4c7.camel@icenowy.me>
X-Proofpoint-GUID: a_tGj3bn8QSxiW-_LCKtU7i12AMjK2Ey
X-Proofpoint-ORIG-GUID: a_tGj3bn8QSxiW-_LCKtU7i12AMjK2Ey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXxqwbwYRWKXxm
 AwJ0kW/w8w2jH4YimdO1en3BUUGNiuhCIpc0QXEbMox1JwrfwYdu8bvU6g8fePtbdGQnO+hN0Eu
 wL6k+P/IUL+kiEObFnzYTYvajDKRtg1lSh3Moun9K/iLkaIdOrPbHT9Ar9BUjpNjoa++Ghpb9ab
 gKh29DbhAtscXF4fhru5p2kBuD2xcL8kAM0JrhjsUmQXDbXh51bLMvzbQ+VimPCc0IGHbW6pfdv
 1QbD8QrGtEx9t2K3/RrSpFzEPVQoTcmj5M+PPIH8owvoXXaGGwzygLu+4uC624rFKCVZ2vYgIfS
 na8v7Efvvlh+QzhXoS240wBQZysZlAzDaORSDHkcOx7+J4yr0Did1/ZRnDOxAEeBTOkEbNnqTpk
 KBziT2mf
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d1fec3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=ZNbfwUPgZe5FKaAedJYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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

On Tue, Sep 23, 2025 at 09:10:28AM +0800, Icenowy Zheng wrote:
> 在 2025-09-23星期二的 03:53 +0300，Dmitry Baryshkov写道：
> > On Sun, Sep 21, 2025 at 04:34:41PM +0800, Icenowy Zheng wrote:
> > > This is a from-scratch driver targeting Verisilicon DC-series
> > > display
> > > controllers, which feature self-identification functionality like
> > > their
> > > GC-series GPUs.
> > > 
> > > Only DC8200 is being supported now, and only the main framebuffer
> > > is set
> > > up (as the DRM primary plane). Support for more DC models and more
> > > features is my further targets.
> > > 
> > > As the display controller is delivered to SoC vendors as a whole
> > > part,
> > > this driver does not use component framework and extra bridges
> > > inside a
> > > SoC is expected to be implemented as dedicated bridges (this driver
> > > properly supports bridge chaining).
> > > 
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > > Changes in v2:
> > > - Changed some Control flows according to previous reviews.
> > > - Added missing of_node_put when checking of endpoints for output
> > > type.
> > > - Switched all userspace-visible modeset objects to be managed by
> > > drmm
> > >   instead of devm.
> > > - Utilize devm_drm_bridge_alloc() in internal bridge.
> > > - Prevented the usage of simple encoder helpers by passing a NULL
> > > funcs pointer.
> > > - Let devm enable clocks when getting them.
> > > - Removed explicit `.cache_type = REGCACHE_NONE` in regmap config.
> > > - Fixed a debug print using a variable before initialization.
> > > - Fixed a wrong index when using bulk to handle resets.
> > > - Added missing configuration for DPI format (currently fixed
> > > RGB888).
> > > 
> > >  drivers/gpu/drm/Kconfig                       |   2 +
> > >  drivers/gpu/drm/Makefile                      |   1 +
> > >  drivers/gpu/drm/verisilicon/Kconfig           |  15 +
> > >  drivers/gpu/drm/verisilicon/Makefile          |   5 +
> > >  drivers/gpu/drm/verisilicon/vs_bridge.c       | 330
> > > ++++++++++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
> > >  drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
> > >  drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
> > >  drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
> > >  drivers/gpu/drm/verisilicon/vs_dc.c           | 205 +++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
> > >  drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
> > >  drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
> > >  drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
> > >  drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
> > >  drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
> > >  drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
> > >  drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
> > >  .../gpu/drm/verisilicon/vs_primary_plane.c    | 157 +++++++++
> > >  .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
> > >  21 files changed, 1789 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
> > >  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > >  create mode 100644
> > > drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
> > > 
> > > +
> > > +static int vs_bridge_atomic_check(struct drm_bridge *bridge,
> > > +                                 struct drm_bridge_state
> > > *bridge_state,
> > > +                                 struct drm_crtc_state
> > > *crtc_state,
> > > +                                 struct drm_connector_state
> > > *conn_state)
> > > +{
> > > +       struct vs_bridge *vbridge =
> > > drm_bridge_to_vs_bridge(bridge);
> > > +
> > > +       if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> > > +           !vs_bridge_out_dp_fmt_supported(bridge_state-
> > > >output_bus_cfg.format))
> > > +               return -EINVAL;
> > 
> > I still think that it's better to have per-interface type bridge
> > funcs
> > rather than checking for the interface type inside the function.
> > 
> > > +
> > > +       vbridge->output_bus_fmt = bridge_state-
> > > >output_bus_cfg.format;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +
> > > +       bridge = devm_drm_bridge_alloc(drm_dev->dev, struct
> > > vs_bridge, base,
> > > +                                      &vs_bridge_funcs);
> > > +       if (!bridge)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       bridge->crtc = crtc;
> > > +       bridge->intf = intf;
> > > +       bridge->next = next;
> > > +
> > > +       if (intf == VSDC_OUTPUT_INTERFACE_DPI)
> > > +               enctype = DRM_MODE_ENCODER_DPI;
> > > +       else
> > > +               enctype = DRM_MODE_ENCODER_NONE;
> > 
> > Nit: DRM_MODE_ENCODER_TMDS ?
> 
> The DC it self never encodes TMDS, and although most SoC connect the DP
> interface to HDMI TX controllers, it's theortically to use other
> bridges here (e.g. DP TX controllers).

But NONE also doesn't sound completely correct here. Anyway, this is
really a minor thing, so feel free to ignore this comment.

> 
> > 
> > > +
> > > +       bridge->enc = drmm_plain_encoder_alloc(drm_dev, NULL,
> > > enctype, NULL);
> > > +       if (IS_ERR(bridge->enc)) {
> > > +               dev_err(drm_dev->dev,
> > > +                       "Cannot initialize encoder for output
> > > %u\n", output);
> > > +               ret = PTR_ERR(bridge->enc);
> > > +               return ERR_PTR(ret);
> > > +       }
> > > +
> > > +       bridge->enc->possible_crtcs = drm_crtc_mask(&crtc->base);
> > > +
> > > +       ret = drm_bridge_attach(bridge->enc, &bridge->base, NULL,
> > > +                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > +       if (ret) {
> > > +               dev_err(drm_dev->dev,
> > > +                       "Cannot attach bridge for output %u\n",
> > > output);
> > > +               return ERR_PTR(ret);
> > > +       }
> > > +
> > > +       bridge->conn = drm_bridge_connector_init(drm_dev, bridge-
> > > >enc);
> > > +       if (IS_ERR(bridge->conn)) {
> > > +               dev_err(drm_dev->dev,
> > > +                       "Cannot create connector for output %u\n",
> > > output);
> > > +               ret = PTR_ERR(bridge->conn);
> > > +               return ERR_PTR(ret);
> > > +       }
> > > +       drm_connector_attach_encoder(bridge->conn, bridge->enc);
> > > +
> > > +       return bridge;
> > > +}
> > 
> > Other than that LGTM.
> > 
> 

-- 
With best wishes
Dmitry
