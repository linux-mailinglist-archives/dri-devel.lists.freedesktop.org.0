Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E3CC31DF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 12:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813A26E607;
	Tue,  1 Oct 2019 10:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067AD6E607
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 10:58:08 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52781
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <noralf@tronnes.org>)
 id 1iFFr4-00014j-ST; Tue, 01 Oct 2019 12:58:06 +0200
Subject: Re: [PATCH] drm/tiny: Kconfig: Remove always-y THERMAL dep. from
 TINYDRM_REPAPER
To: Ulf Magnusson <ulfalizer@gmail.com>, linux-kbuild@vger.kernel.org,
 yamada.masahiro@socionext.com
References: <20190927174218.GA32085@huvuddator>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c3b41a7b-ef3b-7960-13a1-d4b8dd6f15b6@tronnes.org>
Date: Tue, 1 Oct 2019 12:58:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927174218.GA32085@huvuddator>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OD/B4iuITOBha9TeXpgkoPm9qIuj9lBSYQ/sNuiU7O0=; b=MDcF3cWagQZbEN1B+InsUhKij2
 N3zZg9zAjHkUCBrBGuytCTVkqLRpcnlsLgTtFsfGW4diDrF6qGUVciAPZouJihn2Frw1rVa244yuj
 xLoFESzg27iwtsoQ603yQh14aBwNWfaIczS8rhXtQF6WSPmzrr/uSJkhValCX3zvta9FKxiK3CKwG
 DOcKogl9BpNp/epm3jeSPcILJVWcUIf+bdiG3n6W3S9PK4DVnERJO5N3cRwwcJGiSrBHZPX0vQpbB
 LyNif+S6DxCPBAXZG2F6TcrSe57hdkNO0HxJQ9y20TWQY0JgBJppO/ar7/eKewposog47VHy+GzNV
 D3bbIM7g==;
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
Cc: david@lechnology.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hdegoede@redhat.com, tglx@linutronix.de,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjcuMDkuMjAxOSAxOS40Miwgc2tyZXYgVWxmIE1hZ251c3NvbjoKPiBDb21taXQgNTU0
YjM1MjlmZTAxICgidGhlcm1hbC9kcml2ZXJzL2NvcmU6IFJlbW92ZSB0aGUgbW9kdWxlIEtjb25m
aWcncwo+IG9wdGlvbiIpIGNoYW5nZWQgdGhlIHR5cGUgb2YgVEhFUk1BTCBmcm9tIHRyaXN0YXRl
IHRvIGJvb2wsIHNvCj4gVEhFUk1BTCB8fCAhVEhFUk1BTCBpcyBub3cgYWx3YXlzIHkuIFJlbW92
ZSB0aGUgcmVkdW5kYW50IGRlcGVuZGVuY3kuCj4gCj4gRGlzY292ZXJlZCB0aHJvdWdoIEtjb25m
aWdsaWIgZGV0ZWN0aW5nIGEgZGVwZW5kZW5jeSBsb29wLiBUaGUgQyB0b29scwo+IHNpbXBsaWZ5
IHRoZSBleHByZXNzaW9uIHRvIHkgYmVmb3JlIHJ1bm5pbmcgZGVwZW5kZW5jeSBsb29wIGRldGVj
dGlvbiwKPiBhbmQgc28gZG9uJ3Qgc2VlIGl0LiBDaGFuZ2luZyB0aGUgdHlwZSBvZiBUSEVSTUFM
IGJhY2sgdG8gdHJpc3RhdGUgbWFrZXMKPiB0aGUgQyB0b29scyBkZXRlY3QgdGhlIHNhbWUgbG9v
cC4KPiAKPiBOb3Qgc3VyZSBpZiBydW5uaW5nIGRlcC4gbG9vcCBkZXRlY3Rpb24gYWZ0ZXIgc2lt
cGxpZmljYXRpb24gY2FuIGJlCj4gY2FsbGVkIGEgYnVnLiBGaXhpbmcgdGhpcyBuaXQgdW5icmVh
a3MgS2NvbmZpZ2xpYiBvbiB0aGUga2VybmVsIGF0Cj4gbGVhc3QuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVWxmIE1hZ251c3NvbiA8dWxmYWxpemVyQGdtYWlsLmNvbT4KPiAtLS0KClRoYW5rcywgYXBw
bGllZCB0byBkcm0tbWlzYy1uZXh0LgoKTm9yYWxmLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
