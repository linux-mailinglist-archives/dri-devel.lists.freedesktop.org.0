Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E3A23B5F8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969546E434;
	Tue,  4 Aug 2020 07:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 537 seconds by postgrey-1.36 at gabe;
 Tue, 04 Aug 2020 07:46:32 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276606E434
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 07:46:32 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9BDF85803B6;
 Tue,  4 Aug 2020 03:37:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 04 Aug 2020 03:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=F
 ocaEVAZNOs0ka4mL6/6OKxNWgHGmuyCC7zusvr1Pd4=; b=FUh4tqaVdu4BCwO17
 1kbbYDF7QOanYfyAl6laql1JXzWhnS8A8QlrfS3CdUZLXUAeLCdEk4JYjW+FzWb+
 HdQcHUL8nqK7aRVXWV5EQ9n/ihOnQKr7f802t/3KXFYAxLz8FQjw0dp0fyVe1bm3
 lspxwY32F3W0gN/HAhFWFIDDA1D+7R8XHrbivUiI5ePbcwM+cMyCu9L7RdN8kgG8
 2Kd5V3iQr8r3fAEuCRL33lulvObydW2aJaiff5GRxrRA8oZHt9qP5anVlWpSohoE
 f08KhdQNKlETk3Mi6GoaMmNIlCS/gwb7QGcBKUN0hkQyaAa9QTeYT78jIEmI7ac3
 XSDcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=FocaEVAZNOs0ka4mL6/6OKxNWgHGmuyCC7zusvr1P
 d4=; b=kQ004FSg9gs4aPO4D9qVcddcL27QJfEF+krIFkz/PSlsD7jT49WWF1Pyi
 Oxf/QaiPNBpKAMPAD0JeGktU5a73RdAIQ3v4m99uBTtFFZeweZBOgLcNC2MGjpiH
 agc6ZH7zh0S7IPnP85LpVaQpoeUSShrY2kewmnTnjjAvaJMvkvhngbv7etR08DiY
 yCp3HcR8ntRwQS+1nU5fs7y+X/VclWxzE659ys0bHvuJT+e4pqqkaa2BUlzV0D4k
 woNxnKgfYHoHVJtvfWmSVT/jlWSZJSNBatic/H4z2Yb4DEaZqGyzz8wRKBL3XL4o
 ezodNClD7d4VjdbSh8LCwXXHVLhqg==
X-ME-Sender: <xms:OhApX3OQzB_EZn2dDOhkhCf4ipDnmc5RLLf_TeUTJ7aUwH2HUL3wOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrjeehgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueehke
 ehlefffeeiudetfeekjeffvdeuheejjeffheeludfgteekvdelkeduuddvnecukfhppeek
 fedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:OhApXx_v2n9lecvivSPrCjw2ZFh8vZeJ1MlYDBc6ipjjNeMwFsTkfQ>
 <xmx:OhApX2QCAm1NoA70VI4fVBwUdt4IACAI4IOKTGNaNAQolAxURIguIw>
 <xmx:OhApX7tIFGk6mj6tbsp5zfY-vuPw54tIcP1DOX5uSsod7y-8ZerjeA>
 <xmx:PBApXz4OiQiYB_CIyeAVDDntFVYjAO_7_J-59wVmtvT4YY4zi71l7A>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7EF030600B1;
 Tue,  4 Aug 2020 03:37:29 -0400 (EDT)
Date: Tue, 4 Aug 2020 09:37:11 +0200
From: Greg KH <greg@kroah.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
Message-ID: <20200804073711.GA1749774@kroah.com>
References: <659f8dcf-7802-1ca1-1372-eb7fefd4d8f4@kernel.org>
 <dbcf2841-7718-2ba7-11e0-efa4b9de8de1@nsfocus.com>
 <9fb43895-ca91-9b07-ebfd-808cf854ca95@nsfocus.com>
 <9386c640-34dd-0a50-5694-4f87cc600e0f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9386c640-34dd-0a50-5694-4f87cc600e0f@kernel.org>
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
 Kyungtae Kim <kt0755@gmail.com>, Anthony Liguori <aliguori@amazon.com>,
 b.zolnierkie@samsung.com,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
 Solar Designer <solar@openwall.com>, Yang Yingliang <yangyingliang@huawei.com>,
 xiao.zhang@windriver.com, Linus Torvalds <torvalds@linux-foundation.org>,
 =?utf-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDMsIDIwMjAgYXQgMTA6MDg6NDNBTSArMDIwMCwgSmlyaSBTbGFieSB3cm90
ZToKPiBIaSwKPiAKPiBPbiAzMS4gMDcuIDIwLCA3OjIyLCDlvKDkupHmtbcgd3JvdGU6Cj4gPiBS
ZW1vdmUgd2hpdGVzcGFjZSBhdCBFT0wKPiAKPiBJIGFtIGZpbmUgd2l0aCB0aGUgcGF0Y2guIEhv
d2V2ZXIgaXQgc2hvdWxkIGJlIHNlbnQgcHJvcGVybHkgKGlubGluZQo+IG1haWwsIGhhdmluZyBh
IFBBVENIIHN1YmplY3QgZXRjLiAtLSBzZWUKPiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0
dGluZy1wYXRjaGVzLnJzdCkuIGdpdCBzZW5kLWVtYWlsIGFmdGVyIGdpdAo+IGZvcm1hdC1wYXRj
aCBoYW5kbGVzIG1vc3Qgb2YgaXQuCgpJJ2xsIGdvIGZpeCB0aGlzIGFsbCB1cCBub3cgImJ5IGhh
bmQiIDooCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
