Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514E31CE39
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 17:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9836389BF6;
	Tue, 16 Feb 2021 16:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B859389BF6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x6daIK1DrjmXBdrioqUodtIbdTUCm8RJ5MGPLi5VNu0=; b=TbCiNSAT6zj/yk7yn/eiItUUKA
 gAbEpchAPn1fHrq9v+sdMo+Q8pquuKU7cSJIt7NBnVOIO/naZcq59sX/IRpvDTTQPiWTigIL9BnA+
 oXsGtiZldclWL8jXgxo4VVVU4eQETNVjtwZkmOYul38dZVwMFRK/Wd+Q3d2bM7Qv9ly7xmIcDDVr2
 O4tfK2hjm3Diyd3tceWqVcivdliEYq8bmF5wd4i1+JbtqFdT4VIE8CqoPRj/ZXrIhlB6iftCsphA0
 XnC8x+s9dGsTWXY25bvI6HZW+NwBDTHNB35CIi5+RICHvjWHcSWLRr1c+HVuKQyVU+sdY9oXTsBv2
 ywx3geTg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49310
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lC3PF-0004K4-Mw; Tue, 16 Feb 2021 17:40:57 +0100
Subject: Re: [PATCH v5 3/3] drm: Add Generic USB Display driver
To: Oliver Neukum <oneukum@suse.de>, dri-devel@lists.freedesktop.org
References: <20210212174609.58977-1-noralf@tronnes.org>
 <20210212174609.58977-4-noralf@tronnes.org>
 <5164bb01b7f3cf71926109a37b9e3957cfb630ba.camel@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <316502da-218e-3837-d356-79a7b5dce7ae@tronnes.org>
Date: Tue, 16 Feb 2021 17:40:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5164bb01b7f3cf71926109a37b9e3957cfb630ba.camel@suse.de>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTYuMDIuMjAyMSAxNC4zNiwgc2tyZXYgT2xpdmVyIE5ldWt1bToKPiBBbSBGcmVpdGFn
LCBkZW4gMTIuMDIuMjAyMSwgMTg6NDYgKzAxMDAgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6Cj4+
ICtzdGF0aWMgdm9pZCBndWRfY29ubmVjdG9yX2Vhcmx5X3VucmVnaXN0ZXIoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKPj4gK3sKPj4gKyAgICAgICBzdHJ1Y3QgZ3VkX2Nvbm5lY3Rv
ciAqZ2Nvbm4gPSB0b19ndWRfY29ubmVjdG9yKGNvbm5lY3Rvcik7Cj4+ICsKPj4gKyAgICAgICBi
YWNrbGlnaHRfZGV2aWNlX3VucmVnaXN0ZXIoZ2Nvbm4tPmJhY2tsaWdodCk7Cj4+ICsgICAgICAg
Y2FuY2VsX3dvcmtfc3luYygmZ2Nvbm4tPmJhY2tsaWdodF93b3JrKTsKPj4gK30KPiAKPiBIaSwK
PiAKPiB0aGlzIGxvb2tzIGxpa2UgeW91IGFyZSBjcmVhdGluZyBhIHJhY2UgY29uZGl0aW9uIHdo
ZXJlIHRoZSBxdWV1ZWQgd29yawo+IG1heSBvcGVyYXRlIG9uIGFuIGFscmVhZHkgdW5yZWdpc3Rl
cmVkIGJhY2tsaWdodC4KPiAKCmJhY2tsaWdodF9kZXZpY2VfdW5yZWdpc3RlcigpIHNldHMgYmQt
Pm9wcyA9IE5VTEwuIFRoaXMgbWVhbnMgdGhhdAp1c2Vyc3BhY2UgY2FuJ3QgdXBkYXRlIGJyaWdo
dG5lc3MgYW55bW9yZSwgYW5kIHRodXMgd29uJ3QgY2FsbCBpbnRvIHRoaXMKZHJpdmVyLiBBZnRl
ciB0aGF0IGl0IHNob3VsZCBiZSBzYWZlIHRvIGZsdXNoL2NhbmNlbCB0aGUgd29ya3F1ZXVlLgoK
VW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLgoKTm9yYWxmLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
