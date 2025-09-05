Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E508B44AB9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6861B10E354;
	Fri,  5 Sep 2025 00:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQMFWkwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5614210E354
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:18:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584I6NXk008129
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KSPaLUuu1/W8mwk0dFo8rOPMChptVSfZuwSuOpPsEcU=; b=BQMFWkwBoJavgg7m
 p/OQEucelcrf/wuWgKcPT6uJHGIBysqZ1dYANfS2zVw6bBYBYDmhUgKpjX88OJ6/
 7nx0OSHKflx77VPa+WToivqwk2ZO5ewbNqAXnlRd42N7wHIM9KPXO+3gg/QVTjCt
 c/F4VvUP7ZLfYdy9IcV59Mf8Ir4/a/FsgLPhxRreKcRTZFYu8BmIa/BEsfc38YUi
 6maz/zuxQKo1tVl2xvj8B7iSsShMyOSPlJbDUbAB6pVMY5csMxKDcbtcZZNcW5gq
 bVJ000ofmarBmedPyd6JWw0rdhU2STNLIZHk5RpN3C3uOG1a9VbP4P9MQfBAcrdr
 QI92aA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjs7pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:18:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7224cb09e84so27098126d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757031489; x=1757636289;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSPaLUuu1/W8mwk0dFo8rOPMChptVSfZuwSuOpPsEcU=;
 b=Q+JbC1Mw6moxVaQNXXY5uAVWcCDHj/6zu3gQ/IHPivWj0V3+/DUth9x66h5twiSFkd
 DiwWNNUVBAe0JVYEbmWmvP2XYPzfUBeuMQ8mPBSvVfkkqaenYowdv5At8t3MUdIrB1+c
 JDeSW5/JSwjssWCPLzllLVyJJY25zxuzjaWOZlXPuYyMEwDrdgw4VMxKAWRjNqK6OzsK
 +6HNRqEHHR5P0lGOt3fxQ8xSdYGSXDgfkbXES1BksZEaZqCuxShp939dsSM8wG3wn4Wi
 stbpsDqh5bIyHwePVtpDhyuxbsfGNShveVPB7x2UObmPhfUPjrzGMww4tQ3t5Z7j+gZ1
 x1ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2VSBENs6oLVGGu8kHTw/0nXEObA7Jj2C0Jbq+zLLaPK8xjq5tpTgq0WyykSxg5v2mIiY5w6eOmFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSXJTe+ukZVGRjr8aVtrRNRnWNzF1PDjitkdYzUkvw5R/nXipq
 jNUy8VWewT9klXtLh68ovPAy+cXiPUyAl9lpXP4G8HGayX/p8gqMhcjuzmqOrl1Plnl0KBq0Gyo
 +mYZxO46Le3dXCpsXJW3sZ37x5MXa9sE5w454lj9KMl9NmFzKOBnHwpLJI5sNzZFBay0QBQM=
X-Gm-Gg: ASbGncviA+Y1BWzYe1AjywP1MgxAGnJzxLqcyJUuNJbNLCvwxzq47e8sNuuIBWU4YT5
 YvcTWksCX1iPJCmHtwgSid6gMuwtmJX0cRyaYO9ZnG1Z/sUAbusrJy/7F1Iw91YjSNwYv2NVLAw
 ceS+sb4GJ8SSAnG0mBAxG2C92KUPhaRZf08Y5l4hAqFZmWjtGA5F2KNncYFksRuKa1H7VpHK4Jf
 OAkdnVz+q4yM37D+QzKNQjDyes36i4Zaqm0jOTTSuL/uWTgfGs1xysdSR+VMI17UxeKf50/Q/H/
 cohB23G28WnN6sxqzVryEg+8wRCzDMTaWl/qKibFLdzWKv93P22+rH8u4gybWhgd+Oi+qoKXAQZ
 F+x781F3tUhklzkMQItQFpobYoyFGgjGMe/9hO0Yn85h3fKMcO8f+
X-Received: by 2002:a05:6214:528f:b0:72a:6d80:89 with SMTP id
 6a1803df08f44-72bbfe90ba8mr24025216d6.14.1757031489455; 
 Thu, 04 Sep 2025 17:18:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPZjJiYgWml8xQq4nDFW2YEEIvWursEzB+vla8NQKjU89+gENfmatwzlUeLOhHRC82sA/uCg==
X-Received: by 2002:a05:6214:528f:b0:72a:6d80:89 with SMTP id
 6a1803df08f44-72bbfe90ba8mr24024826d6.14.1757031488941; 
 Thu, 04 Sep 2025 17:18:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab5e530sm1491374e87.10.2025.09.04.17.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:18:08 -0700 (PDT)
