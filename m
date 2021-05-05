Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1784373DA8
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 16:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD8E6E4F4;
	Wed,  5 May 2021 14:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A4D6E4D4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 14:28:20 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id lp4so895306pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HkhgClM1UbbpkX/kyBOWEOSsONynpU+16Pjzhic0mWo=;
 b=W4bBfp+mvMkITOt1lWRHvj+YNrG0HqXBeHQrXIgTq/PSF9EJ5YlkW2hnqYZFCq8eHt
 ZmfFV3hmi2F1S/1wZ8gVvOVgvVN+BwA7Zhu6h2Ti+loWbllUK/Ky57dLE+Hil1oo3BlO
 fawPKw+g/t3a1a1EWNJEUl7cpe8kwp4yPtbAkCjGrXxfFGBPajKllJxDrhR20HsdNb3T
 REG3+LK0jh/RHc/ulNcETJ4HIY7oHBdOEDT/mtX+AvDJd5DCwAA64+mzAHHVbrFg9RHo
 nZRLWOzmNf96cVKkRa6DQCy9OPZFbPl9vrkq1dfE7a0H+gnEqbqbgsXuOpGtQavgj7s9
 mpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HkhgClM1UbbpkX/kyBOWEOSsONynpU+16Pjzhic0mWo=;
 b=SiJ0xlbauvGWZS1xe95j0Rsbq+DaV4aryXlM/5OUpC3p0fgJ/2QmRAOgYZ2+W1zVeK
 SZu0rIYgSYQeQXkWjQa1JQ3Wzr17LCqb6h7xQiHs7autyf8EtoUzn+VsBah11nPZe26H
 SnoDiolNidQJl1HuGE+28qSXzMC7spjsEpe8rVe29QRzq9lFD2mtXDFBRLlrx+a+Gh1d
 SkcePeO8XjH5YyDox3JJNmmZC1KjkBvMDp822NVk7b6FlX8LvfOxNH8dDTq2aOUKDi5a
 LjRYiPdk0KvIvo2IKU00JvM1gtcMlaO1IGBvtWEEcu0dLv7qvkVRAtNyaj+DezWc3DP9
 0ZiA==
X-Gm-Message-State: AOAM5308bndjDnV+G9QV5I18JMcpnhbs47ZscPBLeKCL/1NGF5ba3+jb
 wsb8JReIRcXm0RPk3DGm7zN4wLfYb3wtbcC7OUHPFA==
X-Google-Smtp-Source: ABdhPJzD0BPZ4Kttar89LthjOLYQn3AIAVr6aTribgASi7P42SF9sSIdN9GwAlX+BBW9j5G5abaKUwvUp99ZK8VWsfI=
X-Received: by 2002:a17:90a:7e8f:: with SMTP id
 j15mr4476555pjl.19.1620224899954; 
 Wed, 05 May 2021 07:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210504220207.4004511-1-adrien.grassein@gmail.com>
In-Reply-To: <20210504220207.4004511-1-adrien.grassein@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 5 May 2021 16:28:08 +0200
Message-ID: <CAG3jFyu-aWLoiJ01h1DebVz66qtmt_T8adROKNBGBOzqbJvZvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix LONTIUM_LT8912B dependencies
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, msuchanek@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRyaWVuLAoKVGhhbmtzIGZvciB0aGUgcXVpY2sgZml4LgoKT24gV2VkLCA1IE1heSAyMDIx
IGF0IDAwOjAyLCBBZHJpZW4gR3Jhc3NlaW4gPGFkcmllbi5ncmFzc2VpbkBnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gTE9OVElVTV9MVDg5MTJCIHVzZXMgImRybV9kaXNwbGF5X21vZGVfdG9fdmlkZW9t
b2RlIiBmcm9tCj4gRFJNIGZyYW1ld29yayB0aGF0IG5lZWRzIFZJREVPTU9ERV9IRUxQRVJTIHRv
IGJlIGVuYWJsZWQuCj4KPiBGaXhlczogMzBlMmFlOTQzYzI2ICgiZHJtL2JyaWRnZTogSW50cm9k
dWNlIExUODkxMkIgRFNJIHRvIEhETUkgYnJpZGdlIikKPiBSZXBvcnRlZC1ieTogTWljaGFsIFN1
Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+Cj4gU2lnbmVkLW9mZi1ieTogQWRyaWVuIEdyYXNz
ZWluIDxhZHJpZW4uZ3Jhc3NlaW5AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gaW5kZXggNDAwMTkzZTM4ZDI5Li43MGJjY2VhYWU5YmYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gQEAgLTY4LDYgKzY4LDcgQEAgY29uZmlnIERS
TV9MT05USVVNX0xUODkxMkIKPiAgICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ICAgICAg
ICAgc2VsZWN0IERSTV9NSVBJX0RTSQo+ICAgICAgICAgc2VsZWN0IFJFR01BUF9JMkMKPiArICAg
ICAgIHNlbGVjdCBWSURFT01PREVfSEVMUEVSUwo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBE
cml2ZXIgZm9yIExvbnRpdW0gTFQ4OTEyQiBEU0kgdG8gSERNSSBicmlkZ2UKPiAgICAgICAgICAg
Y2hpcCBkcml2ZXIuCj4KClJldmlld2VkLWJ5OiBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAbGlu
YXJvLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
