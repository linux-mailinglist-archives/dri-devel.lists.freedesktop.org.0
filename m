Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9858BCE67D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ABB6E09C;
	Mon,  7 Oct 2019 15:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4096E09C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 15:08:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w12so15775230wro.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 08:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rmvp3U9wOO9fx1V5/5lVy3lHSgb3r92p/5Ndn8D9Cno=;
 b=hE8rPDWvhIjNbSGeSYWzok22WW+ztcxvImNMdKv11RP8CbUUxpMzpf0kzAlxWE6/4e
 71NKaAFuRJiAR3VTs8GG+Gkoqp2r0Dz3RQ8j4LmfCRzUxXM1OAeMDIjKn4p437JjIxC4
 V8Nt5NS1RXOZegILT6jFW++BdE0Xk75yPgKMBypigrJLzsLqYbpZd6go+v7EfIAlLwkS
 mbXU1XWKLpuGq2g3W9EPhQynq527fiJLNSRHKyQQrzJndLR7SaIqvHsJvAEV+GE28TYN
 LgljnmnERt337KNuikNdZEKqXP7zGG1WkR40VDyB2eJh0XQRYLRnCj95Qfet3B6dfiFm
 PwtQ==
X-Gm-Message-State: APjAAAWhz1dH9vjsMbXywLYMNoENFNHoVtM9LuIdI9eGAq4NYMCc+DCg
 C8EbyCFnetufphtatipW/6DdtQ==
X-Google-Smtp-Source: APXvYqwkVghS0eHq32QO7i9QSOrwUCdtltFtZcTTIjruUxA68yY7ARWhzNO4HSBRH43QK2i2Zgw8JA==
X-Received: by 2002:a5d:6a09:: with SMTP id m9mr21687302wru.12.1570460921085; 
 Mon, 07 Oct 2019 08:08:41 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s12sm29340436wra.82.2019.10.07.08.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:08:40 -0700 (PDT)
Date: Mon, 7 Oct 2019 16:08:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 1/5] backlight: pwm_bl: fix cie1913 comments and constant
Message-ID: <20191007150838.3qbrten34ln6ufo4@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=rmvp3U9wOO9fx1V5/5lVy3lHSgb3r92p/5Ndn8D9Cno=;
 b=PZ88vPGKZhvCrX5TQAJCXwbZ/+D6pVQWntk88MxmxD8JNoIcsCt3mUkxbkopRKq2Ok
 S4zvSHsn2Y4D2U15ngxrUfkOgx2ZnWmIrkIHbxaBIqhfzOQBjA/ixUT+jmWFnoRLJoUf
 Gr+x/k240g7pHGj3e5EWGz+4qddvm/hVrYCBRl/XV+bNGUYRfgnXy5nsWLgkANYb71ix
 9Yl1XlQr8iq+6Qs4GaRLGgzG354SH3TytK8CKLgMVaGPzIVYqikwxQWhAVz18kCQQyT8
 gaM+0swlRNT83/HMqXi3+wEbTmwu2QFdmqwgFVOz/RTQOA+1D1kl8rJ0C8OvcCjj/h3a
 ofpg==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDQ6MDY6MTZQTSArMDIwMCwgUmFzbXVzIFZpbGxlbW9l
