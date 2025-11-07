Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7AC40325
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441910EAD0;
	Fri,  7 Nov 2025 13:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZkupkSb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4Vv/yjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06010EACF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:53:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7B0WXB2878653
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 13:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/VVmRg18NY3wj2ZYE0m3Jiqj
 XMFW7uHzd+kVJOSzKrY=; b=aZkupkSbWyTHdHRM8bQYeP9AqR0UZ0zH4tq3AtYE
 4Sdz0i9IJmA96W8xvTYSnFnbfMZksavsZWtm3bBtdBck0lO0+UhokJj5WDoL0SE6
 Ifb6YuqmuDEhlP2KcBMTm+7dTi84Q1rffRPYrc7uh6IHTXIAoVVx2MNk5BwuIMrz
 Lqu1VWiaIKCChJyQnj+E+W2qOwZYJepNfOuXOinKGF29s4BWRZSG725ISQ0q58C8
 Dg7QFWeY3or/EoTDoxByrSi0Ev079uXY3pZqbpQw4o+yS0CESAVVm//101Yv1jvI
 qohadK+9fXx1cFXWPGrt75E5p+Kid2UK1qVJzzP7vk1Vfw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fh1rduc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 13:53:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7aac981b333so831681b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 05:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762523584; x=1763128384;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/VVmRg18NY3wj2ZYE0m3JiqjXMFW7uHzd+kVJOSzKrY=;
 b=V4Vv/yjrdwpw8ja9xmIpn5QhD244xRrAG2i4u/CWkmsJu40Jz9y1RcvnnO2v5KvLYd
 JZS+/y2B9ouOaL5eGyw7hCfyZe+XL6Q7d0KAnXxu19UkxQ2dVV8qqy2Rmqsak14rfokg
 TGomH96yTuN6ad5iapRgxw/awhFbv5mV4xRB4I1YHusc7+Oc+D2MhT87Cif6Laf/AuVT
 agrEJMxwrnJRuan1BhV4pAVRpVBkAB4fyr/cux+FzaeEzw20bDfVsnKoDI2YBsgDVW5a
 oBV1OQJQHeVy0q7mima66rKH/n3kM9vaUrFCXGNG3noV4rH52oGh3GbuR6HUiLa3Aezt
 O4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762523584; x=1763128384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VVmRg18NY3wj2ZYE0m3JiqjXMFW7uHzd+kVJOSzKrY=;
 b=MwCsBi1eo14M6oTh8xBajMKcOvNelGskxaV7o8gaa2sDlhW+LrhXv9aEV5f1mIGP58
 ltVhaUYW/s3ULdvGSUq0qZ34iu0KN+QNprVBaIEgyZp5paJlsGQZoficSlob/IbkRDcq
 mZ02v6tyCmyhTZCdSJ2WMEdD5RUy5bwo762jpJW8zNkTgFKKs2u7vvP67w2biyd71Z4g
 FkEqPnuEFv3rrb3qUdvA8diYcvu8VRvR9OHHSq8pLU9g37Ju89l8FOLSwg4eChztYVLF
 KWn/nx1RIBE35HJXl2BNHwt5cvhKWu6tsbNT3tWw6x6nlN2L5sclXSC0ZlsgojWQ0wMG
 Ek4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR2iwNshIUDo+xAnrea+4ntJcCkASRUkUv+61mDmJ8U58t78MW80/d1r1uoAwf2t8v8cTrVOt7ipg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDxCHOmDACcPETp/Tzz2J47LW6HJ1RDoyLfpfcYclKkdwhz7Eo
 jMihZ9vfQwAWEMAs+4jzOcXvirl2gAOtLT5AJHuRpQkiNZQFs3Bv1gAFqY+iT1lzcqX4hle0VJz
 7X2OeOA6iUJ6fv4W3TYqopWSLOTH6olTZKc3/Z/sszNjN4ote2KjVQwkJFdBRlniOK5bNlg==
