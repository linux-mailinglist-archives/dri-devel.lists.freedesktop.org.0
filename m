Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045F1B99C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 17:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0EF89FCC;
	Mon, 13 May 2019 15:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DBE89FD1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 15:11:30 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n17so18091254edb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 08:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=J5QWXq8SUDOV84x/ETfPywJAloYo/R8uw6vUDbE8R0Q=;
 b=EuC1mQ6rc9kDAfDcUarpBO5QV/bPIEtSjI7fcpE6NpGnXTE1sZ+FCFAd863CSE0qEX
 Zrdlmc52T6nZSg3d6DdMsOWq3XwL2YQ96cBqBZZDawo+rLzHG2i33FdYUWAlddRN/ibU
 Z8JPnSegm880RnUWsPki+fTPL9dLeszYZPTLmytDcClZsOMLA+xsmaptP90E3PtgEsh5
 UCjkAQr2a9KUDhwlZKk0f/2Hqdpa+jKj9KtAOqywn208xRRETGjLbAL+7hds2iCh83LZ
 fRcZaPmqePpORvzITFZz2jov+HcdeRRQKZz4QtdXAZ30StUIQjmVHLlgJJ7e6au+wSL0
 EnNA==
X-Gm-Message-State: APjAAAVGTbU/z9gpzzEaqla2dQzn58YekUefqrOMBijCO8T1FSP6LnfD
 7Du/ZcBTM0CEholihqMYLSfmRQ==
X-Google-Smtp-Source: APXvYqwDjTBdwUAYOEbvyqBBLKm9nvAQxfpPCGaKgMTzF378dr/1TfU+uMsDcTVYby2DQacIOdz9rg==
X-Received: by 2002:a50:b6b2:: with SMTP id d47mr30578108ede.169.1557760288994; 
 Mon, 13 May 2019 08:11:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y46sm3858574edd.29.2019.05.13.08.11.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 08:11:28 -0700 (PDT)
