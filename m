Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4F34F390
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 23:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90186E0C6;
	Tue, 30 Mar 2021 21:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79C96E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 21:31:57 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id s2so13004877qtx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=moOHpFp6B1slvDCQ1XJe9I8qoROHz5Fk0JNnYcoNKV4=;
 b=dsCS6SvyblcG7oQ7ueXLS7xHUVbAxqeIo+mKnPu17yA69BEhq40Vqye7OZla+7EiwM
 40/SsDnv0dnE91uCuK9quwkHO04o73NQJ4tZCHawa7syJxJrUIdWKfNc513iTL4TAm+k
 UEXJL+LM1gAuYeQ+RFrgZrmXO7khismTXEDpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=moOHpFp6B1slvDCQ1XJe9I8qoROHz5Fk0JNnYcoNKV4=;
 b=ICc0DBdhbnvAEpkZ0RHzMixYOzODoZAPhHut9+vTRFSWtyjsao3kI1E5iF3+7DkdsQ
 LAqgjC3FFptueMKHP0HjKDWC//ctf/RGHoPvbIUh0+GJtFU40EnP9pb+aNkuGO0kOtJu
 iMX7oTApuQNc2mtg+fTI7cOjSOfq4L1dFmBk9B+pUDlSrBSK2l/WxKLUY8LAcjA2PaGn
 zfYB0c+K8O0PWeKd/UFcKYQl5MLDVaPeVPo7wqs6Kz+28EcwtZWZH0E6j7fCpJ+7xrNH
 QHd992uhVXTVhJoqLSK7hYXMqzcdjobYQ9xatdZKZ6BC5fIDed+Ge0t1+XaNZ8YZT/Z7
 RaoQ==
X-Gm-Message-State: AOAM530x34QU3qNC+vUrSIyHNw6YhEHU6a/WyM09AxMtiT1H8WTLcNo2
 445FjBNUFwhqo0SJ1ru27fuiyKnrjt4HXg==
X-Google-Smtp-Source: ABdhPJw9IbsLz3ULC59ubXZpxSRBw99sBr1n3xSWt29S8yK4uIUglGZctuhoVyC2CajpJ5PzviTyaQ==
X-Received: by 2002:ac8:7747:: with SMTP id g7mr29179786qtu.144.1617139916002; 
 Tue, 30 Mar 2021 14:31:56 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id k138sm16332960qke.60.2021.03.30.14.31.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 14:31:54 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id x189so18913589ybg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:31:53 -0700 (PDT)
X-Received: by 2002:a25:3741:: with SMTP id e62mr265234yba.343.1617139913337; 
 Tue, 30 Mar 2021 14:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210330025345.3980086-1-dianders@chromium.org>
 <20210329195255.v2.9.Ia7e9bb7cf6c51d960b9455fb0fa447cc68ece99d@changeid>
 <YGMvO3PNDCiBmqov@intel.com>
