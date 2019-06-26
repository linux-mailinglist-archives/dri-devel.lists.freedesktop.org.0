Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB4755CB1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 02:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9506E185;
	Wed, 26 Jun 2019 00:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F646E185
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 00:01:53 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v9so217605pgr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8jiVaE2JFBMfd+G3WCzNTPAlyBMExhnepJubp+vEbhM=;
 b=NEVCIBRfBXT+1aW7w/gUy0XVdYJxsxwiNEB/GQgbGCpHUoKRI+zmdQrmUih6a5iKSe
 JhcTlZmotZfeHiN7dMw3zAilcjHooAPB2c8bnh40hdlFAAYHr9EUwTwgsPNh0GOhseMt
 fZomg6wXckYxvfl4NzJW79LJG56NEsWCsxEvPfD8XnjBbQx8cnjI2tTONlTYAIPMVc+K
 bA/T8VV2h3pO6HulMXgJCm7Gi1bnikcnJvIlZrFYjdykBG8YgpN2ph6DbwnMXeuCYDmH
 rpkltPmPQV4NMGC8nzs+EjB3uvqb1OVxYbZIhEK5oFptOA/IZZEBU3z625Bvxe42VZuo
 YQ6A==
X-Gm-Message-State: APjAAAVvtiP4GGuxl09azd338EnJp6cj6E+/eVwLQSxkvUSIXqD1SfBq
 /g3yQ4pghYX0ggc0uPq2zac=
X-Google-Smtp-Source: APXvYqzNTUiSwWdZ3UgJYHzcAJb5xsbwt8eGmi7SJjyzu5XA3lIGVxbDEngQABiwrdIPUAy8M4OQFg==
X-Received: by 2002:a63:d756:: with SMTP id w22mr33935466pgi.156.1561507312844; 
 Tue, 25 Jun 2019 17:01:52 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id z22sm14694045pgu.28.2019.06.25.17.01.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 17:01:51 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 0674940336; Wed, 26 Jun 2019 00:01:50 +0000 (UTC)
Date: Wed, 26 Jun 2019 00:01:50 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 13/18] kunit: tool: add Python wrappers for running
 KUnit tests
Message-ID: <20190626000150.GT19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-14-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617082613.109131-14-brendanhiggins@google.com>
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
 kieran.bingham@ideasonboard.com, Felix Guo <felixguoxiuping@gmail.com>,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, jpoimboe@redhat.com,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjY6MDhBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2Rh
dGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1hbGxfcGFzc2VkLmxvZwo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1jcmFz
aC5sb2cKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRh
L3Rlc3RfaXNfdGVzdF9wYXNzZWQtZmFpbHVyZS5sb2cKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRhL3Rlc3RfaXNfdGVzdF9wYXNzZWQtbm9fdGVzdHNf
cnVuLmxvZwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2Rh
dGEvdGVzdF9vdXRwdXRfaXNvbGF0ZWRfY29ycmVjdGx5LmxvZwo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9yZWFkX2Zyb21fZmlsZS5rY29u
ZmlnCgpXaHkgYXJlIHRoZXNlIGJlaW5nIGFkZGVkIHVwc3RyZWFtPyBUaGUgY29tbWl0IGxvZyBk
b2VzIG5vdCBleHBsYWluCnRoaXMuCgogIEx1aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
