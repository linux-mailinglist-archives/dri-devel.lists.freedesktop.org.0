Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF91C517
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 10:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D430892A1;
	Tue, 14 May 2019 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219B9892A1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 08:38:27 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id s11so8732725pfm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 01:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=igN9DgvcsdnnQcED87MufBXYemaWzI/btuCv4zC86yk=;
 b=uT02Ichb2YLMJlsRiFK/qd91ZlQA9xdkdeIqnPtofHQaIKOUIMIxRpgCAiEKnbYFBs
 VgE2U6vk5vCTMEUJCK/z/EFfe+U+wR+70QoBPLnrHj7NyPkfWegn2uEfMHIRZrfudOd/
 aty6WoFWN7J825K/rwmA1a8wWlBB4K7yTNbfkfVYtIVF6bg70ZD0rbbVbWdHWyncOGPi
 vi9UmNXenVONrJYGSarV1yX/s4dOpaws0SIIH3eFxwrJFA8kNjUYQzIb2kGXsoYDg/W0
 kXlULPzZb+yZUNlBw2q1h217Q3BbzgcX8dkskgTO+VT7yuuj+hBdeNfrkf6ArFRKJVex
 Svlg==
X-Gm-Message-State: APjAAAXoqG9Ba1Ix7NHMDO0yPfmdTY/K5A17siNrqA6kuYWMyRiUh2iC
 Of9/EsyXExelc2n8Q91BrV/uGg==
X-Google-Smtp-Source: APXvYqyqn2NOwOEZgtTbGy9WkrWx9lpJrCvlzVQwgRZJjBLJCvhNFSg43dsH15YYKmWUEQTHx4ScMw==
X-Received: by 2002:a65:578a:: with SMTP id b10mr20396367pgr.161.1557823106177; 
 Tue, 14 May 2019 01:38:26 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
 by smtp.gmail.com with ESMTPSA id j184sm18479757pge.83.2019.05.14.01.38.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 01:38:25 -0700 (PDT)
