Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49481E8E2
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075EC895C4;
	Wed, 15 May 2019 07:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1874489381
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 00:27:00 +0000 (UTC)
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1hQhkW-0003Ls-BO; Tue, 14 May 2019 18:26:25 -0600
To: Frank Rowand <frowand.list@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>
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
 <20190514083819.GC230665@google.com>
 <5ff098a9-9424-901c-9017-d4492e306528@gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <8c693b9f-43ec-8982-825c-cabfd61b659d@deltatee.com>
Date: Tue, 14 May 2019 18:26:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5ff098a9-9424-901c-9017-d4492e306528@gmail.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: wfg@linux.intel.com, rostedt@goodmis.org,
 rientjes@google.com, richard@nod.at, pmladek@suse.com, mpe@ellerman.id.au,
 khilman@baylibre.com, julia.lawall@lip6.fr, joel@jms.id.au, jdike@addtoit.com,
 daniel@ffwll.ch, dan.j.williams@intel.com, dan.carpenter@oracle.com,
 amir73il@gmail.com, Alexander.Levin@microsoft.com,
 linux-um@lists.infradead.org, linux-nvdimm@lists.01.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, shuah@kernel.org,
 sboyd@kernel.org, robh@kernel.org, mcgrof@kernel.org,
 kieran.bingham@ideasonboard.com, keescook@google.com,
 gregkh@linuxfoundation.org, knut.omang@oracle.com, Tim.Bird@sony.com,
 tytso@mit.edu, brendanhiggins@google.com, frowand.list@gmail.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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
 keescook@google.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA1LTE0IDY6MTQgcC5tLiwgRnJhbmsgUm93YW5kIHdyb3RlOgo+IFRoZSBoaWdo
IGxldmVsIGlzc3VlIGlzIHRvIHByb3ZpZGUgcmV2aWV3ZXJzIHdpdGggZW5vdWdoIGNvbnRleHQg
dG8gYmUKPiBhYmxlIHRvIGV2YWx1YXRlIHRoZSBwYXRjaCBzZXJpZXMuICBUaGF0IGlzIHByb2Jh
Ymx5IG5vdCB2ZXJ5IG9idmlvdXMKPiBhdCB0aGlzIHBvaW50IGluIHRoZSB0aHJlYWQuICBBdCB0
aGlzIHBvaW50IEkgd2FzIHJlc3BvbmRpbmcgdG8gTG9nYW4ncwo+IHJlc3BvbnNlIHRvIG1lIHRo
YXQgSSBzaG91bGQgYmUgcmVhZGluZyBEb2N1bWVudGF0aW9uIHRvIGdldCBhIGJldHRlcgo+IGRl
c2NyaXB0aW9uIG9mIEtVbml0IGZlYXR1cmVzLiAgSSBfdGhpbmtfIHRoYXQgTG9nYW4gdGhvdWdo
dCB0aGF0IEkKPiBkaWQgbm90IHVuZGVyc3RhbmQgS1VuaXQgZmVhdHVyZXMgYW5kIHdhcyB0cnlp
bmcgdG8gYmUgaGVscGZ1bCBieQo+IHBvaW50aW5nIG91dCB3aGVyZSBJIGNvdWxkIGdldCBtb3Jl
IGluZm9ybWF0aW9uLiAgSWYgc28sIGhlIHdhcyBtaXNzaW5nCj4gbXkgaW50ZW5kZWQgcG9pbnQg
aGFkIGJlZW4gdGhhdCBwYXRjaCAwIHNob3VsZCBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24KPiB0
byBqdXN0aWZ5IGFkZGluZyB0aGlzIGZlYXR1cmUuCgpIb25lc3RseSwgSSBsb3N0IHRyYWNrIG9m
IHdhaXQgZXhhY3RseSB5b3VyIHBvaW50IHdhcy4gQW5kLCBpbiBteQpvcGluaW9uLCBCcmVuZGFu
IGhhcyBwcm92aWRlZCBvdmVyIGFuZCBhYm92ZSB0aGUgaW5mb3JtYXRpb24gcmVxdWlyZWQgdG8K
anVzdGlmeSBLdW5pdCdzIGluY2x1c2lvbi4KCj4gT25lIHRoaW5nIHRoYXQgaGFzIGJlY29tZSB2
ZXJ5IGFwcGFyZW50IGluIHRoZSBkaXNjdXNzaW9uIG9mIHRoaXMgcGF0Y2gKPiBzZXJpZXMgaXMg
dGhhdCBzb21lIHBlb3BsZSBkbyBub3QgdW5kZXJzdGFuZCB0aGF0IGtzZWxmdGVzdCBpbmNsdWRl
cwo+IGluLWtlcm5lbCB0ZXN0cywgbm90IGp1c3QgdXNlcnNwYWNlIHRlc3RzLiAgQXMgc3VjaCwg
S1VuaXQgaXMgYW4KPiBhZGRpdGlvbmFsIGltcGxlbWVudGF0aW9uIG9mICJ0aGUgc2FtZSBmZWF0
dXJlIi4gIChPbmUgY2FuIGRlYmF0ZQo+IGV4YWN0bHkgd2hpY2ggaW4ta2VybmVsIHRlc3QgZmVh
dHVyZXMga3NlbGZ0ZXN0IGFuZCBLVW5pdCBwcm92aWRlLAo+IGFuZCBob3cgbXVjaCBvdmVybGFw
IGV4aXN0cyBvciBkb2VzIG5vdCBleGlzdC4gIFNvIGRvbid0IHRha2UgInRoZQo+IHNhbWUgZmVh
dHVyZSIgYXMgbXkgZmluYWwgb3BpbmlvbiBvZiBob3cgbXVjaCBvdmVybGFwIGV4aXN0cy4pICBT
bwo+IHRoYXQgaXMgYSBrZXkgZWxlbWVudCB0byBiZSBub3RlZCBhbmQgZXhwbGFpbmVkLgoKRnJv
bSBteSBwZXJzcGVjdGl2ZSwgb25jZSB3ZSB3ZXJlIGFjdHVhbGx5IHBvaW50ZWQgdG8gdGhlIGlu
LWtlcm5lbAprc2VsZnRlc3QgY29kZSBhbmQgdG9vayBhIGxvb2sgYXQgaXQsIGl0IHdhcyBjbGVh
ciB0aGVyZSB3YXMgbm8Kb3Zlci1hcmNoaW5nIGZyYW1ld29yayB0byB0aGVtIGFuZCB0aGF0IEt1
bml0IGNvdWxkIGJlIHVzZWQgdG8Kc2lnbmlmaWNhbnRseSBpbXByb3ZlIHRob3NlIHRlc3RzIHdp
dGggYSBjb21tb24gc3RydWN0dXJlLiBCYXNlZCBvbiBteQpyZWFkaW5nIG9mIHRoZSB0aHJlYWQs
IFRlZCBjYW1lIHRvIHRoZSBzYW1lIGNvbmNsdXNpb24uCgpJIGRvbid0IHRoaW5rIHdlIHNob3Vs
ZCBibG9jayB0aGlzIGZlYXR1cmUgZnJvbSBiZWluZyBtZXJnZWQsIGFuZCBmb3IKZnV0dXJlIHdv
cmssIHNvbWVvbmUgY2FuIHVwZGF0ZSB0aGUgaW4ta2VybmVsIGtzZWxmdGVzdHMgdG8gdXNlIHRo
ZSBuZXcKZnJhbWV3b3JrLgoKTG9nYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
