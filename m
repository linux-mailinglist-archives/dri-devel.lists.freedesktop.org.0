Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE496D9B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F421E6E8D8;
	Tue, 20 Aug 2019 23:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DE46E8D8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:23:37 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c2so225291plz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BgeboBXYdH2mwUYNdA3OBv6wqHBTlo9IT3Q8RNantq8=;
 b=oas/tov8+HiGQkttfK4X4MwgJk5XscdoUwf5wyYVTB/8ocmm5sOWFGUA5ahx44sIcz
 zbnWv0qIRUTlIoSjTCzevA0Bzbpkz+UpI/uADiK1g4u22OjmO4/rKBrE3K3BzVGhRmBl
 dc1NTUrgVAA9ZhtJ2bL0v2T5QUwReLR4z8YrSDn+pkjYxj6oN1hH9M1G59V9xldXDhth
 bzaz/CRbhT043aGMM3bzKafiCB5hFSNMu0OugLArh2722Dgl9TTQEmLJKegtCz9VL/DP
 GB0lLDsalfWZqJkxeHfgSzT2SXbSRBuXZa19fpECcxNWrOGCVv9bXzZ3/MTJgmX1q+/v
 DFzA==
X-Gm-Message-State: APjAAAWyuz7rLeOmiy+lQkn89kkHrXgRAlL9w/xeNN/ZJRcLU58zHhVj
 NciwS3qRk5DrmXWBQTlK3n5ZMskGFxjcRAkhbgmsnw==
X-Google-Smtp-Source: APXvYqxXREKtyoSmqThzifpm0xupcZJncgCG4zF1cdnP+ZHsoxUg77sjBGnyRvdHt5/5lrCrktItt1lg4/mEcxF/N4g=
X-Received: by 2002:a17:902:7049:: with SMTP id
 h9mr31488817plt.232.1566343416854; 
 Tue, 20 Aug 2019 16:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
 <20190820182450.GA38078@google.com>
 <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
 <CAFd5g44JT_KQ+OxjVdG0qMWuaEB0Zq5x=r6tLsqJdncwZ_zbGA@mail.gmail.com>
