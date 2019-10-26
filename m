Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B13E59DF
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 13:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8E96EC12;
	Sat, 26 Oct 2019 11:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA71B6EC17
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 11:07:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s4so5172893ljj.10
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 04:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbtSEwwWtUl8Tn9jW/5rYOk9dRDro0TFs9+gAIA3ZLY=;
 b=eacax8+tMlaPqjUrfc6RLu6qLsBhlkc23xhp+aL9Bs7TcJgKpHxEvF1vC6W6tg7u0l
 bnHq4Mv9rAziA15y/WcWRbL/x3rfDyxdh/rxu37OpztA84h+ZhGTNh2XHu7hpoVdITJk
 2dnx6CGydZV9pQX0iN5IFuPXckWGorsUAy+ugk8w1ML+JUXDZuWNc8PLpIWYWuZovBLG
 V6gqUJ/Lg5cg9KHcEih9XXItlAIwCocSDLuEl6VmRVtMhS5wQIUqY27ixy87VPrFO4qN
 Q2BkIpG0nQaqp6fqNC65KYFf1TXD8S1bJ6HUtN8UcqNlvnv6PYt/7fgn0ZNdM31S6FPJ
 DGhQ==
X-Gm-Message-State: APjAAAVynUCEUTygbb6x3s0H93sm5Vftn9cL1M3V3jsYwqjuW46Pb7/Y
 U9Qr03TCMbIZeRaLi2CP9CoXT4/P5nP0ev/VX8KdUw==
X-Google-Smtp-Source: APXvYqwXkiAvXf3Phu3iW0PDFeh83+cl9RW5ZrJMlkjn2TQBbmww5P/ERTPtEJdBkEaAkIJlw1hVNf54K6j0BkUc+Qg=
X-Received: by 2002:a2e:8856:: with SMTP id z22mr5727263ljj.78.1572088034673; 
 Sat, 26 Oct 2019 04:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191023001206.15741-1-rajatja@google.com>
 <20191024112040.GE2825247@ulmo>
 <CAA93t1ozojwgVoLCZ=AWx72yddQoiaZCMFG35gQg3mQL9n9Z2w@mail.gmail.com>
 <20191025113609.GB928835@ulmo>
In-Reply-To: <20191025113609.GB928835@ulmo>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 26 Oct 2019 12:07:00 +0100
Message-ID: <CAPj87rNe20nFcFNcijFwOZLQU_E+C2HyzEjtigJ-ehiLCq42iA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm: Add support for integrated privacy
 screens
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=sbtSEwwWtUl8Tn9jW/5rYOk9dRDro0TFs9+gAIA3ZLY=;
 b=Yc3V8xSKcErzzkIufZvgIPdiVXiQAZg6sNPGdV25al2GzTWGRHqUnvyA4S7Ih5edyO
 yHxfaBIpIxrw9D815r6Jr1Bzx/+i/4rR27vBxJd8iBmgE0hOg3q/326eMB62jlWnaPCa
 Yfw7O3MR+77F1oM2DJA6ebAdq+4/0esKJnP4U0f9d5mnkKyCWC/WmkmOPoa52YXNbJKq
 9iwDZyH0M13Cp5qie3yaDgMbd66uiEv835NGad8aBVbcpOyStYf6yYaUuSgWssFQHW35
 rkJuaXJL2r5D0eGpRI7HG+5njgdQJ8tCTye+TfIdiM5yTY6T1DthrJ64fE4/jqnbd2TJ
 f4yQ==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Duncan Laurie <dlaurie@google.com>, Rajat Jain <rajatxjain@gmail.com>,
 Sean Paul <seanpaul@google.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mathewk@google.com,
 Pavel Machek <pavel@denx.de>, Rajat Jain <rajatja@google.com>,
 jsbarnes@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeSwKCk9uIEZyaSwgMjUgT2N0IDIwMTkgYXQgMTI6MzYsIFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDI0LCAyMDE5
