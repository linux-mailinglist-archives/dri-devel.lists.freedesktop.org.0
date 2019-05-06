Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4E15006
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 17:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592FF89A67;
	Mon,  6 May 2019 15:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1189A67
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 15:23:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w33so13390296edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 08:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=zADYOphlWUk/XuVpyDvL8xXYixf0rcBGFLtrl55FB80=;
 b=UXN+h+iC96I42NEC/Nhmw6aPW0vZVvoDizBRXxPdTOPjNWoZ1wdII/XgRikpulhseu
 2iq1ia6Z56aQf3FzvdB7xFUi0ZpXRTrbH9Swtgfq/JDVUmItqCELrqZ/FV9p6YvHzPzd
 CE02Ez8igSZbQk4rFobXTMM/fqWpcPPZV/ualYEpdLntcRjhJfpv+8SRyC/94OuEy0tq
 0vWE+oAJxmShlV8BHXxk6CIU5afKP15wo7q1x278IYUp9N2MX2tMvEyDM8KWngOdKiy3
 w1UXYHZGhsCcxGYv8YW5IKiLTe0tWxZzE8pWleMK3A+l4xZQZdH9n1OXVsZmNPbcuXS1
 ZpdQ==
X-Gm-Message-State: APjAAAUTYxeY8QDGt/hoB6SWdmG7XV2cLgsLHWr/lEl1A/QTzAc3kJpt
 mLr8ukv7/Sg03N1GYxGEPGi7yg==
X-Google-Smtp-Source: APXvYqzuyrOuARsfniNBtnAaVYiBhW701H0B1RTYw/wAjwzyEl8AtD33Fg2NLEpcRoGxlIjk6FrwpA==
X-Received: by 2002:a50:bae4:: with SMTP id x91mr19865837ede.76.1557156203485; 
 Mon, 06 May 2019 08:23:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d28sm1616637ejl.83.2019.05.06.08.23.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 08:23:22 -0700 (PDT)
Date: Mon, 6 May 2019 17:23:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
Message-ID: <20190506152320.GJ17751@phenom.ffwll.local>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
 <fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
 <20190506142034.kb3lfvw25xbkrkyq@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506142034.kb3lfvw25xbkrkyq@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=zADYOphlWUk/XuVpyDvL8xXYixf0rcBGFLtrl55FB80=;
 b=PYWIpegdRB644PUglOnsUGSbPX7Msw84SBZSWhLiixKareuwb5TphZnA87qSx1V6p/
 yBkhOZcBJKALHSA5gC5nTuAwMNrhVgaEqO8Ng2wLBJqFzjVwuVUKrxpHM1NCmclhhj20
 7RQTG+vkWWwRrTMmM3UKSnlRgTyqK66U1Dt30=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDQ6MjA6MzRQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBNb24sIE1heSAwNiwgMjAxOSBhdCAwMzowOToyMFBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPiA+IEhpCj4gPiAKPiA+IEFtIDA2LjA1LjE5IHVtIDE0OjIyIHNj
aHJpZWIgR2VyZCBIb2ZmbWFubjoKPiA+ID4+IEdFTSBWUkFNIGNvdWxkIGltcGxlbWVudCBQUklN
RSBoZWxwZXJzLCB3aGljaCB3b3VsZCBhbGxvdyBmb3IgdXNpbmcKPiA+ID4+IHRoZSBnZW5lcmlj
IGZiY29uLgo+ID4gPiAKPiA+ID4gYm9jaHNfZ2VtX3ByaW1lXyooKSBmdW5jdGlvbnMgd2l0aCB0
aGlzIHNlcmllcyBhcHBsaWVkIGxvb2sgbGlrZSB5b3UgY2FuCj4gPiA+IGp1c3QgcmVuYW1lIHRo
ZW0gJiBtb3ZlIG92ZXIgdG8gdnJhbSBoZWxwZXJzLgo+ID4gPiAKPiA+ID4gSXQncyBub3QgYSBm
dWxsIHByaW1lIGltcGxlbWVudGF0aW9uLCBzcGVjaWZpY2FsbHkgYWN0dWFsIGV4cG9ydC9pbXBv
cnQKPiA+ID4gaXNuJ3QgdGhlcmUuICBCdXQgcGluK3ZtYXAgKG5lZWRlZCBieSBnZW5lcmljIGZi
Y29uKSBpcyBpbXBsZW1lbnRlZC4KPiA+IAo+ID4gSSBkaWQgaGF2ZSBhIHBhdGNoIHRvIGRvIHRo
aXMsIGJ1dCB0aGVuIEkgcmVhZCB0aGF0IHByaW1lIHJlcXVpcmVzIERNQQo+ID4gZm9yIGJ1ZmZl
ciBzaGFyaW5nIGFuZCBib2NocyB3b3JrcyBvbmx5IGJlY2F1c2UgaXQncyBlbXVsYXRlZC4KPiAK
PiBGb3IgYWN0dWFsIGJ1ZmZlciBzaGFyaW5nIHdpdGggb3RoZXIgZHJpdmVycyB5ZXMgYmVjYXVz
ZSBkbWEtYnVmcwo+IHR5cGljYWxseSBhcmUgYSBidW5jaCBvZiBwYWdlcyAoc3RydWN0IHBhZ2Uq
KikgYW5kIGxpdmUgaW4gUkFNLgo+IAo+IE5vdCBzdXJlIHdoZW5ldmVyIGl0IGlzIHBvc3NpYmxl
IG9yIHVzZWZ1bCB0byBwbGFjZSB0aGUgdnJhbSBpbgo+IFpPTkVfREVWSUNFIHRvIGdldCBwYWdl
IHN0cnVjdHMgZm9yIGl0LCB0aGVuIGV4cG9ydCBidWZmZXJzIGxvY2F0ZWQKPiBpbiB2cmFtIHRo
YXQgd2F5IHdpdGhvdXQgY29weWluZyB0aGVtIG92ZXIgdG8gbWFpbiBtZW1vcnkuICBJIHN1c3Bl
Y3QKPiBtb3N0IGltcG9ydGVycyB3b3VsZCBmYWlsIHRvIHByb3Blcmx5IHNldHVwIFBDSS1QQ0kg
ZG1hIGluIHRoYXQgY2FzZS4KCkNocmlzdGlhbiBLw7ZuaWcgaXMgd29ya2luZyBvbiBwMnAgZG1h
LWJ1ZiBzaGFyaW5nLiBOb3Qgc3VyZSB0aGF0J3Mgd29ydGgKaXQgZm9yIHZpcnR1YWwgZGV2aWNl
cywgYnV0IGNvdWxkIGJlIGZ1biB0byB3aXJlIHVwIEkgZ3Vlc3MuCi1EYW5pZWwKCj4gCj4gPiBJ
ZiBib2NocycgaW1wbGVtZW50YXRpb24gaXMgY29tcGxldGUgZW5vdWdoIHRvIGJlIHVzZWZ1bCBm
b3Igb3RoZXIKPiA+IGRyaXZlcnMsIEknbGwgYWRkIGl0IHRvIHRoZSBwYXRjaCBzZXQuCj4gCj4g
SXQncyBnb29kIGVub3VnaCBmb3IgZ2VuZXJpYyBmYmNvbi4KPiAKPiBjaGVlcnMsCj4gICBHZXJk
Cj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
