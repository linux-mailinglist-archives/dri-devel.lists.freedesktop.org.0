Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EBB1C824
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 14:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B53E89298;
	Tue, 14 May 2019 12:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D164889298
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 12:05:18 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id b3so12771548iob.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 05:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cCt7Fv9PrSN+POfdDA9BhvmV9/m6Z9B8cT0V9l7bcU=;
 b=JrnKU55NNEd4T6kPun3fHfJ2TCK0MM33z/mrro3HiTj7JDKVDNkRhHDJb0Rb5ARYD8
 DbyqkJZY57wyETrvya9watW44tHffPbvcunCceO1QCwqg0EC1ireQh2WF2SsuXE1jemG
 ecJCX73G5AvyDIXjLQA5tNxWCXhHOkzAwQFM31QZ05sBcTyNjEj/OMHd68ttRjNusISn
 Y584V3PArnEZIhiARWsrETo8X/MeL1aeZ+uSt71CEuzIXQYxHB4W0kF/1B5bTZ9XGTmY
 L4xwxyKvLCJO2mYFi6QFV695yyCkCO5ur8amnCYozfwwvM8WDtovdjnGzcMiXHI5O38C
 wl4w==
X-Gm-Message-State: APjAAAV5+uwUvYaNrQn1QCjFN+Gtwk5l53lQScQ7N+A84zCdpNAicLzr
 Po3tINNprq7bdjMErii7/gKDmjMDuGZlQLVvmcc/qw==
X-Google-Smtp-Source: APXvYqyhBqCsjjVPPpuo20Er/14b4Noh22uMAdPO6o3WUMvHLuILgjBTMJK3Dh0BqwvOEYcjDaa/KDS4xlT8iYcmIUQ=
X-Received: by 2002:a6b:b654:: with SMTP id g81mr3614153iof.34.1557835518050; 
 Tue, 14 May 2019 05:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
 <20190509032017.GA29703@mit.edu>
 <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
 <20190513144451.GQ17751@phenom.ffwll.local>
 <20190514060433.GA181462@google.com>
In-Reply-To: <20190514060433.GA181462@google.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 14 May 2019 14:05:05 +0200
Message-ID: <CAKMK7uHqtSF_sazJTbFL+xmQJRk4iwukCKZHoDHhsKkLXk=ECQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3cCt7Fv9PrSN+POfdDA9BhvmV9/m6Z9B8cT0V9l7bcU=;
 b=a7BcpiAa3cXS6NukeVFgCH7xf3ARmd8J6e/ULZ0a8xqTBwTNaq+N8QguChZh3uzW7f
 kWHSY7qQUZbeMlUwXYdXunYt1ZQd2SKBDUTXd3jKW+KmrJ1DqqIRVtLYOVb1f+tEQL2N
 W7DqiSEqrT+k9VDAEFt9iTN+c6I6bW1EG18JM=
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
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-nvdimm@lists.01.org,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org,
 Tim.Bird@sony.com, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 sboyd@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgODowNCBBTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6
