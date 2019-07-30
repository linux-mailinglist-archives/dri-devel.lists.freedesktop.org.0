Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D527A7EE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 14:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D8B89A4F;
	Tue, 30 Jul 2019 12:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC2489A4F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:15:49 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a15so56936015wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 05:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WFoAsUiwcBaDabBbwqf50TD03udrk0VlAYGmYOTn+20=;
 b=rvsitngNoPVh512IF2krR4ULVSyCM5gFxJUwsuqFfSWGJzetaBK5aEjlb3sp7zsu8t
 934k36qthRqy8z+AUVMI9qbcF+txd8Vfh18Hj6rapOSpd/I7rl+IwIbuLnGD1A01cZY1
 py9ztSpmSontbBy/xisBse2WfWnZu8uNBHxXk/UF9lYk+pUdtJI+483jna+vP8FaMvzp
 Qj73fBakE/5eeGZlTyzsqrFMM3OzxXMRngWses9wdN7FK1I+5UmfUDybNGR0XkYLWGT6
 FSBwY5nv2L5WRwAzqmty4j06BDid4Tp4bWXYUnB1U/mqD9sNOrMYlUeUlD+gWI+C5a2i
 7I/A==
X-Gm-Message-State: APjAAAX6LMvAkMexPCeddmJaGx3ktPf0S78Up6UQsP62T0R+HhIA7dHs
 lmcoHT3+ij4qKhb+hIZ96w2K6w==
X-Google-Smtp-Source: APXvYqwSk5L00pzA69Xz/r7CI0yemsl7jkYrrhXBdbro9PHKbSfTSaNM039yL41C+we0cSjd/OzIFw==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr101795195wmi.54.1564488947503; 
 Tue, 30 Jul 2019 05:15:47 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r11sm99739693wre.14.2019.07.30.05.15.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:15:46 -0700 (PDT)
Subject: Re: [PATCH v4 18/23] drm/bridge: dumb-vga-dac: Provide ddc symlink in
 connector sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <b039fbddc020d20457023bda631de8aacb5d061d.1562843413.git.andrzej.p@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <469ad4ae-34c9-753f-7b4a-9197d3d9f9f4@baylibre.com>
