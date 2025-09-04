Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA8B42F9C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F295010E3C5;
	Thu,  4 Sep 2025 02:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYWdy/0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F00C10E3C5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:18:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58404A4P005224
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 02:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qkFwydJsxqdgKqOJsAZ1HDk8X8ftVkpre+cMSSd/UDM=; b=HYWdy/0/zGXNvniC
 YSpkv3GBj1r6CrCdX69ovIPoytEWNU9RERQfYcx2oTjSxWrQ7mq8T1eTnMmsmgWZ
 VTYYhktA8UPp+u2F5OfPKogforhOErJ0WP0PM5XXOU6igHHSexuX5OiEZzwPt8mg
 jS2IflRnkmp6N7BXM0Tz4p+1sf7wU6L0RuJz3V4XMNZGXSeL59g0a8Tf89XjNSBA
 0hhw0v0Ls5ul5tK4y06uwohAFQIsed+krasNFCaJobCHRcOX3V9j2Anc77/MZt/0
 kwUL5ecFYDDWunFW/R4ZbPdl1Ra8lyt/xdj38Aa1MHNhdjDqnPwOuA3Lxa/dDPNl
 pzvbvw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjnsmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 02:17:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-726aec6cf9fso11708776d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 19:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756952278; x=1757557078;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qkFwydJsxqdgKqOJsAZ1HDk8X8ftVkpre+cMSSd/UDM=;
 b=WZy4zUN5xUsitWIo57514RkUEVlFi2zY37LRS2VP4sLr8QUMnxv2jQilNqFrexR3Me
 SQO5BmKrpG7iIyKUvs4fm0fDqj/1O4QtilXuaH157nLLu037I2QIvxHp/aUt4ZgOqEYF
 H4QbVrqeNFnf5FyqJilbKvmgaiFBurN4LRGFW0lIfY/Y0VcLveILyS0ayRJXGjM+zWD6
 +PpOT0bzRyJwkjFRJK8dZO13QJaB0bh56aP1+XX1b4b73SccIhNUH2Wewj4AfzdCP01a
 nDDyIcAFDQ23nVWheMPnCkb2+sCCJr/CBbcBOgM+4ZvD9N9WSQDbhBUi45SM3Kjj5zz9
 Yg3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjrT2GPdtMRo1Zh3bft7heZbLCQ7UAURHMj2Zqp8oG1uM+P+75EN3MiFE7joCiZdpwPxID88r6rek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKOtdeiEp5f4ugixgOcQRVl9Nb/OIxW8HpkEbl1TMdjlSFZyg0
 qgjC2OBqojKlAm3AKmXnfbYmHdbI37McXqOapOSPAUVADDrTmK4Lh7S15jNjYKJRmyFMRHk5tft
 plzH5pMBQ53MgHltgs8BswFMpB15cMqX3O2FuETeWPwg68WOY1VbhxHAT5qNbYiDhdqWubB4=
X-Gm-Gg: ASbGncv0lo6qsPskwjsrJ/hVnrPwxaG3g6k1fLw7nyiuEiT1nMbuT8rtUD1WT/KdnKA
 XHSkHw7Am6VJYyLvlrGX6EaJYm63paNeb34zAsxRTmvMooXDKZ/32ZN5DaVffjJYiEg//vuyjhh
 nAHejkwn5k6fxXUXprd5qbkIEPTx9/nZARTyddqw88O+oipLa4jo1LT0bnKZS93PAq8rV8vpToX
 iiNuTTJFu+3L1X8JlBE3KVJSebx0nlaltE5N/jDQOS+wSrATcnGNVVZHuHklm9wzK410YQT3PDp
 ryzHInM06Ol0eSX2gLGDwcBzQYx57bs6WcgcClilndyiGf0bITLouQSRfMXa3EZT8t7zBe/Qs8d
 ktIS0Tdcow9TATcQRJItvJgr4eFw/7AzOo7BJFJcAH0pXHVjsi+MB
