Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE52C911C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744C289D00;
	Mon, 30 Nov 2020 22:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AE589CF8;
 Mon, 30 Nov 2020 22:31:07 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id h3so16006495oie.8;
 Mon, 30 Nov 2020 14:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6axFwa4jYEHmjVpGCVL9P267wNGg+Z8nK+eBebSlIQ8=;
 b=mpwz8hPQUUANXLM+Az3Jnne0uhc/dNdAZqUPcL/aO9nAJ8r2aN8/F4tzmkPkPfu4yw
 JSVsDQGGsCBilS+yl6EkVtRGgFZQXjQFmqz3Yh9/M83bTe/GdLeZvLtzMRvpW7dc20VP
 dHL3G8KEhRLa06V0MUztAPPrsmQ01ejbX+vqZjeyxPu3KrDjiS45cDUKqTTytf2M++vK
 JHyQO8Od/jGS1alTXtnVEhBTxEmjsB2Z2Z4dwKMNbsSgk/UUIeN5UOUraUGm1gHSjSBR
 LYDdrhv4XGg1rslyeFuOsKsV5sGhQ/mKj+clv7UdVxc/lr+GKbWvyCrYhQanV1gk+vCb
 /+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6axFwa4jYEHmjVpGCVL9P267wNGg+Z8nK+eBebSlIQ8=;
 b=boPQQdix/PUBJK1ehHgt/N0RtTATCpJV0nWEtA1fz5by6AnSvz4Lww0PTM+O+sCG3B
 ZNlR16V+UIrG0Uud3Mc4KlR7uwmvhRpX4RoL3AcPpCkMRD6oZK7FL56y90bUPJT1kTa+
 rtZlTlWHYYO3D6Pc0Ve8mYQKNCvz1hgQOM34rCW6JC5djoJjLr/zWEoSWeAG1ikG2AZB
 3rch1VKqhrll5MOxqr0JcZfkRQiHDfC8MThuGN2tJNhq3pd116isys7uXqBaNSEnytzR
 IiWk0CGPgkk0d+ma0A9Rv5vtqi4oG/O5ih67PTUDEE55sg1vMzzNavaRUGkUXQfuWtfX
 kyDg==
X-Gm-Message-State: AOAM5330l5spZ1BicIgHMZDiEjkbf3gPm2/19QD2HBMiAGiw6sjJKV1w
 n9+LHIlEldzKVwXmNS2iQ/1GBHw6RBUwF186+HM=
X-Google-Smtp-Source: ABdhPJz+RMb175/ocrV0ND3r0KcHMsc1iBrnmvlAuhIHG9qAafkYK3PGhD1YFhiowR4RIw83/KNz/Mq6XFFpNsCHBDY=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr931942oib.120.1606775467209; 
 Mon, 30 Nov 2020 14:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-23-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-23-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:30:55 -0500