IGF0IDAxOjQ1OjE2UE0gLTA3MDAsIFJhamF0IEphaW4gd3JvdGU6Cj4gPiBJIGRpZCB0aGluayBh
Ym91dCBoYXZpbmcgYSBzdGF0ZSB2YXJpYWJsZSBpbiBzb2Z0d2FyZSB0byBnZXQgYW5kIHNldAo+
ID4gdGhpcy4gSG93ZXZlciwgSSB0aGluayBpdCBpcyBub3QgdmVyeSBmYXIgZmV0Y2hlZCB0aGF0
IHNvbWUgcGxhdGZvcm1zCj4gPiBtYXkgaGF2ZSAiaGFyZHdhcmUga2lsbCIgc3dpdGNoZXMgdGhh
dCBhbGxvdyBoYXJkd2FyZSB0byBzd2l0Y2gKPiA+IHByaXZhY3ktc2NyZWVuIG9uIGFuZCBvZmYg
ZGlyZWN0bHksIGluIGFkZGl0aW9uIHRvIHRoZSBzb2Z0d2FyZQo+ID4gY29udHJvbCB0aGF0IHdl
IGFyZSBpbXBsZW1lbnRpbmcuIFByaXZhY3kgaXMgYSB0b3VjaHkgc3ViamVjdCBpbgo+ID4gZW50
ZXJwcmlzZSwgYW5kIGFueXRoaW5nIHRoYXQgcmVkdWNlcyB0aGUgcG9zc2liaWxpdHkgb2YgaGF2
aW5nIGFueQo+ID4gaW5jb25zaXN0ZW5jeSBiZXR3ZWVuIHNvZnR3YXJlIHN0YXRlIGFuZCBoYXJk
d2FyZSBzdGF0ZSBpcyBkZXNpcmFibGUuCj4gPiBTbyBpbiB0aGlzIGNhc2UsIEkgY2hvc2UgdG8g
bm90IGhhdmUgYSBzdGF0ZSBpbiBzb2Z0d2FyZSBhYm91dCB0aGlzIC0KPiA+IHdlIGp1c3QgcmVw
b3J0IHRoZSBoYXJkd2FyZSBzdGF0ZSBldmVyeXRpbWUgd2UgYXJlIGFza2VkIGZvciBpdC4KPgo+
IFNvIHRoaXMgZG9lc24ndCByZWFsbHkgd29yayB3aXRoIGF0b21pYyBLTVMsIHRoZW4uIFRoZSBt
YWluIGlkZWEgYmVoaW5kCj4gYXRvbWljIEtNUyBpcyB0aGF0IHlvdSBhcHBseSBhIGNvbmZpZ3Vy
YXRpb24gZWl0aGVyIGNvbXBsZXRlbHkgb3Igbm90IGF0Cj4gYWxsLiBTbyBhdCBsZWFzdCBmb3Ig
c2V0dGluZyB0aGlzIHByb3BlcnR5IHlvdSdkIGhhdmUgdG8gZ28gdGhyb3VnaCB0aGUKPiBzdGF0
ZSBvYmplY3QuCj4KPiBOb3csIGZvciByZWFkaW5nIG91dCB0aGUgcHJvcGVydHkgeW91IG1pZ2h0
IGJlIGFibGUgdG8gZ2V0IGF3YXkgd2l0aCB0aGUKPiBhYm92ZS4gSSdtIG5vdCBzdXJlIGlmIHRo
YXQncyBlbm91Z2ggdG8ga2VlcCB0aGUgc3RhdGUgdXAtdG8tZGF0ZSwKPiB0aG91Z2guIElzIHRo
ZXJlIHNvbWUgd2F5IGZvciBhIGtpbGwgc3dpdGNoIHRvIHRyaWdnZXIgYW4gaW50ZXJydXB0IG9y
Cj4gb3RoZXIgZXZlbnQgb2Ygc29tZSBzb3J0IHNvIHRoYXQgdGhlIHN0YXRlIGNvdWxkIGJlIGtl
cHQgdXAtdG8tZGF0ZT8KPgo+IERhbmllbCAob3IgYW55b25lIGVsc2UpLCBkbyB5b3Uga25vdyBv
ZiBhbnkgcHJlY2VkZW50IGZvciBzdGF0ZSB0aGF0Cj4gbWlnaHQgZ2V0IG1vZGlmaWVkIGJlaGlu
ZCB0aGUgYXRvbWljIGhlbHBlcnMnIGJhY2s/IFNlZW1zIHRvIG1lIGxpa2Ugd2UKPiBuZWVkIHRv
IGZpbmQgc29tZSBwb2ludCB3aGVyZSB3ZSBjYW4gYWN0dWFsbHkgcmVhZCBiYWNrIHRoZSBjdXJy
ZW50Cj4gImhhcmR3YXJlIHZhbHVlIiBvZiB0aGlzIHByaXZhY3kgc2NyZWVuIHByb3BlcnR5IGFu
ZCBzdG9yZSB0aGF0IGJhY2sKPiBpbnRvIHRoZSBzdGF0ZS4KCldlbGwsIGFwYXJ0IGZyb20gY29u
bmVjdG9yIHN0YXRlLCB0aG91Z2ggdGhhdCBpc24ndCByZWFsbHkgYSBwcm9wZXJ0eQphcyBzdWNo
LCB0aGVyZSdzIHRoZSBsaW5rX3N0YXRlIHByb3BlcnR5LCB3aGljaCBpcyBleHBsaWNpdGx5IGRl
c2lnbmVkCnRvIGRvIGp1c3QgdGhhdC4gVGhhdCBoYXMgYmVlbiBxdWl0ZSBjYXJlZnVsbHkgZGVz
aWduZWQgZm9yIHRoZQpiYWNrLWFuZC1mb3J0aCB0aG91Z2guCgpDaGVlcnMsCkRhbmllbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
