Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFFF9B570
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 19:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90396ED01;
	Fri, 23 Aug 2019 17:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8E46ED03
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 17:28:02 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u17so6118760pgi.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 10:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JpGZpvS6y7xgN7XnzsEu5TdSqjOQTKTe7TuWBgzpXxk=;
 b=aWy9VZElzGnrePRSQzdehkpJG6zS7rxej31WzvB2A4k1SmV6IzXTMop/9OvIuXifX+
 vJvXOcm7AToH3VUiamXSmbNi09KEBnNpjoSWR5DPG/WAGhH5Zgr3qZ0K5PWxGqPXV8GP
 eDSp3PUabkbLqF6EdPt7/vaA9XBAXll+8NE+DUoLSyYRO8+DHXwGs/Oale5potPtKIZl
 2d8Q6VngrDoTnDoHihjsF4lLbfXUMzBMZTGJzOEjnF4ubBC4AfAIPguU7Ukw7xmiL8sv
 z/n24Wnz27WX0yBnFTo0nGOK+vC195ST/xZZ46nX3EUMrWhMVKPpr4TyyEfYnA+cpPNK
 TOwQ==
X-Gm-Message-State: APjAAAU5adQhrK7BCnAWwsg9O8q/eiLsYB0oxDetgL3qgjXH3ZzgRxXj
 A/Xly5gW05/Pq1mPxgTnoiA9irx6BNKafVScFITl4w==
X-Google-Smtp-Source: APXvYqxO41uhCLsTUJZzB3icsTW0bMGI+WWDOYyKC539Pf/Fhot22x5RnB49yWHNSNlX8BLD0YS+A9/mQTKWddz6BQY=
X-Received: by 2002:a63:b919:: with SMTP id z25mr4863766pge.201.1566581281074; 
 Fri, 23 Aug 2019 10:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
 <20190820232046.50175-2-brendanhiggins@google.com>
 <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
 <CAFd5g44mRK9t4f58i_YMEt=e9RTxwrrhFY_V2LW_E7bUwR3cdg@mail.gmail.com>
 <4513d9f3-a69b-a9a4-768b-86c2962b62e0@kernel.org>
