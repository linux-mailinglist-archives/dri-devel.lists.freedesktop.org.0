Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9E55B3D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 00:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84116E266;
	Tue, 25 Jun 2019 22:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDF36E266
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 22:33:15 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v9so126409pgr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 15:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TnzcHfb/rGR5D/vErJu8w17aFeeUcfwDXLuZxpFdgZc=;
 b=lUpTl3Em9FTVVkNXqz/nXy5uWHWthrbp29/sHIz9j8PCZKToEawXZiWM3ubeJoKzdr
 EaWkE9o0pEYbLor0ww/DPU8OVgQmirWHkbzcs5DqPxNeZnWOsU2flK2RnOgpa+1p0u4x
 mNescoqTXFsE8TbBwksAUaSaMXozfaMFBbuVfMWk2uVDPkjSm4mw3KxWzaYAoVN8x0wA
 UZWwsZWxBjE9M6l2v4HJGahzgXIe+2qu/KPUx1zGJju2JUoqYCix46YNltToIqOueaMc
 /yXp4gmnvCTNL2s69eeYHFdUFHa1Bk3dQa3Qx+xvMT609srpzF6zkY7G+bZA+eJc4Bqv
 QsXw==
X-Gm-Message-State: APjAAAVNqGpF+JMrmd/GDRKR2LJGoTyPXzUxgKDC73+ub1OARJW4i9JR
 76v+PSeV5IuqThCunqieXOc=
X-Google-Smtp-Source: APXvYqz8tePzVjq6qydlXc6fHsQtBqVBfz39DV20JLDT6sqkzfdOgtSxbEsBu2vrr4nNjRf5f7IpUg==
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr267009pjz.140.1561501994728; 
 Tue, 25 Jun 2019 15:33:14 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id p67sm23643298pfg.124.2019.06.25.15.33.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 15:33:13 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id CD044401EB; Tue, 25 Jun 2019 22:33:12 +0000 (UTC)
