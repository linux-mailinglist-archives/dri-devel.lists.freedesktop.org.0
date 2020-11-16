Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D22B5274
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FA489C96;
	Mon, 16 Nov 2020 20:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BB6898C0;
 Mon, 16 Nov 2020 20:25:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so20246282wrx.5;
 Mon, 16 Nov 2020 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nnbsn/6MZC8cOPvW0sf0bSCu/xUsIbv7iUluqCOgYTo=;
 b=G7oVcuCCkohTKkSckG7CHyvER32oIQ6kZhsPFRJjxSjBiP6YXp9Cf5cBWCcjFYwGBK
 FtL+dV9qgQ5nwNpxFQzlvtbhMWrOHpB87xx9YO9DMXf3YaOYa4m753otPfn5n5+bSclo
 F8U72h7ggxwqSdnLJZQuLtbLO2YXxyr9Z3PIVTadtb8StkSUlbpqpk3FQNGVkFvF9/fW
 dupIItocEjLp2yVsvUaKIQrkEki4UTjM/bAt+qckSNnhO/e+F3/PmJkcUwrkOPO4s5Oo
 ZIX2kuhubv9L6oeDoN8mOgppI/pdEZWpC6KEuZgwfYtjuotg1VzIAuP7LcAcxx2NNtbP
 uZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nnbsn/6MZC8cOPvW0sf0bSCu/xUsIbv7iUluqCOgYTo=;
 b=URovo0z4WjOwS7HRYfxYQW69tjV9fIdmr9Xz5XX9MvPl0ix9Y/KCNe7ScAZRHmJKVi
 Erkv4a/Mf0omgz+LIwDtAWvsSAvZshUyzhZWOkSt4hb70nGBMTwh2r0NOMgBJeMm17m3
 7jDMTb8u7UNMJgZuOxRmwp/JdMYvUJb8++TqvdXgbJFE99Wxz2LyLTX0mRY9cH/MCboJ
 Iy6oND84KZKIsseoUrfxQ1XiYJSo/2zXy1U3DCHMZMwNc17fUsubyKFlLURmDniw//gK
 R3jgpqubS9EwJN2v7SrpPRmclLF2w9TTgTbY9xRNR5Z1Lc6MXv+0QbnxPO77/X6lBxj7
 trsQ==
X-Gm-Message-State: AOAM5333KKJdts0iM0BUXWUFmTpwBzTyy1z9x8J97+bLzI1dpW14gB7I
 OyyrVWKV9EWs1KOWp+e3DeWUj062pADaKwBuGoUD6taV
X-Google-Smtp-Source: ABdhPJyD5x1GeFN4w1yLVo2gSPZGSpWxF4MwonVC4co75yGWQhwzh5KvVMRHs+YveOf+VwzNE1+ZNCP/EXx+A+XYDQQ=
X-Received: by 2002:adf:e551:: with SMTP id z17mr21610130wrm.374.1605558313754; 
 Mon, 16 Nov 2020 12:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-31-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-31-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:25:02 -0500
Message-ID: <CADnq5_OnhvfuzhuzxwrTJob0Cxo326s4Gjvy+J1txockePM0NA@mail.gmail.com>
Subject: Re: [PATCH 30/43] drm/radeon/si_dma: Move 'si_gpu_check_soft_reset()'s
 prototype to shared header
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmM6Mzc2ODo1OiB3YXJu
aW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNpX2dwdV9jaGVja19zb2Z0X3Jlc2V0
4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMzc2OCB8IHUzMiBzaV9ncHVfY2hlY2tfc29m
dF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKPiAgfCBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmggICAgIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vc2lfZG1hLmMgfCAzICstLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3NpLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKPiBpbmRleCAwYTUwMThlZjE2
NmUyLi5hMTc1MWFlNTYwZjAyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
c2kuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuaAo+IEBAIC0yNyw1ICsyNyw2
IEBACj4gIHN0cnVjdCByYWRlb25fZGV2aWNlOwo+Cj4gIGludCBzaV9tY19sb2FkX21pY3JvY29k
ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gK3UzMiBzaV9ncHVfY2hlY2tfc29mdF9y
ZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4KPiAgI2VuZGlmICAgICAgICAgICAg
ICAgICAgICAgICAgIC8qIF9fU0lfSF9fICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vc2lfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RtYS5jCj4gaW5k
ZXggZDJmYTMwMmE1YmU5Zi4uNjQ1ODk3ZDFiZmMzMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3NpX2RtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9k
bWEuYwo+IEBAIC0yNSwxMCArMjUsOSBAQAo+ICAjaW5jbHVkZSAicmFkZW9uLmgiCj4gICNpbmNs
dWRlICJyYWRlb25fYXNpYy5oIgo+ICAjaW5jbHVkZSAicmFkZW9uX3RyYWNlLmgiCj4gKyNpbmNs
dWRlICJzaS5oIgo+ICAjaW5jbHVkZSAic2lkLmgiCj4KPiAtdTMyIHNpX2dwdV9jaGVja19zb2Z0
X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAtCj4gIC8qKgo+ICAgKiBzaV9k
bWFfaXNfbG9ja3VwIC0gQ2hlY2sgaWYgdGhlIERNQSBlbmdpbmUgaXMgbG9ja2VkIHVwCj4gICAq
Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
