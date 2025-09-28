Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5505BA789D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 23:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAC910E0D3;
	Sun, 28 Sep 2025 21:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAL+GAJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDB910E0D3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 21:27:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SKal3t030509
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 21:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FaQfFaFOCtgfi/FoFC/UkQ6y
 6ObNoFB/yOWfDU1S1+U=; b=PAL+GAJD0HhMhVMaHNzW3C3EAMAcOjXGffze1CsK
 uDDHw+OwM0yB+ka31d9/zuJbovMY2r0tHatqUjceYV1dTa4hRa0TKDhQM935U1M9
 EVpAHWpK96Y+eJAsUf1Na0pK4BQ/54gx83afKRWs1YyVEKvNUQY+CUMWDIJDyMqg
 /Di/0NHnbJ+RkAxfUWrKAbLm1vdfHc4uLpUz8GYmdWeoUOfvcYoptNtluc3Bqljb
 jOZw4DJSSgvme0o7NkTB7lVChb+UfQtRRMfE3iEj03aAqxw/Y7EikAMN6qyyh0uj
 vSaN6ZASONI0LNJaRT/geCkcMNo8Z8e7vE5PHWRM5YT6/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mckgrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 21:27:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4deb67c61caso49832821cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 14:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759094855; x=1759699655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FaQfFaFOCtgfi/FoFC/UkQ6y6ObNoFB/yOWfDU1S1+U=;
 b=sPrQQZ9syM3q8Jo9LFDBizdvBPN2fEZfDZ6CTOKPv3W7dkoeMvWiSgM4DvvhboCPm7
 zrRS5eTUdMgNgvEkPOiauMUPcgHzNmm8t75DE/y246lUqgcV27rMTYtUI7sFd3OFO1zf
 beKOtZtvGpJB/DRcUTIDNQMdLRps8V5a5X1reCKzTc+pMmKJC2NS+ClkMNlj0JyfVzg5
 UwenlO4NwQn8xuJJbelSZFCGJ/2U2tR+GZ05i3G3DJXVUh0sFVq8kOf8594Z8WFjV/kM
 pcfjG+WInP7BGDFLQi835L3oKEG/RYCmEnABJxlF4spwFB8rId/nygfv32BF0puJt8Mp
 aaAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ9uF56OJB93ntBE8DZj0yZYLhVgUXRWgHbceiPWzowo4rXeTDAhe7JrtPNf5LWiR66SntcmFGgAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKM1vAeqtiJqUuuaYhgw7rcjmVQ+GZo9+kTBVKZXfyc0lxIuFe
 YznaQ8HnQYwo8koo1Fyy7XNtZkXhfbgsngab1wEeBnRvWMak54x5ux924uWhGlfSwWdcNCuTIIK
 UnJO1hHSnD8cEyzGRXuSa2xabeQXh6fUkdT6YAAG196dfu8tLTpFyzF8RIdI+BjFTJRvaR54=
X-Gm-Gg: ASbGncsPnkjXV04v3hL5Hysb8Yrtp6DIjpC3tM8OyvmvLEADYBJYQCIVVcpHWD547Vi
 HcmG19x1Wnt+xy4J6WXPB7EW8QhwQjS0+S7D4zfzq+sm4XEiKl7v/vvCOL1IXUrbt3CvpAZr4n8
 2ZGxiKJjOo9wkKE8H04CZ1vivFTmgQwyuQc55AfmVgDaOjmOHPSt6tsmUgP8y5AJVKAQ7K25Ibm
 GMYShGYmb7EbJ8PGAdvBiGi1317T8rL71d5rZrWusGXBTkmfTQgdDc1eYRwRkDCysVMy0jG+cZh
 ZWLSXcAIGxf5gwd09vXPhGhd6yJOqzb8ZTYzaC+HcrMMmTdy30egX5ZGqyFWLCwEkUcUH1GLh5A
 +RyxBHD6NqkiXz1pUSrjWaOCggcmJva/DHlJrN3bBowIB1R7jZdtA
X-Received: by 2002:a05:622a:4c88:b0:4dd:2d5a:4c70 with SMTP id
 d75a77b69052e-4dd2d5a5249mr113850571cf.45.1759094855319; 
 Sun, 28 Sep 2025 14:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVlSpEy9WtWa4TAoo8vOL0fbhKJIDjrX8Rm+aa/grsoe17g1Qr6IL2cUsXyuX3wvLhYBHeqA==
X-Received: by 2002:a05:622a:4c88:b0:4dd:2d5a:4c70 with SMTP id
 d75a77b69052e-4dd2d5a5249mr113850321cf.45.1759094854866; 
 Sun, 28 Sep 2025 14:27:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-587c807ed8bsm359961e87.37.2025.09.28.14.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 14:27:33 -0700 (PDT)
