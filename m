Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE671CF25
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 20:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624E189263;
	Tue, 14 May 2019 18:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DBC8930E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 18:36:26 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id b76so1153106pfb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 11:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kgrCvI66v1eNqCFIEetHipPbY2Pg16O5TtUnu8MLeKU=;
 b=ClLVgrTWLhmyUMbcGY4kcQ8LVB7BZCVz4I8aymlWKebNwv0muMRLtFQSpdyOQNlU/j
 Dwa8b77Loj9ntc5UoLXEqd15uvUpAupNf0ZVFhW0cvQC1l15PSpcgrACt62LTAvYV+MH
 F/itJxojwu/AJxFll00JGO4wPKmjqOGXmuwfH0NuwTbDs+q6Ibd0R8Tm5OHRuzHug2kd
 pkXv6evjG3Je30Ls2SF0Xtnd8hZaeeETzalbsoLG1utfIWozfsbmHM/1yNO1FlX0bqqZ
 pYGpLSF0UQrSgbjhWhpHKRkUPs2hR+7LGM+hv2XcGXqaL+LrZuBCeVaIVylewZxUn2NY
 vNow==
X-Gm-Message-State: APjAAAVbYZwwMJdn4LUYGeJZv4ti6t9iApiWxE3VCHnU49iH1DceYKQB
 SJ/XNumrPK0vk8QAMgmWEeo2rg==
X-Google-Smtp-Source: APXvYqxx/zB3rhnaNxCnfVL/D4G9BC9H3ZRHO1zmfqf3pl1LMALbOUIKd0jSHjCRuQTB7Pn9vuxzCg==
X-Received: by 2002:a62:e205:: with SMTP id a5mr4433129pfi.40.1557858985424;
 Tue, 14 May 2019 11:36:25 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id u6sm10940875pfa.1.2019.05.14.11.36.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 11:36:24 -0700 (PDT)
