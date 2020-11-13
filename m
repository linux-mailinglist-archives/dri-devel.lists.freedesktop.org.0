Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE5E2B2287
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB8B6E7D3;
	Fri, 13 Nov 2020 17:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29276E7D3;
 Fri, 13 Nov 2020 17:33:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so9347503wmi.0;
 Fri, 13 Nov 2020 09:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qGs9VC8jOc6afFqkpCh7JskFElPU1yEcg3k0a+lEsmg=;
 b=UXILF3Rrw2fNCJSw4Q9k0nglz6ze+BmvrGVJAJdCAeholmg6VIaK2FIYdlIyQ4i3N7
 1692Sq9NOfnAAJgsQN0w+Jd7XhYUWAWOUS+Dc4+EQqbmLn7V+pkWFOILiLYOfScke8Dl
 FxGQGVj/OvolRqUvJVPSIoPFYabXxDlBdoCpgStdGFEfuPz1tmT1EBa9lZn4YBQ833TH
 yrPGOR56luScchaUwetL5PMDzjj5NcWQjLtgiosBzJ68+4d54LtahFY2Qr0QTZEFyb30
 69MyTeEUgH4xa8LXBDAsZqW9sEmKkc6SfiTnByU8UewlhlLvHZxly9zwDi1yDPJFXgJj
 k1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qGs9VC8jOc6afFqkpCh7JskFElPU1yEcg3k0a+lEsmg=;
 b=NnxvyKqBdu/gpP4nVcZY/4/yQufOkbZL5FEl2RLGcdsUMDLTStX9znBji2nXlQHBjN
 V4OnPVptgmTCAhWaSP3W3y/zttPjk1xDVhUJ23YUhfiwnEslsBvHfe6FgDhyuAHVsOk2
 b1foJBcFBo+iVSjaodYFsxD7A7t8WkX9T5zca1kJ+9gyx1vv4tY/QgorcVqrg24Q43MQ
 NVDp3U0DtgOf2JliN7t/ITGTI31Yz8XEyo86/Ka51zXGl+zOwwtvBpGJZr211zv98E6h
 0nVpLDdxkNx2B1gwNis3zoBTlB+Z9DrY72v68QQglNeWZ0oO3N9KomDosJVydkkrhKJO
 l/Cw==
X-Gm-Message-State: AOAM5303p84+HWxVUecu84Y/RkV6Rsdu5lFHuH+iJ9YLPGm4IDNDm8sK
 36g17YpAR0TNOo9fA3adpWH4nUs+2LkN+UJ27AY=
X-Google-Smtp-Source: ABdhPJzoOoTIHWvDnQYCLoi4+uXFnYAFsq8cLgkJySJ4m/H0YKbo1MkqvVMZjFBNtCwJySIiGevwMiZPHvEa8RdnQbA=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr3652886wmb.56.1605288810795;
 Fri, 13 Nov 2020 09:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-37-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-37-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:33:19 -0500
Message-ID: <CADnq5_OTbwrqno6qsmjH9sFbo0PDoWcXW9uAqPQK+3Tj0q07ow@mail.gmail.com>
Subject: Re: [PATCH 36/40] drm/amd/amdgpu/amdgpu_fw_attestation: Consume our
 own header containing prototypes
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
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo1MSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9md19hdHRl
c3RhdGlvbi5jOjEzMDo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGFt
ZGdwdV9md19hdHRlc3RhdGlvbl9kZWJ1Z2ZzX2luaXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+IENjOiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Cj4gQ2M6
IEpvaG4gQ2xlbWVudHMgPGpvaG4uY2xlbWVudHNAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVk
LiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Z3X2F0dGVzdGF0aW9uLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Z3X2F0dGVzdGF0aW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZndfYXR0ZXN0YXRpb24uYwo+IGluZGV4IGM2OTQ3ZDZjN2ZmNTEuLmU0N2Jj
YTFjNzYzNTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Z3X2F0dGVzdGF0aW9uLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZndfYXR0ZXN0YXRpb24uYwo+IEBAIC0yNiw2ICsyNiw3IEBACj4gICNpbmNsdWRlIDxsaW51
eC9kbWEtbWFwcGluZy5oPgo+Cj4gICNpbmNsdWRlICJhbWRncHUuaCIKPiArI2luY2x1ZGUgImFt
ZGdwdV9md19hdHRlc3RhdGlvbi5oIgo+ICAjaW5jbHVkZSAiYW1kZ3B1X3BzcC5oIgo+ICAjaW5j
bHVkZSAiYW1kZ3B1X3Vjb2RlLmgiCj4gICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCIKPiBAQCAt
MTM5LDQgKzE0MCw0IEBAIHZvaWQgYW1kZ3B1X2Z3X2F0dGVzdGF0aW9uX2RlYnVnZnNfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YWRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFtZGdwdV9md19hdHRlc3RhdGlv
bl9kZWJ1Z2ZzX29wcyk7Cj4gICNlbmRpZgo+IC19Cj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBm
aWxlCj4gK30KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