Message-ID: <CADnq5_NX8=X-naMvn9pA--rjSDmZ_xiXYWfUSgoPJKFeN_6A0g@mail.gmail.com>
Subject: Re: [PATCH 22/40] drm/amd/amdgpu/amdgpu_uvd: Fix some function
 documentation headers
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYzo5
NTogd2FybmluZzogY2Fubm90IHVuZGVyc3RhbmQgZnVuY3Rpb24gcHJvdG90eXBlOiAnc3RydWN0
IGFtZGdwdV91dmRfY3NfY3R4ICcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3V2ZC5jOjU1NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWRldicg
bm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3V2ZF9jc19tc2dfZGVjb2RlJwo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXZkLmM6MTAxMjogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnaWJfaWR4JyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfdXZkX3Jp
bmdfcGFyc2VfY3MnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91dmQuYzox
Mjg2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd0aW1lb3V0JyBub3Qg
ZGVzY3JpYmVkIGluICdhbWRncHVfdXZkX3JpbmdfdGVzdF9pYicKPgo+IENjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQg
U2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5h
cm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
CkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdXZkLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV91dmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91dmQuYwo+IGluZGV4IGY4YmViZjE4ZWUzNjIuLmY4ZjAzODRhOGQ5YWQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3V2ZC5jCj4gQEAgLTg3LDcgKzg3LDcgQEAKPiAg
I2RlZmluZSBVVkRfTk9fT1AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAzZmYKPiAg
I2RlZmluZSBVVkRfQkFTRV9TSSAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDM4MDAKPgo+
IC0vKioKPiArLyoKPiAgICogYW1kZ3B1X3V2ZF9jc19jdHggLSBDb21tYW5kIHN1Ym1pc3Npb24g
cGFyc2VyIGNvbnRleHQKPiAgICoKPiAgICogVXNlZCBmb3IgZW11bGF0aW5nIHZpcnR1YWwgbWVt
b3J5IHN1cHBvcnQgb24gVVZEIDQuMi4KPiBAQCAtNTQ1LDggKzU0NSw4IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3V2ZF9jc19wYXNzMShzdHJ1Y3QgYW1kZ3B1X3V2ZF9jc19jdHggKmN0eCkKPiAgLyoq
Cj4gICAqIGFtZGdwdV91dmRfY3NfbXNnX2RlY29kZSAtIGhhbmRsZSBVVkQgZGVjb2RlIG1lc3Nh
Z2UKPiAgICoKPiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgKiBAbXNnOiBw
b2ludGVyIHRvIG1lc3NhZ2Ugc3RydWN0dXJlCj4gLSAqIEBidWZfc2l6ZXM6IHJldHVybmVkIGJ1
ZmZlciBzaXplcwo+ICAgKgo+ICAgKiBQZWVrIGludG8gdGhlIGRlY29kZSBtZXNzYWdlIGFuZCBj
YWxjdWxhdGUgdGhlIG5lY2Vzc2FyeSBidWZmZXIgc2l6ZXMuCj4gICAqLwo+IEBAIC0xMDA1LDYg
KzEwMDUsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV91dmRfY3NfcGFja2V0cyhzdHJ1Y3QgYW1kZ3B1
X3V2ZF9jc19jdHggKmN0eCwKPiAgICogYW1kZ3B1X3V2ZF9yaW5nX3BhcnNlX2NzIC0gVVZEIGNv
bW1hbmQgc3VibWlzc2lvbiBwYXJzZXIKPiAgICoKPiAgICogQHBhcnNlcjogQ29tbWFuZCBzdWJt
aXNzaW9uIHBhcnNlciBjb250ZXh0Cj4gKyAqIEBpYl9pZHg6IFdoaWNoIGluZGlyZWN0IGJ1ZmZl
ciB0byB1c2UKPiAgICoKPiAgICogUGFyc2UgdGhlIGNvbW1hbmQgc3RyZWFtLCBwYXRjaCBpbiBh
ZGRyZXNzZXMgYXMgbmVjZXNzYXJ5Lgo+ICAgKi8KPiBAQCAtMTI3OSw2ICsxMjgwLDcgQEAgdm9p
ZCBhbWRncHVfdXZkX3JpbmdfZW5kX3VzZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4gICAq
IGFtZGdwdV91dmRfcmluZ190ZXN0X2liIC0gdGVzdCBpYiBleGVjdXRpb24KPiAgICoKPiAgICog
QHJpbmc6IGFtZGdwdV9yaW5nIHBvaW50ZXIKPiArICogQHRpbWVvdXQ6IHRpbWVvdXQgdmFsdWUg
aW4gamlmZmllcywgb3IgTUFYX1NDSEVEVUxFX1RJTUVPVVQKPiAgICoKPiAgICogVGVzdCBpZiB3
ZSBjYW4gc3VjY2Vzc2Z1bGx5IGV4ZWN1dGUgYW4gSUIKPiAgICovCj4gLS0KPiAyLjI1LjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
