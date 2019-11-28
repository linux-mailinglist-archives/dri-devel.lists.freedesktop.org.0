Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCF610CA50
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 15:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32146E092;
	Thu, 28 Nov 2019 14:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80D6E092
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 14:23:35 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6604217AB;
 Thu, 28 Nov 2019 14:23:34 +0000 (UTC)
Date: Thu, 28 Nov 2019 14:23:34 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
Subject: Re: [PATCH v2 2/3] drm/mgag200: Store flags from PCI driver data in
 device structure
In-Reply-To: <20191126101529.20356-3-tzimmermann@suse.de>
References: <20191126101529.20356-3-tzimmermann@suse.de>
Message-Id: <20191128142334.C6604217AB@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574951015;
 bh=nKZ8EYGzj7PoNJzS7Lm/u8KvxbMYiRV+/O9E+55H/nA=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:
 Subject:In-Reply-To:References:From;
 b=A/8hv8zufSw85D79DuxoGX1miSL2fAmvk/MazGhTREF9CsJft9qcWgUtkqRcwxPWi
 t3cfKW8bZ6UcGi2cWuYtBmhRVLRDJH4RLUs/ojP+WZC/4lQFthlI7GnJViFjDmA6tX
 uxy0GcOLMN+/CLEQizOukag/c1wF+WH7XLPAd0Pk=
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
Cc: , John Donnelly <john.p.donnelly@oracle.com>, stable@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, José Roberto de Souza <jose.souza@intel.com>, Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogODFkYTg3ZjYzYTFlICgiZHJtOiBSZXBsYWNlIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3Rl
bSgpIHdpdGgga3VubWFwICsgdW5waW4iKS4KClRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9sbG93
aW5nIHRyZWVzOiB2NS4zLjEzLgoKdjUuMy4xMzogRmFpbGVkIHRvIGFwcGx5ISBQb3NzaWJsZSBk
ZXBlbmRlbmNpZXM6CiAgICAxYzM1NWMwZWNmYzAgKCJkcm0vbWdhZzIwMDogRXh0cmFjdCBkZXZp
Y2UgdHlwZSBmcm9tIGZsYWdzIikKCgpOT1RFOiBUaGUgcGF0Y2ggd2lsbCBub3QgYmUgcXVldWVk
IHRvIHN0YWJsZSB0cmVlcyB1bnRpbCBpdCBpcyB1cHN0cmVhbS4KCkhvdyBzaG91bGQgd2UgcHJv
Y2VlZCB3aXRoIHRoaXMgcGF0Y2g/CgotLSAKVGhhbmtzLApTYXNoYQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
