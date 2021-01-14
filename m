Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C32F6696
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E1E6E038;
	Thu, 14 Jan 2021 17:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93086E027;
 Thu, 14 Jan 2021 17:02:09 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id d203so6623347oia.0;
 Thu, 14 Jan 2021 09:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MDXD1cfaKjpnTdiyzujGkE6BL77maZcHvpSWDP0r0Sw=;
 b=UBTXrRvIShR7DHN41GepsBVsg73ac2CeJTJ3dGkf2PmB4N0seO5TuBbsBVtk3X4i5d
 lSvyD8fbtT9vOuSESwXNyEoz1of37dyGT/JDOG6raZhc/1ZjZK1hjAlqQvEtPHwV+pOk
 eAUda++7tjm+GPxvmP8OQ1cpPmTlZiQmWl8DnN3jSrP7EtyBJCjoXimzE5ujSFyqtUJa
 fYSofVo+XIasmfjhuZK443n6ETWm922+HmWRT3DU6SpaDibrHbybm2ay0qC3o1kIxddc
 jYGHtElVvB57rXxMQXDcbSfOLaYykyrVolPklyoiN3mhi73AvKPeg6vNRqk3psHSyOPv
 cqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MDXD1cfaKjpnTdiyzujGkE6BL77maZcHvpSWDP0r0Sw=;
 b=ItfWIyT0J4wG0EJV71x3QwjAf65662sp6a39QXCKTpnb0K17BsDLG2wK7dgQasIXCD
 wcPBLT2A/ZtA4dJW3Bu4cGxbdE16oUSBLFeWXs69FV0eOiRm3ZzEnjavcDVIXNoOYmPH
 R4z9QqgHURlWyJwFcjVY15/c3OZS1RJX0TmvrJL091PEuCFpBXql/Tdxe40aNRWqE2Yn
 4NzP+cJKvdeozkXoQlIN5EkxXlWc28riOzIsGxaJwMM6B4nu7aJQCkLNwozASTRQsGH/
 WXsdA/J5EG2MiPVU0t5KkesSpEPMSEVVfPTRHWzX99pxd1yoC2XI7MHxs7wjSvLqJfkM
 mgdQ==
X-Gm-Message-State: AOAM5304OdC674lotUy7T38FYr/VynNVTJ8+VPN+vzdo6nOmfotUtbdH
 pGmM5Zb132XT2aFO6Ft40PWrhR1XJeRXvJ8LNQI=
X-Google-Smtp-Source: ABdhPJwIpHDSOSF7kEtQC/iojSc4V+wRjaZ6tvuatXz9KtQgqFlmrCz1RtxxZ3uIHOhyf34lZuB+sTvLax4c0pEFHxo=
X-Received: by 2002:aca:6202:: with SMTP id w2mr2968453oib.5.1610643729141;
 Thu, 14 Jan 2021 09:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20210113080752.1003793-1-lee.jones@linaro.org>
 <20210113080752.1003793-2-lee.jones@linaro.org>
In-Reply-To: <20210113080752.1003793-2-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:01:58 -0500
Message-ID: <CADnq5_OOvL4i1fJwTbufROF9RF7r7S5=tUvkkXf9ZeMqJYmteA@mail.gmail.com>
Subject: Re: [PATCH 01/30] drm/amd/display/dc/dc_helper: Include our own
 header, containing prototypes
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
Cc: Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Noah Abradjian <noah.abradjian@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMTMsIDIwMjEgYXQgMzowOCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNfaGVscGVyLmM6Mjk5OjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGdlbmVyaWNfcmVnX2dldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmM6MzA3OjEwOiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGdlbmVyaWNfcmVnX2dldDLigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5
L2RjL2RjX2hlbHBlci5jOjMxNzoxMDogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhnZW5lcmljX3JlZ19nZXQz4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY19oZWxwZXIuYzozMjk6MTA6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZ2VuZXJpY19yZWdfZ2V0NOKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvZGMvZGNfaGVscGVyLmM6MzQzOjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmGdlbmVyaWNfcmVnX2dldDXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjX2hlbHBlci5jOjM1OTox
MDogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhnZW5lcmljX3JlZ19nZXQ2
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY19oZWxwZXIuYzozNzc6MTA6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYZ2VuZXJpY19yZWdfZ2V0N+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmM6
Mzk3OjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGdlbmVyaWNfcmVn
X2dldDjigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjX2hlbHBlci5jOjUwMzo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmGdlbmVyaWNfd3JpdGVfaW5kaXJlY3RfcmVn4oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9k
Yy9kY19oZWxwZXIuYzo1MTE6MTA6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYZ2VuZXJpY19yZWFkX2luZGlyZWN0X3JlZ+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmM6NTI5
OjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGdlbmVyaWNfaW5kaXJl
Y3RfcmVnX2dldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmM6NTYwOjEwOiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGdlbmVyaWNfaW5kaXJlY3RfcmVnX3VwZGF0ZV9leOKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBD
YzogTm9haCBBYnJhZGppYW4gPG5vYWguYWJyYWRqaWFuQGFtZC5jb20+Cj4gQ2M6IFJvZHJpZ28g
U2lxdWVpcmEgPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAg
VGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
X2hlbHBlci5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19oZWxwZXIuYwo+IGluZGV4IDU3ZWRiMjVm
YzM4MTIuLmE2MTJiYTZkYzM4OTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjX2hlbHBlci5jCj4gQEAgLTM0LDYgKzM0LDcgQEAKPgo+ICAjaW5jbHVkZSAiZGMuaCIK
PiAgI2luY2x1ZGUgImRjX2RtdWJfc3J2LmgiCj4gKyNpbmNsdWRlICJyZWdfaGVscGVyLmgiCj4K
PiAgc3RhdGljIGlubGluZSB2b2lkIHN1Ym1pdF9kbXViX3JlYWRfbW9kaWZ5X3dyaXRlKAo+ICAg
ICAgICAgc3RydWN0IGRjX3JlZ19oZWxwZXJfc3RhdGUgKm9mZmxvYWQsCj4gLS0KPiAyLjI1LjEK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
