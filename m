Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057C72F3C2B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F88D89991;
	Tue, 12 Jan 2021 22:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023BC8997A;
 Tue, 12 Jan 2021 22:14:11 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 9so4909oiq.3;
 Tue, 12 Jan 2021 14:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dUzHjSUJNwPOYe2P1SOY3ZnGPOkWoC76PQ0dv7QwL7Q=;
 b=TmKOQkDtlN2s867X3fJQaHMdBc/6iL5fV/QbW7EFO1gs4S8QzpfqGp2XU8LKIWhlcv
 /Gm7yOpxCdS2FxLeFLlJpTtqbVfFpiv69eo8p4aAcE5kjXRdwYIqdnCNINYlQfD+tXuc
 SIr+cUHULmbmXLHqCeDi6efl0aX8cJgOOpDTU6J1+3+kHrLrQKmgm06LFKxWPidMHeNv
 XSAWM9l5D2x7iFqvQpSz4Rt9TKMyfkawfHvEUXCdQRC/TKWOOx3Gc/3CTxUIoJnH3rCH
 1GC0GJu8dYKgTxPY2AtGSneHAalqnPtzpZAD5i9CSZc1BX8kv0v26uqkjn4mqYqTYEIU
 VG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dUzHjSUJNwPOYe2P1SOY3ZnGPOkWoC76PQ0dv7QwL7Q=;
 b=pFhZ5gGK95E64RLDcGcOhjiZAg3FUvel5il1kiP/GlmdsboxvhzSB0vaVyNwJRPV6n
 K4a3xB/p/MpCkmt7k+g2vacKTJF6TUL6EcAxvdqee3IUJ0KwdbqzlBgsChsd8hVfkCAh
 80csjg3CYKl8ZPNXmESCLXSq8F1aFnjSnC9d0t9hAvPS94oHin1LmGXOLAljB46Jp5K/
 rMYsHbWpCDDwq/R82tzJSmKzR87cW7F/4Lfvj+Ka5Ma0KZW0FVhiko+jSprguKl4VdKd
 jhH9dtTaAkv49IFiSAXkDSyD75mZuZGC8WZzAatxC/0JbizyBjZjULL/D4IUVv7iaf89
 WCww==
X-Gm-Message-State: AOAM533KhHsyblrJom3lpKaBfnSABwSoneksNG4FjdHdv3UBtY4Pe4AO
 Ami8X00kbfzGT8X4ZZOXlyTyWdBnIa46CALqHvk=
X-Google-Smtp-Source: ABdhPJyIPgB57dA666S4SRW6OSiMM5d32ZB9ymXUjcm/3oP+7Iv4gD5k5//P1Onz6OMlHc4lr2qC5AX326vzfhwk1eM=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr783979oib.123.1610489650371; 
 Tue, 12 Jan 2021 14:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-16-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:13:58 -0500
Message-ID: <CADnq5_MAazDVYS3ajUAKFdbbivADuu1Tq7GqynAAzuAFakKOaQ@mail.gmail.com>
Subject: Re: [PATCH 15/40] drm/amd/display/dc/dce120/dce120_resource:
 Staticify local functions
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjQyNjozMjogd2FybmluZzogbm8gcHJldmlvdXMgcHJv
dG90eXBlIGZvciDigJhkY2UxMjBfb3BwX2NyZWF0ZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEy
MF9yZXNvdXJjZS5jOjQ0MDoxNzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDi
gJhkY2UxMjBfYXV4X2VuZ2luZV9jcmVhdGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVz
b3VyY2UuYzo0Nzg6MjA6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNl
MTIwX2kyY19od19jcmVhdGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5
IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jIHwgNiArKystLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNv
dXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVz
b3VyY2UuYwo+IGluZGV4IGYxZTNkMjg4OGVhY2MuLmM2NWU0ZDEyNWM4ZTIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2Uu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jl
c291cmNlLmMKPiBAQCAtNDIzLDcgKzQyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNlMTEw
X2Nsa19zcmNfbWFzayBjc19tYXNrID0gewo+ICAgICAgICAgICAgICAgICBDU19DT01NT05fTUFT
S19TSF9MSVNUX0RDRV8xMTIoX01BU0spCj4gIH07Cj4KPiAtc3RydWN0IG91dHB1dF9waXhlbF9w
cm9jZXNzb3IgKmRjZTEyMF9vcHBfY3JlYXRlKAo+ICtzdGF0aWMgc3RydWN0IG91dHB1dF9waXhl
bF9wcm9jZXNzb3IgKmRjZTEyMF9vcHBfY3JlYXRlKAo+ICAgICAgICAgc3RydWN0IGRjX2NvbnRl
eHQgKmN0eCwKPiAgICAgICAgIHVpbnQzMl90IGluc3QpCj4gIHsKPiBAQCAtNDM3LDcgKzQzNyw3
IEBAIHN0cnVjdCBvdXRwdXRfcGl4ZWxfcHJvY2Vzc29yICpkY2UxMjBfb3BwX2NyZWF0ZSgKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eCwgaW5zdCwgJm9wcF9yZWdzW2luc3RdLCAm
b3BwX3NoaWZ0LCAmb3BwX21hc2spOwo+ICAgICAgICAgcmV0dXJuICZvcHAtPmJhc2U7Cj4gIH0K
PiAtc3RydWN0IGRjZV9hdXggKmRjZTEyMF9hdXhfZW5naW5lX2NyZWF0ZSgKPiArc3RhdGljIHN0
cnVjdCBkY2VfYXV4ICpkY2UxMjBfYXV4X2VuZ2luZV9jcmVhdGUoCj4gICAgICAgICBzdHJ1Y3Qg
ZGNfY29udGV4dCAqY3R4LAo+ICAgICAgICAgdWludDMyX3QgaW5zdCkKPiAgewo+IEBAIC00NzUs
NyArNDc1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkY2VfaTJjX21hc2sgaTJjX21hc2tzID0g
ewo+ICAgICAgICAgICAgICAgICBJMkNfQ09NTU9OX01BU0tfU0hfTElTVF9EQ0UxMTAoX01BU0sp
Cj4gIH07Cj4KPiAtc3RydWN0IGRjZV9pMmNfaHcgKmRjZTEyMF9pMmNfaHdfY3JlYXRlKAo+ICtz
dGF0aWMgc3RydWN0IGRjZV9pMmNfaHcgKmRjZTEyMF9pMmNfaHdfY3JlYXRlKAo+ICAgICAgICAg
c3RydWN0IGRjX2NvbnRleHQgKmN0eCwKPiAgICAgICAgIHVpbnQzMl90IGluc3QpCj4gIHsKPiAt
LQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
