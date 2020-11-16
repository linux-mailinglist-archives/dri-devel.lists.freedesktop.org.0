Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BFE2B512E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 20:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC4C6EA44;
	Mon, 16 Nov 2020 19:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C7E6EA44;
 Mon, 16 Nov 2020 19:32:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so20060763wrx.5;
 Mon, 16 Nov 2020 11:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6u9glXg4zFrqO3lr0/xH7tuiEEcDV6G1EbJU8peXnog=;
 b=l6awfJflMImqdSyvTdK7VUZ+M3PyAYjnu39cw6cDWUpMQSZCasiABE3hB3UYadQllM
 349Ek5y/JhP/1gfWuzJFmDy7PM51yle94njMSqlfJiv7HT6Vrh0o3sRvrOdFY0icFQEn
 adi2b5rZaQEtO28jhRgmEmX6a2F9X5B7g9iMoAooWVqC8iZm4bHildAg072vTnlmZG27
 lwyg/cxWMAbqkWH6QpUPGMleR+X90XcPE1a7/oi5xgeHt3Rjh+pFcs3pZVLJXI0jlO9+
 JHswZLSx/7EVbxXf8fIQTgIOkmd3S802N4+hRzT9HhkO6E+oR9yWNFc6jEPXBTdRmnxv
 GZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6u9glXg4zFrqO3lr0/xH7tuiEEcDV6G1EbJU8peXnog=;
 b=pCS32INRnQcn2cqVpl7HNPnlSJpdMd+LSNmP29YZ3aoIM0Z73x/cwKMFwKPdBDAx+0
 vxcmxAfKqjgotti9+6NDQASzVG15iclsOrll8b+l3K9ISnESrrFF1V96NXxUk1914Qg0
 VjbdjYZbArcsciECnZuCtrc1I/TGbie9qK8/erRaBkVk0QJnrWcxE89i2xeaMgqUTfjs
 EcAOjtb872B0V48toDNn/+NmiOy4kzPd5OaZ1pQ3GyQOEqaWuX4nkQak6s3oylZi48/3
 A4neWC6UjhWsHKAdQOKpgN2mSBKb1BQLbZL3QGOCiYwQy+JHG4UGcTnqRp/UzyecoN5g
 zn8w==
X-Gm-Message-State: AOAM530oZm4YdVz7vjUv09BESy1Pj55CDlf+E8+z9zTALX5GvaN0civk
 YPn0y6/TxbIKY0z7Db7nIMy28aiB6Mb79+gz6aA=
X-Google-Smtp-Source: ABdhPJzBknI7uYfz2n9Qs2E2TcVmhlWZgbpKBGPFh7Il9hQIPB+ckfHn0EJY+HZFLCjHC+X2DZ7uFNogtHD02Xa+TkU=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr20887475wru.362.1605555135478; 
 Mon, 16 Nov 2020 11:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org>
 <20201116173005.1825880-5-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 14:32:04 -0500
Message-ID: <CADnq5_OQa=Pr8dnAFZ3uLNrY16nohckncDLLdJgdshdNc+NPBQ@mail.gmail.com>
Subject: Re: [PATCH 04/43] drm/radeon/radeon_kms: Fix misnaming of
 'radeon_info_ioctl's dev param
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzAgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYzoyMjY6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2Rldicgbm90IGRlc2NyaWJl
ZCBpbiAncmFkZW9uX2luZm9faW9jdGwnCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2ttcy5jOjIyNjogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAncmRldicgZGVz
Y3JpcHRpb24gaW4gJ3JhZGVvbl9pbmZvX2lvY3RsJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQu
ICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9r
bXMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwo+IGluZGV4IDAwMTk0MGJjYTkw
YTYuLjUwY2VlNDg4MGJiNDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwo+
IEBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIHZvaWQgcmFkZW9uX3NldF9maWxwX3JpZ2h0cyhz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAvKioKPiAgICogcmFkZW9uX2luZm9faW9jdGwgLSBh
bnN3ZXIgYSBkZXZpY2Ugc3BlY2lmaWMgcmVxdWVzdC4KPiAgICoKPiAtICogQHJkZXY6IHJhZGVv
biBkZXZpY2UgcG9pbnRlcgo+ICsgKiBAZGV2OiBkcm0gZGV2aWNlIHBvaW50ZXIKPiAgICogQGRh
dGE6IHJlcXVlc3Qgb2JqZWN0Cj4gICAqIEBmaWxwOiBkcm0gZmlscAo+ICAgKgo+IC0tCj4gMi4y
NS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
