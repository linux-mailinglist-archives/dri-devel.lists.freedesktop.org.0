Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E94A5560
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFCD899E8;
	Mon,  2 Sep 2019 11:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D63899E8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:58:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g7so13766226wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cIuJ4ZyO7u1R0DHww9r6ZEUVkA8fHsMxFkdXkyyL4q8=;
 b=pxyy/KGtifUyP424fzfYzt5LiSP76n7iIPV2nDij+uHcrPDK2IAlEG4EOXjyq7tlMC
 OZEYIw2yr9LVj79jETjAhjn8XLB/11syF6tANBnTohmHX5C7u2JEPsLBtLqqKIr/ouPG
 31OwB5T6sS0gSTt0KAE+9/QLxui/0InNU6JWeoXRZ5lSDCXCSCKcy5fHw9h/dS7yZtfT
 WqJWSIQWZcEFKOl3OV+xFjJNK0YWdPArYyja+D2kOcG5bQwOL4Ou9Uk1SuCk/g3sMPym
 oLj4Hyhwmo+bgiLJwj4Six97sgIe0TfakCHzahwaL3g1nmhuCJhCAkTL7xU7QWI/54CA
 72dQ==
X-Gm-Message-State: APjAAAWXHXYSxTTg0d4jXjkFLA206Y/x09X0ukaDY6MuFrwiUNl4TFmi
 tPrG3Kdp9HRst7Dw1tu/DmYH6w==
X-Google-Smtp-Source: APXvYqy7XooxwtcxbzDP3Qx5rs5Gg4qkUsWNe3UALra+Yh0UnaURoY2WV9WFmk1NgQTaEMd0+Q9/EA==
X-Received: by 2002:adf:e485:: with SMTP id i5mr12884281wrm.175.1567425479999; 
 Mon, 02 Sep 2019 04:57:59 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m18sm5450088wrg.97.2019.09.02.04.57.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 04:57:59 -0700 (PDT)
Subject: Re: [PATCH v2] drm: dw-hdmi-i2s: enable audio clock in audio_startup
To: Jonas Karlman <jonas@kwiboo.se>, Cheng-Yi Chiang <cychiang@chromium.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190902035435.44463-1-cychiang@chromium.org>
 <241fd791-3792-34c8-ac35-a81a0a41070c@baylibre.com>
 <HE1PR06MB4011E2F58875F30446D902BFACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9e049910-3f7a-a65c-c329-97865e35c8cc@baylibre.com>
