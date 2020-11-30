Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26282C90B5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181948972C;
	Mon, 30 Nov 2020 22:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231A58972C;
 Mon, 30 Nov 2020 22:12:16 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id f48so4397176otf.8;
 Mon, 30 Nov 2020 14:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b6cW600D3AdtI4dxch+V0CvHl/L1hc8DgKLicXldcyE=;
 b=uP8r4KF/iPSPgSAL2eeX+38BNuoBBZ7WxsB3MyXavd6tHtbge0x157ZkkUsbp1+SGc
 uIWN9U6XADxT1kQ3y13NLuuzCiEnWUALOa5R6dKheQkeu0UnfC7AqDEzAVwh1AoBwNLR
 +XTk0rIP9YbrYEaMXrlawdoSsqM/JDAszbHhfoh6iwp74Usp4LD56eORUU56r3iyKcFn
 FJhGw1HdLxZ5QDJtMHdYdTUlQrGAbZWZ5x2vIZ9YrC0WAA96YnCLll1Kosz9lYnpz0mj
 GIl0XOph05Kk1fJQtcX2albqz6VUrV2iVD5E0tj6bdaradDh4AND/X7vpDX2/1jtw0ax
 PWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b6cW600D3AdtI4dxch+V0CvHl/L1hc8DgKLicXldcyE=;
 b=PT8CRdmSRWBN0xS1fhcNSIz2CwfIeRFwcaURPBPsFVZwpIhy4T51OP5bRbKCBpMO7G
 y6aI7WQvqcL9J4ooqrDCO6ZrEPzhq8KCZbWOYHJfNoiKTkL26Bkp/IIjOGe2d+ZhzOk1
 8ggdihqwl1Orak3fuO1s1FhmRUsmDS/kUV4pttx+DLUgEYpHGVdmz+YTnDXpmMuBTw4j
 KdQWsjWLX93rFytRiDqTsFpPhwedbboJT4rADeiLumUOrjwAWSc449VAwLD8LPtdjE6S
 CqTlaDH7xJ1gB6jxZOeD4THMfuKoBs9n47f0zowkEdg1LafApu4zLJlNdTwVpt7hML+7
 pGUQ==
X-Gm-Message-State: AOAM531bY2sfZCQkxxkYeR7Mil2rMrn1Hk8pX+Q/zJPb3JmcIyvlcehg
 vybStHJ9hZ4cL6t2UEnabmj17ELsCW12sogpQio=
X-Google-Smtp-Source: ABdhPJx/35GQhdOnFw7VTCZ+lBVMh3ZBoBITfoOtzcBZzHFCjSoRcnFLao8KkNUGe+ziH7tpEa3K8I38SabcSVIZKuo=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19149396otf.132.1606774335496; 
 Mon, 30 Nov 2020 14:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-13-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-13-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:12:03 -0500
Message-ID: <CADnq5_OigHeSZuZv=EuPdJ8nfx3e1qY0gBYx7oO=kupo7Rqu8Q@mail.gmail.com>
Subject: Re: [PATCH 12/40] drm/amd/amdgpu/dce_v10_0: Supply description for
 function param 'async'
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
 Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92MTBfMC5jOjIz
Nzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYXN5bmMnIG5vdCBkZXNj
cmliZWQgaW4gJ2RjZV92MTBfMF9wYWdlX2ZsaXAnCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IEx1YmVuIFR1aWtvdiA8
bHViZW4udHVpa292QGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgK
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjEwXzAuYyB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RjZV92MTBfMC5jCj4gaW5kZXggZGEyNDBmOGZhZmNmOC4uNzk0NDc4MWUxMDg2YiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjEwXzAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92MTBfMC5jCj4gQEAgLTIyOCw2ICsyMjgs
NyBAQCBzdGF0aWMgdm9pZCBkY2VfdjEwXzBfcGFnZWZsaXBfaW50ZXJydXB0X2Zpbmkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIK
PiAgICogQGNydGNfaWQ6IGNydGMgdG8gY2xlYW51cCBwYWdlZmxpcCBvbgo+ICAgKiBAY3J0Y19i
YXNlOiBuZXcgYWRkcmVzcyBvZiB0aGUgY3J0YyAoR1BVIE1DIGFkZHJlc3MpCj4gKyAqIEBhc3lu
YzogYXN5bmNocm9ub3VzIGZsaXAKPiAgICoKPiAgICogVHJpZ2dlcnMgdGhlIGFjdHVhbCBwYWdl
ZmxpcCBieSB1cGRhdGluZyB0aGUgcHJpbWFyeQo+ICAgKiBzdXJmYWNlIGJhc2UgYWRkcmVzcy4K
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
