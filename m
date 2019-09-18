Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156EAB5F5B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 10:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800CC6EE51;
	Wed, 18 Sep 2019 08:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC36EE51
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:43:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i1so5954662wro.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 01:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:references:user-agent:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Es/bmU3c9XGaRtzCiMLIVrPNjr9MNI0eTxg3xMnbUYc=;
 b=H5GSIBW1RZYXmPIlWAWNOA3qlNTKPHpXrsX6fiw/RwAUht3GS3g3fNJPhIj08dHw7z
 aljAIp3oRCYqRx5uOKYsB7VajmbNqsWy1fk1A4zE/zRoqjua2fG/9+dR1JDgnDrYrFzb
 9z8XXgQZRtm4tKkba9Tdf5cbuOqTsHsdKthItcx2FgnRgKj5vNfZHG/us4Vjm0auZv+X
 7ewJEFLHCd9wBNjnTPTs+WJARTCmxcCKdZWVl5Ch+OkjgSFpAFuj0PGCf2T3JCuLAnN2
 qK/CEaYoDtbXzsOw8zitB7fRWfCd4a5TEuV+AmA1A8/drBR8KvDebdcXKx0RqNXDpvJ5
 St2g==
X-Gm-Message-State: APjAAAXCoFV1E4m9vO/e8zskc0cPuyUWOkJ1Q1WazYoCbPp+SxGYeE0x
 WAWiIX8qaS3rQTN75mMeyRWccQ==
X-Google-Smtp-Source: APXvYqz3Kpju44v9NdaCUS71dFKfNZ3q3V7oya0OqrnOC9uxnDdFSkv5zrOWWA/QCE/CJM9pIPUidg==
X-Received: by 2002:a5d:52c8:: with SMTP id r8mr2192409wrv.256.1568796231510; 
 Wed, 18 Sep 2019 01:43:51 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q10sm9774982wrd.39.2019.09.18.01.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 01:43:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
X-Google-Original-From: Jerome Brunet <jbrunet@starbuckisacylon.baylibre.com>
References: <20190918082500.209281-1-cychiang@chromium.org>
 <20190918082500.209281-3-cychiang@chromium.org>
