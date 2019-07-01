Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD15C4AB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677289BA3;
	Mon,  1 Jul 2019 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784F9899DC;
 Mon,  1 Jul 2019 18:03:03 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id w25so30810336ioc.8;
 Mon, 01 Jul 2019 11:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2tpItKwuKZOogitEmK5udMyyQM1691xM5APcPto608=;
 b=pPoostWvAHPd0zmr4HtB9O7rEXvtc8veQBt8tFPBCrd1RiWdat9QdPsFL7jP6bjHCL
 vkQmOoVm/hlaq+dJ2w4yqqMG1W9UMe1OVTQTiXcxMbYpy+MWgC6ucZ2ttQ2vSyyTN1sd
 5MzCkDmiOjZvxz/HgDh9y7oXbMN77nNK4xQw0LBGFzUNPzSnoEGGc7dHrSf5EEGYlIw0
 hFAqmpX8Ro4Pkc0cnYgM4+43UQp6491BTkQqfQ9iTI7P7hQPmhsYFjWDWJTdN1BLTCBu
 iYw4Opquk9et3WscKeoI9lGYYqC1ucQ3hSSux40yiDWqxLcAVDUuk9pXI1lfzE/K5jDY
 4oyg==
X-Gm-Message-State: APjAAAVauTwyhhPvJLrTFNnnmmfbjPUC+HOPD/9N1aA4+uA/42LRDNyO
 qkyf7ETveLQoFMfdEkEuhZVL+WwQ7FXx/+2Ir8+tSg==
X-Google-Smtp-Source: APXvYqwzMbEiuqzBEGi8Ma814/2Wm8+1QLsd2TC+xpIY9gX5+hw7VVWydloLi3QoDkPpFr8OY2VVgWK6VjVIqQicj+g=
X-Received: by 2002:a6b:f607:: with SMTP id n7mr548056ioh.263.1562004182900;
 Mon, 01 Jul 2019 11:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-2-robdclark@gmail.com>
In-Reply-To: <20190630150230.7878-2-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 1 Jul 2019 12:02:52 -0600
Message-ID: <CAOCk7Np7jjdzbhX2qUf4h-JyLrqSwthX+=7Hd3vQETBtQDp9DQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/5] clk: inherit clocks enabled by bootloader
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=K2tpItKwuKZOogitEmK5udMyyQM1691xM5APcPto608=;
 b=Wfo6MybS7hH5DKgNXldkNyj/G7ZcAkedgRpXC1z/5iSm+HK5Xk1PMACgeewleePYHB
 MUxt71ZWh+8eRyEcTP5BZGIilgCuE5rPk/k6+4dUbg9Ob/3iTbU0/wnOsu7an/o1gSsK
 DrvnCo3rOf8Sua0uIWAlO2+0FLa0Mjd/F3LoyD5yZpsal9sso2OMfFoPyFNBLIE1ZdmS
 9Y4V7SpcZMDLudhphdChqGcObQvCtDqvkWvqtK4UkMGbO0EF29Bdf68FvhqRa/Hz2a/5
 xR4qAZvsrEQFIt16yYWSXChJ4kLjyVUkf6kd0eSNBhf+Qq68hpHGQGx/N9hSlHbdMDi6
 YRvw==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andy Gross <agross@kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgOTowMiBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
Pgo+Cj4gVGhlIGdvYWwgaGVyZSBpcyB0byBzdXBwb3J0IGluaGVyaXRpbmcgYSBkaXNwbGF5IHNl
dHVwIGJ5IGJvb3Rsb2FkZXIsCj4gYWx0aG91Z2ggdGhlcmUgbWF5IGFsc28gYmUgc29tZSBub24t
ZGlzcGxheSByZWxhdGVkIHVzZS1jYXNlcy4KPgo+IFJvdWdoIGlkZWEgaXMgdG8gYWRkIGEgZmxh
ZyBmb3IgY2xrcyBhbmQgcG93ZXIgZG9tYWlucyB0aGF0IG1pZ2h0Cj4gYWxyZWFkeSBiZSBlbmFi
bGVkIHdoZW4ga2VybmVsIHN0YXJ0cywgYW5kIHdoaWNoIHNob3VsZCBub3QgYmUKPiBkaXNhYmxl
ZCBhdCBsYXRlX2luaXRjYWxsIGlmIHRoZSBrZXJuZWwgdGhpbmtzIHRoZXkgYXJlICJ1bnVzZWQi
Lgo+Cj4gSWYgYm9vdGxvYWRlciBpcyBlbmFibGluZyBkaXNwbGF5LCBhbmQga2VybmVsIGlzIHVz
aW5nIGVmaWZiIGJlZm9yZQo+IHJlYWwgZGlzcGxheSBkcml2ZXIgaXMgbG9hZGVkIChwb3RlbnRp
YWxseSBmcm9tIGtlcm5lbCBtb2R1bGUgYWZ0ZXIKPiB1c2Vyc3BhY2Ugc3RhcnRzLCBpbiBhIHR5
cGljYWwgZGlzdHJvIGtlcm5lbCksIHdlIGRvbid0IHdhbnQgdG8ga2lsbAo+IHRoZSBjbG9ja3Mg
YW5kIHBvd2VyIGRvbWFpbnMgdGhhdCBhcmUgdXNlZCBieSB0aGUgZGlzcGxheSBiZWZvcmUKPiB1
c2Vyc3BhY2Ugc3RhcnRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Y2hyb21pdW0ub3JnPgoKU2VlbXMgc2FuZSB0byBtZS4gIEknbSBjdXJpb3VzIHdoYXQgU3RlcGhl
biBCb3lkIHRoaW5rcy4KSSdsbCB0cnkgdG8gZ2l2ZSBpdCBhIHNwaW4gb24gb25lIG9mIHRoZSA4
MzUgbGFwdG9wcy4KClJldmlld2VkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdt
YWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
