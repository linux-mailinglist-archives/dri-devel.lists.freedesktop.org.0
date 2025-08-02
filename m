Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED6B18DD2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 11:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F18D10E0F9;
	Sat,  2 Aug 2025 09:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrMHPVM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFBE10E0F9
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 09:56:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725fBW0002498
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Asqzu24OO8UYIDi9bC459VXzWsN/7IVQ4DWi2UawXoM=; b=RrMHPVM73DxKGGJg
 qqsIWm2Q/ZTftd8Fup41iicv4JvJklA/4eAeX7aUHbhLxKYR8ZmnvoSWb1utRHaa
 gj8mIJXbltj2Qkz7gEnelSrogPSjtGN6M+uXFhKRM1oaxxxKMCLYCnaVAL01LFhk
 YgK4QaldVVykklAyWbWn+2u9imuUvi4/ZooQeCHIbN/1AdnkMgXEX2bWgu0ts4Q1
 hf+mEcYNDhM5BWjVCLDRFiYxVCuxJGMOrpkU2GAums6U8H0OFxriXG5/2W9oTjuI
 x5OlK/Tf2KXh4u/eXDYp6X8OF/fCQrLcvyI0JZuQxznMb3WYdTAUTACFlOcannvI
 HQ79zg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489aw70jqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 09:56:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fab979413fso47576226d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754128564; x=1754733364;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Asqzu24OO8UYIDi9bC459VXzWsN/7IVQ4DWi2UawXoM=;
 b=n+NXdm7BHCdLMHx2aNF+eWc0b/reBD0sl8jiJDlEoVD/99asNFWMx5VjbsBaFecdSF
 jFIvN1v1WeKPMu8QV9W45CrxZX77bKKhHYTSSAuw70nUyT7bzTxfpuwA0Ky7eCvjmMNu
 jqcFuNJ7GE2xn0LeATX7GU1PiVaidVZRIJTAABQrp/KY66VsFYeaFXIOuN8E1X6WOsbt
 nbHMK6Yag2RzAQCfrcQ+0f00kZFPlZn3W5fopu8n6XJTDaLQEprA/JReMCR7UYIbuzr7
 qa5fGVp/qiJKL5xfuFLaIrXfBzVV5PXj7LCRziXj62POoS6E8JKk819qsdYyIgKamf98
 sjHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmVodwE5rRrd+gCBi30C6xQF20ERoS4YjdlVjIzMkRDxdw1ILqfFXHyFf7FDvgSI0qBWpZolNpLg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQYtxozYdHDDdXGsripbEC3O+f6OUqdXjrs8zsBmKiBFLdZDR8
 p70zRuvuIUzG3G5leDUlKCSGQuAO1jsIXWBLZUkP5xdgq/gQBh5Ac19F3dKKe+hSkoFd9MpFcih
 XvOQZFEZsvs1CJMxpZyNBCxRIjB8uAeQfWY3/241ezjIbPpND3c9BwGGyRg1VAC+JiI0s+KQ=
X-Gm-Gg: ASbGncvG1ubIvMMNPEtZz99A7/Pjvhflsw0jaLrlOQ4T/m+JXChCYb5XHi1PECjm+ZT
 zv5fNkYHATAzQnU4bbRGuamuxyETO5wI1hTCl2kBRrMMd6wuSh3S3gXfojdOsJ0mGXxqz2jfCDf
 rvBPOjj2nJSP/SdyVtJxE4O3iTt2NW+C6eojqciUjXFKT2XQ4OKk37MvlvxA0AzosMdunYoYmXq
 RX7gRwmL3sLVBphuv8IAGzRQZR5E2XKgR7do9cMXJ0rVYrRL9qvLmrdiGqPumVKrMmG0bpQKoSN
 8psB3ycw3GWztiRc/SvllHXfI77zcU6gAkuU0GIlrY5AyUWKe2z3+0l5hc4iyzvejxCm+SlyJKs
 EMpMtPef/jp82bbevOjSzvpBdfvOt9vXQfxTO+Bb4pt28U49yQWk7
X-Received: by 2002:a05:6214:400b:b0:705:8d7:a0c3 with SMTP id
 6a1803df08f44-7093630075cmr37002276d6.34.1754128564346; 
 Sat, 02 Aug 2025 02:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOTdM2Iczyvgl46yWDi8GTyzV7HP8tA/9iXZHl881FgxKm6LV0IC4YJNQAmmZo1HrO7zCu2w==
X-Received: by 2002:a05:6214:400b:b0:705:8d7:a0c3 with SMTP id
 6a1803df08f44-7093630075cmr37002056d6.34.1754128563864; 
 Sat, 02 Aug 2025 02:56:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388d8ca4sm10105271fa.45.2025.08.02.02.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 02:56:01 -0700 (PDT)
Date: Sat, 2 Aug 2025 12:55:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
Message-ID: <pk5wecbbpxn7v4bdwtghhdnm76fmrmglelytljwfb4cgvpu2i6@rk5turgyt5xq>
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
 <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
