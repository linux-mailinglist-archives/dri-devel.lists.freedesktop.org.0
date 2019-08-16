Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E829114E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938786E552;
	Sat, 17 Aug 2019 15:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD8C6E44C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 14:31:47 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r21so4913251qke.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 07:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BZuTpFWe2nt7y+/QS811q/nmqipRVURrHatiPCF7ae4=;
 b=o/QMgAiITIk4fXWYJnr2kYlOAWYsAK8tBK0mYS00CFFYG/X8ubWlR7TNTPTrXsevF/
 o7TDZ2HhHoBGpTwOhn/4DSxJYXErg9kSxUTBdCoGt3DCNA+0tlhLshUTPuJBwslgaDsq
 m6FiE5E7flnU8FoW1gu19rdoCvCBaTW83F+E86wH8mTAoZSM8MRDrlyrJudevS1BjbQP
 3BjWFEiEbq674iQ065XxvsM1mIrjZ1j14QsXeuFBCF6qhWOD1Jdkt2XhwOCyYmZbYjzQ
 1FtIKvh9hIGrl6uHYxMEyPmRnoJAoxaycEtgGlq84tUTizDL/x1FQ3k1fIDLh/pQYKMB
 DsmQ==
X-Gm-Message-State: APjAAAXalEDdkWxLSHBDKoak6Wyj/j22QyiQVpwdLE0GvhsgRg15aUYa
 dX8yO4yhTiJZJY7pQM6lHXT4Vg==
X-Google-Smtp-Source: APXvYqyHeNGMSajC8LayRoc9yXnyTbryp7gzBAKte1EONsNRmPFxAu/9i1w4lJZvzvM2peXVF4NhrA==
X-Received: by 2002:a37:8ac7:: with SMTP id m190mr8450373qkd.385.1565965906561; 
 Fri, 16 Aug 2019 07:31:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 6sm3412555qtu.15.2019.08.16.07.31.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 07:31:45 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hydGb-0003DR-B1; Fri, 16 Aug 2019 11:31:45 -0300
