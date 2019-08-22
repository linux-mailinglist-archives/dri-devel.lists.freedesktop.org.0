Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896859A293
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 00:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854B66EB52;
	Thu, 22 Aug 2019 22:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39046EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 22:08:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z11so6809006wrt.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 15:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dem7TnAwfqo5ysrzcm87CJHrNC80Qsa6DjP3QIVxJys=;
 b=hUTTrP4wdX2oOrL4yi0jP1s71IYAcTgdM5nidYNvC3aIQlPeswFfJxvu+IT7hN48wJ
 V9QPY9PtyGeR37Hjmabow8e3egjvBKqZZPR5Lf3l5tABm4izUskPFMF+ltluLkuSz0t5
 ACx3Qss6MQ4iP/itcXuG7hct/hbnA5f8+PTPfFqIRBNWHUgKGm1A+vFPZskB4kt36EDC
 qIfesBlikX2incLY/BXv9LL8aDBCHJryovR0nTkEf3zrKhL+HXOTLE2PykrNDCvQzT/f
 1jz9bgUssfuzd2dOdcIrEb9a3eX0l0Q9j3X90K86+iSFAf+tZC18ye1VKJoQ6hD3Hmxd
 go9A==
X-Gm-Message-State: APjAAAVDfVRWI8VNrbVh+r47mvyymwXn9Iz1pzMmFrCk62hiWd/7VBIh
 VBk2p5R7bG6CE1hEabGo0GYLlVmZoWX6bMPmcKA=
X-Google-Smtp-Source: APXvYqw8/Dhgei/EZmELsdhrZcdwh6G4cL775tii9Vb1sm5woLMXFQgtuZbGYeI2PCeAFrvuJMcKvMje/Qv9HYhbC9U=
X-Received: by 2002:a5d:4ecb:: with SMTP id s11mr1027310wrv.323.1566511707385; 
 Thu, 22 Aug 2019 15:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190823080604.5164f8c4@canb.auug.org.au>
In-Reply-To: <20190823080604.5164f8c4@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2019 18:08:15 -0400
Message-ID: <CADnq5_NNdsZ-UWuPQX=4o7c6Tq2mmo8de=fUGfR4gemhyNohMA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Dem7TnAwfqo5ysrzcm87CJHrNC80Qsa6DjP3QIVxJys=;
 b=XHYHBGLM/FkMa0//M/KVwjYyU9A+TYQ3NW+3LUV+5gZ+XdfH0Z2f9eCk4aqFl9bYk6
 FhN1tjqa0G0jTI8K6nPjNrRtQwk6mFruS6eWE0WoPfn9aegLsCdFXm28jknOTVsbo92x
 5nsgqDvPF/rpQZacdqbJ6T9JGXrNAzKtk0O6UF5gnK/hgByqPDVCD0o/R3It9yI11EKW
 7q6iZf14fHIia7Y/MvPvBZFgR65fAYyqBFmLdIwh0Ah0Y+pwMvccin+BnXrIj9Fu1UpT
 g5GxyOzBJqUkD4X4ktqF7GKFi2tYlNZz/JA8z/6cID2vY8pLFt+WZr0yUxxC+swFE6eP
 /JGQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Dave Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgNjowNiBQTSBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2Fu
Yi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBBZnRlciBtZXJnaW5nIHRoZSBk
cm0tZml4ZXMgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkIChLQ09ORklHX05BTUUpCj4g
cHJvZHVjZWQgdGhpcyB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
cG93ZXJwbGF5L3NtdV92MTFfMC5jOiBJbiBmdW5jdGlvbiAnc211X3YxMV8wX3NldHVwX3BwdGFi
bGUnOgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS9zbXVfdjExXzAu
YzozNjg6NDA6IHdhcm5pbmc6ICdzaXplJyBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRo
aXMgZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0KPiAgICBzbXUtPnNtdV90YWJsZS5w
b3dlcl9wbGF5X3RhYmxlX3NpemUgPSBzaXplOwo+ICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5efn5+fn4KPgo+IEludHJvZHVjZWQgYnkgY29tbWl0Cj4KPiAgIDAwNDMw
MTQ0ZmY3MyAoImRybS9hbWQvcG93ZXJwbGF5OiBmaXggdmFyaWFibGUgdHlwZSBlcnJvcnMgaW4g
c211X3YxMV8wX3NldHVwX3BwdGFibGUiKQo+Cj4gTG9va3MgbGlrZSBhIGZhbHNlIHBvc2l0aXZl
LgoKU2lsZW5jZWQgaGVyZToKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNo
LzMyNTcyOC8KCkFsZXgKCj4KPiAtLQo+IENoZWVycywKPiBTdGVwaGVuIFJvdGh3ZWxsCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
