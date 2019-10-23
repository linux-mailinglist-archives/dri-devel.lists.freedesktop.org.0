Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA98E1BD4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90F26E101;
	Wed, 23 Oct 2019 13:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EDC6E101
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:10:54 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id f20so15705471edv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lzwXfyhUE7yc9zrzbjqMe71sKuHvjq9U3aqm0Bd1AoI=;
 b=Xo6X6dmQ8CTbHaw0CSOw1UatcZO6AzO6DK+Kx61VeFp+uxFAjjnq24Zb7Cz0YE/XcZ
 Ku2e7txBB4YGzU8X36Tzif0A3Gydp4vZ+QltdCrSYtpPBpJF4WvreGIveErsLebr6THC
 tFLGlVDKPvB4eQDJNdLcDBbh296GZzly9say9b5RHGQ3P5zVG2N6Y3QgXX6iPPaeLJYa
 d3gvpNioWB9wvvZstZXUUudKemYamxk1cRFCjyrkHf0G5MsYvtP0X4yiuw+o8Pq0zhWd
 jdksaJEUT6KwIKaEinqydfhXiiGvPq3d4bYccD1cY0a2W0JuZ+5QJaMjnaU0xG2sQ42L
 cxNw==
X-Gm-Message-State: APjAAAUrbexQDgucMGyhmzXjh6Bknt/NGjNhTIDMbNTm9fU25RIw1/Ag
 3yIP72C12Eo4s7m8IOD0UQ8=
X-Google-Smtp-Source: APXvYqyft44OcCGb0xN0+fC1gmfK8usNRgvA/I5KY4vuTv2zLifQ5kptU9qNo1AQahi2rM4m7Aa/dg==
X-Received: by 2002:aa7:c595:: with SMTP id g21mr36717915edq.79.1571836252860; 
 Wed, 23 Oct 2019 06:10:52 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id b12sm785479edq.75.2019.10.23.06.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 06:10:52 -0700 (PDT)
Date: Wed, 23 Oct 2019 15:10:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/36] ARM: samsung platform cleanup
Message-ID: <20191023131049.GG11048@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010202802.1132272-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Lihua Yao <ylhuajnu@outlook.com>, Kukjin Kim <kgene@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
 linux-pwm@vger.kernel.org, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-pm@vger.kernel.org, Lihua Yao <ylhuajnu@163.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTA6Mjg6MDJQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBJJ3ZlIHNwZW50IHNvbWUgdGltZSBsb29raW5nIGF0IHRoZSByZW1haW5pbmcgQVJN
djQvQVJNdjUgcGxhdGZvcm1zCj4gdGhhdCBhcmUgbm90IHBhcnQgb2YgQVJDSF9NVUxUSVBMQVRG
T1JNLCBhbmQgdHJpZWQgdG8gZ2V0IHRoZW0gY2xvc2VyCj4gdG8gdGhhdC4gSGVyZSBpcyB3aGF0
IGNhbWUgb3V0IG9mIHRoYXQgZm9yIHRoZSBzYW1zdW5nIHBsYXRmb3JtczoKPiAKPiAqIEV4eW5v
cyBhbmQgczVwdjIxMCBhcmUgbWFkZSBpbmRlcGVuZGVudCBvZiBwbGF0LXNhbXN1bmcKPiAqIGRl
dmljZSBkcml2ZXJzIHN0b3AgdXNpbmcgbWFjaC8qLmggaGVhZGVycyBmb3IgczNjMjR4eAo+ICAg
KGFuZCBvdGhlciBwbGF0Zm9ybXMgbm90IGluIHRoaXMgc2VyaWVzKQo+ICogczNjMjR4eCBhbmQg
czNjNjR4eCBnZXQgbWVyZ2VkIGludG8gbWFjaC1zM2MsIHJlbW92aW5nCj4gICB0aGUgbmVlZCBm
b3IgcGxhdC1zYW1zdW5nIChJIGhhdmUgb3RoZXIgcGF0Y2hlcyBmb3IgdGhlCj4gICByZW1haW5p
bmcgcGxhdC0qIGRpcmVjdG9yaWVzKQo+ICogbWFjaC9pby5oIGdldHMgY2xlYW5lZCB1cCB0byBv
bmx5IGJlIG5lZWRlZCBmb3IgQkFTVAo+ICAgUEMxMDQgbW9kZSAobG9va2luZyBmb3IgaWRlYXMg
dG8gcHJvY2VlZCkKPiAqIG1hY2gvaXJxcy5oIHJlbWFpbnMgZm9yIG5vdywgdGhpcyBzdGlsbCBu
ZWVkcyB0byBiZSBjb252ZXJ0ZWQKPiAgIHRvIHNwYXJzZSBJUlFzLgo+IAo+IFNvbWUgYml0cyBh
cmUgYSBsaXR0bGUgdWdseSwgYnV0IG92ZXJhbGwgSSB0aGluayB0aGlzIGEgYmlnCj4gaW1wcm92
ZW1lbnQuCj4gCj4gVGhlIGNvbnRlbnRzIGFyZSBhdmFpbGFibGUgZm9yIHRlc3RpbmcgaW4KPiAK
PiBnaXQ6Ly9rZXJuZWwub3JnOi9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXJuZC9wbGF5Z3Jv
dW5kLmdpdCBzM2MtbXVsdGlwbGF0Zm9ybQoKV2hlbiBzZW5kaW5nIHYyLCBjYW4geW91IENjOgoK
UGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29tPgpMaWh1YSBZYW8g
PHlsaHVham51QG91dGxvb2suY29tPgoob3IgTGlodWEgWWFvIDx5bGh1YWpudUAxNjMuY29tPiBp
ZiBvdXRsb29rLmNvbSBib3VuY2VzKQpTZXJnaW8gUHJhZG8gPHNlcmdpby5wcmFkb0BlLWxhYndv
cmtzLmNvbT4KU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgoKVGhl
c2UgYXJlIGZvbGtzIHdoaWNoIHRvIG15IGtub3dsZWRnZSBoYWQgd29ya2luZyBTM0MgYW5kIFM1
UCBib2FyZHMKc28gbWF5YmUgdGhleSBjb3VsZCBwcm92aWRlIHRlc3RpbmcuCgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
