Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A82A7AB7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BBD6E1B1;
	Thu,  5 Nov 2020 09:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B2C6E1A2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:39:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e6so943054wro.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=O1Ptw4Z6fyBehqHYaSzRs4kWOAuaPAg0Ode7nAckbcI=;
 b=lKpQaFbU6i/iQQXHpRtJTGXfYs5EE0e3aodsqlp9QeGZmsffh7RlWk6IgDeVl3o0xu
 pCR6lgT2aiZdhtCXaEuOujnJnud52nziMgKE/ONeqKy0MceI3gfkv1uZ9s99xqbjxUIO
 Vpo4p2Ieo08cBXUL1E7nyc9W3Vw9jo8uYdI0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O1Ptw4Z6fyBehqHYaSzRs4kWOAuaPAg0Ode7nAckbcI=;
 b=XnRqevrSw+J1cmHanxy5AkcBZpJaGUg9gaAlnDALRdZFl7KL/LuLIX4zIh9Po0SpC1
 Qwo++sqg9/XlHut1ywjaixDwZrBvNmhwNuvzpWDktcmp59RUUPUG2LE95mLImBYs0yoX
 2Lk5KvYe1zp5gduhEHznEMowwmA0IEqQ91EyCeFRb7Vzq/6DzFL/WljTegTkJTDflV4d
 kfuwCzQDorVKYZDzjncfGOEOxVkRPEvSPZs0CK/Q9m1hhrraSngCcYVmK+WwdeR7iA9d
 pG69NB77liKjKU2V+TLJ0qGEATfir4rpaLGoDZFtulHquFQS7kNhDk/B2QXKjry4Hu3p
 utlA==
X-Gm-Message-State: AOAM532n3ecD7VzxaSBxjwWO62ZadUKoJVNPHmRiCIsIvqzcEea01Ott
 dRy7neBmKIjoAv3D7iLyhFcbgA==
X-Google-Smtp-Source: ABdhPJx0auxQhwpogPi8nd2blZkbW8w0U5S07Gfgt4vJP6rs0bEwZ2m6v9NXVsnccnnz4cQ4Yr52UQ==
X-Received: by 2002:a5d:424e:: with SMTP id s14mr1796145wrr.131.1604569188294; 
 Thu, 05 Nov 2020 01:39:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c2sm1720811wmf.47.2020.11.05.01.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:39:47 -0800 (PST)
Date: Thu, 5 Nov 2020 10:39:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/stm: Enable RPM during fbdev registration
Message-ID: <20201105093945.GS401619@phenom.ffwll.local>
References: <20201104125200.259639-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104125200.259639-1-marex@denx.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick =?iso-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 01:52:00PM +0100, Marek Vasut wrote:
> Enable runtime PM before registering the fbdev emulation and disable it
> afterward, otherwise register access to the LTDC IP during the fbdev
> emulation registration might hang the system.
> =

> The problem happens because RPM is activated at the end of ltdc_load(),
> but the fbdev emulation registration happens only after that, and ends
> up calling ltdc_crtc_mode_set_nofb(), which checks whether RPM is active
> and only if it is not active, calls pm_runtime_get_sync() to enable the
> clock and so on. If the clock are not enabled, any register access in
> ltdc_crtc_mode_set_nofb() could hang the platform completely.
> =

> This patch makes sure that ltdc_crtc_mode_set_nofb() is called within
> pm_runtime_get_sync(), so with clock enabled.
> =

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Yannick Fertr=E9 <yannick.fertre@st.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com

This looks like you're papering over a bug in your modeset code. If
userspace later on does a setpar on the fbdev chardev, the exact same
thing could happen. You need to fix your modeset code to avoid this, not
sprinkle temporary rpm_get/put all over some top level entry points,
because you can't even patch those all.
-Daniel


> ---
>  drivers/gpu/drm/stm/drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 411103f013e2..d8921edc83db 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -197,7 +197,9 @@ static int stm_drm_platform_probe(struct platform_dev=
ice *pdev)
>  	if (ret)
>  		goto err_put;
>  =

> +	pm_runtime_get_sync(ddev->dev);
>  	drm_fbdev_generic_setup(ddev, 16);
> +	pm_runtime_put_sync(ddev->dev);
>  =

>  	return 0;
>  =

> -- =

> 2.28.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
