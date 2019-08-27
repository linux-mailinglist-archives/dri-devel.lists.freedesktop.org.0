Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19CB9EACF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19B289BF0;
	Tue, 27 Aug 2019 14:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48C089BF0;
 Tue, 27 Aug 2019 14:21:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p17so19000610wrf.11;
 Tue, 27 Aug 2019 07:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=laSqQOEfNf/YQtcJcPPue42MPQnRnjYdgG2VQPRK7+8=;
 b=l4crHF19u+xkAeHPIq9Vh77+/8TF5iYXwVIKlkNB8nqhY6GAskLzcrqLpKc2vg6J0o
 5eoryNhs7XDGK53m0tyLzqQIzC+Cku1iaINw3MmQybWUbpQ//B081U6Adm+l/UVc9DD7
 MrpN9kAwIbNYh5EreoWvqPm3MUjlX6x8Yy6dP4xtETrI3xT9PMHICua8gxvaa3jk2nR1
 IUOT+frzi2Wgf8Ot/Y35sZZ7IXQNRxrooDXSjkeKcM+/ZV8B6P18dU2xf3n55lcx7+Mm
 fzW2C5WoAWytEapg+SeRwK+S9m7Q4a8NGUC0QqUGMH4Kg7PSMvhvJsqxrtvKiA6pfhYO
 Vr1A==
X-Gm-Message-State: APjAAAUER8d7YrwAxyPsMyq05jN6n6PcjqJ3C/+Copt3c7fv0T+MdRHH
 YztGf0UgJbxDhJdjRbdR+/e4JFqrp0InuO9O0BY=
X-Google-Smtp-Source: APXvYqy3mc0LRXLtAIIdQ4SagcpdGnfmIZhZN4wxQ6kytbRGlFF6lnryi6maSOw+lb4KJlUyeGkjR62LZdEwMvyZmTY=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr31086466wrn.142.1566915704413; 
 Tue, 27 Aug 2019 07:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190827093332.18096-1-kai.heng.feng@canonical.com>
In-Reply-To: <20190827093332.18096-1-kai.heng.feng@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2019 10:21:33 -0400
Message-ID: <CADnq5_N7PMxyVDcaQB_L+jNzb=bbMsCBZbn8GmpYewUh+NDLUA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add APTX quirk for Dell Latitude 5495
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=laSqQOEfNf/YQtcJcPPue42MPQnRnjYdgG2VQPRK7+8=;
 b=WkBZ2PlhNsa6QltAX6IOshMzf5VkyMslx0xpriGkja65CTnGo1GYsiUGlRk4Jm4t3t
 qlJabfeVrActxMaw8VS/eTrl3K5GCUzrbm4r1Zv9Vn2RWTF5RFDmVstO9F6JN5EQkX0F
 HPf4OHWHRszay3KrIhNPW/ggo+BiHXfUst6jI83m6wTttNa/d+eqg+QQfQ0vjZ/1T6rW
 gSBy0zMXMPC/AuFy4Ti/1jth0cUGCe/GpOehDtlQmgGTl7gAOfVkP9gZvQsKaWrj2pFy
 UzedFFyv28V5+FUv9NcVZa9pIVEsVCHt/c3Z0I/fsTq6nnlgYYef/jUL06eKtG5bN0RB
 9oGg==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgOTowNyBBTSBLYWktSGVuZyBGZW5nCjxrYWkuaGVuZy5m
ZW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gTmVlZHMgQVRQWCByYXRoZXIgdGhhbiBfUFIz
IHRvIHJlYWxseSB0dXJuIG9mZiB0aGUgZEdQVS4gVGhpcyBjYW4gc2F2ZQo+IH41VyB3aGVuIGRH
UFUgaXMgcnVudGltZS1zdXNwZW5kZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLYWktSGVuZyBGZW5n
IDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0cHhfaGFuZGxlci5j
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYwo+IGluZGV4IDkyYjEx
ZGUxOTU4MS4uMzU0YzhiNjEwNmRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYwo+IEBAIC01NzUsNiArNTc1LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBhbWRncHVfcHhfcXVpcmsgYW1kZ3B1X3B4X3F1aXJrX2xpc3RbXSA9IHsK
PiAgICAgICAgIHsgMHgxMDAyLCAweDY5MDAsIDB4MTAwMiwgMHgwMTI0LCBBTURHUFVfUFhfUVVJ
UktfRk9SQ0VfQVRQWCB9LAo+ICAgICAgICAgeyAweDEwMDIsIDB4NjkwMCwgMHgxMDI4LCAweDA4
MTIsIEFNREdQVV9QWF9RVUlSS19GT1JDRV9BVFBYIH0sCj4gICAgICAgICB7IDB4MTAwMiwgMHg2
OTAwLCAweDEwMjgsIDB4MDgxMywgQU1ER1BVX1BYX1FVSVJLX0ZPUkNFX0FUUFggfSwKPiArICAg
ICAgIHsgMHgxMDAyLCAweDY5OWYsIDB4MTAyOCwgMHgwODE0LCBBTURHUFVfUFhfUVVJUktfRk9S
Q0VfQVRQWCB9LAo+ICAgICAgICAgeyAweDEwMDIsIDB4NjkwMCwgMHgxMDI1LCAweDEyNUEsIEFN
REdQVV9QWF9RVUlSS19GT1JDRV9BVFBYIH0sCj4gICAgICAgICB7IDB4MTAwMiwgMHg2OTAwLCAw
eDE3QUEsIDB4MzgwNiwgQU1ER1BVX1BYX1FVSVJLX0ZPUkNFX0FUUFggfSwKPiAgICAgICAgIHsg
MCwgMCwgMCwgMCwgMCB9LAo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
