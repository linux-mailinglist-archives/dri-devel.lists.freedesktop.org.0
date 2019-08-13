Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB738ADE0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC75B6E623;
	Tue, 13 Aug 2019 04:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EFB6E623
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:38:59 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 661F82054F;
 Tue, 13 Aug 2019 04:38:59 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-15-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-15-brendanhiggins@google.com>
Subject: Re: [PATCH v12 14/18] kunit: defconfig: add defconfigs for building
 KUnit tests
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 21:38:58 -0700
Message-Id: <20190813043859.661F82054F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565671139;
 bh=3xMxQdsEpxtjj+1yTxgV9WOlUO2WQ552exvs56/rr1o=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LR11it/I3O8CGTrv+Ng5zvucPa8uUkEfa3LmKFjw6O5u9qhsOj4v0EPjTnoOYONrH
 u/tnKqLjb2VOMamzmBD+bQ92PSyu/l9yjopx4tVHE3QOH9DwxrVN/Ixn8t2s8dlBob
 UQtw5MZJLoTm4I6qlCWqOvb7Iah3ocYPA4XTG7DY=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MTcpCj4gZGlmZiAtLWdp
dCBhL2FyY2gvdW0vY29uZmlncy9rdW5pdF9kZWZjb25maWcgYi9hcmNoL3VtL2NvbmZpZ3Mva3Vu
aXRfZGVmY29uZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAw
Li5iZmU0OTY4OTAzOGYxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvdW0vY29uZmlncy9r
dW5pdF9kZWZjb25maWcKPiBAQCAtMCwwICsxLDggQEAKPiArQ09ORklHX09GPXkKPiArQ09ORklH
X09GX1VOSVRURVNUPXkKPiArQ09ORklHX09GX09WRVJMQVk9eQo+ICtDT05GSUdfSTJDPXkKPiAr
Q09ORklHX0kyQ19NVVg9eQo+ICtDT05GSUdfS1VOSVQ9eQo+ICtDT05GSUdfS1VOSVRfVEVTVD15
Cj4gK0NPTkZJR19LVU5JVF9FWEFNUExFX1RFU1Q9eQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL2t1bml0L2NvbmZpZ3MvYWxsX3Rlc3RzLmNvbmZpZyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQv
Y29uZmlncy9hbGxfdGVzdHMuY29uZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAwLi5iZmU0OTY4OTAzOGYxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcva3VuaXQvY29uZmlncy9hbGxfdGVzdHMuY29uZmlnCj4gQEAgLTAsMCArMSw4IEBA
Cj4gK0NPTkZJR19PRj15Cj4gK0NPTkZJR19PRl9VTklUVEVTVD15Cj4gK0NPTkZJR19PRl9PVkVS
TEFZPXkKPiArQ09ORklHX0kyQz15Cj4gK0NPTkZJR19JMkNfTVVYPXkKCkFyZSB0aGVzZSBhYm92
ZSBjb25maWcgb3B0aW9ucyBuZWNlc3Nhcnk/IEkgZG9uJ3QgdGhpbmsgdGhleSdyZSBwYXJ0IG9m
CnRoZSBwYXRjaCBzZXJpZXMgYW55bW9yZSBzbyBpdCBsb29rcyBvZGQgdG8gZW5hYmxlIHRoZSBP
RiB1bml0dGVzdHMgYW5kCmkyYyBjb25maWdzLgoKPiArQ09ORklHX0tVTklUPXkKPiArQ09ORklH
X0tVTklUX1RFU1Q9eQo+ICtDT05GSUdfS1VOSVRfRVhBTVBMRV9URVNUPXkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
