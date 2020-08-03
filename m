Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97B23A244
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 11:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E48A89E0D;
	Mon,  3 Aug 2020 09:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A814989E0D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 09:48:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id AC4E94CE;
 Mon,  3 Aug 2020 05:48:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 03 Aug 2020 05:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=P
 Ah/QgnU8giEcq5Q8p8XRD4UtgQHwSy9znrXba7ez8g=; b=FHGHZXbvuwoHIHiEm
 yBK203NMEXR4zbhmF1L8LqU6mRJWKb20OdkvpsqVCis3pz0fVgb86CB5tYx4WB3W
 HeVF4keWM1UUqTTLwJbK5tKjAWy5b9XSDzqN8K8FZDwWRySXf0ddoOfWUboA98nm
 3fxq7Ex3bUG8JFkkrnHITBz5NNZ4mqQzpH1iVLYC2mvU81X0wzojhBaSTcM1fvnB
 24k75Odte6QLKpv2FeT0ZOVOHQLWbwW14xf/BKMblybG7Yg5Qrm0peBQAD9E+dUK
 PgHyvk3SyXvNyhXUR/Ti9S3QH57+/f4YMQLMWkf6oIH2SzgwZMbB2/fA2EIH0qs8
 5qcLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=PAh/QgnU8giEcq5Q8p8XRD4UtgQHwSy9znrXba7ez
 8g=; b=gpplXFCEsMdYjTg8q4hJusCfUq0RytmTceJI5f1TCdheqbLqRTExXQCP+
 E+63GpND7VkaboPBd3q2uqx3C/0vaUiM8Gnv1sDOsWOOeRLqYZbT44cjVouf+4al
 YK4QVpQEQmeileh8HUvyJUaKRcM/41GzamU1ecaABMJ5jcDqddyjZNxBCnmSqxyQ
 Ra4Z1JySM1deGz+f36AccEYp1XmVf4iLKKsJU4ZdkqjreG+PzPKiwHPV8omSu8if
 8JGhCHQPPDURz4JUkclcDj7QYHzX7k5wmozrWyab5jvHoQpIG0ZFF8JHuRdtuNwZ
 OQTQXwaK6oV9rdTjsMmNH5Pl4Mmxw==
X-ME-Sender: <xms:Wt0nXw1OoauseHtgsCTfV0xiHeHau_4PaIoo97iBnP9R4NAIxAt8Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrjeeggddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuheekhe
 elffefieduteefkeejffdvueehjeejffehledugfetkedvleekudduvdenucfkphepkeef
 rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Wt0nX7EFwIHLGFYlu0YLmiX00eeaAiOhRil13wHTkLj6OXCvckaEPQ>
 <xmx:Wt0nX47Ka3jQMVSBjFVIWUKw-_HvMNvyAvxAR-v2Th82wZWXNjxlwQ>
 <xmx:Wt0nX50-rEGku_Uaa_ygaSQXqFZ20P9dmSU7g5aEjAi18UJ6DCRBhg>
 <xmx:Xt0nX787BykcRoC2KEHCZaItB0cJDiShGwLXgsQXmMD1m50OJ4c3RNNmge0>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B44230600A9;
 Mon,  3 Aug 2020 05:48:10 -0400 (EDT)
Date: Mon, 3 Aug 2020 11:47:53 +0200
From: Greg KH <greg@kroah.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
Message-ID: <20200803094753.GC635660@kroah.com>
References: <659f8dcf-7802-1ca1-1372-eb7fefd4d8f4@kernel.org>
 <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com>
 <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
 <9386c640-34dd-0a50-5694-4f87cc600e0f@kernel.org>
 <20200803081823.GD493272@kroah.com>
 <CAKMK7uEV+CV89-L1Y=dijOEy8DKE=juRfQDnNnbhbAJhFh1fYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEV+CV89-L1Y=dijOEy8DKE=juRfQDnNnbhbAJhFh1fYw@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Kyungtae Kim <kt0755@gmail.com>, Solar Designer <solar@openwall.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
 Anthony Liguori <aliguori@amazon.com>,
 Yang Yingliang <yangyingliang@huawei.com>, xiao.zhang@windriver.com,
 Jiri Slaby <jirislaby@kernel.org>, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDMsIDIwMjAgYXQgMTA6NDU6MDdBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEF1ZyAzLCAyMDIwIGF0IDEwOjI2IEFNIEdyZWcgS0ggPGdyZWdAa3Jv
YWguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEF1ZyAwMywgMjAyMCBhdCAxMDowODo0M0FN
ICswMjAwLCBKaXJpIFNsYWJ5IHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4KPiA+ID4gT24gMzEuIDA3
LiAyMCwgNzoyMiwg5byg5LqR5rW3IHdyb3RlOgo+ID4gPiA+IFJlbW92ZSB3aGl0ZXNwYWNlIGF0
IEVPTAo+ID4gPgo+ID4gPiBJIGFtIGZpbmUgd2l0aCB0aGUgcGF0Y2guIEhvd2V2ZXIgaXQgc2hv
dWxkIGJlIHNlbnQgcHJvcGVybHkgKGlubGluZQo+ID4gPiBtYWlsLCBoYXZpbmcgYSBQQVRDSCBz
dWJqZWN0IGV0Yy4gLS0gc2VlCj4gPiA+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5n
LXBhdGNoZXMucnN0KS4gZ2l0IHNlbmQtZW1haWwgYWZ0ZXIgZ2l0Cj4gPiA+IGZvcm1hdC1wYXRj
aCBoYW5kbGVzIG1vc3Qgb2YgaXQuCj4gPiA+Cj4gPiA+IFRoZXJlIGlzIGFsc28gcXVlc3Rpb24g
d2hvIGlzIHdpbGxpbmcgdG8gdGFrZSBpdD8KPiA+ID4KPiA+ID4gQmFydD8gR3JlZz8gU2hvdWxk
IHdlIHJvdXRlIGl0IHZpYSBha3BtLCBvciB3aWxsIHlvdSBMaW51cyBkaXJlY3RseT8gKEkKPiA+
ID4gY2FuIHNpZ24gb2ZmIGFuZCByZXNlbmQgdGhlIHBhdGNoIHdoaWNoIHdhcyBhdHRhY2hlZCB0
byB0aGUgbWFpbCBJIGFtCj4gPiA+IHJlcGx5aW5nIHRvIHRvbywgaWYgbmVlZCBiZS4pCj4gPgo+
ID4gSSBjYW4gdGFrZSBpdCwgaWYgQmFydCBjYW4ndCwganVzdCBsZXQgbWUga25vdy4KPiAKPiBZ
ZWFoIHZ0IHN0dWZmIGFuZCBjb25zb2xlIGRyaXZlcnMgIT0gZmJjb24gZ28gdGhyb3VnaCBHcmVn
J3MgdHJlZSBwYXN0Cj4gZmV3IHllYXJzIC4uLgo+IAo+IEdyZWcsIHNob3VsZCB3ZSBtYXliZSBh
ZGQgYSBNQUlOVEFJTkVSUyBlbnRyeSB0aGF0IG1hdGNoZXMgb24gYWxsCj4gdGhpbmdzIGNvbnNv
bGU/IFdpdGggdHR5L3Z0IHlvdSBkZWZpbml0ZWx5IGhhdmUgdGhlIG90aGVyIHNpZGUgb2YgdGhh
dAo+IGNvaW4gYWxyZWFkeSA6LSkKClN1cmUsIHRoYXQgd291bGQgYmUgZ29vZCBhcyB0aGluZ3Mg
ZG8gZmFsbCB0aHJvdWdoIHRoZSBjcmFja3MgYXQgdGltZXMuCgpJZiB5b3Ugd3JpdGUgdGhlIHBh
dGNoLCBJJ2xsIG1lcmdlIGl0IDopCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