Date: Tue, 14 May 2019 01:38:19 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Message-ID: <20190514083819.GC230665@google.com>
References: <20190509133551.GD29703@mit.edu>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770D591@USCULXMSG01.am.sony.com>
 <875c546d-9713-bb59-47e4-77a1d2c69a6d@gmail.com>
 <20190509214233.GA20877@mit.edu>
 <b09ba170-229b-fde4-3e9a-e50d6ab4c1b5@deltatee.com>
 <20190509233043.GC20877@mit.edu>
 <8914afef-1e66-e6e3-f891-5855768d3018@deltatee.com>
 <6d6e91ec-33d3-830b-4895-4d7a20ba7d45@gmail.com>
 <3faa022b-0b70-0375-aa6d-12ea83a2671f@deltatee.com>
 <d148a554-2a71-a5a4-4bb2-d84d2c483277@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d148a554-2a71-a5a4-4bb2-d84d2c483277@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=igN9DgvcsdnnQcED87MufBXYemaWzI/btuCv4zC86yk=;
 b=GyRIMQHWrRSVtwP9IB5pyhtzqC4lPgeL0Y6beT6Qu4IZvr3gGiC9moimim+D9LkzvQ
 MEEZopp3jLTd3NW9rr2av+zcSv5sG6yxATJxZch96iyR7Vt5O8iVVR9KeDDdv3u44RDl
 UaYKlPaw3B25/ilDWdybyms52YrdOWkcCimnCd0rzMk7lbnW3wG7xJD+7Y1cPxm3eo8x
 /IcHai8RyaPGpuO10KNBGL34tDo7TgLJzFqFXMzrzaYkd6OZrO9RZjsPnFXRWFxr8t0z
 83455vvpULAaytz3l+5A0IgFjdYbPuwM+AftAn4nKNFSHLn0MwKll6hrPVQk06gNdVTQ
 mAhQ==
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
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 dan.j.williams@intel.com, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDM6MTM6NDBQTSAtMDcwMCwgRnJhbmsgUm93YW5kIHdy
b3RlOgo+IE9uIDUvMTAvMTkgOToxNyBBTSwgTG9nYW4gR3VudGhvcnBlIHdyb3RlOgo+ID4gCj4g
PiAKPiA+IE9uIDIwMTktMDUtMDkgMTE6MTggcC5tLiwgRnJhbmsgUm93YW5kIHdyb3RlOgo+ID4g
Cj4gPj4gWUVTLCBrc2VsZnRlc3QgaGFzIGluLWtlcm5lbCB0ZXN0cy4gIChFeGN1c2UgdGhlIHNo
b3V0aW5nLi4uKQo+ID4gCj4gPiBDb29sLiBGcm9tIG15IGN1cnNvcnkgbG9vaywgaW4gbXkgb3Bp
bmlvbiwgdGhlc2Ugd291bGQgYmUgZ3JlYXRseQo+ID4gaW1wcm92ZWQgYnkgY29udmVydGluZyB0
aGVtIHRvIHRoZSBmcmFtZXdvcmsgQnJlbmRhbiBpcyBwcm9wb3NpbmcgZm9yIEt1bml0Lgo+ID4g
Cj4gPj4+IElmIHRoZXkgZG8gZXhpc3RzLCBpdCBzZWVtcyBsaWtlIGl0IHdvdWxkIG1ha2Ugc2Vu
c2UgdG8KPiA+Pj4gY29udmVydCB0aG9zZSB0byBrdW5pdCBhbmQgaGF2ZSBLdW5pdCB0ZXN0cyBy
dW4tYWJsZSBpbiBhIFZNIG9yCj4gPj4+IGJhcmVtZXRhbCBpbnN0YW5jZS4KPiA+Pgo+ID4+IFRo
ZXkgYWxyZWFkeSBydW4gaW4gYSBWTS4KPiA+Pgo+ID4+IFRoZXkgYWxyZWFkeSBydW4gb24gYmFy
ZSBtZXRhbC4KPiA+Pgo+ID4+IFRoZXkgYWxyZWFkeSBydW4gaW4gVU1MLgo+ID4gCj4gPiBTaW1w
bHkgYmVpbmcgYWJsZSB0byBydW4gaW4gVU1MIGlzIG5vdCB0aGUgb25seSB0aGluZyBoZXJlLiBL
dW5pdAo+ID4gcHJvdmlkZXMgdGhlIGluZnJhc3RydWN0dXJlIHRvIHF1aWNrbHkgYnVpbGQsIHJ1
biBhbmQgcmVwb3J0IHJlc3VsdHMgZm9yCj4gPiBhbGwgdGhlIHRlc3RzIGZyb20gdXNlcnNwYWNl
IHdpdGhvdXQgbmVlZGluZyB0byB3b3JyeSBhYm91dCB0aGUgZGV0YWlscwo+ID4gb2YgYnVpbGRp
bmcgYW5kIHJ1bm5pbmcgYSBVTUwga2VybmVsLCB0aGVuIHBhcnNpbmcgZG1lc2cgdG8gZmlndXJl
IG91dAo+ID4gd2hhdCB0ZXN0cyB3ZXJlIHJ1biBvciBub3QuCj4gCj4gWWVzLiAgQnV0IHRoYXQg
aXMgbm90IHRoZSBvbmx5IGVudmlyb25tZW50IHRoYXQgS1VuaXQgbXVzdCBzdXBwb3J0IHRvIGJl
Cj4gb2YgdXNlIHRvIG1lIGZvciBkZXZpY2V0cmVlIHVuaXR0ZXN0cyAodGhpcyBpcyBub3QgbmV3
LCBCcmVuZGFuIGlzIHF1aXRlCj4gYXdhcmUgb2YgbXkgbmVlZHMgYW5kIGlzIG5vdCBpZ25vcmlu
ZyB0aGVtKS4KPiAKPiAKPiA+PiBUaGlzIGlzIG5vdCB0byBzYXkgdGhhdCBLVW5pdCBkb2VzIG5v
dCBtYWtlIHNlbnNlLiAgQnV0IEknbSBzdGlsbCB0cnlpbmcKPiA+PiB0byBnZXQgYSBiZXR0ZXIg
ZGVzY3JpcHRpb24gb2YgdGhlIEtVbml0IGZlYXR1cmVzIChhbmQgdGhlcmUgYXJlCj4gPj4gc29t
ZSkuCj4gPiAKPiA+IFNvIHJlYWQgdGhlIHBhdGNoZXMsIG9yIHRoZSBkb2N1bWVudGF0aW9uWzFd
IG9yIHRoZSBMV04gYXJ0aWNsZVsyXS4gSXQncwo+ID4gcHJldHR5IHdlbGwgZGVzY3JpYmVkIGlu
IGEgbG90IG9mIHBsYWNlcyAtLSB0aGF0J3Mgb25lIG9mIHRoZSBiaWcKPiA+IGFkdmFudGFnZXMg
b2YgaXQuIEluIGNvbnRyYXN0LCBmZXcgcGVvcGxlIHNlZW1zIHRvIGhhdmUgYW55IGNvbmNlcHQg
b2YKPiA+IHdoYXQga3NlbGZ0ZXN0cyBhcmUgb3Igd2hlcmUgdGhleSBhcmUgb3IgaG93IHRvIHJ1
biB0aGVtIChJIHdhcwo+ID4gc3VycHJpc2VkIHRvIGZpbmQgdGhlIGluLWtlcm5lbCB0ZXN0cyBp
biB0aGUgbGliIHRyZWUpLgo+ID4gCj4gPiBMb2dhbgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9nb29n
bGUuZ2l0aHViLmlvL2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2VybmVsL2RvY3MvCj4gPiBbMl0g
aHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzc4MDk4NS8KPiAKPiBJIGhhdmUgYmVlbiBmb2xsb3dp
bmcgdGhlIFJGQyB2ZXJzaW9ucy4gIEkgaGF2ZSBpbnN0YWxsZWQgdGhlIFJGQyBwYXRjaGVzCj4g
YW5kIHJ1biB0aGVtIHRvIHRoZSBleHRlbnQgdGhhdCB0aGV5IHdvcmtlZCAoZGV2aWNldHJlZSB1
bml0dGVzdHMgd2VyZQo+IGEgZ3VpbmVhIHBpZyBmb3IgdGVzdCBjb252ZXJzaW9uIGluIHRoZSBS
RkMgc2VyaWVzLCBidXQgdGhlIGNvbnZlcnRlZAo+IHRlc3RzIGRpZCBub3Qgd29yaykuICBJIHJl
YWQgcG9ydGlvbnMgb2YgdGhlIGNvZGUgd2hpbGUgdHJ5aW5nIHRvCj4gdW5kZXJzdGFuZCB0aGUg
dW5pdHRlc3RzIGNvbnZlcnNpb24uICBJIG1hZGUgcmV2aWV3IGNvbW1lbnRzIGJhc2VkIG9uCj4g
dGhlIHBvcnRpb24gb2YgdGhlIGNvZGUgdGhhdCBJIGRpZCByZWFkLiAgSSBoYXZlIHJlYWQgdGhl
IGRvY3VtZW50YXRpb24KPiAodmVyeSBuaWNlIGJ0dywgYXMgSSBoYXZlIHNhaWQgYmVmb3JlLCBi
dXQgc2hvdWxkIGJlIGV4cGFuZGVkKS4KPiAKPiBNeSBjb21tZW50IGlzIHRoYXQgdGhlIGRlc2Ny
aXB0aW9uIHRvIHN1Ym1pdCB0aGUgcGF0Y2ggc2VyaWVzIHNob3VsZAo+IGJlIGZ1bGxlciAtLSBL
VW5pdCBwb3RlbnRpYWxseSBoYXMgYSBsb3Qgb2YgbmljZSBhdHRyaWJ1dGVzLCBhbmQgSQo+IHN0
aWxsIHRoaW5rIEkgaGF2ZSBvbmx5IHNjcmF0Y2hlZCB0aGUgc3VyZmFjZS4gIFRoZSBhdmVyYWdl
IHJldmlld2VyCj4gbWF5IGhhdmUgZXZlbiBsZXNzIGluLWRlcHRoIGtub3dsZWRnZSB0aGFuIEkg
ZG8uICBBbmQgYXMgSSBoYXZlCj4gY29tbWVudGVkIGJlZm9yZSwgSSBrZWVwIGRpdmluZyBpbnRv
IGFyZWFzIHRoYXQgSSBoYWQgbm8gcHJldmlvdXMKPiBleHBlcmllbmNlIHdpdGggKHN1Y2ggYXMg
a3NlbGZ0ZXN0KSB0byBiZSBhYmxlIHRvIHByb3Blcmx5IGp1ZGdlIHRoaXMKPiBwYXRjaCBzZXJp
ZXMuCgpUaGFua3MgZm9yIHRoZSBwcmFpc2UhIFRoYXQgbWVhbnMgYSBsb3QgY29taW5nIGZyb20g
eW91IQoKSSByZWFsbHkgY2Fubm90IGRpc2FncmVlIHRoYXQgSSBjb3VsZCB1c2UgbW9yZSBkb2N1
bWVudGF0aW9uLiBZb3UgY2FuCnByZXR0eSBtdWNoIGFsd2F5cyB1c2UgbW9yZSBkb2N1bWVudGF0
aW9uLiBOZXZlcnRoZWxlc3MsIGlzIHRoZXJlIGEKcGFydGljdWxhciBwYXJ0IG9mIHRoZSBkb2N1
bWVudGF0aW9uIHRoYXQgeW91IHRoaW5rIGl0IGxhY2tpbmc/CgpJdCBzb3VuZHMgbGlrZSB0aGVy
ZSB3YXMgYSBwcmV0dHkgbG9uZyBkaXNjdXNzaW9uIGhlcmUgYWJvdXQsIGEgbnVtYmVyCm9mIGRp
ZmZlcmVudCB0aGluZ3MuCgpEbyB5b3Ugd2FudCBhIGJldHRlciBkZXNjcmlwdGlvbiBvZiB3aGF0
IHVuaXQgdGVzdGluZyBpcyBhbmQgaG93IEtVbml0CmhlbHBzIG1ha2UgaXQgcG9zc2libGU/CgpE
byB5b3Ugd2FudCBtb3JlIG9mIGFuIGV4cGxhbmF0aW9uIGRpc3Rpbmd1aXNoaW5nIEtVbml0IGZy
b20ga3NlbGZ0ZXN0PwpIb3cgc28/CgpEbyB5b3UganVzdCB3YW50IGJldHRlciBkb2N1bWVudGF0
aW9uIG9uIGhvdyB0byB0ZXN0IHRoZSBrZXJuZWw/IFdoYXQKdG9vbHMgd2UgaGF2ZSBhdCBvdXIg
ZGlzcG9zYWwgYW5kIHdoZW4gdG8gdXNlIHdoYXQgdG9vbHM/CgpUaGFua3MhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
