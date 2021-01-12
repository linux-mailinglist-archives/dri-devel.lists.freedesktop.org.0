Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA712F3C4F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F4B89AC9;
	Tue, 12 Jan 2021 22:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6F289938;
 Tue, 12 Jan 2021 22:27:00 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id o11so40136ote.4;
 Tue, 12 Jan 2021 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=trCTWdvjHMkvPDEDmT3pUIVTBrdeeOfcyXQgZDcVJx4=;
 b=muS1YPhlz4qgL7ceLFn6pIbbjGWGMgOZza+OnaaW7VlWYR3J2M2OjcCZo3pIV+yafO
 Vf6+DMKqkoS9l84JDL2Yq6/BjkJsySedrz2NXMqRl3eSpop5oU8CLmPzCvyjNvGK+NtE
 Oiw1/e7+KvH9IIYv6as3G6b6zYkXRs0J+PmQ/gpQfXMQLW0Fmz9D0vy4RlebIjHOPnfE
 4hVTAczfzJ7/FStB42OlahmmaPC9AK/b6BPpOVOLy25Yt2VBSwWQfJRFTOSA8OI8Dz1t
 rt+EE1JtqwD1bvCSfcjHw0v1SAuokEG52nhSxuCIj/X0lwdhNcGUQgfhGTAAGwxqc+u/
 6EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=trCTWdvjHMkvPDEDmT3pUIVTBrdeeOfcyXQgZDcVJx4=;
 b=tLDQttkMan/cnsCM2kHRMMM2WNVx48xat+Zmb99hljICbLGxdya+SlM//xYVBF2sx9
 6F8vAyBLky8b64QES/wjP3NwRrNZV1s76FWKlT3cO4YzuHGTbGsvK6uf9AysjZE50ZFG
 TBm53sxKJd7PaOL7yzwyuKnNEVmN/wlgoaWe3SsTwDlN4NXsdqxRUpojU0w2w5TRPu2J
 i9qM8OUX8fbBAcqHUInfWwiwjfr7pB7eE4b9S775zuCgIcsJTaKzyOggU3h+GfmfVKTh
 sJ9sTII88u1Bs6axkX/nuhw22kMa/Q7bQrcBB+JEguGKJ/Jx7/On0V99pTp4+2p4vGqf
 7c4g==
X-Gm-Message-State: AOAM531RxT2M5CjGlww9lwu1HXusSPcs3c0xSPosR678PK2C6FH8QJQd
 DDDAgsNk3JhgywGgD30od84/2tb8ERYrMjMShfI=
X-Google-Smtp-Source: ABdhPJwLdnpdw0ja1Ltjtm14wSKYzVapg2AKCaNpZpS7lOKMqBsG7IHq4Nher6CTSy1VnNs1FVkIKuBYnjRMgAjviFI=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr1051458otb.23.1610490419441; 
 Tue, 12 Jan 2021 14:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-26-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-26-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:26:47 -0500
