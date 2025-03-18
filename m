Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9349A67DF0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 21:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AD410E4CC;
	Tue, 18 Mar 2025 20:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Avxvrd83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E008910E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:17:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJNIYs027198
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cdXNdl9Su+hv7nD+r8LRc5/p
 SIzgMjV1CTk+j9RmE18=; b=Avxvrd83SV9pw/zx4cjtu4CAnOFCEPsZU3hEc1k0
 9T4ngkOn3ehk7MArmnKepclT49uAIp0i4dW97tupImkaf7PTG1VPxk0ZOGm1GSrT
 oucO8IrA3hvL1m8I7d5V0l8OisndSVlox2CP7fpIPNESSE6mFZ1bFEED/MOePL8Q
 Leu6g+6PPLNEj98TlBFQw4L6+QvQSMMuHnv1mA8693dU1HEkyRyKZbRGvWj8ZYJD
 4ZhDoh7hPoGEfxXx5rAr/vBqn7JKft+hQSpNtXvaw1yeYyec2CeK3qONcBRp465l
 hjBK3E6grltsqyJ68UNQify1PmIJQnS3wX8nY92ut7LV6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtk6db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:17:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c548e16909so596605085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 13:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742329055; x=1742933855;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cdXNdl9Su+hv7nD+r8LRc5/pSIzgMjV1CTk+j9RmE18=;
 b=ZIQAYRMv4ELUSC5cFdihu5lEj3tjyl5wsbaugJMxpy7xyEhn4dzH95TFXawNDhUmcY
 /RInL5l3uJ0p1KsYJ8vxd3AT3AKqufsUcCtY2raKQw4cuaLr9IyBgmUwRcP4ryfa7iK8
 ifREjQg5JTYRy3P70iZuN2qhZfIiyaHqs0sHIJl53ffwLp0MKuA/H3T3hQAA+j4GvEhr
 8/420xXLrj6TpYfiP5dXCaUUxa0LjRq3l5wi16yTZNmorLhJfEROisqjF1O2F2Teh/5u
 AMBPL6cE4F5lMMGVmq7WkdP8hedflHEcrlK/3AoogAAFRmSVzyp2HQByn3Eh+1siYktn
 JX/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+a8jvnG1h/iWxKqBqBJTAASQaYUICZmPUkE+E+RiwhPYpy63PGFVsyprPhHtd4SZNIY3ALevbp+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6j8r4fYzqNp2k3Xlm+kCK5yT1cltyvFltfo8Lu6MG64W5UMz3
 9LAjKxeXqn1chVIVUSkQONopkTa6C+n0rtaYLMd/PkZMDuEGKUqFfg/TE5exiMQobmGt11jsBGa
 QYDuXz/mAHIkxbziOmM9lz0rOQmhqnQtZwhUH+J22zCYKM7AMGcJBboWCAfL5eX0xnxQ=
X-Gm-Gg: ASbGncsqdDDZ7FQVsnst1al/nDA9en5lGlBKXf88FRxJRcrntGMUBVjQCDPLMlk+hl4
 Fl5ixyQ4VAgAArpbXW2TiF6pTjgzSC9Egu2MOlVQ0dm/smYRc4TNmMAjAe9blMy4i1gGGrVYShP
 ISVlsCNFvZmEH1TTv8zY0Q3SE0ken4HzwzkC6S4BUEDcOVgUGQs5TYN53TFu4WX1FjkvxPT1Lok
 x7rFrwwsVx4/b5VKZXTIKXEegVVoVQa7kymZdxiB/lZwK3Sf/Fhsb18yDBsOVK4Cbgq59uYtTkM
 o/p+fIlXYMbXZIFx/xU8aWwx3k+/IOJRqYPZICTVcvhx/QZkMGg/HdbRlcAEkLuEYjukHG3am/U
 zLuk=
X-Received: by 2002:a05:620a:2993:b0:7c5:4c49:7697 with SMTP id
 af79cd13be357-7c5a8398d4amr914985a.6.1742329054534; 
 Tue, 18 Mar 2025 13:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlpAT9MDyX/AOO1fzlAD/dqcC58v9HVJREAU1j0mJpT0fm127HCLDdRwmo/02jgbrejl/TrQ==
X-Received: by 2002:a05:620a:2993:b0:7c5:4c49:7697 with SMTP id
 af79cd13be357-7c5a8398d4amr909785a.6.1742329054105; 
 Tue, 18 Mar 2025 13:17:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1dc0dfsm20650791fa.105.2025.03.18.13.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 13:17:32 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:17:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Harikrishna Shenoy <a0512644@ti.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Harikrishna Shenoy <h-shenoy@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jani.nikula@intel.com, j-choudhary@ti.com,
 sui.jingfeng@linux.dev, viro@zeniv.linux.org.uk, r-ravikumar@ti.com,
 sjakhade@cadence.com, yamonkar@cadence.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: Add no-hpd property
