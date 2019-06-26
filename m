Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDBA55F0F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 04:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B84B6E204;
	Wed, 26 Jun 2019 02:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6521D6E204
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 02:38:12 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bh12so527938plb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 19:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xyvmsuEmijKSbxFAnA4vq/E+5XBo5Wy44kba2nyP6go=;
 b=EQd6/nQAgXpeTDA3B6cfUlP9sQ7P7I6yAAs/aAHm6iYlkbgEzZa+vk12nDAyyzpy1v
 lwyfjAhd6I6wF+niIvdXpbB8UbmdaCl6aGMEvhDhivcqG+z758W1TJTTzLVpGZhiyUJ6
 9/VYw+cXfm0yTrt+wewJt28GOeYXtgZPa1EtvQVXUF0tMQ92YAYLsDT1vezkJPcfNx8Z
 OHfxMzVBxo7cQJ+qrU6bBJgOtQHdajhih+fulGMpogoe7CTfaytfEULR2H4gOHkvzSVG
 ZeDQa6aL8lCwHXu/a1YM3t7isLZCSLwnw38przFoRwnOvOEyp51mDENhNZAy7O7DdWqy
 pOqg==
X-Gm-Message-State: APjAAAWoEf87/4M/fX1fH+nCKkpf59Bu4/lySQ80BKFDjWxDM72sWoyG
 +tPO33NRma1/u5fWXviRRhg=
X-Google-Smtp-Source: APXvYqzDq44Q6ELr7lMNQzzU3Ay+P/NMrvUlNETj0hOmt7FHk+liK3UY9V/aPmtCKjArXN7tpqRtdw==
X-Received: by 2002:a17:902:e512:: with SMTP id
 ck18mr2107905plb.53.1561516691699; 
 Tue, 25 Jun 2019 19:38:11 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id a16sm20081945pfd.68.2019.06.25.19.38.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 19:38:10 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id BC94340336; Wed, 26 Jun 2019 02:38:09 +0000 (UTC)
Date: Wed, 26 Jun 2019 02:38:09 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v5 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190626023809.GW19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <10feac3e-7621-65e5-fbf0-9c63fcbe09c9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10feac3e-7621-65e5-fbf0-9c63fcbe09c9@gmail.com>
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
 amir73il@gmail.com, Brendan Higgins <brendanhiggins@google.com>,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, jpoimboe@redhat.com,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDY6MTc6NTFQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IEl0IGRvZXMgbm90IG1hdHRlciB3aGV0aGVyIEtVbml0IHByb3ZpZGVzIGFkZGl0aW9u
YWwgdGhpbmdzLCByZWxhdGl2ZQo+IHRvIGtzZWxmdGVzdC4gIFRoZSBwb2ludCBJIHdhcyBtYWtp
bmcgaXMgdGhhdCB0aGVyZSBhcHBlYXJzIHRvIGJlCj4gX3NvbWVfIG92ZXJsYXAgYmV0d2VlbiBr
c2VsZnRlc3QgYW5kIEtVbml0LCBhbmQgaWYgdGhlcmUgaXMgb3ZlcmxhcAo+IHRoZW4gaXQgaXMg
d29ydGggY29uc2lkZXJpbmcgd2hldGhlciB0aGUgb3ZlcmxhcCBjYW4gYmUgdW5pZmllZCBpbnN0
ZWFkCj4gb2YgZHVwbGljYXRlZC4KCkZyb20gbXkgZXhwZXJpZW5jZSBhcyBhbiBhdXRob3Igb2Yg
c2V2ZXJhbCBrc2VsZnRlc3RzIGRyaXZlcnMsIG9uZQpmYWlseSBjb21wbGV4LCBhbmQgYWZ0ZXIg
cmV2aWV3aW5nIHRoZSBzeXNjdGwga3VuaXQgdGVzdCBtb2R1bGUsIEkKZGlzYWdyZWUgd2l0aCB0
aGlzLgoKRXZlbiBpZiB0aGVyZSB3ZXJlIGFuIG92ZXJsYXAsIEknZCBzYXkgbGV0IHRoZSBiZXN0
IHRlc3QgaGFybmVzcyB3aW4uCkp1c3QgYXMgd2UgaGF2ZSBkaWZmZXJlbnQgTFNNcyB0aGF0IGRv
IHNvbWV0aGluZyBzaW1pbGFyLgoKQnV0IHRoaXMgaXMgbm90IGFib3V0IHRoYXQgdGhvdWdoLiBB
bHRob3VnaCBib3RoIGFyZSB0ZXN0aW5nIGNvZGUsCnRoZXkgZG8gc28gaW4gKnZlcnkqIGRpZmZl
cmVudCB3YXlzLgoKVGhlIGRlc2lnbiBwaGlsb3NvcGh5IGFuZCBhcmNoaXRlY3R1cmUgYXJlIGZ1
bmRhbWVudGFsbHkgZGlmZmVyZW50LiBUaGUKKm9ubHkqIHRoaW5nIEkgY2FuIHRoaW5rIG9mIHdo
ZXJlIHRoZXJlIGlzIG92ZXJsYXAgaXMgdGhhdCBib3RoIGNhbiB0ZXN0CnNpbWlsYXIgY29kZSBw
YXRocy4gQmV5b25kIHRoYXQsIHRoZSBsYXlvdXQgb2YgaG93IG9uZSBpdGVtaXplcyB0ZXN0cwpj
b3VsZCBiZSBib3Jyb3dlZCwgYnV0IHRoYXQgd291bGQgYmUgdXAgdG8gZWFjaCBrc2VsZnRlc3Qg
YXV0aG9yIHRvCmRlY2lkZSwgaW4gZmFjdCBzb21lIGtzZWZsdGVzdHMgZG8gZXhpc3Qgd2hpY2gg
Zm9sbG93IHNpbWlsYXIgcGF0dGVybiBvZgppdGVtaXppbmcgdGVzdCBjYXNlcyBhbmQgcnVubmlu
ZyB0aGVtLiBLdW5pdCBqdXN0IHByb3ZpZGVzIGEgcHJvcGVyCmZyYW1ld29yayB0byBkbyB0aGlz
IGVhc2lseSBidXQgYWxzbyB3aXRoIGEgZm9jdXMgb24gVU1MLiBUaGlzIGxhc3QKYXNwZWN0IG1h
a2VzIGtzZWxmdGVzdHMgZnVuZGFtZW50YWxseSBvcnRob2dvbmFsIGZyb20gYW4gYXJjaGl0ZWN0
dXJlIC8KZGVzaWduIHBlcnNwZWN0aXZlLgoKQWZ0ZXIgY2FyZWZ1bCByZXZpZXcsIEkgY2Fubm90
IHBlcnNvbmFsbHkgaWRlbnRpZnkgd2hhdCBjb3VsZCBiZSBzaGFyZWQKYXQgdGhpcyBwb2ludC4g
Q2FuIHlvdT8gSWYgeW91IGRpZCBpZGVudGlmeSBvbmUgcGFydCwgaG93IGRvIHlvdQpyZWNvbW1l
bmQgdG8gc2hhcmUgaXQ/CgogIEx1aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
