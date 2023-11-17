Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0917EEE0E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 10:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8371E10E735;
	Fri, 17 Nov 2023 09:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2210B10E735
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 09:04:04 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-da7238b3eb4so1810970276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700211843; x=1700816643; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=INxHYDPvWZEfX4YbefK8xCXn7NpSQ5SeCE7fYLVC5i4=;
 b=pbq9N6/rwThj+CoMTItljOBTASpFRrreeqRuFNu65EHc3BrBw9um9WtvltUmVzEw2v
 7d0t1f4cMwTeDSlEjN8bd5AGQNACqXg4icL4tOrdGFcAA8o1bqt9dLQOJBLZdnDRHRZc
 9KG1H2X76+adUprVvJNFgqgFBGyYZv/+7VK66xfviBU1HUyzw67izJzZkx9IUEF4vpgU
 he6s0k8KYnhPE/6Ow73yE4C4+JTc1N4XU7Sdrx4OtTjBleF5WuPTODjW5J0ZXgsOGmKj
 96SykPvV3z6/dEDy/+0Rw0wX04qUTRHdtb89ATX4aht1X/C1a9gHNsdbL1kpeLTiFhkG
 uz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700211843; x=1700816643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=INxHYDPvWZEfX4YbefK8xCXn7NpSQ5SeCE7fYLVC5i4=;
 b=aXg0tmyOhc2zAYAcltFKAY55Qw3mZuirSbyMzJ3I5MZuPum76iD6yTSR9nSGeNIbT/
 7E/HQWZKjVGApkHxGIeW4n7acFxxYhDuyNK2pI88oOpxW0QuCCsibchO5OKzbsnCHxv4
 1AQEWijlJMiJSL51N5HxMuJ4kQsXkIcFO6b2xzJGfk754vq7vu+amZ3ChyMoPxDRpU1f
 txsITHK9/HplwdUxWwRfKQM3+tIxjLZW7AJRfleMxT66VX9mcwVF6OGAVnuW1wkz3bs5
 iMtSf6HUY6/dYO9GQTVQkaSL35nOffnRsWer1+tOC3FjMHXLsiF4DcSSNUM55iFNTfO3
 wYEQ==
X-Gm-Message-State: AOJu0Yw9Z/VPGygh/69AmwVNZ/e+flWbC1FUfwb0V+08p97+bNM+zZKz
 ZwhOgX9kXJhc1boda83x9ndiE5YeZMtoxoeExZUA6A==
X-Google-Smtp-Source: AGHT+IH1pWflHfi8hN98JclJU1bBwV+AayAuHAiCbo2Yy6iJi5kz8hoy6KNUMTIHH4XZlaK+GjuYo/OBc5e8YA7rimg=
X-Received: by 2002:a25:107:0:b0:d81:89e9:9f48 with SMTP id
 7-20020a250107000000b00d8189e99f48mr16791660ybb.63.1700211843160; Fri, 17 Nov
 2023 01:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
 <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
 <cf27d25a-3e51-4292-af63-37e5bc585d88@linux.dev>
In-Reply-To: <cf27d25a-3e51-4292-af63-37e5bc585d88@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Nov 2023 11:03:50 +0200
Message-ID: <CAA8EJprm6FL9_ZOr5uBXNXLBt=scs=FY2o6ZEv5r576iEM5KRw@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Nov 2023 at 06:24, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
> On 2023/11/16 23:23, Dmitry Baryshkov wrote:
> >>>> Then you will need some way (fwnode?) to
> >>>> discover the bridge chain. And at the last point you will get into the
> >>>> device data and/or properties business.
> >>>>
> >>> No, leave that chance to a more better programmer and forgive me please,
> >>> too difficult, I'm afraid of not able to solve. Thanks a lot for the
> >>> trust!
> >  From my point of view: no.
>
>
> I respect the fact that the community prefer generic mechanisms.
> If our approach is not what the community want, can I switch back
> to my previous solution? I can reduce the duplication of our
> localized it66121 driver to a minimal, rewrite it until it meets
> the community's requirement. I know our device looks weird and
> our approach is not elegant. But at the very least, we could not
> mess the community's design up by localize. Otherwise, I don't know
> what is the better approach to solve such a problem.
>
> Can I switch back or any other ideas?

I keep on repeating: create the i2c device from your root device
driver, which parses BIOS data.

-- 
With best wishes
Dmitry
