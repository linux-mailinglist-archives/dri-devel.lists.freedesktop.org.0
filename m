Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74F67A7E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4747F6E3E3;
	Sat, 13 Jul 2019 14:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CBA6E377
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 19:45:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so9317162qtj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 12:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uf/ZSZSXNd4QAZJyCg9locUkKYy9cCURVXWZqnNb+h4=;
 b=azY+z0kMoR4VMDIZGnexCDgePNMQQHX2nHe0eI0/F5HrLEI2hFGol0x0BMJ/x54tZg
 hh3fNtwk8Y+rrTDw0Cn1IT925YFup2BNMsM2fO6/JvDLXXe8g/YPyJTjKLu8FoXULHI1
 87VSJTbjRiB2UeKS2gdME/Rm9X4vJNUOJSUIza4ucgYSEcjlM2p7wh37de6OKdCl9jz9
 gp6mWb22bXXyQoM4tPJG8Dma8m2x71vCBfN1hJvtYt0nVj+7INEaI3Mv7ufnT775Bs/U
 uJSzwjblwT/XaAEwItHF+PUGbefbwlriF9ytXK/58l5CO/DgaUVuh9HUhL82cfsrkf6E
 ZwDA==
X-Gm-Message-State: APjAAAVf6/y4VUkimywdCuXPYiNZUoiNfpO0rBUf8DqI5QHibOh2zkKj
 +j2hURRdpGMmh4e0Pe+23q5vVQ==
X-Google-Smtp-Source: APXvYqzMEaiAFj63ZnaAYInlBZ2BCAScvRQzSk+eXQOGYKkHSBlgvbtnyLl0nyVIBFU9VX92RFcaWQ==
X-Received: by 2002:a0c:e588:: with SMTP id t8mr8269608qvm.179.1562960738336; 
 Fri, 12 Jul 2019 12:45:38 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id r14sm4632949qke.47.2019.07.12.12.45.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 12:45:37 -0700 (PDT)
Message-ID: <1562960735.8510.30.camel@lca.pw>
Subject: Re: [PATCH v3] gpu/drm_memory: fix a few warnings
From: Qian Cai <cai@lca.pw>
To: akpm@linux-foundation.org
Date: Fri, 12 Jul 2019 15:45:35 -0400
In-Reply-To: <1562685190-1353-1-git-send-email-cai@lca.pw>
References: <1562685190-1353-1-git-send-email-cai@lca.pw>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uf/ZSZSXNd4QAZJyCg9locUkKYy9cCURVXWZqnNb+h4=;
 b=fhr+GTL3qGOQfXrQWWqFVWvBS4bwFKmPchUELi37X6j/u6YTtA0VkzzeqDoZZszWqa
 VXWINnyqoH0rOyQ4OceOnDmfciKFiu3M/kVpu97MapdVfPuEwD6QrMBo1eGSif45N2p5
 nTPRsJfraqQEZY4MRADP/nBCm8ck1ggciFJ7baFsm1mMUullBwllZt4EV8UMWrGmO3sZ
 dgQZsLBHFW0Se34Ur4qvoqig5bJ+ZfgTzNdzIBRScOwCYs/2KKW/QwHyutFKIRepSCDQ
 Lg6if/6uZOKfEHqCJcAGz5VJRWBTkUfu5NgT6+eEk50GvkdYlbzdZY6ZMKy/DzYS08LV
 zIEQ==
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
Cc: corbet@lwn.net, airlied@linux.ie, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rfontana@redhat.com, gregkh@linuxfoundation.org, joe@perches.com,
 linux-spdx@archiver.kernel.org, tglx@linutronix.de, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWF5YmUgb25lIG9mIHRoZSBub24tRFJNIG1haW50YWluZXJzIChBbmRyZXcsIFRob21hcyBvciBH
cmVnKSB3aG8gY2FyZXMgYSBiaXQKYWJvdXQgU1BEWCBjYW4gcGljayB0aGlzIHVwLiBJdCBvY2N1
cnMgdG8gbWUgbm9uZSBvZiBEUk0gbWFpbnRhaW5lcnMgY2FyZXMgYWJvdXQKdGhpcyBhcyB0aGVy
ZSBpcyBubyBmZWVkYmFjayBmcm9tIGFueSBvZiB0aGVtIGZvciBtb250aHMgc2luY2UgdjEuCgpP
biBUdWUsIDIwMTktMDctMDkgYXQgMTE6MTMgLTA0MDAsIFFpYW4gQ2FpIHdyb3RlOgo+IFRoZSBv
cGVuaW5nIGNvbW1lbnQgbWFyayAiLyoqIiBpcyByZXNlcnZlZCBmb3Iga2VybmVsLWRvYyBjb21t
ZW50cywgc28KPiBpdCB3aWxsIGdlbmVyYXRlIGEgd2FybmluZyB3aXRoICJtYWtlIFc9MSIuCj4g
Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYzoyOiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJz
dGFuZMKgwqAqIFxmaWxlCj4gZHJtX21lbW9yeS5jCj4gCj4gQWxzbywgc2lsZW5jZSBhIGNoZWNr
cGF0Y2ggd2FybmluZyBieSBhZGRpbmcgYSBsaWNlbnNlIGlkZW50Zml0ZXIgd2hlcmUKPiBpdCBp
bmRpY2F0ZXMgdGhlIE1JVCBsaWNlbnNlIGZ1cnRoZXIgZG93biBpbiB0aGUgc291cmNlIGZpbGUu
Cj4gCj4gV0FSTklORzogTWlzc2luZyBvciBtYWxmb3JtZWQgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXIgdGFnIGluIGxpbmUgMQo+IAo+IEZpeCBpdCBieSBhZGRpbmcgdGhlIE1JVCBTUERYIGlkZW50
aWZpZXIgd2l0aG91dCB0b3VjaGluZyB0aGUgYm9pbGVycGxhdGUKPiBsYW5ndWFnZS4KPiAKPiBT
dWdnZXN0ZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IFNpZ25l
ZC1vZmYtYnk6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3Pgo+IC0tLQo+IAo+IHYzOiBLZWVwIHRoZSBi
b2lsZXJwbGF0ZSBsYW5ndWFnZS4KPiB2MjogUmVtb3ZlIHRoZSByZWR1bmRhbnQgZGVzY3JpcHRp
b24gb2YgdGhlIGxpY2Vuc2UuCj4gCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIHwg
MyArKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbWVtb3J5LmMKPiBpbmRleCAxMzJmZWY4ZmYxYjYuLjY4MzA0MmM4ZWUyYyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tZW1vcnkuYwo+IEBAIC0xLDQgKzEsNSBAQAo+IC0vKioKPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAo+ICsvKgo+IMKgICogXGZpbGUgZHJtX21lbW9yeS5j
Cj4gwqAgKiBNZW1vcnkgbWFuYWdlbWVudCB3cmFwcGVycyBmb3IgRFJNCj4gwqAgKgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
