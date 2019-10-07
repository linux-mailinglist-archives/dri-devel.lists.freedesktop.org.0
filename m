Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2866CCDC1C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4B16E49B;
	Mon,  7 Oct 2019 07:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6359289F01
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 04:26:24 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id w12so25552000iol.11
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 21:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9cn7hWNDSYfp5yXqFFW958D3/KZM4oLb6q2uNhX0rvU=;
 b=DyhV1Xv8aKj0hHU3BmRUJ6vtQO2joEOfwaO2o+J6LehBdMioTcOHCCbuil5UTsWlnt
 3Ku+APWxHHcA20cFQy94On3iTsUQrNnK7Yp0t8R2S0B2/7eNUNpCfgbc3XLdxqcL+h4J
 5tK1s4wv8h28a0bFSBlATcIDCee02d0Y4exFaHg63T/F7JqvzCeBThHiQqdN+jVOyWYe
 5tTomDUzK3kRa+TS5raNAF16jIwKosbftCoVF8WN1TBUSLJNLZEYQ+N08BYvk4hNw3Wi
 7wIfPzs29KWdD05WX7l/x9jInsqmiYmGk9iC1mHs+ruarfWuSQuIuOnFRpZkkopZWZ9K
 E8aw==
X-Gm-Message-State: APjAAAW/lXifpNDWbsTLZ/Dp8kWRmSHXNmhgcEAckD203EnPVn0BXmgh
 AToKBMWFggl6MBllM9wLGQSLVvSr/0YFiIYl8UM=
X-Google-Smtp-Source: APXvYqwNpG0DnS9E7tcNclPV8jO9ELB64ac4Ds2ETF8/Q67RH1TZJg0YKP6QP0J6Ls8/KN4ciXE8HHJrZwThDIB7Zh8=
X-Received: by 2002:a92:a80c:: with SMTP id o12mr25789967ilh.190.1570422383586; 
 Sun, 06 Oct 2019 21:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
In-Reply-To: <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sun, 6 Oct 2019 23:26:12 -0500
Message-ID: <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
Subject: Re: drm/imx: Checking a kmemdup() call in imx_pd_bind()
To: Markus Elfring <Markus.Elfring@web.de>
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9cn7hWNDSYfp5yXqFFW958D3/KZM4oLb6q2uNhX0rvU=;
 b=SUkPcE54QuOqWOsnTUJ9OupBTtoc/62vjs+pcRhRlW91ahBSnrBEF2wJljxoPdk46O
 GQNGPESN0Ff1RrPM/aD2eDoqVXb+yyUkqzRTseS2sSq2nQQwQqXYcdkqHqgpVj9DePe8
 tM9olm3uxcRFSegXNDygnKTMAuMofJXZ3P2N1WakZ6wdpqOh3yfXAI14bWRts8LxVczv
 XF8H7QDA1WLazodSRkecb3uBVrzIfNoErB7x0n+nImaKizevHEHlyp7pcZAZcbrqPrl2
 Jqe1KFZLSRNlUOZ2kuG5LaDeSZ4tMyZAc8YmsHCc2YMoeJY0aERGwrVx0T75kbkLfzFI
 +vgg==
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
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Navid Emamdoost <emamd001@umn.edu>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stephen McCamant <smccaman@umn.edu>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFya3VzLAoKSSBhZ3JlZSB3aXRoIHlvdSwga21lbWR1cCBtYXkgZmFpbCBzbyBhIG51bGwg
Y2hlY2sgc2VlbXMgbmVjZXNzYXJ5IHRoZXJlLgoKT24gU3VuLCBPY3QgNiwgMjAxOSBhdCA0OjMz
IEFNIE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+IHdyb3RlOgo+Cj4gSSBo
YXZlIHRha2VuIGFub3RoZXIgbG9vayBhbHNvIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUg
ZnVuY3Rpb24g4oCcaW14X3BkX2JpbmTigJ0uCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUv
ZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmM/aWQ9NDNiODE1YzZhOGU3ZGJjY2I1YjhiZDljNGIw
OTljMjRiYzIyZDEzNSNuMTk3Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUu
NC1yYzEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jI0wxOTcK
Pgo+IE5vdyBJIGZpbmQgYW4gdW5jaGVja2VkIGNhbGwgb2YgdGhlIGZ1bmN0aW9uIOKAnGttZW1k
dXDigJ0gc3VzcGljaW91cy4KPiBXaWxsIHRoaXMgZGV0YWlsIHRyaWdnZXIgZnVydGhlciBzb2Z0
d2FyZSBkZXZlbG9wbWVudCBjb25zaWRlcmF0aW9ucz8KPgo+IFJlZ2FyZHMsCj4gTWFya3VzCgoK
Ci0tIApOYXZpZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
