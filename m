Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E392F31E7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 14:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ED86E221;
	Tue, 12 Jan 2021 13:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224CD6E222
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:43:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a12so2531950wrv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7GPaHBbgnyk5B3N5fI+9q+MKf1p8x47yjYJoIegUJJE=;
 b=T0X7tbY2aa3ykx2c3EoOKFFN975w4TkCn4oK8TOIwtqXxVudL1OJaJ+cg2vjxG8mwN
 GofBdRyGaZ4y5Gd3vxwsigr5+FZA8wi3W5mOBbhaATFC/gVgf7+EscxFQ4Sj2ZLR88rR
 NVlJaHKlMmGMB13G23xEISd67laLcqzvwgyL8qP0zesmcqjSC5DTehToKlfqAID7zRQQ
 +5/04pzaCpIIqYkPqGsVm+e8T8UfX3e3pKkrXS1emn/Ri42Jt+8dhBkZ8xw6FoQKk5tR
 pjEjoTPD4Hp2ywks+xsjWhqYGZq2Q4NLbp0GFFp0iilLiIK/AQm9BDoKUvPtYq6rISAA
 JgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7GPaHBbgnyk5B3N5fI+9q+MKf1p8x47yjYJoIegUJJE=;
 b=jrSqlBegFO2gURxyrbmsE+EROkC/Yv9sj0F32w4EWMSFSAOduhDOshthxMqm9sujlC
 LoH8G7Tw8nTEyHRUNqRugTqBVpHdGNj7QjGNDU7MoPDp+Y94RuwDRZ/ew+/yoKuwLnG2
 AyJKGx4ZP0rkOAZ5EjEvoX7o4ihYcRtSAccUrdw6CyrI3vcIyfh6nJE5vqwT7QiCdVrc
 ejEZ9VIg8UCP7A0E8m66A7roWGt0yc7jDYd0cEAjGWgMSeoCIIU5s4UCtlKgX79bgzGP
 mw7wqNFXSOrxnkp10UdU6mKIYERJa6sPfOX+CEgLCph4RGOWFbwOCqFYcAuidO7O3bMA
 8zZA==
X-Gm-Message-State: AOAM530tTVIjkuqYAS4sljqxeeX6EfUDXRsAUu5FWAUtBWAUDM0SR067
 kL7ggpMGnBO5aTCq9GMBqJgZVA==
X-Google-Smtp-Source: ABdhPJw5kBWvWbhmvaWdRe/7kzStPjXQq/PxsdoyNcKzNP+Z+LDSIlF/LpVp1cQg7r47k3Cb+8STSA==
X-Received: by 2002:adf:e406:: with SMTP id g6mr4433015wrm.255.1610459009830; 
 Tue, 12 Jan 2021 05:43:29 -0800 (PST)
Received: from dell ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id p15sm5033694wrt.15.2021.01.12.05.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 05:43:28 -0800 (PST)
Date: Tue, 12 Jan 2021 13:43:27 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/40] drm/amd/display/dc/calcs/dce_calcs: Remove some
 large variables from the stack
Message-ID: <20210112134327.GC3575260@dell>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-15-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111191926.3688443-15-lee.jones@linaro.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMSBKYW4gMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzogSW4gZnVuY3Rpb24g4oCY
YndfY2FsY3NfaW5pdOKAmToKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9jYWxjcy9kY2VfY2FsY3MuYzoyNzI2OjE6IHdhcm5pbmc6IHRoZSBmcmFtZSBzaXplIG9m
IDEzMzYgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRlcyBbLVdmcmFtZS1sYXJnZXItdGhh
bj1dCj4gCj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENj
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWdu
ZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyAgfCAxMTE1ICsrKysrKysr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NjAgaW5zZXJ0aW9ucygrKSwgNTU1IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y2FsY3MvZGNlX2NhbGNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNlX2NhbGNzLmMKPiBpbmRleCBhMGM2OWZhZTQwY2VkLi5mNjljMmI4NGQ0MzJiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwo+
IEBAIC0yMDM1LDcwNyArMjAzNSw3MTIgQEAgdm9pZCBid19jYWxjc19pbml0KHN0cnVjdCBid19j
YWxjc19kY2VpcCAqYndfZGNlaXAsCj4gIAlzdHJ1Y3QgYndfY2FsY3NfdmJpb3MgKmJ3X3ZiaW9z
LAo+ICAJc3RydWN0IGh3X2FzaWNfaWQgYXNpY19pZCkKPiAgewo+IC0Jc3RydWN0IGJ3X2NhbGNz
X2RjZWlwIGRjZWlwID0geyAwIH07Cj4gLQlzdHJ1Y3QgYndfY2FsY3NfdmJpb3MgdmJpb3MgPSB7
IDAgfTsKPiArCXN0cnVjdCBid19jYWxjc19kY2VpcCAqZGNlaXA7Cj4gKwlzdHJ1Y3QgYndfY2Fs
Y3NfdmJpb3MgKnZiaW9zOwo+ICAKPiAgCWVudW0gYndfY2FsY3NfdmVyc2lvbiB2ZXJzaW9uID0g
YndfY2FsY3NfdmVyc2lvbl9mcm9tX2FzaWNfaWQoYXNpY19pZCk7Cj4gIAo+IC0JZGNlaXAudmVy
c2lvbiA9IHZlcnNpb247Cj4gKwlkY2VpcCA9IGt6YWxsb2Moc2l6ZW9mKGRjZWlwKSwgR0ZQX0tF
Uk5FTCk7Cj4gKwl2YmlvcyA9IGt6YWxsb2Moc2l6ZW9mKHZiaW9zKSwgR0ZQX0tFUk5FTCk7CgpQ
bGVhc2UgZG9uJ3QgcmV2aWV3L21lcmdlIHRoaXMgeWV0LiAgSSBtaXNzZWQgc29tZSBlcnJvciBj
aGVja2luZy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
