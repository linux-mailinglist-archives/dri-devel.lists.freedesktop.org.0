Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E9184212
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7756EB7E;
	Fri, 13 Mar 2020 08:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2115 seconds by postgrey-1.36 at gabe;
 Thu, 12 Mar 2020 16:48:48 UTC
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30E56EB03;
 Thu, 12 Mar 2020 16:48:48 +0000 (UTC)
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230]
 helo=[192.168.11.155])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1jCQSb-0001tv-Kl; Thu, 12 Mar 2020 10:13:26 -0600
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@infradead.org>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org> <20200312141928.GK31668@ziepe.ca>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <654680ab-5e52-899e-963f-1a511615092a@deltatee.com>
Date: Thu, 12 Mar 2020 10:13:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312141928.GK31668@ziepe.ca>
Content-Language: en-US
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, David1.Zhou@amd.com, christian.koenig@amd.com,
 hch@infradead.org, jgg@ziepe.ca
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIwLTAzLTEyIDg6MTkgYS5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgTWFyIDEyLCAyMDIwIGF0IDAzOjQ3OjI5QU0gLTA3MDAsIENocmlzdG9waCBIZWxsd2lnIHdy
b3RlOgo+PiBPbiBUaHUsIE1hciAxMiwgMjAyMCBhdCAxMTozMTozNUFNICswMTAwLCBDaHJpc3Rp
YW4gS8O2bmlnIHdyb3RlOgo+Pj4gQnV0IGhvdyBzaG91bGQgd2UgdGhlbiBkZWFsIHdpdGggYWxs
IHRoZSBleGlzdGluZyBpbnRlcmZhY2VzIHdoaWNoIGFscmVhZHkKPj4+IHRha2UgYSBzY2F0dGVy
bGlzdC9zZ190YWJsZSA/Cj4+Pgo+Pj4gVGhlIHdob2xlIERNQS1idWYgZGVzaWduIGFuZCBhIGxv
dCBvZiBkcml2ZXJzIGFyZSBidWlsZCBhcm91bmQKPj4+IHNjYXR0ZXJsaXN0L3NnX3RhYmxlIGFu
ZCB0byBtZSB0aGF0IGFjdHVhbGx5IG1ha2VzIHF1aXRlIGEgbG90IG9mIHNlbnNlLgo+Pj4KPj4K
Pj4gUmVwbGFjZSB0aGVtIHdpdGggYSBzYW5lciBpbnRlcmZhY2UgdGhhdCBkb2Vzbid0IHRha2Ug
YSBzY2F0dGVybGlzdC4KPj4gQXQgdmVyeSBsZWFzdCBmb3IgbmV3IGZ1bmN0aW9uYWxpdHkgbGlr
ZSBwZWVyIHRvIHBlZXIgRE1BLCBidXQKPj4gZXNwZWNpYWxseSB0aGlzIGNvZGUgd291bGQgYWxz
byBiZW5lZml0IGZyb20gYSBnZW5lcmFsIG1vdmUgYXdheQo+PiBmcm9tIHRoZSBzY2F0dGVybGlz
dC4KPiAKPiBJZiBkbWEgYnVmIGNhbiBkbyBQMlAgSSdkIGxpa2UgdG8gc2VlIHN1cHBvcnQgZm9y
IGNvbnN1bWluZyBhIGRtYWJ1Zgo+IGluIFJETUEuIExvb2tpbmcgYXQgaG93Li4gdGhlcmUgaXMg
YW4gZXhpc3Rpbmcgc2dsIGJhc2VkIHBhdGggc3RhcnRpbmcKPiBmcm9tIGdldF91c2VyX3BhZ2Vz
IHRocm91Z2ggZG1hIG1hcCB0byB0aGUgZHJpdmVycy4gKGliX3VtZW0pCj4gCj4gSSBjYW4gcmVw
bGFjZSB0aGUgZHJpdmVyIHBhcnQgd2l0aCBzb21ldGhpbmcgZWxzZSAoZG1hX3NnKSwgYnV0IG5v
dAo+IHVudGlsIHdlIGdldCBhIHdheSB0byBETUEgbWFwIHBhZ2VzIGRpcmVjdGx5IGludG8gdGhh
dCBzb21ldGhpbmcKPiBlbHNlLi4KPiAKPiBUaGUgbm9uLXBhZ2Ugc2NhdHRlcmxpc3QgaXMgYWxz
byBhIGJpZyBjb25jZXJuIGZvciBSRE1BIGFzIHdlIGhhdmUKPiBkcml2ZXJzIHRoYXQgd2FudCB0
aGUgcGFnZSBsaXN0LCBzbyBldmVuIGlmIHdlIGRpZCBhcyB0aGlzIHNlcmllcwo+IGNvbnRlbXBs
YXRlcyBJJ2QgaGF2ZSBzdGlsbCBoYXZlIHRvIHNwbGl0IHRoZSBkcml2ZXJzIGFuZCBjcmVhdGUg
dGhlCj4gbm90aW9uIG9mIGEgZG1hLW9ubHkgU0dMLgo+IAo+Pj4gSSBtZWFuIHdlIGNvdWxkIGNv
bWUgdXAgd2l0aCBhIG5ldyBzdHJ1Y3R1cmUgZm9yIHRoaXMsIGJ1dCB0byBtZSB0aGF0IGp1c3QK
Pj4+IGxvb2tzIGxpa2UgcmVpbnZlbnRpbmcgdGhlIHdoZWVsLiBFc3BlY2lhbGx5IHNpbmNlIGRy
aXZlcnMgbmVlZCB0byBiZSBhYmxlCj4+PiB0byBoYW5kbGUgYm90aCBJL08gdG8gc3lzdGVtIG1l
bW9yeSBhbmQgSS9PIHRvIFBDSWUgQkFScy4KPj4KPj4gVGhlIHN0cnVjdHVyZSBmb3IgaG9sZGlu
ZyB0aGUgc3RydWN0IHBhZ2Ugc2lkZSBvZiB0aGUgc2NhdHRlcmxpc3QgaXMKPj4gY2FsbGVkIHN0
cnVjdCBiaW9fdmVjLCBzbyBmYXIgbW9zdGx5IHVzZWQgYnkgdGhlIGJsb2NrIGFuZCBuZXR3b3Jr
aW5nCj4+IGNvZGUuCj4gCj4gSSBoYXZlbid0IHVzZWQgYmlvX3ZlY3MgYmVmb3JlLCBkbyB0aGV5
IHN1cHBvcnQgY2hhaW5pbmcgbGlrZSBTR0wgc28KPiB0aGV5IGNhbiBiZSB2ZXJ5IGJpZz8gUkRN
QSBkbWEgbWFwcyBnaWdhYnl0ZXMgb2YgbWVtb3J5CgpiaW9fdmVjJ3MgdGhlbXNlbHZlcyBkb24n
dCBzdXBwb3J0IGNoYWluaW5nLi4uIEluIHRoZSBibG9jayBsYXllciB0aGV5CmFyZSB1c2VkIGlu
IGEgc3RydWN0IGJpbyB3aGljaCBoYW5kbGVzIGNoYWluaW5nLCBzcGxpdHRpbmcgYW5kIG90aGVy
CmZlYXR1cmVzLiBFYWNoIGJpbywgdGhvdWdoLCBoYXMgYSBsaW1pdCBvZiAyNTYgc2VnbWVudHMg
dG8gYXZvaWQgaGlnaGVyCm9yZGVyIGFsbG9jYXRpb25zLiBEZXBlbmRpbmcgb24geW91ciB1c2Ug
Y2FzZSwgeW91IGNvdWxkIHJldXNlIGJpb3Mgb3IKd3JpdGUgeW91ciBvd24gY29udGFpbmVyIHRv
IGNoYWluIGJpb192ZWNzLgoKPj4gVGhlIHN0cnVjdHVyZSBmb3IgaG9sZGluZyBkbWEgYWRkcmVz
c2VzIGRvZXNuJ3QgcmVhbGx5IGV4aXN0Cj4+IGluIGEgZ2VuZXJpYyBmb3JtLCBidXQgd291bGQg
YmUgYW4gYXJyYXkgb2YgdGhlc2Ugc3RydWN0dXJlczoKPj4KPj4gc3RydWN0IGRtYV9zZyB7Cj4+
IAlkbWFfYWRkcl90CWFkZHI7Cj4+IAl1MzIJCWxlbjsKPj4gfTsKCgo+IFllcywgd2UgZWFzaWx5
IGhhdmUgcmFuZ2VzIG9mID4xR0IuIFNvIEkgd291bGQgY2VydGFpbmx5IHNheSB1NjQgZm9yIHRo
ZSBsZW4gaGVyZS4KCkknZCBwcm9iYWJseSBhdm9pZCB0aGUgdTY0IGhlcmUgYW5kIGxlYXZlIHNw
YWNlIGZvciBzb21lIGZsYWdzIG9yCnNvbWV0aGluZy4gSWYgeW91IGhhdmUgPjFHQiB0byBtYXAg
eW91IGNhbiBhbHdheXMganVzdCBoYXZlIG11bGl0cGxlCnNlZ21lbnRzLiBXaXRoIDRHQiBwZXIg
c2VnbWVudCBhbmQgMjU2IHNlZ21lbnRzIHBlciBwYWdlLCBhIHBhZ2Ugb2YgRE1BCnNncyBjYW4g
ZWFzaWx5IG1hcCAxVEIgb2YgbWVtb3J5IGluIGEgc2luZ2xlIGNhbGwgYW5kIHdpdGggY2hhaW5p
bmcgb3IKbGFyZ2VyIGFsbG9jYXRpb25zIHlvdSBjYW4gZXh0ZW5kIHRoYXQgZnVydGhlciwgaWYg
bmVlZGVkLgoKTG9nYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
