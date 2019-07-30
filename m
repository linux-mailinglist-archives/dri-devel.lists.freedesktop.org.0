Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC67A7DE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 14:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CC86E4B5;
	Tue, 30 Jul 2019 12:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DAA6E4B5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:12:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 31so65543463wrm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 05:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lHGY2lcHanvRAPBsmHRkzid26h1VhTCR/KhvIXyqiLU=;
 b=kAm0gKA72Rr5ArEpu1qo5gGnaFQ7KvtWGZ64ZspMiGNRlwo/w7+2LW/XH1c7Y0R+XO
 dA0N3PO/kI+/3et95rfu4/rZsDkgKIy4qkS3tRMONJhiZoMoHhTmrFX7mXtnrozC5Cac
 WTmpsjg6+pPfHFhr6HbjNbcADDIvmEACYgZKowsSKKTIcNHuB5B6B/E3MjjkWVEwif27
 qCNrb2cnBPHjsvwXaTDFWrv6tGS9W13e9BAfLkCMp6bKLDV1dqHUmso9ehASaUBUEwnj
 v6vWYbVabRCamFUy3mQdJDfX0Squn9y5zIFom5I3vjUgmYMILeUvpXH6fNZePS2JS3SI
 OT6A==
X-Gm-Message-State: APjAAAU809zr1B9apERPylZf3t5iRkUrOFLU5QRebteelbF8BiyiMv0x
 SBmmVSao+N6w3o6WyGi5dda0z9pGDcs=
X-Google-Smtp-Source: APXvYqwPA7oRRg20ZFeN7+F9xZfv+Bel+kwPWTRFZxtdWY0dLa/p7EYV87TqwLgp0ry8FNcyVukzZQ==
X-Received: by 2002:adf:9f0e:: with SMTP id l14mr118867452wrf.23.1564488766043; 
 Tue, 30 Jul 2019 05:12:46 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v5sm76019805wre.50.2019.07.30.05.12.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:12:45 -0700 (PDT)
Subject: Re: [PATCH v3 01/10] drm: bridge: Add dual_link field to the
 drm_bridge_timings structure
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-2-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2d3d1f82-7c5f-5d91-bd6d-a379285d7d3f@baylibre.com>
Date: Tue, 30 Jul 2019 14:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190528141234.15425-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lHGY2lcHanvRAPBsmHRkzid26h1VhTCR/KhvIXyqiLU=;
 b=113B8R4mYI3LRLGR83TBNaWENM+9FPeB8Uc5e75npq3bfR39OXNS5CjKVQSMaQAX2V
 gEkT84xeiauHpka0Gcl6VtxECiPaoSrFSY3hPhXyG9GG+omuzYaBcSwomOp4jAqCl1/4
 dNEVIOD+EVi+fyxOU0odcUBK2WOCCfE73el4W+YbNXjd4glXSNO4FBdoSbkGsE1sowCt
 jUeUgDnIf4DMpXxileHrmlkyfNdcX/blsZE/tIhRCQ7E2GGCm/stsoAku/ZjUR34pD0Z
 CmUulMm48ooGPAq4T93x2WrYVRBdR6FIJtD5a4I1PSuDzv6aLmhT4TDbMnjkAL8fzS2d
 CcPA==
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDUvMjAxOSAxNjoxMiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBFeHRlbmQgdGhl
IGRybV9icmlkZ2VfdGltaW5ncyBzdHJ1Y3R1cmUgd2l0aCBhIG5ldyBkdWFsX2xpbmsgZmllbGQg
dG8KPiBpbmRpY2F0ZSB0aGF0IHRoZSBicmlkZ2UncyBpbnB1dCBidXMgY2FycmllcyBkYXRhIG9u
IHR3byBzZXBhcmF0ZQo+IHBoeXNpY2FsIGxpbmtzLiBUaGUgZmlyc3QgdXNlIGNhc2UgaXMgTFZE
UyBkdWFsLWxpbmsgbW9kZSB3aGVyZSBldmVuLQo+IGFuZCBvZGQtbnVtYmVyZWQgcGl4ZWxzIGFy
ZSB0cmFuc2ZlcnJlZCBvbiBzZXBhcmF0ZSBMVkRTIGxpbmtzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQu
Y29tPgo+IFJldmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNh
c0BpZGVhc29uYm9hcmQuY29tPgo+IFRlc3RlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVu
ZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggfCA4ICsr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4g
aW5kZXggZDQ0Mjg5MTNhNGUxLi5hZWExZmNmZDkyYTcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2JyaWRnZS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gQEAgLTI2
NSw2ICsyNjUsMTQgQEAgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyB7Cj4gIAkgKiBpbnB1dCBz
aWduYWwgYWZ0ZXIgdGhlIGNsb2NrIGVkZ2UuCj4gIAkgKi8KPiAgCXUzMiBob2xkX3RpbWVfcHM7
Cj4gKwkvKioKPiArCSAqIEBkdWFsX2xpbms6Cj4gKwkgKgo+ICsJICogVHJ1ZSBpZiB0aGUgYnVz
IG9wZXJhdGVzIGluIGR1YWwtbGluayBtb2RlLiBUaGUgZXhhY3QgbWVhbmluZyBpcwo+ICsJICog
ZGVwZW5kZW50IG9uIHRoZSBidXMgdHlwZS4gRm9yIExWRFMgYnVzZXMsIHRoaXMgaW5kaWNhdGVz
IHRoYXQgZXZlbi0KPiArCSAqIGFuZCBvZGQtbnVtYmVyZWQgcGl4ZWxzIGFyZSByZWNlaXZlZCBv
biBzZXBhcmF0ZSBsaW5rcy4KPiArCSAqLwo+ICsJYm9vbCBkdWFsX2xpbms7Cj4gIH07Cj4gIAo+
ICAvKioKPiAKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