cyB3cm90ZToKPiBUaGUgImJyZWFrLWV2ZW4iIHBvaW50IGZvciB0aGUgdHdvIGZvcm11bGFzIGlz
IEw9PTgsIHdoaWNoIGlzIGFsc28KPiB3aGF0IHRoZSBjb2RlIGFjdHVhbGx5IGltcGxlbWVudHMu
IFtJbmNpZGVudGFsbHksIGF0IHRoYXQgcG9pbnQgb25lCj4gaGFzIFk9MC4wMDg4NTYsIG5vdCAw
LjA4ODU2XS4KPiAKPiBNb3Jlb3ZlciwgYWxsIHRoZSBzb3VyY2VzIEkgY2FuIGZpbmQgc2F5IHRo
ZSBsaW5lYXIgZmFjdG9yIGlzIDkwMy4zCj4gcmF0aGVyIHRoYW4gOTAyLjMsIHdoaWNoIG1ha2Vz
IHNlbnNlIHNpbmNlIHRoZW4gdGhlIGZvcm11bGFzIGFncmVlIGF0Cj4gTD09OCwgYm90aCB5aWVs
ZGluZyB0aGUgMC4wMDg4NTYgZmlndXJlIHRvIGZvdXIgc2lnbmlmaWNhbnQgZGlnaXRzLgoKSW5k
ZWVkLiBJbnRlcmVzdGluZ2x5IHRoZSBmb2xsb3dpbmcgZG9jICh3aXRoIGEgaGlnaCBzZWFyY2gg
cmFuayBpbgpHb29nbGUpIGhhcyBleGFjdGx5IHRoaXMgaW5jb25zaXN0ZW5jeSBhbmQgdXNlcyBk
aWZmZXJlbnQgdmFsdWVzIGF0CmRpZmZlcmVudCB0aW1lczoKaHR0cDovL3d3dy5waG90b25zdG9w
aG90b3MubmV0L0dlbmVyYWxUb3BpY3MvRXhwb3N1cmUvUHN5Y2hvbWV0cmljX0xpZ2h0bmVzc19h
bmRfR2FtbWEuaHRtCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4
QHJhc211c3ZpbGxlbW9lcy5kaz4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmll
bC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
cHdtX2JsLmMgfCAxMiArKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+IGluZGV4
IDIyMDFiOGM3ODY0MS4uYmUzNmJlMWNhY2I3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L3B3bV9ibC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2Js
LmMKPiBAQCAtMTU1LDggKzE1NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29w
cyBwd21fYmFja2xpZ2h0X29wcyA9IHsKPiAgICoKPiAgICogVGhlIENJRSAxOTMxIGxpZ2h0bmVz
cyBmb3JtdWxhIGlzIHdoYXQgYWN0dWFsbHkgZGVzY3JpYmVzIGhvdyB3ZSBwZXJjZWl2ZQo+ICAg
KiBsaWdodDoKPiAtICogICAgICAgICAgWSA9IChMKiAvIDkwMi4zKSAgICAgICAgICAgaWYgTCog
4omkIDAuMDg4NTYKPiAtICogICAgICAgICAgWSA9ICgoTCogKyAxNikgLyAxMTYpXjMgICAgaWYg
TCogPiAwLjA4ODU2Cj4gKyAqICAgICAgICAgIFkgPSAoTCogLyA5MDMuMykgICAgICAgICAgIGlm
IEwqIOKJpCA4Cj4gKyAqICAgICAgICAgIFkgPSAoKEwqICsgMTYpIC8gMTE2KV4zICAgIGlmIEwq
ID4gOAo+ICAgKgo+ICAgKiBXaGVyZSBZIGlzIHRoZSBsdW1pbmFuY2UsIHRoZSBhbW91bnQgb2Yg
bGlnaHQgY29taW5nIG91dCBvZiB0aGUgc2NyZWVuLCBhbmQKPiAgICogaXMgYSBudW1iZXIgYmV0
d2VlbiAwLjAgYW5kIDEuMDsgYW5kIEwqIGlzIHRoZSBsaWdodG5lc3MsIGhvdyBicmlnaHQgYSBo
dW1hbgo+IEBAIC0xNjksOSArMTY5LDE1IEBAIHN0YXRpYyB1NjQgY2llMTkzMSh1bnNpZ25lZCBp
bnQgbGlnaHRuZXNzLCB1bnNpZ25lZCBpbnQgc2NhbGUpCj4gIHsKPiAgCXU2NCByZXR2YWw7Cj4g
IAo+ICsJLyoKPiArCSAqIEBsaWdodG5lc3MgaXMgZ2l2ZW4gYXMgYSBudW1iZXIgYmV0d2VlbiAw
IGFuZCAxLCBleHByZXNzZWQKPiArCSAqIGFzIGEgZml4ZWQtcG9pbnQgbnVtYmVyIGluIHNjYWxl
IEBzY2FsZS4gQ29udmVydCB0byBhCj4gKwkgKiBwZXJjZW50YWdlLCBzdGlsbCBleHByZXNzZWQg
YXMgYSBmaXhlZC1wb2ludCBudW1iZXIsIHNvIHRoZQo+ICsJICogYWJvdmUgZm9ybXVsYXMgY2Fu
IGJlIGFwcGxpZWQuCj4gKwkgKi8KPiAgCWxpZ2h0bmVzcyAqPSAxMDA7Cj4gIAlpZiAobGlnaHRu
ZXNzIDw9ICg4ICogc2NhbGUpKSB7Cj4gLQkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NFU1RfVUxM
KGxpZ2h0bmVzcyAqIDEwLCA5MDIzKTsKPiArCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9V
TEwobGlnaHRuZXNzICogMTAsIDkwMzMpOwo+ICAJfSBlbHNlIHsKPiAgCQlyZXR2YWwgPSBpbnRf
cG93KChsaWdodG5lc3MgKyAoMTYgKiBzY2FsZSkpIC8gMTE2LCAzKTsKPiAgCQlyZXR2YWwgPSBE
SVZfUk9VTkRfQ0xPU0VTVF9VTEwocmV0dmFsLCAoc2NhbGUgKiBzY2FsZSkpOwo+IC0tIAo+IDIu
MjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
