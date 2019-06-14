Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D845307
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB2C89301;
	Fri, 14 Jun 2019 03:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C45589301
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:35:12 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id m10so1358570edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5X0bylW7cnZXlc8waXhJ/q/kNkLK/1K8QN94+coOFM=;
 b=n1DNABikd/yTxOE0M6n+/sWfuyKSLnYjZ3KlORS8Ul3/gOh09TrZv9vOd7Ux4WvGbJ
 Ow1XIEMpaTG7QIYQSGo7xId3KMQ2Sf2hmI7RTuuvtkbLVbtRArs1auLrSdTK1df5z+8D
 2Sap4x/vqehe9HOV2LeqbAQxLHWn75A5UYIb6/XotVSeHQ6DvmEJ+5z4+CAyJT8MwlUC
 5t5D15HH378Dd2TJdqps+J74oOwrFUFuYauaD2bMuDfwslwqnEchXH0PT6n1eA7kP1wR
 7p3Tl9zlV2LJ505BTPqMkL8gwSlSOZK0sqBN4N9GbpexgJ5FSNufzU9/XgZ4sf8FNwnh
 MwOA==
X-Gm-Message-State: APjAAAXidhHiT3GwUSUqGeE21rjffCIw0E6s5tbtm/OpRAMTKTw6Mxdi
 9PdX9YgP3xx0TgUNZZzJu/g4K7zLU3k=
X-Google-Smtp-Source: APXvYqyvda/hZQf/khfd/KvuMzcIaVjZkJ8e50Royc+qw0RLeApde+qXXsXHi4f6GICIyudWhiOcfA==
X-Received: by 2002:a17:906:2605:: with SMTP id
 h5mr52769664ejc.178.1560483310138; 
 Thu, 13 Jun 2019 20:35:10 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id x8sm483255edx.67.2019.06.13.20.35.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 20:35:09 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id n9so926239wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:35:09 -0700 (PDT)
X-Received: by 2002:adf:fc85:: with SMTP id g5mr62068736wrr.324.1560483309487; 
 Thu, 13 Jun 2019 20:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-3-jagan@amarulasolutions.com>
 <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
In-Reply-To: <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 11:34:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
Message-ID: <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
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
 linux-amarula@amarulasolutions.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTE6MTkgQU0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUu
b3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDI6NTMgQU0gSmFnYW4gVGVr
aSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+ID4KPiA+IFRDT04gTENEMCwg
TENEMSBpbiBhbGx3aW5uZXIgUjQwLCBhcmUgdXNlZCBmb3IgbWFuYWdpbmcKPiA+IExDRCBpbnRl
cmZhY2VzIGxpa2UgUkdCLCBMVkRTIGFuZCBEU0kuCj4gPgo+ID4gTGlrZSBUQ09OIFRWMCwgVFYx
IHRoZXNlIExDRDAsIExDRDEgYXJlIGFsc28gbWFuYWdlZCB2aWEKPiA+IHRjb24gdG9wLgo+ID4K
PiA+IEFkZCBzdXBwb3J0IGZvciBpdCwgaW4gdGNvbiBkcml2ZXIuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4KPiBSZXZpZXdl
ZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgoKSSB0YWtlIHRoYXQgYmFjay4KClRo
ZSBUQ09OIG91dHB1dCBtdXhpbmcgKHdoaWNoIHNlbGVjdHMgd2hldGhlciBUQ09OIExDRCBvciBU
Q09OIFRWCm91dHB1dHMgdG8gdGhlIEdQSU8gcGlucykKaXMgbm90IHN1cHBvcnRlZCB5ZXQuIFBs
ZWFzZSBhdCBsZWFzdCBhZGQgVE9ETyBub3Rlcywgb3IgaWRlYWxseSwKYmxvY2sgUkdCIG91dHB1
dCBmcm9tCmJlaW5nIHVzZWQuCgpDaGVuWXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
