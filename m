Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED43117C7
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 13:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2E689337;
	Thu,  2 May 2019 11:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8903B8926D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 11:02:22 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5A6B20656;
 Thu,  2 May 2019 11:02:21 +0000 (UTC)
Date: Thu, 2 May 2019 13:02:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 12/17] kunit: tool: add Python wrappers for running
 KUnit tests
Message-ID: <20190502110220.GD12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-13-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501230126.229218-13-brendanhiggins@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556794942;
 bh=nOdygw9Kk1rPOSBt7SYd7W2YRVezyBvv7bv92jfZhHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QVhLNVl+kFCGa4qKMxbE3iXUhUTDNoqNjOrwG/PTklDuyc/zZitjl4iGVIUEcK9mq
 ZjtTSTPd/IYzKKg9UaCBiZ1iUe+zjqgu6eX3MtWFfMyatUxvweOtiAQ0LBZimoeXJA
 oWjvyASNbWkhMa6vm3fnEL/GbAHDE6uY2kQH7jq4=
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
 kieran.bingham@ideasonboard.com, Felix Guo <felixguoxiuping@gmail.com>,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDQ6MDE6MjFQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEZyb206IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPiAK
PiBUaGUgdWx0aW1hdGUgZ29hbCBpcyB0byBjcmVhdGUgbWluaW1hbCBpc29sYXRlZCB0ZXN0IGJp
bmFyaWVzOyBpbiB0aGUKPiBtZWFudGltZSB3ZSBhcmUgdXNpbmcgVU1MIHRvIHByb3ZpZGUgdGhl
IGluZnJhc3RydWN0dXJlIHRvIHJ1biB0ZXN0cywgc28KPiBkZWZpbmUgYW4gYWJzdHJhY3Qgd2F5
IHRvIGNvbmZpZ3VyZSBhbmQgcnVuIHRlc3RzIHRoYXQgYWxsb3cgdXMgdG8KPiBjaGFuZ2UgdGhl
IGNvbnRleHQgaW4gd2hpY2ggdGVzdHMgYXJlIGJ1aWx0IHdpdGhvdXQgYWZmZWN0aW5nIHRoZSB1
c2VyLgo+IFRoaXMgYWxzbyBtYWtlcyBwcmV0dHkgYW5kIGR5bmFtaWMgZXJyb3IgcmVwb3J0aW5n
LCBhbmQgYSBsb3Qgb2Ygb3RoZXIKPiBuaWNlIGZlYXR1cmVzIGVhc2llci4KPiAKPiBrdW5pdF9j
b25maWcucHk6Cj4gICAtIHBhcnNlIC5jb25maWcgYW5kIEtjb25maWcgZmlsZXMuCj4gCj4ga3Vu
aXRfa2VybmVsLnB5OiBwcm92aWRlcyBoZWxwZXIgZnVuY3Rpb25zIHRvOgo+ICAgLSBjb25maWd1
cmUgdGhlIGtlcm5lbCB1c2luZyBrdW5pdGNvbmZpZy4KPiAgIC0gYnVpbGQgdGhlIGtlcm5lbCB3
aXRoIHRoZSBhcHByb3ByaWF0ZSBjb25maWd1cmF0aW9uLgo+ICAgLSBwcm92aWRlIGZ1bmN0aW9u
IHRvIGludm9rZSB0aGUga2VybmVsIGFuZCBzdHJlYW0gdGhlIG91dHB1dCBiYWNrLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+CgpB
aCwgaGVyZSdzIHByb2JhYmx5IG15IGFuc3dlciB0byBteSBwcmV2aW91cyBsb2dnaW5nIGZvcm1h
dCBxdWVzdGlvbiwKcmlnaHQ/ICBXaGF0J3MgdGhlIGNoYW5jZSB0aGF0IHRoZXNlIHdyYXBwZXJz
IG91dHB1dCBzdHVmZiBpbiBhIHN0YW5kYXJkCmZvcm1hdCB0aGF0IHRlc3QtZnJhbWV3b3JrLXRv
b2xzIGNhbiBhbHJlYWR5IHBhcnNlPyAgOikKCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