NDQ6NTFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFNhdCwgTWF5IDExLCAy
MDE5IGF0IDAxOjMzOjQ0UE0gLTA0MDAsIFRoZW9kb3JlIFRzJ28gd3JvdGU6Cj4gPiA+IE9uIEZy
aSwgTWF5IDEwLCAyMDE5IGF0IDAyOjEyOjQwUE0gLTA3MDAsIEZyYW5rIFJvd2FuZCB3cm90ZToK
PiA+ID4gPiBIb3dldmVyLCB0aGUgcmVwbHkgaXMgaW5jb3JyZWN0LiAgS3NlbGZ0ZXN0IGluLWtl
cm5lbCB0ZXN0cyAod2hpY2gKPiA+ID4gPiBpcyB0aGUgY29udGV4dCBoZXJlKSBjYW4gYmUgY29u
ZmlndXJlZCBhcyBidWlsdCBpbiBpbnN0ZWFkIG9mIGFzCj4gPiA+ID4gYSBtb2R1bGUsIGFuZCBi
dWlsdCBpbiBhIFVNTCBrZXJuZWwuICBUaGUgVU1MIGtlcm5lbCBjYW4gYm9vdCwKPiA+ID4gPiBy
dW5uaW5nIHRoZSBpbi1rZXJuZWwgdGVzdHMgYmVmb3JlIFVNTCBhdHRlbXB0cyB0byBpbnZva2Ug
dGhlCj4gPiA+ID4gaW5pdCBwcm9jZXNzLgo+ID4gPgo+ID4gPiBVbSwgQ2l0YXRpb24gbmVlZGVk
Pwo+ID4gPgo+ID4gPiBJIGRvbid0IHNlZSBhbnkgZXZpZGVuY2UgZm9yIHRoaXMgaW4gdGhlIGtz
ZWxmdGVzdCBkb2N1bWVudGF0aW9uLCBub3IKPiA+ID4gZG8gSSBzZWUgYW55IGV2aWRlbmNlIG9m
IHRoaXMgaW4gdGhlIGtzZWxmdGVzdCBNYWtlZmlsZXMuCj4gPiA+Cj4gPiA+IFRoZXJlIGV4aXN0
cyB0ZXN0IG1vZHVsZXMgaW4gdGhlIGtlcm5lbCB0aGF0IHJ1biBiZWZvcmUgdGhlIGluaXQKPiA+
ID4gc2NyaXB0cyBydW4gLS0tIGJ1dCB0aGF0J3Mgbm90IHN0cmljdGx5IHNwZWFraW5nIHBhcnQg
b2Yga3NlbGZ0ZXN0cywKPiA+ID4gYW5kIGRvIG5vdCBoYXZlIGFueSBraW5kIG9mIGluZnJhc3Ry
dWN0dXJlLiAgQXMgbm90ZWQsIHRoZQo+ID4gPiBrc2VsZnRlc3RzX2hhcm5lc3MgaGVhZGVyIGZp
bGUgZnVuZGFtZW50YWxseSBhc3N1bWVzIHRoYXQgeW91IGFyZQo+ID4gPiBydW5uaW5nIHRlc3Qg
Y29kZSBpbiB1c2Vyc3BhY2UuCj4gPgo+ID4gWWVhaCBJIHJlYWxseSBsaWtlIHRoZSAibm8gdXNl
cnNwYWNlIHJlcXVpcmVkIGF0IGFsbCIgZGVzaWduIG9mIGt1bml0LAo+ID4gd2hpbGUgc3RpbGwg
Y29sbGVjdGluZyByZXN1bHRzIGluIGEgd2VsbC1kZWZpbmVkIHdheSAodW5sZXNzIHRoZSBjdXJy
ZW50Cj4gPiBzZWxmLXRlc3QgdGhhdCBqdXN0IHJ1biB3aGVuIHlvdSBsb2FkIHRoZSBtb2R1bGUs
IHdpdGggbWF5YmUgc29tZQo+ID4ga3NlbGZ0ZXN0IGFkLWhvYyB3cmFwcGVyIGFyb3VuZCB0byBj
b2xsZWN0IHRoZSByZXN1bHRzKS4KPiA+Cj4gPiBXaGF0IEkgd2FudCB0byBkbyBsb25nLXRlcm0g
aXMgdG8gcnVuIHRoZXNlIGtlcm5lbCB1bml0IHRlc3RzIGFzIHBhcnQgb2YKPiA+IHRoZSBidWls
ZC10ZXN0aW5nLCBtb3N0IGxpa2VseSBpbiBnaXRsYWIgKHNvb25lciBvciBsYXRlciwgZm9yIGRy
bS5naXQKPgo+IFRvdGFsbHkhIFRoaXMgaXMgcGFydCBvZiB0aGUgcmVhc29uIEkgaGF2ZSBiZWVu
IGluc2lzdGluZyBvbiBhIG1pbmltdW0KPiBvZiBVTUwgY29tcGF0aWJpbGl0eSBmb3IgYWxsIHVu
aXQgdGVzdHMuIElmIHlvdSBjYW4gc3VmZmllbnRseSBjb25zdHJhaW4KPiB0aGUgZW52aXJvbm1l
bnQgdGhhdCBpcyByZXF1aXJlZCBmb3IgdGVzdHMgdG8gcnVuIGluLCBpdCBtYWtlcyBpdCBtdWNo
Cj4gZWFzaWVyIG5vdCBvbmx5IGZvciBhIGh1bWFuIHRvIHJ1biB5b3VyIHRlc3RzLCBidXQgaXQg
YWxzbyBtYWtlcyBpdCBhCj4gbG90IGVhc2llciBmb3IgYW4gYXV0b21hdGVkIHNlcnZpY2UgdG8g
YmUgYWJsZSB0byBydW4geW91ciB0ZXN0cy4KPgo+IEkgYWN0dWFsbHkgaGF2ZSBhIHByb3RvdHlw
ZSBwcmVzdWJtaXQgYWxyZWFkeSB3b3JraW5nIG9uIG15Cj4gInN0YWJsZS9ub24tdXBzdHJlYW0i
IGJyYW5jaC4gWW91IGNhbiBjaGVja291dCB3aGF0IHByZXN1Ym1pdCByZXN1bHRzCj4gbG9vayBs
aWtlIGhlcmVbMV1bMl0uCgp1ZyBnZXJyaXQgOi0pCgo+ID4gb25seSBvZmMpLiBTbyB0aGF0IHBl
b3BsZSBnZXQgdGhlaXIgcHVsbCByZXF1ZXN0cyAoYW5kIHBhdGNoIHNlcmllcywgd2UKPiA+IGhh
dmUgc29tZSBpZGVhcyB0byB0aWUgdGhpcyBpbnRvIHBhdGNod29yaykgYXV0b21hdGljYWxseSB0
ZXN0ZWQgZm9yIHRoaXMKPgo+IE1pZ2h0IHRoYXQgYmUgU25vd3BhdGNoWzNdPyBJIHRhbGtlZCB0
byBSdXNzZWxsLCB0aGUgY3JlYXRvciBvZiBTbm93cGF0Y2gsCj4gYW5kIGhlIHNlZW1lZCBwcmV0
dHkgb3BlbiB0byBjb2xsYWJvcmF0aW9uLgo+Cj4gQmVmb3JlIEkgaGVhcmQgYWJvdXQgU25vd3Bh
dGNoLCBJIGhhZCBhbiBpbnRlcm4gd3JpdGUgYSB0cmFuc2xhdGlvbgo+IGxheWVyIHRoYXQgbWFk
ZSBQcm93ICh0aGUgcHJlc3VibWl0IHNlcnZpY2UgdGhhdCBJIHVzZWQgaW4gdGhlIHByb3RvdHlw
ZQo+IGFib3ZlKSB3b3JrIHdpdGggTEtNTFs0XS4KClRoZXJlJ3MgYWJvdXQgMy00IGZvcmtzL2Ns
b25lcyBvZiBwYXRjaHdvcmsuIHNub3dwYXRjaCBpcyBvbmUsIHdlIGhhdmUKYSBkaWZmZXJlbnQg
b25lIG9uIGZyZWVkZXNrdG9wLm9yZy4gSXQncyBhIGJpdCBhIG1lc3MgOi0vCgo+IEkgYW0gbm90
IG1hcnJpZWQgdG8gZWl0aGVyIGFwcHJvYWNoLCBidXQgSSB0aGluayBiZXR3ZWVuIHRoZSB0d28g
b2YKPiB0aGVtLCBtb3N0IG9mIHRoZSBpbml0aWFsIGxlZ3dvcmsgaGFzIGJlZW4gZG9uZSB0byBt
YWtlIHByZXN1Ym1pdCBvbgo+IExLTUwgYSByZWFsaXR5LgoKV2UgZG8gaGF2ZSBwcmVzdWJtaXQg
Q0kgd29ya2luZyBhbHJlYWR5IHdpdGggb3VyIGZyZWVkZXNrdG9wLm9yZwpwYXRjaHdvcmsuIFRo
ZSBtaXNzaW5nIGdsdWUgaXMganVzdCB0eWluZyB0aGF0IGludG8gZ2l0bGFiIENJIHNvbWVob3cK
KHNpbmNlIHdlIHdhbnQgdG8gdW5pZnkgYnVpbGQgdGVzdGluZyBtb3JlIGFuZCBtYWtlIGl0IGVh
c2llciBmb3IKY29udHJpYnV0b3JzIHRvIGFkanVzdCB0aGluZ3MpLgotRGFuaWVsCgo+ID4gc3Vw
ZXIgYmFzaWMgc3R1ZmYuCj4KPiBJIGFtIHJlYWxseSBleGNpdGVkIHRvIGhlYXIgYmFjayBvbiB3
aGF0IHlvdSB0aGluayEKPgo+IENoZWVycyEKPgo+IFsxXSBodHRwczovL2t1bml0LXJldmlldy5n
b29nbGVzb3VyY2UuY29tL2MvbGludXgvKy8xNTA5LzEwI21lc3NhZ2UtN2JmYTQwZWZiMTMyZTE1
YzgzODg3NTVjMjczODM3NTU5OTExNDI1Ywo+IFsyXSBodHRwczovL2t1bml0LXJldmlldy5nb29n
bGVzb3VyY2UuY29tL2MvbGludXgvKy8xNTA5LzEwI21lc3NhZ2UtYTY3ODQ0OTZlYWZmZjQ0MmFj
OThmYjA2OGJmMWEwZjM2ZWU3MzUwOQo+IFszXSBodHRwczovL2RldmVsb3Blci5pYm0uY29tL29w
ZW4vcHJvamVjdHMvc25vd3BhdGNoLwo+IFs0XSBodHRwczovL2t1bml0Lmdvb2dsZXNvdXJjZS5j
b20vcHJvdy1sa21sLwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
