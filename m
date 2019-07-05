Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FD60C44
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 22:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EBE6E530;
	Fri,  5 Jul 2019 20:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185526E530
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 20:20:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t132so4729597pgb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 13:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=25Gxg4cOnHkRGBzoLvP39q6ZGr7xTfO8zZqC3Dmp4ao=;
 b=uYXN2sDrOJeWKPzbXoV6T1xWK6vveDUhWrY4MRYCpYaFF+u0ht6C22gA8eFzb9KxNc
 CdDtB7EQd/3JtRi3+h0p0NedMP5Q8rZFSR0FJUeM1mMLhxmZQmOU2ZztuL27RW8ZdMx7
 wjEhOVLErl7ZJit3XEAKK8lssYZhYbriXJqd31l1S0S9IrDwEdeR+A3puqo1tbuAkGoj
 vhCsRhIjuT/GuGy3S9Gm1r5ltKGQF3PMjzBpX9bqW9iprv6Spg7GXPy0BKIacFczbZaI
 UksOp/seQ7O+ydA/rwqosr9RqCd6ToU6EvEFMGVkXwF8opnlPzEhFRIFZVI5fBkf6Xwl
 KQ2g==
X-Gm-Message-State: APjAAAVYMPK/vpZeJix4Q+2z5Tw1CcLIcxYzhPWtHfSOPRgMu6CEbCOD
 8IY8New37uxl6Q+UHFHl058=
X-Google-Smtp-Source: APXvYqzDgP2UvvEnLjwLbSAV5+PRQhqdSDKK5VAZmMuJMa1jdDqx9hxhnLoRC5+cLLJisPXah8LMOQ==
X-Received: by 2002:a63:e506:: with SMTP id r6mr7427654pgh.324.1562358053447; 
 Fri, 05 Jul 2019 13:20:53 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id r188sm18308824pfr.16.2019.07.05.13.20.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 13:20:52 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id A47FE40190; Fri,  5 Jul 2019 20:20:51 +0000 (UTC)
Date: Fri, 5 Jul 2019 20:20:51 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v6 01/18] kunit: test: add KUnit test runner core
Message-ID: <20190705202051.GB19023@42.do-not-panic.com>
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704003615.204860-2-brendanhiggins@google.com>
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

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MzU6NThQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ICtzdHJ1Y3Qga3VuaXQgewo+ICsJdm9pZCAqcHJpdjsKPiArCj4gKwkvKiBwcml2
YXRlOiBpbnRlcm5hbCB1c2Ugb25seS4gKi8KPiArCWNvbnN0IGNoYXIgKm5hbWU7IC8qIFJlYWQg
b25seSBhZnRlciBpbml0aWFsaXphdGlvbiEgKi8KPiArCWJvb2wgc3VjY2VzczsgLyogUmVhZCBv
bmx5IGFmdGVyIHRlc3RfY2FzZSBmaW5pc2hlcyEgKi8KPiArfTsKCk5vIGxvY2sgYXR0cmlidXRl
IGFib3ZlLgoKPiArdm9pZCBrdW5pdF9pbml0X3Rlc3Qoc3RydWN0IGt1bml0ICp0ZXN0LCBjb25z
dCBjaGFyICpuYW1lKQo+ICt7Cj4gKwlzcGluX2xvY2tfaW5pdCgmdGVzdC0+bG9jayk7Cj4gKwl0
ZXN0LT5uYW1lID0gbmFtZTsKPiArCXRlc3QtPnN1Y2Nlc3MgPSB0cnVlOwo+ICt9CgpBbmQgeWV0
IGhlcmUgeW91IGluaXRpYWxpemUgYSBzcGluIGxvY2suLi4gVGhpcyB3b24ndCBjb21waWxlLiBT
ZWVtcwp5b3UgZm9yZ290IHRvIHJlbW92ZSB0aGlzIGxpbmUuIFNvIEkgZ3Vlc3MgYSByZS1zcGlu
IGlzIGJldHRlci4KCiAgTHVpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
