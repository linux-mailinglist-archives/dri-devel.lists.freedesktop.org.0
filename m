Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E354835A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 15:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A880A8919D;
	Mon, 17 Jun 2019 13:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E668919D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:01:49 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p15so16029696eds.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T87ic57rQt3UfwYy1X9DryRi6OUhzyqVbWtm9GM976Y=;
 b=hyU/RS8y8L/VBt6jYhHfhBBAdA3VZZKNDFEuzbTuzVzYb0eJ4V5vglQA3G6spAZU4Y
 7g5R6FYh2yq6+unfmqFexzau7gcfDDSpO1z04jdwwN6qm9RBxmSeUBKQKINOLIKYe3K3
 i84fO1y+uw0MO2YveX+Xd3lUbhbuD/dbPhmeigkUxPOtXqqUxMlGONXqrSRMbdgCCDM+
 OqODegMhabroSiwTVgWHm/San34Es4vEmsJ+PLkjDesrLAwVLywnZ1Ork9sfSfA1mpbg
 FxlBmrCgYFNjy1/Rh2AkniVah/JUcNpvvMCd2h4sM9cApex9WcSisgVaR1jUckhVNrTP
 LV0A==
X-Gm-Message-State: APjAAAU9IQ++nErcd8H77fZeMunpaVvAV0jGuBQnsUfIi4+MbcvhOncU
 b6DwsdCXS+EXo88Hh/MHZqOdKUHRK1w=
X-Google-Smtp-Source: APXvYqzH5ZEMwNHEt6O0uZrwYVjMNMZl394kRyGyFKBA9Ckq/srTKXtKHbdSvGUbuJAUW+ku+VlJaw==
X-Received: by 2002:a17:906:2ce:: with SMTP id
 14mr12996295ejk.296.1560776507206; 
 Mon, 17 Jun 2019 06:01:47 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id a9sm3845292edc.44.2019.06.17.06.01.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 06:01:47 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id s15so9016679wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 06:01:46 -0700 (PDT)
X-Received: by 2002:a1c:c545:: with SMTP id v66mr19389774wmf.51.1560776506243; 
 Mon, 17 Jun 2019 06:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com>
 <20190617114503.pclqsf6bo3ih47nt@flea>
In-Reply-To: <20190617114503.pclqsf6bo3ih47nt@flea>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Jun 2019 21:01:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
Message-ID: <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register
 clock gates in probe
