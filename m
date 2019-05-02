Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E37117DC
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 13:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D598926D;
	Thu,  2 May 2019 11:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4DB8926D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 11:03:49 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4209320656;
 Thu,  2 May 2019 11:03:49 +0000 (UTC)
Date: Thu, 2 May 2019 13:03:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Message-ID: <20190502110347.GE12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501230126.229218-17-brendanhiggins@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556795029;
 bh=O3tfI3pqzOj0bEmXd9MUeZFrQfwB6jIaKEbV4O7x7Bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cpMMab1CbtEf7/ukbOdl3ygxOXLRXxfMRGPprF4sj5SCCaW5OE96hyghMd3SOS2/O
 704jRirIDOFY4nx9V3U5D+VWDZoHX2Dr8aOg1DMDp0dkWxjxEJNwlIk5qgnR1l74hy
 2ADDJONY2mvp2Xafc2iurhiMmE86VmsCoHu18VkU=
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
 rientjes@google.com, Iurii Zaikin <yzaikin@google.com>, jdike@addtoit.com,
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

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDQ6MDE6MjVQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEZyb206IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgo+IAo+IEtV
bml0IHRlc3RzIGZvciBpbml0aWFsaXplZCBkYXRhIGJlaGF2aW9yIG9mIHByb2NfZG9pbnR2ZWMg
dGhhdCBpcwo+IGV4cGxpY2l0bHkgY2hlY2tlZCBpbiB0aGUgY29kZS4gSW5jbHVkZXMgYmFzaWMg
cGFyc2luZyB0ZXN0cyBpbmNsdWRpbmcKPiBpbnQgbWluL21heCBvdmVyZmxvdy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBJdXJpaSBaYWlraW4gPHl6YWlraW5AZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gLS0tCj4g
IGtlcm5lbC9NYWtlZmlsZSAgICAgIHwgICAyICsKPiAga2VybmVsL3N5c2N0bC10ZXN0LmMgfCAy
OTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBsaWIvS2Nv
bmZpZy5kZWJ1ZyAgICB8ICAgNiArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzAwIGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9zeXNjdGwtdGVzdC5jCj4gCj4gZGlmZiAt
LWdpdCBhL2tlcm5lbC9NYWtlZmlsZSBiL2tlcm5lbC9NYWtlZmlsZQo+IGluZGV4IDZjNTdlNzg4
MTdkYWQuLmM4MWE4OTc2YjZhNGIgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL01ha2VmaWxlCj4gKysr
IGIva2VybmVsL01ha2VmaWxlCj4gQEAgLTExMiw2ICsxMTIsOCBAQCBvYmotJChDT05GSUdfSEFT
X0lPTUVNKSArPSBpb21lbS5vCj4gIG9iai0kKENPTkZJR19aT05FX0RFVklDRSkgKz0gbWVtcmVt
YXAubwo+ICBvYmotJChDT05GSUdfUlNFUSkgKz0gcnNlcS5vCj4gIAo+ICtvYmotJChDT05GSUdf
U1lTQ1RMX0tVTklUX1RFU1QpICs9IHN5c2N0bC10ZXN0Lm8KCllvdSBhcmUgZ29pbmcgdG8gaGF2
ZSB0byBoYXZlIGEgInN0YW5kYXJkIiBuYW1pbmcgc2NoZW1lIGZvciB0ZXN0Cm1vZHVsZXMsIGFy
ZSB5b3UgZ29pbmcgdG8gcmVjb21tZW5kICJmb28tdGVzdCIgb3ZlciAidGVzdC1mb28iPyAgSWYg
c28sCnRoYXQncyBmaW5lLCB3ZSBzaG91bGQganVzdCBiZSBjb25zaXN0YW50IGFuZCBkb2N1bWVu
dCBpdCBzb21ld2hlcmUuCgpQZXJzb25hbGx5LCBJJ2QgcHJlZmVyICJ0ZXN0LWZvbyIsIGJ1dCB0
aGF0J3MganVzdCBtZSwgbmFtaW5nIGlzIGhhcmQuLi4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
