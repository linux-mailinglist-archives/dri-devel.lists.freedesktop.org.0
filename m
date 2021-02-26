Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361BA326294
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 13:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7D6E406;
	Fri, 26 Feb 2021 12:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9BD6E406
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r/6vfWhqipvLyzahEZKp3//4g9Jmkmn637+uZha2WN0=; b=M1zkB8Bgx1H4dApWcJ0SNeimlL
 ED73W38VsozuDNEB238xzl7w0bMhIxmScyrY5u5AWjFLJF7jhNVyFUbeTPz5wqwZOIO34MEl+ljeE
 SKnFVjMaB9X7DDU3ZUXY9rWzITUPImr323kcCDaIPsB9ulOvoegfRNH2L2P5tDp5CW+RFsWlGJAyZ
 1L95FLFcK5mtqGTbVAj1kPsUPoUfQ523pwlFrRGJbzxgaPcQ7CYMu69UYrFE9BgpplAis3grwZLaO
 0r2KBTrj3bybgTpmMacUfaO50y9gaEjjsQxksgDBmNGJ1jgFVPDJxqqoXOHfYSTF0fl54qoE2m8GV
 qAjmRn6Q==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:65187
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lFc4m-0004Ad-Gx; Fri, 26 Feb 2021 13:18:32 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
To: Peter Stuge <peter@stuge.se>
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210225095825.6196.qmail@stuge.se>
 <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
 <20210225213729.16532.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <2774f35e-9436-87a0-c596-6ddb4ec6c637@tronnes.org>
Date: Fri, 26 Feb 2021 13:18:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225213729.16532.qmail@stuge.se>
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

CgpEZW4gMjUuMDIuMjAyMSAyMi4zNywgc2tyZXYgUGV0ZXIgU3R1Z2U6Cj4gTm9yYWxmIFRyw7hu
bmVzIHdyb3RlOgo+Pj4gSSBmb3Jnb3QsIGJ1dCBJIGhhdmUgYSB0d28tdG9uZSAoYmxhY2svcmVk
KSBlLWluayBkaXNwbGF5IGhlcmUsIGFuZCBJCj4+PiBhbHNvIGhhdmUgYSAzLWJwcCBSR0IgVEZU
IGRpc3BsYXkuCj4+Cj4+IEkndmUgYmVlbiBhbnRpY2lwYXRpbmcgdGhlIG5lZWQgZm9yIG1vcmUg
Zm9ybWF0cywgYnV0IEkgZGlkbid0IHdhbnQgdG8KPj4gYWRkIHRoZW0gd2l0aG91dCBoYXZpbmcg
YSB1c2VyLiBPdGhlcndpc2UgSSBjb3VsZCBlbmQgdXAgYWRkaW5nIHN0dWZmCj4+IHRoYXQgd291
bGQgbmV2ZXIgYmUgdXNlZC4gSWYgeW91IGNhbiB0ZXN0LCB0aGVyZSdzIG5vIHByb2JsZW0gYWRk
aW5nCj4+IHN1cHBvcnQgZm9yIG1vcmUgZm9ybWF0cyBub3cuCj4gCj4gVGhhdCdzIGdyZWF0ISBJ
IGNhbid0IHByb21pc2UgdG8gdG8gdGVzdCB0aGUgdGhyZWUtY29sb3IgKGIvdy9yKSBlLWluawo+
IGJ1dCBJJ2xsIHByZXBhcmUgYSB0ZXN0IHNldHVwIGZvciB0aGUgUkdCLVRGVCBvbiB0aGUgd2Vl
a2VuZC4KPiAKCk9rLCBJJ2xsIGFkZCBHVURfRFJNX0ZPUk1BVF9SR0IxMTEgaW4gdGhlIG5leHQg
cGF0Y2ggdmVyc2lvbi4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