Date: Fri, 16 Aug 2019 11:31:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190816143145.GD5398@ziepe.ca>
References: <20190815165631.GK21596@ziepe.ca>
 <20190815174207.GR9477@dhcp22.suse.cz>
 <20190815182448.GP21596@ziepe.ca>
 <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <20190815201323.GU21596@ziepe.ca>
 <20190816081029.GA27790@dhcp22.suse.cz>
 <20190816121906.GC5398@ziepe.ca>
 <20190816122625.GA10499@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816122625.GA10499@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BZuTpFWe2nt7y+/QS811q/nmqipRVURrHatiPCF7ae4=;
 b=BByaPnWhPiJu1NxST08KD8o3VHHoiXCwSeRF5WRkI/A6iSsJdYieYRZABO+ij0Wygo
 Lo/VJnPn76360uFCIIy+stRki3L1XZCSg1jPNkH82SaVmeEYzi7frVKaZzL2sstBoAE5
 YuTpZ9a+sHGLMn7wSAkZ4xaZH5NHgu5+lQiwjltkkU4Xchb+3WFO1/OT/SsMyB5YTCKq
 vGn4XXff29JRy16xTaGRBisMX9dVxL0S14uarJH8M7adfNiA41rbssBJ5gJ3x/l6WkfM
 cVG0i4r+p0/g8qVkqC3D4MPpQ0JFBX01PwrhMyxSAIovASAQQbfTTtwsyQ5rzvsif2+g
 mo5Q==
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
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org DRI Development" <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDI6MjY6MjVQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIEZyaSAxNi0wOC0xOSAwOToxOTowNiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTA6MTA6MjlBTSArMDIwMCwgTWljaGFsIEhvY2tv
IHdyb3RlOgo+ID4gPiBPbiBUaHUgMTUtMDgtMTkgMTc6MTM6MjMsIEphc29uIEd1bnRob3JwZSB3
cm90ZToKPiA+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwOTozNToyNlBNICswMjAwLCBN
aWNoYWwgSG9ja28gd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoZSBsYXN0IGRldGFpbCBp
cyBJJ20gc3RpbGwgdW5jbGVhciB3aGF0IGEgR0ZQIGZsYWdzIGEgYmxvY2thYmxlCj4gPiA+ID4g
PiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBzaG91bGQgdXNlLiBJcyBHRlBfS0VSTkVMIE9L
Pwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGhvcGUgSSB3aWxsIG5vdCBtYWtlIHRoaXMgbXVkZHkg
YWdhaW4gOykKPiA+ID4gPiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgaW4gdGhlIGJsb2NrYWJs
ZSBtb2RlIGNhbiB1c2UvZGVwZW5kIG9uIGFueSBzbGVlcGFibGUKPiA+ID4gPiA+IGFsbG9jYXRp
b24gYWxsb3dlZCBpbiB0aGUgY29udGV4dCBpdCBpcyBjYWxsZWQgZnJvbS4gCj4gPiA+ID4gCj4g
PiA+ID4gJ2luIHRoZSBjb250ZXh0IGlzIGlzIGNhbGxlZCBmcm9tJyBpcyB0aGUgbWFnaWMgcGhy
YXNlLCBhcwo+ID4gPiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgaXMgY2FsbGVkIHdoaWxlIGhv
bGRpbmcgc2V2ZXJhbCBkaWZmZXJlbnQgbW0KPiA+ID4gPiByZWxhdGVkIGxvY2tzLiBJIGtub3cg
YXQgbGVhc3Qgd3JpdGUgbW1hcF9zZW0gYW5kIGlfbW1hcF9yd3NlbQo+ID4gPiA+ICh3cml0ZT8p
Cj4gPiA+ID4gCj4gPiA+ID4gQ2FuIEdGUF9LRVJORUwgYmUgY2FsbGVkIHdoaWxlIGhvbGRpbmcg
dGhvc2UgbG9ja3M/Cj4gPiA+IAo+ID4gPiBpX21tYXBfcndzZW0gd291bGQgYmUgcHJvYmxlbWF0
aWMgYmVjYXVzZSBpdCBpcyB0YWtlbiBkdXJpbmcgdGhlCj4gPiA+IHJlY2xhaW0uCj4gPiAKPiA+
IE9rYXkuLiBTbyB0aGUgZnNfcmVjbGFpbSBkZWJ1Z2dpbmcgZG9lcyBjYXRjaCBlcnJvcnMuCj4g
Cj4gSSBkbyBub3QgdGhpbmsgZnNfcmVjbGFpbSBpcyB0aGUgdWRuZXJseWluZyBtZWNoYW5pc20g
dG8gY2F0Y2ggdGhpcwo+IGRlYWRsb2NrLiAKCkluZGVlZCBsb2NrZGVwIHdvdWxkIGNhdGNoIGl0
IGRpcmVjdGx5IGFzIGFuIEFBIGRlYWRsb2NrLCBidXQgb25seSBpZgp3ZSBoYXBwZW4gdG8gdGFr
ZSB0aGUgcmVjbGFpbSBwYXRoIHVuZGVyIHRoZSBrbWFsbG9jIGluIHRoZSBub3RpZmllcgphbmQg
bHVja2VkIGludG8gaXQgYWxzbyBjaG9vc2luZyB0byBsb2NrIHRoZSBzYW1lIGxvY2sgd2UgYXJl
IGhvbGRpbmcuCgpUaGUgdHJvdWJsZSBpcyB0aGlzIGlzIHZlcnkgZGlmZmljdWx0IHRvIGhpdC4K
CmxvY2tkZXAgYWxsb3dzIG1ha2luZyB0aGlzIGxlc3MgZGlmZmljdWx0LiBGb3IgaW5zdGFuY2Ug
d2l0aCBhCidtaWdodF9yZWNsYWltKCknIGFubm90YXRpb24gaW4gdGhlIGFsbG9jYXRvciB3ZSBj
b3VsZCBjaGVjayB0aGF0IHRoZQp2YXJpb3VzIHJlY2xhaW0gcmVsYXRlZCBsb2NrcyBhcmUgb2J0
YWluYWJsZS4gVGVzdGluZyBkb2Vzbid0IG5lZWQgdG8KZ2V0IGx1Y2t5IGFuZCBnbyBkb3duIHRo
ZSB2ZXJ5IHVubGlrZWx5IHBhdGguCgpJdCB0dXJucyBvdXQgdGhpcyBpcyBhbHJlYWR5IGhhcHBl
bmluZywgaXQgaXMgYWN0dWFsbHkgYSBzaWRlIGVmZmVjdApvZiB0aGUgd2F5IGZzX3JlY2xhaW0g
d29ya3Mgbm93LgoKPiA+IERvIHlvdSBoYXZlIGFueQo+ID4gcmVmZXJlbmNlIGZvciB3aGF0IGEg
ZmFsc2UgcG9zaXRpdmUgbG9va3MgbGlrZT8gCj4gCj4gSSBiZWxpZXZlIEkgaGF2ZSBnaXZlbiBz
b21lIGV4YW1wbGVzIHdoZW4gaW50cm9kdWNpbmcgX19HRlBfTk9MT0NLREVQLgoKT2theSwgSSB0
aGluayB0aGF0IGlzIDdlNzg0NDIyNmYxMCAoImxvY2tkZXA6IGFsbG93IHRvIGRpc2FibGUgcmVj
bGFpbQpsb2NrdXAgZGV0ZWN0aW9uIikgSG1tLCBzYWRseSB0aGUgbGttbCBsaW5rIGluIHRoZSBj
b21taXQgaXMgYnJva2VuLgoKSHVtLiBUaGVyZSBhcmUgbm8gdXNlcnMgb2YgX19HRlBfTk9MT0NL
REVQIHRvZGF5Pz8gQ291bGQgYWxsIHRoZSBmYWxzZQpwb3NpdGl2ZXMgaGF2ZSBiZWVuIGZpeGVk
Pz8KCktlZXAgaW4gbWluZCB0aGF0IHRoaXMgZnNfcmVjbGFpbSB3YXMgcmV3b3JrZWQgYXdheSBm
cm9tIHRoZSBoYWNreQppbnRlcnJ1cHQgY29udGV4dCBmbGFnIHRvIGEgZmFpcmx5IGVsZWdhbnQg
cmVhbCBsb2NrIG1hcC4KCkJhc2VkIG9uIG15IHJlYWQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLCBt
eSBmaXJzdCByZWFjdGlvbiB3b3VsZCBiZSB0bwpzdWdnZXN0IGxvY2tkZXBfc2V0X2NsYXNzKCkg
dG8gc29sdmUgdGhlIHByb2JsZW0gZGVzY3JpYmVkLCBpZQpkaWZmZXJlbnQgY2xhc3NlcyBmb3Ig
J2luc2lkZSB0cmFuc2FjdGlvbicgYW5kICdvdXRzaWRlIHRyYW5zYWN0aW9uJwpvbiB4ZnNfcmVm
Y291bnRidF9pbml0X2N1cnNvcigpCgpJIHVuZGVyc3Rvb2QgdGhhdCBnZW5lcmFsbHkgdGhhdCBp
cyB0aGUgd2F5IHRvIGhhbmRsZSBsb2NrZGVwIGZhbHNlCnBvc2l0aXZlcy4KCkFueWhvdywgaWYg
eW91IGFyZSB3aWxsaW5nIHRvIGNvbnNpZGVyIHRoYXQgbG9ja2RlcCBpc24ndCBicm9rZW4sIEkK
aGF2ZSBzb21lIGlkZWFzIG9uIGhvdyB0byBtYWtlIHRoaXMgY2xlYXJlciBhbmQgaW5jcmVhc2UK
Y292ZXJhZ2UuIFdvdWxkIHlvdSBiZSB3aWxsaW5nIHRvIGxvb2sgYXQgcGF0Y2hlcyBvbiB0aGlz
IHRvcGljPyAobm90CnNvb24sIEkgaGF2ZSB0byBmaW5pc2ggbXkgbW11IG5vdGlmaWVyIHN0dWZm
KQoKPiA+IEkgd291bGQgbGlrZSB0byBpbmplY3QgaXQgaW50byB0aGUgbm90aWZpZXIgcGF0aCBh
cyB0aGlzIGlzIHZlcnkKPiA+IGRpZmZpY3VsdCBmb3IgZHJpdmVyIGF1dGhvcnMgdG8gZGlzY292
ZXIgYW5kIGtub3cgYWJvdXQsIGJ1dCBJJ20KPiA+IHdvcnJpZWQgYWJvdXQgeW91ciBmYWxzZSBw
b3NpdGl2ZSByZW1hcmsuCj4gPiAKPiA+IEkgdGhpbmsgSSB1bmRlcnN0YW5kIHdlIGNhbiB1c2Ug
b25seSBHRlBfQVRPTUlDIGluIHRoZSBub3RpZmllcnMsIGJ1dAo+ID4gd2UgbmVlZCBhIHN0cmF0
ZWd5IHRvIGhhbmRsZSBPT00gdG8gZ3VhcmVudGVlIGZvcndhcmQgcHJvZ3Jlc3MuCj4gCj4gWW91
ciBleGFtcGxlIGlzIGZyb20gdGhlIG5vdGlmaWVyIHJlZ2lzdHJhdGlvbiBJSVVDLiAKClllcywg
dGhhdCBpcyB3aGVyZSB0aGlzIGNvbW1pdCBoaXQgaXQuLiBUcmlnZ2VyaW5nIHRoaXMgdW5kZXIg
YW4KYWN0dWFsIG5vdGlmaWVyIHRvIGdldCBhIGxvY2tkZXAgcmVwb3J0IGlzIGhhcmQuCgo+IENh
biB5b3UgcHJlLWFsbG9jYXRlIGJlZm9yZSB0YWtpbmcgbG9ja3M/IENvdWxkIHlvdSBwb2ludCBt
ZSB0byBzb21lCj4gZXhhbXBsZXMgd2hlbiB0aGUgYWxsb2NhdGlvbiBpcyBuZWNlc3NhcnkgaW4g
dGhlIHJhbmdlIG5vdGlmaWVyCj4gY2FsbGJhY2s/CgpIbW0uIEkgdG9vayBhIGNhcmVmdWwgbG9v
aywgSSBvbmx5IGZvdW5kIG1seDUgYXMgb2J2aW91c2x5IGFsbG9jYXRpbmcKbWVtb3J5OgoKIG1s
eDVfaWJfaW52YWxpZGF0ZV9yYW5nZSgpCiAgbWx4NV9pYl91cGRhdGVfeGx0KCkKICAgX19nZXRf
ZnJlZV9wYWdlcyhnZnAsIGdldF9vcmRlcihzaXplKSk7CgpIb3dldmVyLCBJIHRoaW5rIHRoaXMg
Y291bGQgYmUgY2hhbmdlZCB0byBmYWxsIGJhY2sgdG8gc29tZSBzbWFsbApidWZmZXIgaWYgYWxs
b2NhdGlvbiBmYWlscy4gVGhlIGV4aXN0aW5nIHNjaGVtZSBsb29rcyBza2V0Y2h5Cgpub3V2ZWF1
IGRvZXM6Cgogbm91dmVhdV9zdm1tX2ludmFsaWRhdGUKICBudmlmX29iamVjdF9tdGhkCiAgIGtt
YWxsb2MoR0ZQX0tFUk5FTCkKCkJ1dCBJIHRoaW5rIGl0IHJlbGlhYmx5IHVzZXMgYSBzdGFjayBi
dWZmZXIgaGVyZQoKaTkxNSBJIHRoaW5rIERhbmllbCBzYWlkIGhlIGF1ZGl0ZWQuCgphbWRfbW4u
LiBUaGUgYWN0dWFsIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgZG9lcyBub3QgYWxsb2NhdGUgbWVt
b3J5LApidXQgaXQgaXMgZW50YW5nbGVkIHdpdGggc28gbWFueSBsb2NrcyBpdCB3b3VsZCBuZWVk
IGNhcmVmdWwgYW5hbHlzaXMKdG8gYmUgc3VyZS4KClRoZSBvdGhlcnMgbG9vayBnZW5lcmFsbHkg
T0ssIHdoaWNoIGlzIGdvb2QsIGJldHRlciB0aGFuIEkgaG9wZWQgOikKCkphc29uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
