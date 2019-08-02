Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4FC7F5AD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 13:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CDD6ED65;
	Fri,  2 Aug 2019 11:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF42B6ED65
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 11:03:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v24so72569746ljg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 04:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HL5ANZc7OmpdOHZ2ionlww4aSxrQXJYtiezr9bkrTNM=;
 b=MiRQiNinLe6IXWTwRuaIChxJnJ0qy0GCr1PNIpP5Y8TaYFb2gZC608d4XIlPlqHb8b
 XbkRp6nQFxWHbij0iKo8T+xM6OqKhQefI/sYM3y0dnP/D7t6V/pSoBytCcXZg+LL6tN4
 0OG2KwqBmWmGucQABBTaC7vC7o6dagpUCt9hVGphI2RD4mbcTwOStjfqTbsbkNht7chU
 Sb4i3tKYx3ZlyeQWoim4XIBGOpR7my/0WC41lpAy6Lf1Hpk31IYlqdiW3kmscIzpj3JZ
 7er5WO5A+z4EzbiIhF/H+hkiZ6rgUQmVB8w4rdtv2OGqCZwgMSZXPnVShsFhgkh3GE6a
 NCig==
X-Gm-Message-State: APjAAAXhWT4tnMTKMCrlR6KxMJAyz5BiCY0My2xd7U1Fta4wn2zPZ17q
 5zhIW24+v7OzWt2fuzVCAQ2940DExDukFBRgpoE=
X-Google-Smtp-Source: APXvYqx5oq7vowqqKfwUYf1UttJH3upuyx969PtPyuX0ERX2LffNrQWKhyKNYV1lXA+tl4HP/Csy3WbhjxRbgRDo4oM=
X-Received: by 2002:a2e:a311:: with SMTP id l17mr7778322lje.214.1564743790013; 
 Fri, 02 Aug 2019 04:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <e5484fa33bffec220fd0590b502a962da17c9c72.1564743270.git.agx@sigxcpu.org>
In-Reply-To: <e5484fa33bffec220fd0590b502a962da17c9c72.1564743270.git.agx@sigxcpu.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 2 Aug 2019 08:03:22 -0300
Message-ID: <CAOMZO5BipmSPR1jz3ov8ESSJPsHMViMw42di-WKOdqhyONLK6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: Drop unused imx-ipuv3-crtc.o build
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HL5ANZc7OmpdOHZ2ionlww4aSxrQXJYtiezr9bkrTNM=;
 b=UWyYMwM6+6cdywPrYnOa4onNfoqc3kPU6dOJncvLK+hh3FuKjPGAoJLstXqe5LzSJK
 Opz0J1kGQsQFI0tleEdxhxiDeaQwXxejbiY3WIORSdzjX33te82D6yBYoFxQ0WTmWnde
 5ZvWrsvaMo0svhBwb+1LojGe+1iVDsRVsD9AuA7E+AR73NzRh6l+e5kSdwTlYj6AmODf
 LXzVBOFLH7Nksij+P0GBxuM87d6OrE6M6lRpAhpGOR9jbQMrm2BpavcwtjTbzLyO6nQC
 pb4YuUet/oEg5JbebXQ7XieDP05fgXRYXHjyyCvH5+e/mBcEPAAnuJnBEUxmRsumCbK3
 C/ug==
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sCgpHb29kIGNhdGNoIQoKT24gRnJpLCBBdWcgMiwgMjAxOSBhdCA3OjU1IEFNIEd1
aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+IHdyb3RlOgo+Cj4gU2luY2UKPgo+IGNvbW1p
dCAzZDFkZjk2YWQ0NjggKCJkcm0vaW14OiBtZXJnZSBpbXgtZHJtLWNvcmUgYW5kIGlwdXYzLWNy
dGMgaW4gb25lIG1vZHVsZSIpCj4KPiBpbXgtaXB1djMtY3J0Yy5vIGlzIGJ1aWx0IHZpYSBpbXhk
cm0tb2Jqcy4gU28gdGhlcmUncyBubyBuZWVkIHRvIGtlZXAgYW4KCkFjdHVhbGx5LCBpdCBpcyBp
cHV2My1jcnRjLm8gdGhhdCBpcyBidWlsdCB2aWEgaW14ZHJtLW9ianMsIG5vdAppbXgtaXB1djMt
Y3J0Yy5vLgoKQXBhcnQgZnJvbSB0aGF0OgoKUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