Date: Mon, 29 Sep 2025 00:27:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/7] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Message-ID: <pwk4ylrxyedq33qivpwy4kly3yx25yjkv75ja3prf5ynxosiez@lb53gculvj3x>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-6-kernel@airkyi.com>
 <idyrlzhd5sotg3ylr7vbwmczimglffc75nafxbnhhm3ot2jn4w@ixerm6elfmre>
 <ede70598-c451-4352-ab3e-0e278ce33ad7@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ede70598-c451-4352-ab3e-0e278ce33ad7@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68d9a848 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=gy9Ct68RWRgD3XKeOnoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YxOu2Y8tzrd1ab5s4tUdW-nb0es4ee2k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX8/mBjQNYYHLz
 TBjWQGplApp8yuOciRD55nBA33jH6pyIizASunDwE8Pty2XmZEBp2WF8iQgBmN9GjRZsw0IL2he
 vIl7Z0IY0mAiSKh2RFZNfqx0u1AkKLVIiu+LjuvzBtyyJYWkm+zTuM8FlhH+fZQQ1NaG9A5xOUO
 +ogyJh/FTPY3ON6JCsP5nxLrNsxfI63giGjlDq5bn83Z2PPyDp6TsVnVUpS2rs4pjV6AxCc1FTO
 eCsdvzUYFn0cNQcIUDUbDXvgDCOLufo1ybrsf2ry/q0B0IpVNo+HBAyIc/CUttOrIWDOuZwka3L
 /PsxJUOb1G/Rei2Ex3rYx7/tXULSNALTETqN7hna0Bdosg6LyWmABalBkvxV9CTKio0pAHruMWP
 kifcjCg2ru71CvHcrqyis+C0fHNlWg==
X-Proofpoint-GUID: YxOu2Y8tzrd1ab5s4tUdW-nb0es4ee2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_09,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
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

On Sun, Sep 28, 2025 at 05:52:35PM +0800, Chaoyi Chen wrote:
> On 9/23/2025 9:50 AM, Dmitry Baryshkov wrote:
> 
> [...]
> 
> 
> > > +	/* One endpoint may correspond to one HPD bridge. */
> > > +	for_each_of_graph_port_endpoint(port, dp_ep) {
> > > +		/* Try to get "port" node of correspond PHY device */
> > > +		struct device_node *phy_ep __free(device_node) =
> > > +			of_graph_get_remote_endpoint(dp_ep);
> > > +		struct device_node *phy_port __free(device_node) =
> > > +			of_get_parent(phy_ep);
> > > +
> > > +		if (!phy_port) {
> > > +			continue;
> > > +		}
> > > +
> > > +		/*
> > > +		 * A PHY port may contain two endpoints: USB connector port or CDN-DP port.
> > > +		 * Try to find the node of USB connector.
> > And then there can be a retimer between PHY and the USB-C connector. Or
> > some signal MUX. Or DP-to-HDMI bridge. Please, don't parse DT for other
> > devices. Instead you can add drm_aux_bridge to your PHY and let DRM core
> > build the bridge chain following OF graph.
> > 
> I think building a bridge chain across multiple drm_aux_hpd_bridge may be difficult. First, drm_dp_hpd_bridge_register() cannot register the bridge immediately; instead, it is deferred until drm_aux_hpd_bridge_probe(). When it is added to the bridge_list, it may not yet be attached, and attempting to attach it at that point is too late.
> 
> But, if I only use drm_aux_bridge on the USB-C connector, and use my own custom bridge on the PHY device and managing the alloc and attach bridge process myself, then things would become much easier.

Well... consider a your board, but add onnn,nb7vpq904m retimer between
the CDP and usb-c connector (it's not an uncommon device nowadays). Or
add fsa4480 analog audio switch. Build all the drivers as modules. You
should not need any changes to your drivers to handle such boards and
such kernel config.

With those devices you can't handle everything inside the DP driver,
since there are two "streams" of probe events: the DRM bridge needs the
"next" bridge (in the direction from the SoC to the connector), but the
USB-C events code needs "previous" mux, switch or retirmer. After some
trial and error we have ended up with having a chain of drm_aux_bridge
devices ending up with the drm_aux_hpd_bridge inside the Type-C port
manager driver. This way the typec_* depetencies are resolved first,
going from the SoC to the Type-C controller driver then the DRM bridge
devices probe backwards, creating the chain, which is finally consumer
by the DP driver inside the SoC.

-- 
With best wishes
Dmitry
