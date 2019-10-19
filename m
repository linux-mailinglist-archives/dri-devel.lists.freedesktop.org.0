Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5197DD7A0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 11:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A33689E63;
	Sat, 19 Oct 2019 09:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2DF89E63
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 09:11:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so8219703wmi.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 02:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+LSfVcGVgC2SgP+Cklux+YdmwHzIVlEqLbQ9PbRxrCg=;
 b=sUKknHFL9ijYuoWp1clMeYmlAcaoraTMtR35VrU7nCxpF+fER3m4bIINlFnD8Cal+X
 iowVSiJW+KJDctGWtn89sBKuLPVK9qmfLHpzMlgSjX2uWxksJSYZB+jMbP1fTdgB+eGQ
 slQdpvGnzbivIZMTHnBvAdGPwY8GtP16dC82t/L/eKYUpt+3UWE477RK6l/4kft108to
 0GrG3jpAfAdSDMH/RFWnjEMJSqmzBeeXniKRCbjzNsBGqaAFhqilUZ/TtAKJxIRsN2ku
 yUquLf2eeRhrozbXtSvlZad/hDMTfE3ISRzJKIj85JnC2FJ6jbxw9SVvBfwKs90hjvAH
 RZGw==
X-Gm-Message-State: APjAAAUqlZ4RrgySLp2gya9RJBvmBRK2syZFB0okc7pX//SecsYxO5bB
 yHihzL9VrfxWSgoTEVP4jxo=
X-Google-Smtp-Source: APXvYqyDsmrzv4Z1LGUFeuwlx9LTPnznWL1nXliIIrNPSfZ1mxs55/yuuVKfkVko8zJsU0ET6HYBKQ==
X-Received: by 2002:a1c:2d4d:: with SMTP id t74mr10508690wmt.108.1571476316579; 
 Sat, 19 Oct 2019 02:11:56 -0700 (PDT)
Received: from debian (host-78-144-219-162.as13285.net. [78.144.219.162])
 by smtp.gmail.com with ESMTPSA id m16sm6785683wml.11.2019.10.19.02.11.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Oct 2019 02:11:56 -0700 (PDT)
Date: Sat, 19 Oct 2019 10:11:54 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] omapfb: reduce stack usage
Message-ID: <20191019091154.qlmb7abqoqdmtz7f@debian>
References: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
 <20191018172728.GA11857@lenoch>
 <20191018223012.tkpwbo3mg5mthlnz@debian>
 <184cdd47d4064420b05c16f10588595c65f789e5.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <184cdd47d4064420b05c16f10588595c65f789e5.camel@perches.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+LSfVcGVgC2SgP+Cklux+YdmwHzIVlEqLbQ9PbRxrCg=;
 b=CeWcpr6NT8ySjUyYXyaxdJuNWlxeqsR23HWvVpfZAYYVwszdHchrTotikgKwz/A5gc
 6EI61leoFAqj+lUg0s5q6g5dHFRcGa4uxeeKPdwMt4DzLNJp9hF0HMv4DNxjWhT0BI3T
 /+9QVX78U2Lj3lnlbOmibWKjsKL7JgXoc6Ffs3fVHDtdi4kulpzJsitGtzu4f2DWFuyI
 A9JCqe694gIJSetB7O13NSGUhGUdfj1Q04rOV4xeeam7IOnV+pm7GsNZH/gkcdZ4bx9O
 r4JPSKL1RCKNjA0WJS/UqP+k0RWvi9c8Leb8pmKm/d65oFvERfMpvL2j22jRoEsc1kuK
 bp5A==
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
Cc: linux-fbdev@vger.kernel.org, Ladislav Michl <ladis@linux-mips.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDY6MTk6MTVQTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gRnJpLCAyMDE5LTEwLTE4IGF0IDIzOjMwICswMTAwLCBTdWRpcCBNdWtoZXJqZWUg
d3JvdGU6Cj4gPiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAwNzoyNzoyOFBNICswMjAwLCBMYWRp
c2xhdiBNaWNobCB3cm90ZToKPiA+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDU6MzA6MDRQ
TSArMDEwMCwgU3VkaXAgTXVraGVyamVlIHdyb3RlOgo+ID4gPiA+IFRoZSBidWlsZCBvZiB4dGVu
c2EgYWxsbW9kY29uZmlnIGlzIGdpdmluZyBhIHdhcm5pbmcgb2Y6Cj4gPiA+ID4gSW4gZnVuY3Rp
b24gJ2RzaV9kdW1wX2RzaWRldl9pcnFzJzoKPiA+ID4gPiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6
ZSBvZiAxMTIwIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMKPHNuaXA+Cj4gCj4gV2l0
aG91dCB5b3VyIHBhdGNoOgo+IAo+ICQgb2JqZHVtcCAteCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29t
YXAyL29tYXBmYi9kc3MvZHNpLm8gfCBncmVwIGRzaV9kdW1wX2RzaWRldl9pcnFzCj4gMDAwMDBk
MjAgbCAgICAgRiAudGV4dAkwMDAwMDYxYyBkc2lfZHVtcF9kc2lkZXZfaXJxcwo+IAo+IFdpdGgg
eW91ciBwYXRjaDoKPiAKPiAkIG9iamR1bXAgLXggZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9v
bWFwZmIvZHNzL2RzaS5vIHwgZ3JlcCBkc2lfZHVtcF9kc2lkZXZfaXJxcwo+IDAwMDAwZDIwIGwg
ICAgIEYgLnRleHQJMDAwMDA2MzggZHNpX2R1bXBfZHNpZGV2X2lycXMKCkkgZGlkIG9iamR1bXAg
LWQgYW5kIHRoZW4gY29tcGFyZWQgd2hlcmUgaXQgc3RhcnRlZCBhbmQgd2hlcmUgaXQgZW5kZWQu
CgpCdXQsIGluIGFueWNhc2UsIHRoaXMgZHJpdmVyIGlzIGZyYW1lYnVmZmVyIGRyaXZlciBmb3Ig
b21hcDIgYW5kIGluCnJlYWxpdHksIGNhbiBvbmx5IGJlIHVzZWQgb24gYXJtIHBsYXRmb3JtIGFu
ZCB3aGVuIEkgYnVpbGQgdGhlIGRyaXZlcgp3aXRoIGFybSBjb21waWxlciBJIGFtIG5vdCBnZXR0
aW5nIHRoaXMgd2FybmluZy4gVGhpcyBpcyBub3QgYSB2YWxpZApjb25jZXJuLCBwbGVhc2UgcmVq
ZWN0IHRoaXMgcGF0Y2guCgotLQpSZWdhcmRzClN1ZGlwCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
