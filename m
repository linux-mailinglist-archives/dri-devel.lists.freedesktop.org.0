Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B660CBC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 22:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A007B6E55A;
	Fri,  5 Jul 2019 20:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BFB6E55A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 20:48:12 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u14so3577047pfn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 13:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AcnoVRibB2N6fZ+Yp6hO160ET8GdPKrkYOq4kfDG3/o=;
 b=uQzVlzRrs7T7WaunIknUo0uPMbusrprHBwJngui9RkoVJjQxlUYciwkBjMfs7U7fkn
 xZAgFFMGH+BTEGHplxcxI+opRhZbAFNf9DqCHfWn5yUjCbbSl30BUV74bvw9TQSBXwzv
 NGjJVSrBJl7b05va8OTeAEGFKb01WcnezzSBOiorw7b7FEkw9PQ6/AUvgNYAnrL1W5SQ
 6A0ea4sTf4+ZxmWsGVQdDp74UpojnUsTEvnjq4562iiEeBAh1dv7JZ0OscGaJjG7sQs/
 wpocpyt6qUDOlc8I0Dwq8IKcyo0t7a4EHEA5J01LLbg4qYtwiua2PY+AAvUiQs8bt6dC
 B7hw==
X-Gm-Message-State: APjAAAVWimoAtWD8DmnEd0ib3YCjCWd/Fnqmedm3ms3dwC6sk5CsuCBG
 EDO1G+zWvcymGSe4WnW8wiM=
X-Google-Smtp-Source: APXvYqzYFkN68Owkq9koxWESGSYcLlSN0sO/MqwSKxCi7MUUXmOztl1dSndkrgfsbD0HEg9i6sStdg==
X-Received: by 2002:a63:6986:: with SMTP id e128mr7831367pgc.220.1562359692276; 
 Fri, 05 Jul 2019 13:48:12 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id p7sm13219309pfp.131.2019.07.05.13.48.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 13:48:11 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 568B940190; Fri,  5 Jul 2019 20:48:10 +0000 (UTC)
Date: Fri, 5 Jul 2019 20:48:10 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v6 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
Message-ID: <20190705204810.GE19023@42.do-not-panic.com>
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-19-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704003615.204860-19-brendanhiggins@google.com>
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

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MzY6MTVQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEFkZCBlbnRyeSBmb3IgdGhlIG5ldyBwcm9jIHN5c2N0bCBLVW5pdCB0ZXN0IHRv
IHRoZSBQUk9DIFNZU0NUTCBzZWN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGln
Z2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogTG9n
YW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+IEFja2VkLWJ5OiBMdWlzIENoYW1i
ZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KCkNvbWUgdG8gdGhpbmsgb2YgaXQsIEknZCB3ZWxj
b21lIEl1cmlpIHRvIGJlIGFkZGVkIGFzIGEgbWFpbnRhaW5lciwKd2l0aCB0aGUgaG9wZSBJdXJp
aSB3b3VsZCBiZSB1cCB0byByZXZpZXcgb25seSB0aGUga3VuaXQgY2hhbmdlcy4gT2YKY291cnNl
IGlmIEl1cmlpIHdvdWxkIGJlIHVwIHRvIGFsc28gaGVscCByZXZpZXcgZnV0dXJlIHByb2MgY2hh
bmdlcywKZXZlbiBiZXR0ZXIuIDMgcGFpciBvZiBleWViYWxscyBpcyBiZXR0ZXIgdGhhbiAyIHBh
aXJzLgoKICBMdWlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
