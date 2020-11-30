Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C771B2C914B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A166B89A94;
	Mon, 30 Nov 2020 22:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF3989A94;
 Mon, 30 Nov 2020 22:40:26 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z23so9314178oti.13;
 Mon, 30 Nov 2020 14:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=50JdvhZ42NrkUvTPJM76VPGoZpSHnY0FKQ/KiUd0NKg=;
 b=aL7d5kpJbAboGQNZ4erj7W+womhuvoI98UQJ1ed4u6FmgdDJufOBQD3kN340AIk7JR
 rnvcGGp4doHd5lKfHWSmIQ2Y3vCbKEbwZOUFcqbybgnUmo+/t4RW2e8yDssGnKvh40PI
 ZH2ltkRcyA49Mizhc+PEJti8VqmGgppnvTX+HuEy89mshrnTyibGa/SQaDF4SwykrBZb
 DoyJE8qtaDCkID1oed9BXs3SUrBRveNG9t9cwBvwouI5WOmJ2uknHHc+HLwt8/cuhXSO
 omXhynPZxSoZ5C4+f9D1oBFC1EBTwicqvAsPlcMq4hIESED7foIBFNR4qQTBhHEOLqBq
 8PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=50JdvhZ42NrkUvTPJM76VPGoZpSHnY0FKQ/KiUd0NKg=;
 b=iVUVsbzhSRhqX/cL1PhGrJjIr0lZpZNl5iJW8iOnhCcxCi1d7UyGLppupHJ7ut0vAv
 V8PZXf23Q8NEVmELENIIxW8bqGWpHSHSW0bmdsgoxfWOnTjLzRf6sd/KKLScoSN1EtLr
 dP9h8hJgOOJJN0ZP8/p9fnzyE4i7p6HfZx7VSxm7oN/SXLBz/mocr6K4jaUTQXg4yuH/
 89u+54enTriLRdpQtyjXHui82sJPCK0DY0FTjgtfWWT3hvrvMBslOhe15OUFu4vxybn3
 mJKdK2NwzDgK2YaULz5th8ckqFg3TF9hZWrbldDT2e3iVWjHokGoMj7/QAlVrOYfC9hy
 zNtg==
X-Gm-Message-State: AOAM532E7N5MkEqNran/4h1nPo5zpyBWo6Tg8pqhyma8Ev+GGdkujweB
 gqDgYP5ck1Put2x+ZGXxkKH3Ltt5lD0Z4zZTW7I=
X-Google-Smtp-Source: ABdhPJybFFuoCAgH8TDXZA9Ucz4zcLBH+CqhSKIXJXxKqxiielOTa50ygJxobWvmg3HDZpE2zPcFWuvtyL0Utu+x5Xg=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19235858otf.132.1606776025441; 
 Mon, 30 Nov 2020 14:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-29-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-29-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:40:14 -0500
Message-ID: <CADnq5_MD6fpoQCvWYiXbhvCCwGKfJobUXfXLkTRo+pZN3XJViA@mail.gmail.com>
Subject: Re: [PATCH 28/40] drm/amd/amdgpu/gfx_v10_0: Make local function
 'gfx_v10_0_rlc_stop()' static
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

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jOjUw
MDg6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhnZnhfdjEwXzBfcmxj
X3N0b3DigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwg
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGll
ZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4gaW5kZXgg
ZDQ3NjBmNGUyNjlhMS4uOWViODg2YWU1YTM1ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jCj4gQEAgLTUwMDUsNyArNTAwNSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Yx
MF8wX2luaXRfY3NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPgo+IC12b2lkIGdmeF92MTBfMF9ybGNfc3RvcChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKPiArc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3JsY19zdG9wKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ICB7Cj4gICAgICAgICB1MzIgdG1wID0gUlJFRzMyX1NPQzE1KEdDLCAw
LCBtbVJMQ19DTlRMKTsKPgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