Date: Mon, 2 Sep 2019 13:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <HE1PR06MB4011E2F58875F30446D902BFACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cIuJ4ZyO7u1R0DHww9r6ZEUVkA8fHsMxFkdXkyyL4q8=;
 b=Y7nVs9IGvhy5DYUH+6gjjsYgad9lh9VwpVhPeWOsAZGJ1HTWRuSRzGu+gHcEtLXa29
 LcZFLq0VfQ0VdnULsIWZHyDWatuoW6BuJnvA5tm4/kCW6TEnTA8bf61feFsCcjo7Izsr
 guDZ8q5G7Xu4X0JiIoGi/kQEFDeCly9pW2LiwrOlkKLvnKf4Yhn2s2AvtK5djI7LrlS4
 M/WB0KMPf/ugTtCo4xO2OPYzj3yS9UhgGIw8G9FGDqy9g0yu34E37v5CTXO2Byd4+fbx
 szog8YdlBNc/TSDtNur6qEe95Dw58e5/HycYH8fA2e7I6xNlSxPt/d8nFjZMXQafgAND
 MOKA==
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMDkvMjAxOSAxMjozMiwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBPbiAyMDE5LTA5LTAy
IDExOjQyLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDAyLzA5LzIwMTkg
MDU6NTQsIENoZW5nLVlpIENoaWFuZyB3cm90ZToKPj4+IEluIHRoZSBkZXNpZ253YXJlIGRhdGFi
b29rLCB0aGUgc2VxdWVuY2Ugb2YgZW5hYmxpbmcgYXVkaW8gY2xvY2sgYW5kCj4+PiBzZXR0aW5n
IGZvcm1hdCBpcyBub3QgY2xlYXJseSBzcGVjaWZpZWQuCj4+PiBDdXJyZW50bHksIGF1ZGlvIGNs
b2NrIGlzIGVuYWJsZWQgaW4gdGhlIGVuZCBvZiBod19wYXJhbSBvcHMgYWZ0ZXIKPj4+IHNldHRp
bmcgZm9ybWF0Lgo+Pj4KPj4+IE9uIHNvbWUgbW9uaXRvcnMsIHRoZXJlIGlzIGEgcG9zc2liaWxp
dHkgdGhhdCBhdWRpbyBkb2VzIG5vdCBjb21lIG91dC4KPj4+IEZpeCB0aGlzIGJ5IGVuYWJsaW5n
IGF1ZGlvIGNsb2NrIGluIGF1ZGlvX3N0YXJ0dXAgb3BzCj4+PiBiZWZvcmUgaHdfcGFyYW0gb3Bz
IHNldHRpbmcgZm9ybWF0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8
Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgo+Pj4gUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24g
PGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPj4+IFJldmlld2VkLWJ5OiBKb25hcyBLYXJsbWFuIDxq
b25hc0Brd2lib28uc2U+Cj4+PiBUZXN0ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJz
QGNocm9taXVtLm9yZz4KPj4+IC0tLQo+Pj4gIENoYW5nZXMgZnJvbSB2MToKPj4+ICAxLiBNb3Zl
IGF1ZGlvX3N0YXJ0dXAgdG8gdGhlIGZyb250IG9mIGF1ZGlvX3NodXRkb3duLgo+Pj4gIDIuIEZp
eCB0aGUgaW5kZW50YXRpb24gb2YgYXVkaW9fc3RhcnR1cCBlcXVhbCBzaWduIHVzaW5nIHRhYi4K
Pj4+ICAzLiBSZWJhc2UgdGhlIHBhdGNoIG9uIGxpbnV4LW5leHQvbWFzdGVyLgo+Pj4gIDQuIEFk
ZCBSZXZpZXdlZC1ieSBhbmQgVGVzdGVkLWJ5IGZpZWxkcyBmcm9tIGRpYW5kZXJzQGNocm9taXVt
Lm9yZy4KPj4+ICA1LiBBZGQgUmV2aWV3ZWQtYnkgZmllbGQgZnJvbSBqb25hc0Brd2lib28uc2Uu
Cj4+Pgo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVk
aW8uYyB8IDkgKysrKysrKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWktaTJzLWF1ZGlvLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkt
aTJzLWF1ZGlvLmMKPj4+IGluZGV4IDFkMTVjZjliNjgyMS4uMzRkOGU4Mzc1NTVmIDEwMDY0NAo+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRp
by5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJz
LWF1ZGlvLmMKPj4+IEBAIC0xMDksNiArMTA5LDE0IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMnNf
aHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPj4+ICAJaGRtaV93cml0
ZShhdWRpbywgY29uZjAsIEhETUlfQVVEX0NPTkYwKTsKPj4+ICAJaGRtaV93cml0ZShhdWRpbywg
Y29uZjEsIEhETUlfQVVEX0NPTkYxKTsKPj4+ICAKPj4+ICsJcmV0dXJuIDA7Cj4+PiArfQo+Pj4g
Kwo+Pj4gK3N0YXRpYyBpbnQgZHdfaGRtaV9pMnNfYXVkaW9fc3RhcnR1cChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEpCj4+PiArewo+Pj4gKwlzdHJ1Y3QgZHdfaGRtaV9pMnNfYXVkaW9f
ZGF0YSAqYXVkaW8gPSBkYXRhOwo+Pj4gKwlzdHJ1Y3QgZHdfaGRtaSAqaGRtaSA9IGF1ZGlvLT5o
ZG1pOwo+Pj4gKwo+Pj4gIAlkd19oZG1pX2F1ZGlvX2VuYWJsZShoZG1pKTsKPj4+ICAKPj4+ICAJ
cmV0dXJuIDA7Cj4+PiBAQCAtMTUzLDYgKzE2MSw3IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMnNf
Z2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPj4+ICAKPj4+
ICBzdGF0aWMgc3RydWN0IGhkbWlfY29kZWNfb3BzIGR3X2hkbWlfaTJzX29wcyA9IHsKPj4+ICAJ
Lmh3X3BhcmFtcwk9IGR3X2hkbWlfaTJzX2h3X3BhcmFtcywKPj4+ICsJLmF1ZGlvX3N0YXJ0dXAg
ID0gZHdfaGRtaV9pMnNfYXVkaW9fc3RhcnR1cCwKPj4+ICAJLmF1ZGlvX3NodXRkb3duCT0gZHdf
aGRtaV9pMnNfYXVkaW9fc2h1dGRvd24sCj4+PiAgCS5nZXRfZWxkCT0gZHdfaGRtaV9pMnNfZ2V0
X2VsZCwKPj4+ICAJLmdldF9kYWlfaWQJPSBkd19oZG1pX2kyc19nZXRfZGFpX2lkLAo+Pj4KPj4g
TG9va3Mgc2FuZSwgSm9uYXMgc2hvdWxkIEkgYXBwbHkgaXQgbm93IGl0J3MgcmViYXNlZCA/Cj4g
Cj4gU3VyZSwgbG9va3Mgc2FuZSBhbmQgY29tcGlsZXMgd2l0aG91dCB3YXJuaW5ncyBvbiBteSBi
dWlsZCBob3N0LgoKVGh4LCBBcHBsaWVkIHRvIGRybS1taXNjLW5leHQKCk5laWwKCj4gCj4gUmVn
YXJkcywKPiBKb25hcwo+IAo+Pgo+PiBOZWlsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
