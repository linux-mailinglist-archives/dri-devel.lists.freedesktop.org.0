Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F041519A5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 19:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182B89D84;
	Mon, 24 Jun 2019 17:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 373 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jun 2019 17:35:43 UTC
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259C89D84
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 17:35:43 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5520C15065090;
 Mon, 24 Jun 2019 10:29:28 -0700 (PDT)
Date: Mon, 24 Jun 2019 10:29:27 -0700 (PDT)
Message-Id: <20190624.102927.1268781741493594465.davem@davemloft.net>
To: megous@megous.com
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190620134748.17866-1-megous@megous.com>
References: <20190620134748.17866-1-megous@megous.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 24 Jun 2019 10:29:29 -0700 (PDT)
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
Cc: mark.rutland@arm.com, joabreu@synopsys.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, maxime.ripard@bootlin.com, netdev@vger.kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-sunxi@googlegroups.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogbWVnb3VzQG1lZ291cy5jb20KRGF0ZTogVGh1LCAyMCBKdW4gMjAxOSAxNTo0Nzo0MiAr
MDIwMAoKPiBGcm9tOiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiAKPiBUaGlz
IHNlcmllcyBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIFh1bmxvbmcgT3JhbmdlIFBpIDMgYm9hcmQu
Cj4gCj4gLSBldGhlcm5ldCBzdXBwb3J0IChwYXRjaGVzIDEtMykKPiAtIEhETUkgc3VwcG9ydCAo
cGF0Y2hlcyA0LTYpCj4gCj4gRm9yIHNvbWUgcGVvcGxlLCBldGhlcm5ldCBkb2Vzbid0IHdvcmsg
YWZ0ZXIgcmVib290IChidXQgd29ya3Mgb24gY29sZAo+IGJvb3QpLCB3aGVuIHRoZSBzdG1tYWMg
ZHJpdmVyIGlzIGJ1aWx0IGludG8gdGhlIGtlcm5lbC4gSXQgd29ya3Mgd2hlbgo+IHRoZSBkcml2
ZXIgaXMgYnVpbHQgYXMgYSBtb2R1bGUuIEl0J3MgZWl0aGVyIHNvbWUgdGltaW5nIGlzc3VlLCBv
ciBwb3dlcgo+IHN1cHBseSBpc3N1ZSBvciBhIGNvbWJpbmF0aW9uIG9mIGJvdGguIE1vZHVsZSBi
dWlsZCBpbmR1Y2VzIGEgcG93ZXIKPiBjeWNsaW5nIG9mIHRoZSBwaHkuCj4gCj4gSSBlbmNvdXJh
Z2UgcGVvcGxlIHdpdGggdGhpcyBpc3N1ZSwgdG8gYnVpbGQgdGhlIGRyaXZlciBpbnRvIHRoZSBr
ZXJuZWwsCj4gYW5kIHRyeSB0byBhbHRlciB0aGUgcmVzZXQgdGltaW5ncyBmb3IgdGhlIHBoeSBp
biBEVFMgb3IKPiBzdGFydHVwLWRlbGF5LXVzIGFuZCByZXBvcnQgdGhlIGZpbmRpbmdzLgoKVGhp
cyBpcyBhIG1peHR1cmUgb2YgbmV0d29ya2luZyBhbmQgbm9uLW5ldHdvcmtpbmcgY2hhbmdlcyBz
byBpdCByZWFsbHkKY2FuJ3QgZ28gdGhyb3VnaCBteSB0cmVlLgoKSSB3b25kZXIgaG93IHlvdSBl
eHBlY3QgdGhpcyBzZXJpZXMgdG8gYmUgbWVyZ2VkPwoKVGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
