Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01AF4EC83
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04B96E8E9;
	Fri, 21 Jun 2019 15:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB796E8E9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:49:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so10738903eds.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=urFcwKCOqXsZhsF5Qjs/RceQdsW1nEHCAXTfADLNqxU=;
 b=PtGrZi+2msB8maZAFx3vcjo7+YOdFdkfUsrYEYunuk0Fc633tgjKG7EJP3Kqp9kwtt
 ZpQrP8FJaRM/TJK9ASFp56KbumuNJDwjlMkb8JgsVeD647ZHjm/atrp/NakeJaQT5qX2
 9tE/mtPZReRzd5f2ytvFJLUYKgRVNm+l+47sn8QDl++l2RqWNdUMTCzT1YOL1kQZ5HH5
 DqjtlmgMOalo65/uXUAu6qqbFPvkP3kg/reh3JyBqqhspKzhyyv6+a6ZWBEjyieK8+Cc
 JwSw+v6OC9YUfAvxMzD9VO4BWq0xPTFsviB+7BROJjIak8k6b6HbfBCvXchiwBUmtrQK
 eJfw==
X-Gm-Message-State: APjAAAVz9R14qkScR/OfVCaFBHnH7BwKmrbKkIaR9aIk1ZZXr9frD2bJ
 JtJuDVrdbdWt55oINsxwEPAR7A==
X-Google-Smtp-Source: APXvYqz5U9SAoGOPhwyuOMIVZmwVpEK1glb2QXE2/hXQ0Pcs/rm8eZCcsNfwYVlJyv50y+baFiVliw==
X-Received: by 2002:a05:6402:1801:: with SMTP id
 g1mr54351512edy.262.1561132165340; 
 Fri, 21 Jun 2019 08:49:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f36sm930355ede.47.2019.06.21.08.49.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 08:49:24 -0700 (PDT)
Date: Fri, 21 Jun 2019 17:49:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: Fixes tags need some work in the drm-fixes tree
Message-ID: <20190621154917.GG12905@phenom.ffwll.local>
Mail-Followup-To: Philipp Zabel <p.zabel@pengutronix.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>
References: <20190621214125.6fb68eee@canb.auug.org.au>
 <1561121145.3149.7.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561121145.3149.7.camel@pengutronix.de>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=urFcwKCOqXsZhsF5Qjs/RceQdsW1nEHCAXTfADLNqxU=;
 b=ielkvWlTL0ttOEF6UkQ2aRv8QOg5eo2l1cwqbFchmDdczzyt1yp6/+Bk4VEkLiQH8o
 U5WipBNtan5McZWNxE98M/PsPKEocjgjUhOp0NmFqET9YqV46O1NzStnGng8buN3F1Lt
 JB8mZ+PmxSllHtucPLQj838mqAuDs6n4NKpA8=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDI6NDU6NDVQTSArMDIwMCwgUGhpbGlwcCBaYWJlbCB3
