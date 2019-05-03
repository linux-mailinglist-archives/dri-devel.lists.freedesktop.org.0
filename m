Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5A125A3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 02:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2336789363;
	Fri,  3 May 2019 00:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0F489363
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 00:41:21 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t184so3154196oie.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 17:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i/LGIUMFfkHhxCSDT3fm51UOA28cPrGRFTawiLz9qdU=;
 b=Fl3MqlbYkuyCggoemolmoXqW5D2hsUhF1uG2ZDXioNCtwdufrp40lMWJNKJGWXeiG7
 T3RJAdcSlqDO+jIycQpcj0dozNO3N63flyE4rIpuow88Ddap0etxfyg9pMo4PvImxRKS
 q/ryavqlZalAt5HqNj5N8z2moxrSlzhxUkZFbEZFLgYm3XyUUKJkVm/VR7xTiXYYlDOm
 phtWWWyVsm5xXEL3moC62lJ8WXPeRC84Ksr8txI7ojf7HKn1/Bpd6MneRY5yW8aeHkBV
 y4B7tapT1jP84d4V/4hc5lIBx2OZBEH6+JeZEfks9pfe4jyJEuU6M4s+nmA/QxhbiSjt
 yrSw==
X-Gm-Message-State: APjAAAVtyV2443tz+Kh0TE/yD7wHS8GC4OzlxPs8Wsj8EJPC1qUEfVYO
 aWtp1XUN7qEBteSvmkFgihHwTvJkvyxjVZ4bdNAK7g==
X-Google-Smtp-Source: APXvYqx+IeNo/M2uU5es7ZAJsOSGR6b01vZ0dEQaWTEj9cNFRVwEHLuSMfXDE/OIHXARFXXWqbF1LQIlh8BGLZyE6Eo=
X-Received: by 2002:aca:4586:: with SMTP id s128mr4126147oia.148.1556844080319; 
 Thu, 02 May 2019 17:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com> <20190502110513.GF12416@kroah.com>
In-Reply-To: <20190502110513.GF12416@kroah.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 2 May 2019 17:41:08 -0700
Message-ID: <CAFd5g46RyQ+jaV3bDejBaeca4Yv3G9ppT5JxdKqZw6PSbiSDYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=i/LGIUMFfkHhxCSDT3fm51UOA28cPrGRFTawiLz9qdU=;
 b=FJIAYLW9LNf9oanARKl7TfF4hN+5D95QZaw548QJynu0CjT8BCwlpKeraO6t9YYkOs
 GtNX3/gAG5EXPOJwbqEw8XIrwSSwlKCrob0M1UGIcbcgu72bFgtpR14EttoAsQY2aDgu
 R3g2UNQXhcb3FGDMQxi+sYsTRkYHs3qzvEqqHMGSEtbYKM2QA4nxdIkJahuLnsBoO2+c
 TGr8njZSgd2pD66c4pynpYDwYtRx3F05qDNXkbRYRi3lANeuXFpYdvOTMjhMHRrrhF8P
 3i1MCfzjUMz11YJpZRIR9WsEPFVnmwGmtj8MUe4JYxQcAMMsvhz5BhNLX+0hNU5ukE4d
 83hA==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA0OjA1IEFNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDAyLCAyMDE5IGF0IDEyOjUwOjUzUE0g
