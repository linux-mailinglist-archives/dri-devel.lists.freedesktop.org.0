Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6DBC2BC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6654B89DA3;
	Tue, 24 Sep 2019 07:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA23E6E9B6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:34:39 +0000 (UTC)
Date: Tue, 24 Sep 2019 07:34:30 +0000
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] drm: two planes with the same zpos have undefined
 ordering
Message-ID: <Wlf2FCm5ef90dlnnXYnVGII1Q3nVX2hs-NdCNkzbNQzQqQfZrfMLuqYG1CTedcQCwsBOxrnRtlJFqn3fE8fR8ydYZWjC_pwnkJ9FbqkqPi0=@emersion.fr>
In-Reply-To: <20190924102639.6d8a334b@eldfell.localdomain>
References: <KJRi1ROX2_eM1WjtEQ1e1-f--VK4hwMQJQt1nPaS6lcmt3v4yIfdttLIu_EOGdkwXwEMAEo66Xa7ksp7iQABWT5GuMu6UgKoiuEm6EU2N1U=@emersion.fr>
 <20190910133810.64e973f4@eldfell.localdomain>
 <CAKMK7uEEuUpD_eni6wr=7sEadnYypd=7Ojf5zQ0tgXQov4F3mQ@mail.gmail.com>
 <1hklN2_EspD_s4vA3fdCCkVN9jeARGhmtkSGWDyVus-0ryZFs4xftUYRp_Z4pzsikJActaDVaTUoPNfBd-QitQX_JJTXkkqKFXxJhgMjEI0=@emersion.fr>
 <60c3fb6c-651a-0122-44d5-30895bbcb22c@collabora.com>
 <CAKMK7uG1uXU5sO81VCN7zeNn62D-JHEW1QSSoJ695AULGt3zSQ@mail.gmail.com>
 <WHzXxgNIkxb4Mn1hdeAAwutlt0P-G2onwFr4FpA083VEVh1nIcstHOBRataUD7skpgtWd7BMDPF4v0GHJmQcLrnicVF1hpaUz_5WeSBUTWk=@emersion.fr>
 <20190919103414.08f81fda@eldfell.localdomain>
 <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190924102639.6d8a334b@eldfell.localdomain>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1569310474;
 bh=E3ZHHyPiSF2QE6Gp9t2i/DKkcrtpDe9mW7yYI1MbJ0s=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=4c530XxbyRrGPbHO97lw1dGe6KTCt959XnqQwmgcoOPGxFn1H3xfR48Dn8DUbFSxS
 WPtsWq0IgGTkImcExHxHrRgnQNpETlTOROOjtKhLt6qxlKzmjJejT890NAOn6ig0Hp
 wwwhXQHH8Tt+8+D4wAa3+cKJNPtoYUWhnivzMDwE=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgU2VwdGVtYmVyIDI0LCAyMDE5IDEwOjI2IEFNLCBQZWtrYSBQYWFsYW5lbiA8
cHBhYWxhbmVuQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwgMjMgU2VwIDIwMTkgMTI6Mzk6
MjAgKzAwMDAKPiBTaW1vbiBTZXIgY29udGFjdEBlbWVyc2lvbi5mciB3cm90ZToKPgo+ID4gQ3Vy
cmVudGx5IHRoZSBwcm9wZXJ0eSBkb2NzIGRvbid0IHNwZWNpZnkgd2hldGhlciBpdCdzIG9rYXkg
Zm9yIHR3byBwbGFuZXMgdG8KPiA+IGhhdmUgdGhlIHNhbWUgenBvcyB2YWx1ZSBhbmQgd2hhdCB1
c2VyLXNwYWNlIHNob3VsZCBleHBlY3QgaW4gdGhpcyBjYXNlLgo+ID4gVGhlIHJ1bGUgbWVudGlv
bm5lZCBpbiB0aGUgcGFzdCB3YXMgdG8gZGlzYW1iaWd1YXRlIHdpdGggb2JqZWN0IElEcy4gSG93
ZXZlcgo+ID4gc29tZSBkcml2ZXJzIGJyZWFrIHRoaXMgcnVsZSAodGhhdCdzIHdoeSB0aGUgb3Jk
ZXJpbmcgaXMgZG9jdW1lbnRlZCBhcwo+ID4gdW5zcGVjaWZpZWQgaW4gY2FzZSB0aGUgenBvcyBw
cm9wZXJ0eSBpcyBtaXNzaW5nKS4gQWRkaXRpb25hbGx5IGl0IGRvZXNuJ3QKPiA+IHJlYWxseSBt
YWtlIHNlbnNlIGZvciBhIGRyaXZlciB0byB1c2VyIGlkZW50aWNhbCB6cG9zIHZhbHVlcyBpZiBp
dCBrbm93cyB0aGVpcgo+ID4gcmVsYXRpdmUgcG9zaXRpb246IHRoZSBkcml2ZXIgY2FuIGp1c3Qg
cGljayBkaWZmZXJlbnQgdmFsdWVzIGluc3RlYWQuCj4gPiBTbyB0d28gc29sdXRpb25zIHdvdWxk
IG1ha2Ugc2Vuc2U6IGVpdGhlciBkaXNhbGxvdyBjb21wbGV0ZWx5IGlkZW50aWNhbCB6cG9zCj4g
PiB2YWx1ZXMgZm9yIHR3byBkaWZmZXJlbnQgcGxhbmVzLCBlaXRoZXIgbWFrZSB0aGUgb3JkZXJp
bmcgdW5zcGVjaWZpZWQuIFRvIGFsbG93Cj4gPiBkcml2ZXJzIHRoYXQgZG9uJ3Qga25vdyB0aGUg
cmVsYXRpdmUgb3JkZXJpbmcgYmV0d2VlbiB0d28gcGxhbmVzIHRvIHN0aWxsCj4gPiBleHBvc2Ug
dGhlIHpwb3MgcHJvcGVydHksIGNob29zZSB0aGUgbGF0dGVyIHNvbHV0aW9uLgo+Cj4gSGkgU2lt
b24sCj4KPiB0aGUgY29tbWl0IG1lc3NhZ2Ugc3RpbGwgdGFsa3MgYWJvdXQgdGhlIGRyaXZlcnMg
b25seSwgYW5kIEkgdGhpbmsgdGhhdAo+IGlzIHdoYXQgbGVhZCBtZSBhc3RyYXkgaW4gdGhlIGZp
cnN0IHBsYWNlIHVudGlsIEkgcmVhbGl6ZWQgdGhlCj4gZHVwbGljYXRlIHpwb3MgdmFsdWUgaXNz
dWUgY29uY2VybnMgb25seSBzdHVwaWQgdXNlcnNwYWNlLCBub3QgdGhhdAo+IGRyaXZlcnMgd2Vy
ZSBhbGxvd2VkIHRvIHVzZSBkdXBsaWNhdGUgenBvcyB2YWx1ZXMgd2hpY2ggdXNlcnNwYWNlIHRo
ZW4KPiBuZWVkcyB0byB1bnRhbmdsZSB3aXRoIElEIG9yZGVyaW5nLgoKPiBEcml2ZXJzIG5ldmVy
IGhhdmUgdW5kZWZpbmVkIHBsYW5lCj4gb3JkZXJpbmcgdGhlbXNlbHZlcyAtIGlmIHRoZXkgZG8s
IHRoYXQncyBhIGJyb2tlbiBkcml2ZXIgdGhhdCBkb2Vzbid0Cj4ga25vdyB3aGF0IGhhcmR3YXJl
IGl0IGlzIGRyaXZpbmcuIElmIHRoZSBkcml2ZXIgZG9lc24ndCBrbm93LCB0aGVuCj4gdXNlcnNw
YWNlIGRlZmluaXRlbHkgY2Fubm90IGtub3cgYW55IGJldHRlciAtIGlmIHNvbWUgdXNlcnNwYWNl
IGRvZXMsCj4gdGhhdCdzIGEgZ2Z4IGRyaXZlciBzdGFjayBtaXNkZXNpZ24uIFNvIHRoZXJlIGlz
IG5vIHJlYXNvbiBmb3IgYSBkcml2ZXIKPiB0byB1c2UgYW1iaWd1b3VzIHpwb3MgdmFsdWVzLgoK
VGhpcyBwYXRjaCBpbiBmYWN0IGV4cGxhaW5zIHdoeSBkdXBsaWNhdGUgcGxhbmUgSURzIGFyZSBh
bGxvd2VkLiBUaGUKdHdvIGFsdGVybmF0aXZlcyBhcmUgbWVudGlvbmVkOiBlaXRoZXIgZGlzYWxs
b3cgZHVwbGljYXRlIHBsYW5lIHpwb3MKdmFsdWVzLCBvciBlaXRoZXIgbWFrZSBvcmRlcmluZyB1
bmRlZmluZWQuCgpJIGNob3NlIHRvIGFsbG93IGR1cGxpY2F0ZSB2YWx1ZXMgYmVjYXVzZSBzb21l
IEhXIG1pZ2h0IG5vdCBrbm93IHRoZQp6cG9zIG9yZGVyaW5nIGJldHdlZW4gZS5nLiBzb21lIG92
ZXJsYXkgcGxhbmVzLCBidXQgbWlnaHQga25vdyBwcmltYXJ5CmlzIHVuZGVyIG92ZXJsYXlzLgoK
SWYgdGhhdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgYXQgYWxsLCBJJ2QgYmUgaGFwcHkgdG8gY2hhbmdl
IHRoZSBzcGVjIHRvCnNheSB0aGF0IGR1cGxpY2F0ZSB6cG9zIHZhbHVlcyBhcmUgYSBrZXJuZWwg
YnVnLiBXZSdsbCBuZWVkIHRvIG1ha2UKc3VyZSB0aGlzIGRvZXNuJ3QgaGFwcGVuLCBlLmcuIHdp
dGggYSBjaGVjayBpbiB0aGUgZnVuY3Rpb24gY3JlYXRpbmcKdGhlIHByb3BlcnR5LgoKTm90ZSB0
aGF0IHVzZXItc3BhY2UgbmVlZHMgdG8gaGFuZGxlIHVuZGVmaW5lZCBvcmRlciBiZXR3ZWVuIHBs
YW5lcwphbnl3YXkgaW4gY2FzZSB6cG9zIGlzbid0IGFkdmVydGlzZWQuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
