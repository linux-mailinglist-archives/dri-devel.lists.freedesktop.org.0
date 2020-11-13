Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8476C2B221D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384C6E5CA;
	Fri, 13 Nov 2020 17:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC116E5C0;
 Fri, 13 Nov 2020 17:23:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w24so9286860wmi.0;
 Fri, 13 Nov 2020 09:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6X451lbJ+PYGuYOFu2kTr7WQuY5qufumT5+PoxOj2as=;
 b=rfmqUL1Mj+MTQESwoTeNlE8a9U02FNNrnhR6p/9o8szpLCQr5UtovIZGxox1TZC8PD
 T1eWcfbe4ww413scpizx8sz/rrykh/1Cpp+uIOCBLOSJCOgzCUMgamLVFcD+wAt8+vU1
 7YLp7nwkwS2qneXG8fy8bkaaPyiYMPF9+TfQuwuyjaiUzqTGfzRhi84nUj/2kUA1TGCh
 ol51ugwOrkmLtK+S1TDr9fkz8b3slwGsW/pDPz2mFqFs6Sdxe3v7ZdeS8UHjQ1bx3dGK
 Kj1HWmY3yt8kZ0EcGXIjhGCtoAnDvzSr2XAa8o8XI49vkhMldyqgR/2KGqJY4IK8LjwO
 acKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6X451lbJ+PYGuYOFu2kTr7WQuY5qufumT5+PoxOj2as=;
 b=X2RqJ/s5zyjhve9ksKbXFTmnxvmcuNj2MGcN3LYXTbKZq037nIbpnGywknUFVDlSGH
 HUYbPPuv/314FfRK8TcKQBGfilNOJBHFYmeCrKQvgxVHgR4qzmYrWnBMS6Avm0ktb7/g
 jF0lyFkd06HiYD9MFbubICeOBxHijlmEuvutClQv6b/iQr6Sh8Z4RZisjJNHZoXOpXZW
 P09Ozq0vZZk2LTbzuCyU0O3b9Er9OFiJCWHMJni9QOzjU2O54CTcTjLchFP46WAWKOX9
 ToWeTmjMsYPeQB0goo5ah2uMwmV0ykE/L+oRFxCmoYf3fMlwczQB0BXul7/EAWnRzX+z
 hZaQ==
X-Gm-Message-State: AOAM533FEcb/c7d9GLxEnUd1iJ1vDkxkPcntMN6T6gDLn5VYe7shKEuW
 zGZlxSDgTezktsnNPq7o0pGnQ8xR/QOrrCU7NTc=
X-Google-Smtp-Source: ABdhPJy7Tz+IImQHryl81psj+Jw5opNp5XA26S6NA1Hc9BmKdvtxN3XW1uZJ7Aa2HnLDiF/E578RNi9d9xgYPp1oe9A=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr3550572wmd.73.1605288223150; 
 Fri, 13 Nov 2020 09:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-30-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-30-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:23:31 -0500
Message-ID: <CADnq5_M9POgJS2Oo0icBmsug+NDLz+n_Ree-As8GyM847b4hYA@mail.gmail.com>
Subject: Re: [PATCH 29/40] drm/amd/amdgpu/amdgpu_csa: Remove set but unused
 variable 'r'
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "monk.liu" <Monk.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYzog
SW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2FsbG9jYXRlX3N0YXRpY19jc2HigJk6Cj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYzo0MDo2OiB3YXJuaW5nOiB2YXJpYWJsZSDi
gJhy4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gQ2M6IE1vbmsubGl1QGFtZC5jb20KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxl
eAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jIHwgMyAr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYwo+IGluZGV4IDA4MDQ3YmM0ZDU4
ODYuLmRhMjFlNjBiYjgyNzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2NzYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2NzYS5jCj4gQEAgLTM3LDEwICszNyw5IEBAIHVpbnQ2NF90IGFtZGdwdV9jc2FfdmFkZHIoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIGludCBhbWRncHVfYWxsb2NhdGVfc3RhdGljX2Nz
YShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9ibyAqKmJvLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGRvbWFpbiwgdWludDMyX3Qgc2l6ZSkK
PiAgewo+IC0gICAgICAgaW50IHI7Cj4gICAgICAgICB2b2lkICpwdHI7Cj4KPiAtICAgICAgIHIg
PSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBzaXplLCBQQUdFX1NJWkUsCj4gKyAgICAg
ICBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCBzaXplLCBQQUdFX1NJWkUsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkb21haW4sIGJvLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCwgJnB0cik7Cj4gICAgICAgICBpZiAoISpibykKPiAtLQo+IDIu
MjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
