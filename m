Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34642AE421
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146BF89CE3;
	Tue, 10 Nov 2020 23:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0797D89CE1;
 Tue, 10 Nov 2020 23:34:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so301860wrw.10;
 Tue, 10 Nov 2020 15:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gZj8Bm71tJcSxjRihZFAmVL0neWjtvcosDTRkeYcBUg=;
 b=fqk08pPiTtoirrTxKn7wHrsESbAWYleBXL518w2NjEaEKEqBwPwwmqBu64vJnjTm74
 rO/X8+CmGyrzfjKIWyVYA/reQu8owiK2OtQybHubIe/BwqSZOdA7cIaNikxjbEBA2u46
 2hVA9FhoXusWA17MLZfsiquGB37nyBfc8uobXOVeANVWCchiNJginAGgYNXKMRgHRoBw
 uhzWETTNYRQVZak3wJHHeO1eWP+sYqB2M6WCFQTvw4CiDg7dpgmQpUUwSmF+HPt1w6Ih
 6x6V9R0Y4tY8mIPtDiZHxoAjczmabNIaVZiCI58XygjSZjlGq4xQhryWZN3PD0ZFi6x4
 ldqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gZj8Bm71tJcSxjRihZFAmVL0neWjtvcosDTRkeYcBUg=;
 b=AAa5yW/An8YtDM9AuN+v8d8BFD4lCIAXgYEMxZmR2VjDE6/hT9s9UdkU533LNo7WI+
 cSXl+BuVQhERwbWl1LUmHWoB20q8ZoZ0Ukj6gnVY1jiMMNyIenNqN2So8QVPNTjXjZCj
 LPDgKKnJvFOnNRV6wWGNkRmm/P9GBOp0N8lM2rAitjRSVJSNfJIR305EF+eMhAC4NHKK
 DmrjLLswVQ4FH8yoYOYHkpjIHXPwpSOzsZi+uD3xUskqiIkNOqgXFUc6cUuw9B0/JN1v
 Siyn66079JSFPc830D3zSkakwgVZwFx9l+QIPEOPVV+I4xExBEGycwZDh2eKE68eWDgt
 ga5Q==
X-Gm-Message-State: AOAM530woN+MOoVMDUPeDWFPQmnAOJeqDU8RjQVDBWcb9jjltFtY9+Oq
 asjSAV+StowKWnMTyLPdqA9PxZc+9/kmF8qdHz8=
X-Google-Smtp-Source: ABdhPJz4u2gyk5XUiRriePPfm6Svh6JwCdua12mAjhsZRb4vezo2M6oG4xGdKIfaOx1lYHehvGfUhF/xc2ndZQ7WarA=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr28093388wrn.124.1605051247731; 
 Tue, 10 Nov 2020 15:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-6-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:33:55 -0500
Message-ID: <CADnq5_NWwwPKQZi2kZ9pCXxMq4_qq7u_XHQn6fQZmR+8D18LfQ@mail.gmail.com>
Subject: Re: [PATCH 05/30] drm/radeon/cik: Remove set but unused variable
 'mc_shared_chmap'
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

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmM6IEluIGZ1bmN0aW9u
IOKAmGNpa19ncHVfaW5pdOKAmToKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYzozMTgw
OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmG1jX3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwg
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGll
ZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMg
fCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYwo+IGluZGV4IDQ0OTRmOTEyMmZkOTEuLmI5NGUyZTY3OGYy
NTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKPiBAQCAtMzE3Nyw3ICszMTc3LDcgQEAgc3RhdGlj
IHZvaWQgY2lrX3NldHVwX3JiKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICBzdGF0aWMg
dm9pZCBjaWtfZ3B1X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gIHsKPiAgICAg
ICAgIHUzMiBnYl9hZGRyX2NvbmZpZyA9IFJSRUczMihHQl9BRERSX0NPTkZJRyk7Cj4gLSAgICAg
ICB1MzIgbWNfc2hhcmVkX2NobWFwLCBtY19hcmJfcmFtY2ZnOwo+ICsgICAgICAgdTMyIG1jX2Fy
Yl9yYW1jZmc7Cj4gICAgICAgICB1MzIgaGRwX2hvc3RfcGF0aF9jbnRsOwo+ICAgICAgICAgdTMy
IHRtcDsKPiAgICAgICAgIGludCBpLCBqOwo+IEBAIC0zMjcwLDcgKzMyNzAsNyBAQCBzdGF0aWMg
dm9pZCBjaWtfZ3B1X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4KPiAgICAgICAg
IFdSRUczMihCSUZfRkJfRU4sIEZCX1JFQURfRU4gfCBGQl9XUklURV9FTik7Cj4KPiAtICAgICAg
IG1jX3NoYXJlZF9jaG1hcCA9IFJSRUczMihNQ19TSEFSRURfQ0hNQVApOwo+ICsgICAgICAgUlJF
RzMyKE1DX1NIQVJFRF9DSE1BUCk7Cj4gICAgICAgICBtY19hcmJfcmFtY2ZnID0gUlJFRzMyKE1D
X0FSQl9SQU1DRkcpOwo+Cj4gICAgICAgICByZGV2LT5jb25maWcuY2lrLm51bV90aWxlX3BpcGVz
ID0gcmRldi0+Y29uZmlnLmNpay5tYXhfdGlsZV9waXBlczsKPiAtLQo+IDIuMjUuMQo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