In-Reply-To: <4513d9f3-a69b-a9a4-768b-86c2962b62e0@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 23 Aug 2019 10:27:49 -0700
Message-ID: <CAFd5g446J=cVW4QW+QeZMLDi+ANqshAW6KTrFFBTusPcdr6-GA@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] kunit: test: add KUnit test runner core
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JpGZpvS6y7xgN7XnzsEu5TdSqjOQTKTe7TuWBgzpXxk=;
 b=DPbWDrNSkF3m3LM0LR49Pzw0ikWe08dHQLzlDwCCEd7SbY6lXjBe4g0E0/Oh0SS+8L
 1E2R3whjpm/iFQXBpTT4okhqcaJ9ZnLIQH02NXVEugo9GHSE50Jg8iFRbsmg/FsPppnw
 MrLpLS4WEb0jVHfL7Ku4uZCHChd+71dF0jelCrk2VXPZsc/GseLHkRq3LfohfXHpj4oa
 AeTShyhb7KisbZpowlWSJWUH5/NPhwM3qX6O9qpBe+sFL60yTW4cJ4vUQwBWpprLutHO
 5jYbqQDNL1N504EYpXBVjn24evq+dP/NDByqBukweHmVAjQPQCqMp6Hlv66N/RkoT59S
 yfsA==
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

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MDUgQU0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Cj4gT24gOC8yMy8xOSAxMDo0OCBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+
ID4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgODozMyBBTSBzaHVhaCA8c2h1YWhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBCcmVuZGFuLAo+ID4+Cj4gPj4gT24gOC8yMC8xOSA1OjIw
IFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPj4+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9y
IGRlZmluaW5nIHVuaXQgdGVzdHM7IHRoaXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4gPj4+IHRv
IGRlZmluZSB0ZXN0IGNhc2VzLCBmdW5jdGlvbnMgdGhhdCBleGVjdXRlIGNvZGUgd2hpY2ggaXMg
dW5kZXIgdGVzdAo+ID4+PiBhbmQgZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGNvZGUgdW5kZXIgdGVz
dCBiZWhhdmVzIGFzIGV4cGVjdGVkOyB0aGlzIGFsc28KPiA+Pj4gcHJvdmlkZXMgYSB3YXkgdG8g
Z3JvdXAgdG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGluIHRlc3Qgc3VpdGVzIChoZXJlCj4g
Pj4+IHdlIGNhbGwgdGhlbSB0ZXN0X21vZHVsZXMpLgo+ID4+Pgo+ID4+PiBKdXN0IGRlZmluZSB0
ZXN0IGNhc2VzIGFuZCBob3cgdG8gZXhlY3V0ZSB0aGVtIGZvciBub3c7IHNldHRpbmcKPiA+Pj4g
ZXhwZWN0YXRpb25zIG9uIGNvZGUgd2lsbCBiZSBkZWZpbmVkIGxhdGVyLgo+ID4+Pgo+ID4+PiBT
aWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+
Cj4gPj4+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgo+ID4+PiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVs
dGF0ZWUuY29tPgo+ID4+PiBSZXZpZXdlZC1ieTogTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtl
cm5lbC5vcmc+Cj4gPj4+IFJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5v
cmc+Cj4gPj4+IC0tLQo+ID4+PiAgICBpbmNsdWRlL2t1bml0L3Rlc3QuaCB8IDE3OSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4+ICAgIGt1bml0L0tjb25maWcg
ICAgICAgIHwgIDE3ICsrKysKPiA+Pj4gICAga3VuaXQvTWFrZWZpbGUgICAgICAgfCAgIDEgKwo+
ID4+PiAgICBrdW5pdC90ZXN0LmMgICAgICAgICB8IDE5MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMzg4IGluc2Vy
dGlvbnMoKykKPiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUva3VuaXQvdGVzdC5o
Cj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrdW5pdC9LY29uZmlnCj4gPj4+ICAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBrdW5pdC9NYWtlZmlsZQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQg
a3VuaXQvdGVzdC5jCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2t1bml0L3Rlc3Qu
aCBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4+
IGluZGV4IDAwMDAwMDAwMDAwMDAuLmUwYjM0YWNiOWVlNGUKPiA+Pj4gLS0tIC9kZXYvbnVsbAo+
ID4+PiArKysgYi9pbmNsdWRlL2t1bml0L3Rlc3QuaAo+ID4+PiBAQCAtMCwwICsxLDE3OSBAQAo+
ID4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+Pj4gKy8qCj4g
Pj4+ICsgKiBCYXNlIHVuaXQgdGVzdCAoS1VuaXQpIEFQSS4KPiA+Pj4gKyAqCj4gPj4+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMTksIEdvb2dsZSBMTEMuCj4gPj4+ICsgKiBBdXRob3I6IEJyZW5kYW4g
SGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+Pj4gKyAqLwo+ID4+PiArCj4g
Pj4+ICsjaWZuZGVmIF9LVU5JVF9URVNUX0gKPiA+Pj4gKyNkZWZpbmUgX0tVTklUX1RFU1RfSAo+
ID4+PiArCj4gPj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+Pj4gKwo+ID4+PiArc3Ry
dWN0IGt1bml0Owo+ID4+PiArCj4gPj4+ICsvKioKPiA+Pj4gKyAqIHN0cnVjdCBrdW5pdF9jYXNl
IC0gcmVwcmVzZW50cyBhbiBpbmRpdmlkdWFsIHRlc3QgY2FzZS4KPiA+Pj4gKyAqIEBydW5fY2Fz
ZTogdGhlIGZ1bmN0aW9uIHJlcHJlc2VudGluZyB0aGUgYWN0dWFsIHRlc3QgY2FzZS4KPiA+Pj4g
KyAqIEBuYW1lOiB0aGUgbmFtZSBvZiB0aGUgdGVzdCBjYXNlLgo+ID4+PiArICoKPiA+Pj4gKyAq
IEEgdGVzdCBjYXNlIGlzIGEgZnVuY3Rpb24gd2l0aCB0aGUgc2lnbmF0dXJlLCBgYHZvaWQgKCop
KHN0cnVjdCBrdW5pdCAqKWBgCj4gPj4+ICsgKiB0aGF0IG1ha2VzIGV4cGVjdGF0aW9ucyAoc2Vl
IEtVTklUX0VYUEVDVF9UUlVFKCkpIGFib3V0IGNvZGUgdW5kZXIgdGVzdC4gRWFjaAo+ID4+PiAr
ICogdGVzdCBjYXNlIGlzIGFzc29jaWF0ZWQgd2l0aCBhICZzdHJ1Y3Qga3VuaXRfc3VpdGUgYW5k
IHdpbGwgYmUgcnVuIGFmdGVyIHRoZQo+ID4+PiArICogc3VpdGUncyBpbml0IGZ1bmN0aW9uIGFu
ZCBmb2xsb3dlZCBieSB0aGUgc3VpdGUncyBleGl0IGZ1bmN0aW9uLgo+ID4+PiArICoKPiA+Pj4g
KyAqIEEgdGVzdCBjYXNlIHNob3VsZCBiZSBzdGF0aWMgYW5kIHNob3VsZCBvbmx5IGJlIGNyZWF0
ZWQgd2l0aCB0aGUgS1VOSVRfQ0FTRSgpCj4gPj4+ICsgKiBtYWNybzsgYWRkaXRpb25hbGx5LCBl
dmVyeSBhcnJheSBvZiB0ZXN0IGNhc2VzIHNob3VsZCBiZSB0ZXJtaW5hdGVkIHdpdGggYW4KPiA+
Pj4gKyAqIGVtcHR5IHRlc3QgY2FzZS4KPiA+Pj4gKyAqCj4gPj4+ICsgKiBFeGFtcGxlOgo+ID4+
Cj4gPj4gQ2FuIHlvdSBmaXggdGhlc2UgbGluZSBjb250aW51YXRpb25zLiBJdCBtYWtlcyBpdCB2
ZXJ5IGhhcmQgdG8gcmVhZC4KPiA+PiBTb3JyeSBmb3IgdGhpcyBsYXRlIGNvbW1lbnQuIFRoZXNl
IGNvbW1lbnRzIGxpbmVzIGFyZSBsb25nZXIgdGhhbiA4MAo+ID4+IGFuZCB3cmFwLgo+ID4KPiA+
IE5vbmUgb2YgdGhlIGxpbmVzIGluIHRoaXMgY29tbWl0IGFyZSBvdmVyIDgwIGNoYXJhY3RlcnMg
aW4gY29sdW1uCj4gPiB3aWR0aC4gU29tZSBhcmUgZXhhY3RseSA4MCBjaGFyYWN0ZXJzIChsaWtl
IGFib3ZlKS4KPiA+Cj4gPiBNeSBndWVzcyBpcyB0aGF0IHlvdSBhcmUgc2VlaW5nIHRoZSBkaWZm
IGFkZGVkIHRleHQgKCsgKSwgd2hpY2ggd2hlbgo+ID4geW91IGFkZCB0aGF0IHRvIGEgbGluZSB3
aGljaCBpcyBleGFjdGx5IDgwIGNoYXIgaW4gbGVuZ3RoIGVuZHMgdXAKPiA+IGJlaW5nIG92ZXIg
ODAgY2hhciBpbiBlbWFpbC4gSWYgeW91IGFwcGx5IHRoZSBwYXRjaCB5b3Ugd2lsbCBzZWUgdGhh
dAo+ID4gdGhleSBhcmUgb25seSA4MCBjaGFycy4KPiA+Cj4gPj4KPiA+PiBUaGVyZSBhcmUgc2V2
ZXJhbCBjb21tZW50IGxpbmVzIGluIHRoZSBmaWxlIHRoYXQgYXJlIHdheSB0b28gbG9uZy4KPiA+
Cj4gPiBOb3RlIHRoYXQgY2hlY2twYXRjaCBhbHNvIGRvZXMgbm90IGNvbXBsYWluIGFib3V0IGFu
eSBvdmVyIDgwIGNoYXIKPiA+IGxpbmVzIGluIHRoaXMgZmlsZS4KPiA+Cj4gPiBTb3JyeSBpZiBJ
IGFtIG1pc3VuZGVyc3RhbmRpbmcgd2hhdCB5b3UgYXJlIHRyeWluZyB0byB0ZWxsIG1lLiBQbGVh
c2UKPiA+IGNvbmZpcm0gZWl0aGVyIHdheS4KPiA+Cj4KPiBXQVJOSU5HOiBBdm9pZCB1bm5lY2Vz
c2FyeSBsaW5lIGNvbnRpbnVhdGlvbnMKPiAjMjU4OiBGSUxFOiBpbmNsdWRlL2t1bml0L3Rlc3Qu
aDoxMzc6Cj4gKyAgICAgICAgICAgICAgICAqLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPgo+IHRvdGFsOiAwIGVycm9ycywgMiB3
YXJuaW5ncywgMzg4IGxpbmVzIGNoZWNrZWQKCkFoLCBva2F5IHNvIHlvdSBkb24ndCBsaWtlIHRo
ZSB3YXJuaW5nIGFib3V0IHRoZSBsaW5lIGNvbnRpbnVhdGlvbi4KVGhhdCdzIG5vdCBiZWNhdXNl
IGl0IGlzIG92ZXIgODAgY2hhciwgYnV0IGJlY2F1c2UgdGhlcmUgaXMgYSBsaW5lCmNvbnRpbnVh
dGlvbiBhZnRlciBhIGNvbW1lbnQuIEkgZG9uJ3QgcmVhbGx5IHNlZSBhIHdheSB0byBnZXQgcmlk
IG9mCml0IHdpdGhvdXQgcmVtb3ZpbmcgdGhlIGNvbW1lbnQgZnJvbSBpbnNpZGUgdGhlIG1hY3Jv
LgoKSSBwdXQgdGhpcyBUT0RPIHRoZXJlIGluIHRoZSBmaXJzdCBwbGFjZSBhIEx1aXMnIHJlcXVl
c3QsIGFuZCBJIHB1dCBpdAppbiB0aGUgYm9keSBvZiB0aGUgbWFjcm8gYmVjYXVzZSB0aGlzIG1h
Y3JvIGFscmVhZHkgaGFkIGEga2VybmVsLWRvYwpjb21tZW50IGFuZCBJIGRpZG4ndCB0aGluayB0
aGF0IGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBUT0RPIGJlbG9uZ2VkCmluIHRoZSB1c2VyIGRv
Y3VtZW50YXRpb24uCgo+IEdvIGFoZWFkIGZpeCB0aGVzZS4gSXQgYXBwZWFycyB0aGVyZSBhcmUg
ZmV3IGxpbmVzIHRoYXQgZWl0aGVyIGxvbmdlcgo+IHRoYW4gODAuIEluIGdlbmVyYWwsIEkga2Vl
cCB0aGVtIGFyb3VuZCA3NSwgc28gaXQgaXMgZWFzaWVyIHJlYWQuCgpTb3JyeSwgdGhlIGFib3Zl
IGlzIHRoZSBvbmx5IGNoZWNrcGF0Y2ggd2FybmluZyBvdGhlciB0aGFuIHRoZQpyZW1pbmRlciB0
byB1cGRhdGUgdGhlIE1BSU5UQUlORVJTIGZpbGUuCgpBcmUgeW91IHNheWluZyB5b3Ugd2FudCBt
ZSB0byBnbyB0aHJvdWdoIGFuZCBtYWtlIGFsbCB0aGUgbGluZXMgZml0IGluCjc1IGNoYXIgY29s
dW1uIHdpZHRoPyBJIGhvcGUgbm90IGJlY2F1c2UgdGhhdCBpcyBnb2luZyB0byBiZSBhIHByZXR0
eQpzdWJzdGFudGlhbCBjaGFuZ2UgdG8gbWFrZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
