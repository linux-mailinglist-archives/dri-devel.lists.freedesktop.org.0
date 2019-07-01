Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCB15C4AE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA8A89BAF;
	Mon,  1 Jul 2019 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BEB897F5;
 Mon,  1 Jul 2019 18:32:57 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id u13so31125795iop.0;
 Mon, 01 Jul 2019 11:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XH2Sgqd3f1qItnFcP6aNN21WN2gIql8Aj/n31a7/ks=;
 b=Fv4nzRVOv3gLoIfKy0PpVbC2CKWZA0MJvmP7iYgv1ZF+8KUlbiyCJ5MGmo94ObrVp2
 05tDPfYenhXnCmRTuNvK76j8G26MMtSvYIEyGlXO7Kbm3c9H9Lk1H02YNuecO1gzOqjc
 Hlj8p+SfYRt9YVNPToE3wopdvNNHGtE288WTzcb8nx4jFyrjsPeN9Hw9SwF/azQAiAMQ
 rZXLVawUVOzLn/NVpPqVGdW7hJtcOsxyVUYYumfTSoAdJPFObd/bD0Zk1DD90Ah5ygQI
 fW2K1Lv2k8CutCjZksCRrxBgiqayJnQJxwqln0lnOsRV9v2EqcBO6Y1+8JoXNKZI0II2
 wzZw==
X-Gm-Message-State: APjAAAUhYLim9siR47MF0Vto7JJSmYcMn7N0vElIKHf//at5tQlQJSnS
 6qwjrMCHK5mq9EBpr+Nk1b7mWBEbkaNVH8YQMvJldA==
X-Google-Smtp-Source: APXvYqyNjLQuWt7u4TbYn6Fr5VCbbvpJLZC25VDlMbo81qPC93k/t2OonplTOmmtRgVMNBB6dy+vXcl1rFN2GtPGtaY=
X-Received: by 2002:a6b:b987:: with SMTP id
 j129mr25537368iof.166.1562005976714; 
 Mon, 01 Jul 2019 11:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190630150230.7878-1-robdclark@gmail.com>
 <20190630150230.7878-4-robdclark@gmail.com>
In-Reply-To: <20190630150230.7878-4-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 1 Jul 2019 12:32:46 -0600
Message-ID: <CAOCk7NqS+0Z8JOaeCX+f+t8aKno14bi++N8EX4-1XA0AKd2rZg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/5] drm/msm/dsi: split clk rate setting and
 enable
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5XH2Sgqd3f1qItnFcP6aNN21WN2gIql8Aj/n31a7/ks=;
 b=qSJb48epcJ44fqai80lK1au6m1JjSIdQZrDhYdZlBLTLfvHPyVP6yCEJzlYUU8rsl8
 DetRS296GhrTsYU1MdFOJ9PkVvw1oLqwmw5bOm5ArkivRkbE0kwsCW3UtF4LCkI5BNYr
 n7UQIk++RH6FRVFQlcIVkhtnrg2bYzpdPz8s61m5626G1S4JcyFm4aauzopw6/rM8kcG
 ThDIFcnEHeQhOPlN5bRtwmkgZgkeLkhamFfl9nkspVNRdTeDvAqMTsscfKrkWjbf+vWQ
 A8wtFx7ny8j6KeimI7tdOHKFhhZSqmhyPpdLhpWDXGXO4Ab4iAlQHbS5RoyCEhv152Uu
 dpaw==
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
 Archit Taneja <architt@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org, Allison Randal <allison@lohutok.net>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgOTowMyBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3Jn
Pgo+Cj4gUHJlcCB3b3JrIGZvciB0aGUgZm9sbG93aW5nIHBhdGNoLgo+Cj4gU2lnbmVkLW9mZi1i
eTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6IEplZmZy
ZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