In-Reply-To: <CAFd5g44JT_KQ+OxjVdG0qMWuaEB0Zq5x=r6tLsqJdncwZ_zbGA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 20 Aug 2019 16:23:25 -0700
Message-ID: <CAFd5g44aO40G7Wc-51EPyhWZgosN4ZHwwSjKe7CU_vi2OD7eKA@mail.gmail.com>
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BgeboBXYdH2mwUYNdA3OBv6wqHBTlo9IT3Q8RNantq8=;
 b=Rni4clsu++7h96C43S+JbBXXkW3gKlVOYt85WpUO9PVUNOQAyZoV9ZeqzedJ1OVMFx
 8rIO1yErMiuPpLQ9sjtVMHG1jFX4fJklQ/PjHt12vwHBikcFbmL+JH4XebCtdX0yR6Ne
 /Ku/wtLkEaRcfVrBLNhoOWWl506znCj2wEM8/+jrC4flwkKt3STFQoP7x3bxbt5r7719
 hdp/sy/7uU7ZgdFgwJ1AO9EAvZQT6mQ9FyOhMFksTEDFwGUKQRR3mFtVrfEUr8Q5ksgi
 nF8kmhxSBCnQuM25k/D9rldBfN5XmkaaeL1KNxMPXXyinqbNL7GUBH09SVaM/WlOuE59
 VQIw==
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
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMjoyNiBQTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTI6
MDggUE0gc2h1YWggPHNodWFoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIDgvMjAvMTkg
MTI6MjQgUE0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ID4gT24gVHVlLCBBdWcgMjAsIDIw
MTkgYXQgMTE6MjQ6NDVBTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4gPiA+PiBPbiA4LzEzLzE5IDEx
OjUwIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiA+Pj4gIyMgVEw7RFIKPiA+ID4+Pgo+
ID4gPj4+IFRoaXMgcmV2aXNpb24gYWRkcmVzc2VzIGNvbW1lbnRzIGZyb20gU3RlcGhlbiBhbmQg
Qmpvcm4gSGVsZ2Fhcy4gTW9zdAo+ID4gPj4+IGNoYW5nZXMgYXJlIHByZXR0eSBtaW5vciBzdHVm
ZiB0aGF0IGRvZXNuJ3QgYWZmZWN0IHRoZSBBUEkgaW4gYW55d2F5Lgo+ID4gPj4+IE9uZSBzaWdu
aWZpY2FudCBjaGFuZ2UsIGhvd2V2ZXIsIGlzIHRoYXQgSSBhZGRlZCBzdXBwb3J0IGZvciBmcmVl
aW5nCj4gPiA+Pj4ga3VuaXRfcmVzb3VyY2UgbWFuYWdlZCByZXNvdXJjZXMgYmVmb3JlIHRoZSB0
ZXN0IGNhc2UgaXMgZmluaXNoZWQgdmlhCj4gPiA+Pj4ga3VuaXRfcmVzb3VyY2VfZGVzdHJveSgp
LiBBZGRpdGlvbmFsbHksIEJqb3JuIHBvaW50ZWQgb3V0IHRoYXQgSSBicm9rZQo+ID4gPj4+IEtV
bml0IG9uIGNlcnRhaW4gY29uZmlndXJhdGlvbnMgKGxpa2UgdGhlIGRlZmF1bHQgb25lIGZvciB4
ODYsIHdob29wcykuCj4gPiA+Pj4KPiA+ID4+PiBCYXNlZCBvbiBTdGVwaGVuJ3MgZmVlZGJhY2sg
b24gdGhlIHByZXZpb3VzIGNoYW5nZSwgSSB0aGluayB3ZSBhcmUKPiA+ID4+PiBwcmV0dHkgY2xv
c2UuIEkgYW0gbm90IGV4cGVjdGluZyBhbnkgc2lnbmlmaWNhbnQgY2hhbmdlcyBmcm9tIGhlcmUg
b24KPiA+ID4+PiBvdXQuCj4gPiA+Pj4KPiA+ID4+Cj4gPiA+PiBIaSBCcmVuZGFuLAo+ID4gPj4K
PiA+ID4+IEkgZm91bmQgY2hlY2twYXRjaCBlcnJvcnMgaW4gb25lIG9yIHR3byBwYXRjaGVzLiBD
YW4geW91IGZpeCB0aG9zZSBhbmQKPiA+ID4+IHNlbmQgdjE0Lgo+ID4gPgo+ID4gPiBIaSBTaHVh
aCwKPiA+ID4KPiA+ID4gQXJlIHlvdSByZWZlcmluZyB0byB0aGUgZm9sbG93aW5nIGVycm9ycz8K
PiA+ID4KPiA+ID4gRVJST1I6IE1hY3JvcyB3aXRoIGNvbXBsZXggdmFsdWVzIHNob3VsZCBiZSBl
bmNsb3NlZCBpbiBwYXJlbnRoZXNlcwo+ID4gPiAjMTQ0OiBGSUxFOiBpbmNsdWRlL2t1bml0L3Rl
c3QuaDo0NTY6Cj4gPiA+ICsjZGVmaW5lIEtVTklUX0JJTkFSWV9DTEFTUyBcCj4gPiA+ICsgICAg
ICAga3VuaXRfYmluYXJ5X2Fzc2VydCwgS1VOSVRfSU5JVF9CSU5BUllfQVNTRVJUX1NUUlVDVAo+
ID4gPgo+ID4gPiBFUlJPUjogTWFjcm9zIHdpdGggY29tcGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVu
Y2xvc2VkIGluIHBhcmVudGhlc2VzCj4gPiA+ICMxNDY6IEZJTEU6IGluY2x1ZGUva3VuaXQvdGVz
dC5oOjQ1ODoKPiA+ID4gKyNkZWZpbmUgS1VOSVRfQklOQVJZX1BUUl9DTEFTUyBcCj4gPiA+ICsg
ICAgICAga3VuaXRfYmluYXJ5X3B0cl9hc3NlcnQsIEtVTklUX0lOSVRfQklOQVJZX1BUUl9BU1NF
UlRfU1RSVUNUCj4gPiA+Cj4gPiA+IFRoZXNlIHZhbHVlcyBzaG91bGQgKm5vdCogYmUgaW4gcGFy
ZW50aGVzZXMuIEkgYW0gZ3Vlc3NpbmcgY2hlY2twYXRjaCBpcwo+ID4gPiBnZXR0aW5nIGNvbmZ1
c2VkIGFuZCB0aGlua3MgdGhhdCB0aGVzZSBhcmUgY29tcGxleCBleHByZXNzaW9ucywgd2hlbgo+
ID4gPiB0aGV5IGFyZSBub3QuCj4gPiA+Cj4gPiA+IEkgaWdub3JlZCB0aGUgZXJyb3JzIHNpbmNl
IEkgZmlndXJlZCBjaGVja3BhdGNoIHdhcyBjb21wbGFpbmluZwo+ID4gPiBlcnJvbmVvdXNseS4K
PiA+ID4KPiA+ID4gSSBjb3VsZCByZWZhY3RvciB0aGUgY29kZSB0byByZW1vdmUgdGhlc2UgbWFj
cm9zIGVudGlyZWx5LCBidXQgSSB0aGluawo+ID4gPiB0aGUgY29kZSBpcyBjbGVhbmVyIHdpdGgg
dGhlbS4KPiA+ID4KPiA+Cj4gPiBQbGVhc2UgZG8uIEkgYW0gbm90IHZlcnUgc3VyZSB3aGF0IHZh
bHVlIHRoZXNlIG1hY3JvcyBhZGQuCj4KPiBBbHJpZ2h0LCBJIHdpbGwgaGF2ZSBzb21ldGhpbmcg
Zm9yIHlvdSBsYXRlciB0b2RheS4KCkkganVzdCBzZW50IGEgbmV3IHJldmlzaW9uIHdpdGggdGhl
IGZpeC4KCkNoZWVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
