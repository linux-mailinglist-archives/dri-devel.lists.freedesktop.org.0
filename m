Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9048134B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18B16E29A;
	Mon,  5 Aug 2019 07:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632216E76F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 21:17:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t8so55914051qkt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 14:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RVTQ02iVRQpTjOR6GTqSpU7hzhiBP+qZzmy99EzkJ88=;
 b=U4n4O/Rcot5gFaFAhq15e035p63Ln2qeL+djCaa0IP4idQJAHb1BGCD9tExTdwHxcm
 UzSfitTpJFQyiGSxzXNgxbWnEyTEeHe8XncN+zw4lBklYGBaOT2axluWScBlPZXJsbhy
 CnxSCN37KOVmcTI0Vy8g9WkY+LLO4wHQ63w3EtiwCinLgdsWZs3YhMhp6pHGZ5tzMQWm
 XjjYw8B8qtr3AJGbN/TwU4PTMkfCWiyX8lMu4NeFNPZPopMcZVHEIj677RHSYS54d3Sg
 ed2i0t4WHdWROljBInzq1cbsSZYA3SBpNLd8aojjGLrDJwfOwhUdOaVsdyh0VQyG5bc9
 8QUA==
X-Gm-Message-State: APjAAAXu5yDZBZL673VFKfOfRlgzMb7+WDQ9iIKBpUG3skds2dgEq/YF
 +YgFpeMVYgkcLM+N/1sGWnDvMA==
X-Google-Smtp-Source: APXvYqywXaTJhVsrTGMTx1+T9sEYk2fJfeee8YhdWcSDuIFnrmC8f/A4061EUHzmjTKYluWIEGzpqw==
X-Received: by 2002:ae9:f016:: with SMTP id l22mr92931142qkg.51.1564780653184; 
 Fri, 02 Aug 2019 14:17:33 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id o33sm36437909qtd.72.2019.08.02.14.17.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 14:17:32 -0700 (PDT)