In-Reply-To: <YGMvO3PNDCiBmqov@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Mar 2021 14:31:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UgnPMkJ6moLDvg8FPTKWUcTrp1mYED2i-K1vjJFu4cEA@mail.gmail.com>
Message-ID: <CAD=FV=UgnPMkJ6moLDvg8FPTKWUcTrp1mYED2i-K1vjJFu4cEA@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/edid: Use the cached EDID in drm_get_edid()
 if eDP
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIE1hciAzMCwgMjAyMSBhdCA3OjAxIEFNIFZpbGxlIFN5cmrDpGzDpAo8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gPiBAQCAtMjA0OSwxNSArMjA0
OSwzOSBAQCBzdHJ1Y3QgZWRpZCAqZHJtX2dldF9lZGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmFkYXB0ZXIpCj4gPiAgewo+ID4gICAgICAgc3RydWN0IGVkaWQgKmVkaWQ7Cj4gPiArICAgICBz
aXplX3Qgb2xkX2VkaWRfc2l6ZTsKPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBlZGlkICpvbGRfZWRp
ZDsKPiA+Cj4gPiAgICAgICBpZiAoY29ubmVjdG9yLT5mb3JjZSA9PSBEUk1fRk9SQ0VfT0ZGKQo+
ID4gICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+Cj4gPiAtICAgICBpZiAoY29ubmVjdG9y
LT5mb3JjZSA9PSBEUk1fRk9SQ0VfVU5TUEVDSUZJRUQgJiYgIWRybV9wcm9iZV9kZGMoYWRhcHRl
cikpCj4gPiAtICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgaWYgKGNvbm5lY3Rv
ci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCAmJgo+ID4gKyAgICAg
ICAgIGNvbm5lY3Rvci0+ZWRpZF9ibG9iX3B0cikgewo+ID4gKyAgICAgICAgICAgICAvKgo+ID4g
KyAgICAgICAgICAgICAgKiBlRFAgZGV2aWNlcyBhcmUgbm9uLXJlbW92YWJsZSwgb3IgYXQgbGVh
c3Qgbm90IHNvbWV0aGluZwo+ID4gKyAgICAgICAgICAgICAgKiB0aGF0J3MgZXhwZWN0ZWQgdG8g
YmUgaG90LXBsdWdnYWJsZS4gV2UgY2FuIGZyZWVseSB1c2UKPiA+ICsgICAgICAgICAgICAgICog
dGhlIGNhY2hlZCBFRElELgo+ID4gKyAgICAgICAgICAgICAgKgo+ID4gKyAgICAgICAgICAgICAg
KiBOT1RFOiB0ZWNobmljYWxseSB3ZSBjb3VsZCBwcm9iYWJseSBldmVuIHVzZSB0aGUgY2FjaGVk
Cj4gPiArICAgICAgICAgICAgICAqIEVESUQgZXZlbiBmb3Igbm9uLWVEUCBiZWNhdXNlIHRoZSBj
YWNoZWQgRURJRCBzaG91bGQgYmUKPiA+ICsgICAgICAgICAgICAgICogY2xlYXJlZCBpZiB3ZSBl
dmVyIG5vdGljZSBhIGRpc3BsYXkgaXMgbm90IGNvbm5lY3RlZCwgYnV0Cj4gPiArICAgICAgICAg
ICAgICAqIHdlJ2xsIHVzZSBhbiBhYnVuZGFuY2Ugb2YgY2F1dGlvbiBhbmQgb25seSBkbyBpdCBm
b3IgZURQLgo+ID4gKyAgICAgICAgICAgICAgKiBJdCdzIG1vcmUgaW1wb3J0YW50IGZvciBlRFAg
YW55d2F5IGJlY2F1c2UgdGhlIEVESUQgbWF5IG5vdAo+ID4gKyAgICAgICAgICAgICAgKiBhbHdh
eXMgYmUgcmVhZGFibGUsIGxpa2Ugd2hlbiB0aGUgcGFuZWwgaXMgcG93ZXJlZCBkb3duLgo+ID4g
KyAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgb2xkX2VkaWQgPSAoY29uc3Qgc3Ry
dWN0IGVkaWQgKiljb25uZWN0b3ItPmVkaWRfYmxvYl9wdHItPmRhdGE7Cj4gPiArICAgICAgICAg
ICAgIG9sZF9lZGlkX3NpemUgPSBrc2l6ZShvbGRfZWRpZCk7Cj4gPiArICAgICAgICAgICAgIGVk
aWQgPSBrbWFsbG9jKG9sZF9lZGlkX3NpemUsIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgICAgICAg
ICBpZiAoZWRpZCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBtZW1jcHkoZWRpZCwgb2xkX2Vk
aWQsIG9sZF9lZGlkX3NpemUpOwo+ID4gKyAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAg
aWYgKGNvbm5lY3Rvci0+Zm9yY2UgPT0gRFJNX0ZPUkNFX1VOU1BFQ0lGSUVEICYmICFkcm1fcHJv
YmVfZGRjKGFkYXB0ZXIpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+
ID4gKwo+ID4gKyAgICAgICAgICAgICBlZGlkID0gZHJtX2RvX2dldF9lZGlkKGNvbm5lY3Rvciwg
ZHJtX2RvX3Byb2JlX2RkY19lZGlkLCBhZGFwdGVyKTsKPiA+ICsgICAgICAgICAgICAgZHJtX2Nv
bm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eShjb25uZWN0b3IsIGVkaWQpOwo+ID4gKyAgICAg
fQo+Cj4gVGhpcyBpcyBhIHByZXR0eSBsb3cgbGV2ZWwgZnVuY3Rpb24uIFRvbyBsb3cgbGV2ZWwg
Zm9yIHRoaXMgY2FjaGluZwo+IElNTy4gU28gSSB0aGluayBiZXR0ZXIganVzdCBkbyBpdCBhIGJp
dCBoaWdoZXIgdXAgbGlrZSBvdGhlciBkcml2ZXJzLgoKRmFpciBlbm91Z2guIEluIHRoZSBwYXN0
IEknZCBnb3R0ZW4gZmVlZGJhY2sgdGhhdCBJJ2QgYmVlbiBqYW1taW5nIHRvbwptdWNoIHN0dWZm
IGluIG15IG93biBkcml2ZXIgaW5zdGVhZCBvZiBwdXR0aW5nIGl0IGluIHRoZSBjb3JlLCBidXQg
SSdtCmhhcHB5IHRvIGxlYXZlIHRoZSBFRElEIGNhY2hpbmcgaW4gdGhlIGRyaXZlciBpZiB0aGF0
J3Mgd2hhdCBwZW9wbGUKcHJlZmVyLiBJdCBhY3R1YWxseSBtYWtlcyBhIGJpdCBvZiB0aGUgY29k
ZSBpbiB0aGUgZHJpdmVyIGEgYml0IGxlc3MKYXdrd2FyZC4uLgoKLURvdWcKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
