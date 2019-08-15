Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E965B8F59B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 22:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5C6EA6E;
	Thu, 15 Aug 2019 20:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525BB6EA6D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 20:16:55 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id e12so7529470otp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 13:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qTHh9ZK37xd08x9Ue/sJIZ77olqIpSOlqxcia7YCCRQ=;
 b=OHffW8ujlJhXUITMryQnVf9+WMdCF68uMk5q8FODzuUe21GxWUBQRUGNp2juuesD72
 JNrVWewPoFcJ5AFTJ5K7N12yUJgZFHF9wv4mEpeJvnlMNMhKjGUzwJvP0EWUm/AERpIK
 AMBAFJpBJJt3Mipef20yUZHRfUcSxByh5swWeaoTJZo+o7M6mVtKtYw4c4ffyYsfNXy9
 HJoGTFVY9uFX8AWnPfVFyYaGd1ZuD+BZq7VOj2Otp998P3T24VpnEDikWTO+mYy4SqdY
 Cv3fqgvGiClAwnuFAVQ8q2/aDXY4PVIuqhOkLac07u0HGghtqHzKKN0EFMhB2flZf+FX
 3d1g==
X-Gm-Message-State: APjAAAWkKdYuQX2EJ5UV1K/NVljenQUkF+ZoXuxfDvMrHhViK6VAX6m/
 Tcg6mcvIPa1SX58QWCnA2iEKyJxl76W8fg+3e0SMGQ==
X-Google-Smtp-Source: APXvYqxHW0wNM9I7rIoKCFgGR912iydB5fNuej2q7geNF6Dfxo4Lg+k3yOUXV/RnGF0DaFYbEZaKpNxIAvab1cVA2E0=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr5284545oto.204.1565900214485; 
 Thu, 15 Aug 2019 13:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190815065829.GA7444@phenom.ffwll.local>
 <20190815122344.GA21596@ziepe.ca>
 <20190815132127.GI9477@dhcp22.suse.cz> <20190815141219.GF21596@ziepe.ca>
 <20190815155950.GN9477@dhcp22.suse.cz> <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz> <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz> <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
