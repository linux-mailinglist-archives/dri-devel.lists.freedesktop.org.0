Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B652171
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 05:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0C589C48;
	Tue, 25 Jun 2019 03:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7712C89BF6;
 Tue, 25 Jun 2019 03:59:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j29so11539528lfk.10;
 Mon, 24 Jun 2019 20:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ne8A2cDgNm1H+XBCR1KqEC3IC1t0ovKTdfCojlwi1ao=;
 b=WxAkf8VbvU+0J1tJWH7uuvLThBfJfk8nA6+QEg1ICVfNV+87wAQOdOWSCZN5CpI7Is
 8XqqODI6vi9pStlaRyhZvRolN5zbBg4QwPONFmmMNeCEYe+7OSz+zQoDHBLseben4OWU
 M1oFeFep3cLeQE0yJDpSye8+SSm1djQi7Dujve4aJ9psoQdOj8vyXkjLxiGAY5WlAUrs
 +pCm54/zTom91nfnl4iSskDBO3vd8t8cjCIPfLlKdinVZEY7HPfPtUe1R/QVRNS61n/t
 beWEfmLXXyLtDiwQC6MURcqt9uW/QRfW92dA+NaWMyD7iv0bWLUz4IT/tl5DluwvtvrN
 DeJw==
X-Gm-Message-State: APjAAAUCuN+NWfjcSoPM1XbKYs1orCWOoWd35gBlXs0ooH98HjxV5jkQ
 owlULXmGRBMG9iFM9WHBNk2lMuhYjI/BnN9Tp/U=
X-Google-Smtp-Source: APXvYqz66C0jiYfrR4IdvROVdrfJ3yjlWkj559yXVop6JDKW+edQk+UMJIr3y6QOSGaTpOV6lwg0OsD6BCsKmnlg4AU=
X-Received: by 2002:ac2:44c5:: with SMTP id d5mr28686575lfm.134.1561435169542; 
 Mon, 24 Jun 2019 20:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190618011124.GA67760@archlinux-epyc>
In-Reply-To: <20190618011124.GA67760@archlinux-epyc>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 25 Jun 2019 13:59:17 +1000
Message-ID: <CAPM=9txaQ43GwOzXSE3prTRLbMt+ip=s_ssmFzWsfsTYdLssaw@mail.gmail.com>
Subject: Re: arm32 build failure after abe882a39a9c ("drm/amd/display: fix
 issue with eDP not detected on driver load")
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ne8A2cDgNm1H+XBCR1KqEC3IC1t0ovKTdfCojlwi1ao=;
 b=uId4Cc6JusYfOzWPJIQyRNt9AB/zfpsO9gUP1iUtpXZ89/cmzWc7lekj6i8nwz2M0A
 bkV802nW55R0ILIr7vIXoFFlip7GHgYo6ZNlQjiViz5HWzJq4PxZog4vDFA1POQ0lj5U
 rVtOEFngdrWHOcSm3y9vtMsnD9W9K8rDlzl/2uG40E8Jpm+vLiGMewqeLyEiqafgPcTg
 PjrYoSZ2A1xFy78Ya5+GQqIX4OIY0CpYYasoE9JFGUFlP+chhHyNr3m3dX4/ZCtbhdMT
 bgIGjDX56mZndI1QxLfoigpNapdl4i5vp8Mb4w0hyrViVcNIH+aUilzy1h7kXD8j10WC
 xelg==
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCnBsZWFzZSByZXNvbHZlIHRoaXMgQVNBUCwgSSBjYW5ub3QgcHVsbCB5b3VyIHRy
ZWUgd2l0aG91dCB0aGlzIGZpeGVkCmFzIGl0IGJyZWFrcyBteSBhcm0gYnVpbGRzIGhlcmUuCgph
biA4IHNlY29uZCBkZWxheSB0aGVyZSBzZWVtcyBwb2ludGxlc3MgYW5kIGFyYml0YXJ5LCBhbiA4
IHNlYyBkZWxheQp0aGVyZSB3aXRob3V0IGEgY29tbWVudCwgc2VlbXMgbGlrZSBhIGxhY2sgb2Yg
cmV2aWV3LgoKRGF2ZS4KCk9uIFR1ZSwgMTggSnVuIDIwMTkgYXQgMTE6MTIsIE5hdGhhbiBDaGFu
Y2VsbG9yCjxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4g
QWZ0ZXIgY29tbWl0IGFiZTg4MmEzOWE5YyAoImRybS9hbWQvZGlzcGxheTogZml4IGlzc3VlIHdp
dGggZURQIG5vdAo+IGRldGVjdGVkIG9uIGRyaXZlciBsb2FkIikgaW4gLW5leHQsIGFybTMyIGFs
bHllc2NvbmZpZyBidWlsZHMgc3RhcnQKPiBmYWlsaW5nIGF0IGxpbmsgdGltZToKPgo+IGFybS1s
aW51eC1nbnVlYWJpLWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLm86IGluCj4gZnVuY3Rpb24gYGRjX2xpbmtfZGV0ZWN0JzoKPiBkY19saW5rLmM6KC50ZXh0
KzB4MjYwYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYmFkX3VkZWxheScKPgo+IGFybTMy
IG9ubHkgYWxsb3dzIGEgdWRlbGF5IHZhbHVlIG9mIHVwIHRvIDIwMDAsIHNlZQo+IGFyY2gvYXJt
L2luY2x1ZGUvYXNtL2RlbGF5LmggZm9yIG1vcmUgaW5mby4KPgo+IFBsZWFzZSBsb29rIGludG8g
dGhpcyB3aGVuIHlvdSBoYXZlIGEgY2hhbmNlIQo+IE5hdGhhbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
