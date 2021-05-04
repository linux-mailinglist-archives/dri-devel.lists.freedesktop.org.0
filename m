Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235D3730A5
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 21:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E156EB67;
	Tue,  4 May 2021 19:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3DE6EB67
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 19:19:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g14so11744912edy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 12:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PaY5BeyThU9Oqa5E0rN+QI4l8GyOFDg1PpkL7EPVYXE=;
 b=JFA/8XYwritP46yCAgT/nmYSkwKesLyBCdX4oAhNdOXQ69Td23Fk3CP35RxxITPhih
 rhnzsp0ZNAkMJisc2i599n6V7f5dW4Kl2ROcORZwx3HXkqViXtbZsk5/62rIXOB2qGtU
 WFJakaMAyaCefWlwkcmjYuG1DvfqbC8AFWdIYSwHj3lJMZ91dJH3WSYoBVkApqLP/Vp+
 2G/STcG2STau8pGFolQVSW6jasMrNh/4m4zce/IAosTmfR+oig36/rYiHxC4ZNATMCqk
 f1ZqeCLxCUTkLXFQwiAIVX2NYXYXokNBBUM2PCyVZ0zmK1f3sKvM9T3Y+SgzewZyB/CA
 TvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PaY5BeyThU9Oqa5E0rN+QI4l8GyOFDg1PpkL7EPVYXE=;
 b=qiIbGgnKmLgtL36tkFhkzjn/6mcZaf3sMW4PlQ0IwsCOOZIJFlODzT7DK/zxFlqeZv
 GEGvJ/46fvegiChO6aQVuX2RlCCmKKYV1XtHSC2GRHM9DTrlHcFPD1F0AKEICAlkaSK6
 DiHDjBfELQxPHGESwjELkZ88/NOrX6DGTxtvYo3QpNMmuCYZGQPJcPWqI0yH/eBh7sHF
 X/S6qLs3/SWJSPVA6YVYlQ8SvEd3re4XRJ3JFYujoYrWglY2KxhESTpPDmAYqYbki89l
 bT1EjHQDMfKE80EecHlDzQjHlH5o+ZIXM2z/gCUigJ+Hl3OtSVj1INWAXajdwbS1hcI0
 hnqw==
X-Gm-Message-State: AOAM532ta9bEgl8JfacBRSDoslyntWVM9+USXvhqOvrVU4nwqFvxhNgx
 IHKix9dh3XPpfIDpghuSvVgd0bi59QC63VguBDE=
X-Google-Smtp-Source: ABdhPJxQhIHBDaE08YeU5xNR99TW13NYeX6EKKCoEJUJq4Tl1oPY59Rx1+gNQB6ZpTtMRCDoE9w7os89CzDYdM3ulQ4=
X-Received: by 2002:aa7:cd50:: with SMTP id v16mr28953451edw.175.1620155991412; 
 Tue, 04 May 2021 12:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <e4r4g4R-yjH.A.CJE.0pVkgB@appolonius>
 <20210504183009.GV6564@kitsune.suse.cz>
 <CABkfQAHfjfBFqnVPzg1w5JFOErr=AsLpQgwzwpUJ2Uc_-cmD_w@mail.gmail.com>
 <20210504190452.GW6564@kitsune.suse.cz>
In-Reply-To: <20210504190452.GW6564@kitsune.suse.cz>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Tue, 4 May 2021 21:19:36 +0200
Message-ID: <CABkfQAFpTYFgiA-h+5DBiky3CMtdj71n5+usGGtrTHsYB1xruA@mail.gmail.com>
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

