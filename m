Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B625DB9889
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B726E0C0;
	Fri, 20 Sep 2019 20:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611916FD7D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 17:52:21 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b10so3522234plr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 10:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ynxoenyM+InuPtGnmU7JFYqYrrx9ed4gAhVFtGW6oSg=;
 b=XLrGWQpk+WtqUnFK8suSMky/OtjwQmodWcohSyV0ewxnbXs96Hjl1wu32pPkvwSsUD
 mHmkePiuKnCCzbklc5SI3ZjLr8Ho4fbQViLujLqyG87mETjidSiwlpMUQps7ojI0jkki
 5lYZhOuXZaTXa3r4SIHwSWVQ7K3JxI+wvbZfc2Rbo+yLBp6N3rlooHDwxG4b3mAUZY2n
 GDbVhTdh0UcGNjvi7RaRbbFMcsK9HQBgff7A9wRIheicBkNyaPiU3ap61S+ChZqk8mpX
 kmsNd7jnZYho94WZKujnikYV0rJ//NWndEV+i43TGloQmXTOBjUdb+I0ES/g2lFOINFP
 uuKQ==
X-Gm-Message-State: APjAAAXg7IkrkBBoU82/uaEnbXRnHDdHLqs4YgYAZqsGZWGd4MoOsgw7
 EX1QLIvxGnw4QNWsoYLOFL0=
X-Google-Smtp-Source: APXvYqzG0G32qP0bYFipLzA1PrvD62zWQIo5Me16U5y/KZ8/ppUW/0ktZ9UTZa/LqIX5/onkGTXe+Q==
X-Received: by 2002:a17:902:fe12:: with SMTP id
 g18mr17465318plj.97.1569001940903; 
 Fri, 20 Sep 2019 10:52:20 -0700 (PDT)
Received: from [10.67.50.53] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id 127sm2373889pgi.46.2019.09.20.10.52.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 10:52:20 -0700 (PDT)
Subject: Re: [PATCH] Revert "ARM: bcm283x: Switch V3D over to using the PM
 driver instead of firmware."
To: Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 boris.brezillon@bootlin.com
References: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <09f15af6-a849-a5eb-ac39-f4cdb07ebfb9@gmail.com>
Date: Fri, 20 Sep 2019 10:52:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynxoenyM+InuPtGnmU7JFYqYrrx9ed4gAhVFtGW6oSg=;
 b=LY0ywgWxFLkIulrr/XdOTSZQ9+YCd1uAMjcQ/GfA6SuoTbunbUc/M3IBm/zFX5U3iU
 Typg5FhyWodXq7l6DwCu38mVyo8Rc2eEb2MJ/7eX6TAbrnWWCBMyX0FcByGsd8SHjRMf
 QBa+tF0LJrZg9+ehlvaeJV474/njKizrs3muwJjSomzd5E/qLQs6aKBZgxsCUw5WgSvK
 /mrbkt/TNS+PJunpTd+wE3MLcu00HAPvW/gIC8mqu46nPow+Ma3KAUApdbapPyvIial9
 t4Y18BFlbWg1UFr+PqaJbfYmV/Qn4YxCSiGpxDIsrVSrXVzk7x+71HhlECjdsHgqxFTQ
 3iNw==
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
Cc: stable@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS84LzE5IDg6NDQgQU0sIFN0ZWZhbiBXYWhyZW4gd3JvdGU6Cj4gU2luY2UgcmVsZWFzZSBv
ZiB0aGUgbmV3IEJDTTI4MzUgUE0gZHJpdmVyIHRoZXJlIGhhcyBiZWVuIHNldmVyYWwgcmVwb3J0
cwo+IG9mIFYzRCBwcm9iaW5nIGlzc3Vlcy4gVGhpcyBpcyBjYXVzZWQgYnkgdGltZW91dHMgZHVy
aW5nIHBvd2VyaW5nLXVwIHRoZQo+IEdSQUZYIFBNIGRvbWFpbjoKPiAKPiAgIGJjbTI4MzUtcG93
ZXI6IFRpbWVvdXQgd2FpdGluZyBmb3IgZ3JhZnggcG93ZXIgT0sKPiAKPiBJIHdhcyBhYmxlIHRv
IHJlcHJvZHVjZSB0aGlzIHJlbGlhYmxlIG9uIG15IFJhc3BiZXJyeSBQaSAzQisgYWZ0ZXIgc2V0
dGluZwo+IGZvcmNlX3R1cmJvPTEgaW4gdGhlIGZpcm13YXJlIGNvbmZpZ3VyYXRpb24uIFNpbmNl
IHRoZXJlIGFyZSBubyBpc3N1ZXMKPiB1c2luZyB0aGUgZmlybXdhcmUgUE0gZHJpdmVyIHdpdGgg
dGhlIHNhbWUgc2V0dXAsIHRoZXJlIG11c3QgYmUgYW4gaXNzdWUKPiBpbiB0aGUgQkNNMjgzNSBQ
TSBkcml2ZXIuCj4gCj4gVW5mb3J0dW5hdGVseSB0aGVyZSBoYXNuJ3QgYmVlbiBtdWNoIHByb2dy
ZXNzIGluIGlkZW50aWZ5aW5nIHRoZSByb290IGNhdXNlCj4gc2luY2UgSnVuZSAobW9zdGx5IGlu
IHRoZSBsYWNrIG9mIGRvY3VtZW50YXRpb24pLCBzbyBpIGRlY2lkZWQgdG8gc3dpdGNoCj4gYmFj
ayB1bnRpbCB0aGUgaXNzdWUgaW4gdGhlIEJDTTI4MzUgUE0gZHJpdmVyIGlzIGZpeGVkLgo+IAo+
IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9pc3N1ZXMvMzA0Ngo+
IEZpeGVzOiBlMWRjMmIyZTFiZWYgKCIgQVJNOiBiY20yODN4OiBTd2l0Y2ggVjNEIG92ZXIgdG8g
dXNpbmcgdGhlIFBNIGRyaXZlciBpbnN0ZWFkIG9mIGZpcm13YXJlLiIpCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gV2FocmVuIDx3YWhyZW5zdEBn
bXgubmV0PgoKRG8geW91IHdhbnQgbWUgdG8gcGljayB1cCB0aGlzIGNoYW5nZSBkaXJlY3RseSwg
b3Igd291bGQgeW91IHdhbnQgdG8KaXNzdWUgYSBwdWxsIHJlcXVlc3QgZm9yIDUuNC1yY1ggd2l0
aCBvdGhlciBmaXhlcz8KLS0gCkZsb3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
