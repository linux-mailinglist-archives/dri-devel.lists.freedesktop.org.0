Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94835A29A9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 00:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1316E221;
	Thu, 29 Aug 2019 22:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19406E221
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 22:21:56 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id d25so7622372iob.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 15:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eiH72N61VDWmVxItzkF6zksnlwjwA2NHJACDtY2Xycg=;
 b=FwdwUJGrfbx9lhwb8WI87X1kdDyV6mzG+/fATCp0Yzxk7QZdff2V+70KIVrcXE8Cwp
 tqGayl9SC66V217MDc5eKmWaJG7vtvNXp0NkTavRFoGez8yiffRRtDdRAJxX8GW2ux6u
 69ZYEqv7Ly/AeMjmawPUTQxneH/igonqd8RIXYXtGita+Tpe2DJ0h+r6nPOmDUCuxSLo
 rVy1zVgt9MH9SBu0dnKr5chc1Nd6gnT6knYCilIzeeeIQmIDu0cyevosSaS1SD/U+8B6
 EmZRLSaQBGGianJLPI6jEAoRaqGjVukdQi7Jbtijx2pag2/qj7e/I2r6neXTgFcQrpNi
 1uHQ==
X-Gm-Message-State: APjAAAXZH8UO1cnj2TlyMlf74kKu4WCNgj/Eg+JanpX8v0eBNqfZl/sx
 OnTii2Z4mEr/nxFhX37iW7/0Q7nFfGI=
X-Google-Smtp-Source: APXvYqywwNycUgYYSSHndT7CakgFbeOQPftnua6peqy7bpa3+AzXgt7wDPbd4oaDPtYENy+BXKk8EA==
X-Received: by 2002:a5d:9d49:: with SMTP id k9mr2310812iok.106.1567117315936; 
 Thu, 29 Aug 2019 15:21:55 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id q74sm6307065iod.72.2019.08.29.15.21.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 15:21:55 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id d25so7622328iob.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 15:21:55 -0700 (PDT)
X-Received: by 2002:a6b:d006:: with SMTP id x6mr13702031ioa.218.1567117008526; 
 Thu, 29 Aug 2019 15:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190829042957.150929-1-cychiang@chromium.org>
In-Reply-To: <20190829042957.150929-1-cychiang@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Aug 2019 15:16:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xb_SkUTkVRpOX7B+B0AdT3cOB+JamNyXzq_UQK3mvz1A@mail.gmail.com>
Message-ID: <CAD=FV=Xb_SkUTkVRpOX7B+B0AdT3cOB+JamNyXzq_UQK3mvz1A@mail.gmail.com>
Subject: Re: [PATCH] drm: dw-hdmi-i2s: enable audio clock in audio_startup
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eiH72N61VDWmVxItzkF6zksnlwjwA2NHJACDtY2Xycg=;
 b=Way9cSCIYfArenznA8oYHlnHTJabAbfOvU8IBuvW3W6wFHlllPVoSIv2T/WNlJ0q6e
 SoUznNz9PMqM6gzVg33TP/25HbF7F99Rzcq7p8kxHA9bjWkVaWA3Kmw0x8gROWIYNNGo
 szQWao+/UlAj8ndbqomemYcpAzbSPosUn43N0=
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 tzungbi@chromium.org, =?UTF-8?B?6YOR5YW0?= <zhengxing@rock-chips.com>,
 kuninori.morimoto.gx@renesas.com, David Airlie <airlied@linux.ie>,
 =?UTF-8?B?6ZmI5riQ6aOe?= <jeffy.chen@rock-chips.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?6JSh6Im65Lyf?= <cain.cai@rock-chips.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Eddie Cai <eddie.cai@rock-chips.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Dylan Reid <dgreid@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCA5OjMwIFBNIENoZW5nLVlpIENoaWFuZyA8Y3lj
aGlhbmdAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEluIHRoZSBkZXNpZ253YXJlIGRhdGFib29r
LCB0aGUgc2VxdWVuY2Ugb2YgZW5hYmxpbmcgYXVkaW8gY2xvY2sgYW5kCj4gc2V0dGluZyBmb3Jt
YXQgaXMgbm90IGNsZWFybHkgc3BlY2lmaWVkLgo+IEN1cnJlbnRseSwgYXVkaW8gY2xvY2sgaXMg
ZW5hYmxlZCBpbiB0aGUgZW5kIG9mIGh3X3BhcmFtIG9wcyBhZnRlcgo+IHNldHRpbmcgZm9ybWF0
Lgo+Cj4gT24gc29tZSBtb25pdG9ycywgdGhlcmUgaXMgYSBwb3NzaWJpbGl0eSB0aGF0IGF1ZGlv
IGRvZXMgbm90IGNvbWUgb3V0Lgo+IEZpeCB0aGlzIGJ5IGVuYWJsaW5nIGF1ZGlvIGNsb2NrIGlu
IGF1ZGlvX3N0YXJ0dXAgb3BzCj4gYmVmb3JlIGh3X3BhcmFtIG9wcyBzZXR0aW5nIGZvcm1hdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1
ZGlvLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWky
cy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1h
dWRpby5jCj4gaW5kZXggNWNiYjcxYTg2NmQ1Li4wOGI0YWRiYjFkZGMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCj4g
QEAgLTY5LDYgKzY5LDE0IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMnNfaHdfcGFyYW1zKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgICAgICAgIGhkbWlfd3JpdGUoYXVkaW8sIGNv
bmYwLCBIRE1JX0FVRF9DT05GMCk7Cj4gICAgICAgICBoZG1pX3dyaXRlKGF1ZGlvLCBjb25mMSwg
SERNSV9BVURfQ09ORjEpOwo+Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGlj
IGludCBkd19oZG1pX2kyc19hdWRpb19zdGFydHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSkKPiArewo+ICsgICAgICAgc3RydWN0IGR3X2hkbWlfaTJzX2F1ZGlvX2RhdGEgKmF1ZGlv
ID0gZGF0YTsKPiArICAgICAgIHN0cnVjdCBkd19oZG1pICpoZG1pID0gYXVkaW8tPmhkbWk7Cj4g
Kwo+ICAgICAgICAgZHdfaGRtaV9hdWRpb19lbmFibGUoaGRtaSk7Cj4KPiAgICAgICAgIHJldHVy
biAwOwo+IEBAIC0xMDUsNiArMTEzLDcgQEAgc3RhdGljIGludCBkd19oZG1pX2kyc19nZXRfZGFp
X2lkKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50LAo+ICB9Cj4KPiAgc3RhdGlj
IHN0cnVjdCBoZG1pX2NvZGVjX29wcyBkd19oZG1pX2kyc19vcHMgPSB7Cj4gKyAgICAgICAuYXVk
aW9fc3RhcnR1cCA9IGR3X2hkbWlfaTJzX2F1ZGlvX3N0YXJ0dXAsCj4gICAgICAgICAuaHdfcGFy
YW1zICAgICAgPSBkd19oZG1pX2kyc19od19wYXJhbXMsCj4gICAgICAgICAuYXVkaW9fc2h1dGRv
d24gPSBkd19oZG1pX2kyc19hdWRpb19zaHV0ZG93biwKPiAgICAgICAgIC5nZXRfZGFpX2lkICAg
ICA9IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQsCj4gLS0KCkkgYW0gbm8gZXhwZXJ0IG9uIGF1ZGlv
IHN0dWZmLCBidXQgdGhpcyBzZWVtcyBzYW5lIHRvIG1lLiAgSWYgeW91CmhhcHBlbmVkIHRvIHNw
aW4gaXQgZm9yIGFub3RoZXIgcmVhc29uLCBpdCBtaWdodCBzZWVtIHNsaWdodGx5IG5pY2VyCnRv
IHB1dCB0aGUgc2V0dGluZyBvZiAiLmF1ZGlvX3N0YXJ0dXAiIGFkamFjZW50IHRvIHRoZSBzZXR0
aW5nIG9mCiIuYXVkaW9fc2h1dGRvd24iIGluIHRoZSBzdHJ1Y3QuCgpJIGhhdmUgdGVzdGVkIHlv
dXIgcGF0Y2ggb24gQ2hyb21lIE9TIDQuMTkgYW5kIGl0IGRlZmluaXRlbHkgZml4ZXMgdGhlCnBy
b2JsZW1zIEkgc2F3LiAgQ2hyb21lIE9TIDQuMTkgaXMgYSBsaXR0bGUgZGlmZmVyZW50IHRoYW4g
dXBzdHJlYW0KYW5kIEknbSBub3Qgc2V0dXAgdG8gdGVzdCBIRE1JIGF1ZGlvIGRpcmVjdGx5IG9u
IHVwc3RyZWFtLCBidXQgSSBkaWQKYXQgbGVhc3QgY29uZmlybSB0aGF0IG15IHByb2JsZW0gX3dh
c24ndF8gbWFnaWNhbGx5IGZpeGVkIGJ5IGFueSBvZgp0aGVzZSBwYXRjaGVzIHRoYXQgSSBmb3Vu
ZCB1cHN0cmVhbSAoSSBwaWNrZWQgdGhlbSBpbnRvIG15IHRyZWUgYW5kCnN0aWxsIHNhdyB0aGUg
cHJvYmxlbSk6CgpmYzFjYTZlMDFkMGEgZHJtL2JyaWRnZTogZHctaGRtaS1pMnM6IGFkZCAuZ2V0
X2VsZCBzdXBwb3J0CjQzZTg4ZjY3MGE1ZSBkcm0vYnJpZGdlOiBkdy1oZG1pLWkyczogZW5hYmxl
IG9ubHkgdGhlIHJlcXVpcmVkIGkycyBsYW5lcwo0NmNlY2RlMzEwYmIgZHJtL2JyaWRnZTogZHct
aGRtaS1pMnM6IHJlc2V0IGF1ZGlvIGZpZm8gYmVmb3JlIGFwcGx5aW5nCm5ldyBwYXJhbXMKMGM2
MDk4ODU5MTc2IGRybS9icmlkZ2U6IGR3LWhkbWktaTJzOiBzZXQgdGhlIGNoYW5uZWwgYWxsb2Nh
dGlvbgoxN2ExZTU1NWI2MDggZHJtL2JyaWRnZTogZHctaGRtaS1pMnM6IGVuYWJsZSBscGNtIG11
bHRpIGNoYW5uZWxzCmRhNWY1YmM5MmY0OSBkcm0vYnJpZGdlOiBkdy1oZG1pOiBzZXQgY2hhbm5l
bCBjb3VudCBpbiB0aGUgaW5mb2ZyYW1lcwoyYTJhM2QyZmY3OTkgZHJtL2JyaWRnZTogZHctaGRt
aTogbW92ZSBhdWRpbyBjaGFubmVsIHNldHVwIG91dCBvZiBhaGIKODA2N2Y2MmJjY2FmIGRybS9i
cmlkZ2U6IGR3LWhkbWktaTJzOiBzdXBwb3J0IG1vcmUgaTJzIGZvcm1hdAoKVGh1czoKClJldmll
d2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+ClRlc3RlZC1i
eTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKLURvdWcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
