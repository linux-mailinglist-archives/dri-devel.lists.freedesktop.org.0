Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6143D235
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798F66E8DD;
	Wed, 27 Oct 2021 20:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD816E8DD;
 Wed, 27 Oct 2021 20:10:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 2E3C12B01443;
 Wed, 27 Oct 2021 16:10:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 27 Oct 2021 16:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 RFcMHqahWOcsuN+fSNttIEGwMPzwxHhTO+aiGzLgY34=; b=QUaE0++APXMQV84A
 Bvlgt14PwgCRxnjOAd6wfeetrHonFlVKUUdkeFKY8zeWD5YrnFFbKWk5ZFxuUYiZ
 IndXiJ9myYs47tYUB9+dha6GXhU9/AzOoQDNBpGAz+g5P5imoX9o0Yxrox+Qz/EW
 RX+WffEoY+xfg2OBVgtMmMX1BF0YykcfyvBNwGRsgXMJOF8dwjbum3CGfzCCru2n
 3/mnTHp+rjYr0JjvLGrS/POTW1NQHewYKznPvAwMWMLlfTO9IdebOOwyM4YBGexa
 pGajJTlaBsDEkT8I4CKhiWScMte7L/XqJU75a0sASMJTuu2hl2Jg9PyEfGfn1H9y
 /2otnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=RFcMHqahWOcsuN+fSNttIEGwMPzwxHhTO+aiGzLgY
 34=; b=bsfpei8QRHujDs6vre2cl821rhfKVU2wp2OoLV0kNIXUn2KHb1cD3W8vY
 /gb4q6kfXGGbFfIEHs+YKHaOWz7u5iBc3sZoAh/rNIY7JLiZZz3Oq3QBvvxFKH7T
 bTKI6kSrOzAiyTfzNxZKxQ/awfUWNB+74BqQA+rndayto4UNpLDaj04QF/XU5Evp
 nvdBNThG3PUsuLG/AIYtyhVX2GNvf8j3Lm9RU5HhjVgy6yfJfnKO2rPmSTjD241p
 xBb59aSrJV534iY4dZB4A4/WamZ2Gi5FdfDFeOd+7jaM0VeSFxF+Z2k2CbVXLh+0
 Sl9CC4v/J9y9VcqYshSJupdwFqRjg==
X-ME-Sender: <xms:L7J5Yb7syN9q7898T3Z4jvDJEiFaN7qQmzywGFKYYEGJGiUxv9lGbQ>
 <xme:L7J5YQ6dXRgLAFsMnWR54-eIy-b31mGMALNxkvq-uA4i7tIWeuH22PFkwIR2tCkMM
 UNwAl8PV1yooB5atHc>
X-ME-Received: <xmr:L7J5YSfLPl-qpH4ef2iA2voWx_PKhOKXB0RZz2Dh1MhdbfzdIT8E9tRpzamEOTyqHrgFi83P3ITH-QWxsfVcZf68tgBN9b_5y155odt1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L7J5YcL1GFfFi0DtI66hCufAoFQCCJJznmVgm4PXuTcQsf8Pv_SKPw>
 <xmx:L7J5YfKziIn7EAqgXJ82Y3B6Q9wCdpGhcdU9Fl0rwIijql6D_j4oCA>
 <xmx:L7J5YVym3qCRsz7fJk63Ns58eDgJhG1aAfgfvVMb8_mJPbMPbtO2Wg>
 <xmx:MbJ5YSIxH-NKPj5p5vZ2RrV3E49C-u3hjqaXReOeKZ-wZB0xRQZKazaKH_I>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-samsung-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 05/21] drm/bridge: lt8912b: Switch to devm
 MIPI-DSI helpers
Date: Wed, 27 Oct 2021 22:09:36 +0200
Message-Id: <163532324663.18245.3762655755657411905.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-6-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 25 Oct 2021 17:15:20 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
