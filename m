Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9475C1E4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCD410E639;
	Fri, 21 Jul 2023 08:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD17E10E639
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 08:42:55 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso13524995e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689928974; x=1690533774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XQaE+aGAoPiWTrzxC0m23eci3gy8Nzf0koJxtpNK2YA=;
 b=N2h3UNJDdhqd87L3F4mYmBXLz0qK1XjoAFFJkLXJL1KKoYmOgmauzLv185j/ocWYA5
 R3etvIdFfA2ZAkggjQMd+poAmzQfVSvcsKMAoR3TgARskd/Rqg5htrh0tAqZFbm020Q6
 EhTfIwPbnUM8RX+KkLUC/QvNUXBwqtk05iaLgVGW5/ml0lYCOH9AAQiG2jw9/OVbQTYd
 sPYqSXzbVvHjiO297NGcXQMx+BbECWhZsHR6Z2eL2XqeB/IvWoqSLhivGEkxUMN50hlg
 6G5rCstvluru5Nbve2rK0+JFlo4a/7uf7gcJKLy6AYImNAoLJDVS4tn2rrKhZpSALEYU
 +V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689928974; x=1690533774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQaE+aGAoPiWTrzxC0m23eci3gy8Nzf0koJxtpNK2YA=;
 b=NPPaqEghRe0WPg5PjW1t0nX+gUw9bxVPx0YyhaRvm6vshDPiyFzzmOIhhyj6jS3Xv6
 TNX1juv8QIlwZc9pr3cgFo1FI/S9x4g2ZRpDSDLTXujUZp8zPhYunvArsNHS6z9HwS8f
 6Gd3g+NoA6IXz5/OHOl9od3CO7QP3ZyD90FRG64EZ4rTUA2p7VtyvrcrAwUGca2OJBzv
 GFTbdFIlT4dsn3ol1pJVJXXaKeeZWBKYhJo/HJ32IKytItbaKiZAwCAM3lV56Ihda1vb
 7agxsae84pcNiFDiQNAWU67fsq2reyHf2Fy2bt6/HlP3u+ccs/cGsz/OY16s9yZQ0OqF
 4dMQ==
X-Gm-Message-State: ABy/qLYNqrb8cbvQU7hH6Refeoe4SdHrVnohxI7K3nC/k2QY7v/+APZ5
 Ey40f4IRAOOfU5TGs/0B7bWYPbJrxUnY2Si7YJSQSw==
X-Google-Smtp-Source: APBJJlE3K30Gc1FY8KUg8IGeriUSJfp+eK3+VTcAwyFZWEeBiWs4OcFMYvjx+IJ5eAdxug70zn9QFQ==
X-Received: by 2002:a5d:6ac8:0:b0:317:15f5:a1ca with SMTP id
 u8-20020a5d6ac8000000b0031715f5a1camr925360wrw.10.1689928974175; 
 Fri, 21 Jul 2023 01:42:54 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 u1-20020adfdb81000000b0030e5bd253aasm3564628wri.39.2023.07.21.01.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 01:42:53 -0700 (PDT)
Date: Fri, 21 Jul 2023 09:42:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v2] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Message-ID: <20230721084251.GF2525277@aspen.lan>
References: <20230721073555.1377236-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721073555.1377236-1-victor.liu@nxp.com>
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
Cc: "andy@kernel.org" <andy@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 07:31:37AM +0000, Ying Liu wrote:
> If gpio pin is in input state but backlight is currently off due to
> default pull downs, then initial power state is set to FB_BLANK_UNBLANK
> in DT boot mode with phandle link and the backlight is effectively
> turned on in gpio_backlight_probe(), which is undesirable according to
> patch description of commit ec665b756e6f ("backlight: gpio-backlight:
> Correct initial power state handling").
>
> Quote:
> ---
> If in DT boot we have phandle link then leave the GPIO in a state which the
> bootloader left it and let the user of the backlight to configure it further.
> ---
>
> So, let's drop output gpio direction check and only check gpio value to set
> the initial power state.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Based on the discussion for v1 about 706dc68102bc ("backlight: gpio:
Explicitly set the direction of the GPIO"), I think there should
be a Fixes: tag here.


Daniel.
