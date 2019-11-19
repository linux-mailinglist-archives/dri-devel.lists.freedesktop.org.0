Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00876101231
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 04:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF706E874;
	Tue, 19 Nov 2019 03:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F5F6E284;
 Tue, 19 Nov 2019 03:29:07 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t11so9792679eds.13;
 Mon, 18 Nov 2019 19:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vlbYDXkHVS11+pIejDVy67CBctjo9Cx4yVStRKhyhsY=;
 b=qnGlw14v0Jv/NyXmihVQ7c+848oXKgkacHarfvjHZbup3d+ZeAIlscwRLOIG9efIZ9
 0SKQu2YJGvFbkX/l0Xp1w0d2q3TS/qmjW+XclwC3K7YrROOlAofElIcL+74jmBDA3t+l
 fj6w9t1C4YyYR8fV15nlOvZNAEm+rz9QVu8+wjJeWGHtvqRBu7m9Ld5V2jf4rqFE90Yt
 5/OwMGtRKJc5+jzSBq9Gc0N5nG8oKyvK6IaVr4CHYrgHAMcSJ9StgKWC6HSqZJgCNW9P
 TeP2Fdn8eE1nljzUR35fFv1YaKPKGFhzo+icHpD6j7CJOjy6yFAAoXrzHdBLZMsUUhOJ
 dpHw==
X-Gm-Message-State: APjAAAU1vJobJf/M5X2d+8eOLFooJzyyPmfuds6a9D5ofjavDQpjd4Br
 FGP3zKRP6ugiIX7FRjp5GyqcdzfxTGQE3VfXylQ=
X-Google-Smtp-Source: APXvYqxm1W9gpI9FbX3HkqAKkjJm3EXrNSSNVFtuevJ5u3ngnRzXg4dB/mAf3Ptai6GpG8/qoxqvKAOFtqnVhTSt45k=
X-Received: by 2002:a17:906:aad5:: with SMTP id
 kt21mr1593370ejb.228.1574134146033; 
 Mon, 18 Nov 2019 19:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20191118234043.331542-1-robdclark@gmail.com>
 <5dd33824.1c69fb81.2d94a.4f12@mx.google.com>
In-Reply-To: <5dd33824.1c69fb81.2d94a.4f12@mx.google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 18 Nov 2019 19:28:55 -0800
Message-ID: <CAF6AEGsT6NrHp99AjgAERBsf77TC3E7OUhC733z2tFuu9XE39w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: restore previous freq on resume
To: Stephen Boyd <swboyd@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vlbYDXkHVS11+pIejDVy67CBctjo9Cx4yVStRKhyhsY=;
 b=e9pPJgmpwWB5+H/T4XPYX2ke0+dZt2xHpk3ckSpB6R7lZPpyKhFvMTnAivjVxKyFuN
 GCz2ah4YfBBzxbC7LgRaAffoRqYIqVE7CERvk/g63OuQsy+sp1EctRsi5AaCdpWx3SoC
 jae+MrHMcDGNaM46fcMal8dRAtyd/TRFRv2lG/sIQ1RlqbJXDofQVZP4jibg6f6O5kNM
 /SETT9+jW9R0YjL8IMaAjlAT4m++Y4mLbIArvmmKhm8daU5d3EefjKkAqXWHWsyfZsDF
 THHID6CAyNQnJ6NPyXN4EHvQ/EGjTj6T6KGGfrCBtDokPoqbhEaVTI0+tWQPD63oxtly
 UgGw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mamta Shukla <mamtashukla555@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgNDozMiBQTSBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMTEtMTggMTU6NDA6
MzgpCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmgKPiA+IGluZGV4IDM5YTI2
ZGQ2MzY3NC4uMmFmOTFlZDdlZDBjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9nbXUuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTZ4eF9nbXUuaAo+ID4gQEAgLTYzLDYgKzYzLDkgQEAgc3RydWN0IGE2eHhfZ211IHsKPiA+ICAg
ICAgICAgc3RydWN0IGNsa19idWxrX2RhdGEgKmNsb2NrczsKPiA+ICAgICAgICAgc3RydWN0IGNs
ayAqY29yZV9jbGs7Cj4gPgo+ID4gKyAgICAgICAvKiBjdXJyZW50IHBlcmZvcm1hbmNlIGluZGV4
IHNldCBleHRlcm5hbGx5ICovCj4gPiArICAgICAgIGludCBjdXJyZW50X3BlcmZfaW5kZXg7Cj4g
PiArCj4KPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlzIGlzbid0IHVuc2lnbmVkPyBJdCBsb29rcyBs
aWtlCj4gX19hNnh4X2dtdV9zZXRfZnJlcSgpIHRha2VzIGFuIGludCwgYnV0IG1heWJlIGl0IHNo
b3VsZCB0YWtlIGEgdTE2IG9yCj4gc29tZXRoaW5nPwo+CgpubyBwYXJ0aWN1bGFyIHJlYXNvbiwg
b3RoZXIgdGhhbiBvdGhlciB0aGluZ3Mgd2hlcmUgYWxyZWFkeSB1c2luZyBhbgppbnQuLiB0aGlz
IGlzIGp1c3QgYW4gaW5kZXggaW50byB0aGUgdGFibGUgb2Ygb3BwJ3Mgc28gaXQgaXMgbmV2ZXIK
Z29pbmcgdG8gYmUgYSBsYXJnZSBpbnQuCgpEZXBlbmRpbmcgb24gR01VX0RDVlNfUEVSRl9TRVRU
SU5HIGl0IGNvdWxkIHByb2JhYmx5IGJlIGEgdTggKEknbSBub3QKKmVudGlyZWx5KiBzdXJlIGZy
b20gdGhlIGNvZGUgaG93IGxhcmdlIHRoYXQgYml0ZmllbGQgaXMpCgpCUiwKLVIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
