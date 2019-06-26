Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6355E38
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 04:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6616E1D8;
	Wed, 26 Jun 2019 02:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4666B6E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 02:19:55 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id c13so394576pgg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 19:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ImbOmbqru+Yum9wVwWkpBNaUFJnZhA+Sv2EnuogBtJ8=;
 b=JtHQS/gp7auHL/FIAVRNhYCWobLM86eU8n8zZF2gKnWMbsw4QpTk/K0k4MfoX0ang5
 n4LT7cEw533y437nY+6nKE/yDZQPYFL4BJ8nKiaLplELqFPGjBPScdJytaA9tCj19qxV
 UqGA/44sasfD/2QTAc+SJ9dsPeCysy9yZ+fZf8w3Meg+4H6nt7S5+iuxcvI8q5SBCI2r
 sgG1BdSZpeGMc4ZE8KBqS71zglIIef5icTvwPKobvPJkMFBX9bsyXv1zvWILlJf/5+LN
 zZs/dG1nXdYxGZFeOAlXdyskHaJTS7brExnBaj5Hs8YfuRUCPOE/bjdqtHhnGA9T410c
 E5hQ==
X-Gm-Message-State: APjAAAW/X8lr3a323JNBZ2iXwCvq3kTSxiZeSJox2QhVRgfDarvZuT8u
 GCHwdgLIQ2DWy3rdwk9AaS0=
X-Google-Smtp-Source: APXvYqz/ak3oqhDInPfCtSC5xTrl5WLmu4WvNmi0OnSYEvLdryLAAJJtmF40zvlfJnfwrjGTHOLxzA==
X-Received: by 2002:a17:90a:2486:: with SMTP id
 i6mr1267695pje.125.1561515594542; 
 Tue, 25 Jun 2019 19:19:54 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id q1sm23369013pfn.178.2019.06.25.19.19.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 19:19:53 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id BB23740336; Wed, 26 Jun 2019 02:19:52 +0000 (UTC)
Date: Wed, 26 Jun 2019 02:19:52 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
Message-ID: <20190626021952.GV19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-19-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617082613.109131-19-brendanhiggins@google.com>
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjY6MTNBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEFkZCBlbnRyeSBmb3IgdGhlIG5ldyBwcm9jIHN5c2N0bCBLVW5pdCB0ZXN0IHRv
IHRoZSBQUk9DIFNZU0NUTCBzZWN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGln
Z2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogTG9n
YW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgoKQWNrZWQtYnk6IEx1aXMgQ2hhbWJl
cmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgoKICBMdWlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
