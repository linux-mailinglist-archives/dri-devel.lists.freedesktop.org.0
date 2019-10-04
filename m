Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD2CBA64
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553176EB67;
	Fri,  4 Oct 2019 12:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A6D6EB67
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 12:28:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j18so6148959wrq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 05:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QJoSntAQzxXbjfywXDpQBgndRzPkzwBbp+9xGuC854=;
 b=PCAv+yqQnybwQQYZFdtBFUTMg8xcRtXG3hlk3OLdbB7GvwrKsYIReKyXLFulxHSicf
 JZ2r1BLimpZ+IgHFDY6h67UVPZ+IIqzdppN+iLWrv9uUvoDM8Qd44GYsTUQQisu6k5CH
 w+2Xts5Yfy6ezJ1eL+1TshUoy1I+3++uqX+XpahcL1x8tTV5r/s1JhxtsfcUed5Su2xa
 XGIcKqE8uZvls89C+lk7RbdQ0++J9W+yEjia50CnGN3JN3n2UAFrfFqwAH3HLPk3M07k
 WG5Ri2v6RKrQ6QrondiO80Z8fj7RRlkyg0l1GC7w0C0YtLUgxe10Dlid2HrD0V1OLVc+
 XLzw==
X-Gm-Message-State: APjAAAXs3mPmNTCMqFlmza4oVUMQV2sAPl8YwMJ12BzuxWPzWNZR+jTp
 vnekkOZfFZB3TQ2sOHZcqYTzw2SqRXZ5ODGRV59dhExT
X-Google-Smtp-Source: APXvYqwM6OJetuxstSL7B/A/ld2U7w+VNo/a6Yk3sjIvB7SbBz7s4tX7V8a8NKPcc5svy3IAi483aYecGd+CuRZiBJo=
X-Received: by 2002:adf:e951:: with SMTP id m17mr11268665wrn.154.1570192079610; 
 Fri, 04 Oct 2019 05:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <1570155311-1272-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1570155311-1272-1-git-send-email-chenhc@lemote.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2019 08:27:46 -0400
Message-ID: <CADnq5_NFPW9ibhoZEMzq_sGLrOBys0_NQfwFtBVHnvpk+rt6bg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix build error when !CONFIG_PERF_EVENTS
To: Huacai Chen <chenhc@lemote.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4QJoSntAQzxXbjfywXDpQBgndRzPkzwBbp+9xGuC854=;
 b=TXUepUQYZNfcefsbN2uDqgq/C9Ee/rIBrDJPLNZ0f8MgSYGEuv8/SPuEvyxuu6ts3J
 JIU1f3KxsyzwSZI1KNucL9KBAt2lXaBNEjZIa5Pso9bE7Gdf6V+y+nLk2spQc9HsrIqH
 gXjWVGCEAT9s6XYQMY3mB1N7LtWH5yivTP76v5LhvqR/pff3TXhNSAJLRJ+OhtLSbj0+
 myB65ricGOjeJYle6Iuk1/NkRX0S/62OAEJ/1mSPjlJJQ9dTccUbgWyvsYprL9Ex/lSh
 DwEDcGqxz3tlAVUIQmuOIV5iRdXPE4onUEsk4nxgoI5v/DUlEV/tTBOxasx3vliCS16+
 FBIw==
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <Luben.Tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCAxMDoxMyBQTSBIdWFjYWkgQ2hlbiA8Y2hlbmhjQGxlbW90
ZS5jb20+IHdyb3RlOgo+Cj4gSW4gcHJldmlvdXMgcmVsZWFzZSBhbWRncHVfcG11Lm8gaXMgb25s
eSBidWlsdCB3aGVuIENPTkZJR19QRVJGX0VWRU5UUwo+IGlzIHNlbGVjdGVkLiBCdXQgYWZ0ZXIg
Y29tbWl0IDY0ZjU1ZTYyOTIzN2U0NzUyZGIxICgiZHJtL2FtZGdwdTogQWRkIFJBUwo+IEVFUFJP
TSB0YWJsZS4iKSBpdCBpcyBkdXBsaWNhdGVkIGluIGFtZGdwdS15LiBUaGlzIGNoYW5nZSBjYXVz
ZXMgYSBidWlsZAo+IGVycm9yIHdoZW4gIUNPTkZJR19QRVJGX0VWRU5UUywgc28gZml4IGl0Lgo+
Cj4gRml4ZXM6IDY0ZjU1ZTYyOTIzN2U0NzUyZGIxICgiZHJtL2FtZGdwdTogQWRkIFJBUyBFRVBS
T00gdGFibGUuIikKPiBDYzogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFt
ZC5jb20+Cj4gQ2M6IEx1YmVuIFR1aWtvdiA8THViZW4uVHVpa292QGFtZC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSHVhY2FpIENoZW4gPGNoZW5oY0BsZW1vdGUuY29tPgoKQWxyZWFkeSBmaXhlZDoK
aHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtL2NvbW1pdC8/aD1kcm0tZml4ZXMm
aWQ9ZWMzZTVjMGYwYzJiNzE2ZTc2OGMwZWVlMGZlYzMwZDU3MjkzOWVmNQoKVGhhbmtzIQoKQWxl
eAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKPiBpbmRleCA0MmUyYzFmLi4wMDk2MmE2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKPiBAQCAtNTQsNyArNTQsNyBAQCBhbWRncHUt
eSArPSBhbWRncHVfZGV2aWNlLm8gYW1kZ3B1X2ttcy5vIFwKPiAgICAgICAgIGFtZGdwdV9ndHRf
bWdyLm8gYW1kZ3B1X3ZyYW1fbWdyLm8gYW1kZ3B1X3ZpcnQubyBhbWRncHVfYXRvbWZpcm13YXJl
Lm8gXAo+ICAgICAgICAgYW1kZ3B1X3ZmX2Vycm9yLm8gYW1kZ3B1X3NjaGVkLm8gYW1kZ3B1X2Rl
YnVnZnMubyBhbWRncHVfaWRzLm8gXAo+ICAgICAgICAgYW1kZ3B1X2dtYy5vIGFtZGdwdV94Z21p
Lm8gYW1kZ3B1X2NzYS5vIGFtZGdwdV9yYXMubyBhbWRncHVfdm1fY3B1Lm8gXAo+IC0gICAgICAg
YW1kZ3B1X3ZtX3NkbWEubyBhbWRncHVfcG11Lm8gYW1kZ3B1X2Rpc2NvdmVyeS5vIGFtZGdwdV9y
YXNfZWVwcm9tLm8gc211X3YxMV8wX2kyYy5vCj4gKyAgICAgICBhbWRncHVfdm1fc2RtYS5vIGFt
ZGdwdV9kaXNjb3ZlcnkubyBhbWRncHVfcmFzX2VlcHJvbS5vIHNtdV92MTFfMF9pMmMubwo+Cj4g
IGFtZGdwdS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0gYW1kZ3B1X3BtdS5vCj4KPiAtLQo+IDIu
Ny4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
