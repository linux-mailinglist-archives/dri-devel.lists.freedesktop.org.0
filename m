Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E909BBAEF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 20:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F02893D0;
	Mon, 23 Sep 2019 18:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B03893D0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 18:06:31 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w10so6837581plq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 11:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhneKc2j612Q2N+13gaGbKUVRsMhSSxGH7dWRfDGMkM=;
 b=gnz3f0m52GFbyrMj6e6Z5/V18QTqHda0n7cCIePnlnTds+QNWiTcATTRnJn3mn+Gq0
 7HQB1hpY81a4tAJbSRgQVoX2ILm+BPxWVbseqSIsgI+IWN/iv3HE9yVOxeGJYSv3SOsd
 dE5Kaw/3CaMkLfWjjZoU5du+jASatCutVREsQvAhnA3mYWlkOg6lFy7Fi3QQHG/ErWNv
 gpO7ipEVIsvUiilHtWgMWjUyWVwipWkJLAlkNx1YUa1KbcYtHYvVH1IQir32RuPeI4a4
 xPvqhVj40UsjQZd/R1AB/6Qo5zvfT49JcuP+qjJWBNV2u5UokYG8iyIZGHReyC4T9znC
 kTxA==
X-Gm-Message-State: APjAAAV4LfXKEKoNolQVj2i7pWJyNqj5bE1NqpIIgylYzppnTpucqYfd
 M6+oFIRHbkVtmz6ytyVo2uWQ7hr805NW8t3tmP/PaA==
X-Google-Smtp-Source: APXvYqwfsjyOL3n2LFVEPJm/qlWBl4UOe3/cXY8+uFis2YYWhVkjpN1GVmQ/ETS5lMq5TdaURd2f4h4p74UheIpwH8I=
X-Received: by 2002:a17:902:ff0e:: with SMTP id
 f14mr1025347plj.325.1569261990405; 
 Mon, 23 Sep 2019 11:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20190923090249.127984-16-brendanhiggins@google.com>
 <d87eba35-ae09-0c53-bbbe-51ee9dc9531f@infradead.org>
