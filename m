Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C924A479
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 18:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A7589A91;
	Wed, 19 Aug 2020 16:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF25F89A91
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 16:57:06 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p14so2772861wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pYhO7PbSDe8dru1dk/4z1pXylH1/0mvxSDfzBAAOOrk=;
 b=CCVFYUUES1mcKzrLyt3Uqs9hjoeY+tJL5sKDMD90jBM3CZHjqak1l36nSYdbzmwHiM
 ShBiyCY0+gsgm2uPLeGH7G2dj9qmxT9SsE0Gr1R5exx5TeLVWfX6zkwSGuuAegx+feg9
 cd+kDQto4FDMM8i0SIpIsYNdmSqqDHNglX9B9xFrE/aL/GgzJ52q3fO+bVw7zQvPgWSb
 PvOzsN6j3X1nHaXqiW8Mx959AAaS7Hgg8/JFaY9LRnHCBDNWUHK0xgaeFzf6fqkFc0/e
 j6OuefwpxT6vbWxzlisTrBHsiDSOsGTXRXtsFzWaDolcVpQrLKf/xLen8IASn9H5CKDj
 y2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pYhO7PbSDe8dru1dk/4z1pXylH1/0mvxSDfzBAAOOrk=;
 b=Kter9gYk2N69qzOrpLLWMm5SxNykEbOkU1nVeqVejFNI4sPSeofN/d7kzWY0Aqxu2Z
 YGRMT2KAgdQzw9NfWU02tX3466P8cWY75zqrSLZLABh+Ovp/03PpOzOWR3g9QOeYj3jn
 2Qvh7WFsNN5UPmqBx+WdnNNvA4S6GPziCuL3ImsH+W8aOQzNbgq/OUgQRiO0c/KMjO4j
 YWCAB2ia2bsuPfX6X9LsE2oxYHgqSwgJk73/IuYSUpgYCMSxBP76Ndr1rv0h95qO4v7b
 p3KbygKZT6gm09G9F0h2iIWcPtPWu4+G77PKbUUMxu8cDso4YoS4mWA22hE0WHuCPcHP
 boaw==
X-Gm-Message-State: AOAM532fVXgjcgwczMqEouI45SlRl3PeJtAyR4Hw0smB0b4S92U/Imny
 1XZnIo6En0hArQx7vCdu1h6/tg==
X-Google-Smtp-Source: ABdhPJz8qA3JOjs+ieJsjG0S48f11108VeZdaRV17brCNc3yaDMVfbUHOgU27SWVv+InAy1PTRPfOw==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr5661262wma.158.1597856225352; 
 Wed, 19 Aug 2020 09:57:05 -0700 (PDT)
Received: from dell ([95.149.164.62])
 by smtp.gmail.com with ESMTPSA id c4sm41113675wrt.41.2020.08.19.09.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 09:57:04 -0700 (PDT)
Date: Wed, 19 Aug 2020 17:57:02 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference
 count imbalance on error
Message-ID: <20200819165702.GC3248864@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, Bryan Wu <cooloney@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
 Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBBdWcgMjAyMCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cgo+ID4gV2hlbiBvZl9w
cm9wZXJ0eV9yZWFkX3UzMl9hcnJheSgpIHJldHVybnMgYW4gZXJyb3IgY29kZSwKPiA+IGEgcGFp
cmluZyByZWZjb3VudCBkZWNyZW1lbnQgaXMgbmVlZGVkIHRvIGtlZXAgbnAncyByZWZjb3VudCBi
YWxhbmNlZC4KPiAKPiBDYW4gYW5vdGhlciBpbXBlcmF0aXZlIHdvcmRpbmcgYmUgaGVscGZ1bCBm
b3IgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9u
L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9pZD0xODQ0NWJmNDA1Y2IzMzExMTdiYzk4
NDI3YjFiYTZmMTI0MThhZDE3I24xNTEKPiAKPiBXb3VsZCBhbiBvdGhlciBjb21taXQgbWVzc2Fn
ZSBiZSBhIGJpdCBuaWNlcj8KPiAKPiAKPiDigKYKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3NreTgxNDUyLWJhY2tsaWdodC5jCj4gPiBAQCAtMjE3LDYgKzIxNyw3IEBAIHN0YXRp
YyBzdHJ1Y3Qgc2t5ODE0NTJfYmxfcGxhdGZvcm1fZGF0YSAqc2t5ODE0NTJfYmxfcGFyc2VfZHQo
Cj4gPiAgCQkJCQludW1fZW50cnkpOwo+ID4gIAkJaWYgKHJldCA8IDApIHsKPiA+ICAJCQlkZXZf
ZXJyKGRldiwgImxlZC1zb3VyY2VzIG5vZGUgaXMgaW52YWxpZC5cbiIpOwo+ID4gKwkJCW9mX25v
ZGVfcHV0KG5wKTsKPiA+ICAJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiA+ICAJCX0KPiAK
PiBJIHByb3Bvc2UgdG8gYWRkIHRoZSBqdW1wIHRhcmdldCDigJxwdXRfbm9kZeKAnSBzbyB0aGF0
IGEgYml0IG9mIGNvbW1vbiBleGNlcHRpb24KPiBoYW5kbGluZyBjb2RlIGNhbiBiZSBiZXR0ZXIg
cmV1c2VkIGF0IHRoZSBlbmQgb2YgdGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRhdGlvbi4KPiAKPiBS
ZWdhcmRzLAo+IE1hcmt1cwoKWW91IGNhbiBzYWZlbHkgaWdub3JlIGFueSByZXZpZXcgY29tbWVu
dHMgZnJvbSBNYXJrdXMhCgpIb3dldmVyLCB0aGlzIHBhdGNoIGRvZXNuJ3QgYXBwZWFyIHRvIGJl
IGluIG15IGluYm94LgoKQW55IGlkZWFzIGFzIHRvIHdoeT8KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5v
cmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBG
YWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