cm90ZToKPiBPbiBGcmksIDIwMTktMDYtMjEgYXQgMjE6NDEgKzEwMDAsIFN0ZXBoZW4gUm90aHdl
bGwgd3JvdGU6Cj4gPiBIaSBhbGwsCj4gPiAKPiA+IEluIGNvbW1pdAo+ID4gCj4gPiAgIDkxMmJi
ZjdlOWNhNCAoImdwdTogaXB1LXYzOiBpbWFnZS1jb252ZXJ0OiBGaXggaW1hZ2UgZG93bnNpemUg
Y29lZmZpY2llbnRzIikKPiA+IAo+ID4gRml4ZXMgdGFnCj4gPiAKPiA+ICAgRml4ZXM6IDcwYjli
NmIzYmNiMjEgKCJncHU6IGlwdS12MzogaW1hZ2UtY29udmVydDogY2FsY3VsYXRlIHBlci10aWxl
Cj4gPiAKPiA+IGhhcyB0aGVzZSBwcm9ibGVtKHMpOgo+ID4gCj4gPiAgIC0gUGxlYXNlIGRvbid0
IHNwbGl0IEZpeGVzIHRhZ3MgYWNyb3NzIG1vcmUgdGhhbiBvbmUgbGluZQo+ID4gCj4gPiBJbiBj
b21taXQKPiA+IAo+ID4gICBiY2E0ZDcwY2YxYjggKCJncHU6IGlwdS12MzogaW1hZ2UtY29udmVy
dDogRml4IGlucHV0IGJ5dGVzcGVybGluZSBmb3IgcGFja2VkIGZvcm1hdHMiKQo+ID4gCj4gPiBG
aXhlcyB0YWcKPiA+IAo+ID4gICBGaXhlczogZDk2NmUyM2Q2MWEyYyAoImdwdTogaXB1LXYzOiBp
bWFnZS1jb252ZXJ0OiBmaXggYnl0ZXNwZXJsaW5lCj4gPiAKPiA+IGhhcyB0aGVzZSBwcm9ibGVt
KHMpOgo+ID4gCj4gPiAgIC0gUGxlYXNlIGRvbid0IHNwbGl0IEZpeGVzIHRhZ3MgYWNyb3NzIG1v
cmUgdGhhbiBvbmUgbGluZQo+ID4gCj4gPiBJbiBjb21taXQKPiA+IAo+ID4gICBmZjM5MWVjZDY1
YTEgKCJncHU6IGlwdS12MzogaW1hZ2UtY29udmVydDogRml4IGlucHV0IGJ5dGVzcGVybGluZSB3
aWR0aC9oZWlnaHQgYWxpZ24iKQo+ID4gCj4gPiBGaXhlcyB0YWcKPiA+IAo+ID4gICBGaXhlczog
ZDk2NmUyM2Q2MWEyYyAoImdwdTogaXB1LXYzOiBpbWFnZS1jb252ZXJ0OiBmaXggYnl0ZXNwZXJs
aW5lCj4gPiAKPiA+IGhhcyB0aGVzZSBwcm9ibGVtKHMpOgo+ID4gCj4gPiAgIC0gUGxlYXNlIGRv
bid0IHNwbGl0IEZpeGVzIHRhZ3MgYWNyb3NzIG1vcmUgdGhhbiBvbmUgbGluZQo+ID4gCj4gCj4g
SSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBkaW0gd291bGQgaGF2ZSBmb3VuZCB0aG9z
ZSwgYnV0IEkgb25seQo+IGp1c3QgcmVhbGl6ZWQgdGhhdCAiZGltIGNoZWNrcGF0Y2giIGRvZXNu
J3QgYWN0dWFsbHkgZG8gYW55IGFkZGl0aW9uYWwKPiBjaGVja3MgYmV5b25kIHNjcmlwdHMvY2hl
Y2twYXRjaC5wbC4gRml4ZXMgdGFncyBhcmUgY2hlY2tlZCBvbmx5IGFzIGEKPiBwYXJ0IG9mICJk
aW0gcHVzaCIuIEkgd29uZGVyIGlmIHRoaXMgY291bGQgYmUgY2hhbmdlZCBbMV0uCj4gCj4gWzFd
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWFpbnRhaW5lci10b29scy9tZXJn
ZV9yZXF1ZXN0cy81CgpPZmZpY2lhbGx5IHdlIGRvbid0IHlldCB0YWtlIHB1bGwgcmVxdWVzdHMg
KGNvdWxkIHRyeSB0byBjaGFuZ2UgdGhhdCwgYnV0Cmxhc3QgdGltZSBhcm91bmQgaXQgZ290IG5h
Y2tlZCBieSBKYW5pKS4gQ2FuIHlvdSBwbHMgc3VibWl0IHRvIGRpbS10b29sc0AKYXMgcGF0Y2g/
CgpBbHNvLCB3b3VsZCBiZSBuaWNlIHRvIHJ1biBhbGwgdGhlIHNhbWUgY2hlY2tzIHdlIHJ1biBh
dCBkaW0gcHVzaCB0aW1lLApub3QganVzdCBjaGVja2luZyBmb3IgRml4ZXMgdGFncy4KLURhbmll
bAoKPiAKPiByZWdhcmRzCj4gUGhpbGlwcAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