In-Reply-To: <d87eba35-ae09-0c53-bbbe-51ee9dc9531f@infradead.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 23 Sep 2019 11:06:19 -0700
Message-ID: <CAFd5g45y-NWzbn8E8hUg=n4U5E+N6_4D8eCXhQ74Y0N4zqVW=w@mail.gmail.com>
Subject: Re: [PATCH v18 15/19] Documentation: kunit: add documentation for
 KUnit
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nhneKc2j612Q2N+13gaGbKUVRsMhSSxGH7dWRfDGMkM=;
 b=T1+NUcrIy3lmkEWKUYoZizpT4pz7k1bgugAw5x236rFYSY4jiXwwGSkW/t3eTOgxZZ
 BdFUIyPtNrmuOnFW8pMCBh0TOJ0ymwQs3hrr2tpjSwDy/Jn7hGK64HYhWlOR+Pme/Rjs
 q1skpdHUJIQUzoH1STCk8Qg+RNLa+nlemSvf5GuWwDF1JHGzH7MzOgvgGfuUDt1Yjlx+
 jLfCXyd8JabRhAP+sdDZJeube1e/2Pp2+w4UQdEthm0TnALHcGP03fa6VfY8gUFfbf65
 93WWIiL7H75Fl011ZWNdHPF+hL1hlBHne2JyK6E63p3OCh/BSVxvl8asUe8na9vlCXYJ
 Puqg==
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
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgODo0OCBBTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiA5LzIzLzE5IDI6MDIgQU0sIEJyZW5kYW4gSGlnZ2lu
cyB3cm90ZToKPiA+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBLVW5pdCwgdGhlIExpbnV4IGtlcm5l
bCB1bml0IHRlc3RpbmcgZnJhbWV3b3JrLgo+ID4gLSBBZGQgaW50cm8gYW5kIHVzYWdlIGd1aWRl
IGZvciBLVW5pdAo+ID4gLSBBZGQgQVBJIHJlZmVyZW5jZQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEZlbGl4IEd1byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+IENjOiBKb25h
dGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0Pgo+ID4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgt
SGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogTG9n
YW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFN0ZXBo
ZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2
LXRvb2xzL2luZGV4LnJzdCAgICAgICAgICAgfCAgIDEgKwo+ID4gIERvY3VtZW50YXRpb24vZGV2
LXRvb2xzL2t1bml0L2FwaS9pbmRleC5yc3QgfCAgMTYgKwo+ID4gIERvY3VtZW50YXRpb24vZGV2
LXRvb2xzL2t1bml0L2FwaS90ZXN0LnJzdCAgfCAgMTEgKwo+ID4gIERvY3VtZW50YXRpb24vZGV2
LXRvb2xzL2t1bml0L2ZhcS5yc3QgICAgICAgfCAgNjIgKysrCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXYtdG9vbHMva3VuaXQvaW5kZXgucnN0ICAgICB8ICA3OSArKysKPiA+ICBEb2N1bWVudGF0aW9u
L2Rldi10b29scy9rdW5pdC9zdGFydC5yc3QgICAgIHwgMTgwICsrKysrKwo+ID4gIERvY3VtZW50
YXRpb24vZGV2LXRvb2xzL2t1bml0L3VzYWdlLnJzdCAgICAgfCA1NzYgKysrKysrKysrKysrKysr
KysrKysKPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDkyNSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L2FwaS9pbmRleC5yc3QK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvYXBp
L3Rlc3QucnN0Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2LXRvb2xz
L2t1bml0L2ZhcS5yc3QKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXYt
dG9vbHMva3VuaXQvaW5kZXgucnN0Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2LXRvb2xzL2t1bml0L3N0YXJ0LnJzdAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QKPgo+Cj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvc3RhcnQucnN0IGIvRG9jdW1lbnRhdGlvbi9k
ZXYtdG9vbHMva3VuaXQvc3RhcnQucnN0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi42ZGMyMjllNDZiYjMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L3N0YXJ0LnJzdAo+ID4gQEAgLTAsMCArMSwx
ODAgQEAKPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKwo+ID4g
Kz09PT09PT09PT09PT09PQo+ID4gK0dldHRpbmcgU3RhcnRlZAo+ID4gKz09PT09PT09PT09PT09
PQo+ID4gKwo+ID4gK0luc3RhbGxpbmcgZGVwZW5kZW5jaWVzCj4gPiArPT09PT09PT09PT09PT09
PT09PT09PT0KPiA+ICtLVW5pdCBoYXMgdGhlIHNhbWUgZGVwZW5kZW5jaWVzIGFzIHRoZSBMaW51
eCBrZXJuZWwuIEFzIGxvbmcgYXMgeW91IGNhbiBidWlsZAo+ID4gK3RoZSBrZXJuZWwsIHlvdSBj
YW4gcnVuIEtVbml0Lgo+ID4gKwo+ID4gK0tVbml0IFdyYXBwZXIKPiA+ICs9PT09PT09PT09PT09
Cj4gPiArSW5jbHVkZWQgd2l0aCBLVW5pdCBpcyBhIHNpbXBsZSBQeXRob24gd3JhcHBlciB0aGF0
IGhlbHBzIGZvcm1hdCB0aGUgb3V0cHV0IHRvCj4gPiArZWFzaWx5IHVzZSBhbmQgcmVhZCBLVW5p
dCBvdXRwdXQuIEl0IGhhbmRsZXMgYnVpbGRpbmcgYW5kIHJ1bm5pbmcgdGhlIGtlcm5lbCwgYXMK
PiA+ICt3ZWxsIGFzIGZvcm1hdHRpbmcgdGhlIG91dHB1dC4KPiA+ICsKPiA+ICtUaGUgd3JhcHBl
ciBjYW4gYmUgcnVuIHdpdGg6Cj4gPiArCj4gPiArLi4gY29kZS1ibG9jazo6IGJhc2gKPiA+ICsK
PiA+ICsgICAuL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXQucHkgcnVuCj4gPiArCj4gPiArQ3Jl
YXRpbmcgYSBrdW5pdGNvbmZpZwo+ID4gKz09PT09PT09PT09PT09PT09PT09PT0KPiA+ICtUaGUg
UHl0aG9uIHNjcmlwdCBpcyBhIHRoaW4gd3JhcHBlciBhcm91bmQgS2J1aWxkIGFzIHN1Y2gsIGl0
IG5lZWRzIHRvIGJlCj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
cm91bmQgS2J1aWxkLiBBcyBzdWNoLAoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4KCj4K
PiA+ICtjb25maWd1cmVkIHdpdGggYSBgYGt1bml0Y29uZmlnYGAgZmlsZS4gVGhpcyBmaWxlIGVz
c2VudGlhbGx5IGNvbnRhaW5zIHRoZQo+ID4gK3JlZ3VsYXIgS2VybmVsIGNvbmZpZywgd2l0aCB0
aGUgc3BlY2lmaWMgdGVzdCB0YXJnZXRzIGFzIHdlbGwuCj4gPiArCj4gPiArLi4gY29kZS1ibG9j
azo6IGJhc2gKPiA+ICsKPiA+ICsgICAgIGdpdCBjbG9uZSAtYiBtYXN0ZXIgaHR0cHM6Ly9rdW5p
dC5nb29nbGVzb3VyY2UuY29tL2t1bml0Y29uZmlnICRQQVRIX1RPX0tVTklUQ09ORklHX1JFUE8K
PiA+ICsgICAgIGNkICRQQVRIX1RPX0xJTlVYX1JFUE8KPiA+ICsgICAgIGxuIC1zICRQQVRIX1RP
X0tVTklUX0NPTkZJR19SRVBPL2t1bml0Y29uZmlnIGt1bml0Y29uZmlnCj4gPiArCj4gPiArWW91
IG1heSB3YW50IHRvIGFkZCBrdW5pdGNvbmZpZyB0byB5b3VyIGxvY2FsIGdpdGlnbm9yZS4KPiA+
ICsKPiA+ICtWZXJpZnlpbmcgS1VuaXQgV29ya3MKPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiA+ICsKPiA+ICtUbyBtYWtlIHN1cmUgdGhhdCBldmVyeXRoaW5nIGlzIHNldCB1cCBjb3JyZWN0
bHksIHNpbXBseSBpbnZva2UgdGhlIFB5dGhvbgo+ID4gK3dyYXBwZXIgZnJvbSB5b3VyIGtlcm5l
bCByZXBvOgo+ID4gKwo+ID4gKy4uIGNvZGUtYmxvY2s6OiBiYXNoCj4gPiArCj4gPiArICAgICAu
L3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXQucHkKPiA+ICsKPiA+ICsuLiBub3RlOjoKPiA+ICsg
ICBZb3UgbWF5IHdhbnQgdG8gcnVuIGBgbWFrZSBtcnByb3BlcmBgIGZpcnN0Lgo+Cj4gSSBub3Jt
YWxseSB1c2UgTz1idWlsZGRpciB3aGVuIGJ1aWxkaW5nIGtlcm5lbHMuCj4gRG9lcyB0aGlzIHN1
cHBvcnQgdXNpbmcgTz1idWlsZGRpciA/CgpZZXAsIGl0IHN1cHBvcnRzIHNwZWNpZnlpbmcgYSBz
ZXBhcmF0ZSBidWlsZCBkaXJlY3RvcnkuCgo+ID4gKwo+ID4gK0lmIGV2ZXJ5dGhpbmcgd29ya2Vk
IGNvcnJlY3RseSwgeW91IHNob3VsZCBzZWUgdGhlIGZvbGxvd2luZzoKPiA+ICsKPiA+ICsuLiBj
b2RlLWJsb2NrOjogYmFzaAo+ID4gKwo+ID4gKyAgICAgR2VuZXJhdGluZyAuY29uZmlnIC4uLgo+
ID4gKyAgICAgQnVpbGRpbmcgS1VuaXQgS2VybmVsIC4uLgo+ID4gKyAgICAgU3RhcnRpbmcgS1Vu
aXQgS2VybmVsIC4uLgo+ID4gKwo+ID4gK2ZvbGxvd2VkIGJ5IGEgbGlzdCBvZiB0ZXN0cyB0aGF0
IGFyZSBydW4uIEFsbCBvZiB0aGVtIHNob3VsZCBiZSBwYXNzaW5nLgo+ID4gKwo+ID4gKy4uIG5v
dGU6Ogo+ID4gKyAgIEJlY2F1c2UgaXQgaXMgYnVpbGRpbmcgYSBsb3Qgb2Ygc291cmNlcyBmb3Ig
dGhlIGZpcnN0IHRpbWUsIHRoZSBgYEJ1aWxkaW5nCj4gPiArICAga3VuaXQga2VybmVsYGAgc3Rl
cCBtYXkgdGFrZSBhIHdoaWxlLgo+ID4gKwo+ID4gK1dyaXRpbmcgeW91ciBmaXJzdCB0ZXN0Cj4g
PiArPT09PT09PT09PT09PT09PT09PT09PT0KPgo+IFtzbmlwXQo+Cj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvdXNhZ2UucnN0IGIvRG9jdW1lbnRhdGlvbi9k
ZXYtdG9vbHMva3VuaXQvdXNhZ2UucnN0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5jNmU2OTYzNGUyNzQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L3VzYWdlLnJzdAo+Cj4gVEJELi4uCgpXaGF0
IGRpZCB5b3UgbWVhbiBieSB0aGlzIGNvbW1lbnQ/CgpDaGVlcnMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
