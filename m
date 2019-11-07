Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D8F292C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6066EEEB;
	Thu,  7 Nov 2019 08:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5658D6EEEB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:33:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b11so1449285wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 00:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=s8siO8c5nG2oA4yleva52f8UrXXloSdu8Edj03PJpK0=;
 b=C8j59zovnGvqT5lc9vOFTg6hYyyQj8i3CxQKr3Yg3qovImPwVvfvJNEgwaRWZgDPhF
 GYGOqqe5MFREjNm9Y8pUp+5HCLFuKJJee9UUdlzr5U6mU8hjfkKnHGxmFV/dB48pqSaf
 yyfDnA256lQAby2kDXO9srm+yI25NqtxyaPhf4wmNvPHSgetnoUBXhgqNo9BGDv8sHCM
 L6pP+bkyDZAUwGdJnm5d2AniiYz+sjnhpAPExXvk8MwhTgpxaAHe/zycAZmANlScHGGB
 TMF9eMhSNccOa6hERYrwh6BPUJupfTeH7ZyGAEbhMv/L66b67SwY2M9Gg0rhDfpfog6f
 y11Q==
X-Gm-Message-State: APjAAAUHI9E62/tc1yTvRANdSxtmW86MDBX0/l/OAH6CIH0VKAZ8PMCs
 dyCo6IEH/txf1pmV1SoPqKEaGeD9iA0=
X-Google-Smtp-Source: APXvYqxKMCfhiclD4wFqY8ApTHpX3Q1Ro0gZKnJrP51xrd4JOijhRLOYoIdKgYqifQ0PrRuhN8PtPg==
X-Received: by 2002:a1c:4946:: with SMTP id w67mr1729615wma.16.1573115636920; 
 Thu, 07 Nov 2019 00:33:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v128sm2249296wmb.14.2019.11.07.00.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 00:33:56 -0800 (PST)
Date: Thu, 7 Nov 2019 09:33:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH 05/12] video: fbdev: matrox: convert to
 i2c_new_scanned_device
Message-ID: <20191107083354.GK23790@phenom.ffwll.local>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=s8siO8c5nG2oA4yleva52f8UrXXloSdu8Edj03PJpK0=;
 b=JRkRa/R1N2W5Q9fECuduw7TIszePzpuIf+wxSx2MpS7SVRD2xH3wNupZLXTrfgmaJh
 mGoLnytxEdFYu1k8s1FTzVDv/O0IW/WSVdoccxvdGjvYKtdyrKLfx+CzEHFryhCO3JAw
 KYb8NmrLgGyx511ItajYvxS7EXqMNegvbQbqg=
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTA6NTA6MjNBTSArMDEwMCwgV29sZnJhbSBTYW5nIHdy
b3RlOgo+IE1vdmUgZnJvbSB0aGUgZGVwcmVjYXRlZCBpMmNfbmV3X3Byb2JlZF9kZXZpY2UoKSB0
byB0aGUgbmV3Cj4gaTJjX25ld19zY2FubmVkX2RldmljZSgpLiBNYWtlIHVzZSBvZiB0aGUgbmV3
IEVSUlBUUiBpZiBzdWl0YWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdz
YStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPgoKQWNrIGZvciBtZXJnaW5nIHRocm91Z2gg
d2hhdGV2ZXIgdHJlZSB5b3UgdGhpbmsgdGhpcyBzaG91bGQgYmVzdCBsYW5kCnRocm91Z2guCi1E
YW5pZWwKCj4gLS0tCj4gCj4gQnVpbGQgdGVzdGVkIG9ubHkuIFJGQywgcGxlYXNlIGNvbW1lbnQg
YW5kL29yIGFjaywgYnV0IGRvbid0IGFwcGx5IHlldC4KPiAKPiAgZHJpdmVycy92aWRlby9mYmRl
di9tYXRyb3gvaTJjLW1hdHJveGZiLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by9mYmRldi9tYXRyb3gvaTJjLW1hdHJveGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJv
eC9pMmMtbWF0cm94ZmIuYwo+IGluZGV4IDM0ZTI2NTljMzE4OS4uZTJlNDcwNWUzZmUwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L2kyYy1tYXRyb3hmYi5jCj4gKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvaTJjLW1hdHJveGZiLmMKPiBAQCAtMTkxLDgg
KzE5MSw4IEBAIHN0YXRpYyB2b2lkKiBpMmNfbWF0cm94ZmJfcHJvYmUoc3RydWN0IG1hdHJveF9m
Yl9pbmZvKiBtaW5mbykgewo+ICAJCQkJMHgxYiwgSTJDX0NMSUVOVF9FTkQKPiAgCQkJfTsKPiAg
Cj4gLQkJCWkyY19uZXdfcHJvYmVkX2RldmljZSgmbTJpbmZvLT5tYXZlbi5hZGFwdGVyLAo+IC0J
CQkJCSAgICAgICZtYXZlbl9pbmZvLCBhZGRyX2xpc3QsIE5VTEwpOwo+ICsJCQlpMmNfbmV3X3Nj
YW5uZWRfZGV2aWNlKCZtMmluZm8tPm1hdmVuLmFkYXB0ZXIsCj4gKwkJCQkJICAgICAgICZtYXZl
bl9pbmZvLCBhZGRyX2xpc3QsIE5VTEwpOwo+ICAJCX0KPiAgCX0KPiAgCXJldHVybiBtMmluZm87
Cj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