X-Received: by 2002:a05:6214:501d:b0:712:e30b:ef1d with SMTP id
 6a1803df08f44-712e30bf1f3mr189032736d6.63.1756952278139; 
 Wed, 03 Sep 2025 19:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpnx/oWiqnFeeBH9c95exPgNTFpxW3/4KJo+Lqf24gUbaClGKKsJlqB65JLkcbt0YEKckERw==
X-Received: by 2002:a05:6214:501d:b0:712:e30b:ef1d with SMTP id
 6a1803df08f44-712e30bf1f3mr189032376d6.63.1756952277581; 
 Wed, 03 Sep 2025 19:17:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab928f3sm863017e87.39.2025.09.03.19.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 19:17:56 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:17:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <irvff5zmeqyy7yn3idc5rr2ekx5gmpcib45rrqk2vhkt33mdy4@q346i2jkehtt>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <5255838.1BCLMh4Saa@phil>
 <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
 <aLismmDJfusG0x0Z@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLismmDJfusG0x0Z@yury>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b8f6d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=Fob2wsIVxNtBE8oepsMA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 2chtChPQceIuHWdt-BH_xKtzqv3a_tbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX1ZN0w0eM3zy7
 zeZA6vQgl7hqH4Ca+0CneHFj8/fmEaBS+gibUbGzu9GHthKtNIo+aaBlXaTvsIeozAp962ktEfV
 nb1m4wIn+0ZHpj+sxOnfg847uepplVtuqEWJHJSziNgRzTt8WMkSB9CSbWEsZs4HkktbSJtW4X+
 zSWlCyEJ/2zTeHJI/UtsdDz8CHdRcdSuJwZkO7p/3/hx/ihDmsmMpx5inHSqsrrbCBbFfD2qa6d
 hEbf34L1MzbcQSnkqFbum9VZE4NDXFg2gGVo4S/4jl+YGb/T0XXF+jqq3/YgOqQj8wOEanLmHlo
 tIQwPI/zgwSp1BdXk0sk/KzL8YXqkTcDTxlmrKD5YScVH8XqSp6rQmQ4YjJ/TsoO7MYUen3oOlz
 Mjf4+wR4
X-Proofpoint-ORIG-GUID: 2chtChPQceIuHWdt-BH_xKtzqv3a_tbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
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

On Wed, Sep 03, 2025 at 05:01:14PM -0400, Yury Norov wrote:
> On Wed, Sep 03, 2025 at 03:30:47PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 01:59:51PM +0200, Heiko Stuebner wrote:
> > > Hi Andy,
> > > 
> > > Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > > > From: Andy Yan <andy.yan@rock-chips.com>
> > > > 
> > > > Convert it to drm bridge driver, it will be convenient for us to
> > > > migrate the connector part to the display driver later.
> > > > 
> > > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > more like a general remark, this essentially conflicts with the
> > > big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> > > "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> > > 
> > > I'm not sure what the best way to proceed is, apart from waiting for
> > > 6.18-rc1.
> > 
> > I'd say, the correct way to handle would have been to:
> > - merge only FIELD_PREP_WM16 addition into bitmap-for-next using
> >   immutable tag
> > - merge the tag + all other patches into subsystem trees. Otherwise
> >   that series can cause a lot of conflicts with all affected subsystems.
> > 
> > Yury, would it be possible to implement this plan instead of pulling
> > everything through your tree?
> 
> Yeah, this is 100% technically correct way of moving things.
> 
> The problem is that driver maintainers are usually not quick taking
> this type of changes. In my experience, if we merge #1 only, we'll
> end up with just another flavor of HIWORD_UPDATE(), maybe adopted
> by a couple of drivers.
> 
> This is exactly opposite to the original goal of the series: nice and
> almost complete consolidation of scattered HIWORD_UPDATE() versions.
> 
> So far, there's the only conflict with the others, and Andy said he's
> OK to hold his series.
> 
> I would prefer to have all those patches in bitmap-for-next for a while.
> If there will be more conflicts, then yeah, I'll follow your route.
> Otherwise, let's keep things as they are, and encourage developers to
> test their patches against linux-next, as they normally should.

Ack, thanks for the explanation.

-- 
With best wishes
Dmitry
