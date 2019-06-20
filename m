Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E364D090
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DC46E5AD;
	Thu, 20 Jun 2019 14:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC956E5AD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:40:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z23so3441938wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rbA7KNAENXe+ANroQbV4yDpx7Jb+S4Jx+UHkiChpfPA=;
 b=Uj4uNcjvNvJaX3G5qJncOUrheVA2xY2sl5BBr3Pc0AipMpmlDu76OvCOUpDt2FdgEf
 eY082ocZvw/wTK176CnqyAec33yd0TQeSnwz0R2VZtu/JxpLE5cbua8jq8u8E1qZmMTM
 n2Jj0TbBr9USvjbmW3CDQf5ggsqhPAkzunsQFfUlmZtfU//Fdin/GQ0ooQJnmI84QA2w
 GlfNoDuVKfUk/Pg206ZYzmWhdOULWDmPr16+qoQpRt6vEsV0I2mzVdvDkSJ1iMwa4GVa
 XCLHQwwxgKzWuTmOGN6qKuf9ilkJGct2q99KKXWdp466dYXUzPRvV/tl4NqoXqByixff
 KBxw==
X-Gm-Message-State: APjAAAXb02xiiAjstaGwP6VQ0ePLISrvarLl1+oC0UQCfEuj890ZUCOO
 btvpt9yGgGUGYeMM6hoYH8UbvA==
X-Google-Smtp-Source: APXvYqyF8Gwk2z8kiKskIxmUKThKe1pKCq4jyJ0AXOPQ5LsgJ735VFk09Gs2YfIyp85wfTbLh9Gfkw==
X-Received: by 2002:a1c:720e:: with SMTP id n14mr3154446wmc.53.1561041613229; 
 Thu, 20 Jun 2019 07:40:13 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p3sm21020823wrd.47.2019.06.20.07.40.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 07:40:12 -0700 (PDT)
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
To: Jonas Karlman <jonas@kwiboo.se>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <085dc3be-20e5-b2fe-4c02-bf4a4d1473da@baylibre.com>
Date: Thu, 20 Jun 2019 16:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rbA7KNAENXe+ANroQbV4yDpx7Jb+S4Jx+UHkiChpfPA=;
 b=WsUEv8+zMSy8H9xzrB72BgzVZyvWB5rsNKxX5+tQWPMdJy9LvNotaNnoUsahGoAd0+
 UqxdwWhntAyFe898mwIHoaMsGjRQQAKbe0QKwQAIp/ejDxeAlECSrDqouz5hANj6d03j
 6LoSyj5FxyhIhwv1mvOYtW0638a1mUNlDQlyXK7xWG1ytLktLU1L0UIRocazPhiCSE4I
 QmXpJ89ySPR8LkEU8KCxkkxXsBFh1BXLkF0MnoE8ttaTT8UYom6pFIZ4xyej9AaQHsuL
 MztaxhC50tfwHrKLrMSt7WHZH/LQyStRR5gZlZYeVwvJNcZQBfPx2rYdkUMdktf58xjx
 1G6g==
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCkdlbnRsZSBwaW5nLCBjb3VsZCB5b3UgcmV2aWV3IHRoZSBkdy1oZG1pIGNo
YW5nZXMgaGVyZSA/CgpUaGFua3MsCk5laWwKCk9uIDI2LzA1LzIwMTkgMjM6MTgsIEpvbmFzIEth
cmxtYW4gd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9yIEhEUiBtZXRhZGF0YSB1c2luZyB0aGUgaGRy
X291dHB1dF9tZXRhZGF0YSBjb25uZWN0b3IgcHJvcGVydHksCj4gY29uZmlndXJlIER5bmFtaWMg
UmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUgYWNjb3JkaW5nbHkuCj4gCj4gQSBkcm1faW5m
b2ZyYW1lIGZsYWcgaXMgYWRkZWQgdG8gZHdfaGRtaV9wbGF0X2RhdGEgdGhhdCBwbGF0Zm9ybSBk
cml2ZXJzCj4gY2FuIHVzZSB0byBzaWduYWwgd2hlbiBEeW5hbWljIFJhbmdlIGFuZCBNYXN0ZXJp
bmcgaW5mb2ZyYW1lcyBpcyBzdXBwb3J0ZWQuCj4gVGhpcyBmbGFnIGlzIG5lZWRlZCBiZWNhdXNl
IEFtbG9naWMgR1hCQiBhbmQgR1hMIHJlcG9ydCBzYW1lIERXLUhETUkgdmVyc2lvbiwKPiBhbmQg
b25seSBHWEwgc3VwcG9ydCBEUk0gSW5mb0ZyYW1lLgo+IAo+IFRoZSBmaXJzdCBwYXRjaCBhZGQg
ZnVuY3Rpb25hbGl0eSB0byBjb25maWd1cmUgRFJNIEluZm9GcmFtZSBiYXNlZCBvbiB0aGUKPiBo
ZHJfb3V0cHV0X21ldGFkYXRhIGNvbm5lY3RvciBwcm9wZXJ0eS4KPiAKPiBUaGUgcmVtYWluaW5n
IHBhdGNoZXMgc2V0cyB0aGUgZHJtX2luZm9mcmFtZSBmbGFnIG9uIHNvbWUgU29DcyBzdXBwb3J0
aW5nCj4gRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZS4KPiAKPiBOb3RlIHRo
YXQgdGhpcyB3YXMgYmFzZWQgb24gdG9wIG9mIGRybS1taXNjLW5leHQgYW5kIE5laWwgQXJtc3Ry
b25nJ3MKPiAiZHJtL21lc29uOiBBZGQgc3VwcG9ydCBmb3IgSERNSTIuMCBZVVY0MjAgNGs2MCIg
c2VyaWVzIGF0IFsxXQo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzU4NzI1LyNyZXYyCj4gCj4gSm9uYXMgS2FybG1hbiAoNCk6Cj4gICBkcm0vYnJpZGdl
OiBkdy1oZG1pOiBBZGQgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBzdXBw
b3J0Cj4gICBkcm0vcm9ja2NoaXA6IEVuYWJsZSBEUk0gSW5mb0ZyYW1lIHN1cHBvcnQgb24gUksz
MzI4IGFuZCBSSzMzOTkKPiAgIGRybS9tZXNvbjogRW5hYmxlIERSTSBJbmZvRnJhbWUgc3VwcG9y
dCBvbiBHWEwsIEdYTSBhbmQgRzEyQQo+ICAgZHJtL3N1bjRpOiBFbmFibGUgRFJNIEluZm9GcmFt
ZSBzdXBwb3J0IG9uIEg2Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jICAgfCAxMDkgKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmggICB8ICAzNyArKysrKysrCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgICAgfCAgIDUgKwo+ICBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIHwgICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX2R3X2hkbWkuYyAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV9kd19oZG1pLmggICAgICAgfCAgIDEgKwo+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdf
aGRtaS5oICAgICAgICAgICAgICAgIHwgICAxICsKPiAgNyBmaWxlcyBjaGFuZ2VkLCAxNTcgaW5z
ZXJ0aW9ucygrKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
