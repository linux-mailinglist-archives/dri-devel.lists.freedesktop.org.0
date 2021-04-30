Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1936F732
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 10:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FC76ED10;
	Fri, 30 Apr 2021 08:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4596ED10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:35:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so1261305wmf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 01:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a+bpxvXrCumd+0ZkpocwQojFVxQtmszrDN0GGOxfQ6E=;
 b=C1u0zByjvLDQd2b5gMuupfkP/+EZxXVDPwz24p3nBUAv9+PlwhWjfkXWcmVXzqLyin
 RL9g4g5qeJi2EGXBYoHmBDDZkW9IiEjU/CHl/hI5zWdR2RiXD0vd3kEflockuHc2oU/j
 lhtfUA41gYco/BWpaM09hUFZPHkECBb8V8CN7oACug0iDn1+rr07DKHG4d8fIbV6e72K
 7lBW3ADKFY+xBo6wwsXbnrOUZJ8uP2rsz7LKMc8pLs3hC0vFN5jip6eUbaS8JyINho0z
 MMERIf/ZukSWi4bmSRrGe29+XcKZRCptDEsqkbO9+bttg1B0mKOZhjhC8/tmkSUQbrQs
 2pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=a+bpxvXrCumd+0ZkpocwQojFVxQtmszrDN0GGOxfQ6E=;
 b=Ffes91Rm6ZM5u33VfnJYD8aJnlyWE+3HMjFh2jvNdYYauAUEGs4KfiMtwiv62HamOo
 aphCjNhxlYXviRl47cpDEPM9vE+HYdA9ZZw+Q1fYxG4NdkWXLek/iIfsBem9YqKvCSBe
 LKHNCyZmANIrMbitUT6NFzityb3hjGCxQxvuoILEq14W2Z+eIsU3QutoTZaxZi0X2F68
 y3pE2Bteo0QJ2ywYSQc0SYTge6lV8h7oAmrPK2dRbz9xdcsLquAjSfy5ExYGj7K/pAlr
 Fmox2h4MLnpvjTXDw+QsmuO8Q9Hsu4w0sn++aFDlufpxve6t33prhut8Fipwiakxlyl9
 7nUg==
X-Gm-Message-State: AOAM533M8o0ewLoFYx3PRWODnfs2rylpI/r2BGLn3lJyas38F55T6bGv
 G1tp6tHgJozKCsBtb8ydFxb5SA==
X-Google-Smtp-Source: ABdhPJw613zFbLTeMGoyT+jCIEGAh2nEpztCeJ3FnVr56SiV3w8Tb+tXyEQIT+ydSKtF2RPSmwCFwA==
X-Received: by 2002:a1c:1bc1:: with SMTP id
 b184mr15104890wmb.119.1619771712131; 
 Fri, 30 Apr 2021 01:35:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4a89:8c32:4adc:fc67?
 ([2a01:e0a:90c:e290:4a89:8c32:4adc:fc67])
 by smtp.gmail.com with ESMTPSA id j13sm1389076wrw.93.2021.04.30.01.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 01:35:11 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] drm/bridge: nwl-dsi: Remove a check on unchanged
 HS clock rate from ->mode_set()
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
References: <1619170003-4817-1-git-send-email-victor.liu@nxp.com>
 <1619170003-4817-3-git-send-email-victor.liu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <176671b3-b0f8-d1be-79a1-ebf8ee9123e9@baylibre.com>
Date: Fri, 30 Apr 2021 10:35:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1619170003-4817-3-git-send-email-victor.liu@nxp.com>
Content-Language: en-US
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie, agx@sigxcpu.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDQvMjAyMSAxMToyNiwgTGl1IFlpbmcgd3JvdGU6Cj4gVGhlIGNoZWNrIG9uIHVuY2hh
bmdlZCBIUyBjbG9jayByYXRlIGluIC0+bW9kZV9zZXQoKSBpbXByb3Zlcwo+IHRoZSBjYWxsYmFj
aydzIHBlcmZvcm1hbmNlIGEgYml0IGJ5IGVhcmx5IHJldHVybi4gIEhvd2V2ZXIsCj4gdGhlIHVw
LWNvbWluZyBwYXRjaCB3b3VsZCBnZXQgTUlQSSBEU0kgY29udHJvbGxlciBhbmQgUEhZIHJlYWR5
Cj4gaW4gLT5tb2RlX3NldCgpIGFmdGVyIHRoYXQgY2hlY2ssIHRodXMgbGlrZWx5IHNraXBwZWQu
Cj4gU28sIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGF0IGNoZWNrIHRvIG1ha2Ugc3VyZSBNSVBJIERT
SSBjb250cm9sbGVyCj4gYW5kIFBIWSB3aWxsIGJlIGJyb3VnaHQgdXAgYW5kIHRha2VuIGRvd24g
ZnJvbSAtPm1vZGVfc2V0KCkgYW5kCj4gLT5hdG9taWNfZGlzYWJsZSgpIHJlc3BlY3RpdmVseSBp
biBwYWlycy4KPiAKPiBDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBD
YzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENjOiBSb2JlcnQg
Rm9zcyA8cm9iZXJ0LmZvc3NAbGluYXJvLm9yZz4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBKb25hcyBLYXJsbWFuIDxqb25h
c0Brd2lib28uc2U+Cj4gQ2M6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5l
dD4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5v
cmc+Cj4gQ2M6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KPiBDYzogTlhQ
IExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpdSBZaW5n
IDx2aWN0b3IubGl1QG54cC5jb20+Cj4gLS0tCj4gdjItPnYzOgo+ICogU3BsaXQgZnJvbSB0aGUg
c2luZ2xlIHBhdGNoIGluIHYyIHRvIGNsYXJpZnkgY2hhbmdlcy4gKE5laWwpCj4gCj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jIHwgNyAtLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L253bC1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5jCj4gaW5kZXggYzY1
Y2E4NjA3MTJkMi4uNjAxY2NjNGE3Y2RjNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL253bC1kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbndsLWRzaS5j
Cj4gQEAgLTg1NiwxMyArODU2LDYgQEAgbndsX2RzaV9icmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSwKPiAgCWlmIChyZXQgPCAwKQo+ICAJCXJldHVybjsKPiAgCj4gLQkv
Kgo+IC0JICogSWYgaHMgY2xvY2sgaXMgdW5jaGFuZ2VkLCB3ZSdyZSBhbGwgZ29vZCAtIGFsbCBw
YXJhbWV0ZXJzIGFyZQo+IC0JICogZGVyaXZlZCBmcm9tIGl0IGF0bS4KPiAtCSAqLwo+IC0JaWYg
KG5ld19jZmcubWlwaV9kcGh5LmhzX2Nsa19yYXRlID09IGRzaS0+cGh5X2NmZy5taXBpX2RwaHku
aHNfY2xrX3JhdGUpCj4gLQkJcmV0dXJuOwo+IC0KPiAgCXBoeV9yZWZfcmF0ZSA9IGNsa19nZXRf
cmF0ZShkc2ktPnBoeV9yZWZfY2xrKTsKPiAgCURSTV9ERVZfREVCVUdfRFJJVkVSKGRldiwgIlBI
WSBhdCByZWYgcmF0ZTogJWx1XG4iLCBwaHlfcmVmX3JhdGUpOwo+ICAJLyogU2F2ZSB0aGUgbmV3
IGRlc2lyZWQgcGh5IGNvbmZpZyAqLwo+IAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
