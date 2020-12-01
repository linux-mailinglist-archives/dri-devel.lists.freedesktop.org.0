Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B4B2CA5A1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 15:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD67F89F8B;
	Tue,  1 Dec 2020 14:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10E189F8B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:31:07 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39F9120757
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606833067;
 bh=iKyVt3ei4IjF6uUcpgpDuCr1OPzvs8ktfZvmbaiq0V4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oMsqBM0RKejCzfstwlt6YyEpaxDWsKgOG+o0IPk82w9kBAgkGtQL6ftCiJ8ERMZ2u
 cgwTOds2N8B26XkSvBv5MlYgDUiE9ylwA2mJ0qy/1mmvH+QikgJwL40rAjTzcrQnRt
 8tIXOjHigZTfKj6SbWHaYT2ryjk+BGEnLXZ0qT3E=
Received: by mail-ej1-f47.google.com with SMTP id d17so4495242ejy.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 06:31:07 -0800 (PST)
X-Gm-Message-State: AOAM5311nzJRTR/gKqZ1oQ7J1igp1HH85lT/PN4fO26PluBfyh7muEGQ
 MgGaViu/vpD3sn7aaPpoDnrqBNNibvTuT8X+Ig==
X-Google-Smtp-Source: ABdhPJzlHxdV4VGqzoWpb7rYlMAdgwMJ1nH13c0Yed4GR1AZ/tKtVHvegqEicS3dnzhWhT9kSKQM68aoJzZdQwO0v8w=
X-Received: by 2002:a17:906:af0a:: with SMTP id
 lx10mr3263894ejb.75.1606833065729; 
 Tue, 01 Dec 2020 06:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-3-chunkuang.hu@kernel.org>
 <20201130103411.GN8403@vkoul-mobl>
In-Reply-To: <20201130103411.GN8403@vkoul-mobl>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Dec 2020 22:30:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Dkn_cwb39+G3SHJZdKdiBk9fsUWJN8sfM2fhLbVT8tg@mail.gmail.com>
Message-ID: <CAAOTY_-Dkn_cwb39+G3SHJZdKdiBk9fsUWJN8sfM2fhLbVT8tg@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver
 into drivers/phy/mediatek folder
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFZpbm9kOgoKVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMeac
iDMw5pelIOmAseS4gCDkuIvljYg2OjM05a+r6YGT77yaCj4KPiBPbiAxNy0xMS0yMCwgMDc6MTQs
IENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBtdGtfbWlwaV9kc2lfcGh5IGlzIGN1cnJlbnRseSBw
bGFjZWQgaW5zaWRlIG1lZGlhdGVrIGRybSBkcml2ZXIsIGJ1dCBpdCdzCj4gPiBtb3JlIHN1aXRh
YmxlIHRvIHBsYWNlIGEgcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLCBzbyBtb3Zl
Cj4gPiBtdGtfbWlwaV9kc2lfcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLgo+Cj4g
QWNrZWQtQnk6IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+Cj4KPiBJIGFtIHRoaW5raW5n
IHRoaXMgd291bGQgZ28gdGhydSBkcm0tdHJlZSwgaWYgbm90IGxldCBtZSBrbm93IEkgd291bGQK
PiBhcHBseSB0aGlzCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoK
WzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5r
dWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVu
LUt1YW5nLgoKPgo+IC0tCj4gflZpbm9kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
