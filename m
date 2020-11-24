Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23422C2BF4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC7B6E47B;
	Tue, 24 Nov 2020 15:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EC66E466;
 Tue, 24 Nov 2020 15:53:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r3so4518670wrt.2;
 Tue, 24 Nov 2020 07:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e/uBfFXAMjcZC180lRAsitZyODteJLLmWugwCCe/rOk=;
 b=Tg/D0QFI8FoO/Oi1rP7/jSZv0PzxjsGEczQgKbSNO5QOsZ2MfiWZ9sCtw9gF+k5CFK
 x9IAq2cFc5TTMAgjfzYHeyQHMsU3AmKtkD2Jct59H0IAKoGbPZXbUS3QGO05j+4iTy4b
 d1ZBSA6p0XP166C77JclggsGtxujDGBux7vE0+t0S2AVuUl1OX5OEAZSKyYQ+vf5gsrk
 opDSYzgOXllW7iQ9MoKGnehs7cukOwFEeFhGqqQf+o587KAo+MlORmmwALa2y/yC2qts
 W226YjlrYMHEEissKs8vsAPxJlewUIDsWNbewWQ2wMph32Th2aTDk4/NyOO3mhZE2Mbs
 I89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e/uBfFXAMjcZC180lRAsitZyODteJLLmWugwCCe/rOk=;
 b=D6rnVSW7IAdvdbcX6KGfGTVsNByJu7Y8YlD9+p+WaiIRyKoSpyeeaO8Hx6NwnIULAV
 SbzxYn5IQBkRBPW+GwtLsx7OzCOCTW636PMC2MEt7Sf5sPAPebfm/cjZH1m1lIQVefZT
 Nj0Yie/sVNRC2NftB66vkWV2RceqewMZQCvYznMYb6DrOa65fq1SCGM/Z0/1AOrnZw5S
 FChj8nSzXSMM+hSGtOOv0HgJR6G9zSdNydpKeCSj3sp6MJOpOZIvwkVKjtV+qABFKGIC
 I+Vyu+iB8kMOILli/bCTfA0yLaIkVRmqX9vKegsw8EkpM6pOJIqGzfMsWZaDXrSpP1QV
 CCXw==
X-Gm-Message-State: AOAM533EjR4ompjz3mHbs+yvZYgLQ/BUugcJeq+wvAla002wWixAaLdp
 aT9AubujUZXtCRmOQDub6ga1Mgmi7SBqWQ7ZyEo=
X-Google-Smtp-Source: ABdhPJzJFXGmRvr1DtlCO9sTWvJOkjgpjEZVdOyoAJY7UadTwqlaU91cCJHyJC13q0d5NM1aVYU3+FgZD4KgDmGSm94=
X-Received: by 2002:adf:8028:: with SMTP id 37mr6040018wrk.111.1606233181859; 
 Tue, 24 Nov 2020 07:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-2-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-2-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 10:52:50 -0500
Message-ID: <CADnq5_PaFeyNAc3a8e0MmZRKzPxPQCxGyhD_7TP+jcuPvRt9NQ@mail.gmail.com>
Subject: Re: [PATCH 01/40] drm/radeon/radeon_device: Consume our own header
 where the prototypes are located
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoxOSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jOjYz
Nzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9kZXZpY2Vf
aXNfdmlydHVhbOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBw
bGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2RldmljZS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMKPiBpbmRleCA3ZjM4NGZmZTg0OGE3
Li5hZDU3MmY5NjUxOTBiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNl
LmMKPiBAQCAtNDIsNiArNDIsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIu
aD4KPiAgI2luY2x1ZGUgPGRybS9yYWRlb25fZHJtLmg+Cj4KPiArI2luY2x1ZGUgInJhZGVvbl9k
ZXZpY2UuaCIKPiAgI2luY2x1ZGUgInJhZGVvbl9yZWcuaCIKPiAgI2luY2x1ZGUgInJhZGVvbi5o
Igo+ICAjaW5jbHVkZSAiYXRvbS5oIgo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
