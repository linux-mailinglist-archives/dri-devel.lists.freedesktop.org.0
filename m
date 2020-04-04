Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0055319F10A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C046E2E2;
	Mon,  6 Apr 2020 07:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 416 seconds by postgrey-1.36 at gabe;
 Sat, 04 Apr 2020 23:39:16 UTC
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73316E19C;
 Sat,  4 Apr 2020 23:39:16 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2CD1D5801BA;
 Sat,  4 Apr 2020 19:39:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 04 Apr 2020 19:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=I
 1xgjHIrdP7gWVcIk6tpZAzehfuF8c3q2+/HFVsfr78=; b=EVVMcqxmFizMuCHz1
 uG+C3oTHsHZBty0POVPcC4Zk6dsZ3G55wY2PFgf8BvucQ5oFPKSl/jBcaBY7jQvQ
 Q/IbHGRoH5BVQMJjrfexwJJDKgSU5DbdSzXHAgikc6+ZneztxwFaZCaH5DafZzVi
 y1HTbLD/OWsVC44QbECv1oh7VgecyVfu7OjNkVvuAs5Xzv4h0MznkQ6ttk5p53jK
 xYskvTadqNKe4LUrWQ2LTBB41m1p0hBikRk4J0fPYFh/p01iPYpdpGCuoty435JK
 pkVqQGHIruQ9+ovWHK3lhO2bCF2Ezimqjf4+gjWTfL4S620plKSk3CM+ERAPOFTy
 /jlfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=I1xgjHIrdP7gWVcIk6tpZAzehfuF8c3q2+/HFVsfr
 78=; b=o5MeFQdRyfgOf1KPpIMCDK+P0vQ2JXQs/Gnkwfn4Y/mSnmA9ad13s+xs8
 FR+RGktcsUz2zHGvbBGvL3a0T9CQ0NlBufaql+NXwHPc1bTlyqLwd1jHmFmwSTQg
 zED4RzfIMln7pfuls/VJc+pWLHkKqHPdeW3g5hIGcKzcDuKIwQDr/JVmS8QH1qhv
 iO0pIj5zO5mZ2ls9zb/pRkqN/RYTdHvdgeM8o6aTCtd9bKU3GGEJXicWDwiR6fYK
 IBbEH5hM5uwsWKeqcVAfM52scInH1Co+BvbsJXVS3ejrMfEguc7vCY3SIin02P61
 KfcnpXZtsv1rM4CtC8+NhXK3fqIEg==
X-ME-Sender: <xms:oxqJXrL0TTz_LW4_Z1WTV4KBcp0E3_oyNnerlJLGo-VZMRhpaq8VrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdelgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvghtvghr
 ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
 eqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduudejrddv
 tddrjedurddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:oxqJXrcIzGgukO-gkKGagXRE1RkBjP0XkB47BWy7t0ELrQgvM9UgvA>
 <xmx:oxqJXmcpZ7hnz2KjjRIyTscQl-Zm7wv8rfH0-InV_8GDIEzfOSjMNg>
 <xmx:oxqJXmPKpog3XZBehp-b8SXYoEzJZlzhxblonWadIZh7TjXJtbeyjA>
 <xmx:pBqJXsqtn0_4IYXOaAWNb1f1MH9Rsh5FhcAMzcHlaZgKIdAKJDfU1Q>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net
 [117.20.71.109])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B7CA306D19F;
 Sat,  4 Apr 2020 19:39:10 -0400 (EDT)