KzAyMDAsIEdyZWcgS0ggd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAwNDowMTow
OVBNIC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiA+ICMjIFRMRFIKPiA+ID4KPiA+
ID4gSSByZWJhc2VkIHRoZSBsYXN0IHBhdGNoc2V0IG9uIDUuMS1yYzcgaW4gaG9wZXMgdGhhdCB3
ZSBjYW4gZ2V0IHRoaXMgaW4KPiA+ID4gNS4yLgo+ID4KPiA+IFRoYXQgbWlnaHQgYmUgcnVzaGlu
ZyBpdCwgbm9ybWFsbHkgdHJlZXMgYXJlIGFscmVhZHkgY2xvc2VkIG5vdyBmb3IKPiA+IDUuMi1y
YzEgaWYgNS4xLWZpbmFsIGNvbWVzIG91dCB0aGlzIFN1bmRheS4KPiA+Cj4gPiA+IFNodWFoLCBJ
IHRoaW5rIHlvdSwgR3JlZyBLSCwgYW5kIG15c2VsZiB0YWxrZWQgb2ZmIHRocmVhZCwgYW5kIHdl
IGFncmVlZAo+ID4gPiB3ZSB3b3VsZCBtZXJnZSB0aHJvdWdoIHlvdXIgdHJlZSB3aGVuIHRoZSB0
aW1lIGNhbWU/IEFtIEkgcmVtZW1iZXJpbmcKPiA+ID4gY29ycmVjdGx5Pwo+ID4KPiA+IE5vIG9i
amVjdGlvbiBmcm9tIG1lLgo+ID4KPiA+IExldCBtZSBnbyByZXZpZXcgdGhlIGxhdGVzdCByb3Vu
ZCBvZiBwYXRjaGVzIG5vdy4KPgo+IE92ZXJhbGwsIGxvb2tzIGdvb2QgdG8gbWUsIGFuZCBwcm92
aWRlcyBhIGZyYW1ld29yayB3ZSBjYW4gYnVpbGQgb24uCj4gSSdtIGEgYml0IGFubm95ZWQgYXQg
dGhlIHJlbGlhbmNlIG9uIHVtbCBhdCB0aGUgbW9tZW50LCBidXQgd2UgY2FuIHdvcmsKPiBvbiB0
aGF0IGluIHRoZSBmdXR1cmUgOikKCkVoLCBJIG1vc3RseSBmaXhlZCB0aGF0LgoKSSByZW1vdmVk
IHRoZSBLVW5pdCBmcmFtZXdvcmsncyByZWxpYW5jZSBvbiBVTUwgaS5lLiB0aGUgYWN0dWFsIHRl
c3RzCm5vdyBydW4gb24gYW55IGFyY2hpdGVjdHVyZS4KClRoZSBvbmx5IFVNTCBkZXBlbmRlbnQg
Yml0IGlzIHRoZSBLVW5pdCB3cmFwcGVyIHNjcmlwdHMsIHdoaWNoIGNvdWxkCmJlIG1hZGUgdG8g
d29yayB0byBzdXBwb3J0IG90aGVyIGFyY2hpdGVjdHVyZXMgcHJldHR5IHRyaXZpYWxseS4gVGhl
Cm9ubHkgbGltaXRhdGlvbiBoZXJlIGlzIHRoYXQgaXQgd291bGQgYmUgZGVwZW5kZW50IG9uIHRo
ZSBhY3R1YWwKd29ya2Zsb3cgeW91IGFyZSB1c2luZy4KCkluIGFueWNhc2UsIGlmIHlvdSBhcmUg
Y29tZm9ydGFibGUgcmVhZGluZyB0aGUgcmVzdWx0cyBpbiB0aGUga2VybmVsCmxvZ3MsIHRoZW4g
dGhlcmUgaXMgbm8gZGVwZW5kZW5jZSBvbiBVTUwuIChJIHNob3VsZCBwcm9iYWJseSBwcm92aWRl
CnNvbWUgZG9jdW1lbnRhdGlvbiBvbiB0aGF0Li4uKQoKPgo+IFRoYW5rcyBmb3Igc3RpY2tpbmcg
d2l0aCB0aGlzLCBub3cgdGhlIHJlYWwgd29yayBiZWdpbnMuLi4KCkkgZG9uJ3QgZG91YnQgaXQu
Cgo+Cj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+CgpEb2VzIHRoaXMgY292ZXIgYWxsIHRoZSBwYXRjaGVzIGluIHRoaXMgc2V0PwoK
VGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
