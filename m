Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E867855C33
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 01:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2375F6E0C8;
	Tue, 25 Jun 2019 23:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A0A6E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 23:22:52 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id t16so195473pfe.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fn8uhj8tc3U3pScoaEkKu7HBQ+Qs1BqmjB6lHJFC6hE=;
 b=JqDjBshyU8BVpjhneqEdQsFaTpDEFaqgbvfMr6QPQC6OtT6T3SXRffoAc3Hwlj4quG
 vZ5mg/NUCg+gRUX579hfDMBTb4mxHi3t9L82/WjaDi7t25DO11/J1qAMCMZm43dJBr4K
 69RG4dYGCzejz1y409qf58Gva9Kqt/uS9IkYsrH5jCAleHT1Cn6rmAd7Gt3DSety6nMP
 4sFCQ7RBAKChfSgDAqdL5xITAxNEYk+3tAj9+F+a1w7qMWrWTfcqJ6MdM98/Zd7pZmpd
 l9whUqSmX+6A7e8z4uG86sG4Ny+OpAsKW0MYvo6DAb0jRg0LRTDrBJuji/8g/V5NDaPd
 hM0A==
X-Gm-Message-State: APjAAAWT9EaG/EipozCHKvw3N94jVL5lrtCxvlR4GHOkjMgvkBAUZbzM
 QR6xanl6JxbGldysrU1bJtw=
X-Google-Smtp-Source: APXvYqw6Otr6YJTjtY/OOBjSfZ7I1hNT7sLUZRcJRcDWNwR1ZNzZuSus00kEpYiN835NFFYZuHxFdA==
X-Received: by 2002:a63:8f09:: with SMTP id n9mr40832306pgd.249.1561504971968; 
 Tue, 25 Jun 2019 16:22:51 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id 5sm15215827pfh.109.2019.06.25.16.22.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 16:22:50 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id D058A401EB; Tue, 25 Jun 2019 23:22:49 +0000 (UTC)
Date: Tue, 25 Jun 2019 23:22:49 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 07/18] kunit: test: add initial tests
Message-ID: <20190625232249.GS19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-8-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617082613.109131-8-brendanhiggins@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 jpoimboe@redhat.com, kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at,
 sboyd@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjY6MDJBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IGRpZmYgLS1naXQgYS9rdW5pdC9leGFtcGxlLXRlc3QuYyBiL2t1bml0L2V4YW1w
bGUtdGVzdC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5m
NDRiOGVjZTQ4OGJiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2t1bml0L2V4YW1wbGUtdGVzdC5j
Cgo8LS0gc25pcCAtLT4KCj4gKy8qCj4gKyAqIFRoaXMgZGVmaW5lcyBhIHN1aXRlIG9yIGdyb3Vw
aW5nIG9mIHRlc3RzLgo+ICsgKgo+ICsgKiBUZXN0IGNhc2VzIGFyZSBkZWZpbmVkIGFzIGJlbG9u
Z2luZyB0byB0aGUgc3VpdGUgYnkgYWRkaW5nIHRoZW0gdG8KPiArICogYGt1bml0X2Nhc2VzYC4K
PiArICoKPiArICogT2Z0ZW4gaXQgaXMgZGVzaXJhYmxlIHRvIHJ1biBzb21lIGZ1bmN0aW9uIHdo
aWNoIHdpbGwgc2V0IHVwIHRoaW5ncyB3aGljaAo+ICsgKiB3aWxsIGJlIHVzZWQgYnkgZXZlcnkg
dGVzdDsgdGhpcyBpcyBhY2NvbXBsaXNoZWQgd2l0aCBhbiBgaW5pdGAgZnVuY3Rpb24KPiArICog
d2hpY2ggcnVucyBiZWZvcmUgZWFjaCB0ZXN0IGNhc2UgaXMgaW52b2tlZC4gU2ltaWxhcmx5LCBh
biBgZXhpdGAgZnVuY3Rpb24KPiArICogbWF5IGJlIHNwZWNpZmllZCB3aGljaCBydW5zIGFmdGVy
IGV2ZXJ5IHRlc3QgY2FzZSBhbmQgY2FuIGJlIHVzZWQgdG8gZm9yCj4gKyAqIGNsZWFudXAuIEZv
ciBjbGFyaXR5LCBydW5uaW5nIHRlc3RzIGluIGEgdGVzdCBtb2R1bGUgd291bGQgYmVoYXZlIGFz
IGZvbGxvd3M6Cj4gKyAqCgpUbyBiZSBjbGVhciB0aGlzIGlzIG5vdCB0aGUga2VybmVsIG1vZHVs
ZSBpbml0LCBidXQgcmF0aGVyIHRoZSBrdW5pdAptb2R1bGUgaW5pdC4gSSB0aGluayB1c2luZyBr
bW9kdWxlIHdvdWxkIG1ha2UgdGhpcyBjbGVhcmVyIHRvIGEgcmVhZGVyLgoKPiArICogbW9kdWxl
LmluaXQodGVzdCk7Cj4gKyAqIG1vZHVsZS50ZXN0X2Nhc2VbMF0odGVzdCk7Cj4gKyAqIG1vZHVs
ZS5leGl0KHRlc3QpOwo+ICsgKiBtb2R1bGUuaW5pdCh0ZXN0KTsKPiArICogbW9kdWxlLnRlc3Rf
Y2FzZVsxXSh0ZXN0KTsKPiArICogbW9kdWxlLmV4aXQodGVzdCk7Cj4gKyAqIC4uLjsKPiArICov
CgogIEx1aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
