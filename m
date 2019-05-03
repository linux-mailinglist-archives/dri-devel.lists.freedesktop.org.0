Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7A13087
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 16:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294B66E7CE;
	Fri,  3 May 2019 14:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4696E7CE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 14:38:24 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B53A2075E;
 Fri,  3 May 2019 14:38:22 +0000 (UTC)
Subject: Re: [PATCH v2 15/17] MAINTAINERS: add entry for KUnit the unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-16-brendanhiggins@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <68f88e1c-d40f-9dad-7296-ab2b2303c575@kernel.org>
Date: Fri, 3 May 2019 08:38:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501230126.229218-16-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556894304;
 bh=h8oxhzJgMjKsgFLL1fTeERSR9DIUHSDvIGx4NtqrSk8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pk4OHvvgJJmv9SPnB6LKIN4E7kYPSd9V9fKtqN0iU5EoavNPnLPHQKTqci0zx2sOe
 OUW21wB7Vx2wMWr8UJHS7PkPhgYKYCStUAReyHvN/DZti58bKEgvn8G7m+LgdKLl+q
 2Iy1KJC7agYFgVsnqcKMjl9uBxuQgNZuMkNlyvD4=
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
 rostedt@goodmis.org, julia.lawall@lip6.fr,
 Shuah Khan <skhan@linuxfoundation.org>, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xLzE5IDU6MDEgUE0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiBBZGQgbXlzZWxmIGFz
IG1haW50YWluZXIgb2YgS1VuaXQsIHRoZSBMaW51eCBrZXJuZWwncyB1bml0IHRlc3RpbmcKPiBm
cmFtZXdvcmsuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgo+IC0tLQo+ICAgTUFJTlRBSU5FUlMgfCAxMCArKysrKysrKysrCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlO
VEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggNWMzOGYyMWFlZTc4Ny4uYzc4YWU5NWM1NmI4
MCAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTg0
NDgsNiArODQ0OCwxNiBAQCBTOglNYWludGFpbmVkCj4gICBGOgl0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy8KPiAgIEY6CURvY3VtZW50YXRpb24vZGV2LXRvb2xzL2tzZWxmdGVzdCoKPiAgIAo+ICtL
RVJORUwgVU5JVCBURVNUSU5HIEZSQU1FV09SSyAoS1VuaXQpCj4gK006CUJyZW5kYW4gSGlnZ2lu
cyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiArTDoJa3VuaXQtZGV2QGdvb2dsZWdyb3Vw
cy5jb20KPiArVzoJaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFy
dHkva2VybmVsL2RvY3MvCj4gK1M6CU1haW50YWluZWQKPiArRjoJRG9jdW1lbnRhdGlvbi9rdW5p
dC8KPiArRjoJaW5jbHVkZS9rdW5pdC8KPiArRjoJa3VuaXQvCj4gK0Y6CXRvb2xzL3Rlc3Rpbmcv
a3VuaXQvCj4gKwoKUGxlYXNlIGFkZCBrc2VsZnRlc3QgbWFpbGluZyBsaXN0IHRvIHRoaXMgZW50
cnksIGJhc2VkIG9uIG91cgpjb252ZXJzYXRpb24gb24gdGFraW5nIHRoZXNlIHBhdGNoZXMgdGhy
b3VnaCBrc2VsZnRlc3QgdHJlZS4KCnRoYW5rcywKLS0gU2h1YWgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