Date: Tue, 30 Jul 2019 14:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b039fbddc020d20457023bda631de8aacb5d061d.1562843413.git.andrzej.p@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=WFoAsUiwcBaDabBbwqf50TD03udrk0VlAYGmYOTn+20=;
 b=Y8LP7k9JifaZgPVGoLuV6LbJUibqfm5oHUoCNGoJDCScUSgqXlmUbY8+ow836aLtJG
 6ra4/XlTBKIU+wcL+Ry+mWemL4y6romKn6xjh/zFvroZT0fH3MO48+1xRfphNELFGJZZ
 +mbPzVioTrfdNw7wL20OUy3tMDfOCoHestRswhjSVRXcrMw6f3tvmC7FxSRiyobEk+96
 Sp78xSO/raV0swRkKo01YwF1a4qvaMvdNcFb2hdhzkylx+uncsJK1qtuDfnKcxxYeerm
 QnpP2LrOY2DUq+KBFO0xdGgq4LGdCmgi3oTRkzZo5WZY/aC0o/3S5Igp7R8//wTJ8lPo
 O9Ew==
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMDcvMjAxOSAxMzoyNiwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IFVzZSB0
aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgfCAxOSAr
KysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1
bWItdmdhLWRhYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwo+IGlu
ZGV4IGQzMjg4NWI5MDZhZS4uYjRjYzMyMzg0MDBhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2R1bWItdmdhLWRhYy5jCj4gQEAgLTIwLDcgKzIwLDYgQEAgc3RydWN0IGR1bWJfdmdhIHsKPiAg
CXN0cnVjdCBkcm1fYnJpZGdlCWJyaWRnZTsKPiAgCXN0cnVjdCBkcm1fY29ubmVjdG9yCWNvbm5l
Y3RvcjsKPiAgCj4gLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIJKmRkYzsKPiAgCXN0cnVjdCByZWd1bGF0
b3IJKnZkZDsKPiAgfTsKPiAgCj4gQEAgLTQyLDEwICs0MSwxMCBAQCBzdGF0aWMgaW50IGR1bWJf
dmdhX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAJc3RydWN0
IGVkaWQgKmVkaWQ7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCWlmIChJU19FUlIodmdhLT5kZGMpKQo+
ICsJaWYgKElTX0VSUih2Z2EtPmNvbm5lY3Rvci5kZGMpKQo+ICAJCWdvdG8gZmFsbGJhY2s7Cj4g
IAo+IC0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIHZnYS0+ZGRjKTsKPiArCWVkaWQg
PSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCB2Z2EtPmNvbm5lY3Rvci5kZGMpOwo+ICAJaWYgKCFl
ZGlkKSB7Cj4gIAkJRFJNX0lORk8oIkVESUQgcmVhZG91dCBmYWlsZWQsIGZhbGxpbmcgYmFjayB0
byBzdGFuZGFyZCBtb2Rlc1xuIik7Cj4gIAkJZ290byBmYWxsYmFjazsKPiBAQCAtODQsNyArODMs
NyBAQCBkdW1iX3ZnYV9jb25uZWN0b3JfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IsIGJvb2wgZm9yY2UpCj4gIAkgKiB3aXJlIHRoZSBEREMgcGlucywgb3IgdGhlIEkyQyBi
dXMgbWlnaHQgbm90IGJlIHdvcmtpbmcgYXQKPiAgCSAqIGFsbC4KPiAgCSAqLwo+IC0JaWYgKCFJ
U19FUlIodmdhLT5kZGMpICYmIGRybV9wcm9iZV9kZGModmdhLT5kZGMpKQo+ICsJaWYgKCFJU19F
UlIodmdhLT5jb25uZWN0b3IuZGRjKSAmJiBkcm1fcHJvYmVfZGRjKHZnYS0+Y29ubmVjdG9yLmRk
YykpCj4gIAkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOwo+ICAKPiAgCXJldHVy
biBjb25uZWN0b3Jfc3RhdHVzX3Vua25vd247Cj4gQEAgLTE5MCwxNCArMTg5LDE0IEBAIHN0YXRp
YyBpbnQgZHVtYl92Z2FfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlk
ZXZfZGJnKCZwZGV2LT5kZXYsICJObyB2ZGQgcmVndWxhdG9yIGZvdW5kOiAlZFxuIiwgcmV0KTsK
PiAgCX0KPiAgCj4gLQl2Z2EtPmRkYyA9IGR1bWJfdmdhX3JldHJpZXZlX2RkYygmcGRldi0+ZGV2
KTsKPiAtCWlmIChJU19FUlIodmdhLT5kZGMpKSB7Cj4gLQkJaWYgKFBUUl9FUlIodmdhLT5kZGMp
ID09IC1FTk9ERVYpIHsKPiArCXZnYS0+Y29ubmVjdG9yLmRkYyA9IGR1bWJfdmdhX3JldHJpZXZl
X2RkYygmcGRldi0+ZGV2KTsKPiArCWlmIChJU19FUlIodmdhLT5jb25uZWN0b3IuZGRjKSkgewo+
ICsJCWlmIChQVFJfRVJSKHZnYS0+Y29ubmVjdG9yLmRkYykgPT0gLUVOT0RFVikgewo+ICAJCQlk
ZXZfZGJnKCZwZGV2LT5kZXYsCj4gIAkJCQkiTm8gaTJjIGJ1cyBzcGVjaWZpZWQuIERpc2FibGlu
ZyBFRElEIHJlYWRvdXRcbiIpOwo+ICAJCX0gZWxzZSB7Cj4gIAkJCWRldl9lcnIoJnBkZXYtPmRl
diwgIkNvdWxkbid0IHJldHJpZXZlIGkyYyBidXNcbiIpOwo+IC0JCQlyZXR1cm4gUFRSX0VSUih2
Z2EtPmRkYyk7Cj4gKwkJCXJldHVybiBQVFJfRVJSKHZnYS0+Y29ubmVjdG9yLmRkYyk7Cj4gIAkJ
fQo+ICAJfQo+ICAKPiBAQCAtMjE2LDggKzIxNSw4IEBAIHN0YXRpYyBpbnQgZHVtYl92Z2FfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJZHJtX2JyaWRnZV9yZW1v
dmUoJnZnYS0+YnJpZGdlKTsKPiAgCj4gLQlpZiAoIUlTX0VSUih2Z2EtPmRkYykpCj4gLQkJaTJj
X3B1dF9hZGFwdGVyKHZnYS0+ZGRjKTsKPiArCWlmICghSVNfRVJSKHZnYS0+Y29ubmVjdG9yLmRk
YykpCj4gKwkJaTJjX3B1dF9hZGFwdGVyKHZnYS0+Y29ubmVjdG9yLmRkYyk7Cj4gIAo+ICAJcmV0
dXJuIDA7Cj4gIH0KPiAKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
