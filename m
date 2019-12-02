Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3C10F242
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 22:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CA06E34D;
	Mon,  2 Dec 2019 21:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DD66E0FD;
 Mon,  2 Dec 2019 21:39:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n1so1057734wra.10;
 Mon, 02 Dec 2019 13:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UY7Cgt/HHbMQf0k0lCTcwkYlvT/3f+PbQ7R+5FrroJk=;
 b=r2IKCBleaq/yeMhln6oKna1VPpaJYYeihu7NcAd9tcwE06t4UIkzBkMGl3KR+I1XSd
 HVOeQumLXufLugCSI6ZAfPJRkJHeuSiYlD9uFtvotdg+TaZu+IUdtEMQbYpuuR177Xay
 Vvw5cUNKrDgVFXja4JFkRjGcNgOd3UaXhUuDc+M0VsSEBGRM5hmOaNe7FWmQyzS3lNru
 XcahnchnCzRCIH2BMOrvyQs49QFUk0rZM3/xlkNQl7Kqy/5KDIL/mVsFRrkydSfvOwAP
 t5tzMqoqqDkIcDoK+G7/e/wiZb4zjc1UyoR6rnUBMWZQDv++dBjtljJ9SbZZK+nFrYbm
 6VPg==
X-Gm-Message-State: APjAAAW0bykDCC4bBhwAYoTSHfg3bIij6NgggpvOxu4MAsOOktOCoHv8
 nE1TJI8kWWsgT2QA62B6awUYYgteZh9sQ0Vm5LI=
X-Google-Smtp-Source: APXvYqyPXuAHZoIz3Nn0IQ/EHpeMnI4NckHiE/hs2YARA1G052OhgZkNuyP7oXg26gFkZU7g4h3eUDBXwumPOYpu3uk=
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr1239920wrs.11.1575322747719;
 Mon, 02 Dec 2019 13:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20191202154738.56812-1-colin.king@canonical.com>
In-Reply-To: <20191202154738.56812-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Dec 2019 16:38:56 -0500
Message-ID: <CADnq5_Mtos36z7vp92ep4hQtW3KFeGb8EbWsGbhOGXJSebdVDA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant assignment to variable
 v_total
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UY7Cgt/HHbMQf0k0lCTcwkYlvT/3f+PbQ7R+5FrroJk=;
 b=s7chfm3+NiM53pTX/biaEdej5othUb91+knoYHrtDzVY329+Y3nrxfFjxX+3GOZVAZ
 0EMZOmm0Ve/WdcrRS185uvrmSh3kM1+G2/gblrr9/jYCwAgq0HAOc92+fHPC4hjaPjFz
 qtamQOzOUeazrRxUZ7sn2Xz/paAL28NH0tHbKyrNn6QDf2WArTa7HdslHaTb7HWlnVD9
 ljUhJZx+A0dvNxO7tCZ0Yv0OZ+NEZg7eJRattmzXHIOueHA2Qq4hrcToMME1dBuxKlVS
 qVgZXuX6Fp46I3jjCW/wTI+2wu1pz0g9p3D8b5wFwdb2nz8YkosfnP+whoSGGyvsOi7J
 bo5g==
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgRGVjIDIsIDIwMTkgYXQgMTA6NDcgQU0g
Q29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBUaGUgdmFyaWFibGUg
dl90b3RhbCBpcyBiZWluZyBpbml0aWFsaXplZCB3aXRoIGEgdmFsdWUgdGhhdCBpcyBuZXZlcgo+
IHJlYWQgYW5kIGl0IGlzIGJlaW5nIHVwZGF0ZWQgbGF0ZXIgd2l0aCBhIG5ldyB2YWx1ZS4gIFRo
ZSBpbml0aWFsaXphdGlvbgo+IGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4KPiBB
ZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZhbHVlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3luYy5jIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3lu
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5
bmMuYwo+IGluZGV4IDE2ZTY5YmJjNjlhYS4uZmE1Nzg4NTUwM2Q0IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9mcmVlc3luYy9mcmVlc3lu
Yy5jCj4gQEAgLTEyMiw3ICsxMjIsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGNhbGNfdl90b3Rh
bF9mcm9tX3JlZnJlc2goCj4gICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkY19zdHJlYW1f
c3RhdGUgKnN0cmVhbSwKPiAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlZnJlc2hfaW5f
dWh6KQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgdl90b3RhbCA9IHN0cmVhbS0+dGltaW5n
LnZfdG90YWw7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgdl90b3RhbDsKPiAgICAgICAgIHVuc2ln
bmVkIGludCBmcmFtZV9kdXJhdGlvbl9pbl9uczsKPgo+ICAgICAgICAgZnJhbWVfZHVyYXRpb25f
aW5fbnMgPQo+IC0tCj4gMi4yNC4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
