Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D860E2B103C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 22:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8896E43D;
	Thu, 12 Nov 2020 21:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07336E442;
 Thu, 12 Nov 2020 21:26:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d12so7496206wrr.13;
 Thu, 12 Nov 2020 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HziF5y2Ho33ipPGe8JAMvCvqv1ktqhXSvBiNR5cyKKo=;
 b=oP8LyXkztYBwHuxXBbqefGv8Wv5Fkb4Baq8EfEKsKe2PUk0Ltwt3L4hW18aV0JDyUL
 7G67vt3f5kB4hiR3wG/Wo+dsNIc2rlySaKnYnNM8RAfrG33fcGqgZNQSYiQdS8Mq+Kxo
 W4Sa11T2vGBy1D8MuHB+mBgFqRennqN9Ej6m3JIVKzGmfMv51XJ65nOXlALFIynTXN8L
 x2PtmDcc2RQ9TQX916x77GXA9v8fBaVPdJ6MIB/ZtHYlvRcY+HtmkhI52Pm8N4PYTb94
 FTuGobt/Y9fjLTtKwWosYliZTbteFvO25y4oyZBqGF3+83qXsilDEFjf353n+6WP+3UL
 Yuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HziF5y2Ho33ipPGe8JAMvCvqv1ktqhXSvBiNR5cyKKo=;
 b=h2QrCDfdVXFe2/jtbOq0/NHT7sbAGdrrKOrVdAivChrV6SP0HZ24oRy+NHV5QCuPXG
 OTSSX8A8iCFkF9GqQLofFhPfFNPc+B4l1L2ukdkKsaOCc6IpxO4EQ+TI9vjxXCyylO4e
 Vmm/0t7VKAmkxsyCrgFx9Kcjk4HUgS656pih8BUtAs9mzLPc/htO3/Zn4/m3ew6Z1vzu
 QkYBH50BTTikaEXc3yb30hFwYLb6UT9oANZq/UZW1x6hxO9y1Swc9iPLCBlR228AGbhG
 7ptd6+sKWjG6oPRQD+Wn1hniTJYOtPlj7OvHjrc40/JP65P2XyC9nMakm6ccWthb1Tpx
 jK9w==
X-Gm-Message-State: AOAM533gSyHzMelWP7ppkAim3mJvYHDhDyD1IFc0NedXARxVuZ2wbygK
 IWeyTKFJOEnpqhXp0ENqxTSJuayvXZQw8ZYUiZE=
X-Google-Smtp-Source: ABdhPJxIB/Q0rdjTpnfspr2y90QDinSOTab3wfLFpbQI9qmynfR60kBK/QgPN53OHeJMMwYAI40XkoKskcEEG5Z2l60=
X-Received: by 2002:adf:804e:: with SMTP id 72mr1869161wrk.114.1605216396614; 
 Thu, 12 Nov 2020 13:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-16-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Nov 2020 16:26:25 -0500
Message-ID: <CADnq5_OfR3KdoOrcBAiLtyqOi6kBkwkErZtRiBjo=zdAgb8hFQ@mail.gmail.com>
Subject: Re: [PATCH 15/30] drm/amd/amdgpu/amdgpu_display: Remove pointless
 header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 report to <xorg-driver-ati@lists.x.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMjowMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEl0IHNlZW1zIG9ubHkgdG8gcmVwZWF0IHRoZSBmdW5jdGlvbiBu
YW1lLgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6
Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYzo0NTA6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2FtZGdwdV9jb25uZWN0b3InIG5v
dCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9kaXNwbGF5X2RkY19wcm9iZScKPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYzo0NTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ3VzZV9hdXgnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9kaXNw
bGF5X2RkY19wcm9iZScKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGlu
YXJvLm9yZz4KPiBDYzogcmVwb3J0IHRvIDx4b3JnLWRyaXZlci1hdGlAbGlzdHMueC5vcmc+Cj4g
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxp
bmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyB8IDQgLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwo+IGluZGV4IDBiMTM0NTk4YjNhNjUuLmY0ZGU0YjQxYWRj
ZmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3Bs
YXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMK
PiBAQCAtNDQxLDEwICs0NDEsNiBAQCB2b2lkIGFtZGdwdV9kaXNwbGF5X3ByaW50X2Rpc3BsYXlf
c2V0dXAoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgICAgICAgIGRybV9jb25uZWN0b3JfbGlz
dF9pdGVyX2VuZCgmaXRlcik7Cj4gIH0KPgo+IC0vKioKPiAtICogYW1kZ3B1X2Rpc3BsYXlfZGRj
X3Byb2JlCj4gLSAqCj4gLSAqLwo+ICBib29sIGFtZGdwdV9kaXNwbGF5X2RkY19wcm9iZShzdHJ1
Y3QgYW1kZ3B1X2Nvbm5lY3RvciAqYW1kZ3B1X2Nvbm5lY3RvciwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sIHVzZV9hdXgpCj4gIHsKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
