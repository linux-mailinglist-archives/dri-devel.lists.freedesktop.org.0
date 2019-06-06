Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C737A1C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824AE89327;
	Thu,  6 Jun 2019 16:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7877189327
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:53:25 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s27so1697477pgl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zGrqsmVewnpRBL6cgILQS0mdV4kn0nEbbTIMAtPnZ+0=;
 b=mb3Ok55WCFdVk3h4SBWNpQes3oV+RL5f53xir0YwaRF3p3yvupkdbuaZTC8KsdIMO9
 SpdSHs1iKYQHpmdAsmuyvjqGgI277u73qHjo0UxoWm02v72NzkBI75/saZKETRf/bVg+
 KIRTf9rke8WLN4iEStgS1dFrwii/UESPp7AAo8zQ16I3ZgkyN6ni2Z2RnuaeQY7TDE80
 /Ow6JriCFywnjuA7xNzpKjiWWbjig0Uo7+FH5J7EoXETMw/ffDyr2feo+cAO1ZqC5DRp
 IHKdnkv9Dq8w1lzcR4y2402HOyVE7SBHkX0h3saxK4OYaBVLeS5hsQ/1Oa9zR9REg1rY
 zRkA==
X-Gm-Message-State: APjAAAWVNyiHY9fOLp+BwYBAFOV6tv5S/VhCVO79JxrfF3CJcaB3FmJe
 tn2eSZk/DCRtHIOqtwy4trmulw==
X-Google-Smtp-Source: APXvYqxZ4JQdtqCpus9ijZY0A4itD2/gcxz6vva8D0mzSp8j3sFAes2+/v8tO/ZWyHXyyw0rHJanlA==
X-Received: by 2002:a65:520b:: with SMTP id o11mr4270398pgp.184.1559840004995; 
 Thu, 06 Jun 2019 09:53:24 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id g15sm5711877pfm.119.2019.06.06.09.53.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:53:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: Add support for XBGR8888 & ABGR8888 formats
In-Reply-To: <20190429075238.7884-1-narmstrong@baylibre.com>
References: <20190429075238.7884-1-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 09:53:23 -0700
Message-ID: <7hblzafyf0.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=zGrqsmVewnpRBL6cgILQS0mdV4kn0nEbbTIMAtPnZ+0=;
 b=BSqi0C2QpXTjyH/B1kVfcYczMGoJJzapcHSKvOz6LV0IIIDSFaGv+EF8ULJghex95X
 bVVg8Q4OJtZf1ZNH/uJZKqEHDQwdjmZSGofFxXOhMFsizAuOjtaqb55JrX/Z3M1qADiu
 XOpO7NAcmvvb19l488bihdEov0+9zp2MoK124Gji15egxg4QRCYgCBUFpUZ+8enfpnZK
 oSS0k+dDTj8R8SO2spVt422LdwjFCYu5kih9OGSm1GFN5vWDElPfetT4y7tJJR+6GrRG
 M241gxaRtBUsB0irpw5n45jxZJJj53Ufa1xDc+l/CsYU81gvk+bc7qmWx2RsnyAxJ5pX
 Fxow==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IEFkZCBt
aXNzaW5nIFhCR1I4ODg4ICYgQUJHUjg4ODggZm9ybWF0cyB2YXJpYW50cyBmcm9tIHRoZSBwcmlt
YXJ5IHBsYW5lLgo+Cj4gRml4ZXM6IGJiYmU3NzVlYzViNSAoImRybTogQWRkIHN1cHBvcnQgZm9y
IEFtbG9naWMgTWVzb24gR3JhcGhpYyBDb250cm9sbGVyIikKPiBTaWduZWQtb2ZmLWJ5OiBOZWls
IEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpSZXZpZXdlZC1ieTogS2V2aW4g
SGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
