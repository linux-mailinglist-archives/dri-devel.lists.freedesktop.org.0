Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1C15E232
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F54D6FB19;
	Fri, 14 Feb 2020 16:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAE76FB19;
 Fri, 14 Feb 2020 16:22:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so11596267wru.3;
 Fri, 14 Feb 2020 08:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F8W0MotfQnPEa/KdyFQF0W7kLEtQWwDAo9vyrtiU5Gk=;
 b=GUMYpxGiCyf3qvAsvG9GusvIKRkK0vVL0zi86+QpCsvqgQqnwyviEn/Oa968Apl0lw
 TDkrkAfVE8rjwJJGnmolzZR0Bu7nzRD7qAtBsTqSb4umtQk+CALu8EeDwnA+qSBCAy1v
 HvfKlm67BY2KYScY/BL/cA9d9/9gn7XEKLfG5gpqW9ETdmOCv1yRTzIp/+GSKvywAsD6
 Af3fZFvf6OLSy3vA7ITY9h1qKtmccPUjr1I3Th/WdCPcKhGPGvA4d5UPj61gicYg9BPF
 XgJDA+4BuTs2iru68xpoVLqoyhfLDOzDb9rfQK2fdpjdzqNMcsHE3XCMZLQCKjpBweIq
 TE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F8W0MotfQnPEa/KdyFQF0W7kLEtQWwDAo9vyrtiU5Gk=;
 b=RSvbrRni8Eq5qD3pQk1NpmOHw5vXgaaHKdL2j6Dpex6rpoVogdX4Nc+vi1evJuv47i
 MoSUq6/7sta5ps3t1FeTlKGaXaCsoISmeb7JrAHSkSfadge4m8QqTiIhaK9SaCeAmOcb
 A5I78U5Z0M3PTJ0Z70oaEO167yjoiLAeY36YOgEG0GZVz35aOx5e+nwYlldaJmRQj+Cd
 5opRiNe+GGRgYyP2NRHshowsdxH1wm9QysZ6DKleUPL5luKvjqY2+71p4jz6YKzhW3R5
 olP//3kWlx0pR5nit88wP8Lqg3c8b73v0Ku3uGkW/3O2ZFa6W8m7W0h8UBCw1VWAeXSy
 xIMQ==
X-Gm-Message-State: APjAAAUOhOFbrP4X3VwLBMIiFP12Jc7ps+HbAivywnHQFHkIzIp/3bDD
 5P7HZ8Xw8EVlgzVIMPSzTRMcDhgsEYhkH/nCzdU=
X-Google-Smtp-Source: APXvYqwr8VK9pA0btz3BZPR8gMaxqgRSDNoIunzZqG4iZhOozas0m6WDC9tRV0qGzH0B/KyocD/tTa393fURFpVYEd0=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr5088220wrn.124.1581697358169; 
 Fri, 14 Feb 2020 08:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20200214154854.6746-1-sashal@kernel.org>
 <20200214154854.6746-408-sashal@kernel.org>
In-Reply-To: <20200214154854.6746-408-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Feb 2020 11:22:27 -0500
Message-ID: <CADnq5_MMLNtb=3LLHsYnXtONQf4NWNgV226w2=OFk3JpCRj3sA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.5 408/542] drm/amdgpu: add the lost mutex_init
 back
To: Sasha Levin <sashal@kernel.org>
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMTA6NTcgQU0gU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206ICJQYW4sIFhpbmh1aSIgPFhpbmh1aS5QYW5AYW1kLmNv
bT4KPgo+IFsgVXBzdHJlYW0gY29tbWl0IGJkMDUyMjExMjMzMjY2M2UzODZkZjFiODY0MjA1MjQ2
M2VhOWIzYjkgXQo+Cj4gSW5pdGlhbGl6ZSBub3RpZmllcl9sb2NrLgo+Cj4gQnVnOiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC9pc3N1ZXMvMTAxNgo+IFJldmlld2VkLWJ5
OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogeGluaHVp
IHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8
c2FzaGFsQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBpbmRleCAzMzJi
OWMyNGEyY2QwLi5hMmY3ODhhZDdlMWM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwo+IEBAIC0yNzk3LDYgKzI3OTcsNyBAQCBpbnQgYW1kZ3B1X2Rl
dmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgICAgICAgbXV0ZXhfaW5p
dCgmYWRldi0+bm90aWZpZXJfbG9jayk7Cj4gICAgICAgICBtdXRleF9pbml0KCZhZGV2LT52aXJ0
LmRwbV9tdXRleCk7Cj4gICAgICAgICBtdXRleF9pbml0KCZhZGV2LT5wc3AubXV0ZXgpOwo+ICsg
ICAgICAgbXV0ZXhfaW5pdCgmYWRldi0+bm90aWZpZXJfbG9jayk7Cj4KClRoaXMgcGF0Y2ggaXMg
bm90IHJlbGV2YW50IGhlcmUuICBUaGUgc2FtZSBtdXRleCBpcyBhbHJlYWR5CmluaXRpYWxpemVk
IDMgbGluZXMgYWJvdmUuCgpBbGV4CgoKPiAgICAgICAgIHIgPSBhbWRncHVfZGV2aWNlX2NoZWNr
X2FyZ3VtZW50cyhhZGV2KTsKPiAgICAgICAgIGlmIChyKQo+IC0tCj4gMi4yMC4xCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFp
bGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
