Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBCD1AD688
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 09:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2528F6E357;
	Fri, 17 Apr 2020 06:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5CE6EA8C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 18:52:30 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r17so6428407lff.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=py7oEgmRCooYj2CPRnKMi71cKEMq2nTHeaImBJf9BbU=;
 b=LfN9BJrMTXYSHJ48+TPTF6hqH79k99zTWSxz5JYksutzuqfV1AyeGkj3fhJEyGPdJR
 vqYxFUvHhk1D+dLL+M9NDKjWrBwhl155TAs09Dq9UfqqjzgdP8IUL5mu2ojmcdKfNQ9S
 B71TdsaBTF3ITggGDIbL16Bl+m296H068j8rK5lyzgwGhciXYEyhL0VGJ6I8suD2o8KE
 n9386adRUObZDWjrsdt5uuATd6JWfo4E/SWvzaQ9d08lHa70BFaCCIUAFbkVAlCUV82M
 0A3rkQD2qvhO1f9SRl3HCTmxd1n1JWZsPOjKga038TJXS04isBlwBa4fKeG6W5Vkfysc
 TwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=py7oEgmRCooYj2CPRnKMi71cKEMq2nTHeaImBJf9BbU=;
 b=ocIUhh+DoRzOFNWNDXqnkK1oTCRCns/7hvN7ybduTl5hDUbCeKLyoGB5dfHS2tqGlx
 bKAcQYPp9Y9ipTaCRViQ2lbRPl5bug111jH0ulKn0Hfer8UOXD1rA8upc2FmYoEfoWH4
 n9tyy3bMQqN6SDDQWf6w+lKIV2XWrwZxK09xHBCq4+RdNBuyBJLNjNfq9jR/zeRVx4o4
 TdBPzBm1KUbyrNdUe79Xmkl05JesOYpcD8Mu0CBdb2LDpy2Deys7jfIll7a1yq01A8bP
 J74Rr15yWxRsq0+AofMmUWV95b5J1vpyWGJjMLDvqTmkVoJYo1Zxw9jqi7vivxnqYKC5
 3XsA==
X-Gm-Message-State: AGi0PuZi20aP/E3paBjBXnXpiEWjjeJg0aOAT4P8Ax0dgp98IAKQpXEI
 Sal75wTaUPt8OiOj4E4whm8=
X-Google-Smtp-Source: APiQypJRhEE+vxpkY0spXrvTzGYMIa/BcafeIvcF8eO3lirtSeQl6gSTQYW/8N1v3nvnWCNscNfg5g==
X-Received: by 2002:ac2:5f73:: with SMTP id c19mr7087040lfc.29.1587063148827; 
 Thu, 16 Apr 2020 11:52:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id l18sm363987ljg.98.2020.04.16.11.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 11:52:27 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
Date: Thu, 16 Apr 2020 21:52:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416174112.GS4796@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 17 Apr 2020 06:59:46 +0000
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDQuMjAyMCAyMDo0MSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgouLi4KPj4gKwlp
ZiAob3V0cHV0LT5icmlkZ2UpIHsKPj4gKwkJZXJyID0gZHJtX2JyaWRnZV9hdHRhY2goJm91dHB1
dC0+ZW5jb2Rlciwgb3V0cHV0LT5icmlkZ2UsCj4+ICsJCQkJCU5VTEwsIERSTV9CUklER0VfQVRU
QUNIX05PX0NPTk5FQ1RPUik7Cj4gCj4gVXNpbmcgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVD
VE9SIGlzIGRlZmluaXRlbHkgdGhlIHdheSB0byBnbywgYnV0Cj4gcGxlYXNlIGJlIGF3YXJlIHRo
YXQgaXQgd2lsbCByZXF1aXJlIGNyZWF0aW5nIGEgY29ubmVjdG9yIGFuZCBhbiBlbmNvZGVyCj4g
bWFudWFsbHkgKHdoaWNoIEkgdGhpbmsgdGhpcyBkcml2ZXIgYWxyZWFkeSBkb2VzKSwgYW5kIHVz
aW5nIHRoZSBicmlkZ2UKPiBvcGVyYXRpb25zIHRvIGltcGxlbWVudCB0aGUgY29ubmVjdG9yIG9w
ZXJhdGlvbnMuIEkgaGlnaGx5IHJlY29tbWVuZAo+IHVzaW5nIHRoZSBEUk0gYnJpZGdlIGNvbm5l
Y3RvciBoZWxwZXIgZm9yIHRoaXMgcHVycG9zZS4KCk9rYXksIEkgbWlzc2VkIHRoYXQgdGhlcmUg
aXMgYSBEUk0gYnJpZGdlIGNvbm5lY3RvciBoZWxwZXIuIFRoYW5rIHlvdQp2ZXJ5IG11Y2ggZm9y
IHRoZSBzdWdnZXN0aW9uLCBJJ2xsIHN3aXRjaCB0byB0aGUgYnJpZGdlIGhlbHBlciBpbiB2NC4K
Cj4+ICsJCWlmIChlcnIpIHsKPj4gKwkJCWRldl9lcnIob3V0cHV0LT5kZXYsICJjYW5ub3QgY29u
bmVjdCBicmlkZ2U6ICVkXG4iLAo+PiArCQkJCWVycik7Cj4+ICsJCQlyZXR1cm4gZXJyOwo+PiAr
CQl9Cj4+ICsJfQo+PiArCj4+ICAJaWYgKG91dHB1dC0+cGFuZWwpIHsKPiAKPiBNYXkgSSBhbHNv
IHJlY29tbWVuZCBzd2l0Y2hpbmcgdG8gdGhlIERSTSBwYW5lbCBicmlkZ2UgaGVscGVyID8gSXQg
d2lsbAo+IHNpbXBsaWZ5IHRoZSBjb2RlLgoKQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHdoYXQg
aXMgdGhlICJEUk0gcGFuZWwgYnJpZGdlIGhlbHBlciI/CgpJIHRoaW5rIHdlIHdvbid0IG5lZWQg
YW55IGFkZGl0aW9uYWwgaGVscGVycyBhZnRlciBzd2l0Y2hpbmcgdG8gdGhlCmJyaWRnZSBjb25u
ZWN0b3IgaGVscGVyLCBubz8KCi4uLgo+PiArCQlucCA9IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9k
ZShyZ2ItPm91dHB1dC5icmlkZ2UtPm9mX25vZGUsCj4+ICsJCQkJCSAgICAgIHBhbmVsX3BvcnQs
IC0xKTsKPiAKPiBUaGlzIHNob3VsZG4ndCBiZSBuZWVkZWQsIHRoZSBMVkRTIGNvZGVjIGJyaWRn
ZSBkcml2ZXIgc2hvdWxkIGFscmVhZHkKPiBnZXQgdGhlIHBhbmVsIGFuZCBoYW5kbGUgaXQgaW50
ZXJuYWxseS4gWW91IG9ubHkgbmVlZCB0byBoYW5kbGUgcGFuZWxzCj4gaW4gdGhpcyBkcml2ZXIg
d2hlbiB0aGV5J3JlIGNvbm5lY3RlZCBkaXJlY3RseSB0byB0aGUgUkdCIGlucHV0LgoKSW5kZWVk
LCBpdCB3b24ndCBiZSBuZWVkZWQgaWYgd2Ugd2lsbCB1c2UgdGhlIGJyaWRnZSBjb25uZWN0b3Ig
aGVscGVyLgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgY2xhcmlmaWNhdGlvbnMhCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
