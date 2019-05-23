Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9E27830
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 10:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2415C89D52;
	Thu, 23 May 2019 08:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4894A89D52
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 08:40:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l25so8043531eda.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 01:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=OtO3pn3g+W5AJ1zDc3bZ1Gi7BUopJKS5bXtOM69PFV0=;
 b=cB8TFb8ZYxYDBFKGFbqbamEA03J6rggNcLKg6e5IMus5e/b5FiLmMMkiDSgPC2joP9
 r5DWUDRv9Psbj9qJnExMhFybuDV5d1Yj4zQkpvLn9+Dz439LKRIwvayxNB7TmOjb9Rmu
 BkLhbYR7O6ivLooCpawfFfP9TvMpZY6iHDD0bICFbqgX/NJuuPJsoohMwfPMG4oon0+z
 WajTLS+8Q0ji7iPdkuHPRWRHW3IKk4Gka4tl4G8zvOS/3dgE+1l3xCLMwbjhS9VEJKsl
 eqGvMaVP4KPfwCT3emGZnf6gzZQbyaAV9TUmfEmqhcwFRHbBjeg27vA762gUUsdaqZgu
 OKuQ==
X-Gm-Message-State: APjAAAWkeuXUaEkq6JiTD6ch5QrB4fWGCgRgAIJp2aoPSFvd6GeSmTGh
 KVpkpjn6/5yNezSfr2GpUEMD6w==
X-Google-Smtp-Source: APXvYqz8Y+bfkGbAgCjaoic1YwZ2Mzn/1QL4hnOd08WL9imIzBVyErPfVOS7r/O39NeU8f+1ffyFzw==
X-Received: by 2002:a17:906:4995:: with SMTP id
 p21mr47837157eju.140.1558600810787; 
 Thu, 23 May 2019 01:40:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id a40sm7754430edd.1.2019.05.23.01.40.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 01:40:09 -0700 (PDT)
Date: Thu, 23 May 2019 10:40:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190523084006.GW21222@phenom.ffwll.local>
Mail-Followup-To: Brendan Higgins <brendanhiggins@google.com>,
 Theodore Ts'o <tytso@mit.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 "Bird, Timothy" <Tim.Bird@sony.com>,
 Knut Omang <knut.omang@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@google.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 kunit-dev@googlegroups.com,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 linux-um@lists.infradead.org,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Amir Goldstein <amir73il@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jeff Dike <jdike@addtoit.com>, Joel Stanley <joel@jms.id.au>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Kevin Hilman <khilman@baylibre.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>,
 David Rientjes <rientjes@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com,
 Bjorn Helgaas <bhelgaas@google.com>
References: <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
 <20190513144451.GQ17751@phenom.ffwll.local>
 <20190514060433.GA181462@google.com>
 <CAKMK7uHqtSF_sazJTbFL+xmQJRk4iwukCKZHoDHhsKkLXk=ECQ@mail.gmail.com>
 <20190514183618.GC109557@google.com>
 <20190515074141.GY17751@phenom.ffwll.local>
 <CAFd5g476Hc+6jL5sV=VJamXCbqGebwHqqN9N9RppQYMCoo052Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g476Hc+6jL5sV=VJamXCbqGebwHqqN9N9RppQYMCoo052Q@mail.gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=OtO3pn3g+W5AJ1zDc3bZ1Gi7BUopJKS5bXtOM69PFV0=;
 b=lq0MyFEeRcjMOqOeV3+f0i+TJjbwdAlfr6V7mYhQGHiFiyqULL6S2+Syj4bf4Ap+X1
 LTiy/HFPl8cYz36rVJ8eFk1gpYRLbr8SuDawjh76uT+RILl5tWpijdVhlyN7ntHtzA3K
 PNyVHRqlLgXqxpA59M9A3TUICNOzB/ZluRNqA=
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
 Shuah Khan <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDI6Mzg6NDhQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+ICtCam9ybiBIZWxnYWFzCj4gCj4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6
NDEgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBU
dWUsIE1heSAxNCwgMjAxOSBhdCAxMTozNjoxOEFNIC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3Jv
dGU6Cj4gPiA+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDAyOjA1OjA1UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgODowNCBBTSBC
cmVuZGFuIEhpZ2dpbnMKPiA+ID4gPiA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NDQ6NTFQTSAr
MDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+ID4gT24gU2F0LCBNYXkgMTEsIDIw
MTkgYXQgMDE6MzM6NDRQTSAtMDQwMCwgVGhlb2RvcmUgVHMnbyB3cm90ZToKPiA+ID4gPiA+ID4g
PiBPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAwMjoxMjo0MFBNIC0wNzAwLCBGcmFuayBSb3dhbmQg
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBIb3dldmVyLCB0aGUgcmVwbHkgaXMgaW5jb3JyZWN0LiAg
S3NlbGZ0ZXN0IGluLWtlcm5lbCB0ZXN0cyAod2hpY2gKPiA+ID4gPiA+ID4gPiA+IGlzIHRoZSBj
b250ZXh0IGhlcmUpIGNhbiBiZSBjb25maWd1cmVkIGFzIGJ1aWx0IGluIGluc3RlYWQgb2YgYXMK
PiA+ID4gPiA+ID4gPiA+IGEgbW9kdWxlLCBhbmQgYnVpbHQgaW4gYSBVTUwga2VybmVsLiAgVGhl
IFVNTCBrZXJuZWwgY2FuIGJvb3QsCj4gPiA+ID4gPiA+ID4gPiBydW5uaW5nIHRoZSBpbi1rZXJu
ZWwgdGVzdHMgYmVmb3JlIFVNTCBhdHRlbXB0cyB0byBpbnZva2UgdGhlCj4gPiA+ID4gPiA+ID4g
PiBpbml0IHByb2Nlc3MuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBVbSwgQ2l0YXRpb24g
bmVlZGVkPwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSSBkb24ndCBzZWUgYW55IGV2aWRl
bmNlIGZvciB0aGlzIGluIHRoZSBrc2VsZnRlc3QgZG9jdW1lbnRhdGlvbiwgbm9yCj4gPiA+ID4g
PiA+ID4gZG8gSSBzZWUgYW55IGV2aWRlbmNlIG9mIHRoaXMgaW4gdGhlIGtzZWxmdGVzdCBNYWtl
ZmlsZXMuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGVyZSBleGlzdHMgdGVzdCBtb2R1
bGVzIGluIHRoZSBrZXJuZWwgdGhhdCBydW4gYmVmb3JlIHRoZSBpbml0Cj4gPiA+ID4gPiA+ID4g
c2NyaXB0cyBydW4gLS0tIGJ1dCB0aGF0J3Mgbm90IHN0cmljdGx5IHNwZWFraW5nIHBhcnQgb2Yg
a3NlbGZ0ZXN0cywKPiA+ID4gPiA+ID4gPiBhbmQgZG8gbm90IGhhdmUgYW55IGtpbmQgb2YgaW5m
cmFzdHJ1Y3R1cmUuICBBcyBub3RlZCwgdGhlCj4gPiA+ID4gPiA+ID4ga3NlbGZ0ZXN0c19oYXJu
ZXNzIGhlYWRlciBmaWxlIGZ1bmRhbWVudGFsbHkgYXNzdW1lcyB0aGF0IHlvdSBhcmUKPiA+ID4g
PiA+ID4gPiBydW5uaW5nIHRlc3QgY29kZSBpbiB1c2Vyc3BhY2UuCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFllYWggSSByZWFsbHkgbGlrZSB0aGUgIm5vIHVzZXJzcGFjZSByZXF1aXJlZCBhdCBh
bGwiIGRlc2lnbiBvZiBrdW5pdCwKPiA+ID4gPiA+ID4gd2hpbGUgc3RpbGwgY29sbGVjdGluZyBy
ZXN1bHRzIGluIGEgd2VsbC1kZWZpbmVkIHdheSAodW5sZXNzIHRoZSBjdXJyZW50Cj4gPiA+ID4g
PiA+IHNlbGYtdGVzdCB0aGF0IGp1c3QgcnVuIHdoZW4geW91IGxvYWQgdGhlIG1vZHVsZSwgd2l0
aCBtYXliZSBzb21lCj4gPiA+ID4gPiA+IGtzZWxmdGVzdCBhZC1ob2Mgd3JhcHBlciBhcm91bmQg
dG8gY29sbGVjdCB0aGUgcmVzdWx0cykuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdoYXQgSSB3
YW50IHRvIGRvIGxvbmctdGVybSBpcyB0byBydW4gdGhlc2Uga2VybmVsIHVuaXQgdGVzdHMgYXMg
cGFydCBvZgo+ID4gPiA+ID4gPiB0aGUgYnVpbGQtdGVzdGluZywgbW9zdCBsaWtlbHkgaW4gZ2l0
bGFiIChzb29uZXIgb3IgbGF0ZXIsIGZvciBkcm0uZ2l0Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVG90
YWxseSEgVGhpcyBpcyBwYXJ0IG9mIHRoZSByZWFzb24gSSBoYXZlIGJlZW4gaW5zaXN0aW5nIG9u
IGEgbWluaW11bQo+ID4gPiA+ID4gb2YgVU1MIGNvbXBhdGliaWxpdHkgZm9yIGFsbCB1bml0IHRl
c3RzLiBJZiB5b3UgY2FuIHN1ZmZpZW50bHkgY29uc3RyYWluCj4gPiA+ID4gPiB0aGUgZW52aXJv
bm1lbnQgdGhhdCBpcyByZXF1aXJlZCBmb3IgdGVzdHMgdG8gcnVuIGluLCBpdCBtYWtlcyBpdCBt
dWNoCj4gPiA+ID4gPiBlYXNpZXIgbm90IG9ubHkgZm9yIGEgaHVtYW4gdG8gcnVuIHlvdXIgdGVz
dHMsIGJ1dCBpdCBhbHNvIG1ha2VzIGl0IGEKPiA+ID4gPiA+IGxvdCBlYXNpZXIgZm9yIGFuIGF1
dG9tYXRlZCBzZXJ2aWNlIHRvIGJlIGFibGUgdG8gcnVuIHlvdXIgdGVzdHMuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gSSBhY3R1YWxseSBoYXZlIGEgcHJvdG90eXBlIHByZXN1Ym1pdCBhbHJlYWR5IHdv
cmtpbmcgb24gbXkKPiA+ID4gPiA+ICJzdGFibGUvbm9uLXVwc3RyZWFtIiBicmFuY2guIFlvdSBj
YW4gY2hlY2tvdXQgd2hhdCBwcmVzdWJtaXQgcmVzdWx0cwo+ID4gPiA+ID4gbG9vayBsaWtlIGhl
cmVbMV1bMl0uCj4gPiA+ID4KPiA+ID4gPiB1ZyBnZXJyaXQgOi0pCj4gPiA+Cj4gPiA+IFllYWgs
IHllYWgsIEkga25vdywgYnV0IGl0IGlzIGEgbG90IGVhc2llciBmb3IgbWUgdG8gZ2V0IGEgcHJv
amVjdCBzZXQKPiA+ID4gdXAgaGVyZSB1c2luZyBHZXJyaXQsIHdoZW4gd2UgYWxyZWFkeSB1c2Ug
dGhhdCBmb3IgYSBsb3Qgb2Ygb3RoZXIKPiA+ID4gcHJvamVjdHMuCj4gPiA+Cj4gPiA+IEFsc28s
IEdlcnJpdCBoYXMgZ290dGVuIGEgbG90IGJldHRlciBvdmVyIHRoZSBsYXN0IHR3byB5ZWFycyBv
ciBzby4gVHdvCj4gPiA+IHllYXJzIGFnbywgSSB3b3VsZG4ndCB0b3VjaCBpdCB3aXRoIGEgdGVu
IGZvb3QgcG9sZS4gSXQncyBub3Qgc28gYmFkCj4gPiA+IGFueW1vcmUsIGF0IGxlYXN0IGlmIHlv
dSBhcmUgdXNlZCB0byB1c2luZyBhIHdlYiBVSSB0byByZXZpZXcgY29kZS4KPiA+Cj4gPiBJIHdh
cyBzb21ld2hhdCBqb2tpbmcsIEknbSBqdXN0IG5vdCB1c2VkIHRvIGdlcnJpdCAuLi4gQW5kIHNl
ZW1zIHRvIGluZGVlZAo+ID4gYmUgYSBsb3QgbW9yZSBwb2xpc2hlZCB0aGFuIGxhc3QgdGltZSBJ
IGxvb2tlZCBhdCBpdCBzZXJpb3VzbHkuCj4gCj4gSSBtZWFuLCBpdCBpcyBzdGlsbCBub3QgcGVy
ZmVjdCwgYnV0IEkgdGhpbmsgaXQgaGFzIGZpbmFsbHkgZ290dGVuIHRvCj4gdGhlIHBvaW50IHdo
ZXJlIEkgcHJlZmVyIGl0IG92ZXIgcmV2aWV3aW5nIGJ5IGVtYWlsIGZvciBoaWdoIGNvbnRleHQK
PiBwYXRjaGVzIHdoZXJlIHlvdSBkb24ndCBleHBlY3QgYSBsb3Qgb2YgZGVlcCBkaXNjdXNzaW9u
Lgo+IAo+IFN0aWxsIG5vdCBncmVhdCBmb3IgcGF0Y2hlcyB3aGVyZSB5b3Ugd2FudCB0byBoYXZl
IGEgbG90IG9mIGRpc2N1c3Npb24uCj4gCj4gPiA+ID4gPiA+IG9ubHkgb2ZjKS4gU28gdGhhdCBw
ZW9wbGUgZ2V0IHRoZWlyIHB1bGwgcmVxdWVzdHMgKGFuZCBwYXRjaCBzZXJpZXMsIHdlCj4gPiA+
ID4gPiA+IGhhdmUgc29tZSBpZGVhcyB0byB0aWUgdGhpcyBpbnRvIHBhdGNod29yaykgYXV0b21h
dGljYWxseSB0ZXN0ZWQgZm9yIHRoaXMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBNaWdodCB0aGF0IGJl
IFNub3dwYXRjaFszXT8gSSB0YWxrZWQgdG8gUnVzc2VsbCwgdGhlIGNyZWF0b3Igb2YgU25vd3Bh
dGNoLAo+ID4gPiA+ID4gYW5kIGhlIHNlZW1lZCBwcmV0dHkgb3BlbiB0byBjb2xsYWJvcmF0aW9u
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEJlZm9yZSBJIGhlYXJkIGFib3V0IFNub3dwYXRjaCwgSSBo
YWQgYW4gaW50ZXJuIHdyaXRlIGEgdHJhbnNsYXRpb24KPiA+ID4gPiA+IGxheWVyIHRoYXQgbWFk
ZSBQcm93ICh0aGUgcHJlc3VibWl0IHNlcnZpY2UgdGhhdCBJIHVzZWQgaW4gdGhlIHByb3RvdHlw
ZQo+ID4gPiA+ID4gYWJvdmUpIHdvcmsgd2l0aCBMS01MWzRdLgo+ID4gPiA+Cj4gPiA+ID4gVGhl
cmUncyBhYm91dCAzLTQgZm9ya3MvY2xvbmVzIG9mIHBhdGNod29yay4gc25vd3BhdGNoIGlzIG9u
ZSwgd2UgaGF2ZQo+ID4gPiA+IGEgZGlmZmVyZW50IG9uZSBvbiBmcmVlZGVza3RvcC5vcmcuIEl0
J3MgYSBiaXQgYSBtZXNzIDotLwo+IAo+IEkgdGhpbmsgU25vd3BhdGNoIGlzIGFuIG96bGFicyBw
cm9qZWN0OyBhdCBsZWFzdCB0aGUgbWFpbnRhaW5lciB3b3JrcyBhdCBJQk0uCj4gCj4gUGF0Y2h3
b3JrIG9yaWdpbmFsbHkgd2FzIGEgb3psYWJzIHByb2plY3QsIHJpZ2h0PwoKU28gdGhlcmUncyB0
d28gcGF0Y2h3b3JrcyAoc25vd3BhdGNoIG1ha2VzIHRoZSAzcmQpOiB0aGUgb25lIG9uCmZyZWVk
ZXNrdG9wIGlzIGFub3RoZXIgZm9yay4KCj4gSGFzIGFueSBkaXNjdXNzaW9uIHRha2VuIHBsYWNl
IHRyeWluZyB0byBjb25zb2xpZGF0ZSBzb21lIG9mIHRoZSBmb3Jrcz8KCll1cCwgYnV0IGRpZG4n
dCBsZWFkIGFueXdoZXJlIHVuZm9ydHVuYXRlbHkgOi0vIEF0IGxlYXN0IGJldHdlZW4gcGF0Y2h3
b3JrCmFuZCBwYXRjaHdvcmstZmRvLCBJIHRoaW5rIHNub3dwYXRjaCBoYXBwZW5lZCBpbiBwYXJh
bGxlbCBhbmQgb25jZSBpdCB3YXMKZG9uZSBpdCdzIGtpbmRhIHRvbyBsYXRlLiBUaGUgdHJvdWJs
ZSBpcyB0aGF0IHRoZXkgYWxsIGhhdmUgc2xpZ2h0bHkKZGlmZmVyZW50IFJFU1QgYXBpIGFuZCBm
dW5jdGlvbmFsaXR5LCBzbyBmb3IgQ0kgaW50ZWdyYXRpb24geW91IGNhbid0IGp1c3QKc3dpdGNo
IG9uZSBmb3IgdGhlIG90aGVyLgoKPiBQcmVzdWJtaXQgY2xlYXJseSBzZWVtcyBsaWtlIGEgZmVh
dHVyZSB0aGF0IGEgbnVtYmVyIG9mIHBlb3BsZSB3YW50Lgo+IAo+ID4gPiBPaCwgSSBkaWRuJ3Qg
cmVhbGl6ZSB0aGF0LiBJIGZvdW5kIHlvdXIgcGF0Y2h3b3JrIGluc3RhbmNlIGhlcmVbNV0sIGJ1
dAo+ID4gPiBkbyB5b3UgaGF2ZSBhIHBsYWNlIHdoZXJlIEkgY2FuIHNlZSB0aGUgY2hhbmdlcyB5
b3UgaGF2ZSBhZGRlZCB0bwo+ID4gPiBzdXBwb3J0IHByZXN1Ym1pdD8KPiA+Cj4gPiBPayBoZXJl
J3MgYSBmZXcgbGlua3MuIEFzaWRlIGZyb20gdGhlIHVzdWFsIHBhdGNoIHZpZXcgd2UndmUgYWxz
byBhZGRlZCBhCj4gPiBzZXJpZXMgdmlldzoKPiA+Cj4gPiBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcHJvamVjdC9pbnRlbC1nZngvc2VyaWVzLz9vcmRlcmluZz0tbGFzdF91cGRh
dGVkCj4gPgo+ID4gVGhpcyB0aWVzIHRoZSBwYXRjaGVzICsgY292ZXIgbGV0dGVyIHRvZ2V0aGVy
LCBhbmQgaXQgZXZlbiAodHJpZXMgdG8gYXQKPiA+IGxlYXN0KSB0cmFjayByZXZpc2lvbnMuIEhl
cmUncyBhbiBleGFtcGxlIHdoaWNoIGlzIGN1cnJlbnRseSBhdCByZXZpc2lvbgo+ID4gOToKPiA+
Cj4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU3MjMyLwo+IAo+
IE9vb2gsIG5pY2UhIFRoYXQgbG9va3MgYXdlc29tZSEgTG9va3MgbGlrZSB5b3UgaGF2ZSBhIG51
bWJlciBvZiBwcmVzdWJtaXRzIHRvby4KCldlIGhhdmUgYSBwcmV0dHkgYmlnIGZhcm0gb2YgbWFj
aGluZXMgdGhhdCBtb3N0bHkganVzdCBjcnVuY2ggdGhyb3VnaApwcmVtZXJnZSBwYXRjaCBzZXJp
ZXMuIHBvc3RtZXJnZSBpcyBtb3N0bHkganVzdCBmb3Igc3RhdGlzdGljcyAoc28gd2UgY2FuCmZp
bmQgdGhlIHNwb3JhZGljIGZhaWx1cmVzIGFuZCBiZXR0ZXIgY2hhcmFjdGVyaXplIHRoZW0pLgoK
PiA+IEJlbG93IHRoZSBwYXRjaCBsaXN0IGZvciBlYWNoIHJldmlzaW9uIHdlIGFsc28gaGF2ZSB0
aGUgdGVzdCByZXN1bHQgbGlzdC4KPiA+IElmIHlvdSBjbGljayBvbiB0aGUgZ3JleSBiYXIgaXQn
bGwgZXhwYW5kIHdpdGggdGhlIHN1bW1hcnkgZnJvbSBDSSwgdGhlCj4gPiAiU2VlIGZ1bGwgbG9n
cyIgaXMgbGluayB0byB0aGUgZnVsbCByZXN1bHRzIGZyb20gb3VyIENJLiBUaGlzIGlzIGRyaXZl
bgo+ID4gd2l0aCBzb21lIFJFU1QgYXBpIGZyb20gb3VyIGplbmtpbnMuCj4gPgo+ID4gUGF0Y2h3
b3JrIGFsc28gc2VuZHMgb3V0IG1haWxzIGZvciB0aGVzZSByZXN1bHRzLgo+IAo+IE5pY2UhIFRo
ZXJlIGFyZSBvYnZpb3VzbHkgYSBsb3Qgb2Ygb3RoZXIgYm90cyBvbiB2YXJpb3VzIGtlcm5lbAo+
IG1haWxpbmcgbGlzdHMuIERvIHlvdSB0aGluayBwZW9wbGUgd291bGQgb2JqZWN0IHRvIHNlbmRp
bmcgcHJlc3VibWl0Cj4gcmVzdWx0cyB0byB0aGUgbWFpbGluZyBsaXN0cyBieSBkZWZhdWx0Pwo+
IAo+ID4gU291cmNlIGlzIG9uIGdpdGxhYjogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNod29yay1mZG8KPiAKPiBFcnIsIGxvb2tzIGxpa2UgeW91IGZvcmtlZCBmcm9tIHRoZSBv
emxhYidzIHJlcG8gYSBnb29kIHdoaWxlIGFnby4KClllYWggc2VlIGFib3ZlLCBpdCdzIGEgYml0
IGEgY29tcGxpY2F0ZWQgc3RvcnkuIEkgdGhpbmsgdGhlcmUncyBhIHRvdGFsIG9mCjMgcGF0Y2h3
b3JrcyBub3cgOi0vCgo+IFN0aWxsLCB0aGlzIGFsbCBsb29rcyBncmVhdCEKCkNoZWVycywgRGFu
aWVsCgo+IAo+ID4gPiA+ID4gSSBhbSBub3QgbWFycmllZCB0byBlaXRoZXIgYXBwcm9hY2gsIGJ1
dCBJIHRoaW5rIGJldHdlZW4gdGhlIHR3byBvZgo+ID4gPiA+ID4gdGhlbSwgbW9zdCBvZiB0aGUg
aW5pdGlhbCBsZWd3b3JrIGhhcyBiZWVuIGRvbmUgdG8gbWFrZSBwcmVzdWJtaXQgb24KPiA+ID4g
PiA+IExLTUwgYSByZWFsaXR5Lgo+ID4gPiA+Cj4gPiA+ID4gV2UgZG8gaGF2ZSBwcmVzdWJtaXQg
Q0kgd29ya2luZyBhbHJlYWR5IHdpdGggb3VyIGZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+IHBhdGNo
d29yay4gVGhlIG1pc3NpbmcgZ2x1ZSBpcyBqdXN0IHR5aW5nIHRoYXQgaW50byBnaXRsYWIgQ0kg
c29tZWhvdwo+ID4gPiA+IChzaW5jZSB3ZSB3YW50IHRvIHVuaWZ5IGJ1aWxkIHRlc3RpbmcgbW9y
ZSBhbmQgbWFrZSBpdCBlYXNpZXIgZm9yCj4gPiA+ID4gY29udHJpYnV0b3JzIHRvIGFkanVzdCB0
aGluZ3MpLgo+ID4gPgo+ID4gPiBJIGNoZWNrZWQgb3V0IGEgY291cGxlIG9mIHlvdXIgcHJvamVj
dHMgb24geW91ciBwYXRjaHdvcmsgaW5zdGFuY2U6IEFNRAo+ID4gPiBYLk9yZyBkcml2ZXJzLCBE
UkkgZGV2ZWwsIGFuZCBXYXlsYW5kLiBJIHNhdyB0aGUgdGFiIHlvdSBhZGRlZCBmb3IKPiA+ID4g
dGVzdHMsIGJ1dCBub25lIG9mIHRoZW0gYWN0dWFsbHkgaGFkIGFueSB0ZXN0IHJlc3VsdHMuIENh
biB5b3UgcG9pbnQgbWUKPiA+ID4gYXQgb25lIHRoYXQgZG9lcz8KPiA+Cj4gPiBBdG0gd2UgdXNl
IHRoZSBDSSBzdHVmZiBvbmx5IG9uIGludGVsLWdmeCwgd2l0aCB0aGUgb3VyIGdwdSBDSSBmYXJt
LCBzZWUKPiA+IGxpbmtzIGFib3ZlLgo+ID4KPiA+IENoZWVycywgRGFuaWVsCj4gPgo+ID4gPgo+
ID4gPiBDaGVlcnMhCj4gPiA+Cj4gPiA+IFs1XSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvCj4gPiA+Cj4gPiA+ID4gPiA+IHN1cGVyIGJhc2ljIHN0dWZmLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEkgYW0gcmVhbGx5IGV4Y2l0ZWQgdG8gaGVhciBiYWNrIG9uIHdoYXQgeW91IHRoaW5r
IQo+ID4gPiA+ID4KPiA+ID4gPiA+IENoZWVycyEKPiA+ID4gPiA+Cj4gPiA+ID4gPiBbMV0gaHR0
cHM6Ly9rdW5pdC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2xpbnV4LysvMTUwOS8xMCNtZXNz
YWdlLTdiZmE0MGVmYjEzMmUxNWM4Mzg4NzU1YzI3MzgzNzU1OTkxMTQyNWMKPiA+ID4gPiA+IFsy
XSBodHRwczovL2t1bml0LXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvbGludXgvKy8xNTA5LzEw
I21lc3NhZ2UtYTY3ODQ0OTZlYWZmZjQ0MmFjOThmYjA2OGJmMWEwZjM2ZWU3MzUwOQo+ID4gPiA+
ID4gWzNdIGh0dHBzOi8vZGV2ZWxvcGVyLmlibS5jb20vb3Blbi9wcm9qZWN0cy9zbm93cGF0Y2gv
Cj4gPiA+ID4gPiBbNF0gaHR0cHM6Ly9rdW5pdC5nb29nbGVzb3VyY2UuY29tL3Byb3ctbGttbC8K
PiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiA+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+ID4gPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAo+IENoZWVycyEKCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