Date: Sun, 5 Apr 2020 09:39:06 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
Message-ID: <20200404233906.GC1918409@jelly>
References: <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
 <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
 <CAAxE2A5zSy7Rh6xyPW8NCqj3q0_8F7yw8tAXx=_z8+mJ-u2uWw@mail.gmail.com>
 <3cddf1aa-5072-af7c-c51e-c16039176f6c@daenzer.net>
 <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
 <3e5bc9f9416c3f8b2ec52436b40b82cafb717586.camel@ndufresne.ca>
 <CAF6AEGuVzvO_wkrsuxahme-9AHOH7D+2yXJXiuRh_e825t_K6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuVzvO_wkrsuxahme-9AHOH7D+2yXJXiuRh_e825t_K6w@mail.gmail.com>
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgMDQsIDIwMjAgYXQgMTE6MTY6MDhBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFNhdCwgQXByIDQsIDIwMjAgYXQgMTA6NDcgQU0gTmljb2xhcyBEdWZyZXNuZSA8bmlj
b2xhc0BuZHVmcmVzbmUuY2E+IHdyb3RlOgo+ID4KPiA+IExlIHNhbWVkaSAwNCBhdnJpbCAyMDIw
IMOgIDA4OjExIC0wNzAwLCBSb2IgQ2xhcmsgYSDDqWNyaXQgOgo+ID4gPiBPbiBGcmksIEFwciAz
LCAyMDIwIGF0IDc6MTIgQU0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gd3Jv
dGU6Cj4gPiA+ID4gT24gMjAyMC0wMy0wMSA2OjQ2IGEubS4sIE1hcmVrIE9sxaHDoWsgd3JvdGU6
Cj4gPiA+ID4gPiBGb3IgTWVzYSwgd2UgY291bGQgcnVuIENJIG9ubHkgd2hlbiBNYXJnZSBwdXNo
ZXMsIHNvIHRoYXQgaXQncyBhIHN0cmljdGx5Cj4gPiA+ID4gPiBwcmUtbWVyZ2UgQ0kuCj4gPiA+
ID4KPiA+ID4gPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uISBJIGltcGxlbWVudGVkIHNvbWV0
aGluZyBsaWtlIHRoaXMgZm9yIE1lc2E6Cj4gPiA+ID4KPiA+ID4gPiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvNDQzMgo+ID4gPiA+Cj4g
PiA+Cj4gPiA+IEkgd291bGRuJ3QgbWluZCBtYW51YWxseSB0cmlnZ2VyaW5nIHBpcGVsaW5lcywg
YnV0IHVubGVzcyB0aGVyZSBpcwo+ID4gPiBzb21lIHRyaWNrIEknbSBub3QgcmVhbGl6aW5nLCBp
dCBpcyBzdXBlciBjdW1iZXJzb21lLiAgSWUuIHlvdSBoYXZlIHRvCj4gPiA+IGNsaWNrIGZpcnN0
IHRoZSBjb250YWluZXIgam9icy4uIHRoZW4gd2FpdC4uIHRoZW4gdGhlIGJ1aWxkIGpvYnMuLgo+
ID4gPiB0aGVuIHdhaXQgc29tZSBtb3JlLi4gYW5kIHRoZW4gZmluYWxseSB0aGUgYWN0dWFsIHJ1
bm5lcnMuICBUaGF0IHdvdWxkCj4gPiA+IGJlIGEgcmVhbCBzdGVwIGJhY2sgaW4gdGVybXMgb2Yg
dXNlZnVsbmVzcyBvZiBDSS4uIG9uZSBtaWdodCBjYWxsIGl0IGEKPiA+ID4gcmVncmVzc2lvbiA6
LSgKPiA+Cj4gPiBPbiBHU3RyZWFtZXIgc2lkZSB3ZSBoYXZlIG1vdmVkIHNvbWUgZXhpc3Rpbmcg
cGlwZWxpbmUgdG8gbWFudWFsIG1vZGUuCj4gPiBBcyB3ZSB1c2UgbmVlZHM6IGJldHdlZW4gam9i
cywgd2UgY291bGQgc2ltcGx5IHNldCB0aGUgZmlyc3Qgam9iIHRvCj4gPiBtYW51YWwgKGluIG91
ciBjYXNlIGl0J3MgYSBzaW5nbGUgam9iIGNhbGxlZCBtYW5pZmVzdCBpbiB5b3VyIGNhc2UgaXQK
PiA+IHdvdWxkIGJlIHRoZSBOIGNvbnRhaW5lciBqb2JzKS4gVGhpcyB3YXkgeW91IGNhbiBoYXZl
IGEgbWFudWFsIHBpcGVsaW5lCj4gPiB0aGF0IGlzIHRyaWdnZXJlZCBpbiBzaW5nbGUgKG9yIGZl
d2VyKSBjbGlja3MuIEhlcmUncyBhbiBleGFtcGxlOgo+ID4KPiA+IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0cmVhbWVyL3BpcGVsaW5lcy8xMjgyOTIKPiA+Cj4g
PiBUaGF0IG91ciBwb3N0LW1lcmdlIHBpcGVsaW5lcywgd2Ugb25seSB0cmlnZ2VyIHRoZW4gaWYg
d2Ugc3VzcGVjdCBhCj4gPiBwcm9ibGVtLgo+ID4KPiAKPiBJJ20gbm90IHN1cmUgdGhhdCB3b3Vs
ZCB3b3JrIGZvciBtZXNhIHNpbmNlIHRoZSBoaWVyYXJjaHkgb2Ygam9icwo+IGJyYW5jaGVzIG91
dCBwcmV0dHkgZmFyLi4gaWUuIGlmIEkganVzdCBjbGlja2VkIHRoZSBhcm02NCBidWlsZCArIHRl
c3QKPiBjb250YWluZXIgam9icywgYW5kIGV2ZXJ5dGhpbmcgZWxzZSByYW4gYXV0b21hdGljYWxs
eSBhZnRlciB0aGF0LCBpdAo+IHdvdWxkIGVuZCB1cCBydW5uaW5nIGFsbCB0aGUgQ0kgam9icyBm
b3IgYWxsIHRoZSBhcm0gZGV2aWNlcyAob3IgYXQKPiBsZWFzdCBhbGwgdGhlIDY0YiBvbmVzKQoK
Z2VuZXJhdGUgeW91ciBnaXRsYWItY2kgZnJvbSBhIHRlbXBsYXRlIHNvIGVhY2ggcGlwZWxpbmUg
aGFzIGl0cyBvd24gam9iCmRlcGVuZGVuY3kuIFRoZSBkdXBsaWNhdGlvbiB3b24ndCBodXJ0IHlv
dSBpZiBpdCdzIGV4cGFuZGVkIHRocm91Z2gKdGVtcGxhdGluZyBhbmQgaXQgZ2l2ZXMgeW91IGZp
bmUtZ3JhaW5lZCBydW5uaW5nIG9mIHRoZSBtYW51YWwgam9icy4KCldlJ3JlIHVzaW5nIHRoaXMg
aW4gY2ktdGVtcGxhdGVzL2xpYmV2ZGV2L2xpYmlucHV0IGZvciB0aGUgdmFyaW91cwpkaXN0cmli
dXRpb25zIGFuZCB0aGVpciB2ZXJzaW9ucyBzbyBlYWNoIGRpc3RyaWJ1dGlvbit2ZXJzaW9uIGlz
IGVmZmVjdGl2ZWx5Cml0cyBvd24gcGlwZWxpbmUuIEJ1dCB3ZSBvbmx5IG5lZWQgdG8gbWFpbnRh
aW4gb25lIGpvYiBpbiB0aGUgYWN0dWFsCnRlbXBsYXRlIGZpbGUuCgpodHRwczovL2ZyZWVkZXNr
dG9wLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9jaS10ZW1wbGF0ZXMvY2ktZmFpcnkuaHRtbCN0ZW1w
bGF0aW5nLWdpdGxhYi1jaS15bWwKCkNoZWVycywKICAgUGV0ZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