Message-ID: <aaeklc34t36kokghbvmtmhabyxildajbefhhvtevb2xcs36bcp@lnhjyyiqh6pq>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
 <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
 <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
 <de0cb22d-d251-4b0b-8fc7-e8b5a891a527@ti.com>
 <vfg6hlkzmqahbswgyctzuuzcdm2aend6wmo3uci4qs74jasjtc@3hlox276hazj>
 <673e79bc-53c9-4772-ad18-8c00e4036905@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673e79bc-53c9-4772-ad18-8c00e4036905@ideasonboard.com>
X-Proofpoint-GUID: -LdYdjzwy8_SRuAqaYyEy5JbenQ763Zn
X-Proofpoint-ORIG-GUID: -LdYdjzwy8_SRuAqaYyEy5JbenQ763Zn
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d9d4e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=sozttTNsAAAA:8 a=u89mOchh5nwXCBD-QrQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180147
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

On Tue, Mar 18, 2025 at 05:49:54PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 12/03/2025 14:52, Dmitry Baryshkov wrote:
> > On Wed, Mar 12, 2025 at 11:56:41AM +0530, Harikrishna Shenoy wrote:
> > > 
> > > 
> > > On 05/02/25 19:03, Dmitry Baryshkov wrote:
> > > > On Wed, Feb 05, 2025 at 12:52:52PM +0100, Krzysztof Kozlowski wrote:
> > > > > On 05/02/2025 12:50, Harikrishna Shenoy wrote:
> > > > > > From: Rahul T R <r-ravikumar@ti.com>
> > > > > > 
> > > > > > The mhdp bridge can work without its HPD pin hooked up to the connector,
> > > > > > but the current bridge driver throws an error when hpd line is not
> > > > > > connected to the connector. For such cases, we need an indication for
> > > > > > no-hpd, using which we can bypass the hpd detection and instead use the
> > > > > > auxiliary channels connected to the DP connector to confirm the
> > > > > > connection.
> > > > > > So add no-hpd property to the bindings, to disable hpd when not
> > > > > > connected or unusable due to DP0-HPD not connected to correct HPD
> > > > > > pin on SOC like in case of J721S2.
> > > > > > 
> > > > > > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > > > > 
> > > > > Why are you sending over and over the same? You already got feedback.
> > > > > Then you send v2. You got the same feedback.
> > > > > 
> > > > > Now you send v3?
> > > > > 
> > > > > So the same feedback, but this time: NAK
> > > > 
> > > > Krzysztof's email forced me to take a look at the actual boards that you
> > > > are trying to enable. I couldn't stop by notice that the HPD signal
> > > > _is_ connected to a GPIO pin. Please stop hacking the bridge driver and
> > > > use the tools that are already provided to you: add the HPD pin to the
> > > > dp-controller device node. And then fix any possible issues coming from
> > > > the bridge driver not being able to handle HPD signals being delivered
> > > > by the DRM framework via the .hpd_notify() callback.
> > > > 
> > > > TL;DR: also a NAK from my side, add HPD gpio to dp-controller.
> > > > 
> > > We tried implementing a interrupt based HPD functionality as HPD signal is
> > > connected to GPIO0_18 pin, we were able to get interrupt based HPD working
> > > however to route this signal to SoC we are loosing audio capability due to
> > > MUX conflict. Due to board level limitations to
> > > route the signal to SoC, we will not be able to support interrupt
> > > based HPD and polling seems a possible way without loosing on audio
> > > capability.
> > 
> > Still NAK for the no-hpd property. HPD pin is a requirement for
> > DisplayPort to work, as it is used e.g. for the 'attention' IRQs being
> > sent by the DP sink. I'm not sure what kind of idea you HW engineers had
> > in mind.
> 
> It's true that for normal DP functionality the HPD is required, but afaik DP
> works "fine" without HPD too. This is not the first board that has DP
> connector, but doesn't have HPD, that I have seen or worked on. Polling can
> be used for the IRQs too.

Just out of curiosity, is there a DP host / bridge that provide polling
for short HPD pulses (aka attention)?

> For eDP HPD is optional, and some of the cases I've worked with involved a
> chip intended for eDP, but used with a full DP connector, and no HPD.
> However, in this particular case the DP chip supports full DP, so it's just
> a board design error.

In such a case, if I'm not mistaken, the no-hpd is a part of the panel
interface rather than the eDP source. I see that SN65DSI86 has the
no-hpd property, but if I understood Doug correctly it is used to change
bridge's configuration rather than just skip the HPD processing.

> My question is, is J721s2 EVM something that's used widely? Or is it a rare
> board? If it's a rare one, maybe there's no point in solving this in
> upstream? But if it's widely used, I don't see why we wouldn't support it in
> upstream. The HW is broken, but we need to live with it.
> 
> Another question is, if eDP support is added to the cdns-mhdp driver, and
> used with a panel that doesn't have an HPD, how would that code look like?
> If that would be solved with a "no-hpd" property, identical to the one
> proposed in this series, then... There's even less reason to not support
> this.
> 
> Disclaimer: I didn't study the schematics, and I haven't thought or looked
> at how eDP is implemented in other drm drivers.

I hope that Doug can comment on eDP side. On the schematics side, there
a multi-pin mux, which switches several GPIO pins. One of the positions
of the mux is useful for audio connection. Unfortunately, DP HPD pin
gets connected in a different mux positition.


-- 
With best wishes
Dmitry
