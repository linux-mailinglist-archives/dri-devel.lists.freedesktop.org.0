Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DBA117B2
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 12:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F648936C;
	Thu,  2 May 2019 10:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AC58936C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 10:58:51 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B53B620656;
 Thu,  2 May 2019 10:58:50 +0000 (UTC)
Date: Thu, 2 May 2019 12:58:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 07/17] kunit: test: add initial tests
Message-ID: <20190502105849.GB12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-8-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501230126.229218-8-brendanhiggins@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556794731;
 bh=T+a6pMLcd5HD33Dp1GZ3s3ZyPMK+MqwsS3ME8Zht+Rk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xn9qtrH/6iSeajL86xHXikqGvmBkjkPTLd1nQIMw4pWMh7dALh2KSvL9dx0J57LgI
 quJUvnif3o9cb3481YZvUlkI6jUNhggJl4YQx1f7LdW6Giv789veSDWkw97Tu8zDGX
 B/7+uvqfWjfGoe3LMHNAL8STZruUkOlyRkyfu/So=
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

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDQ6MDE6MTZQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEFkZCBhIHRlc3QgZm9yIHN0cmluZyBzdHJlYW0gYWxvbmcgd2l0aCBhIHNpbXBs
ZXIgZXhhbXBsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+Cj4gLS0tCj4gIGt1bml0L0tjb25maWcgICAgICAgICAgICAgIHwg
MTIgKysrKysrCj4gIGt1bml0L01ha2VmaWxlICAgICAgICAgICAgIHwgIDQgKysKPiAga3VuaXQv
ZXhhbXBsZS10ZXN0LmMgICAgICAgfCA4OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICBrdW5pdC9zdHJpbmctc3RyZWFtLXRlc3QuYyB8IDYxICsrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTY1IGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGt1bml0L2V4YW1wbGUtdGVzdC5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBrdW5pdC9zdHJpbmctc3RyZWFtLXRlc3QuYwo+IAo+IGRpZmYgLS1naXQgYS9rdW5pdC9LY29u
ZmlnIGIva3VuaXQvS2NvbmZpZwo+IGluZGV4IDY0NDgwMDkyYjJjMjQuLjVjYjUwMDM1NWM4NzMg
MTAwNjQ0Cj4gLS0tIGEva3VuaXQvS2NvbmZpZwo+ICsrKyBiL2t1bml0L0tjb25maWcKPiBAQCAt
MTMsNCArMTMsMTYgQEAgY29uZmlnIEtVTklUCj4gIAkgIHNwZWNpYWwgaGFyZHdhcmUuIEZvciBt
b3JlIGluZm9ybWF0aW9uLCBwbGVhc2Ugc2VlCj4gIAkgIERvY3VtZW50YXRpb24va3VuaXQvCj4g
IAo+ICtjb25maWcgS1VOSVRfVEVTVAo+ICsJYm9vbCAiS1VuaXQgdGVzdCBmb3IgS1VuaXQiCj4g
KwlkZXBlbmRzIG9uIEtVTklUCj4gKwloZWxwCj4gKwkgIEVuYWJsZXMgS1VuaXQgdGVzdCB0byB0
ZXN0IEtVbml0Lgo+ICsKPiArY29uZmlnIEtVTklUX0VYQU1QTEVfVEVTVAo+ICsJYm9vbCAiRXhh
bXBsZSB0ZXN0IGZvciBLVW5pdCIKPiArCWRlcGVuZHMgb24gS1VOSVQKPiArCWhlbHAKPiArCSAg
RW5hYmxlcyBleGFtcGxlIEtVbml0IHRlc3QgdG8gZGVtbyBmZWF0dXJlcyBvZiBLVW5pdC4KCkNh
bid0IHRoZXNlIHRlc3RzIGJlIG1vZHVsZT8KCk9yIGFtIEkgbWlzLXJlYWRpbmcgdGhlIHByZXZp
b3VzIGxvZ2ljPwoKQW55d2F5LCBqdXN0IGEgcXVlc3Rpb24sIG5vdGhpbmcgb2JqZWN0aW5nIHRv
IHRoaXMgYXMtaXMgZm9yIG5vdy4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
