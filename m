Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C28742F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810E26E1F7;
	Fri,  9 Aug 2019 08:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFFE6E1F7;
 Fri,  9 Aug 2019 08:34:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD89FAE49;
 Fri,  9 Aug 2019 08:34:36 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id DC04B1E437E; Fri,  9 Aug 2019 10:34:35 +0200 (CEST)
Date: Fri, 9 Aug 2019 10:34:35 +0200
From: Jan Kara <jack@suse.cz>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Message-ID: <20190809083435.GA17568@quack2.suse.cz>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
 <20190807083726.GA14658@quack2.suse.cz>
 <20190807084649.GQ11812@dhcp22.suse.cz>
 <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 john.hubbard@gmail.com, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDA3LTA4LTE5IDE5OjM2OjM3LCBJcmEgV2Vpbnkgd3JvdGU6Cj4gT24gV2VkLCBBdWcg
MDcsIDIwMTkgYXQgMTA6NDY6NDlBTSArMDIwMCwgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4gPiBT
byBJIHRoaW5rIHlvdXIgZGVidWcgb3B0aW9uIGFuZCBteSBzdWdnZXN0ZWQgcmVuYW1pbmcgc2Vy
dmUgYSBiaXQKPiA+ID4gZGlmZmVyZW50IHB1cnBvc2VzIChhbmQgdGh1cyBib3RoIG1ha2Ugc2Vu
c2UpLiBJZiB5b3UgZG8gdGhlIHJlbmFtaW5nLCB5b3UKPiA+ID4gY2FuIGp1c3QgZ3JlcCB0byBz
ZWUgdW5jb252ZXJ0ZWQgc2l0ZXMuIEFsc28gd2hlbiBzb21lb25lIG1lcmdlcyBuZXcgR1VQCj4g
PiA+IHVzZXIgKHVuYXdhcmUgb2YgdGhlIG5ldyBydWxlcykgd2hpbGUgeW91IHN3aXRjaCBHVVAg
dG8gdXNlIHBpbnMgaW5zdGVhZCBvZgo+ID4gPiBvcmRpbmFyeSByZWZlcmVuY2VzLCB5b3UnbGwg
Z2V0IGNvbXBpbGF0aW9uIGVycm9yIGluIGNhc2Ugb2YgcmVuYW1pbmcKPiA+ID4gaW5zdGVhZCBv
ZiBoYXJkIHRvIGRlYnVnIHJlZmNvdW50IGxlYWsgd2l0aG91dCB0aGUgcmVuYW1pbmcuIEFuZCBz
dWNoCj4gPiA+IGNvbmZsaWN0IGlzIGFsbW9zdCBib3VuZCB0byBoYXBwZW4gZ2l2ZW4gdGhlIHNp
emUgb2YgR1VQIHBhdGNoIHNldC4uLiBBbHNvCj4gPiA+IHRoZSByZW5hbWluZyBzZXJ2ZXMgYWdh
aW5zdCB0aGUgImNvZGluZyBpbmVydGlhIiAtIGkuZS4sIEdVUCBpcyBhcm91bmQgZm9yCj4gPiA+
IGFnZXMgc28gcGVvcGxlIGp1c3QgdXNlIGl0IHdpdGhvdXQgY2hlY2tpbmcgYW55IGRvY3VtZW50
YXRpb24gb3IgY29tbWVudHMuCj4gPiA+IEFmdGVyIHN3aXRjaGluZyBob3cgR1VQIHdvcmtzLCB3
aGF0IHVzZWQgdG8gYmUgY29ycmVjdCBpc24ndCBhbnltb3JlIHNvCj4gPiA+IHJlbmFtaW5nIHRo
ZSBmdW5jdGlvbiBzZXJ2ZXMgYXMgYSB3YXJuaW5nIHRoYXQgc29tZXRoaW5nIGhhcyByZWFsbHkK
PiA+ID4gY2hhbmdlZC4KPiA+IAo+ID4gRnVsbHkgYWdyZWVkIQo+IAo+IE9rIFByaW9yIHRvIHRo
aXMgSSd2ZSBiZWVuIGJhc2luZyBhbGwgbXkgd29yayBmb3IgdGhlIFJETUEvRlMgREFYIHN0dWZm
IGluCj4gSm9obnMgcHV0X3VzZXJfcGFnZXMoKS4uLiAgKEluY2x1ZGluZyB3aGVuIEkgcHJvcG9z
ZWQgZmFpbGluZyB0cnVuY2F0ZSB3aXRoIGEKPiBsZWFzZSBpbiBKdW5lIFsxXSkKPiAKPiBIb3dl
dmVyLCBiYXNlZCBvbiB0aGUgc3VnZ2VzdGlvbnMgaW4gdGhhdCB0aHJlYWQgaXQgYmVjYW1lIGNs
ZWFyIHRoYXQgYSBuZXcKPiBpbnRlcmZhY2Ugd2FzIGdvaW5nIHRvIG5lZWQgdG8gYmUgYWRkZWQg
dG8gcGFzcyBpbiB0aGUgIlJETUEgZmlsZSIgaW5mb3JtYXRpb24KPiB0byBHVVAgdG8gYXNzb2Np
YXRlIGZpbGUgcGlucyB3aXRoIHRoZSBjb3JyZWN0IHByb2Nlc3Nlcy4uLgo+IAo+IEkgaGF2ZSBt
YW55IGRyYXdpbmdzIG9uIG15IHdoaXRlIGJvYXJkIHdpdGggImEgd2hvbGUgbG90IG9mIGxpbmVz
IiBvbiB0aGVtIHRvCj4gbWFrZSBzdXJlIHRoYXQgaWYgYSBwcm9jZXNzIG9wZW5zIGEgZmlsZSwg
bW1hcHMgaXQsIHBpbnMgaXQgd2l0aCBSRE1BLCBfY2xvc2VzXwo+IGl0LCBhbmQgdW1tYXBzIGl0
OyB0aGF0IHRoZSByZXN1bHRpbmcgZmlsZSBwaW4gY2FuIHN0aWxsIGJlIHRyYWNlZCBiYWNrIHRv
IHRoZQo+IFJETUEgY29udGV4dCBhbmQgYWxsIHRoZSBwcm9jZXNzZXMgd2hpY2ggbWF5IGhhdmUg
YWNjZXNzIHRvIGl0Li4uLiAgTm8gbWF0dGVyCj4gd2hlcmUgdGhlIG9yaWdpbmFsIGNvbnRleHQg
bWF5IGhhdmUgY29tZSBmcm9tLiAgSSBiZWxpZXZlIEkgaGF2ZSBhY2NvbXBsaXNoZWQKPiB0aGF0
Lgo+IAo+IEJlZm9yZSBJIGdvIG9uLCBJIHdvdWxkIGxpa2UgdG8gc2F5IHRoYXQgdGhlICJpbWJh
bGFuY2UiIG9mIGdldF91c2VyX3BhZ2VzKCkKPiBhbmQgcHV0X3BhZ2UoKSBib3RoZXJzIG1lIGZy
b20gYSBwdXJpc3Qgc3RhbmRwb2ludC4uLiAgSG93ZXZlciwgc2luY2UgdGhpcwo+IGRpc2N1c3Np
b24gY3JvcHBlZCB1cCBJIHdlbnQgYWhlYWQgYW5kIHBvcnRlZCBteSB3b3JrIHRvIExpbnVzJyBj
dXJyZW50IG1hc3Rlcgo+ICg1LjMtcmMzKykgYW5kIGluIGRvaW5nIHNvIEkgb25seSBoYWQgdG8g
c3RlYWwgYSBiaXQgb2YgSm9obnMgY29kZS4uLiAgU29ycnkKPiBKb2huLi4uICA6LSgKPiAKPiBJ
IGRvbid0IGhhdmUgdGhlIGNvbW1pdCBtZXNzYWdlcyBhbGwgY2xlYW5lZCB1cCBhbmQgSSBrbm93
IHRoZXJlIG1heSBiZSBzb21lCj4gZGlzY3Vzc2lvbiBvbiB0aGVzZSBuZXcgaW50ZXJmYWNlcyBi
dXQgSSB3YW50ZWQgdG8gdGhyb3cgdGhpcyBzZXJpZXMgb3V0IHRoZXJlCj4gYmVjYXVzZSBJIHRo
aW5rIGl0IG1heSBiZSB3aGF0IEphbiBhbmQgTWljaGFsIGFyZSBkcml2aW5nIGF0IChvciBhdCBs
ZWFzdCBpbgo+IHRoYXQgZGlyZWN0aW9uLgo+IAo+IFJpZ2h0IG5vdyBvbmx5IFJETUEgYW5kIERB
WCBGUydzIGFyZSBzdXBwb3J0ZWQuICBPdGhlciB1c2VycyBvZiBHVVAgd2lsbCBzdGlsbAo+IGZh
aWwgb24gYSBEQVggZmlsZSBhbmQgcmVndWxhciBmaWxlcyB3aWxsIHN0aWxsIGJlIGF0IHJpc2su
WzJdCj4gCj4gSSd2ZSBwdXNoZWQgdGhpcyB3b3JrIChiYXNlZCA1LjMtcmMzKyAoMzM5MjBmMWVj
NWJmKSkgaGVyZVszXToKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vd2VpbnkyL2xpbnV4LWtlcm5l
bC90cmVlL2xpbnVzLXJkbWFmc2RheC1iMC12Mwo+IAo+IEkgdGhpbmsgdGhlIG1vc3QgcmVsZXZh
bnQgcGF0Y2ggdG8gdGhpcyBjb252ZXJzYXRpb24gaXM6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29t
L3dlaW55Mi9saW51eC1rZXJuZWwvY29tbWl0LzVkMzc3NjUzYmE1Y2YxMWMzYjcxNmY5MDRiMDU3
YmVlNjY0MWFhZjYKPiAKPiBJIHN0b2xlIEphbnMgc3VnZ2VzdGlvbiBmb3IgYSBuYW1lIGFzIHRo
ZSBuYW1lIEkgdXNlZCB3aGlsZSBwcm90b3R5cGluZyB3YXMKPiBwcmV0dHkgYmFkLi4uICBTbyBU
aGFua3MgSmFuLi4uICA7LSkKCkZvciB5b3VyIGZ1bmN0aW9uLCBJJ2QgY2hvb3NlIGEgbmFtZSBs
aWtlIHZhZGRyX3Bpbl9sZWFzZWRfcGFnZXMoKSBzbyB0aGF0CmFzc29jaWF0aW9uIHdpdGggYSBs
ZWFzZSBpcyBjbGVhciBmcm9tIHRoZSBuYW1lIDopIEFsc28gSSdkIGNob29zZSB0aGUKY291bnRl
cnBhcnQgdG8gYmUgdmFkZHJfdW5waW5fbGVhc2VkX3BhZ2Vbc10oKS4gRXNwZWNpYWxseSBoYXZp
bmcgcHV0X3BhZ2UgaW4KdGhlIG5hbWUgbG9va3MgY29uZnVzaW5nIHRvIG1lLi4uCgoJCQkJCQkJ
CUhvbnphCgotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFicywgQ1IKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