In-Reply-To: <20190815193526.GT9477@dhcp22.suse.cz>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Aug 2019 22:16:43 +0200
Message-ID: <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
To: Michal Hocko <mhocko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qTHh9ZK37xd08x9Ue/sJIZ77olqIpSOlqxcia7YCCRQ=;
 b=kiM9EkjfkkvV2acXtyuHtZlSwyxVFy/luh62JpSLtwDDqFGrqqv/l8fVfIHPp21MCP
 7SmEesVoHHEi/iJMWm4H/Jl4/ZHJ7gBZkP4lp2VTsSGgM/twhyanBIFDeYKJhMAfWLUJ
 EmiJ2M3g4FY95dria69FfMx+Qm3RsWWUVpCIo=
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgOTozNSBQTSBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSAxNS0wOC0xOSAxNjoxODoxMCwgSmFzb24gR3VudGhv
cnBlIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDk6MDU6MjVQTSArMDIwMCwg
TWljaGFsIEhvY2tvIHdyb3RlOgo+ID4KPiA+ID4gVGhpcyBpcyB3aGF0IHlvdSBjbGFpbSBhbmQg
SSBhbSBzYXlpbmcgdGhhdCBmc19yZWNsYWltIGlzIGFib3V0IGEKPiA+ID4gcmVzdHJpY3RlZCBy
ZWNsYWltIGNvbnRleHQgYW5kIGl0IGlzIGFuIHVnbHkgaGFjay4gSXQgaGFzIHByb3ZlbiB0bwo+
ID4gPiByZXBvcnQgZmFsc2UgcG9zaXRpdmVzLiBNYXliZSBpdCBjYW4gYmUgZXh0ZW5kZWQgdG8g
YSBnZW5lcmljIHJlY2xhaW0uCj4gPiA+IEkgaGF2ZW4ndCB0cmllZCB0aGF0LiBEbyBub3QgYWlt
IHRvIHRyeSBpdC4KPiA+Cj4gPiBPa2F5LCBncmVhdCwgSSB0aGluayB0aGlzIGhhcyBiZWVuIHZl
cnkgaGVscGZ1bCwgYXQgbGVhc3QgZm9yIG1lLAo+ID4gdGhhbmtzLiBJIGRpZCBub3Qga25vdyBm
c19yZWNsYWltIHdhcyBzbyBwcm9ibGVtYXRpYywgb3IgdGhlIHNwZWNpYWwKPiA+IGNhc2VzIGFi
b3V0IE9PTSAncmVjbGFpbScuCj4KPiBJIGFtIGhhcHB5IHRoYXQgdGhpcyBpcyBtb3JlIGNsZWFy
IG5vdy4KPgo+ID4gT24gdGhpcyBwYXRjaCwgSSBoYXZlIG5vIGdlbmVyYWwgb2JqZWN0aW9uIHRv
IGVuZm9yY2luZyBkcml2ZXJzIHRvIGJlCj4gPiBub24tYmxvY2tpbmcsIEknZCBqdXN0IGxpa2Ug
dG8gc2VlIGl0IGRvbmUgd2l0aCB0aGUgZXhpc3RpbmcgbG9ja2RlcAo+ID4gY2FuJ3Qgc2xlZXAg
ZGV0ZWN0aW9uIHJhdGhlciB0aGFuIGludmVudGluZyBzb21lIG5ldyBkZWJ1Z2dpbmcgZm9yIGl0
Lgo+ID4KPiA+IEkgdW5kZXJzdGFuZCB0aGlzIG1lYW5zIHRoZSBkZWJ1Z2dpbmcgcmVxdWlyZXMg
bG9ja2RlcCBlbmFibGVkIGFuZAo+ID4gd2lsbCBub3QgcnVuIGluIHByb2R1Y3Rpb24sIGJ1dCBJ
J20gb2YgdGhlIHZpZXcgdGhhdCBpcyBPSyBhbmQgaW4gbGluZQo+ID4gd2l0aCBnZW5lcmFsIGtl
cm5lbCBwcmFjdGljZS4KPgo+IFllcyBhbmQgSSBkbyBhZ3JlZSB3aXRoIHRoaXMgaW4gZ2VuZXJh
bC4KClNvIGlmIHNvbWVvbmUgY2FuIGV4cGxhaW4gdG8gbWUgaG93IHRoYXQgd29ya3Mgd2l0aCBs
b2NrZGVwIEkgY2FuIG9mCmNvdXJzZSBpbXBsZW1lbnQgaXQuIEJ1dCBhZmFpY3MgdGhhdCBkb2Vz
bid0IGV4aXN0IChJIHRyaWVkIHRvIGV4cGxhaW4KdGhhdCBzb21ld2hlcmUgZWxzZSBhbHJlYWR5
KSwgYW5kIEknbSBubyByZWFsbHkgbG9va2luZyBmb3J3YXJkIHRvCmhhY2tpbmcgYWxzbyBvbiBs
b2NrZGVwIGZvciB0aGlzIGxpdHRsZSBzZXJpZXMuCgo+ID4gVGhlIGxhc3QgZGV0YWlsIGlzIEkn
bSBzdGlsbCB1bmNsZWFyIHdoYXQgYSBHRlAgZmxhZ3MgYSBibG9ja2FibGUKPiA+IGludmFsaWRh
dGVfcmFuZ2Vfc3RhcnQoKSBzaG91bGQgdXNlLiBJcyBHRlBfS0VSTkVMIE9LPwo+Cj4gSSBob3Bl
IEkgd2lsbCBub3QgbWFrZSB0aGlzIG11ZGR5IGFnYWluIDspCj4gaW52YWxpZGF0ZV9yYW5nZV9z
dGFydCBpbiB0aGUgYmxvY2thYmxlIG1vZGUgY2FuIHVzZS9kZXBlbmQgb24gYW55IHNsZWVwYWJs
ZQo+IGFsbG9jYXRpb24gYWxsb3dlZCBpbiB0aGUgY29udGV4dCBpdCBpcyBjYWxsZWQgZnJvbS4g
U28gaW4gb3RoZXIgd29yZHMKPiBpdCBpcyBubyBkaWZmZXJlbnQgZnJvbSBhbnkgb3RoZXIgZnVu
Y3Rpb24gaW4gdGhlIGtlcm5lbCB0aGF0IGNhbGxzIGludG8KPiBhbGxvY2F0b3IuIEFzIHRoZSBB
UEkgaXMgbWlzc2luZyBnZnAgY29udGV4dCB0aGVuIEkgaG9wZSBpdCBpcyBub3QKPiBjYWxsZWQg
ZnJvbSBhbnkgcmVzdHJpY3RlZCBjb250ZXh0cyAoZXhjZXB0IGZyb20gdGhlIG9vbSB3aGljaCB3
ZSBoYXZlCj4gIWJsb2NrYWJsZSBmb3IpLgoKSG0sIHRoYXQncyBuZXcgdG8gbWUuIEkgdGhvdWdo
dCBtbXUgbm90aWZpZXJzIHZlcnkgbXVjaCBjYW4gYmUgY2FsbGVkCmZyb20gZGlyZWN0IHJlY2xh
aW0gcGF0aHMsIHNvIHlvdSBoYXZlIHRvIGJlIGV4dHJlbWVseSBjYXJlZnVsIHdpdGgKZ2V0dGlu
ZyBiYWNrIGludG8gdGhhdCBvbmUuIEF0IGxlYXN0IHRoZSBsb2NrZGVwIHNwbGF0cyBJIHJlbWVt
YmVyCmFsc28gdGVuZCB0byBoYXZlIGZzX3JlY2xhaW0gaW4gdGhlcmUsIHRoYXQncyB3aGVyZSBh
bGwgdGhlIGZ1biBjb21lcwpmcm9tLgoKPiA+IExvY2tkZXAgaGFzCj4gPiBjb21wbGFpbmVkIG9u
IHRoYXQgaW4gcGFzdCBkdWUgdG8gZnNfcmVjbGFpbSAtIGhvdyBkbyB5b3Uga25vdyBpZiBpdAo+
ID4gaXMgYSBmYWxzZSBwb3NpdGl2ZT8KPgo+IEkgd291bGQgaGF2ZSB0byBzZWUgdGhlIHNwZWNp
ZmljIGxvY2tkZXAgc3BsYXQuCgpJIGd1ZXNzIHRoZSBsb2NrZGVwIGFubm90YXRpb24gZm9yIGlu
dmFsaWRhdGVfcmFuZ2Vfc3RhcnQgY2FycmllcyB0aGUKc2FtZSByaXNrcyBhcyB0aGUgZnNfcmVj
bGFpbSBhbm5vdGF0aW9uLiBTdGlsbCBmZWVscyBsaWtlIHdvcnRoIGl0LgotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
