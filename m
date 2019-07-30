Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F37AF60
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 19:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0C66E5D3;
	Tue, 30 Jul 2019 17:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD56E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:13:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s3so57871945wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 10:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lDTcE0txGby1O7y9Tz/XnV+wsQ0kcZLXRvUBzyzsv1w=;
 b=qZ0pH6a/Zp8AOAomTdePgSJ88NLfob7CyoGvTB78v1mSYlqyj+dmrueLFG0XA/n83C
 zlzX6MKe6ZaQO6oC6BbRFJo+zbo/yYPAkiihTzheaxuvMkbjB3E6TfqX3NfPo3JkDQyY
 aGfH4pr4xmP7N7OPjz51kc+pnIuhpQ3jpts2BV86iAhvf6J5aOASkcvjP91AmpQXK/r1
 70DzV60MsgGPjVYDunACifoSIgPl3jFQ1+7325aXqgoHJRc5eO93AP8zC6dXC8ddHAOm
 eCPu7G4tsSWVCWJSpGHmz3a1fA81t3CwjifvvziH+Dx+fsPaVgohBIYAaBY60Vej+KJz
 a4yg==
X-Gm-Message-State: APjAAAVPPopnOYdVzPECQSIlofNc32M7ecBmoBbF1Q7cgjUARJKs3iee
 ZThtkrGUp6k4IcbkABGNr4nQQX4Q
X-Google-Smtp-Source: APXvYqyKjilXxXXa1VaE5jKTZdrrpbOHLhDhDtXt+R6s4fbMLnIF5MYGmw8gqFz+8UGSU+n7e8donQ==
X-Received: by 2002:a1c:2015:: with SMTP id g21mr103906186wmg.33.1564506794474; 
 Tue, 30 Jul 2019 10:13:14 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id t15sm57684778wrx.84.2019.07.30.10.13.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 10:13:13 -0700 (PDT)
Date: Tue, 30 Jul 2019 18:12:45 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC 4/4] drm/panel/ili9341: Support mi0283qt
Message-ID: <20190730171245.GE14551@arch-x1c3>
References: <20190729195526.13337-1-noralf@tronnes.org>
 <20190729195526.13337-5-noralf@tronnes.org>
 <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
 <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=lDTcE0txGby1O7y9Tz/XnV+wsQ0kcZLXRvUBzyzsv1w=;
 b=Ozen/TTGm5KWAtq9uWV+YNHlleykcRaYv083lTzUAXx15Mdq1cm0XWgzAP+Z5jIldE
 TIb2vteb/JYumZ0lN0J1IRpINOpTrOHw3YgvjjTt4BdMWTVlQbQqdnxTP71byosoKsws
 x3zlDVmfzmse59Zck3VmskDDTsdcMjiU5LnZWN2kXEuoqtDTq2L4g4m7wqlKw8fDVjU9
 bfwlTLx2hj1VGLwKwaXSFlkOOjDyFVCAWk9kILdgjBLGBpmdLFNizEqnEdoPzzPOqfcr
 yGGhTjAC2p7YnsPd53fPsshBtBR2Gb60L5ClihmyFBMw/3a1tx5JKiH9s2QzCGBrDXyc
 +kOA==
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
Cc: Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8zMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUsIEp1bCAzMCwgMjAx
OSBhdCA0OjMwIFBNIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiB3cm90ZToK
PiA+Cj4gPgo+ID4KPiA+IERlbiAyOS4wNy4yMDE5IDIxLjU1LCBza3JldiBOb3JhbGYgVHLDuG5u
ZXM6Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMu
b3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1pbGl0ZWst
aWxpOTM0MS5jIHwgMTc5ICsrKysrKysrKysrKysrKysrKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNzAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+Cj4gPiBJIGhhdmUg
cmVhbGlzZWQgdGhhdCB0aGlzIHdpbGwgY2hhbmdlIHRoZSBEUk0gZHJpdmVyIG5hbWUgZnJvbSBt
aTAyODNxdAo+ID4gdG8gZHJtX21pcGlfZGJpLiBUaGlzIG1lYW5zIHRoYXQgdGhpcyBwYW5lbCB3
aWxsIGxvb3NlIGl0cyBNRVNBIGttc3JvWzFdCj4gPiBzdXBwb3J0LiBJIGhhdmVuJ3QgdHJpZWQg
aXQsIGJ1dCB0aGlzIGlzIHRoZSBmaXJzdCB0aGluZyB0aGF0IGdpdmVzIHRoaXMKPiA+IGRyaXZl
ciBhbnkgcmVhbCBhZHZhbnRhZ2Ugb3ZlciBpdHMgZmJkZXYgY291bnRlcnBhcnQgaW4KPiA+IGRy
aXZlcnMvc3RhZ2luZy9mYnRmdCwgc28gSSBkb24ndCB3YW50IHRvIGxvb3NlIHRoYXQuCj4gPiBT
byBldmVuIGlmIE1JUEkgREJJIHBhbmVsIHN1cHBvcnQgaXMgaW1wbGVtZW50ZWQgaW4gc29tZSBm
b3JtLCBJIHdpbGwKPiA+IHdhaXQgd2l0aCBjb252ZXJ0aW5nIG1pMDI4M3F0IHVudGlsIHNvbWVv
bmUgaGFzIHVwZGF0ZWQgdGhlIGttc3JvIGRyaXZlci4KPiAKPiBXaHkgZG9lcyBpdCBjaGFuZ2U/
IFlvdSBzaG91bGQgYmUgYWJsZSB0byBzdHVmZiB3aGF0ZXZlciB5b3UgZmVlbCBsaWtlCj4gaW50
byB0aGUgZHJtIGRyaXZlciBuYW1lLCB0aGlzIGRvZXNuJ3QgaGF2ZSB0byBtYXRjaCBlaXRoZXIg
eW91cgo+IHBsYXRmb3JtL3NwaS93aGF0ZXZlciBkcml2ZXIgbmFtZSBub3IgdGhlIG1vZHVsZSBv
cHRpb24uCgpMYXN0IHRpbWUgaSd2ZSBsb29rZWQgRFJNIGRyaXZlcnMgdXNpbmcgdGhlIG1pcGkg
ZHNpIGhlbHBlcnMgZG8gX25vdF8KaGF2ZSAiZHJtX21pcGlfZHNpIiBhcyB0aGVpciBkcml2ZXIg
bmFtZS4gSGVuY2UgZHJpdmVycyB1c2luZyB0aGUgbWlwaQpkYmkgc2hvdWxkIG5vdCBoYXZlICJk
cm1fbWlwaV9kYmkiLgoKVGhhdCBzYWlkLCB3ZSBzaG91bGQgcHJvYmFibHkgaGlnaGxpZ2h0IGV2
ZW4gbW9yZSB0aGF0IHRoZSBkcml2ZXIgbmFtZQppcyBhbiBBQkkuCgotRW1pbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
