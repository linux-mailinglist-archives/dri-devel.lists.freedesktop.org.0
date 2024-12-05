Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82A9E4D06
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 05:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833FB10E380;
	Thu,  5 Dec 2024 04:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LK+Ekh4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F93110E380
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 04:27:11 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ffa974b2b0so3519941fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 20:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733372829; x=1733977629; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hGG58PPNUdG6yFsy5c8QvSogOQV4k5XxMtrE/57gdpk=;
 b=LK+Ekh4VIoibAI5bRTJ7CsZRmkXxe/d0/KXQHKGF4z4JO5oqUES1DG0VVt9ktbCENI
 TldDSuvgliOTDC4KKGgjR7THWmY81qxKpF+zjer5lzGV1fHY07lqXvNQBoHubCaBFmPr
 ObcYDTg9QECs/kYchyTsl5L2vL6txMdpOIPO5pt/2Kv6o5vsiw4YLzVC3VySf1lfgoem
 pLfrsEMjs/xK6Qu+M/e6vyRCcryFNjQ3AM5MY9UIqwRftVrioP6Nk66s/BDEATH9+AUV
 GywdX+IFd6Cz7PaoCMhHPUZPq8LvEBdL0vPrq0tiR445J0wz6kwSeVXhKTlrSpb5gVUH
 B4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733372829; x=1733977629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hGG58PPNUdG6yFsy5c8QvSogOQV4k5XxMtrE/57gdpk=;
 b=O7I7ctft2ISc+8RSnJ0MQu5cgkX0s3r+ZMKw/wYZ6sHkX37PYFCVa/6ixiZMLk8TS6
 YN0sapk83vZKSXPQEkkauP2OG7iG7v6fQCUFUs0a5Fbyxqi0afleNBa43uRfE24ffpcJ
 VptiRr3CD8GWyJz2Ym1xvR1sJ/j8gjUA6XevxchkTuyFoQDDIVE9M1JuP1N4WJWJSdRx
 K2q8sEgxDIcBkolnQ2MNH82GC0CLaawmkgPRE93H4Hpe6+L98UhGIz9QJz1TtEIcugzh
 z2TiHlTlcU5MvlKxbj3WPkKskbuySjNlSbTZfMacf4nNtqp0EZJ4gblH98+b1tqTETN+
 cLHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW5uf5JxsWhhM8Tzh/5TK33moaSbXJ6iaHr+IBzvrhjU57lQp5dxmJRBalT9bWydtyTQfQPFkS1to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhePSEXcKir00IsjbbsjKfYKvmUTzp652rRHVnDE+AgjRKLifs
 4Icy3qy2zQqzMibCT6HS1z+LTBbmchpTT0/9uOI38ceGYGzfWTvYr3MUcctJvuCWRO4ufKHpMlB
 2S25dhpxXwZhNYLTRtQzWEqCkqt8=
X-Gm-Gg: ASbGncsCk0WW3sjyT/iFUe8xaHMSX3igP0oS9BaFihQS2zyviA5a3BJxj5iyJzIryXd
 R1zoN1CXvfg0RBaCzz4CERsAkRCA0nVmOuJWEQgwOUI2c1vVKgQ8Ucby9ew4ZDg==
X-Google-Smtp-Source: AGHT+IGwq7mHQY6OyBNEWfVMfyb2cdRLN/ZLgtIRU53T6xPRl/DZ+46JSQtVSZqp9f+QMloMtKsfVEqih2zUDNpYWgY=
X-Received: by 2002:a05:651c:885:b0:300:259b:58b6 with SMTP id
 38308e7fff4ca-300259b5c69mr270441fa.5.1733372828750; Wed, 04 Dec 2024
 20:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20241007150904.9840-1-advaitdhamorikar@gmail.com>
 <rr7pp6a77tmur62vu2xdpasokokta7g6kcgjcd4iydmzyqpd5e@z45genf4gsv3>
In-Reply-To: <rr7pp6a77tmur62vu2xdpasokokta7g6kcgjcd4iydmzyqpd5e@z45genf4gsv3>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Thu, 5 Dec 2024 09:56:57 +0530
Message-ID: <CAJ7bep+Hc4Uw1WUBANtR7UGfVrDVyFe_0iPJ=ja=EczO6kk9Nw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/atmel_hlcdc: Fix uninitialized variable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 anupnewsmail@gmail.com, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Just a gentle ping, this patch was never applied.
Is there something more that needs to be done?

Thanks and regards,
Advait

On Mon, 14 Oct 2024 at 13:08, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Oct 07, 2024 at 08:39:04PM +0530, Advait Dhamorikar wrote:
> > atmel_hlcdc_plane_update_buffers: may use an uninitialized
> > sr variable when the if condition remains unsatisfied.
> > The variable may contain an arbitrary value left from earlier computations.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202409240320.MZPgi3Up-lkp@intel.com/
> > Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
>
> Fixes: d498771b0b83 ("drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops")
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> --
> With best wishes
> Dmitry