User-agent: mu4e 1.3.1; emacs 26.2
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v6 2/4] drm: dw-hdmi-i2s: Use fixed id for codec device
In-reply-to: <20190918082500.209281-3-cychiang@chromium.org>
Date: Wed, 18 Sep 2019 10:43:49 +0200
Message-ID: <1j7e663sfu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:references:user-agent:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Es/bmU3c9XGaRtzCiMLIVrPNjr9MNI0eTxg3xMnbUYc=;
 b=S2FCcJGdZtO1gO4SQHnOHraw90NxGk+ySbB9OIxE1vfxheAusATdTaw/syxuwdGWQI
 92sF2Nr9TgHxs7w9AuZJMkw35AR0EvurNbRLvbFBj0IhXv8+CtvAmZEn4/1JRD/sQl+7
 tNMt7J5QEAw5awSGxUcQ8/C/fS2112pJR0ilZf81yL8vBnGNaugVKY9xmUmAErDUp2Sh
 VlGTEU7rvD1DW5sD4FehEg9RXAfUKfdQ8YV5iBOpMAeohp1oWwhAsgleYcPMPeSmZEgO
 sl+eIrDHwIH3Ei22m0zaGRvVaJHEvtf5PLgIY9dlvf0pyHhxZ0Kxb/8q3jOurf9y3lOh
 +X0Q==
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
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIFdlZCAxOCBTZXAgMjAxOSBhdCAxMDoyNCwgQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0Bj
aHJvbWl1bS5vcmc+IHdyb3RlOgoKPiBUaGUgcHJvYmxlbSBvZiB1c2luZyBhdXRvIElEIGlzIHRo
YXQgdGhlIGRldmljZSBuYW1lIHdpbGwgYmUgbGlrZQo+IGhkbWktYXVkaW8tY29kZWMuPGlkIG51
bWJlcj4uYXV0by4KPgo+IFRoZSBudW1iZXIgbWlnaHQgYmUgY2hhbmdlZCB3aGVuIHRoZXJlIGFy
ZSBvdGhlciBwbGF0Zm9ybSBkZXZpY2VzIGJlaW5nCj4gY3JlYXRlZCBiZWZvcmUgaGRtaS1hdWRp
by1jb2RlYyBkZXZpY2UuCj4gVXNlIGEgZml4ZWQgbmFtZSBzbyBtYWNoaW5lIGRyaXZlciBjYW4g
c2V0IGNvZGVjIG5hbWUgb24gdGhlIERBSSBsaW5rLgo+Cj4gVXNpbmcgdGhlIGZpeGVkIG5hbWUg
c2hvdWxkIGJlIGZpbmUgYmVjYXVzZSB0aGVyZSB3aWxsIG9ubHkgYmUgb25lCj4gaGRtaS1hdWRp
by1jb2RlYyBkZXZpY2UuCgpXaGlsZSB0aGlzIGlzIHRydWUgYWxsIHBsYXRmb3JtcyB3ZSBrbm93
IG9mIChJIHN1cHBvc2UpLCBJdCBtaWdodCBub3QgYmUKdGhlIGNhc2UgbGF0ZXIgb24uIEkgd29u
ZGVyIGlmIG1ha2luZyBzdWNoIGFzc3VtcHRpb24gaXMgcmVhbGx5CmRlc2lyYWJsZSBpbiBhIGNv
ZGUgd2hpY2ggaXMgdXNlZCBieSBxdWl0ZSBhIGZldyBkaWZmZXJlbnQgcGxhdGZvcm1zLgoKSW5z
dGVhZCBvZiB0cnlpbmcgdG8gcHJlZGljdCB3aGF0IHRoZSBkZXZpY2UgbmFtZSB3aWxsIGJlLCBj
YW4ndCB5b3UganVzdApxdWVyeSBpdCBpbiB5b3VyIG1hY2hpbmUgZHJpdmVyID8gVXNpbmcgYSBk
ZXZpY2UgdHJlZSBwaGFuZGxlIG1heWJlID8KCkl0IGlzIHF1aXRlIHVzdWFsIHRvIHNldCB0aGUg
ZGFpIGxpbmtzIHRoaXMgd2F5LCAic2ltcGxlLWNhcmQiIGlzIGEgZ29vZApleGFtcGxlIG9mIHRo
aXMuCgo+Cj4gRml4IHRoZSBjb2RlYyBuYW1lIGluIHJvY2tjaGlwIHJrMzI4OF9oZG1pX2FuYWxv
ZyBtYWNoaW5lIGRyaXZlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3lj
aGlhbmdAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgfCAyICstCj4gIHNvdW5kL3NvYy9yb2NrY2hpcC9yazMy
ODhfaGRtaV9hbmFsb2cuYyAgICAgICAgICAgICB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+IGluZGV4IGQ3ZTY1Yzg2
OTQxNS4uODZiZDQ4MmI5Zjk0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYwo+IEBAIC0xOTMsNyArMTkzLDcgQEAgc3Rh
dGljIGludCBzbmRfZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICAKPiAgCW1lbXNldCgmcGRldmluZm8sIDAsIHNpemVvZihwZGV2aW5mbykpOwo+ICAJcGRldmlu
Zm8ucGFyZW50CQk9IHBkZXYtPmRldi5wYXJlbnQ7Cj4gLQlwZGV2aW5mby5pZAkJPSBQTEFURk9S
TV9ERVZJRF9BVVRPOwo+ICsJcGRldmluZm8uaWQJCT0gUExBVEZPUk1fREVWSURfTk9ORTsKPiAg
CXBkZXZpbmZvLm5hbWUJCT0gSERNSV9DT0RFQ19EUlZfTkFNRTsKPiAgCXBkZXZpbmZvLmRhdGEJ
CT0gJnBkYXRhOwo+ICAJcGRldmluZm8uc2l6ZV9kYXRhCT0gc2l6ZW9mKHBkYXRhKTsKPiBkaWZm
IC0tZ2l0IGEvc291bmQvc29jL3JvY2tjaGlwL3JrMzI4OF9oZG1pX2FuYWxvZy5jIGIvc291bmQv
c29jL3JvY2tjaGlwL3JrMzI4OF9oZG1pX2FuYWxvZy5jCj4gaW5kZXggNzY3NzAwYzM0ZWUyLi44
Mjg2MDI1YTg3NDcgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL3JvY2tjaGlwL3JrMzI4OF9oZG1p
X2FuYWxvZy5jCj4gKysrIGIvc291bmQvc29jL3JvY2tjaGlwL3JrMzI4OF9oZG1pX2FuYWxvZy5j
Cj4gQEAgLTE1LDYgKzE1LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L29mX2dwaW8uaD4KPiAgI2luY2x1ZGUgPHNvdW5kL2NvcmUuaD4KPiArI2luY2x1
ZGUgPHNvdW5kL2hkbWktY29kZWMuaD4KPiAgI2luY2x1ZGUgPHNvdW5kL2phY2suaD4KPiAgI2lu
Y2x1ZGUgPHNvdW5kL3BjbS5oPgo+ICAjaW5jbHVkZSA8c291bmQvcGNtX3BhcmFtcy5oPgo+IEBA
IC0xNDIsNyArMTQzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX29wcyBya19vcHMg
PSB7Cj4gIFNORF9TT0NfREFJTElOS19ERUZTKGF1ZGlvLAo+ICAJREFJTElOS19DT01QX0FSUkFZ
KENPTVBfRU1QVFkoKSksCj4gIAlEQUlMSU5LX0NPTVBfQVJSQVkoQ09NUF9DT0RFQyhOVUxMLCBO
VUxMKSwKPiAtCQkJICAgQ09NUF9DT0RFQygiaGRtaS1hdWRpby1jb2RlYy4yLmF1dG8iLCAiaTJz
LWhpZmkiKSksCj4gKwkJCSAgIENPTVBfQ09ERUMoSERNSV9DT0RFQ19EUlZfTkFNRSwgImkycy1o
aWZpIikpLAo+ICAJREFJTElOS19DT01QX0FSUkFZKENPTVBfRU1QVFkoKSkpOwo+ICAKPiAgc3Rh
dGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rIHJrX2RhaWxpbmsgPSB7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
