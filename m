Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7B55BDD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 01:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DB56E0AF;
	Tue, 25 Jun 2019 23:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BEC6E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 23:02:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z19so160244pgl.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IAVXlfOigyJbEa5HhE6BwBcpEncScOxFXJXYNv1k45k=;
 b=Z0ZTjgdkziDnOEDBAWk7jpPqCspGfaZZnuaR4/StjG/RG31RboLelK5VnwHHtw7V/P
 QuNg1olPe428NEnY/kxgnLNJlc47rckriiP0D4HjzcCxaiQjynF5A1jUXN6DSZ0nWuon
 vX0Uk3yI+ZmOy9YpQT+bLTSQIidZKiHKBMiho6s2MNJRtTZx61ZHnXe+DBfFPNzvP6nT
 j21qknZSTSpXxcFBCncDulrjDKf9sKSCnuxnHu7MypI78XS4qkE55qbIsvhf3yrGizCr
 SyAgYYDOrnqQYBZkIak11dXbit+AlTaplLCtdRDuW7ma3YS9X8736onrt3Mtg/atLjYj
 jBIg==
X-Gm-Message-State: APjAAAWSiYracpQH7RvsAy0rF4CbhuSGM2XDTRle0ZmYr2lBBmlAGSyU
 eHS38Je+Pa8DNFe7Kmgq12k=
X-Google-Smtp-Source: APXvYqzZBw/dqZhBTNHNMDfHye5/2eZRaAS1PSupftYRQhWIaCqeSFUapN9xTbqyZVwDxqRVbGqHHQ==
X-Received: by 2002:a17:90a:ac13:: with SMTP id
 o19mr354796pjq.143.1561503775428; 
 Tue, 25 Jun 2019 16:02:55 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id r1sm92074pji.15.2019.06.25.16.02.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 16:02:54 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 64827401EB; Tue, 25 Jun 2019 23:02:53 +0000 (UTC)
Date: Tue, 25 Jun 2019 23:02:53 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
Message-ID: <20190625230253.GQ19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190620001526.93426218BE@mail.kernel.org>
 <CAFd5g46Jhxsz6_VXHEVYvTeDRwwzgKpr=aUWLL5b3S4kUukb8g@mail.gmail.com>
 <20190625214427.GN19023@42.do-not-panic.com>
 <CAFd5g47OABqN127cPKqoCOA_Wr9w=LFh_0XkF7LXu2iY9sFkSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g47OABqN127cPKqoCOA_Wr9w=LFh_0XkF7LXu2iY9sFkSw@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@google.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDM6MTQ6NDVQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDI6NDQgUE0gTHVpcyBDaGFtYmVybGFp
biA8bWNncm9mQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gU2luY2UgaXRzIGEgbmV3IGFyY2hpdGVj
dHVyZSBhbmQgc2luY2UgeW91IHNlZW0gdG8gaW1wbHkgbW9zdCB0ZXN0cwo+ID4gZG9uJ3QgcmVx
dWlyZSBsb2NraW5nIG9yIGV2ZW4gSVJRcyBkaXNhYmxlZCwgSSB0aGluayBpdHMgd29ydGggdG8K
PiA+IGNvbnNpZGVyIHRoZSBpbXBhY3Qgb2YgYWRkaW5nIHN1Y2ggZXh0cmVtZSBsb2NraW5nIHJl
cXVpcmVtZW50cyBmb3IKPiA+IGFuIGluaXRpYWwgcmFtcCB1cC4KPiAKPiBGYWlyIGVub3VnaCwg
SSBjYW4gc2VlIHRoZSBwb2ludCBvZiBub3Qgd2FudGluZyB0byB1c2UgaXJxIGRpc2FibGVkCj4g
dW50aWwgd2UgZ2V0IHNvbWVvbmUgY29tcGxhaW5pbmcgYWJvdXQgaXQsIGJ1dCBJIHRoaW5rIG1h
a2luZyBpdAo+IHRocmVhZCBzYWZlIGlzIHJlYXNvbmFibGUuIEl0IG1lYW5zIHRoZXJlIGlzIG9u
ZSBsZXNzIHRoaW5nIHRvIGNvbmZ1c2UKPiBhIEtVbml0IHVzZXIgYW5kIHRoZSBvbmx5IHBlbmFs
dHkgcGFpZCBpcyBzb21lIHZlcnkgbWlub3IgcGVyZm9ybWFuY2UuCgpPbmUgcmVhc29uIEknbSBy
ZWFsbHkgZXhjaXRlZCBhYm91dCBrdW5pdCBpcyBzcGVlZC4uLiBzbyBieSBhbGwgbWVhbnMgSQp0
aGluayB3ZSdyZSBhdCBhIGdvb2QgcG9pbnQgdG8gYW5hbHl6ZSBwZXJmb3JtYW5jZSBvcHRpbWl6
YXRpb25zbSBpZgp0aGV5IGRvIG1ha2Ugc2Vuc2UuCgpXaGlsZSBvbiB0aGUgdG9waWMgb2YgcGFy
YWxsaXphdGlvbiwgd2hhdCBhYm91dCBzdXBwb3J0IGZvciBydW5uaW5nCmRpZmZlcmVudCB0ZXN0
IGNhc2VzIGluIHBhcmFsbGVsPyBPciBhdCB0aGUgdmVyeSBsZWFzdCBkaWZmZXJlbnQga3VuaXQK
bW9kdWxlcyBpbiBwYXJhbGxlbC4gIEZldyBxdWVzdGlvbnMgY29tZSB1cCBiYXNlZCBvbiB0aGlz
IHByb3NwZWN0OgoKICAqIFdoeSBub3Qgc3VwcG9ydCBwYXJhbGxlbGlzbSBmcm9tIHRoZSBzdGFy
dD8KICAqIEFyZSB5b3Ugb3Bwb3NlZCB0byBldmVudHVhbGx5IGhhdmluZyB0aGlzIGFkZGVkPyBG
b3IgaW5zdGFuY2UsIHRoZXJlIGlzCiAgICBlbm91Z2ggY29kZSBvbiBsaWIvdGVzdF9rbW9kLmMg
Zm9yIGJhdGNoaW5nIHRvbnMgb2Yga3RocmVhZHMgZWFjaAogICAgb25lIHJ1bm5pbmcgaXRzIG93
biB0aGluZyBmb3IgdGVzdGluZyBwdXJwb3NlcyB3aGljaCBjb3VsZCBiZSB1c2VkCiAgICBhcyB0
ZW1wbGF0ZS4KICAqIElmIHdlIGV2ZW50dWFsbHkgKmRpZCogc3VwcG9ydCBpdDoKICAgIC0gV291
bGQgbG9ncyBiZSBza2V3ZWQ/CiAgICAtIENvdWxkIHdlIGhhdmUgYSB3YXkgdG8gcXVlcnk6IGdp
dmUgbWUgbG9nIGZvciBvbmx5IGt1bml0IG1vZHVsZQogICAgICBuYW1lZCAiZm9vIj8KCiAgTHVp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
