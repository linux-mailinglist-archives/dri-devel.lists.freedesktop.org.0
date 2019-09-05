Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C38A9DE1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 11:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5B689CFA;
	Thu,  5 Sep 2019 09:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 449 seconds by postgrey-1.36 at gabe;
 Thu, 05 Sep 2019 09:11:12 UTC
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5A989CFA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 09:11:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 817F068C;
 Thu,  5 Sep 2019 05:03:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 05 Sep 2019 05:03:40 -0400
X-ME-Sender: <xms:as9wXdZVJ28oIMBKMmH6H42UWu5GB4HH5TjZtLzWvcXt7mn6BkTNVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejjedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtredunecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepfhhrvggvug
 gvshhkthhophdrohhrghenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:as9wXU2Xknu5tcRdzFhoUE0LYM5oxQMFcjnmYzl2kgDR1PBKnPBrYg>
 <xmx:as9wXVbdE2fg4jQvNrTs7RIYBMUPTv9wdBXgSi7cZ11rqNJX2KhRtQ>
 <xmx:as9wXZnY0HHUkEh7GA7TVKtHVZo45BFzZUSAJzb47fpGXp_OwGUJfw>
 <xmx:a89wXSHBolyaNyxOrhNO46JMbDvBDjaCQlPZk8encT_3K8Zw0XIGYA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DF7FD6005A;
 Thu,  5 Sep 2019 05:03:38 -0400 (EDT)
Date: Thu, 5 Sep 2019 11:03:36 +0200
From: Greg KH <greg@kroah.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.19 147/167] drm/panel: Add support for Armadeus
 ST0700 Adapt
Message-ID: <20190905090336.GA29020@kroah.com>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-147-sashal@kernel.org>
 <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJrwwsp1wjCBnNmx45ZiLTXVY_nCfN6OrJ5o9dLbc+_2w@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=H
 C9eg9snVfiloyfXDdAH6KobugN4wqDmlyk9BxglEuU=; b=Fi1NuvnZZT5YDlmi7
 SqQOc6IxK3PoFZmKP0GgIeX1gmEyxFSxG9ODPsp/i4G6u9pPGihm40wrV7IZBZ/G
 M3GfNmpOfrB5TBTuqQwpZXpYqhzpPtNuB5IXTPUxLx9kUWq71pL8xYrCbSjn0G+i
 N2fXhvPuEYLiqPSo9xjoE+n3mHtMJys4xV3z0hFbRRpJTXk2Tsqjygr/jgr31FpS
 eHncLLG2/APdyNII8FIc1FrO+MZTxamcTBGeMysrbBwUCuWMkUQ0/bCg9YsIY12Y
 STVtV+tlf5UrlDpw8ILAPX+zmnbm7Vl/XZIyAKnNFmTIMPFvsI9pR4wUndMN7ACI
 YAFUg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=HC9eg9snVfiloyfXDdAH6KobugN4wqDmlyk9BxglE
 uU=; b=AjxgRNI59JEhqgVHho8N/+Sw94ZaRpBtVHFAoyaoniN3hn16EgqoSHEoh
 hzCFUaj5gODsfp8Ay5FeZYAhwjymehVHs5Fjty7tBa0MOsg7jtyG1iz7i+RZgQHb
 RZEMyWE61YHCdEuJ6yZffpPIWxQORsm55HPScUUfkNnrou626DJ7saZrX8zJUG0c
 f1/zAgSZlx1l6vZgSUcjuJoJhgTils+cAPqUR4npolT9Xox9Wjz/0BkWqDw5tt4j
 SzbzcQFHGnF3zXMlgOfROEg/618LKeScLMuGPYAAbYIdgaMkM7NoP/pRhI4P6pgT
 8JdDjlwl54BW6d3edMuiIYCM7/KiQ==
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDk6NTU6NThBTSArMDEwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBTZXAgMywgMjAxOSBhdCA1OjMxIFBNIFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogU8OpYmFzdGllbiBTenltYW5za2kgPHNl
YmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+ID4KPiA+IFsgVXBzdHJlYW0gY29tbWl0
IGM0Nzk0NTBmNjFjN2YxZjI0OGM5YTU0YWVkYWNkMmE2Y2E1MjFmZjggXQo+ID4KPiA+IFRoaXMg
cGF0Y2ggYWRkcyBzdXBwb3J0IGZvciB0aGUgQXJtYWRldXMgU1QwNzAwIEFkYXB0LiBJdCBjb21l
cyB3aXRoIGEKPiA+IFNhbnRlayBTVDA3MDBJNVktUkJTTFcgNy4wIiBXVkdBICg4MDB4NDgwKSBU
RlQgYW5kIGFuIGFkYXB0ZXIgYm9hcmQgc28KPiA+IHRoYXQgaXQgY2FuIGJlIGNvbm5lY3RlZCBv
biB0aGUgVEZUIGhlYWRlciBvZiBBcm1hZGV1cyBEZXYgYm9hcmRzLgo+ID4KPiA+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnICMgdjQuMTkKPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kg
PHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gTGluazogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNTA3MTUyNzEzLjI3NDk0LTEtc2ViYXN0
aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20KPiA+IFNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9kaXNwbGF5L3BhbmVsL2FybWFk
ZXVzLHN0MDcwMC1hZGFwdC50eHQgICB8ICA5ICsrKysrKwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysKPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRl
dXMsc3QwNzAwLWFkYXB0LnR4dAo+IAo+IExvb2tzIGxpa2UgYSBuZXcgZmVhdHVyZSwgbm90IHN0
YWJsZSBtYXRlcmlhbC4gTm90IHN1cmUgd2h5IGl0IGdvdAo+IHRhZ2dlZCBmb3Igc3RhYmxlLgoK
TmV3IGRldmljZSBpZHMvdGFibGVzIGFyZSBhYmxlIHRvIGJlIGFkZGVkIHRvIHN0YWJsZSBrZXJu
ZWxzLCBzaW5jZSwKd2VsbCwgZm9yZXZlciA6KQoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
