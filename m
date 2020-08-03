Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B987D23A0FE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9217E6E21D;
	Mon,  3 Aug 2020 08:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Mon, 03 Aug 2020 08:26:35 UTC
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC206E21B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 08:26:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B6F8D39D;
 Mon,  3 Aug 2020 04:18:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 03 Aug 2020 04:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=u
 Yg8O5tEu1MB1f4fPfz/YQ+9s7iAK9BjD2NI3o25nXI=; b=kEokCWWjf1w75CiP2
 mOWH0EMtEArBzu+goCbRnf/Pwn51Z4PeqCzP+FhJ0d4qFdwqgyIIXWJKAm/9EUak
 pOOi9xzwsR6/R2Hk1cPknCp9+oss/qnOi12eQSdK1b0+3IlAVDoGc9VIwI9Jqfyp
 L4JVLBh0G6bRo8vGv5X0e++3bG0f61hHPB6fpiLPV13GcAA7jy6yShTTI8idPYLw
 h3SO6m6rgTrssBIibqBMNL38v6lXwbTl4wxsaftg1B1ECFgzQqvz8rgDnECWIZ51
 0YfOzP/mtXrYdvyyxC6X4hmj0fk3UXd6fi3lzZdrx+RgkvCPWvS1eJKEVm+BhODO
 EWxtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=uYg8O5tEu1MB1f4fPfz/YQ+9s7iAK9BjD2NI3o25n
 XI=; b=e7sMIB59EaA+qirLEGFZvki5fhh8kTVXm1uh/qSWkyUJoct4H98FXo8P2
 ue1AZeCrPXyxwCV4gYNnmy+cthYq/Ghv97gU0XOJQlnOfk0cZpylHSquwCXMQKrn
 l7z6cv9dqtyH84cYTCTbQJ/rUgcLJXXxas1Z/eBN8Rp11eWfjErgihSqWvTD+TEk
 ViV0OlpaeHzyjKHKqdeYjPsv/OPUvKXWeir2DRPP6MLbbDUMlr6v3bx9IJD6Ksci
 gdAVqYk2ukqZYL0Kex3x002a5vLiIoQWt+qikhHN1VCfZCyH+iAGJuZ1L8ewkuxe
 z9m40G/RTVAvSYQ10MFnOlYA+Da1w==
X-ME-Sender: <xms:X8gnXx40-Fij4qqxg1NmVi4wrgj7ZJ3YyY0ugFPpxdv_6AbYlJL4wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrjeeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuheekhe
 elffefieduteefkeejffdvueehjeejffehledugfetkedvleekudduvdenucfkphepkeef
 rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:X8gnX-5AHziSfSW95WrBt3wm3qqP76mlHSsjh-ex6FSVlzJh0SbSPg>
 <xmx:X8gnX4fRbDAIiPvOMBHxjlVn64PsXeNkFJzdDsi_x6reVf7qN9w6nA>
 <xmx:X8gnX6Ls6-Hj_l2HcBIQNJquigyICPYJGBLy3041BFrjV-FP0tF5tA>
 <xmx:YsgnX-V5PUsERTSBEKW1Qpn28sg4v5r_0rLLmtJaUdXXJwW9-m2CPi9U8JI>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 22BA930600A9;
 Mon,  3 Aug 2020 04:18:39 -0400 (EDT)
Date: Mon, 3 Aug 2020 10:18:23 +0200
From: Greg KH <greg@kroah.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] vgacon: fix out of bounds write to the scrollback buffer
Message-ID: <20200803081823.GD493272@kroah.com>
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
aCBoYW5kbGVzIG1vc3Qgb2YgaXQuCj4gCj4gVGhlcmUgaXMgYWxzbyBxdWVzdGlvbiB3aG8gaXMg
d2lsbGluZyB0byB0YWtlIGl0Pwo+IAo+IEJhcnQ/IEdyZWc/IFNob3VsZCB3ZSByb3V0ZSBpdCB2
aWEgYWtwbSwgb3Igd2lsbCB5b3UgTGludXMgZGlyZWN0bHk/IChJCj4gY2FuIHNpZ24gb2ZmIGFu
ZCByZXNlbmQgdGhlIHBhdGNoIHdoaWNoIHdhcyBhdHRhY2hlZCB0byB0aGUgbWFpbCBJIGFtCj4g
cmVwbHlpbmcgdG8gdG9vLCBpZiBuZWVkIGJlLikKCkkgY2FuIHRha2UgaXQsIGlmIEJhcnQgY2Fu
J3QsIGp1c3QgbGV0IG1lIGtub3cuCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