Date: Mon, 13 May 2019 17:11:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] Revert "vgaarb: Keep adding VGA device in queue"
Message-ID: <20190513151124.GV17751@phenom.ffwll.local>
References: <20190510142958.28017-1-alexander.deucher@amd.com>
 <20190510154208.GL17751@phenom.ffwll.local>
 <58ea5dae-be17-af97-0066-48feab80497e@daenzer.net>
 <1946afdf-f87f-c6bb-e492-be5c73707995@canonical.com>
 <75236873-7a53-9106-cba5-b0353aae2eef@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75236873-7a53-9106-cba5-b0353aae2eef@daenzer.net>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=J5QWXq8SUDOV84x/ETfPywJAloYo/R8uw6vUDbE8R0Q=;
 b=dcjIGxc6+jy5mKRgNl1Ry9zksgNlxqw6Nb7pQVA/s3m09B9iawFHyqOPM4AVJgVrSQ
 k383ltfaRjcGqWHx2uXnDPVerD17gqvbKE05nho858ov6qvV7oJwUyBahBd6eSDa8LBt
 +P+P7nuDAJR2iEi31Zl8AvcpmHl0iamJDDjKw=
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Aaron Ma <aaron.ma@canonical.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTI6MTQ6MjlQTSArMDIwMCwgTWljaGVsIETDpG56ZXIg
d3JvdGU6Cj4gT24gMjAxOS0wNS0xMCA4OjAxIHAubS4sIEFhcm9uIE1hIHdyb3RlOgo+ID4gT24g
NS8xMC8xOSAxMTo0NiBQTSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gPj4+IEdpdmVuIHRoYXQg
dGhlIGJ1ZyBpcyBhIGJpdCBhIG1lc3MgSSB0aGluayB3ZSBuZWVkIHRvIGFkZCBhIGJpdCBtb3Jl
Cj4gPj4+IGNvbnRleHQgaGVyZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIE15IHVuZGVyc3RhbmRp
bmc6Cj4gPj4+Cj4gPj4+IEdvYWwgb2YgdGhlIHJldmVydCBjb21taXQgd2FzIHRvIG1ha2UgdGhl
IGludGVncmF0ZWQgYm9vdCBkZXZpY2UgdGhlCj4gPj4+IHByaW1hcnkgb25lLCBpZiB3ZSBjYW4n
dCBkZXRlY3Qgd2hpY2ggb25lIGlzIHRoZSBib290IGRldmljZSwgaW5zdGVhZCBvZgo+ID4+PiB0
aGUgbGFzdCBvbmUuIFdoaWNoIG1ha2VzIHNvbWUgc2Vuc2UuCj4gPj4+Cj4gPj4+IE5vdyBwZW9w
bGUgaGF2ZSByZWxpZWQgb24gdGhlIGtlcm5lbCBwaWNraW5nIHRoZSBsYXN0IG9uZSwgd2hpY2gg
dXN1YWxseQo+ID4+PiBpcyBhbiBhZGQtb24gY2FyZCwgYW5kIHRoZXJlZm9yZSBzaW1wbHkgcGx1
Z2dpbmcgaW4gYW4gYWRkLW9uIGNhcmQgYWxsb3dzCj4gPj4+IHRoZW0gdG8gb3ZlcndyaXRlIHRo
ZSBkZWZhdWx0IGNob2ljZS4gV2hpY2ggYWxzbyBtYWtlcyBzZW5zZSwgYW5kIHNpbmNlCj4gPj4+
IGl0J3MgdGhlIG9sZGVyIGJlaGF2aW91ciwgd2lucy4KPiA+Pj4KPiA+Pj4gSSB0aGluayBpdCdk
IGJlIGdvb2QgdG8gYWRkIGEgY29tbWVudCBoZXJlIHRoYXQgdGhpcyBiZWhhdmlvdXIgaGFzIGJl
Y29tZQo+ID4+PiB1YXBpLCBlLmcuCj4gPj4+Cj4gPj4+IAkvKiBBZGQgYXQgdGhlIGZyb250IHNv
IHRoYXQgd2UgcGljayB0aGUgbGFzdCBkZXZpY2UgYXMgZmFsbGJhY2sKPiA+Pj4gCSAqIGRlZmF1
bHQsIHdpdGggdGhlIHVzdWFsIHJlc3VsdCB0aGF0IHBsdWcgaW4gY2FyZHMgYXJlIHByZWZlcnJl
ZAo+ID4+PiAJICogb3ZlciBpbnRlZ3JhdGVkIGdyYXBoaWNzLiAqLwo+ID4+Pgo+ID4+PiBXaXRo
IHRoYXQgKG9yIHNpbWlsYXIpIGFuZCBtb3JlIGNvbW1pdCBtZXNzYWdlIGNvbnRleHQ6Cj4gPj4g
VGhlIGJ1ZyByZXBvcnRlcidzIHN5c3RlbSBkb2Vzbid0IGhhdmUgaW50ZWdyYXRlZCBncmFwaGlj
cyB0aG91Z2gsIGp1c3QKPiA+PiB0d28gcGx1Zy1pbiBjYXJkcy4gSXQncyBub3QgY2xlYXIgdG8g
bWUgeWV0IHRoYXQgdGhlaXIgZXhwZWN0YXRpb24gb2YKPiA+PiBYb3JnIHRvIHBpY2sgYW55IHBh
cnRpY3VsYXIgb25lIG9mIHRoZW0gd2l0aG91dCBjb25maWd1cmF0aW9uIHdhcyBqdXN0aWZpZWQu
Cj4gPiAKPiA+IAo+ID4gVGhpcyBjb2RlIGlzIGtpbmQgb2YgZmFpbCBzYWZlLgo+ID4gCj4gPiBX
aGVuIGluIGh5YnJpZCBncmFwaGljIG1vZGUuCj4gPiBJdCBzaG91bGQgZmFsbGJhY2sgdG8gaW50
ZWdyYXRlZCBHUFUsIHdoaWNoIHNob3VsZCBhbHdheXMgYmUgcHJpbWFyeSBmYi4KPiA+IFNvIHBp
Y2tpbmcgMXN0IChtaW5vciBQQ0kgSUQgbnVtYmVyKSBHUFUgc2hvdWxkIG1ha2UgbW9yZSBzZW5z
ZS4KPiA+IAo+ID4gV2hlbiB3aXRoIG11bHRpcGxlIGQtR1BVcywgd2UgY2FuJ3Qgc2F5IHdoaWNo
IGNhcmQgc2hvdWxkIGJlIHRoZSByaWdodAo+ID4gb25lIGZvciB1c2VycyB3aGVuIG5vIFhvcmcg
Y29uZiBzZXQuCj4gPiBVc3VhbGx5IEJJT1Mgd2lsbCBzZXQgdGhlIDFzdCAobWlub3IgUENJIElE
IG51bWJlcikgZC1HUFUgYXMgcHJpbWFyeS4KPiA+IFNvIGFsaWduaW5nIHdpdGggQklPUyBzZXR0
aW5nIHdpbGwgYmUgYmV0dGVyIEkgdGhpbmsuCj4gCj4gUmlnaHQuIFRoZSBidWcgZGVzY3JpcHRp
b24gZXZlbiBzYXlzIHRoYXQgdGhlIGNhcmQgdGhlIHJlcG9ydGVyIGV4cGVjdGVkCj4gWG9yZyB0
byBjb21lIHVwIG9uIGlzIHRoZSAic2Vjb25kYXJ5IiBjYXJkIGluIGEgUENJZSAxeCBzbG90ICh3
aGVyZWFzCj4gdGhlIHByaW1hcnkgaXMgaW4gUENJZSAxNngpLiBJdCBzZWVtcyBwcmV0dHkgY2xl
YXIgdGhhdCB5b3VyIGNoYW5nZQo+IGFjdHVhbGx5IG1hZGUgdGhpbmdzIGJldHRlciwgYW5kIHRo
ZSByZXBvcnRlciB3YXMganVzdCByZWx5aW5nIG9uIHRoZQo+IHByZXZpb3VzIHdyb25nIGJlaGF2
aW91ci4gVGhlcmVmb3JlIEkgcmVzb2x2ZWQgdGhlIHJlcG9ydCBhcyBub3QgYSBidWcsCj4gYW5k
IHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGRyb3BwZWQuCgpIbSBJIG1pc3NlZCB0aGF0IHRoaXMgaXMg
YWJvdXQgMiBleHRlcm5hbCBwY2kgc2xvdHMuIEFncmVlaW5nIHdpdGggeW91CnJlYXNvbmluZyBo
ZXJlIG5vdywgcmV0cmFjdGluZyBteSByLWIuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
