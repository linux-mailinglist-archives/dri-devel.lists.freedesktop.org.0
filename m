Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D9646B36
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 09:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85A110E47E;
	Thu,  8 Dec 2022 08:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE76310E47E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 08:58:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id C9280580400;
 Thu,  8 Dec 2022 03:58:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Dec 2022 03:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1670489910; x=
 1670497110; bh=tooDwlIC7AZxevGK2gsaN582jvPWJq/aK8UKAGTQaI0=; b=u
 g6R88x4QZk3vqHrpUoXGXedl8X7JuAmNReet3tdhc3FFeJZw1cQ6E646JhIrgNt+
 i4hKeQbUB/bn9+IXYsxKvCytJDIHs0nq8UmjjDwI3NPPgLqT03jrixVWuEu0zDhU
 HZ8XS9mwXwmTVnFAY4mK6WGRIQoPcOB6LPzo6uqnkUnC6+xHF9DsKmt5trstb3pU
 GpTkUGtbVf/bkWCpk1fSEExjbQ7z4HqGmr2JwA+mLoR0jN7AMdwPFstAKmeNebjo
 Bl5C3k+1ync5c+fDdEro1y0fRbxnGjDhcTi2eyb3GSQ3gbAGutd4BMXBxi9jTPu6
 u0q/NSb2XYXRv+mXASCoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670489910; x=
 1670497110; bh=tooDwlIC7AZxevGK2gsaN582jvPWJq/aK8UKAGTQaI0=; b=Z
 DPRAE5xrL2xPGwvJMx8NCyQuX0ELUDFSfV8N9CXWVrH5pNmAS5k2QuckZfuLack3
 OzAxEdzlc5HE3vaxr9Enef8P+xNgrPCy2MOqtfrbnAWGLPj/+ExDf6CeH9uXHIe0
 v/WXYqVMu3PogTKM+6UkyUAUhkg1lw8aDYPdHQQp65TQ0pvjTwTBmvyX5Tt55qWp
 ztkcRN4+HTcp3dHzaLod6OgacNS9M8JiqNyHX9zYCxHzsl3CBEBPxvUMjWCShe78
 yK1uhjrMop/c3XoaIUPBtx7GglM+hkYqjvHjnwI0YKEqkjinI3H6SwQM0q4kRB6S
 lnRjZIWD/R2iwFI55UR8g==
X-ME-Sender: <xms:NqeRYwnU-9XkJjEkgKK508K0hMs6wojm9cMw-4MYyPnU7VJzEj1YPQ>
 <xme:NqeRY_15--qZGc_GV9W9ww_7f2U7VNDM0v28xF5loCuV4aFeLPSRn-qgZMLFZ-vAl
 sUcLKyCmeCREOU1V5M>
X-ME-Received: <xmr:NqeRY-qWSM8gWsSNB56-FPskdt_SJbePxpflvIsg9UvnkGxQj0veZOFykVdS26u-xFYaHr9cBlGg0kDzJON4k80IKFbY49ycywsLa3YDxwdK5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepieefieeglefhheekledtteejteeuleetueevkeeuveffudehffefhffh
 hefgheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NqeRY8npGcqOKarzHYTUKfm9Zg9AqJ4UhSXD7x0LZXk8_CY9r1CBXQ>
 <xmx:NqeRY-3komStJyir3q-tDoywZsAm2I-Kvzm9fj1YbHJfxFqhHJIkJg>
 <xmx:NqeRYzsDa0QIaUiChF3izjSKefejmpklrWduWXG821saM2PATj-PBQ>
 <xmx:NqeRY70Hjayo4kyZ4PCAHMCSW_Lkj7sWP6IIYf8bDgaD0pGrFYd65w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 03:58:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
Subject: Re: [PATCH v3 00/20] drm: Introduce Kunit Tests to VC4
Message-Id: <167048988433.2773435.3606690338900284199.b4-ty@cerno.tech>
Date: Thu, 08 Dec 2022 09:58:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: linux-kselftest@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ma��ra Canal <mcanal@igalia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, linux-media@vger.kernel.org, Ma��ra Canal <mairacanal@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Dec 2022 16:11:31 +0100, Maxime Ripard wrote:
> This series introduce Kunit tests to the vc4 KMS driver, but unlike what we
> have been doing so far in KMS, it actually tests the atomic modesetting code.
> 
> In order to do so, I've had to improve a fair bit on the Kunit helpers already
> found in the tree in order to register a full blown and somewhat functional KMS
> driver.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
