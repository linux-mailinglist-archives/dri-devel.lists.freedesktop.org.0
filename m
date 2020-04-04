Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1F19F0FE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518226E2D6;
	Mon,  6 Apr 2020 07:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BCC89711;
 Sat,  4 Apr 2020 23:41:19 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id EBF9E5800A0;
 Sat,  4 Apr 2020 19:32:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 04 Apr 2020 19:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=j
 dfJvDEFzwSWkXsBOVJY/3uTXHjNncUN7vGjeLJ2Gr0=; b=qeTrQ6wCtfH8pB6fu
 Ud/7b+uqLr1lWqWuB91/+3cfltqAjmja9IFhXH7/7iDVkvaYpFnn/weH2xomw0E2
 tmyiNNUeeOyiQI4LruZ2EpX0VIIK61eVlOfwegMiuSU/wdGqpV7sJhTDpZAZbNBW
 PbM1sVtslmm3ZJSROTBEgo9S4un4TmNS9oCgwB27BX/VLJXgHwxMJHb4/OiX9Ns4
 cdKu6fFfrYG3KkgmMXu6owZ/Bt3vkuYn9l9/1js19PkIN/PHpnE2LszPIcjExq3W
 bVKV5ApSGIOEv5ZykMRkmjMIkv17w7JE+3/yBAeAtvyI800eH/NDJEsih7sQmSbY
 fJ1hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=jdfJvDEFzwSWkXsBOVJY/3uTXHjNncUN7vGjeLJ2G
 r0=; b=LdK3ty/2Q6McNCRc4w9aNlZOa95n8mPWKhv2Ua69UC55swhedVX4LVJ8l
 B31zUth8pyjDOVyqQjKh34asvpMQDw7bFvM4z/0W5+mvEL57B+1TVVKFW2mUPBkY
 p9wNcZj/r2S9nbTy7ixNr9fkysACMWpCrGaohKQ0OE2fGgNv5Ctm+V6sKeLmUwRY
 1wkHYDjDCDVCco8RM4O6YPoVaN+eMz7vR8OS78ls0Homm3fsUO0oShhl5aSZoc9i
 6AZGsyni5y5IGB9A+1U9L0YjU2JQx/1JVvxK0hQIx4royT9wz4OZRo6jQXHrvKiv
 I1V7tExfeTjo12KKDRGKAGBP3qcuw==
X-ME-Sender: <xms:_hiJXgT8uolYJoZtuunAxO-xDNQC2SPKifZkBAFDWWA0SQl4QE8Yuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdelgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvghtvghr
 ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
 eqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduudejrddv
 tddrjedurddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:_hiJXu843Ku2bK7a4M8X6C6C6Qpp1xGnVUctgMGO6_2eUlcegxS8Tg>
 <xmx:_hiJXuTh-arvOP8fdoUTzXNUzHYUWwB0PoWff4dO4TaxU47ZFAldHA>
 <xmx:_hiJXtaJ07-yQWYOozagMLoKHzN4vhski4KK1bQqlNpcVgBo-OrurA>
 <xmx:ARmJXr_EER4Vk-5hGsiD700U6PW2qZPIVxSe0P3WkAgVA5tdBrGmdQ>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net
 [117.20.71.109])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55560306D19B;
 Sat,  4 Apr 2020 19:32:09 -0400 (EDT)
Date: Sun, 5 Apr 2020 09:32:04 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and
 impact on services
Message-ID: <20200404233204.GB1918409@jelly>
References: <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
 <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
 <CAAxE2A5zSy7Rh6xyPW8NCqj3q0_8F7yw8tAXx=_z8+mJ-u2uWw@mail.gmail.com>
 <3cddf1aa-5072-af7c-c51e-c16039176f6c@daenzer.net>
 <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuNTtHfNm_nRhPFX5wPRmKkjnFEKqTdTSBDjpLkaiN8Fw@mail.gmail.com>
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

