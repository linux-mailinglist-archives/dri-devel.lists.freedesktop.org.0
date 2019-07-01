Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418825C4B7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70B489D60;
	Mon,  1 Jul 2019 20:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B1289C94;
 Mon,  1 Jul 2019 18:08:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id h6so30953919ioh.3;
 Mon, 01 Jul 2019 11:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uy3GzDC/3O8U5MnHDFB01vcThhGk4+LpUii33EoT0mU=;
 b=SqRSu+rx4CHhWPPC499jdFVCc2nMAgBwh5a6m1B9cZoVWaeLcGmpcpLRDclJYhKa7r
 bNSzLkNB+FjxsOls6iEiDKGaFcif3tm/blXLUZdV3jx9YBXn+RtZZsVUVvzWOzMF/yyw
 6ViULsQ2HT7g16SuIqMcSpUFx57tl0bZo1OSXql5vglEQkR+XdTyaVeGmJGch0g2JGlc
 R4j+OENYLA3VdZrSVvvfNHeb19WNZC8aGnWh847qG8VDaVn94zY+ytdgJBPzQ54qRUno
 SEkzUdR3FA82iv4y/fc6A4Tzfy11BtmSn2ek8qbY/fHWtmyDa9v4LJeKrJQWRxvuWyL9
 sGpg==
X-Gm-Message-State: APjAAAXSzeFyqLWyxcTe2zYDqzEdKTCITE7VNMq/+NfYZnVPNpD194NC
 GSR0THxkzLz/vcoRV6gV3uawM3kuQkguhgysQLs=
X-Google-Smtp-Source: APXvYqxgBnVoTGZWK95i22k6Cou8FFFimKn7TGZnM12vGsyAr9w5HBXwXBtcghJbIHbdMWpoLX5nmxpLrurw/H/MjRc=
X-Received: by 2002:a6b:3b89:: with SMTP id i131mr16212349ioa.33.1562004528091; 
 Mon, 01 Jul 2019 11:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-3-robdclark@gmail.com>
In-Reply-To: <20190630150230.7878-3-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 1 Jul 2019 12:08:38 -0600
Message-ID: <CAOCk7NpOK60ipDzD1Sn+VT_eO3jFikVJ0kCO4T18UBZOGcCFaA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/5] genpd/gdsc: inherit display powerdomain
 from bootloader
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Uy3GzDC/3O8U5MnHDFB01vcThhGk4+LpUii33EoT0mU=;
 b=CpRQXslQJ4GcU66JWYXcgsogIOovk4Oj5BbQvT1mVf4Dt4EhIA8xkGp8g5r/aT6MwC
 2veX2Qf67yFZ9At1kXc2JXytLmodk0droxpumi42GNd8fRqrcbQ/bLLUWXO9GzyqUMMy
 iyw5xGUu/UeKDlul40NjhRVv2XG3/+FL2LW3Qo6YEooqmR5W7AClmwrQ/FgyHGoBL0Yx
 PCL7voVxS3VCUx0ml2exh075XNYbgTY1e8lKa/wm4SfSeV4yb2otxX66LMcgBzbH2bV8
 hyPnoAjhw3rljtZIgVgulRBpu/b+CeiJLRVSEXJbt+EcT0CMZVhv4Xmh9I7IzoBgvQrV
 je1Q==
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, aarch64-laptops@lists.linaro.org,
 Stephen Boyd <sboyd@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgOTowMiBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
Pgo+Cj4gTWFyayBwb3dlciBkb21haW5zIHRoYXQgbWF5IGJlIGVuYWJsZWQgYnkgYm9vdGxvYWRl
ciwgYW5kIHdoaWNoIHNob3VsZAo+IG5vdCBiZSBkaXNhYmxlZCB1bnRpbCBhIGRyaXZlciB0YWtl
cyB0aGVtIG92ZXIuCj4KPiBUaGlzIGtlZXBzIGVmaWZiIGFsaXZlIHVudGlsIHRoZSByZWFsIGRy
aXZlciBjYW4gYmUgcHJvYmVkLiAgSW4gYSBkaXN0cm8KPiBrZXJuZWwsIHRoZSBkcml2ZXIgd2ls
bCBtb3N0IGxpa2VseSBidWlsdCBhcyBhIG1vZHVsZSwgYW5kIG5vdCBwcm9iZWQKPiB1bnRpbCB3
ZSBnZXQgdG8gdXNlcnNwYWNlIChhZnRlciBsYXRlX2luaXRjYWxsKQo+Cj4gU2lnbmVkLW9mZi1i
eTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEplZmZy
ZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
