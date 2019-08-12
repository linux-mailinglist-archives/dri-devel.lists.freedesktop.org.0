Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8278AB33
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 01:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FE86E030;
	Mon, 12 Aug 2019 23:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DBD6E030
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:33:43 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 129so3575426pfa.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 16:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LTfhhIMEVWBJ1fQ8dSU/yBqkpCSWczjteIKFZOpbLX8=;
 b=Dp3fQSzS/MgDhg2OYMgriAboxm3wm9/OSoXOceZ+sU3S173LJDkGtRj8sAj0Gv4Xhn
 bcYWErcZWurirx3D3vKs8JAiTeOJ7ECnoqxWpabiT7IIaV8h8RUjslYrxVzeZKxQ1RfU
 eksoAy3e2ZetNNaQVzOIBRUr5pToWMoYDZ90mP4aEx1fDGoSIDTgoQhNDbtOgVsFTwKz
 gJ+KQ4gbGEWgydqXeMLMLW/5/Powwfz8ITHe0Aji83vc5XF4AJ4BGJ6Kc+3v5b1PHdjL
 ygnoDsq3QdEA0B8YpWDS0dwDL4gTeCX0dKVzLcXjGWH5eHMZS7qt4nppvpoS+LD5mE5q
 AArQ==
X-Gm-Message-State: APjAAAUhbwAlUrH1ydPunPGi2htg0zdOVXVMzwl1A97Eu8D1HFP4g14h
 hfEMcjz6N0ZjoMC/kl1A663qyQ==
X-Google-Smtp-Source: APXvYqxcDoap4N3EkfxGt7+4TrFgEHcuwub7I5n6cGzvsvHggQpTuDBEDm80K9tY5UT8aKNLpSv+9A==
X-Received: by 2002:a63:2a08:: with SMTP id q8mr31927403pgq.415.1565652822096; 
 Mon, 12 Aug 2019 16:33:42 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id j187sm13658683pfg.178.2019.08.12.16.33.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 16:33:41 -0700 (PDT)
Date: Mon, 12 Aug 2019 16:33:36 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
Message-ID: <20190812233336.GA224410@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812225520.5A67C206A2@mail.kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LTfhhIMEVWBJ1fQ8dSU/yBqkpCSWczjteIKFZOpbLX8=;
 b=c9dOYm8jUrYmRfI5dEYJE2Wdnda5vlKFp8TRu/bv1paeS5Nb3I93x9HcYZ5ednOIno
 wGUiE4FUkpp0oe3pnvKv6pG5E0pSyHTSelc+rec86VL0eKpaX1nLvJb20gWSbR51tasf
 pgzzqgph/ELjX9q8SLyXYbEtVD5OMe2Bv9/Yd1k25uiMzejzz4xG8apO6djfJpMz8vcn
 XxJ7D8O/Gc8sfv/yWGdO+KIi2sqttmFcaUq9dKaYH8/xsyQWTJSFN1Jmxc4txyx4aB+z
 WGBS3gigW8iS9W0dFVg6j9MrUrNTENxkLxw6lLoD3AWXnMP8qmgG1uCcjQTNKLdPM7ys
 zaWQ==
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
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDM6NTU6MTlQTSAtMDcwMCwgU3RlcGhlbiBCb3lkIHdy
b3RlOgo+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEyIDExOjI0OjA2KQo+ID4g
K3ZvaWQgc3RyaW5nX3N0cmVhbV9jbGVhcihzdHJ1Y3Qgc3RyaW5nX3N0cmVhbSAqc3RyZWFtKQo+
ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IHN0cmluZ19zdHJlYW1fZnJhZ21lbnQgKmZyYWdfY29u
dGFpbmVyLCAqZnJhZ19jb250YWluZXJfc2FmZTsKPiA+ICsKPiA+ICsgICAgICAgc3Bpbl9sb2Nr
KCZzdHJlYW0tPmxvY2spOwo+ID4gKyAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZnJh
Z19jb250YWluZXIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmFnX2Nv
bnRhaW5lcl9zYWZlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnN0cmVh
bS0+ZnJhZ21lbnRzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm9kZSkg
ewo+ID4gKyAgICAgICAgICAgICAgIGxpc3RfZGVsKCZmcmFnX2NvbnRhaW5lci0+bm9kZSk7Cj4g
Cj4gU2hvdWxkbid0IHdlIGZyZWUgdGhlIGFsbG9jYXRpb24gaGVyZT8gT3RoZXJ3aXNlLCBpZiBz
b21lIHRlc3QgaXMgZ29pbmcKPiB0byBhZGQsIGFkZCwgY2xlYXIsIGFkZCwgaXQncyBnb2luZyB0
byBsZWFrIHVudGlsIHRoZSB0ZXN0IGlzIG92ZXI/CgpTbyBiYXNpY2FsbHkgdGhpcyBtZWFucyBJ
IHNob3VsZCBhZGQgYSBrdW5pdF9rZnJlZSBhbmQKa3VuaXRfcmVzb3VyY2VfZGVzdHJveSAocmVz
cGVjdGl2ZSBlcXVpdmFsZW50cyB0byBkZXZtX2tmcmVlLCBhbmQKZGV2cmVzX2Rlc3Ryb3kpIGFu
ZCB1c2Uga3VuaXRfa2ZyZWUgaGVyZT8KCj4gPiArICAgICAgIH0KPiA+ICsgICAgICAgc3RyZWFt
LT5sZW5ndGggPSAwOwo+ID4gKyAgICAgICBzcGluX3VubG9jaygmc3RyZWFtLT5sb2NrKTsKPiA+
ICt9Cj4gPiArCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
