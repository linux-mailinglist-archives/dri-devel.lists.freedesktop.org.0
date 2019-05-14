Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AA1C478
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 10:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0D9891E1;
	Tue, 14 May 2019 08:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EDD891E1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 08:12:30 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c5so149963pll.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 01:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NVJCQ/meS0Lsexv3IBx7F9d7yUIfFyO6avMbOIjFh4s=;
 b=S1M1fLK/d8iq04JWAxGDdg8/M3AoE619ZIBqk7eFCiqDY2HIlnpb7lqHikuyEJZFPL
 QhJFBScH881RXazBG8GFenIJ5jptRlIw+wAw+CdrHuDZqe9eLc7CLMzh8UlE80Nykcor
 E7RXX4niybEtGe3DIJdqkUCWZUtdKOr6VFI9jns/fTIzx5zsPrIYL0hsbNFMSmWTsZxm
 M5qD7NxC6WDX5wpYh1ZxmflNkugMT+0OPTpDWI5lFehhW2Q/3RfiBsSVT1+Qrc3bzhlq
 9eLjvUEv8XYLOfw7lR/AI9y5qECzEDpMPNaoRz1WLyEv7wv+tN4eFNXCTft36spL71c3
 tseg==
X-Gm-Message-State: APjAAAX83MYOAf+ptZAId3tIPl4W7l1Vq1Q1XYmCl092tBRIjjIoVTwn
 ccvGnT5V1raL7QUfOWbEZWyy4g==
X-Google-Smtp-Source: APXvYqxsZM0ICZqWX68w0XRe09cnfhLQe5GD234bzH2jX1Q7W6s2mg37aevN5UE3Oi+D1MLUU05rWw==
X-Received: by 2002:a17:902:e9:: with SMTP id a96mr9816444pla.37.1557821549846; 
 Tue, 14 May 2019 01:12:29 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id v1sm23451654pgb.85.2019.05.14.01.12.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 01:12:28 -0700 (PDT)
Date: Tue, 14 May 2019 01:12:23 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
Message-ID: <20190514081223.GA230665@google.com>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
 <20190514065643.GC2589@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514065643.GC2589@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NVJCQ/meS0Lsexv3IBx7F9d7yUIfFyO6avMbOIjFh4s=;
 b=Qf/S0L0GOg+nfU17642TqGkQqhXSonrx9ER/aBydfh/biW25VannRP2+rJFupFnjNQ
 6O3jNdfrZjij+GeMIqitmfstQ1mnbWWM05ksAzIPhV2I5nUim0wwLfODJnqnUNud35CU
 dbKTV24y+A9OvRbYlzMzJKLZHVKLHAMmsK1K7rVw6Co+mNGh5+PF42t5apYIhH35lC7k
 TgKcpWx2X2H+uW5hCymmqwV2gfLLNQvl8xN1+zUkXShWD4K7KWjS5GQDAMIh63fYGXm+
 ed3BAsVtwYpPvqJsF7boIU5AB93ewkgqizm7aT4FDCBxNcM20DD8HvqPNk6s6Afw8A0a
 krHg==
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
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org,
 kbuild test robot <lkp@intel.com>, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr,
 Josh Poimboeuf <jpoimboe@redhat.com>, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDg6NTY6NDNBTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTA6NDI6NDJQTSAtMDcwMCwgQnJlbmRh
biBIaWdnaW5zIHdyb3RlOgo+ID4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgc2Vl
biBvbiBHQ0MgNy4zOgo+ID4gICBrdW5pdC90ZXN0LXRlc3Qubzogd2FybmluZzogb2JqdG9vbDog
a3VuaXRfdGVzdF91bnN1Y2Nlc3NmdWxfdHJ5KCkgZmFsbHMgdGhyb3VnaCB0byBuZXh0IGZ1bmN0
aW9uIGt1bml0X3Rlc3RfY2F0Y2goKQo+ID4gCj4gCj4gV2hhdCBpcyB0aGF0IGZpbGUgYW5kIGZ1
bmN0aW9uOyBubyBrZXJuZWwgdHJlZSBuZWFyIG1lIHNlZW1zIHRvIGhhdmUKPiB0aGF0LgoKT2gs
IHNvcnJ5IGFib3V0IHRoYXQuIFRoZSBmdW5jdGlvbiBpcyBhZGRlZCBpbiB0aGUgZm9sbG93aW5n
IHBhdGNoLAoiW1BBVENIIHYzIDA5LzE4XSBrdW5pdDogdGVzdDogYWRkIHN1cHBvcnQgZm9yIHRl
c3QgYWJvcnQiWzFdLgoKTXkgYXBvbG9naWVzIGlmIHRoaXMgcGF0Y2ggaXMgc3VwcG9zZWQgdG8g
Y29tZSBhZnRlciBpdCBpbiBzZXF1ZW5jZSwgYnV0CkkgYXNzdW1lZCBpdCBzaG91bGQgY29tZSBi
ZWZvcmUgb3RoZXJ3aXNlIG9ianRvb2wgd291bGQgY29tcGxhaW4gYWJvdXQKdGhlIHN5bWJvbCB3
aGVuIGl0IGlzIGludHJvZHVjZWQuCgpUaGFua3MhCgpbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTkvNS8xNC80NApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
