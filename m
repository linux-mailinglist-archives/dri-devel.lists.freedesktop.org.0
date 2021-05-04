Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A491237322F
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 00:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE5789000;
	Tue,  4 May 2021 22:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C765A89000
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 22:03:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b17so9196885ede.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ZgEI9aWWkFYIE59QHU2kpFOTpigrU9CKjmSZ5dbE/Y=;
 b=r8nZe8HMfAQSeJLCiGPHnnuFnmyndNESig7RAjHBt2l2t3c0hRDvafMeLlcn7yw8hI
 HTz6z3h8+eKdD19GuRxU23njZfqUvlqnXFivPBXOO5yoRsudfy38FOYGqjtrS4weSpnL
 biP9bhytjQ074E6wNwT0WZld8lTbtgsq1kOUlyyLuyEU/Y9Xgs9Ebmj8NHf4uULGIq8z
 27MewYhD1K2j3vB7Fmo00950QnNwky/1cLLxcgMHSFlav+vEp2ZvkTzU4suo2LwZRvoy
 coNcAhIo8VPKwdHvCgIwd2iSYRt/X8jCZLcPYnLLFOtd/rpOoES149+z0hztUUB+ez4p
 hnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ZgEI9aWWkFYIE59QHU2kpFOTpigrU9CKjmSZ5dbE/Y=;
 b=Yx2WIl1VfF/Cf6PBSayZsJvPvkDLCh2/tP3dp4kIJyfDhlXds4t3v0tjSWAqlMCeoZ
 qTfHHhaHoGbJBmcgtEdl5ZjFGdBbnAXP1r3SFirs008H3OeCaOoJXbyPC08EGIT56aaX
 MshqDkGAN+MTJPTMGHdwKRo9ynzTwajOnjN1kJIf6QV2FDjMZQkFDS9YAeqzFmytg/sf
 KhR/cYWF0AQwEiyDeryGtK1rwr3OakyfFNd6IGceD589bUmvc3mAiPB0plCzQqz2tyEU
 pl0V3HYzqj11CH519pfOkNP9KZzF2tSDMMGZsO+S1fhSCS2Pm9UnBReWSUi/yQe/Q2OG
 7img==
X-Gm-Message-State: AOAM532YHtKVgvORKYh1dPef6enOTaOJV0mPDzXUCmznHVCWqtaV3th7
 LmZ1RCSKAFu+8zdeiYVh5QazbEuPEKROZd+Uhis=
X-Google-Smtp-Source: ABdhPJzlYPbhRz/qi3HLCWJ3xtHL2f+uNruVqOL3UrpLLSjaQm1E60DcAi3awCSS3hSTwcYhBLp+rK20rGPDrhQzXjE=
X-Received: by 2002:a05:6402:1354:: with SMTP id
 y20mr10025342edw.115.1620165808504; 
 Tue, 04 May 2021 15:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <e4r4g4R-yjH.A.CJE.0pVkgB@appolonius>
 <20210504183009.GV6564@kitsune.suse.cz>
 <CABkfQAHfjfBFqnVPzg1w5JFOErr=AsLpQgwzwpUJ2Uc_-cmD_w@mail.gmail.com>
 <20210504190452.GW6564@kitsune.suse.cz>
 <CABkfQAFpTYFgiA-h+5DBiky3CMtdj71n5+usGGtrTHsYB1xruA@mail.gmail.com>