Date: Tue, 14 May 2019 11:36:18 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190514183618.GC109557@google.com>
References: <7fd35df81c06f6eb319223a22e7b93f29926edb9.camel@oracle.com>
 <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <80c72e64-2665-bd51-f78c-97f50f9a53ba@gmail.com>
 <20190511173344.GA8507@mit.edu>
 <20190513144451.GQ17751@phenom.ffwll.local>
 <20190514060433.GA181462@google.com>
 <CAKMK7uHqtSF_sazJTbFL+xmQJRk4iwukCKZHoDHhsKkLXk=ECQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHqtSF_sazJTbFL+xmQJRk4iwukCKZHoDHhsKkLXk=ECQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kgrCvI66v1eNqCFIEetHipPbY2Pg16O5TtUnu8MLeKU=;
 b=gUDKqjEsr8Qv/Y/RdIi8Q0i7FwdadH/D5if9+lYhE9eNQ7LD2B70LCDjDacGxm/FVd
 7kNk5FVNgjwADCYAgcq7jDXk1GJDmyZ0Kh9Gx1ZgwB42ZvxUY0Ix0Sc6YTHp4jc2OTit
 wIpv9ZoVwEXLXTtC0OYc2rhNj0FLGzUxHwUjYJgkKxJYgKIgxENPIfowWiBpTDqrDXJR
 aV5ZOSNgafVxar7tXD+7n837g3sPSNo8qbLCnklS6BGK4TPE6mpuNgU2xapU2LGoeVW3
 VHuSjX0KcDsjpdugWjGvtUgdMmqQOHw13R3aNbCEwTZebS+H4VHnLozq+d5p3UypFj6x
 1Rrw==
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

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDI6MDU6MDVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCA4OjA0IEFNIEJyZW5kYW4gSGlnZ2lucwo+
IDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE1heSAx
MywgMjAxOSBhdCAwNDo0NDo1MVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBP
biBTYXQsIE1heSAxMSwgMjAxOSBhdCAwMTozMzo0NFBNIC0wNDAwLCBUaGVvZG9yZSBUcydvIHdy
b3RlOgo+ID4gPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDAyOjEyOjQwUE0gLTA3MDAsIEZy
YW5rIFJvd2FuZCB3cm90ZToKPiA+ID4gPiA+IEhvd2V2ZXIsIHRoZSByZXBseSBpcyBpbmNvcnJl
Y3QuICBLc2VsZnRlc3QgaW4ta2VybmVsIHRlc3RzICh3aGljaAo+ID4gPiA+ID4gaXMgdGhlIGNv
bnRleHQgaGVyZSkgY2FuIGJlIGNvbmZpZ3VyZWQgYXMgYnVpbHQgaW4gaW5zdGVhZCBvZiBhcwo+
ID4gPiA+ID4gYSBtb2R1bGUsIGFuZCBidWlsdCBpbiBhIFVNTCBrZXJuZWwuICBUaGUgVU1MIGtl
cm5lbCBjYW4gYm9vdCwKPiA+ID4gPiA+IHJ1bm5pbmcgdGhlIGluLWtlcm5lbCB0ZXN0cyBiZWZv
cmUgVU1MIGF0dGVtcHRzIHRvIGludm9rZSB0aGUKPiA+ID4gPiA+IGluaXQgcHJvY2Vzcy4KPiA+
ID4gPgo+ID4gPiA+IFVtLCBDaXRhdGlvbiBuZWVkZWQ/Cj4gPiA+ID4KPiA+ID4gPiBJIGRvbid0
IHNlZSBhbnkgZXZpZGVuY2UgZm9yIHRoaXMgaW4gdGhlIGtzZWxmdGVzdCBkb2N1bWVudGF0aW9u
LCBub3IKPiA+ID4gPiBkbyBJIHNlZSBhbnkgZXZpZGVuY2Ugb2YgdGhpcyBpbiB0aGUga3NlbGZ0
ZXN0IE1ha2VmaWxlcy4KPiA+ID4gPgo+ID4gPiA+IFRoZXJlIGV4aXN0cyB0ZXN0IG1vZHVsZXMg
aW4gdGhlIGtlcm5lbCB0aGF0IHJ1biBiZWZvcmUgdGhlIGluaXQKPiA+ID4gPiBzY3JpcHRzIHJ1
biAtLS0gYnV0IHRoYXQncyBub3Qgc3RyaWN0bHkgc3BlYWtpbmcgcGFydCBvZiBrc2VsZnRlc3Rz
LAo+ID4gPiA+IGFuZCBkbyBub3QgaGF2ZSBhbnkga2luZCBvZiBpbmZyYXN0cnVjdHVyZS4gIEFz
IG5vdGVkLCB0aGUKPiA+ID4gPiBrc2VsZnRlc3RzX2hhcm5lc3MgaGVhZGVyIGZpbGUgZnVuZGFt
ZW50YWxseSBhc3N1bWVzIHRoYXQgeW91IGFyZQo+ID4gPiA+IHJ1bm5pbmcgdGVzdCBjb2RlIGlu
IHVzZXJzcGFjZS4KPiA+ID4KPiA+ID4gWWVhaCBJIHJlYWxseSBsaWtlIHRoZSAibm8gdXNlcnNw
YWNlIHJlcXVpcmVkIGF0IGFsbCIgZGVzaWduIG9mIGt1bml0LAo+ID4gPiB3aGlsZSBzdGlsbCBj
b2xsZWN0aW5nIHJlc3VsdHMgaW4gYSB3ZWxsLWRlZmluZWQgd2F5ICh1bmxlc3MgdGhlIGN1cnJl
bnQKPiA+ID4gc2VsZi10ZXN0IHRoYXQganVzdCBydW4gd2hlbiB5b3UgbG9hZCB0aGUgbW9kdWxl
LCB3aXRoIG1heWJlIHNvbWUKPiA+ID4ga3NlbGZ0ZXN0IGFkLWhvYyB3cmFwcGVyIGFyb3VuZCB0
byBjb2xsZWN0IHRoZSByZXN1bHRzKS4KPiA+ID4KPiA+ID4gV2hhdCBJIHdhbnQgdG8gZG8gbG9u
Zy10ZXJtIGlzIHRvIHJ1biB0aGVzZSBrZXJuZWwgdW5pdCB0ZXN0cyBhcyBwYXJ0IG9mCj4gPiA+
IHRoZSBidWlsZC10ZXN0aW5nLCBtb3N0IGxpa2VseSBpbiBnaXRsYWIgKHNvb25lciBvciBsYXRl
ciwgZm9yIGRybS5naXQKPiA+Cj4gPiBUb3RhbGx5ISBUaGlzIGlzIHBhcnQgb2YgdGhlIHJlYXNv
biBJIGhhdmUgYmVlbiBpbnNpc3Rpbmcgb24gYSBtaW5pbXVtCj4gPiBvZiBVTUwgY29tcGF0aWJp
bGl0eSBmb3IgYWxsIHVuaXQgdGVzdHMuIElmIHlvdSBjYW4gc3VmZmllbnRseSBjb25zdHJhaW4K
PiA+IHRoZSBlbnZpcm9ubWVudCB0aGF0IGlzIHJlcXVpcmVkIGZvciB0ZXN0cyB0byBydW4gaW4s
IGl0IG1ha2VzIGl0IG11Y2gKPiA+IGVhc2llciBub3Qgb25seSBmb3IgYSBodW1hbiB0byBydW4g
eW91ciB0ZXN0cywgYnV0IGl0IGFsc28gbWFrZXMgaXQgYQo+ID4gbG90IGVhc2llciBmb3IgYW4g
YXV0b21hdGVkIHNlcnZpY2UgdG8gYmUgYWJsZSB0byBydW4geW91ciB0ZXN0cy4KPiA+Cj4gPiBJ
IGFjdHVhbGx5IGhhdmUgYSBwcm90b3R5cGUgcHJlc3VibWl0IGFscmVhZHkgd29ya2luZyBvbiBt
eQo+ID4gInN0YWJsZS9ub24tdXBzdHJlYW0iIGJyYW5jaC4gWW91IGNhbiBjaGVja291dCB3aGF0
IHByZXN1Ym1pdCByZXN1bHRzCj4gPiBsb29rIGxpa2UgaGVyZVsxXVsyXS4KPiAKPiB1ZyBnZXJy
aXQgOi0pCgpZZWFoLCB5ZWFoLCBJIGtub3csIGJ1dCBpdCBpcyBhIGxvdCBlYXNpZXIgZm9yIG1l
IHRvIGdldCBhIHByb2plY3Qgc2V0CnVwIGhlcmUgdXNpbmcgR2Vycml0LCB3aGVuIHdlIGFscmVh
ZHkgdXNlIHRoYXQgZm9yIGEgbG90IG9mIG90aGVyCnByb2plY3RzLgoKQWxzbywgR2Vycml0IGhh
cyBnb3R0ZW4gYSBsb3QgYmV0dGVyIG92ZXIgdGhlIGxhc3QgdHdvIHllYXJzIG9yIHNvLiBUd28K
eWVhcnMgYWdvLCBJIHdvdWxkbid0IHRvdWNoIGl0IHdpdGggYSB0ZW4gZm9vdCBwb2xlLiBJdCdz
IG5vdCBzbyBiYWQKYW55bW9yZSwgYXQgbGVhc3QgaWYgeW91IGFyZSB1c2VkIHRvIHVzaW5nIGEg
d2ViIFVJIHRvIHJldmlldyBjb2RlLgoKPiA+ID4gb25seSBvZmMpLiBTbyB0aGF0IHBlb3BsZSBn
ZXQgdGhlaXIgcHVsbCByZXF1ZXN0cyAoYW5kIHBhdGNoIHNlcmllcywgd2UKPiA+ID4gaGF2ZSBz
b21lIGlkZWFzIHRvIHRpZSB0aGlzIGludG8gcGF0Y2h3b3JrKSBhdXRvbWF0aWNhbGx5IHRlc3Rl
ZCBmb3IgdGhpcwo+ID4KPiA+IE1pZ2h0IHRoYXQgYmUgU25vd3BhdGNoWzNdPyBJIHRhbGtlZCB0
byBSdXNzZWxsLCB0aGUgY3JlYXRvciBvZiBTbm93cGF0Y2gsCj4gPiBhbmQgaGUgc2VlbWVkIHBy
ZXR0eSBvcGVuIHRvIGNvbGxhYm9yYXRpb24uCj4gPgo+ID4gQmVmb3JlIEkgaGVhcmQgYWJvdXQg
U25vd3BhdGNoLCBJIGhhZCBhbiBpbnRlcm4gd3JpdGUgYSB0cmFuc2xhdGlvbgo+ID4gbGF5ZXIg
dGhhdCBtYWRlIFByb3cgKHRoZSBwcmVzdWJtaXQgc2VydmljZSB0aGF0IEkgdXNlZCBpbiB0aGUg
cHJvdG90eXBlCj4gPiBhYm92ZSkgd29yayB3aXRoIExLTUxbNF0uCj4gCj4gVGhlcmUncyBhYm91
dCAzLTQgZm9ya3MvY2xvbmVzIG9mIHBhdGNod29yay4gc25vd3BhdGNoIGlzIG9uZSwgd2UgaGF2
ZQo+IGEgZGlmZmVyZW50IG9uZSBvbiBmcmVlZGVza3RvcC5vcmcuIEl0J3MgYSBiaXQgYSBtZXNz
IDotLwoKT2gsIEkgZGlkbid0IHJlYWxpemUgdGhhdC4gSSBmb3VuZCB5b3VyIHBhdGNod29yayBp
bnN0YW5jZSBoZXJlWzVdLCBidXQKZG8geW91IGhhdmUgYSBwbGFjZSB3aGVyZSBJIGNhbiBzZWUg
dGhlIGNoYW5nZXMgeW91IGhhdmUgYWRkZWQgdG8Kc3VwcG9ydCBwcmVzdWJtaXQ/Cgo+ID4gSSBh
bSBub3QgbWFycmllZCB0byBlaXRoZXIgYXBwcm9hY2gsIGJ1dCBJIHRoaW5rIGJldHdlZW4gdGhl
IHR3byBvZgo+ID4gdGhlbSwgbW9zdCBvZiB0aGUgaW5pdGlhbCBsZWd3b3JrIGhhcyBiZWVuIGRv
bmUgdG8gbWFrZSBwcmVzdWJtaXQgb24KPiA+IExLTUwgYSByZWFsaXR5Lgo+IAo+IFdlIGRvIGhh
dmUgcHJlc3VibWl0IENJIHdvcmtpbmcgYWxyZWFkeSB3aXRoIG91ciBmcmVlZGVza3RvcC5vcmcK
PiBwYXRjaHdvcmsuIFRoZSBtaXNzaW5nIGdsdWUgaXMganVzdCB0eWluZyB0aGF0IGludG8gZ2l0
bGFiIENJIHNvbWVob3cKPiAoc2luY2Ugd2Ugd2FudCB0byB1bmlmeSBidWlsZCB0ZXN0aW5nIG1v
cmUgYW5kIG1ha2UgaXQgZWFzaWVyIGZvcgo+IGNvbnRyaWJ1dG9ycyB0byBhZGp1c3QgdGhpbmdz
KS4KCkkgY2hlY2tlZCBvdXQgYSBjb3VwbGUgb2YgeW91ciBwcm9qZWN0cyBvbiB5b3VyIHBhdGNo
d29yayBpbnN0YW5jZTogQU1EClguT3JnIGRyaXZlcnMsIERSSSBkZXZlbCwgYW5kIFdheWxhbmQu
IEkgc2F3IHRoZSB0YWIgeW91IGFkZGVkIGZvcgp0ZXN0cywgYnV0IG5vbmUgb2YgdGhlbSBhY3R1
YWxseSBoYWQgYW55IHRlc3QgcmVzdWx0cy4gQ2FuIHlvdSBwb2ludCBtZQphdCBvbmUgdGhhdCBk
b2VzPwoKQ2hlZXJzIQoKWzVdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy8KCj4g
PiA+IHN1cGVyIGJhc2ljIHN0dWZmLgo+ID4KPiA+IEkgYW0gcmVhbGx5IGV4Y2l0ZWQgdG8gaGVh
ciBiYWNrIG9uIHdoYXQgeW91IHRoaW5rIQo+ID4KPiA+IENoZWVycyEKPiA+Cj4gPiBbMV0gaHR0
cHM6Ly9rdW5pdC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2xpbnV4LysvMTUwOS8xMCNtZXNz
YWdlLTdiZmE0MGVmYjEzMmUxNWM4Mzg4NzU1YzI3MzgzNzU1OTkxMTQyNWMKPiA+IFsyXSBodHRw
czovL2t1bml0LXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvbGludXgvKy8xNTA5LzEwI21lc3Nh
Z2UtYTY3ODQ0OTZlYWZmZjQ0MmFjOThmYjA2OGJmMWEwZjM2ZWU3MzUwOQo+ID4gWzNdIGh0dHBz
Oi8vZGV2ZWxvcGVyLmlibS5jb20vb3Blbi9wcm9qZWN0cy9zbm93cGF0Y2gvCj4gPiBbNF0gaHR0
cHM6Ly9rdW5pdC5nb29nbGVzb3VyY2UuY29tL3Byb3ctbGttbC8KPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
