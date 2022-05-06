Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656B51D690
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 13:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5E8112110;
	Fri,  6 May 2022 11:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E73311210E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 11:22:04 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d25so5994518pfo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QzcULi/NEqbiq1KZArjdeAAEvQ1r8nGAdFnTPkHvJCk=;
 b=ubvSKp2j/nBF7QMFlpnNddBMuL4Ti/91Iq/ANnrM6O+RwKiwiOmjptsRCCVKWb/pSK
 0P7FpRJQ7jcPnKPI4ipxwLWvoQ9HGZ0ab0G6sCo2vK0UQXzHJ70J/R2Rpgt55mzqPKVf
 B9kf5VHFjTBz+GeCXYZMV2ZNOrHoTArjO+0oX0jF4fPgPS0Ptqc7SMbCzJIyL8SVSX66
 zRVGcZdOzfw9NxEylEh9I4bIgehE2Sl7EtudZhXF+sa6MVho54b6HvK6VPNkZ7JPR1y+
 5hWAl1wmuXXgulEuuxdOzbkGlb/FsbFuNtizKHQWXfRI7Jaqo0q4crImrFOkNQqfsYm0
 2GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QzcULi/NEqbiq1KZArjdeAAEvQ1r8nGAdFnTPkHvJCk=;
 b=pawgXjYTVK5U1tzF7uNUmxDjFZpXQkRpnBjfgmEKgrmbtepsMLNJIEWvacfyb/Rsnz
 xkl0MckG+UWdCtNdzhEExyO6KmehVHw3UAVGOnAb2J9tVrBqOKEkd5ZgmnqAPNYq3Hs/
 xnpt17NZCYKQ+QzNHgTagH+nfgumQCb1kX2mLVZp67iqkTLVpYB9OfnnXtRJrYxhTLgi
 QMmeRkJF1813FW1BrKP4L+xpHA/nx5zayJGDS/Hj0wWaLS2/0KKYUFXZefqi+rKq00RT
 wI51ju5dUMSWTDsZDgVxU24dbGgfDwIcESEcOBbapqRsrfzjVt1JEfh/r4uDp3NTsx6/
 Z/WQ==
X-Gm-Message-State: AOAM531/utnlyk4jJuG3YbEa7h+HaSuPz2ObTT1M19fKx/CieCc2xjXW
 KjcVxNU0vdPbgGk15K3REetegBBAFJc8RGvfS9+OT0n8AmI=
X-Google-Smtp-Source: ABdhPJxViGPU/wM/TPfR8O6YJ6fZB1sR3gBTzkfEeuZcRh9eJ3J968t5HKPbYeVQKhGbB3eqCTtgUiD+Z1oOg9JjsqI=
X-Received: by 2002:a05:6a00:174a:b0:50d:44ca:4b with SMTP id
 j10-20020a056a00174a00b0050d44ca004bmr3115682pfc.0.1651836123935; Fri, 06 May
 2022 04:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220426193645.244792-1-marex@denx.de>
 <YnB3008DXAVoUK7j@robh.at.kernel.org>
 <6a079a60-f6b6-f432-b9c2-0444ab5ecd09@denx.de>
In-Reply-To: <6a079a60-f6b6-f432-b9c2-0444ab5ecd09@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 6 May 2022 13:21:53 +0200
Message-ID: <CAG3jFyvdANjKd-0cMz+srgkeYt16wOdOKiF-6m4W5kk2=1Mn8Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: ldb: Implement
 simple Freescale i.MX8MP LDB bridge
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> >> +description: |
> >> +  The i.MX8MP mediamix contains two registers which are responsible
> >> +  for configuring the on-SoC DPI-to-LVDS serializer. This describes
> >> +  those registers as bridge within the DT.
> >
> > This is a subblock of the mediamix? Please add 'reg' for the 2 registers
> > even if you use a regmap.
>
> I submitted a patch:
> [PATCH] dt-bindings: display: bridge: ldb: Fill in reg property

Would you like me to apply this, or do you want to revert all of the above?

>
> > I didn't find a binding for mediamix. You really need the containing
> > block binding before a child node.
>
> Right, I'm tempted to send a revert outright and wait for the mediamix
> bindings to hit upstream.
