Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2EA3E266B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 10:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7496EAC9;
	Fri,  6 Aug 2021 08:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7145B6EAC9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 08:49:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so18530200pji.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 01:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qH33sCsdvNwcAdOQ4lar/ZHxaC7E5XO1MhHrUGkGMBc=;
 b=qnjQoQHxIRp0+bdqIOvjJH1sDDkSWql9GHtrk03LrS5B5Z3SMxi8VhakOWZ+Iwxg6x
 uSAIwjT+spwj+AgvcNmPf45kLcJ/14J0SjZlVWndlWspGtYr/ABoFwpWJFaXS0p+Jjam
 uI3Rtf27Ni+Yc2gZXBqbpZ+czxTBr/VKBHr9rr7uq1COQ6aWFIPjRlXJdEX7b+j56IWD
 tuXKOu2xW+TlWXCj5M3mFaJhSpnSiXCeYUXP23qvARP4J+HY8imRy43LRbbN2LQpe1N/
 tmHMnp1q2uxDIcuUOTqsN8TH6CUAR/EKJvJpe/dNPE0AUBZ5PZ3ayeD1T2KZfzvhcq3u
 SwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qH33sCsdvNwcAdOQ4lar/ZHxaC7E5XO1MhHrUGkGMBc=;
 b=uL+/lwqNCFD2WpOQh+53TqHQyYJORAbZRtydQFWVi/PGr0yq5LqjkgvQsBZG86qrn6
 94ceFp15uMgHnzXSUC2fqCWP6pRkk6HbIxpohiokJb/GpjMPs591nmLyWKdTwaxLw4Nu
 fHWxVj1QfSIiHISeNQFYTpDhhJ7Akr4rRDiVaG7DkNLEykkpDIEmhx0/+UtsuPPzWNYd
 lo1e6QouxcCRvqY0vfzZg8BmhhfaPhBTLbnoBNObXhuWS/GkZggfH5dyV1b3IttxWqnO
 7cgP03qHM0INy1ce/UikohERH0jsJTl2Q6tVw8uV822waTIq2yLjc8ZFnciueNFLZjAM
 WhRQ==
X-Gm-Message-State: AOAM532IuoRW71jLHdhgkdP4pb01fwGI8kROvhNAbqYptiZ3RY1r8Ujx
 Z5s3mOivHEQ1z+ikX6+wliNpniKNY89iwCyuGI7B7g==
X-Google-Smtp-Source: ABdhPJxUhN/2FiGiUbmdum2JbNWeh6/kiZCCEu1OuOrMDFEjeINK/6Q251/JuXK0kduq937OlbfbkvOIwcmmF/EonvY=
X-Received: by 2002:a63:494f:: with SMTP id y15mr408472pgk.185.1628239799068; 
 Fri, 06 Aug 2021 01:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210805185039.402178-1-robert.foss@linaro.org>
 <3283765.IqGz30O6Nz@kista>
In-Reply-To: <3283765.IqGz30O6Nz@kista>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 6 Aug 2021 10:49:48 +0200
Message-ID: <CAG3jFysCX25k2QQqTqHCt3HRCG-s6cn2f99L7WM23K=zHv_wOg@mail.gmail.com>
Subject: Re: [PATCH v1] drm: bridge: it66121: Check drm_bridge_attach retval
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Aug 2021 at 22:37, Jernej =C5=A0krabec <jernej.skrabec@gmail.com>=
 wrote:
>
> Hi!
>
> Dne =C4=8Detrtek, 05. avgust 2021 ob 20:50:39 CEST je Robert Foss napisal=
(a):
> > The return value of drm_bridge_attach() is ignored during
> > the it66121_bridge_attach() call, which is incorrect.
> >
> > Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>

Applied to drm-misc-next
