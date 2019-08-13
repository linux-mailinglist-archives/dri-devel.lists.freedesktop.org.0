Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74E8AF13
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 08:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE076E053;
	Tue, 13 Aug 2019 06:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059266E053
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:02:02 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9658A206C2;
 Tue, 13 Aug 2019 06:02:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-14-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-14-brendanhiggins@google.com>
Subject: Re: [PATCH v12 13/18] kunit: tool: add Python wrappers for running
 KUnit tests
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 23:02:00 -0700
Message-Id: <20190813060201.9658A206C2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565676121;
 bh=Ocx25N/xyUSoVrReUcdErcb1izwm3iTofQJuv3zSZN4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ycidyXsDZ2b2yk2By5o4ZcAnHEUeEnTJRk810aiZRrmdvgpwi6IAyTsm6lLp0P5Qq
 lYNHCHb1ycTfLVST4OwEsrE6eAp4rQsG/ARqXSNx373v0QGki2WgeDepQWwi/kThha
 fXnzhNABL8hllvXEfm+NiLtzcRWsb6JmvTXlWWfY=
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
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MTYpCj4gRnJvbTogRmVs
aXggR3VvIDxmZWxpeGd1b3hpdXBpbmdAZ21haWwuY29tPgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2Fs
IGlzIHRvIGNyZWF0ZSBtaW5pbWFsIGlzb2xhdGVkIHRlc3QgYmluYXJpZXM7IGluIHRoZQo+IG1l
YW50aW1lIHdlIGFyZSB1c2luZyBVTUwgdG8gcHJvdmlkZSB0aGUgaW5mcmFzdHJ1Y3R1cmUgdG8g
cnVuIHRlc3RzLCBzbwo+IGRlZmluZSBhbiBhYnN0cmFjdCB3YXkgdG8gY29uZmlndXJlIGFuZCBy
dW4gdGVzdHMgdGhhdCBhbGxvdyB1cyB0bwo+IGNoYW5nZSB0aGUgY29udGV4dCBpbiB3aGljaCB0
ZXN0cyBhcmUgYnVpbHQgd2l0aG91dCBhZmZlY3RpbmcgdGhlIHVzZXIuCj4gVGhpcyBhbHNvIG1h
a2VzIHByZXR0eSBhbmQgZHluYW1pYyBlcnJvciByZXBvcnRpbmcsIGFuZCBhIGxvdCBvZiBvdGhl
cgo+IG5pY2UgZmVhdHVyZXMgZWFzaWVyLgo+IAo+IGt1bml0X2NvbmZpZy5weToKPiAgIC0gcGFy
c2UgLmNvbmZpZyBhbmQgS2NvbmZpZyBmaWxlcy4KPiAKPiBrdW5pdF9rZXJuZWwucHk6IHByb3Zp
ZGVzIGhlbHBlciBmdW5jdGlvbnMgdG86Cj4gICAtIGNvbmZpZ3VyZSB0aGUga2VybmVsIHVzaW5n
IGt1bml0Y29uZmlnLgo+ICAgLSBidWlsZCB0aGUga2VybmVsIHdpdGggdGhlIGFwcHJvcHJpYXRl
IGNvbmZpZ3VyYXRpb24uCj4gICAtIHByb3ZpZGUgZnVuY3Rpb24gdG8gaW52b2tlIHRoZSBrZXJu
ZWwgYW5kIHN0cmVhbSB0aGUgb3V0cHV0IGJhY2suCj4gCj4ga3VuaXRfcGFyc2VyLnB5OiBwYXJz
ZXMgcmF3IGxvZ3MgcmV0dXJuZWQgb3V0IGJ5IGt1bml0X2tlcm5lbCBhbmQKPiBkaXNwbGF5cyB0
aGVtIGluIGEgdXNlciBmcmllbmRseSB3YXkuCj4gCj4gdGVzdF9kYXRhLyo6IHNhbXBsZXMgb2Yg
dGVzdCBkYXRhIGZvciB0ZXN0aW5nIGt1bml0LnB5LCBrdW5pdF9jb25maWcucHksCj4gZXRjLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+Cj4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVl
LmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+
CgpJIGxvb2sgZm9yd2FyZCB0byB0aGUgc2luZ2xlIGJpbmFyeSBzb2x1dGlvbiwgYnV0IHVudGls
IHRoZW4sIHdlIGhhdmUKdGhpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