Message-ID: <1564780650.11067.50.camel@lca.pw>
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
From: Qian Cai <cai@lca.pw>
To: Matthew Wilcox <willy@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Fri, 02 Aug 2019 17:17:30 -0400
In-Reply-To: <20190802203344.GD5597@bombadil.infradead.org>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RVTQ02iVRQpTjOR6GTqSpU7hzhiBP+qZzmy99EzkJ88=;
 b=ivOSZ6tIYTANNW9b9aYCoAB5LDc59jUBtwIJ0Um/e+qkGwPOlOnYkNDxygF/GpEP8P
 wmIEOPtmBcqwtsJ2OHFRs1y804vo68YLJLLBGFafTzh5TPv7g6eMiPTtniYSqHBb4z04
 sSYjlL0/q+bxGmFcC6UPv+DakK8EKOhh0akls9REboq4MTqVQFKWG4HhKz2FvPW4A1IG
 EmmVrxLEJep29xlIF+4c7SKlOsTxw0eh1k2fRCBi598+DYI6lLC2Jr+nbdIULvl50rgO
 0+fP5nprKC/cp2r0ibrVAxgIC5hMs4YwVq1gpUwYPtVL1VMzqjdsyyvLfqXi7OV/8h8x
 jTjA==
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, petr@vandrovec.name,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA4LTAyIGF0IDEzOjMzIC0wNzAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToK
PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwMToyMzowNlBNIC0wNzAwLCBBbmRyZXcgTW9ydG9u
IHdyb3RlOgo+ID4gPiBbMjU5NzAxLjM4NzM2NV0gQlVHOiBCYWQgcGFnZSBzdGF0ZSBpbiBwcm9j
ZXNzIFhvcmfCoMKgcGZuOjJhMzAwCj4gPiA+IFsyNTk3MDEuMzkzNTkzXSBwYWdlOmZmZmZlYTAw
MDBhOGMwMDAgcmVmY291bnQ6MCBtYXBjb3VudDotMTI4Cj4gPiA+IG1hcHBpbmc6MDAwMDAwMDAw
MDAwMDAwMCBpbmRleDoweDAKPiAKPiBtYXBjb3VudCAtMTI4IGlzIFBBR0VfTUFQQ09VTlRfUkVT
RVJWRSwgYWthIFBhZ2VCdWRkeS7CoMKgSSB0aGluayBzb21lYm9keQo+IGNhbGxlZCBwdXRfcGFn
ZSgpIG9uY2UgbW9yZSB0aGFuIHRoZXkgc2hvdWxkIGhhdmUuwqDCoFRoZSBvbmUgYmVmb3JlIHRo
aXMKPiBjYXVzZWQgaXQgdG8gYmUgZnJlZWQgdG8gdGhlIHBhZ2UgYWxsb2NhdG9yLCB3aGljaCBz
ZXQgUGFnZUJ1ZGR5LsKgwqBUaGVuCj4gdGhpcyBvbmUgaGFwcGVuZWQgYW5kIHdlIGdvdCBhIGNv
bXBsYWludC4KPiAKPiA+ID4gWzI1OTcwMS40MDI4MzJdIGZsYWdzOiAweDIwMDAwMDAwMDAwMDAw
MDAoKQo+ID4gPiBbMjU5NzAxLjQwNzQyNl0gcmF3OiAyMDAwMDAwMDAwMDAwMDAwIGZmZmZmZmZm
ODIyYWI3NzggZmZmZmVhMDAwMGE4ZjIwOAo+ID4gPiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+IFsy
NTk3MDEuNDE1OTAwXSByYXc6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMyAwMDAw
MDAwMGZmZmZmZjdmCj4gPiA+IDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gWzI1OTcwMS40MjQzNzNd
IHBhZ2UgZHVtcGVkIGJlY2F1c2U6IG5vbnplcm8gbWFwY291bnQKPiAKPiBJdCBvY2N1cnMgdG8g
bWUgdGhhdCB3aGVuIGEgcGFnZSBpcyBmcmVlZCwgd2UgY291bGQgcmVjb3JkIHNvbWUgdXNlZnVs
IGJpdHMKPiBvZiBpbmZvcm1hdGlvbiBpbiB0aGUgcGFnZSBmcm9tIHRoZSBzdGFjayB0cmFjZSB0
byBoZWxwIGRlYnVnIGRvdWJsZS1mcmVlwqAKPiBzaXR1YXRpb25zLsKgwqBFdmVuIGp1c3Qgc3Rh
c2hpbmcgX19idWlsdGluX3JldHVybl9hZGRyZXNzIGluIHBhZ2UtPm1hcHBpbmcKPiB3b3VsZCBi
ZSBoZWxwZnVsLCBJIHRoaW5rLgoKU291bmRzIGxpa2UgbmVlZCB0byBlbmFibGUgInBhZ2Vfb3du
ZXIiLCBzbyBpdCB3aWxsIGRvIMKgX19kdW1wX3BhZ2Vfb3duZXIoKS4KCj4gCj4gPiA+IFsyNTk3
MDEuNTQ5MzgyXSBDYWxsIFRyYWNlOgo+ID4gPiBbMjU5NzAxLjU0OTM4Ml3CoMKgZHVtcF9zdGFj
aysweDQ2LzB4NjAKPiA+ID4gWzI1OTcwMS41NDkzODJdwqDCoGJhZF9wYWdlLmNvbGQuMjgrMHg4
MS8weGI0Cj4gPiA+IFsyNTk3MDEuNTQ5MzgyXcKgwqBfX2ZyZWVfcGFnZXNfb2srMHgyMzYvMHgy
NDAKPiA+ID4gWzI1OTcwMS41NDkzODJdwqDCoF9fdHRtX2RtYV9mcmVlX3BhZ2UrMHgyZi8weDQw
Cj4gPiA+IFsyNTk3MDEuNTQ5MzgyXcKgwqB0dG1fZG1hX3VucG9wdWxhdGUrMHgyOWIvMHgzNzAK
PiA+ID4gWzI1OTcwMS41NDkzODJdwqDCoHR0bV90dF9kZXN0cm95LnBhcnQuNisweDQ0LzB4NTAK
PiA+ID4gWzI1OTcwMS41NDkzODJdwqDCoHR0bV9ib19jbGVhbnVwX21lbXR5cGVfdXNlKzB4Mjkv
MHg3MAo+ID4gPiBbMjU5NzAxLjU0OTM4Ml3CoMKgdHRtX2JvX3B1dCsweDIyNS8weDI4MAo+ID4g
PiBbMjU5NzAxLjU0OTM4Ml3CoMKgdHRtX2JvX3ZtX2Nsb3NlKzB4MTAvMHgyMAo+ID4gPiBbMjU5
NzAxLjU0OTM4Ml3CoMKgcmVtb3ZlX3ZtYSsweDIwLzB4NDAKPiA+ID4gWzI1OTcwMS41NDkzODJd
wqDCoF9fZG9fbXVubWFwKzB4MmRhLzB4NDIwCj4gPiA+IFsyNTk3MDEuNTQ5MzgyXcKgwqBfX3Zt
X211bm1hcCsweDY2LzB4YzAKPiA+ID4gWzI1OTcwMS41NDkzODJdwqDCoF9feDY0X3N5c19tdW5t
YXArMHgyMi8weDMwCj4gPiA+IFsyNTk3MDEuNTQ5MzgyXcKgwqBkb19zeXNjYWxsXzY0KzB4NWUv
MHgxYTAKPiA+ID4gWzI1OTcwMS41NDkzODJdwqDCoD8gcHJlcGFyZV9leGl0X3RvX3VzZXJtb2Rl
KzB4NzUvMHhhMAo+ID4gPiBbMjU5NzAxLjU0OTM4Ml3CoMKgZW50cnlfU1lTQ0FMTF82NF9hZnRl
cl9od2ZyYW1lKzB4NDQvMHhhOQo+ID4gPiBbMjU5NzAxLjU0OTM4Ml0gUklQOiAwMDMzOjB4N2Y1
MDRkMGVjMWQ3Cj4gPiA+IFsyNTk3MDEuNTQ5MzgyXSBDb2RlOiAxMCBlOSA2NyBmZiBmZiBmZiAw
ZiAxZiA0NCAwMCAwMCA0OCA4YiAxNSBiMSA2YyAwYwo+ID4gPiAwMCBmNwo+ID4gPiBkOCA2NCA4
OSAwMiA0OCBjNyBjMCBmZiBmZiBmZiBmZiBlOSA2YiBmZiBmZiBmZiBiOCAwYiAwMCAwMCAwMCAw
ZiAwNSA8NDg+Cj4gPiA+IDNkIDAxCj4gPiA+IGYwIGZmIGZmIDczIDAxIGMzIDQ4IDhiIDBkIDg5
IDZjIDBjIDAwIGY3IGQ4IDY0IDg5IDAxIDQ4Cj4gPiA+IFsyNTk3MDEuNTQ5MzgyXSBSU1A6IDAw
MmI6MDAwMDdmZmU1MjlkYjEzOCBFRkxBR1M6IDAwMDAwMjA2IE9SSUdfUkFYOgo+ID4gPiAwMDAw
MDAwMDAwMDAwMDBiCj4gPiA+IFsyNTk3MDEuNTQ5MzgyXSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEg
UkJYOiAwMDAwNTY0YTVlYWJjZTcwIFJDWDoKPiA+ID4gMDAwMDdmNTA0ZDBlYzFkNwo+ID4gPiBb
MjU5NzAxLjU0OTM4Ml0gUkRYOiAwMDAwN2ZmZTUyOWRiMTQwIFJTSTogMDAwMDAwMDAwMDQwMDAw
MCBSREk6Cj4gPiA+IDAwMDA3ZjUwNDRiNjUwMDAKPiA+ID4gWzI1OTcwMS41NDkzODJdIFJCUDog
MDAwMDU2NGE1ZWFmZTQ2MCBSMDg6IDAwMDAwMDAwMDAwMDAwMGIgUjA5Ogo+ID4gPiAwMDAwMDAw
MTAyODNlMDAwCj4gPiA+IFsyNTk3MDEuNTQ5MzgyXSBSMTA6IDAwMDAwMDAwMDAwMDAwMDEgUjEx
OiAwMDAwMDAwMDAwMDAwMjA2IFIxMjoKPiA+ID4gMDAwMDU2NGE1ZTQ3NWIwOAo+ID4gPiBbMjU5
NzAxLjU0OTM4Ml0gUjEzOiAwMDAwNTY0YTVlNDc1YzgwIFIxNDogMDAwMDdmZmU1MjlkYjE5MCBS
MTU6Cj4gPiA+IDAwMDAwMDAwMDAwMDBjODAKPiA+ID4gWzI1OTcwMS43MDcyMzhdIERpc2FibGlu
ZyBsb2NrIGRlYnVnZ2luZyBkdWUgdG8ga2VybmVsIHRhaW50Cj4gPiAKPiA+IEkgYXNzdW1lIHRo
ZSBhYm92ZSBpcyBtaXNiZWhhdmlvdXIgaW4gdGhlIERSTSBjb2RlPwo+IAo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