Message-ID: <CADnq5_MDnYtb_zxUQfqgbDKvzHuPRdBPDj=BRBGPPme_6aa30A@mail.gmail.com>
Subject: Re: [PATCH 25/40] drm/amd/display/dc/dce120/dce120_timing_generator:
 Remove unused function 'dce120_timing_generator_get_position'
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
ZGNlMTIwL2RjZTEyMF90aW1pbmdfZ2VuZXJhdG9yLmM6NjAyOjEzOiB3YXJuaW5nOiDigJhkY2Ux
MjBfdGltaW5nX2dlbmVyYXRvcl9nZXRfcG9zaXRpb27igJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWZ1bmN0aW9uXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgo+IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5r
cyEKCkFsZXgKCj4gLS0tCj4gIC4uLi9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3Iu
YyAgICAgICB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQzIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3RpbWluZ19nZW5lcmF0b3IuYwo+IGluZGV4IGQwMmVj
Yjk4M2M5Y2QuLmI1N2M0NjYxMjRlNzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfdGltaW5nX2dlbmVyYXRvci5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfdGltaW5nX2dlbmVyYXRv
ci5jCj4gQEAgLTU4OSw0OSArNTg5LDYgQEAgc3RhdGljIHZvaWQgZGNlMTIwX3RpbWluZ19nZW5l
cmF0b3Jfc2V0X2RycigKPiAgICAgICAgIH0KPiAgfQo+Cj4gLS8qCj4gLSAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgo+IC0gKiAgRnVuY3Rpb246IGRjZTEyMF90aW1pbmdfZ2VuZXJhdG9yX2dldF9wb3Np
dGlvbgo+IC0gKgo+IC0gKiAgQGJyaWVmCj4gLSAqICAgICBSZXR1cm5zIENSVEMgdmVydGljYWwv
aG9yaXpvbnRhbCBjb3VudGVycwo+IC0gKgo+IC0gKiAgQHBhcmFtIFtvdXRdIHBvc2l0aW9uCj4g
LSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgo+IC0gKi8KPiAtc3RhdGljIHZvaWQgZGNlMTIwX3RpbWlu
Z19nZW5lcmF0b3JfZ2V0X3Bvc2l0aW9uKHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZywKPiAt
ICAgICAgIHN0cnVjdCBjcnRjX3Bvc2l0aW9uICpwb3NpdGlvbikKPiAtewo+IC0gICAgICAgdWlu
dDMyX3QgdmFsdWU7Cj4gLSAgICAgICBzdHJ1Y3QgZGNlMTEwX3RpbWluZ19nZW5lcmF0b3IgKnRn
MTEwID0gRENFMTEwVEdfRlJPTV9URyh0Zyk7Cj4gLQo+IC0gICAgICAgdmFsdWUgPSBkbV9yZWFk
X3JlZ19zb2MxNSgKPiAtICAgICAgICAgICAgICAgICAgICAgICB0Zy0+Y3R4LAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG1tQ1JUQzBfQ1JUQ19TVEFUVVNfUE9TSVRJT04sCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgdGcxMTAtPm9mZnNldHMuY3J0Yyk7Cj4gLQo+IC0gICAgICAgcG9zaXRp
b24tPmhvcml6b250YWxfY291bnQgPSBnZXRfcmVnX2ZpZWxkX3ZhbHVlKAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIHZhbHVlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIENSVEMwX0NSVENf
U1RBVFVTX1BPU0lUSU9OLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIENSVENfSE9SWl9DT1VO
VCk7Cj4gLQo+IC0gICAgICAgcG9zaXRpb24tPnZlcnRpY2FsX2NvdW50ID0gZ2V0X3JlZ19maWVs
ZF92YWx1ZSgKPiAtICAgICAgICAgICAgICAgICAgICAgICB2YWx1ZSwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBDUlRDMF9DUlRDX1NUQVRVU19QT1NJVElPTiwKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBDUlRDX1ZFUlRfQ09VTlQpOwo+IC0KPiAtICAgICAgIHZhbHVlID0gZG1fcmVhZF9y
ZWdfc29jMTUoCj4gLSAgICAgICAgICAgICAgICAgICAgICAgdGctPmN0eCwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBtbUNSVEMwX0NSVENfTk9NX1ZFUlRfUE9TSVRJT04sCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgdGcxMTAtPm9mZnNldHMuY3J0Yyk7Cj4gLQo+IC0gICAgICAgcG9zaXRp
b24tPm5vbWluYWxfdmNvdW50ID0gZ2V0X3JlZ19maWVsZF92YWx1ZSgKPiAtICAgICAgICAgICAg
ICAgICAgICAgICB2YWx1ZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICBDUlRDMF9DUlRDX05P
TV9WRVJUX1BPU0lUSU9OLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIENSVENfVkVSVF9DT1VO
VF9OT00pOwo+IC19Cj4gLQo+IC0KPiAgc3RhdGljIHZvaWQgZGNlMTIwX3RpbWluZ19nZW5lcmF0
b3JfZ2V0X2NydGNfc2Nhbm91dHBvcygKPiAgICAgICAgIHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9y
ICp0ZywKPiAgICAgICAgIHVpbnQzMl90ICp2X2JsYW5rX3N0YXJ0LAo+IC0tCj4gMi4yNS4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
