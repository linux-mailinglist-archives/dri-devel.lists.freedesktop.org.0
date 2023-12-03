Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B59802624
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 19:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF10C10E153;
	Sun,  3 Dec 2023 18:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB1610E0B7
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 18:10:43 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-58d1b767b2bso2518084eaf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 10:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701627042; x=1702231842; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hNWrRac9X2HwvORQ757NwocfD1vnHP+xf8IZ/qHDI6Y=;
 b=SDUCeGauOivMcETfmXx6hltODOK6yDoRDHG9EsYL3WkAhLy4HmrO4Vc/aGALRVnTDe
 ZnnIHqlB7p/V0QW7X+mJHM1mB6XWs+sTFUes13S1b5VyWFLALN7y9EFdE6Uv8iJmunYz
 98ihZIgnUKdes1PorVxn9OXq18YtPkzHiH7mMrxMHzBEzTb0QjXB+DezGKArY+44MOjY
 0ERgvGsCjZ/H0f+DyiBxghq5AS37A1PNFbjIWWOrVIqvY8jxADYArUtagyXYkOXP9EwA
 W7RvBfPkadV157zpeD28lHMdZoFBMkJCe/YLw53iNE26jpH3vCS34KhwtLnQRQD79dKe
 D/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701627042; x=1702231842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNWrRac9X2HwvORQ757NwocfD1vnHP+xf8IZ/qHDI6Y=;
 b=toX2IWqAPJ0FqQm6viX1z1hr4EUEpKWRm7sQjuIA4U/VNEJoZAHlzZJK5J/VW+u0OW
 RSnRjXqjC+xD3SJPGupHsucL3mCh3hQvPpvdqlBrq+XNfTXn4akrzd7WNUbt+WlKjIK5
 IBLo3vXckpytPj4TWyq9fGCdVY9LzrNMVMmNlih7uU3S6mSEtqt72Ews1d6WQL+sUeAj
 +uG6p8t7a8tPqTb+GN4ZpLztU0m/uOlr8U5aCQEnxnIAUVGuC6+W4mOM2fkXM08wVRYr
 Yd0TcJrIHZhyioodu7rGHddkVnXQpjw73U2D4oOsWi/zw6d4Pl56wvBiuz5D6q6gzppu
 8FUw==
X-Gm-Message-State: AOJu0YwaV62bQluLu7grwvH8WdfhU1gLu0tniSHRAXUdAypPpQOI7QoB
 JAY6ctDquTf4VO9ade92M3UpHHbQxeY5uJHBoQYHQQ==
X-Google-Smtp-Source: AGHT+IHb3Z+Gg112hSwn2ALLmEQLugH9ogYS6oGgilydDX+dwhOwywfw0uwnNsBepyMljqTdUfek1dtr5E8c4G2RWMA=
X-Received: by 2002:a05:6358:9214:b0:169:49f7:cb1c with SMTP id
 d20-20020a056358921400b0016949f7cb1cmr3149078rwb.8.1701627042402; Sun, 03 Dec
 2023 10:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
 <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
In-Reply-To: <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Dec 2023 20:10:31 +0200
Message-ID: <CAA8EJpom-guy0p_u2kLhXgLZnJaVXCXaHAUGhv2EH=xyrHtL6A@mail.gmail.com>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>, sebastian.wick@redhat.com,
 wayland-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, ppaalanen@gmail.com,
 Sean Paul <sean@poorly.run>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 3 Dec 2023 at 14:15, Simon Ser <contact@emersion.fr> wrote:
>
> On Saturday, December 2nd, 2023 at 22:41, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
> >
> > > Some drivers support hardware that have optimizations for solid fill
> > > planes. This series aims to expose these capabilities to userspace as
> > > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > > hardware composer HAL) that can be set by apps like the Android Gears
> > > test app.
> > >
> > > In order to expose this capability to userspace, this series will:
> > >
> > > [...]
> >
> >
> > Applied to drm-misc-next, thanks!
>
> Where are the IGT and userspace for this uAPI addition?

Indeed. I checked that there are uABI acks/reviews, but I didn't check
these requirements. Frankly speaking, I thought that they were handled
already, before giving the ack. How should we proceed? Should I land a
revert?

-- 
With best wishes
Dmitry
