Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C810EA4B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 14:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD956E1E2;
	Mon,  2 Dec 2019 13:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7A76E1E2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 13:01:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D718309;
 Mon,  2 Dec 2019 14:01:37 +0100 (CET)
Date: Mon, 2 Dec 2019 15:01:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/3] ARM: dts: am437x-gp/epos-evm: fix panel compatible
Message-ID: <20191202130129.GG4929@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114093950.4101-2-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575291697;
 bh=WYmra6jda+Fp8NOdE5uzn+oGXn851nCErVz2IiLcgxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nIbIj2POuyZeAMi5k6PheqcZfLAavfLvEMEus7Cs7/Xyxl7ZXPI33YgTrgqT6O3kv
 3cFP+VG3F+s/yLhV6BxubaRm68MKmJG175CTynEeMwJRaHr6XOIqtD5UImdSWOvGuy
 e5FU0OsETy9qXVdLv4iPFmR7H3CYQrT0febZBnB4=
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBOb3YgMTQsIDIwMTkg
YXQgMTE6Mzk6NDhBTSArMDIwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gVGhlIExDRCBwYW5l
bCBvbiBBTTQgR1AgRVZNcyBhbmQgZVBPUyBib2FyZHMgc2VlbXMgdG8gYmUKPiBvc2QwNzB0MTcx
OC0xOXRzLiBUaGUgY3VycmVudCBkdHMgZmlsZXMgc2F5IG9zZDA1N1QwNTU5LTM0dHMuIFBvc3Np
Ymx5Cj4gdGhlIHBhbmVsIGhhcyBjaGFuZ2VkIHNpbmNlIHRoZSBlYXJseSBFVk1zLCBvciB0aGVy
ZSBoYXMgYmVlbiBhIG1pc3Rha2UKPiB3aXRoIHRoZSBwYW5lbCB0eXBlLgo+IAo+IFVwZGF0ZSB0
aGUgRFQgZmlsZXMgYWNjb3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWlu
ZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFja2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybS9ib290
L2R0cy9hbTQzN3gtZ3AtZXZtLmR0cyAgfCAyICstCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNDN4
LWVwb3MtZXZtLmR0cyB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3
eC1ncC1ldm0uZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMKPiBpbmRl
eCBjYWU0NTAwMTk0ZmUuLjgxMWM4Y2FlMzE1YiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9hbTQzN3gtZ3AtZXZtLmR0cwo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3eC1n
cC1ldm0uZHRzCj4gQEAgLTg2LDcgKzg2LDcgQEAKPiAgCQl9Owo+ICAKPiAgCWxjZDA6IGRpc3Bs
YXkgewo+IC0JCWNvbXBhdGlibGUgPSAib3NkZGlzcGxheXMsb3NkMDU3VDA1NTktMzR0cyIsICJw
YW5lbC1kcGkiOwo+ICsJCWNvbXBhdGlibGUgPSAib3NkZGlzcGxheXMsb3NkMDcwdDE3MTgtMTl0
cyIsICJwYW5lbC1kcGkiOwo+ICAJCWxhYmVsID0gImxjZCI7Cj4gIAo+ICAJCWJhY2tsaWdodCA9
IDwmbGNkX2JsPjsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gtZXBvcy1l
dm0uZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gtZXBvcy1ldm0uZHRzCj4gaW5kZXggOTUz
MTQxMjFkMTExLi4wNzhjYjQ3M2ZhN2QgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
YW00M3gtZXBvcy1ldm0uZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gtZXBvcy1l
dm0uZHRzCj4gQEAgLTQyLDcgKzQyLDcgQEAKPiAgCX07Cj4gIAo+ICAJbGNkMDogZGlzcGxheSB7
Cj4gLQkJY29tcGF0aWJsZSA9ICJvc2RkaXNwbGF5cyxvc2QwNTdUMDU1OS0zNHRzIiwgInBhbmVs
LWRwaSI7Cj4gKwkJY29tcGF0aWJsZSA9ICJvc2RkaXNwbGF5cyxvc2QwNzB0MTcxOC0xOXRzIiwg
InBhbmVsLWRwaSI7Cj4gIAkJbGFiZWwgPSAibGNkIjsKPiAgCj4gIAkJYmFja2xpZ2h0ID0gPCZs
Y2RfYmw+OwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
