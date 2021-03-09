Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37856332E00
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 19:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41B36E923;
	Tue,  9 Mar 2021 18:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0D6E923
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZST+NdFiFpFoYCK9cuPqdH4p9SeIGnAZwDaOtTHvsqk=; b=SnOOM9BlXOxiDAGkPWrkTp+C85
 Gz8oVb96eC71DKaYbbsRhUEtxmu91bLndWW/8/mU2nJVAb2GI4MoPShb0vbh3MK20DX9EqaBnHndg
 TF/PoyY4YWxjmZkUxvL6ihRqSKyXFRAYx1jUKlTKA1ivUJkXF9XyFfgIP6AcrgNRK1UiLI4DLLfkl
 IyAKUKIxZkv4fkkpomfT03ojnR4L+hcJcPT1pgMmirgWRI1hL52UeE+2mlVN84yak6vRN5qTmaFxr
 inb8p7B329BZkx86Emzr1bp//fhWfLN3pwanTnzRqyp3BizFCBZ9GwhBYkhN5Djvrm68jWRbt39wR
 vKD2dHiA==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=49681)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lJguX-0000m9-E3; Tue, 09 Mar 2021 19:16:49 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Peter Stuge <peter@stuge.se>
References: <20210305163104.30756-1-noralf@tronnes.org>
 <20210305163104.30756-4-noralf@tronnes.org>
 <20210309140200.13094.qmail@stuge.se>
 <59bf10c7-91aa-ba09-7128-91e87272e29e@tronnes.org>
Message-ID: <330c580d-de8f-7362-211b-eaf80b166421@tronnes.org>
Date: Tue, 9 Mar 2021 19:16:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <59bf10c7-91aa-ba09-7128-91e87272e29e@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDkuMDMuMjAyMSAxOS4wNywgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAwOS4wMy4yMDIxIDE1LjAyLCBza3JldiBQZXRlciBTdHVnZToKPj4gSGVsbG8gTm9yYWxmLAo+
Pgo+PiBJJ3ZlIG1hZGUgc29tZSBwcm9ncmVzcyB3aXRoIG15IHRlc3QgZGV2aWNlLiBJJ20gaW1w
bGVtZW50aW5nIFIxCj4+IGZpcnN0IGFuZCBvbmNlIHRoYXQgd29ya3MgSSdsbCB0ZXN0IFJHQjEx
MSBhcyB3ZWxsLiBBbG9uZyB0aGUgd2F5Cj4+IEkndmUgZm91bmQgYSBjb3VwbGUgb2YgdGhpbmdz
IGluIHRoZSBjb2RlOgo+PgoKPiBEZXBlbmRpbmcgb24gaG93IGxvbmcgaXQgdGFrZXMgZm9yIHRo
ZSBETUEgbWFzayBkZXBlbmRlbmN5IHBhdGNoIHRvIHNob3cKPiB1cCBpbiBkcm0tbWlzYy1uZXh0
LCBJIHdpbGwgZWl0aGVyIHB1Ymxpc2ggYSBuZXcgdmVyc2lvbiBvciBhcHBseSB0aGUKPiBjdXJy
ZW50IGFuZCBwcm92aWRlIHBhdGNoZXMgd2l0aCB0aGUgbmVjZXNzYXJ5IGZpeGVzLiAKCkluIGNh
c2UgSSBhcHBseSB0aGlzIHZlcnNpb24sIGFyZSB5b3UgaGFwcHkgZW5vdWdoIHdpdGggaXQgdGhh
dCB5b3Ugd2FudAp0byBnaXZlIGFuIGFjayBvciByLWI/CgpOb3JhbGYuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
