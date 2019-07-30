Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47E7A853
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 14:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971FD89FA6;
	Tue, 30 Jul 2019 12:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B33F89F41
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 12:25:29 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n9so65661464wru.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 05:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=G84T7i+hKahDIBaf3hntlyO7eSX4L7f7zIVJ/lz1sxw=;
 b=anZHwwkos0gMoGkI8Y1zkuIonLO/ZTYVKjsewaoxumGXONEvZUzyZL/pgG8rhFy+lY
 mqE/vC+0z4CsUFJIjN3qWqwWvEkUcLB7a/8pG83rxPTqVgWK4THxukdIHTyXe2O1xb6G
 u3x1uCIeVhkG8QBz44TJyLVxqhQdWWeDuxxS8TExCy2HoPQx0qFo2GZMVAH9IheP/Ty0
 B2dAX5BhrN/MWLxb3ONVq3NVRnQi+hhtQCmw7hnsaqZSn2vcKapNwBYt3U6KqP35GgTi
 acLCHpWdjQoJVymgKvRiNMvN3YwOFTzIHoRPe5KVf5BCtf7BNcKgifIwrSxI7iJzx7uW
 Jwig==
X-Gm-Message-State: APjAAAXWdUCHz/iajq42eQHAdKi0qc8ejvXuqSUE0U5G9rCG8G+b4/qe
 g/iPN+/leKm5CXc6ha+f+kSuvQ==
X-Google-Smtp-Source: APXvYqzQH2i2sRnZ9oa4L3vFVyQCb0sUs0/25bYu02rPWjE6mSsQd53UMlPhy/48KXftSmPN5A0HbA==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr43472233wrm.161.1564489527656; 
 Tue, 30 Jul 2019 05:25:27 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g131sm46677829wmf.37.2019.07.30.05.25.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:25:26 -0700 (PDT)
Subject: Re: [PATCH v4 20/23] drm/bridge: ti-tfp410: Provide ddc symlink in
 connector sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <c665d01c4eacc61417519c40c54d5060b0bbe105.1562843413.git.andrzej.p@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d3115692-26ed-a041-c37f-5748b1662c9b@baylibre.com>
