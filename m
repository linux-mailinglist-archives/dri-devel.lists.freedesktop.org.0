Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B47452BD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468CC89301;
	Fri, 14 Jun 2019 03:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7589301
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:21:48 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m10so1319794edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVoHYq0itV3pYTA3eOtXIMDIVkYyR0cLDLEAE/xIlME=;
 b=Fl4jGl6nPyFMd/w8rmZcxQYNjwaPiQRYKmy8t+bw34HkxpCLMAhKj++bZMXSsqDgby
 6M9cDiPago6HMOBN7AE0eICNS01UY40wf0wZReZlKlZNjTjo2tVFqYOWyNOzz70GhiwN
 53cpU5VM82OKT5P9JuyjCkd5qx9tpmeZmM8cpNX1C+pW9/M5bJSCWrrkwa7BJarNoiS4
 4NTult5vu+gJHR7m/eBRMCx//LavEHw/n3jN6QZWRKF5Etk20C+3rbbTHCnYimCvDYKJ
 vbxACSRF04+9yAfWzjj162YY9zw4NLznkIp0bGOMBaviBRPMtI667W11xDS+81egqj/c
 1FjA==
X-Gm-Message-State: APjAAAVEf2WMrNYHTPgqdELL5VyElX4fZAshQKJr/6Ylekf2T8qX2//A
 Yu2y0GBM6bfL/rTbqfoSXev3R1wvzdA=
X-Google-Smtp-Source: APXvYqzz+nbsoiv8zK+4rFMkcOHZYByzfebqx3EOH7UVFkJ/3RYlYzzWSdwRjl5xB5bk6wcu+kRPcA==
X-Received: by 2002:a50:9875:: with SMTP id h50mr38431130edb.258.1560482505942; 
 Thu, 13 Jun 2019 20:21:45 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id n5sm326319ejc.62.2019.06.13.20.21.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 20:21:45 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id v14so887535wrr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:21:45 -0700 (PDT)
X-Received: by 2002:adf:dc43:: with SMTP id m3mr3389739wrj.279.1560482505069; 
 Thu, 13 Jun 2019 20:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-4-jagan@amarulasolutions.com>
In-Reply-To: <20190613185241.22800-4-jagan@amarulasolutions.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 11:21:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v65mR0DwAuf_YvDS-dwx2RpEdBeV-5R44zgWn83GNEgp6w@mail.gmail.com>
Message-ID: <CAGb2v65mR0DwAuf_YvDS-dwx2RpEdBeV-5R44zgWn83GNEgp6w@mail.gmail.com>
Subject: Re: [PATCH 3/9] ARM: dts: sun8i: r40: Use tcon top clock index macros
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

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo1NCBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiB0Y29uX3R2MCwgdGNvbl90djEgbm9kZXMgaGF2ZSBh
IGNsb2NrIG5hbWVzIG9mIHRjb24tY2gwLAo+IHRjb24tY2gxIHdoaWNoIGFyZSByZWZlcnJpbmcg
dGNvbl90b3AgY2xvY2tzIHZpYSBpbmRleAo+IG51bWJlcnMgbGlrZSAwLCAxIHdpdGggQ0xLX1RD
T05fVFYwIGFuZCBDTEtfVENPTl9UVjEKPiByZXNwZWN0aXZlbHkuCj4KPiBVc2UgdGhlIG1hY3Jv
IGluIHBsYWNlIG9mIGluZGV4IG51bWJlcnMsIGZvciBtb3JlIGNvZGUKPiByZWFkYWJpbGl0eS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29t
PgoKUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
