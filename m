Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7F63839
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0CD6E06D;
	Tue,  9 Jul 2019 14:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CE76E06D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:53:40 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6644F214AF;
 Tue,  9 Jul 2019 14:53:35 +0000 (UTC)
Subject: Re: [PATCH v7 16/18] MAINTAINERS: add entry for KUnit the unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, sboyd@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-17-brendanhiggins@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <7cc417dd-036f-7dc1-6814-b1fdac810f03@kernel.org>
Date: Tue, 9 Jul 2019 08:53:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709063023.251446-17-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562684020;
 bh=Mv7YTLIc+jI3uCRwSd1DAeik4HQLm9P9oMcVwz2d2dk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XgulwaGpIAZUTMHGK6H52VD3EGXSfaZA2VLPhCuPHVQN4Ql3qcJzAtWEmAruTZN6F
 CiqOnOuc9sTH4GW5+VhzHiNXC2Jpq24ah0VHZEIGAOqDliCu4Fwf44hiQwbpQ/Q/If
 Xl4Y5OinAOMyTTsR/xSt2diAONVrq1cwoJa/TeF8=
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
 linux-kselftest@vger.kernel.org, shuah <shuah@kernel.org>,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy85LzE5IDEyOjMwIEFNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gQWRkIG15c2VsZiBh
cyBtYWludGFpbmVyIG9mIEtVbml0LCB0aGUgTGludXgga2VybmVsJ3MgdW5pdCB0ZXN0aW5nCj4g
ZnJhbWV3b3JrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxs
b2dhbmdAZGVsdGF0ZWUuY29tPgo+IC0tLQo+ICAgTUFJTlRBSU5FUlMgfCAxMSArKysrKysrKysr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDY3N2VmNDFjYjAxMmMuLjQ4ZDA0ZDE4
MGE5ODggMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBA
IC04NTk5LDYgKzg1OTksMTcgQEAgUzoJTWFpbnRhaW5lZAo+ICAgRjoJdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvCj4gICBGOglEb2N1bWVudGF0aW9uL2Rldi10b29scy9rc2VsZnRlc3QqCj4gICAK
PiArS0VSTkVMIFVOSVQgVEVTVElORyBGUkFNRVdPUksgKEtVbml0KQo+ICtNOglCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gK0w6CWxpbnV4LWtzZWxmdGVzdEB2
Z2VyLmtlcm5lbC5vcmcKPiArTDoJa3VuaXQtZGV2QGdvb2dsZWdyb3Vwcy5jb20KPiArVzoJaHR0
cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2VybmVsL2RvY3Mv
Cj4gK1M6CU1haW50YWluZWQKPiArRjoJRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvCj4g
K0Y6CWluY2x1ZGUva3VuaXQvCj4gK0Y6CWt1bml0Lwo+ICtGOgl0b29scy90ZXN0aW5nL2t1bml0
Lwo+ICsKPiAgIEtFUk5FTCBVU0VSTU9ERSBIRUxQRVIKPiAgIE06CUx1aXMgQ2hhbWJlcmxhaW4g
PG1jZ3JvZkBrZXJuZWwub3JnPgo+ICAgTDoJbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
IAoKVGhhbmtzIEJyZW5kYW4uCgpJIGFtIGdvb2Qgd2l0aCB0aGlzLiBJIGNhbiB0YWtlIEtVbml0
IHBhdGNoZXMgdGhyb3VnaCBrc2VsZnRlc3QKd2l0aCB5b3VyIEFjay4KCnRoYW5rcywKLS0gU2h1
YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
