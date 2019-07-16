Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB36B732
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66956E26C;
	Wed, 17 Jul 2019 07:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558036E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 14:12:47 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id u15so15693741oiv.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 07:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2XmDxxbJ7tU8jfvsRxWlaoaHsfnqizOFxorb/Xd+co=;
 b=Zr3l4zHgw1jY04KY0ToFmM46S5NUWtvDhj/V8HTfpZ96d8Ove7l3n38+YlfG23sVwM
 TEVE4X7azsr+GI2wdTBkhR8rSVDwDWOa7J1s6bH/++tU/GqwS1EXauuKL9mG4q+Gs1Ay
 lgQEOUoeOIftZIfphxf548nsVW9WbI1jW9tGaZx0Y1Ixu03KwXw1htFflp/lit28Rbit
 YncSLTo6z/omlSubECWYULj84T8PVKJkjaKQ594Vlnut21Mh/dmJqeuofL63ADV69uBL
 WILYUseeXeXmvUNDIL0KnCJTLdaUeJt3mOcWa/0n35B1f9J4OcqzERZaYVsPaJx5qItT
 7QNw==
X-Gm-Message-State: APjAAAXpiEkdqKWyqdICg/K17ac8JsE/BazvFtvdGtf+c7d2FgJOEUR2
 ewDsxNRi4geChviBsOwcFehHLcM2r50DBsFDodLQJg==
X-Google-Smtp-Source: APXvYqwhUee7Js74E9R15ZB55hgPPsCjc9xmGxHsFteJRH0BqOq9zdyWRfoMvFTu0iFTMewZbXes9U0eh+oPZWTTRe8=
X-Received: by 2002:aca:4d84:: with SMTP id a126mr17188257oib.23.1563286366223; 
 Tue, 16 Jul 2019 07:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-3-cychiang@chromium.org>
In-Reply-To: <20190716115725.66558-3-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 16 Jul 2019 22:12:35 +0800
Message-ID: <CA+Px+wWuCBvWra8+=szQOrvr3iv2YPMeoHHVtJ1vmaZWEEQ44A@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: bridge: dw-hdmi: Report connector status
 using callback
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=h2XmDxxbJ7tU8jfvsRxWlaoaHsfnqizOFxorb/Xd+co=;
 b=Py5/obzLg1G6q0q9QNni2A4i6WspW9cxnxlS1QfRxEg9BRt1PWoOjwnaxWlw95wDhQ
 zk2XLC499vm6MTxijwxdPPDVhCQaRCFyw+qJHWt86AFA40hRMjwDOMZvCgKaj30892nR
 3Y8vkOpVAnYdsAR5GQ+/ylt+8cSq9qlPxSumsex88ZyIHEBPsauTOuHf7FrJRJlSNJ0G
 xBmJ7n3Wiqq/pFgIxlIeJn3Ms4InCCNSdUmRXMfbYZ6pVE4XIRvI/r3dn+K84uxn5ttw
 1GFLELKY4droqXKN0zwWh5as8vN/6BK+LpPAHSpEFtr3f0XWt77DBVSuhXUHhjHdb072
 ArzA==
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgNzo1NyBQTSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5n
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBDaGFuZ2UgdGhlIEtjb25maWcgb2YgRFJNX0RXX0hE
TUkgc28gaXQgc2VsZWN0cyBTTkRfU09DX0hETUlfQ09ERUMuCj4gVGhpcyBpcyBmb3IgdGhlIHR5
cGVkZWYgb2YgaGRtaV9jb2RlY19wbHVnZ2VkX2NiIHRvIGJlIHVzZWQgaW4gZHctaGRtaS5jLgpO
b3Qgc3VyZSB3aHkgeW91IHNlbGVjdCBTTkRfU09DX0hETUlfQ09ERUMgaW4gdGhpcyBwYXRjaC4g
IFRvIGhhdmUKZGVmaW5pdGlvbiBvZiBoZG1pX2NvZGVjX3BsdWdnZWRfY2IsIGluY2x1ZGUgaGRt
aS1jb2RlYy5oIHNob3VsZCBiZQpzdWZmaWNpZW50LgoKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL0tjb25maWcKPiBpbmRleCAyMWExYmUzY2VkMGYuLjMwOWRhMDUyZGI5NyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL0tjb25maWcKPiBAQCAtNCw2ICs0LDcg
QEAgY29uZmlnIERSTV9EV19IRE1JCj4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAg
ICAgICAgIHNlbGVjdCBSRUdNQVBfTU1JTwo+ICAgICAgICAgc2VsZWN0IENFQ19DT1JFIGlmIENF
Q19OT1RJRklFUgo+ICsgICAgICAgc2VsZWN0IFNORF9TT0NfSERNSV9DT0RFQwpTbyB0aGF0IGl0
IGlzIHdlaXJkIHRvIHNlbGVjdCB0aGlzIG9wdGlvbi4KCj4KPiAgY29uZmlnIERSTV9EV19IRE1J
X0FIQl9BVURJTwo+ICAgICAgICAgdHJpc3RhdGUgIlN5bm9wc3lzIERlc2lnbndhcmUgQUhCIEF1
ZGlvIGludGVyZmFjZSIKPiBAQCAtMjAsNyArMjEsNiBAQCBjb25maWcgRFJNX0RXX0hETUlfSTJT
X0FVRElPCj4gICAgICAgICB0cmlzdGF0ZSAiU3lub3BzeXMgRGVzaWdud2FyZSBJMlMgQXVkaW8g
aW50ZXJmYWNlIgo+ICAgICAgICAgZGVwZW5kcyBvbiBTTkRfU09DCj4gICAgICAgICBkZXBlbmRz
IG9uIERSTV9EV19IRE1JCj4gLSAgICAgICBzZWxlY3QgU05EX1NPQ19IRE1JX0NPREVDCkFsc28g
c3RyYW5nZSBmb3IgZGVzZWxlY3RpbmcgdGhlIG9wdGlvbi4gIFNob3VsZCBiZSBpbiBhbm90aGVy
IGNvbW1pdApmb3IgYW5vdGhlciByZWFzb24/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
