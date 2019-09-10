Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D68AAED1F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 16:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC68189FA5;
	Tue, 10 Sep 2019 14:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F92189FA5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 14:35:04 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2D199258;
 Tue, 10 Sep 2019 10:35:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 10 Sep 2019 10:35:02 -0400
X-ME-Sender: <xms:lbR3XeLGvUx4O31kAw2oE1n5l3b6fsed1JR-zVy08lObam-UxyKvhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtddtgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepvddufedrfedtrdekrdduud
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lbR3XcGSgZBgfUJoxZBU4g8S3NN0RXfw57IHLBKmHhDJsEAasRbyAg>
 <xmx:lbR3XcWakchC9nsJ8YlQPtYqK5DzoQcbNHxshQdTHqBMSbyym-Sh6Q>
 <xmx:lbR3XSMePnZU-G5F6G3_gJC1yDjQfi6DXoXu20hx31ihEJ3K3AB3zA>
 <xmx:lbR3XaV84X5qhBZCloMBm7H7idqNjs0OLhwR7hNP8BIkyQZHYjIeNg>
Received: from localhost (110.8.30.213.rev.vodafone.pt [213.30.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE087D6005A;
 Tue, 10 Sep 2019 10:35:00 -0400 (EDT)
Date: Tue, 10 Sep 2019 15:34:59 +0100
From: Greg KH <greg@kroah.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.14.y 03/18] drm/omap: panel-dsi-cm: fix driver
Message-ID: <20190910143459.GC3362@kroah.com>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
 <20190905161759.28036-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905161759.28036-4-mathieu.poirier@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Yn2LW5Cn6NDpHwAp8OL/VHEBLuD
 Ea+FvY5tcN4UAkhY=; b=E1l0FDeU0uUFm7pcZuFCt4iz6yOAMuia+vNX5NgkfB9
 OZ+OCRjCjmAheEZ/c0h/S46faHhQNilYVNSjtRKtEaHY/kG/ecQRjLJyA2moFe/m
 QiGLzarjz3ucq0RiMxzat8L+2491N7JAvPBXH5i/on3KZHNI2lQwlnftpgcTIunw
 A2NMpap8CEX7RSvWM0WTG7HhOKYDG79boZ3pcNrA9xmbAaShQHWxTV1aAAcZUyjx
 xXnPucNsfVuZ2moPw5EHpIQCIY/t7qYRleuWKHPRmlKSbgnCLB/7ZJGL/c4QiN1X
 SMJaboUtlK9Z54p+uBTgSHA0yDYE70+fSngiiws5SHA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Yn2LW5
 Cn6NDpHwAp8OL/VHEBLuDEa+FvY5tcN4UAkhY=; b=NNHX+V7aLEcSUnQcXHmGE3
 nqfAJ1DZb+GMtyCwjtXktd01OmnSK0LMe3vSOTjBUaGAmSF46McHmEA3ASkbI6mz
 /a7H9PN7qTW/0XsNw2iOX08ic59QTPZhc/VAXM3yORb5oQy1ZG0BW7a7s4EI5o4A
 /YzepHaWkEb181HwyWTWK75/RkLk2p3ZQ4DqHJvdHCtGUCIF3dzUuYI803HJwnw8
 jT18H5KQNk2bDKCwVxOKJO+PNKBMJcHn8B6sFBa90EWFzc5AoRr0afIFIuRBIZlH
 sZLwttpozKF0w0dWRQ9TMqOwO6P5OOkSQC0WP40bhyaPhw7E+0td0sURk7cfXZKw
 ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMTA6MTc6NDRBTSAtMDYwMCwgTWF0aGlldSBQb2lyaWVy
IHdyb3RlOgo+IEZyb206IFRvbnkgTGluZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+Cj4gCj4gY29t
bWl0IGUxMjgzMTBkZGQzNzliMGZkZDIxZGM0MWQxNzZjM2IzNTA1YTA4MzIgdXBzdHJlYW0KPiAK
PiBUaGlzIGFkZHMgc3VwcG9ydCBmb3IgZ2V0X3RpbWluZ3MoKSBhbmQgY2hlY2tfdGltaW5ncygp
Cj4gdG8gZ2V0IHRoZSBkcml2ZXIgd29ya2luZyBhbmQgcHJvcGVybHkgaW5pdGlhbGl6ZXMgdGhl
Cj4gdGltaW5nIGluZm9ybWF0aW9uIGZyb20gRFQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9ueSBM
aW5kZ3JlbiA8dG9ueUBhdG9taWRlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVp
Y2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvLnVrPgo+IFNpZ25lZC1vZmYtYnk6
IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
TWF0aGlldSBQb2lyaWVyIDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4KPiAtLS0KPiAgLi4u
L2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyAgIHwgNTYgKysrKysrKysr
KysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKClRIaXMgbG9va3MgbGlrZSBhICJuZXcgZmVhdHVyZSIsIHJpZ2h0PyAgV2h5IGlzIHRo
aXMgYSBzdGFibGUgcGF0Y2g/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
