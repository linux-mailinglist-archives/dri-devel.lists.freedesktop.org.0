Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8E45B0D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 13:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE76988EAA;
	Fri, 14 Jun 2019 11:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C6288EAA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 11:02:34 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m10so2914572edv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 04:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L90M1yJRaEbJvP50zlp+g8JncxyhlOF+tsQgaXRymkc=;
 b=KCfEy0EJjfszwt74bpwVKJfsL02c8PmC/P2SZmxlBWL0AHp/fjv0ChKFZLHPNmJihs
 TGp0BsJqJrHycS0idIIrche4Oj4r7XFxL8S5mOXVXW3m9jpflBblmxlO5KqVF6L6H04M
 P50eOsTIu7u0+TXWYqwpGKzDcrCXr1qi1Yr8v/GWF+MYOgooIUU+FUZjYd7+EyviCks2
 YqDlQcER8Wol1d75f6XoP+/jAtH/qXQcKWKHHu5+Yiv55FAhWIfvrm8hhcVBhZzRIFsU
 PCMAyBh2kTw+E8nl0oIxUSPLdRxaEjIfxMUQtVT7TwF/RCjDX4up2s4xt3f440uRMi8D
 ywBQ==
X-Gm-Message-State: APjAAAUggKk43XgJ1UkgRVzVHTqsGKNDIFgcts00J/JwRzmQZ5z0lb1E
 bAtbn2gL4/xnkuTGoQ+P0NsUx3JGgjM=
X-Google-Smtp-Source: APXvYqxnFK2IfgySm54rNH/lnwx1AC0LhbUQl/jexwY6fE5fKTa6vHkgfPiHZpL41cflGArs6qta2g==
X-Received: by 2002:a17:906:e282:: with SMTP id
 gg2mr82529187ejb.38.1560510152329; 
 Fri, 14 Jun 2019 04:02:32 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id x55sm798360edm.11.2019.06.14.04.02.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 04:02:31 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id c6so1894107wml.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 04:02:31 -0700 (PDT)
X-Received: by 2002:a1c:c545:: with SMTP id v66mr7776405wmf.51.1560510151032; 
 Fri, 14 Jun 2019 04:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-3-jagan@amarulasolutions.com>
 <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
 <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
 <CAMty3ZBc-AqbNGZCxRhOPw46iMvEZxoq1oATA46=K29gRYi4Sg@mail.gmail.com>
In-Reply-To: <CAMty3ZBc-AqbNGZCxRhOPw46iMvEZxoq1oATA46=K29gRYi4Sg@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 19:02:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v6466QSF1wJ_wJsVwAgHsnLXD9GAwbPQtXcTDq4aqAeEfQ@mail.gmail.com>
Message-ID: <CAGb2v6466QSF1wJ_wJsVwAgHsnLXD9GAwbPQtXcTDq4aqAeEfQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/9] drm/sun4i: tcon: Add TCON LCD support
 for R40
To: Jagan Teki <jagan@amarulasolutions.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNjo1NiBQTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCA5OjA1IEFN
IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdW4g
MTQsIDIwMTkgYXQgMTE6MTkgQU0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo1MyBBTSBKYWdhbiBUZWtpIDxq
YWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUQ09OIExD
RDAsIExDRDEgaW4gYWxsd2lubmVyIFI0MCwgYXJlIHVzZWQgZm9yIG1hbmFnaW5nCj4gPiA+ID4g
TENEIGludGVyZmFjZXMgbGlrZSBSR0IsIExWRFMgYW5kIERTSS4KPiA+ID4gPgo+ID4gPiA+IExp
a2UgVENPTiBUVjAsIFRWMSB0aGVzZSBMQ0QwLCBMQ0QxIGFyZSBhbHNvIG1hbmFnZWQgdmlhCj4g
PiA+ID4gdGNvbiB0b3AuCj4gPiA+ID4KPiA+ID4gPiBBZGQgc3VwcG9ydCBmb3IgaXQsIGluIHRj
b24gZHJpdmVyLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFn
YW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBDaGVuLVl1
IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gPgo+ID4gSSB0YWtlIHRoYXQgYmFjay4KPiA+Cj4gPiBU
aGUgVENPTiBvdXRwdXQgbXV4aW5nICh3aGljaCBzZWxlY3RzIHdoZXRoZXIgVENPTiBMQ0Qgb3Ig
VENPTiBUVgo+ID4gb3V0cHV0cyB0byB0aGUgR1BJTyBwaW5zKQo+ID4gaXMgbm90IHN1cHBvcnRl
ZCB5ZXQuIFBsZWFzZSBhdCBsZWFzdCBhZGQgVE9ETyBub3Rlcywgb3IgaWRlYWxseSwKPgo+IEFy
ZSB5b3UgcmVmZXJyaW5nIGFib3V0IHBvcnQgc2VsZWN0aW9uPyBpdCBpcyBzdXBwb3J0IGluCj4g
c3VuOGlfdGNvbl90b3BfZGVfY29uZmlnLgoKTm8uIFRoYXQncyBzdXBwb3J0ZWQgYXMgeW91IGFs
cmVhZHkgcG9pbnRlZCBvdXQuIFRoYXQgb25seSBzZWxlY3RzCndoaWNoIG1peGVyIG91dHB1dHMg
dG8gd2hpY2ggVENPTi4KCkknbSB0YWxraW5nIGFib3V0IHRoZSBHUElPRCBhbmQgR1BJT0ggYml0
cywgd2hpY2ggc2VsZWN0IHdoaWNoIG9mCkxDRCBvciBUViBUQ09OIG91dHB1dHMgdG8gdGhlIExD
RCBmdW5jdGlvbiBwaW5zLiBLZWVwIGluIG1pbmQgdGhhdAp0aGUgVFYgVENPTidzIEgvViBTWU5D
IHNpZ25hbHMgYXJlIHVzZWQgaW4gY29tYmluYXRpb24gd2l0aCB0aGUKVFYgZW5jb2RlciBSR0Ig
b3V0cHV0cyBmb3IgVkdBLgoKQ2hlbll1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
