Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB1C9B6B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 12:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16136E0E7;
	Thu,  3 Oct 2019 10:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A736F6E0E7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 10:02:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n14so2237894wrw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 03:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xbihRq/Slo3PYnJ3Dz7r1d50po3jOI3cDT0TFE0FHsY=;
 b=hNl/KFaPJithv09jgCZG7rCbJ5L4S1ZrFG9sy2T3BRtv7tH4+ez5Fe+UV7TC4y1Y10
 qcm5njdnxYnaFIBd73i36O4xwGdb0+82rEa9kPhv8CXKpeOCYu+vPWjwSz/ZSyMPA0JO
 IgZK9vQRQ/ze5+3DFPkhEofk4LMCJF1U7lMKqD3cH7T+4DoKm+7uS7rzRAYvtK7IR+V/
 pguSmB3HBqXRKEXCOy7It8mmCstRtNMv1ol4CeDkaGkxMHnrc6ZbbJvvoUBAg4OKTtgM
 F0KNz6ZsGDmkWAka2AMDzlyMoQHBGpzb2Vla61DGdVznz/t05qfx3jzpZWyknNsZWIo2
 W11g==
X-Gm-Message-State: APjAAAUi4lZX/8S3WuCrLCfmEW+KnjhZXP+mxDBMCT2BsZR7NYbCK1t0
 ihkqUJukqHdCO89doP7eQoIQWQ==
X-Google-Smtp-Source: APXvYqzXFwNjg21UC+vD/IXHxOJFRXUta5uNXiTTkdPFWBNH8Vus6TTdVG1q7oc8ZNLY0TQzsVeKTw==
X-Received: by 2002:adf:e60d:: with SMTP id p13mr5980140wrm.298.1570096929136; 
 Thu, 03 Oct 2019 03:02:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v6sm1894952wrn.50.2019.10.03.03.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 03:02:08 -0700 (PDT)
Date: Thu, 3 Oct 2019 11:02:06 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2] backlight: pwm_bl: Don't assign levels table repeatedly
Message-ID: <20191003100206.ws35dbgifjwjicuv@holly.lan>
References: <20191002095541.v2.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002095541.v2.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xbihRq/Slo3PYnJ3Dz7r1d50po3jOI3cDT0TFE0FHsY=;
 b=P3u6I6k9FG6wGcenAZdZUkqFpKCkLJ5BrfZdAQNV1t/3dHsDMQyM8r2XrM+wD6sgYK
 faa6vzUIukLSr1lEXgXbE6ovU+sLWZMq/C9uGiEL7uvb3ULew1rOoYLgvUAnVfHfKPT0
 gT4fThu51hUT4jGN5Fe+CQEcOpAjpUZR2rlU0a7BJF0h1tw36yytfE5SRyas8yy+/GnG
 bxsQv8nqpVvV5l+aZP2TqENOWdnwyQ+cqyGq2zqOYW06tb/Mmr1CQdtbmiX4wBh+r9Ly
 7RIIXb6ZOyk4xtXIDKP0HzMq5J8FgsMFMVlDhVd2zWfFlrO2jea9qrD9uiPxUbk3lS0w
 KNPA==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDk6NTY6MDFBTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gcHdtX2JhY2tsaWdodF9wcm9iZSgpIHJlLWFzc2lnbnMgcGItPmxldmVscyBm
b3IgZXZlcnkgYnJpZ2h0bmVzcwo+IGxldmVsLiBUaGlzIGlzIG5vdCBuZWVkZWQgYW5kIHdhcyBs
aWtlbHkgbm90IGludGVuZGVkLCBzaW5jZQo+IG5laXRoZXIgc2lkZSBvZiB0aGUgYXNzaWdubWVu
dCBjaGFuZ2VzIGR1cmluZyB0aGUgbG9vcC4gQXNzaWduCj4gdGhlIGZpZWxkIG9ubHkgb25jZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4K
ClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3Jn
PgoKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gcmVtb3ZlZCBjdXJseSBicmFjZXMgZnJv
bSBmb3IgbG9vcAo+IAo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyB8IDcgKysr
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gaW5kZXggNzQ2ZWViYzQxMWRmLi4wNWQzYjM4
MDI2NTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+IEBAIC01NjQsMTggKzU2NCwx
NyBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgCW1lbXNldCgmcHJvcHMsIDAsIHNpemVvZihzdHJ1Y3QgYmFja2xpZ2h0X3By
b3BlcnRpZXMpKTsKPiAgCj4gIAlpZiAoZGF0YS0+bGV2ZWxzKSB7Cj4gKwkJcGItPmxldmVscyA9
IGRhdGEtPmxldmVsczsKPiArCj4gIAkJLyoKPiAgCQkgKiBGb3IgdGhlIERUIGNhc2UsIG9ubHkg
d2hlbiBicmlnaHRuZXNzIGxldmVscyBpcyBkZWZpbmVkCj4gIAkJICogZGF0YS0+bGV2ZWxzIGlz
IGZpbGxlZC4gRm9yIHRoZSBub24tRFQgY2FzZSwgZGF0YS0+bGV2ZWxzCj4gIAkJICogY2FuIGNv
bWUgZnJvbSBwbGF0Zm9ybSBkYXRhLCBob3dldmVyIGlzIG5vdCB1c3VhbC4KPiAgCQkgKi8KPiAt
CQlmb3IgKGkgPSAwOyBpIDw9IGRhdGEtPm1heF9icmlnaHRuZXNzOyBpKyspIHsKPiArCQlmb3Ig
KGkgPSAwOyBpIDw9IGRhdGEtPm1heF9icmlnaHRuZXNzOyBpKyspCj4gIAkJCWlmIChkYXRhLT5s
ZXZlbHNbaV0gPiBwYi0+c2NhbGUpCj4gIAkJCQlwYi0+c2NhbGUgPSBkYXRhLT5sZXZlbHNbaV07
Cj4gIAo+IC0JCQlwYi0+bGV2ZWxzID0gZGF0YS0+bGV2ZWxzOwo+IC0JCX0KPiAtCj4gIAkJaWYg
KHB3bV9iYWNrbGlnaHRfaXNfbGluZWFyKGRhdGEpKQo+ICAJCQlwcm9wcy5zY2FsZSA9IEJBQ0tM
SUdIVF9TQ0FMRV9MSU5FQVI7Cj4gIAkJZWxzZQo+IC0tIAo+IDIuMjMuMC40NDQuZzE4ZWViNWEy
NjUtZ29vZwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
