Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C855AB9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 00:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A566E25B;
	Tue, 25 Jun 2019 22:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C09E6E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 22:13:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n2so109562pgp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 15:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8gzPjoJjuhl8UL7VUOkU3jqXACXyJKi+qh78CzG1deI=;
 b=lr5l73NuHh6QToL7Q0bualB7HCU47OwB4R7cNyYhljvIBIYVtt5PvFSPyyjg7UgqjL
 3TrX+P2eaFnOxT8Id7gdaW+jh1I8WkhkpSQq0GhovWBbA4KnmyIHET4dmK6OGYhvndMi
 AqDlGao3LQXDgYD92hku8hL0T95RiC5okd47lwGD3Un+ZgCe/+Z8ixcP0YGY0CHl/WjW
 /GMIbqy719wsPdi3xYYcmRQ4wsG5ykDJGH7h3X/nh4Q3ZFlvajSY1ozdo2r0H5ZRAeY/
 PvrBgWgcZnHXpcpTIot7gF6HrKXv/voFuB7pBDBpULYdEoL45/FPWbgt6EQ0OtGd2feq
 wG8Q==
X-Gm-Message-State: APjAAAVXaOO0QkGBnbLHskcQoCW1Knzrx2yOlu14pEIUYJ77+NHb/FP2
 HNM6/UJ+wiWRcgM8Yg15Cpo=
X-Google-Smtp-Source: APXvYqxWuXRncraTED2jeacoTPyN1fvtJGk3Zc52FbqH3XACtitgQolZjqrTP/UYKEopxq0KXI3bTw==
X-Received: by 2002:a63:480e:: with SMTP id v14mr1871131pga.182.1561500800857; 
 Tue, 25 Jun 2019 15:13:20 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id x3sm45355pja.7.2019.06.25.15.13.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 15:13:19 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id D102E401EB; Tue, 25 Jun 2019 22:13:18 +0000 (UTC)
Date: Tue, 25 Jun 2019 22:13:18 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 06/18] kbuild: enable building KUnit
Message-ID: <20190625221318.GO19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-7-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617082613.109131-7-brendanhiggins@google.com>
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjY6MDFBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IGRpZmYgLS1naXQgYS9LY29uZmlnIGIvS2NvbmZpZwo+IGluZGV4IDQ4YTgwYmVh
YjY4NTMuLjEwNDI4NTAxZWRiNzggMTAwNjQ0Cj4gLS0tIGEvS2NvbmZpZwo+ICsrKyBiL0tjb25m
aWcKPiBAQCAtMzAsMyArMzAsNSBAQCBzb3VyY2UgImNyeXB0by9LY29uZmlnIgo+ICBzb3VyY2Ug
ImxpYi9LY29uZmlnIgo+ICAKPiAgc291cmNlICJsaWIvS2NvbmZpZy5kZWJ1ZyIKPiArCj4gK3Nv
dXJjZSAia3VuaXQvS2NvbmZpZyIKClRoaXMgcGF0Y2ggd291bGQgYnJlYWsgY29tcGlsYXRpb24g
YXMga3VuaXQvS2NvbmZpZyBpcyBub3QgaW50cm9kdWNlZC4gVGhpcwp3b3VsZCB3b3VsZCBhbHNv
IGJyZWFrIGJpc2VjdGFiaWxpdHkgb24gdGhpcyBjb21taXQuIFRoaXMgY2hhbmdlIHNob3VsZApl
aXRoZXIgYmUgZm9sZGVkIGluIHRvIHRoZSBuZXh0IHBhdGNoLCBvciBqdXN0IGJlIGEgc2VwYXJh
dGUgcGF0Y2ggYWZ0ZXIKdGhlIG5leHQgb25lLgoKICBMdWlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