T24gU2F0LCBBcHIgMDQsIDIwMjAgYXQgMDg6MTE6MjNBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIEZyaSwgQXByIDMsIDIwMjAgYXQgNzoxMiBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVs
QGRhZW56ZXIubmV0PiB3cm90ZToKPiA+Cj4gPiBPbiAyMDIwLTAzLTAxIDY6NDYgYS5tLiwgTWFy
ZWsgT2zFocOhayB3cm90ZToKPiA+ID4gRm9yIE1lc2EsIHdlIGNvdWxkIHJ1biBDSSBvbmx5IHdo
ZW4gTWFyZ2UgcHVzaGVzLCBzbyB0aGF0IGl0J3MgYSBzdHJpY3RseQo+ID4gPiBwcmUtbWVyZ2Ug
Q0kuCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEgSSBpbXBsZW1lbnRlZCBzb21l
dGhpbmcgbGlrZSB0aGlzIGZvciBNZXNhOgo+ID4KPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy80NDMyCj4gPgo+IAo+IEkgd291bGRu
J3QgbWluZCBtYW51YWxseSB0cmlnZ2VyaW5nIHBpcGVsaW5lcywgYnV0IHVubGVzcyB0aGVyZSBp
cwo+IHNvbWUgdHJpY2sgSSdtIG5vdCByZWFsaXppbmcsIGl0IGlzIHN1cGVyIGN1bWJlcnNvbWUu
ICBJZS4geW91IGhhdmUgdG8KPiBjbGljayBmaXJzdCB0aGUgY29udGFpbmVyIGpvYnMuLiB0aGVu
IHdhaXQuLiB0aGVuIHRoZSBidWlsZCBqb2JzLi4KPiB0aGVuIHdhaXQgc29tZSBtb3JlLi4gYW5k
IHRoZW4gZmluYWxseSB0aGUgYWN0dWFsIHJ1bm5lcnMuICBUaGF0IHdvdWxkCj4gYmUgYSByZWFs
IHN0ZXAgYmFjayBpbiB0ZXJtcyBvZiB1c2VmdWxuZXNzIG9mIENJLi4gb25lIG1pZ2h0IGNhbGwg
aXQgYQo+IHJlZ3Jlc3Npb24gOi0oCgpJICp0aGluayogdGhpcyBzaG91bGQgd29yayB0aG91Z2gg
aWYgeW91IHNldCB1cCB0aGUgcmlnaHQgam9iIGRlcGVuZGVuY2llcy4KdmVyeSBzaW1wbGUgZXhh
bXBsZToKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dob3QvY2ktcGxheWdyb3VuZC9w
aXBlbGluZXMvMTI4NjAxCgpqb2IxIGlzICJ3aGVuOm1hbnVhbCIsIGpvYjIgaGFzICJuZWVkczog
am9iMSIsIGpvYjMgaGFzICJuZWVkczogam9iMiIuCk5vdGhpbmcgcnVucyBhdCBmaXJzdCwgaWYg
eW91IHRyaWdnZXIgam9iMSBpdCdsbCBjYXNjYWRlIGRvd24gdG8gam9iIDIgYW5kCjMuCgpUaGUg
bWFpbiBsaW1pdCB5b3UgaGF2ZSBoZXJlIGFyZSB0aGUgc3RhZ2VzIC0gd2hlcmUgYSBqb2IgaXMg
cGFydCBvZiBhIHN0YWdlCmJ1dCBkb2VzIG5vdCBoYXZlIGFuIGV4cGxpY2l0ICJuZWVkczoiIGl0
IHdpbGwgd2FpdCBmb3IgdGhlIHByZXZpb3VzIHN0YWdlCnRvIGNvbXBsZXRlLiBUaGF0IHdpbGwg
bmV2ZXIgaGFwcGVuIGlmIG9uZSBqb2IgaW4gdGhhdCBzdGFnZSBoYXMgYSBtYW51YWwKZGVwZW5k
ZW5jeS4gU2VlIHRoaXMgcGlwZWxpbmUgYXMgYW4gZXhhbXBsZToKaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3dob3QvY2ktcGxheWdyb3VuZC9waXBlbGluZXMvMTI4NjA1CgpTbyBiYXNp
Y2FsbHk6IGlmIHlvdSBzZXQgdXAgYWxsIHlvdXIgam9icyB3aXRoIHRoZSBjb3JyZWN0ICJuZWVk
cyIgeW91IGNvdWxkCmV2ZW4gaGF2ZSBhIG5vb3Agc3RhZ2UgZm9yIHVzZXIgaW50ZXJmYWNlIHB1
cnBvc2VzLiBIZXJlJ3MgYW4gZXhhbXBsZToKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3dob3QvY2ktcGxheWdyb3VuZC9waXBlbGluZXMvMTI4NjA2CgpJdCBoYXMgYSBVSSBzdGFnZSB3
aXRoICJ0ZXN0LWFybSIgYW5kICJ0ZXN0LXg4NiIgbWFudWFsIGpvYnMuIEl0IGhhcyBvdGhlcgpz
dGFnZXMgd2l0aCBkZXBlbmRlbnQgam9icyBvbiB0aG9zZSAoY2FzY2FkaW5nIGRvd24pIGJ1dCBp
dCBhbHNvIGhhcyAKYSBzZXQgb2YgYXV0b3J1biBqb2JzIHRoYXQgcnVuIGluZGVwZW5kZW50IG9m
IHRoZSBtYW51YWwgdHJpZ2dlcnMuIFdoZW4geW91CnB1c2gsIHRoZSBhdXRvcnVuIGpvYnMgcnVu
LiBXaGVuIHlvdSB0cmlnZ2VyICJ0ZXN0LWFybSIgbWFudWFsbHksIGl0CnRyaWdnZXJzIHRoZSB2
YXJpb3VzIGRlcGVuZGVudCBqb2JzLgoKU28gSSB0aGluayB3aGF0IHlvdSB3YW50IHRvIGRvIGlz
IHBvc3NpYmxlLCBpdCBqdXN0IHJlcXVpcmVzIHNvbWUgdHdlYWtpbmcKb2YgdGhlICJuZWVkcyIg
ZW50cmllcy4KCkNoZWVycywKICAgUGV0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