Date: Fri, 5 Sep 2025 03:18:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <muyjifaaftf7zmgl755xng3dx5uzgttauqanfdqktdfdd6n3qc@jsev7gs4dwsi>
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
 <20250901142958.843678-2-mike.looijmans@topic.nl>
 <pml7rfbkerzkx5df26x7kxn3tk2o7oqrkqnx26tzikeg53djn5@islb4hlm4ks7>
 <aa80b3c4-01b5-4d4c-9fe0-523cdb895eb3@topic.nl>
 <37czaypq2newm3hn6nfuy5ndkibvaqf53nx6zvv3mhddh4qku5@psqqxbu7bycf>
 <abda9bc1-bd5a-4f60-8786-e3ebd6852073@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abda9bc1-bd5a-4f60-8786-e3ebd6852073@topic.nl>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68ba2c42 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=5nLynkxtY9vo5Cl7bzAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: C95iRd1qVm5aUyViPlE_SDOoib5lPRPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXzM20wuvgMWT9
 JPxJYm7psdJbAoockVZup5ZXjOr50ytuiYX1VGV0L8KkEGusICiD84N1cBbh/4wYHovVBXjWeSF
 MOrvTiai49YKs/DJlerw3YQhjGiqfPhmFEtCoznSk9sDg2pdC1/e1hIEadJgrukuO6Y5yMuAZ2l
 YbCdXzConu485HJ2VOSugHv7w89RfRcfkteGRzAqDDUi/imza4inB7IMMuznmA1C1VtY2pTpZ56
 QTOoy3RpbhLkisHDAAd4ukmgyYDHRddM0CMhNjgiVgzJcuoO4S8AxV39z+WgZNWLc0ynHpxXAHy
 /upTRNgxJR4Q7/FsnU0qiK2/HZO1bMas+PWIRC5ZOYZTBbaqUrvJ0HjS6zmBQikTcW3u9Dtmory
 AD6g7FSQ
X-Proofpoint-ORIG-GUID: C95iRd1qVm5aUyViPlE_SDOoib5lPRPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Thu, Sep 04, 2025 at 07:54:30AM +0200, Mike Looijmans wrote:
> On 03-09-2025 17:25, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 08:17:33AM +0200, Mike Looijmans wrote:
> > > On 02-09-2025 19:29, Maxime Ripard wrote:
> > > > On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
> > > > > +  ti,retimer-threshold-hz:
> > > > > +    minimum: 25000000
> > > > > +    maximum: 600000000
> > > > > +    default: 200000000
> > > > > +    description:
> > > > > +      Cross-over point. Up until this pixel clock frequency
> > > > > +      the chip remains in the low-power redriver mode. Above
> > > > > +      the threshold the chip should operate in retimer mode.
> > > > Why should anyone want to tune this at the firmware level?
> > > It's a board property. You'd set this based on the hardware you've soldered
> > > on. If your clock and serdes are good quality, there's no need for the chip
> > > to be in retimer mode (it will consume more power and actually make the
> > > signal worse). At higher speeds, that situation may change, hence the need
> > > for a way to describe that. The chip has a similar function built in, but
> > > with only 2 choices of cross-over point.
> > > 
> > > To tune these parameters (retimer, equalizer), you'll probably have to take
> > > your equipment to a test facility (like we did). It's not something that
> > > end-users would want to tune themselves.
> > > 
> > > Most of these settings can also be done using pin strapping. I guess it'd be
> > > helpful if I added that to the description.
> > > 
> > > 
> > > > > +  ti,dvi-mode:
> > > > > +    type: boolean
> > > > > +    description: Makes the DP159 chip operate in DVI mode.
> > > > Ditto. Both describe policy, not hardware.
> > > I would set this flag if I've soldered on a DVI connector instead of a HDMI
> > > one. I'd consider that hardware.
> > Do you need to set this if you have DVI monitor attached to the HDMI
> > connector via the passive cable?
> 
> In our testing, the setting didn't appear to have any effect on the video
> signals. Activating the I2C interface blocks the pinstrapping setting of
> this bit, that's the only reason it's there.
> 
> I've been digging through the datasheet. It appears that the DVI mode
> disables an I2C slave on the DDC bus, when in HDMI_SEL mode the datasheet
> says:  "Device configured for HDMI (Adaptor ID block is readable through I2C
> or I2C-over-AUX."
> 
> Apparently a better name for the pin would be "disable-adaptor-id-block".
> 
> Another approach would be to just always disable it in the driver. It
> appears to make the retimer "visible" in the DDC path and even allows to
> change some settings that way (most noticeably, turn it on/off), which will
> interfere with the driver's functions. If we're directly controlling the
> device over I2C, one shouldn't be using this secondary interface.

If I understand correctly, it's a part of the DP++ standard, so it might
be a good idea to keep it enabled.

> 
> 
> > As for the connector type, you can check it in the .atomic_enable by
> > checking drm_connector::connector_type.
> 
> Assuming this is the last bridge, yes. But see above, I suggest removing
> this from the bindings and just always set it in the driver.

-- 
With best wishes
Dmitry
