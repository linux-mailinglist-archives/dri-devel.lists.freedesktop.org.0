Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A40E9D39
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 15:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C060C6EA1A;
	Wed, 30 Oct 2019 14:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB8E6EA1A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 14:12:54 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57440
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iPoiS-00008w-Ay; Wed, 30 Oct 2019 15:12:52 +0100
Subject: Re: [PATCH 2/2] drm/fb-helper: Remove
 drm_fb_helper_fbdev_{setup,teardown}()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch
References: <20191029070616.3521-1-tzimmermann@suse.de>
 <20191029070616.3521-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <dce7c8ca-5a80-3b87-bf5b-46ff4711e719@tronnes.org>
Date: Wed, 30 Oct 2019 15:12:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029070616.3521-3-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Auo6i0SMXTOz/GzK6ge2hevL3gEifIUHq+79pSTRZ0=; b=FrDKY575TlXdaSZixf/bU6ISB3
 jja/XEplCyqko7EMT6d5jN661RBkNlavrjl8Mu5cy8LktOmo1bgheU2CrqznQSEB5C0+kLlct5eWt
 QuYXriO6yZN+idb5pvC0uVwLigOnVlXmEZObMXn73fyZgNZlK1M1KYP8O2zywIvOO6Sz9EINhASu3
 fUBfFnN7rZbT3PQBlt2SegNXyJB/BDEOnIqzdASCYb5KamP/Niet+9zO0UIjdVjV4JN2in6exfGA0
 TdjZv9qjoyV7TPVYyg+YR0pDEiSoea1Trg1fzYLnhuMC7vWHtaneoiHHbhll4BnCT0MEIfp/fqWNJ
 46bM5tjQ==;
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjkuMTAuMjAxOSAwOC4wNiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gQm90aCBm
dW5jdGlvbnMgYXJlIHVudXNlZCBhbmQgY2FuIGJlIHJlbW92ZWQuIERyaXZlcnMgc2hvdWxkIHVz
ZQo+IGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDEwOSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmggICAgIHwgIDI1IC0tLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEzMyBkZWxldGlvbnMoLSkKPiAK
ClRoYW5rcyBmb3IgdGhlIGNsZWFudXA6CgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxu
b3JhbGZAdHJvbm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