X-Gm-Gg: ASbGncvt1+7tqcKdcudizSPZx0nSxFV3lqvpNwi0XtE4RtRPhn4VEVgQ8ccfE4b97E6
 fGxCe1/bgP2FOtpOljHzaiVY2eTL03IiSTQSJl/wN79ow6lyh9FZH84HuqYjNW6xLculGybxvig
 8zavkc3omGfSTozwdrQsuvRgClNH7DdMoUxSCyI3t6xUV4X72ClAD1Lwn3vYWgGW30tBbNgHVF5
 KZnXsP6QX/zspR6BL3BJUgvPx8FcQJsZYGx/t4a9kRnksaL5V2A8Vmw8L6FXXZwHpE9avhKQaxU
 1K6B3jP4Uco+t9xhx0GPFdbbTrPpsK56OMszv3k3qBBSqVyjKf/AM9ahcdMoaKP9U6P396Byjt1
 tsbrpAnp+ekUVwmyLbiK0sd26
X-Received: by 2002:a05:6a00:3cd1:b0:7ab:6fdb:1d1f with SMTP id
 d2e1a72fcca58-7b0bdf66564mr4419033b3a.29.1762523583589; 
 Fri, 07 Nov 2025 05:53:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2KL3sD5hZ70NkXwEbmWRrK4jE3iJ9mGDdh1VUXj2/vuQfkmiiPTTaWojwx6gzMqeCFkjGnw==
X-Received: by 2002:a05:6a00:3cd1:b0:7ab:6fdb:1d1f with SMTP id
 d2e1a72fcca58-7b0bdf66564mr4418992b3a.29.1762523583018; 
 Fri, 07 Nov 2025 05:53:03 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0c953e2a4sm3160357b3a.6.2025.11.07.05.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 05:53:02 -0800 (PST)
Date: Fri, 7 Nov 2025 19:22:54 +0530
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <aQ35tvwp90qm57Cl@hu-nlaad-hyd.qualcomm.com>
References: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
 <20251107-add-lt9211c-bridge-v2-2-b0616e23407c@oss.qualcomm.com>
 <30b5f19b-1ce9-4239-bf0a-d83d647608ce@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30b5f19b-1ce9-4239-bf0a-d83d647608ce@mailbox.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDExNCBTYWx0ZWRfX+nVlIFEnXZ3O
 gOOU2JJj3LeVb6s2gpCalPl13rNjYCv0yOI9F+5rdaMwM6AuV3NKJN0fZthACpLWu1pXrIWlvSE
 TK45gix8MSpOHXwrXjS7+rHwMHRzuuQhnwjC0maFh3hF4IkKuqKksJcnaIHTOUSYKBBlIL9h//L
 tZHydRWO7jdLit33RaP0FyV+vRhMxXVLw6XD9w0YHJ7Lg18izD4rNbS2uyETxbI2u7KZD1ya1Dj
 /SwIny14qIW6Su2vYBVvzozbIO8+4sQlrUIgmzMFF3NBzwE7166oR1f3jLWIObl2B7u7PTsT3Fx
 taiLBgChQqQQAv+EGCnoEz5PG2M1b32/R+iivYgKZdfNZt1bEXYYiqVjTkfQQaSFIR4qyY502Nk
 Y2OeYmBj/QLSHTOH4Q3ZZrKwwV8CQQ==
X-Proofpoint-GUID: mNgRLz7VEEPTDvoO6_LEfRrmf1BZ3rBe
X-Proofpoint-ORIG-GUID: mNgRLz7VEEPTDvoO6_LEfRrmf1BZ3rBe
X-Authority-Analysis: v=2.4 cv=IcuKmGqa c=1 sm=1 tr=0 ts=690df9c0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zAaMOjnD8X0J8WzHdTwA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070114
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

On Fri, Nov 07, 2025 at 02:20:58PM +0100, Marek Vasut wrote:
> On 11/7/25 2:02 PM, Nilesh Laad wrote:
> > From: Yi Zhang <zhanyi@qti.qualcomm.com>
> > 
> > LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
> > Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> > Add support for DSI to LVDS bridge configuration.
> How does this differ from existing drivers/gpu/drm/bridge/lontium-lt9211.c ?
> Can existing lt9211 driver be extended instead ? If not, why ? Details
> please ...
LT9211 and LT9211C differ completely in register programming sequences.
Even lontium mentioned that register configuration are different for lt9211 and lt9211c.
Nearly every function would require duplicated logic with if (chip_type) branching,
as register sequence are completely different.
Having both sequences in single file is not looking good, hence want to merge as separate driver.