In-Reply-To: <CABkfQAFpTYFgiA-h+5DBiky3CMtdj71n5+usGGtrTHsYB1xruA@mail.gmail.com>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Wed, 5 May 2021 00:03:14 +0200
Message-ID: <CABkfQAHMUF2u1HKbkk6PfXS=YmYgRWqBBP86Awc34sy1FgT-vA@mail.gmail.com>
Subject: Re: ERROR: modpost: "drm_display_mode_to_videomode"
 [drivers/gpu/drm/bridge/lontium-lt8912b.ko] undefined!
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
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
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZWQgcHJvcG9zZWQgYXQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIx
MDUwNDIyMDIwNy40MDA0NTExLTEtYWRyaWVuLmdyYXNzZWluQGdtYWlsLmNvbS9ULyN1CgpUaGFu
a3MsCgpMZSBtYXIuIDQgbWFpIDIwMjEgw6AgMjE6MTksIEFkcmllbiBHcmFzc2Vpbgo8YWRyaWVu
LmdyYXNzZWluQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT2sgdGhhbmtzLAo+Cj4gSSB3aWxs
IGludmVzdGlnYXRlIHRoaXMuCj4KPiBMZSBtYXIuIDQgbWFpIDIwMjEgw6AgMjE6MDQsIE1pY2hh
bCBTdWNow6FuZWsgPG1zdWNoYW5la0BzdXNlLmRlPiBhIMOpY3JpdCA6Cj4gPgo+ID4gSGVsbG8s
Cj4gPgo+ID4gSSBoYXZlIG9ubHkgb25lIGZyb20gcHBjNjQsIHRoZSBvdGhlciBhcmNoaXRlY3R1
cmVzIGRvbid0IGhhdmUgdGhlCj4gPiBwcm9ibGVtIG9yIGZhaWwgZWFybGllci4KPiA+Cj4gPiBU
aGFua3MKPiA+Cj4gPiBNaWNoYWwKPiA+Cj4gPiBPbiBUdWUsIE1heSAwNCwgMjAyMSBhdCAwODo0
NTowMVBNICswMjAwLCBBZHJpZW4gR3Jhc3NlaW4gd3JvdGU6Cj4gPiA+IEhlbGxvLAo+ID4gPgo+
ID4gPiBJIHRoaW5rIHRoaXMgaXMgc2VsZi1ldmlkZW50IGJ1dCBjb3VsZCB5b3UgcGxlYXNlIHNl
bmQgdGhlIGNvbmZpZyB0byBjb25maXJtPwo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+Cj4gPiA+
IExlIG1hci4gNCBtYWkgMjAyMSDDoCAyMDozMCwgTWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVr
QHN1c2UuZGU+IGEgw6ljcml0IDoKPiA+ID4gPgo+ID4gPiA+IEhlbGxvLAo+ID4gPiA+Cj4gPiA+
ID4gSSBnZXQgZXJyb3JzIGFib3V0IG1pc3Npbmcgc3ltYm9sIGluIHRoZSBsb250aXVtLWx0ODkx
MmIgbW9kdWxlLgo+ID4gPiA+Cj4gPiA+ID4gSXMgdGhlIHByb2JsZW0gc2VsZi1ldmlkZW50IG9y
IGRvIHlvdSBuZWVkIHRoZSBjb25maWcgYXMgd2VsbD8KPiA+ID4gPgo+ID4gPiA+IEkgZG9uJ3Qg
bmVlZCB0aGUgZHJpdmVyIGZvciBhbnl0aGluZywgaXQgd2FzIGp1c3QgYXV0by1lbmFibGVkIGJl
Y2F1c2UKPiA+ID4gPiBpdCdzIG5ldyBhbmQgdGhlIGNoYW5nZSBoYXMgbm90IGJlZW4gcmV2aWV3
ZWQuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MKPiA+ID4gPgo+ID4gPiA+IE1pY2hhbAo+ID4gPiA+
ID4KPiA+ID4gPiA+IExhc3Qgb3V0cHV0Ogo+ID4gPiA+ID4gICBXUkFQICAgIGFyY2gvcG93ZXJw
Yy9ib290L3pJbWFnZS5tYXBsZQo+ID4gPiA+ID4gICBXUkFQICAgIGFyY2gvcG93ZXJwYy9ib290
L3pJbWFnZS5wc2VyaWVzCj4gPiA+ID4gPiBtYWtlWzJdOiAqKiogRGVsZXRpbmcgZmlsZSAnbW9k
dWxlcy1vbmx5LnN5bXZlcnMnCj4gPiA+ID4gPiAgIE1PRFBPU1QgbW9kdWxlcy1vbmx5LnN5bXZl
cnMKPiA+ID4gPiA+IEVSUk9SOiBtb2Rwb3N0OiAiZHJtX2Rpc3BsYXlfbW9kZV90b192aWRlb21v
ZGUiIFtkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5rb10gdW5kZWZpbmVk
IQo+ID4gPiA+ID4gbWFrZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLm1vZHBvc3Q6MTUw
OiBtb2R1bGVzLW9ubHkuc3ltdmVyc10gRXJyb3IgMQo+ID4gPiA+ID4gbWFrZVsxXTogKioqIFsv
aG9tZS9hYnVpbGQvcnBtYnVpbGQvQlVJTEQva2VybmVsLXZhbmlsbGEtNS4xMi4wLjEzNjcwLmc1
ZTMyMWRlZDMwMmQvbGludXgtNS4xMi0xMzY3MC1nNWUzMjFkZWQzMDJkL01ha2VmaWxlOjE3NzA6
IG1vZHVsZXNdIEVycm9yIDIKPiA+ID4gPiA+IG1ha2U6ICoqKiBbLi4vTWFrZWZpbGU6MjE1OiBf
X3N1Yi1tYWtlXSBFcnJvciAyCj4gPiA+ID4gPiBlcnJvcjogQmFkIGV4aXQgc3RhdHVzIGZyb20g
L3Zhci90bXAvcnBtLXRtcC5xMW9TSXAgKCVidWlsZCkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
