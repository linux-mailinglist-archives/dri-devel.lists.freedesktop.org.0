Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA52F3C75
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3022898A7;
	Tue, 12 Jan 2021 22:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2160898A7;
 Tue, 12 Jan 2021 22:42:39 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id x5so51926otp.9;
 Tue, 12 Jan 2021 14:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xTZum8U0xk9Dv1ypU93b7U3IcnwqshFIm7jl0nQp/ts=;
 b=H06c+s7+WWGU+D06Ioperjhl/8SSc8YaU8M4PWbl+EryEum2lFEFon5iv7u3tRqJhw
 Yc6wyTiDnTdw+ITsTG8vSQn9kOiVFOUqTf1OGwez9w3sFGsVZG4F4DzW3mD2GmqXXZvR
 vnUCe1QDlSKSgXq05xpamhKzPtcimteaa3krWD7ZPW+d+crcdaerMnB5+V0ViYkFOJk7
 QCRB0VntnSw4s9mLHxc5Gd3Uh5zfLSaWFQCzkg+wM6BN0JQ6oHL9WOJr6QihS2kweWmr
 zi3ZzjF0r05oqEXuPl282FwROWBhcRyQQ3FXWRfBIY0+jZpiXNEuWrX9SchGTWuRQMLj
 cE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xTZum8U0xk9Dv1ypU93b7U3IcnwqshFIm7jl0nQp/ts=;
 b=kOxQaLuluI27L5Y6FAmcYwsnew5j+u0kHPSgzM8VCIBNZwAJsPrG49R/9DVwh/mOKD
 Yf5qR+XtXOZ4X5B8rJ/CqEKPgujEbpxdWMtRT4mjaKrzoiF7VjICqy6IUxNpvr2K7T5p
 Ky/RWYLTRwbfH6LuIkja/A2wcnmlUmLwK2M/a/bouf5m3SJKJwqa4QpGSdsE9il2v476
 Xlq3josWBoSQIzAbELomoGDNDBZH31/+pOYSM8tNx+Tz1/cwDJjirv/aIse4nVXvhyBp
 XFNRrNkZz0ILeOE16xm5T5OB0qQUiaW+dQes/wqamvPR0IIK+KmWsZfUVnRi1i/+HhEz
 61Yw==
X-Gm-Message-State: AOAM531EVNFMBTKexx0sTUh9hzCHIXV0km3+UDITk4z6HK5CUsnFaUFF
 soo1o6jXphmNXYi5XH8Pycvh1ODkse3pUkqbOcKvRgIR
X-Google-Smtp-Source: ABdhPJzaDe5yB/AAARqzGaTQA9vtvGwegQaGYAq/U+VyAbWoqTelxSadDrYrvrMhtNS7jYigiMWMeexj0XqYStq2KqM=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr1156947ote.132.1610491359167; 
 Tue, 12 Jan 2021 14:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-41-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-41-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:42:27 -0500
Message-ID: <CADnq5_NFY8cfqYcKCrd+Qxw6z7zmiXfbm9TeQGZ0uFc+8-eWHA@mail.gmail.com>
Subject: Re: [PATCH 40/40] drm/amd/display/dc/core/dc_stream: Demote
 non-conformant kernel-doc headers
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y29yZS9kY19zdHJlYW0uYzoyNTM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ3BTdHJlYW0nIG5vdCBkZXNjcmliZWQgaW4gJ2RjX29wdGltaXplX3RpbWluZ19mb3JfZnNm
dCcKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX3N0
cmVhbS5jOjI1Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbWF4X2lu
cHV0X3JhdGVfaW5fa2h6JyBub3QgZGVzY3JpYmVkIGluICdkY19vcHRpbWl6ZV90aW1pbmdfZm9y
X2ZzZnQnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9k
Y19zdHJlYW0uYzoyNzA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3N0
cmVhbScgbm90IGRlc2NyaWJlZCBpbiAnZGNfc3RyZWFtX3NldF9jdXJzb3JfYXR0cmlidXRlcycK
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVh
bS5jOjI3MDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYXR0cmlidXRl
cycgbm90IGRlc2NyaWJlZCBpbiAnZGNfc3RyZWFtX3NldF9jdXJzb3JfYXR0cmlidXRlcycKPgo+
IENjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpB
bGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJl
YW0uYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19zdHJlYW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X3N0cmVhbS5jCj4gaW5kZXggYzEwM2Y4NTgzNzVkMC4uMjVmYTcxMmE3ODQ3NCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jCj4gQEAg
LTI0NCw3ICsyNDQsNyBAQCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXR1cyAqZGNfc3RyZWFtX2dldF9z
dGF0dXMoCj4gIH0KPgo+ICAjaWZuZGVmIFRSSU1fRlNGVAo+IC0vKioKPiArLyoKPiAgICogZGNf
b3B0aW1pemVfdGltaW5nX2Zvcl9mc2Z0KCkgLSBkYyB0byBvcHRpbWl6ZSB0aW1pbmcKPiAgICov
Cj4gIGJvb2wgZGNfb3B0aW1pemVfdGltaW5nX2Zvcl9mc2Z0KAo+IEBAIC0yNjAsOCArMjYwLDcg
QEAgYm9vbCBkY19vcHRpbWl6ZV90aW1pbmdfZm9yX2ZzZnQoCj4gIH0KPiAgI2VuZGlmCj4KPiAt
Cj4gLS8qKgo+ICsvKgo+ICAgKiBkY19zdHJlYW1fc2V0X2N1cnNvcl9hdHRyaWJ1dGVzKCkgLSBV
cGRhdGUgY3Vyc29yIGF0dHJpYnV0ZXMgYW5kIHNldCBjdXJzb3Igc3VyZmFjZSBhZGRyZXNzCj4g
ICAqLwo+ICBib29sIGRjX3N0cmVhbV9zZXRfY3Vyc29yX2F0dHJpYnV0ZXMoCj4gLS0KPiAyLjI1
LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
