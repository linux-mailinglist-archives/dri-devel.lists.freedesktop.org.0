Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A655363A66
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 20:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82C16E07B;
	Tue,  9 Jul 2019 18:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591CB6E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 18:01:48 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b13so5068728pfo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 11:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OUg57n/8w7Mlx4FSaThva6QRBMRQrC57aji70HqhlTs=;
 b=q8ObVKX9VFIwMQpHrs0Se8Y4l4zy1/UJz+BUMIC2iD2L7AtdgY1ARo+991bz0NI+tH
 qXAwOtcRW8Acjy/d/euGNyOD/hKtVCz9t2wHg/Z6H57y6o5rwgRInj3TivuAwtvgBlhq
 f9aOLK+85zsp54nYDzMgR825yFqJahtf2saAuPVMOaK5pCQnkCJa+5QJP5pa/N3oaepu
 tkVeeDUU3XQyGjTQysjiTqoj69t4ZPPRIz/sh2ethRXLDzOTQtfGQ0wyCjS7dWyLKwPa
 2hhvQBYx87RWBMd06yTx6UKI58euJbuwCt8ShA5vNaDmpSai4QYG69Lso0wI6VQ5sB4r
 GtmA==
X-Gm-Message-State: APjAAAXgdNlNPeKJTlWM/9YMlUNW8/2ekVHqlYN0ZTr3P6+q6kzS2GZ4
 UltQ+4yeVlCbVdnkbRd76622qxGFxpRqE5bCqAFuyg==
X-Google-Smtp-Source: APXvYqw4HCjsVl+Amh2Teet2qtkXvGz99b/JiD+OyiCx/6U5M9oVU+FrejKuChE3TPRj4OZE1ZrjIBxXffNmybu5Pvg=
X-Received: by 2002:a63:205f:: with SMTP id r31mr32165059pgm.159.1562695307162; 
 Tue, 09 Jul 2019 11:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-17-brendanhiggins@google.com>
 <7cc417dd-036f-7dc1-6814-b1fdac810f03@kernel.org>
In-Reply-To: <7cc417dd-036f-7dc1-6814-b1fdac810f03@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 9 Jul 2019 11:01:35 -0700
Message-ID: <CAFd5g4595X8cM919mohQVaShs4dKWzZ_-2RVB=6SH3RdVMwuQw@mail.gmail.com>
Subject: Re: [PATCH v7 16/18] MAINTAINERS: add entry for KUnit the unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OUg57n/8w7Mlx4FSaThva6QRBMRQrC57aji70HqhlTs=;
 b=u9enlrUFhNo6CpHlrQV/HgMnM2prP/1x9AkLcEyZIZZ95VhPysZXNdVgTxFeHrQSyj
 D854QOHx1OOVg+bK1q0GL9M26yGnhrklGjHFU0YlePfBqyn8fol1vLU/0tJs5NO+XWNV
 6Qg4G47Yz8EAu+oXnFu1Mzex0KXUQSkc3dP89G7ycpwdK6vtjyVs4n/CA1F66BOgluWi
 cGrmqcEgZcaKnQ36vda5DA3xHSSM91ST4LQMohLGersiVfBM4MAAfBua5GuHtjmb28bv
 cNHp7EXFv/Be9TyDKlfByNT+SveMU7rOne9AoLQN+azT38ic+R4kxi1lUa+FZPUqI2ob
 eorw==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCA3OjUzIEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDcvOS8xOSAxMjozMCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4g
QWRkIG15c2VsZiBhcyBtYWludGFpbmVyIG9mIEtVbml0LCB0aGUgTGludXgga2VybmVsJ3MgdW5p
dCB0ZXN0aW5nCj4gPiBmcmFtZXdvcmsuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBI
aWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiBSZXZpZXdlZC1i
eTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+ID4gLS0tCj4gPiAgIE1B
SU5UQUlORVJTIHwgMTEgKysrKysrKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+
ID4gaW5kZXggNjc3ZWY0MWNiMDEyYy4uNDhkMDRkMTgwYTk4OCAxMDA2NDQKPiA+IC0tLSBhL01B
SU5UQUlORVJTCj4gPiArKysgYi9NQUlOVEFJTkVSUwo+ID4gQEAgLTg1OTksNiArODU5OSwxNyBA
QCBTOiAgICAgTWFpbnRhaW5lZAo+ID4gICBGOiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvCj4g
PiAgIEY6ICBEb2N1bWVudGF0aW9uL2Rldi10b29scy9rc2VsZnRlc3QqCj4gPgo+ID4gK0tFUk5F
TCBVTklUIFRFU1RJTkcgRlJBTUVXT1JLIChLVW5pdCkKPiA+ICtNOiAgIEJyZW5kYW4gSGlnZ2lu
cyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+ICtMOiAgIGxpbnV4LWtzZWxmdGVzdEB2
Z2VyLmtlcm5lbC5vcmcKPiA+ICtMOiAgIGt1bml0LWRldkBnb29nbGVncm91cHMuY29tCj4gPiAr
VzogICBodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90aGlyZF9wYXJ0eS9rZXJu
ZWwvZG9jcy8KPiA+ICtTOiAgIE1haW50YWluZWQKPiA+ICtGOiAgIERvY3VtZW50YXRpb24vZGV2
LXRvb2xzL2t1bml0Lwo+ID4gK0Y6ICAgaW5jbHVkZS9rdW5pdC8KPiA+ICtGOiAgIGt1bml0Lwo+
ID4gK0Y6ICAgdG9vbHMvdGVzdGluZy9rdW5pdC8KPiA+ICsKPiA+ICAgS0VSTkVMIFVTRVJNT0RF
IEhFTFBFUgo+ID4gICBNOiAgTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Cj4g
PiAgIEw6ICBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPgo+Cj4gVGhhbmtzIEJyZW5k
YW4uCj4KPiBJIGFtIGdvb2Qgd2l0aCB0aGlzLiBJIGNhbiB0YWtlIEtVbml0IHBhdGNoZXMgdGhy
b3VnaCBrc2VsZnRlc3QKPiB3aXRoIHlvdXIgQWNrLgoKTXkgYWNrbm93bGVkZ2VtZW50PyBTdXJl
ISBJIHRob3VnaHQgd2UgYWxyZWFkeSBhZ3JlZWQgdG8gdGhhdC4KCkFsc28sIGRvIHdlIG5lZWQg
YW4gYWNrIGZyb20gTWFzYWhpcm8gb3IgTWljaGFsIGZvciB0aGUgS2J1aWxkIHBhdGNoCltQQVRD
SCB2NyAwNi8xOF0/IEFuZCBhbiBhY2sgZnJvbSBKb3NoIG9yIFBldGVyIGZvciB0aGUgb2JqdG9v
bCBwYXRjaApbUEFUQ0ggdjcgMDgvMThdPwoKR3JlZyBhbmQgTG9nYW4gZ2F2ZSBtZSBhIFJldmll
d2VkLWJ5IGZvciB0aGUgS2J1aWxkIHBhdGNoLCBzbyBtYXliZQp0aGF0J3MgZmluZSwgYnV0IEkg
ZG9uJ3QgaGF2ZSBhbnkgcmV2aWV3cyBvciBhY2tzIGZvciB0aGUgb2JqdG9vbApwYXRjaC4KClRo
YW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
