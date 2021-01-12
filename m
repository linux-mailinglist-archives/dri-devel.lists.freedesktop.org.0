Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA92F3C58
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89CC89938;
	Tue, 12 Jan 2021 22:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898E589491;
 Tue, 12 Jan 2021 22:30:52 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id n42so8660ota.12;
 Tue, 12 Jan 2021 14:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dF0yJHbbjBb5erCUCeH3GN84OQvrBthurVO49Uciku8=;
 b=guZqN+mctqBHsmD4I1QYDAt214jwEM9rS8OLOeLW+xtLapW6NBfmy6T6Qmer5EXYX5
 bFU5yxZlS/4SQGnqmm+FYm/toyJAHTqC29K4CBVguL7xxAiV1g2zPhwKR3YDCK6N9fp2
 rKqtJKywncWwhmwG5qEb8a3O5NnGn7iF4+5PXzfzosPAVNRB14v38jmsRBWPLLizQGWx
 U/Xl4Xcwc9ySRHWeO3tSyHdy/jk7JpYEns3iU9kn3d8Nd/r7v4S7L3sDjSy9+58NasJq
 75II5u4p71BsRc0gZKoNzz4AHnbwpvcSYbo9zyURaWmTK5329nKuzDkgA+b4Km5Rh+HA
 2G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dF0yJHbbjBb5erCUCeH3GN84OQvrBthurVO49Uciku8=;
 b=X79ldEsxG9FTApZdUbIYmqUB4AAi4yYfmy6SOlvhZQbPkrP35nTb8A0rZgUeSNgIqF
 7k1fPf1HM85yQiviluYpdc6mmPYCopPT9Kmgi4cQRuDX2En1/Q0UDmYYbTEvE5R/+usw
 xVRDboNcv9mJljkw9WpX31CDP+Q8AbJmjmRoNRCxEkpQj+uSfNDP5sP9tR5wxCsEvE5K
 rz1bR6Zel+sJvGjm4cGHM3gWhosC23gGhNHNfcIwuomRYXGLKP5B1ZJ4OlREmHJw9mH6
 P5VP5qVxGuOgrQJVMFgWJ5oinpXEf90behUPr86OvXw+l0yuS0saECOyeTikRdAT83Ht
 lmYA==
X-Gm-Message-State: AOAM530fM+nc7LOlruBQZUzbcGXOdrJc6sxlGHLQESLAej13zxb4QAaD
 lAV6s5h/cz9/FTyE0/TD+Hnper+pbhYvsMKr51Y=
X-Google-Smtp-Source: ABdhPJxzlQ64G4f7mRpozXG0VzDdJ19+FRvpX5WO0g/YmLDMV9Q/xGD8xgDV5U8nKOQwoq2ri/50wVVgpdH0Y6gwfaA=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr1044535otl.311.1610490651899; 
 Tue, 12 Jan 2021 14:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-28-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-28-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:30:40 -0500
Message-ID: <CADnq5_Pk++N2Ary324cEAdUFvFS0QF4VO7DumuiD9rYmF2Jyzg@mail.gmail.com>
Subject: Re: [PATCH 27/40] drm/amd/display/dc/dce110/dce110_compressor: Strip
 out unused function 'controller_id_to_index'
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
ZGNlMTEwL2RjZTExMF9jb21wcmVzc29yLmM6NDI5OjE0OiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yIOKAmGNvbnRyb2xsZXJfaWRfdG9faW5kZXjigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+
IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gVGhhbmtzIQoKQWxleAoKCj4g
LS0tCj4gIC4uLi9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2NvbXByZXNzb3IuYyB8IDI1
IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNl
MTEwX2NvbXByZXNzb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX2NvbXByZXNzb3IuYwo+IGluZGV4IDE4YjBhNjliMGIxZTguLjQ0NTY0YTQ3NDJiNTIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2Ux
MTBfY29tcHJlc3Nvci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTExMC9kY2UxMTBfY29tcHJlc3Nvci5jCj4gQEAgLTQyNSwzMSArNDI1LDYgQEAgdm9pZCBnZXRf
bWF4X3N1cHBvcnRfZmJjX2J1ZmZlcnNpemUodW5zaWduZWQgaW50ICptYXhfeCwgdW5zaWduZWQg
aW50ICptYXhfeSkKPiAgICAgICAgICAqLwo+ICB9Cj4KPiAtCj4gLXVuc2lnbmVkIGludCBjb250
cm9sbGVyX2lkX3RvX2luZGV4KGVudW0gY29udHJvbGxlcl9pZCBjb250cm9sbGVyX2lkKQo+IC17
Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgaW5kZXggPSAwOwo+IC0KPiAtICAgICAgIHN3aXRjaCAo
Y29udHJvbGxlcl9pZCkgewo+IC0gICAgICAgY2FzZSBDT05UUk9MTEVSX0lEX0QwOgo+IC0gICAg
ICAgICAgICAgICBpbmRleCA9IDA7Cj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAg
Y2FzZSBDT05UUk9MTEVSX0lEX0QxOgo+IC0gICAgICAgICAgICAgICBpbmRleCA9IDE7Cj4gLSAg
ICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgY2FzZSBDT05UUk9MTEVSX0lEX0QyOgo+IC0g
ICAgICAgICAgICAgICBpbmRleCA9IDI7Cj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAg
ICAgY2FzZSBDT05UUk9MTEVSX0lEX0QzOgo+IC0gICAgICAgICAgICAgICBpbmRleCA9IDM7Cj4g
LSAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgZGVmYXVsdDoKPiAtICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gLSAgICAgICB9Cj4gLSAgICAgICByZXR1cm4gaW5kZXg7Cj4gLX0KPiAtCj4g
LQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXByZXNzb3JfZnVuY3MgZGNlMTEwX2NvbXByZXNz
b3JfZnVuY3MgPSB7Cj4gICAgICAgICAucG93ZXJfdXBfZmJjID0gZGNlMTEwX2NvbXByZXNzb3Jf
cG93ZXJfdXBfZmJjLAo+ICAgICAgICAgLmVuYWJsZV9mYmMgPSBkY2UxMTBfY29tcHJlc3Nvcl9l
bmFibGVfZmJjLAo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