T2sgdGhhbmtzLAoKSSB3aWxsIGludmVzdGlnYXRlIHRoaXMuCgpMZSBtYXIuIDQgbWFpIDIwMjEg
w6AgMjE6MDQsIE1pY2hhbCBTdWNow6FuZWsgPG1zdWNoYW5la0BzdXNlLmRlPiBhIMOpY3JpdCA6
Cj4KPiBIZWxsbywKPgo+IEkgaGF2ZSBvbmx5IG9uZSBmcm9tIHBwYzY0LCB0aGUgb3RoZXIgYXJj
aGl0ZWN0dXJlcyBkb24ndCBoYXZlIHRoZQo+IHByb2JsZW0gb3IgZmFpbCBlYXJsaWVyLgo+Cj4g
VGhhbmtzCj4KPiBNaWNoYWwKPgo+IE9uIFR1ZSwgTWF5IDA0LCAyMDIxIGF0IDA4OjQ1OjAxUE0g
KzAyMDAsIEFkcmllbiBHcmFzc2VpbiB3cm90ZToKPiA+IEhlbGxvLAo+ID4KPiA+IEkgdGhpbmsg
dGhpcyBpcyBzZWxmLWV2aWRlbnQgYnV0IGNvdWxkIHlvdSBwbGVhc2Ugc2VuZCB0aGUgY29uZmln
IHRvIGNvbmZpcm0/Cj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+IExlIG1hci4gNCBtYWkgMjAyMSDD
oCAyMDozMCwgTWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IGEgw6ljcml0IDoK
PiA+ID4KPiA+ID4gSGVsbG8sCj4gPiA+Cj4gPiA+IEkgZ2V0IGVycm9ycyBhYm91dCBtaXNzaW5n
IHN5bWJvbCBpbiB0aGUgbG9udGl1bS1sdDg5MTJiIG1vZHVsZS4KPiA+ID4KPiA+ID4gSXMgdGhl
IHByb2JsZW0gc2VsZi1ldmlkZW50IG9yIGRvIHlvdSBuZWVkIHRoZSBjb25maWcgYXMgd2VsbD8K
PiA+ID4KPiA+ID4gSSBkb24ndCBuZWVkIHRoZSBkcml2ZXIgZm9yIGFueXRoaW5nLCBpdCB3YXMg
anVzdCBhdXRvLWVuYWJsZWQgYmVjYXVzZQo+ID4gPiBpdCdzIG5ldyBhbmQgdGhlIGNoYW5nZSBo
YXMgbm90IGJlZW4gcmV2aWV3ZWQuCj4gPiA+Cj4gPiA+IFRoYW5rcwo+ID4gPgo+ID4gPiBNaWNo
YWwKPiA+ID4gPgo+ID4gPiA+IExhc3Qgb3V0cHV0Ogo+ID4gPiA+ICAgV1JBUCAgICBhcmNoL3Bv
d2VycGMvYm9vdC96SW1hZ2UubWFwbGUKPiA+ID4gPiAgIFdSQVAgICAgYXJjaC9wb3dlcnBjL2Jv
b3QvekltYWdlLnBzZXJpZXMKPiA+ID4gPiBtYWtlWzJdOiAqKiogRGVsZXRpbmcgZmlsZSAnbW9k
dWxlcy1vbmx5LnN5bXZlcnMnCj4gPiA+ID4gICBNT0RQT1NUIG1vZHVsZXMtb25seS5zeW12ZXJz
Cj4gPiA+ID4gRVJST1I6IG1vZHBvc3Q6ICJkcm1fZGlzcGxheV9tb2RlX3RvX3ZpZGVvbW9kZSIg
W2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmtvXSB1bmRlZmluZWQhCj4g
PiA+ID4gbWFrZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLm1vZHBvc3Q6MTUwOiBtb2R1
bGVzLW9ubHkuc3ltdmVyc10gRXJyb3IgMQo+ID4gPiA+IG1ha2VbMV06ICoqKiBbL2hvbWUvYWJ1
aWxkL3JwbWJ1aWxkL0JVSUxEL2tlcm5lbC12YW5pbGxhLTUuMTIuMC4xMzY3MC5nNWUzMjFkZWQz
MDJkL2xpbnV4LTUuMTItMTM2NzAtZzVlMzIxZGVkMzAyZC9NYWtlZmlsZToxNzcwOiBtb2R1bGVz
XSBFcnJvciAyCj4gPiA+ID4gbWFrZTogKioqIFsuLi9NYWtlZmlsZToyMTU6IF9fc3ViLW1ha2Vd
IEVycm9yIDIKPiA+ID4gPiBlcnJvcjogQmFkIGV4aXQgc3RhdHVzIGZyb20gL3Zhci90bXAvcnBt
LXRtcC5xMW9TSXAgKCVidWlsZCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