X-Proofpoint-GUID: Z3X0422VF8nMwUQGXMn5Mec3sZzk_JoR
X-Proofpoint-ORIG-GUID: Z3X0422VF8nMwUQGXMn5Mec3sZzk_JoR
X-Authority-Analysis: v=2.4 cv=MrZS63ae c=1 sm=1 tr=0 ts=688de0b5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=JfrnYn6hAAAA:8 a=s8YR1HE3AAAA:8 a=GTOoGQlhK9DRF86BnBwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4MyBTYWx0ZWRfX0ID3Wpwx+Z9f
 //dWW+9oB8FjYqoa/OY1M5cUrJxwTfiiO0O6zrQxReqrLOXnCxFx+TPK8Jo8Nq8xHqhjm8ov7cM
 7zOgdaz+tukTNWSyD+KJXTD7vY7rmNXNlQukMsd1pfBoqO5dAGOsCkMAhisFiJjtFioZe2PbYaf
 x8/D1e2JPJs4QvTUv8g3aRZqUABKZkK6/c3yzwOKbBy+l1mXgxg75z90kCIiMhN2pKn+87/Gr74
 lJ0YfCtOwvmXB6ACFqOmZMuvx+2TdogZDSzFmlkO2iq8nw7sEBkyW1xq7xR3mRhXOutOLOqK8Xi
 aRIlxxHWlH7JPXl1Y3vRf7ZqJSPNgd/4rgX33ZbgCRPRw86ZW4CgHtrG62/uBdKVJAnr+CGvcb5
 +3lE4lhxKnFrKFp11eoOD+y/TM+y1WTow8bhUsqg9hN0MUAqBgot7CA0hG94IBFur3SgiB6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020083
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

On Thu, Jul 31, 2025 at 10:19:49AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 7/31/2025 3:13 AM, Dmitry Baryshkov wrote:
> > On Tue, Jul 29, 2025 at 05:00:27PM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > This series focuses on adding Type-C DP support for USBDP PHY and DP
> > > driver. The USBDP PHY and DP will perceive the changes in cable status
> > > based on the USB PD and Type-C state machines provided by TCPM. Before
> > > this, the USBDP PHY and DP controller of RK3399 sensed cable state
> > > changes through extcon, and devices such as the RK3399 Gru-Chromebook
> > > rely on them. This series should not break them.
> > > 
> > [....]
> > 
> > > ====
> > > 2. DP HPD event notify
> > > 
> > > The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> > > the CDN-DP can be switched to output to one of the PHYs.
> > > 
> > > USB/DP PHY0 ---+
> > >                 | <----> CDN-DP controller
> > > USB/DP PHY1 ---+
> > Could you please clarify this, can you switch DP stream between two
> > USB-C outputs? What happens if user plugs in DP dongles in both USB-C
> > ports?
> 
> Currently, the software simply selects the first available port. So if user
> plugs in DP dongles in both USB-C ports, the DP driver will select the first
> port. This process is implemented in cdn_dp_connected_port() .
> 

I think Stephen Boyd has been looking on similar issues for Chromebooks,
which were sharing DP controller between several USB-C ports. I don't
remember what was his last status. I think there it was easier since the
bifurcation point was the EC.

I think, CDN-DP needs to register up to two encoders and up to two
connectors, having a separate drm_bridge chain for each of the DP
signals paths (in the end, you can not guarantee that both branches will
have the same simple CDN-DP -> PHY -> USB-C configuration: there can be
different retimers, etc).

Both encoders should list the same CRTC in possible_crtcs, etc. Of
course, it should not be possible to enable both of them.

This way if the user plugs in two DP dongles, it would be possible to
select, which output actually gets a signal.

> 
> 
> > 
> > > BTW, one of the important things to do is to implement extcon-like
> > > notifications. I found include/drm/bridge/aux-bridge.h , but if the
> > > aux-bridge is used, the bridge chain would look like this:
> > > 
> > > PHY0 aux-bridge ---+
> > >                     | ----> CDN-DP bridge
> > > PHY1 aux-bridge ---+
> > > 
> > > Oh, CDN-DP bridge has two previous aux-bridge!
> > > 
> > > Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
> > > state between PHY and CDN-DP controller.
> > Does it actually work? The OOB HPD event will be repoted for the usb-c
> > connector's fwnode, but the DP controller isn't connected to that node
> > anyhow. If I'm not mistaken, the HPD signal will not reach DP driver in
> > this case.
> 
> Yes.  What you mentioned is the case in
> drivers/usb/typec/altmodes/displayport.c . I have also added a new OOB event
> notify in the PHY driver in Patch 3, where the expected fwnode is used in
> the PHY. So now we have two OOB HPD events, one from altmodes/displayport.c
> and the other from PHY. Only the HPD from PHY is eventually passed to the DP
> driver.

This way you will loose IRQ_HPD pulse events from the DP. They are used
by DPRX (aka DP Sink) to signal to DPTX (DP Source) that there was a
change on the DPRX side and the DPTX should reread link params and maybe
retrain the link.

> > > Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
> > > Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
> > > Patch3 drops CDN-DP's extcon dependency when Type-C is present.
> > > Patch4 add missing dp_out port for RK3399 CDN-DP.
> > > Patch5 add Type-C DP support for RK3399 EVB IND board.
> > > 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