Date: Tue, 25 Jun 2019 22:33:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
Message-ID: <20190625223312.GP19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617082613.109131-2-brendanhiggins@google.com>
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjU6NTZBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ICsvKioKPiArICogbW9kdWxlX3Rlc3QoKSAtIHVzZWQgdG8gcmVnaXN0ZXIgYSAm
c3RydWN0IGt1bml0X21vZHVsZSB3aXRoIEtVbml0Lgo+ICsgKiBAbW9kdWxlOiBhIHN0YXRpY2Fs
bHkgYWxsb2NhdGVkICZzdHJ1Y3Qga3VuaXRfbW9kdWxlLgo+ICsgKgo+ICsgKiBSZWdpc3RlcnMg
QG1vZHVsZSB3aXRoIHRoZSB0ZXN0IGZyYW1ld29yay4gU2VlICZzdHJ1Y3Qga3VuaXRfbW9kdWxl
IGZvciBtb3JlCj4gKyAqIGluZm9ybWF0aW9uLgo+ICsgKi8KPiArI2RlZmluZSBtb2R1bGVfdGVz
dChtb2R1bGUpIFwKPiArCQlzdGF0aWMgaW50IG1vZHVsZV9rdW5pdF9pbml0IyNtb2R1bGUodm9p
ZCkgXAo+ICsJCXsgXAo+ICsJCQlyZXR1cm4ga3VuaXRfcnVuX3Rlc3RzKCZtb2R1bGUpOyBcCj4g
KwkJfSBcCj4gKwkJbGF0ZV9pbml0Y2FsbChtb2R1bGVfa3VuaXRfaW5pdCMjbW9kdWxlKQoKQmVj
dWFzZSBsYXRlX2luaXRjYWxsKCkgaXMgdXNlZCwgaWYgdGhlc2UgbW9kdWxlcyBhcmUgYnVpbHQt
aW4sIHRoaXMKd291bGQgcHJlY2x1ZGUgdGhlIGFiaWxpdHkgdG8gdGVzdCB0aGluZ3MgcHJpb3Ig
dG8gdGhpcyBwYXJ0IG9mIHRoZQprZXJuZWwgdW5kZXIgVU1MIG9yIHdoYXRldmVyIGFyY2hpdGVj
dHVyZSBydW5zIHRoZSB0ZXN0cy4gU28sIHRoaXMKbGltaXRzIHRoZSBzY29wZSBvZiB0ZXN0aW5n
LiBTbWFsbCBkZXRhaWwgYnV0IHRoZSBzY29wZSB3aG91bGQgYmUKZG9jdW1lbnRlZC4KCj4gK3N0
YXRpYyB2b2lkIGt1bml0X3ByaW50X3RhcF92ZXJzaW9uKHZvaWQpCj4gK3sKPiArCWlmICgha3Vu
aXRfaGFzX3ByaW50ZWRfdGFwX3ZlcnNpb24pIHsKPiArCQlrdW5pdF9wcmludGtfZW1pdChMT0dM
RVZFTF9JTkZPLCAiVEFQIHZlcnNpb24gMTRcbiIpOwoKV2hhdCBpcyB0aGlzIFRBUCB0aGluZz8g
V2h5IHNob3VsZCB3ZSBjYXJlIHdoYXQgdmVyc2lvbiBpdCBpcyBvbj8KV2h5IGFyZSB3ZSBwcmlu
dGluZyB0aGlzPwoKPiArCQlrdW5pdF9oYXNfcHJpbnRlZF90YXBfdmVyc2lvbiA9IHRydWU7Cj4g
Kwl9Cj4gK30KPiArCj4gK3N0YXRpYyBzaXplX3Qga3VuaXRfdGVzdF9jYXNlc19sZW4oc3RydWN0
IGt1bml0X2Nhc2UgKnRlc3RfY2FzZXMpCj4gK3sKPiArCXN0cnVjdCBrdW5pdF9jYXNlICp0ZXN0
X2Nhc2U7Cj4gKwlzaXplX3QgbGVuID0gMDsKPiArCj4gKwlmb3IgKHRlc3RfY2FzZSA9IHRlc3Rf
Y2FzZXM7IHRlc3RfY2FzZS0+cnVuX2Nhc2U7IHRlc3RfY2FzZSsrKQoKSWYgd2UgbWFrZSB0aGUg
bGFzdCB0ZXN0IGNhc2UgTlVMTCwgd2UnZCBqdXN0IGNoZWNrIGZvciB0ZXN0X2Nhc2UgaGVyZSwK
YW5kIHNhdmUgb3Vyc2VsdmVzIGFuIGV4dHJhIGZldyBieXRlcyBwZXIgdGVzdCBtb2R1bGUuIEFu
eSByZWFzb24gd2h5CnRoZSBsYXN0IHRlc3QgY2FzZSBjYW5ub3QgYmUgTlVMTD8KCj4gK3ZvaWQg
a3VuaXRfaW5pdF90ZXN0KHN0cnVjdCBrdW5pdCAqdGVzdCwgY29uc3QgY2hhciAqbmFtZSkKPiAr
ewo+ICsJc3Bpbl9sb2NrX2luaXQoJnRlc3QtPmxvY2spOwo+ICsJdGVzdC0+bmFtZSA9IG5hbWU7
Cj4gKwl0ZXN0LT5zdWNjZXNzID0gdHJ1ZTsKPiArfQo+ICsKPiArLyoKPiArICogUGVyZm9ybXMg
YWxsIGxvZ2ljIHRvIHJ1biBhIHRlc3QgY2FzZS4KPiArICovCj4gK3N0YXRpYyB2b2lkIGt1bml0
X3J1bl9jYXNlKHN0cnVjdCBrdW5pdF9tb2R1bGUgKm1vZHVsZSwKPiArCQkJICAgc3RydWN0IGt1
bml0X2Nhc2UgKnRlc3RfY2FzZSkKPiArewo+ICsJc3RydWN0IGt1bml0IHRlc3Q7Cj4gKwlpbnQg
cmV0ID0gMDsKPiArCj4gKwlrdW5pdF9pbml0X3Rlc3QoJnRlc3QsIHRlc3RfY2FzZS0+bmFtZSk7
Cj4gKwo+ICsJaWYgKG1vZHVsZS0+aW5pdCkgewo+ICsJCXJldCA9IG1vZHVsZS0+aW5pdCgmdGVz
dCk7CgpJIGJlbGlldmUgaWYgd2UgdXNlZCBzdHJ1Y3Qga3VuaXRfbW9kdWxlICprbW9kdWxlIGl0
IHdvdWxkIGJlIG11Y2gKY2xlYXJlciB3aG8ncyBpbml0IHRoaXMgaXMuCgogIEx1aXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