To: Maxime Ripard <maxime.ripard@bootlin.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNzo0NSBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDEwOjEz
OjIwUE0gKzA1MzAsIEphZ2FuIFRla2kgd3JvdGU6Cj4gPiBUQ09OIFRPUCBoYXZlIGNsb2NrIGdh
dGVzIGZvciBUVjAsIFRWMSwgZHNpIGFuZCByaWdodAo+ID4gbm93IHRoZXNlIGFyZSByZWdpc3Rl
ciBkdXJpbmcgYmluZCBjYWxsLgo+ID4KPiA+IE9mIHdoaWNoLCBkc2kgY2xvY2sgZ2F0ZSB3b3Vs
ZCByZXF1aXJlZCBkdXJpbmcgRFBIWSBwcm9iZQo+ID4gYnV0IHNhbWUgY2FuIG1pc3MgdG8gZ2V0
IHNpbmNlIHRjb24gdG9wIGlzIG5vdCBib3VuZCBhdAo+ID4gdGhhdCB0aW1lLgo+ID4KPiA+IFRv
IHNvbHZlLCB0aGlzIGNpcmN1bGFyIGRlcGVuZGVuY3kgbW92ZSB0aGUgY2xvY2sgZ2F0ZQo+ID4g
cmVnaXN0cmF0aW9uIGZyb20gYmluZCB0byBwcm9iZSBzby10aGF0IERQSFkgY2FuIGdldCB0aGUK
PiA+IGRzaSBnYXRlIGNsb2NrIG9uIHRpbWUuCj4KPiBJdCdzIG5vdCByZWFsbHkgY2xlYXIgdG8g
bWUgd2hhdCB0aGUgY2lyY3VsYXIgZGVwZW5kZW5jeSBpcz8KPgo+IGlmIHlvdSBoYXZlIGEgY2hh
aW4gdGhhdCBpczoKPgo+IHRjb24tdG9wICstPiBEU0kKPiAgICAgICAgICArLT4gRC1QSFkKPgo+
IFRoZXJlJ3Mgbm8gbG9vcCwgcmlnaHQ/CgpMb29raW5nIGF0IGhvdyB0aGUgRFRTSSBwYXRjaCBz
dHJ1Y3R1cmVzIHRoaW5ncyAod2l0aG91dCBnb2luZyBpbnRvCndoZXRoZXIgaXQgaXMgY29ycmVj
dCBvciBhY2N1cmF0ZSk6CgpUaGUgRC1QSFkgaXMgbm90IHBhcnQgb2YgdGhlIGNvbXBvbmVudCBn
cmFwaC4gSG93ZXZlciBpdCByZXF1ZXN0cwp0aGUgRFNJIGdhdGUgY2xvY2sgZnJvbSB0aGUgVENP
Ti1UT1AuCgpUaGUgVENPTi1UT1AgZHJpdmVyLCBpbiBpdHMgY3VycmVudCBmb3JtLCBvbmx5IHJl
Z2lzdGVycyB0aGUgY2xvY2tzCml0IHByb3ZpZGVzIGF0IGNvbXBvbmVudCBiaW5kIHRpbWUuIFRo
dXMgdGhlIEQtUEhZIGNhbid0IHN1Y2Nlc3NmdWxseQpwcm9iZSB1bnRpbCB0aGUgVENPTi1UT1Ag
aGFzIGJlZW4gYm91bmQuCgpUaGUgRFNJIGludGVyZmFjZSByZXF1aXJlcyB0aGUgRC1QSFkgdG8g
YmluZC4gSXQgd2lsbCByZXR1cm4gLUVQUk9CRV9ERUZFUgppZiBpdCBjYW5ub3QgcmVxdWVzdCBp
dC4gVGhpcyBpbiB0dXJuIGdvZXMgaW50byB0aGUgZXJyb3IgcGF0aCBvZgpjb21wb25lbnRfYmlu
ZF9hbGwsIHdoaWNoIHVuYmluZHMgYWxsIHByZXZpb3VzIGNvbXBvbmVudHMuCgpTbyBpdCdzIGFj
dHVhbGx5CgogICAgRC1QSFkgLT4gVENPTi1UT1AgLT4gRFNJCiAgICAgIF4gICAgICAgICAgICAg
ICAgICAgfAogICAgICB8LS0tLS0tLS0tLS0tLS0tLS0tLS0KCkkndmUgbm90IGNoZWNrZWQsIGJ1
dCBJIHN1c3BlY3QgdGhlcmUncyBubyBwb3NzaWJpbGl0eSBvZiBoYXZpbmcgb3RoZXIKZHJpdmVy
cyBwcm9iZSAodG8gZGVhbCB3aXRoIGRlZmVycmVkIHByb2JpbmcpIHdpdGhpbiBjb21wb25lbnRf
YmluZF9hbGwuCk90aGVyd2lzZSB3ZSBzaG91bGRuJ3QgcnVuIGludG8gdGhpcyB3ZWlyZCBjaXJj
dWxhciBkZXBlbmRlbmN5IGlzc3VlLgoKU28gdGhlIHF1ZXN0aW9uIGZvciBKYWdhbiBpcyB0aGF0
IGlzIHRoaXMgaW5kZWVkIHRoZSBjYXNlPyBEb2VzIHRoaXMKcGF0Y2ggc29sdmUgaXQsIG9yIGF0
IGxlYXN0IHdvcmsgYXJvdW5kIGl0LgoKQ2hlbll1Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
