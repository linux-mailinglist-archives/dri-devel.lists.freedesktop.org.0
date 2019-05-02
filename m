Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D646117BE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 13:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD6893A8;
	Thu,  2 May 2019 11:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3AB893A8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 11:00:10 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15DE020873;
 Thu,  2 May 2019 11:00:10 +0000 (UTC)
Date: Thu, 2 May 2019 13:00:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream
 like logger
Message-ID: <20190502110008.GC12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501230126.229218-5-brendanhiggins@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556794810;
 bh=45dEsHaryCD2YgFTD+ut5sayCsIeyqDSb8beWTRv3KM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ul7LjAUmXIs6gOiMJ5yQjFk0zB2SKusIa68Zpp0UBAocQuuUVwuhC7PesmVCGFfiy
 SS6gtBjzqaPb3ZVbYzNFxN4EXaZpTzrRYDfwrecZrNKFK2hfGaPAAUEI48b1a51Bd/
 lCw83jb9L+bxfslPdh/y69NItWGJmuQH7yIvU0I4=
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
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com, richard@nod.at,
 sboyd@kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com,
 khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDQ6MDE6MTNQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEEgbG90IG9mIHRoZSBleHBlY3RhdGlvbiBhbmQgYXNzZXJ0aW9uIGluZnJhc3Ry
dWN0dXJlIHByaW50cyBvdXQgZmFpcmx5Cj4gY29tcGxpY2F0ZWQgdGVzdCBmYWlsdXJlIG1lc3Nh
Z2VzLCBzbyBhZGQgYSBDKysgc3R5bGUgbG9nIGxpYnJhcnkgZm9yCj4gZm9yIGxvZ2dpbmcgdGVz
dCByZXN1bHRzLgoKSWRlYWxseSB3ZSB3b3VsZCBhbHdheXMgdXNlIGEgc3RhbmRhcmQgbG9nZ2lu
ZyBmb3JtYXQsIGxpa2UgdGhlCmtzZWxmdGVzdCB0ZXN0cyBhbGwgYXJlIGFpbWluZyB0byBkby4g
IFRoYXQgd2F5IHRoZSBvdXRwdXQgY2FuIGJlIGVhc2lseQpwYXJzZWQgYnkgdG9vbHMgdG8gc2Vl
IGlmIHRoZSB0ZXN0cyBzdWNjZWVkL2ZhaWwgZWFzaWx5LgoKQW55IGNoYW5jZSBvZiBoYXZpbmcg
dGhpcyBsb2dnaW5nIGZyYW1ld29yayBlbmZvcmNpbmcgdGhhdCBmb3JtYXQgYXMKd2VsbD8KCnRo
YW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