Date: Tue, 30 Jul 2019 14:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c665d01c4eacc61417519c40c54d5060b0bbe105.1562843413.git.andrzej.p@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=G84T7i+hKahDIBaf3hntlyO7eSX4L7f7zIVJ/lz1sxw=;
 b=dKxIer4V50Cr2UvVxXbeDXAxXMOPa7NzM8KWHlSXaaYDx4+Bb0NgH2TpYapRkygrCD
 aPB4/tTyz5ispAJM2XoGNiGyGPr38cdbYF6Ra8gRVc9mwv9pliMVcq0ODIuKVizBFAs3
 y6mok4JeCxVDq4y9B6ss4dZVbZ+3Dez2NA6VGsViCmz2tmYONTnKuRG2mfVv0rNRnicH
 vMzlaICatjglXWuMt+IyFmL/ciX8Xpr2K5nkznhWlzFCNVjO0BlFDo2ugpOnrIOupwQK
 UpIWMANCJt+aoQ2u/hT5s/twwHwujyKKKRp+rXGVN4GZSzKr9KyT4H2lq85orInc8Bw0
 sBQA==
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
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
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
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCAxOSArKysr
KysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRm
cDQxMC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+IGluZGV4IGRiZjM1
YzdiYzg1ZS4uZTU1MzU4ZjBhNWJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGktdGZwNDEwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5j
Cj4gQEAgLTI2LDcgKzI2LDYgQEAgc3RydWN0IHRmcDQxMCB7Cj4gIAl1bnNpZ25lZCBpbnQJCWNv
bm5lY3Rvcl90eXBlOwo+ICAKPiAgCXUzMgkJCWJ1c19mb3JtYXQ7Cj4gLQlzdHJ1Y3QgaTJjX2Fk
YXB0ZXIJKmRkYzsKPiAgCXN0cnVjdCBncGlvX2Rlc2MJKmhwZDsKPiAgCWludAkJCWhwZF9pcnE7
Cj4gIAlzdHJ1Y3QgZGVsYXllZF93b3JrCWhwZF93b3JrOwo+IEBAIC01NSwxMCArNTQsMTAgQEAg
c3RhdGljIGludCB0ZnA0MTBfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCj4gIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKPiAgCWludCByZXQ7Cj4gIAo+IC0JaWYgKCFkdmkt
PmRkYykKPiArCWlmICghZHZpLT5jb25uZWN0b3IuZGRjKQo+ICAJCWdvdG8gZmFsbGJhY2s7Cj4g
IAo+IC0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGR2aS0+ZGRjKTsKPiArCWVkaWQg
PSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBkdmktPmNvbm5lY3Rvci5kZGMpOwo+ICAJaWYgKCFl
ZGlkKSB7Cj4gIAkJRFJNX0lORk8oIkVESUQgcmVhZCBmYWlsZWQuIEZhbGxiYWNrIHRvIHN0YW5k
YXJkIG1vZGVzXG4iKTsKPiAgCQlnb3RvIGZhbGxiYWNrOwo+IEBAIC05OCw4ICs5Nyw4IEBAIHRm
cDQxMF9jb25uZWN0b3JfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJv
b2wgZm9yY2UpCj4gIAkJCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZDsKPiAg
CX0KPiAgCj4gLQlpZiAoZHZpLT5kZGMpIHsKPiAtCQlpZiAoZHJtX3Byb2JlX2RkYyhkdmktPmRk
YykpCj4gKwlpZiAoZHZpLT5jb25uZWN0b3IuZGRjKSB7Cj4gKwkJaWYgKGRybV9wcm9iZV9kZGMo
ZHZpLT5jb25uZWN0b3IuZGRjKSkKPiAgCQkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVj
dGVkOwo+ICAJCWVsc2UKPiAgCQkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVk
Owo+IEBAIC0yOTcsOCArMjk2LDggQEAgc3RhdGljIGludCB0ZnA0MTBfZ2V0X2Nvbm5lY3Rvcl9w
cm9wZXJ0aWVzKHN0cnVjdCB0ZnA0MTAgKmR2aSkKPiAgCWlmICghZGRjX3BoYW5kbGUpCj4gIAkJ
Z290byBmYWlsOwo+ICAKPiAtCWR2aS0+ZGRjID0gb2ZfZ2V0X2kyY19hZGFwdGVyX2J5X25vZGUo
ZGRjX3BoYW5kbGUpOwo+IC0JaWYgKGR2aS0+ZGRjKQo+ICsJZHZpLT5jb25uZWN0b3IuZGRjID0g
b2ZfZ2V0X2kyY19hZGFwdGVyX2J5X25vZGUoZGRjX3BoYW5kbGUpOwo+ICsJaWYgKGR2aS0+Y29u
bmVjdG9yLmRkYykKPiAgCQlkZXZfaW5mbyhkdmktPmRldiwgIkNvbm5lY3RvcidzIGRkYyBpMmMg
YnVzIGZvdW5kXG4iKTsKPiAgCWVsc2UKPiAgCQlyZXQgPSAtRVBST0JFX0RFRkVSOwo+IEBAIC0z
NjcsNyArMzY2LDcgQEAgc3RhdGljIGludCB0ZnA0MTBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYs
IGJvb2wgaTJjKQo+ICAKPiAgCXJldHVybiAwOwo+ICBmYWlsOgo+IC0JaTJjX3B1dF9hZGFwdGVy
KGR2aS0+ZGRjKTsKPiArCWkyY19wdXRfYWRhcHRlcihkdmktPmNvbm5lY3Rvci5kZGMpOwo+ICAJ
aWYgKGR2aS0+aHBkKQo+ICAJCWdwaW9kX3B1dChkdmktPmhwZCk7Cj4gIAlyZXR1cm4gcmV0Owo+
IEBAIC0zODIsOCArMzgxLDggQEAgc3RhdGljIGludCB0ZnA0MTBfZmluaShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCj4gIAo+ICAJZHJtX2JyaWRnZV9yZW1vdmUoJmR2aS0+YnJpZGdlKTsKPiAgCj4gLQlp
ZiAoZHZpLT5kZGMpCj4gLQkJaTJjX3B1dF9hZGFwdGVyKGR2aS0+ZGRjKTsKPiArCWlmIChkdmkt
PmNvbm5lY3Rvci5kZGMpCj4gKwkJaTJjX3B1dF9hZGFwdGVyKGR2aS0+Y29ubmVjdG9yLmRkYyk7
Cj4gIAlpZiAoZHZpLT5ocGQpCj4gIAkJZ3Bpb2RfcHV0KGR2aS0+aHBkKTsKPiAgCj4gCgpSZXZp
ZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
