Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1270DA1B4B9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6850610E00A;
	Fri, 24 Jan 2025 11:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="LQNiy2xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F17210E00A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 11:24:38 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-467b74a1754so25902011cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1737717877; x=1738322677;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uSwIQn3q6DJ6JzGwQQYYwW7PXBuBtFjF9xWF4zwmSb0=;
 b=LQNiy2xpvuzuXD0n11KnpOKudOpL3+BJKdUBdVySm+sbL4ryXCj8IbuHY2/lw7aI2K
 Aywuy04kf2sujEGRq5K4nnczrfEI3lTVuTinqv8AxkDy3c+iBGF7rk12npDe4humbuJm
 D7821cVcNs6r4BOzsaGLpsIHCfutNnHXv+nLA8NtKFhVDqihKhN7bU1xQn0N6IeHbS59
 uzomVduqX0UBEWrbmynL9hjZD+GGu60scpNDtG+XQR84zLVvrVv06V4arsvLE+qeSMKh
 Tslq43Ldj/raABe7x+gJYeTIdPoLvilSF1QN+JazYxhj4GHRHYm/efCI3lGRZVRYbkzU
 1luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717877; x=1738322677;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSwIQn3q6DJ6JzGwQQYYwW7PXBuBtFjF9xWF4zwmSb0=;
 b=ldIYGfNMJLSPFAJOiBdaxTy/glnTBBXBQ9PuMaXxPlVheLWRwqGHx2wBxSDm0OMgwn
 ZJKbiriGLaaPGtIEz+N3Ls4EuU+GKBehb0mza5cd5kpbD5+1IuSpagEWM1wHR+TZ8QGL
 t4uXVJxTruzvp1LBzlZyPPqAs+H/O/wFjfBqBOpPO4opOB1Ir2ubcE5K0Q1T7AdLvEfs
 /lnLpzmmQte9lNJprwPUf6nvtn5U5sqcoTpnzSy6vDTCrZQFHcULceOycg47+BiXLZo5
 WAa7oYZbCJoK7ZIyOk8UvELJ03B+k9yvBvVc8N9FWE/x6TEKjN2RVK2Jlg0FlzMgFRrB
 h8Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQB6BixG45xXbOT2g6bmhR3RJIHWtDWxeWoDP0T799XTLAX4KLc8qX5adepcJ+XTv4lR7QxtwvHK0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycCQRo7EXWYjCIu47qy2SR+aOjdELBZsLvlvv6z6TwBiKcRLSW
 qvZn7HNxMAokXSMB9wFLXRV6UWEZt3GabjFPGEu5CT+7TqfngZmzyWTDA4MM3SnqtHvqbZ/Kp7q
 OQf24Nd4OWac252u4qnDk95SmYsZglfuiZAnshA==
X-Gm-Gg: ASbGncuFFzv88JM/F5UtgrBelYagCj4/zI3UUpKzs1ieVUikuy0ABMoIANq1WpNiVPh
 gkTuGUR3/EW+zAApkbQ56rudMJEYp/u4q5+VOPrjNjBKN+UoMuF6exofFcFc=
X-Google-Smtp-Source: AGHT+IGdpcEkMj8Aj+cnCDVnRZ9NHekdj4ptTnAv2xY3PDgC1Tsoj6d0rS0py31vxfQ+0NqfKDETZlt+FvsQh2Np3pA=
X-Received: by 2002:a05:622a:1806:b0:46a:3709:6780 with SMTP id
 d75a77b69052e-46e12a693d5mr420988611cf.19.1737717877543; Fri, 24 Jan 2025
 03:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20241219174929.126205-1-eric.smith@collabora.com>
 <CAPj87rPQZTg2Laws1BdzL-UOLV6jWinJqM=GeLdvm7UNEEnrdA@mail.gmail.com>
 <27c6cd114cd37131582e3e81716d09074cab0223.camel@collabora.com>
In-Reply-To: <27c6cd114cd37131582e3e81716d09074cab0223.camel@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 24 Jan 2025 11:24:26 +0000
X-Gm-Features: AWEUYZnIWaaGDciu1eXCMezsiIK02xVEn7zFnJZhmAcLTRv7QirKJYRsKgzQgQo
Message-ID: <CAPj87rN_CcX3U8rz-TRa8be354VkNcbJnxqGwWF3ftaHPQogtA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: add modifiers for MediaTek tiled formats
To: Erik Faye-Lund <erik.faye-lund@collabora.com>
Cc: eric.smith@collabora.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 healych@amazon.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Heya,

On Fri, 24 Jan 2025 at 08:42, Erik Faye-Lund
<erik.faye-lund@collabora.com> wrote:
> On Thu, 2025-01-09 at 13:14 +0000, Daniel Stone wrote:
> > Thanks, this is:
> > Reviewed-by: Daniel Stone <daniels@collabora.com>
> >
> > I can push into drm-misc as well, but give me a bit to get dim set up
> > again.
>
> This is not yet in drm-misc, my understanding from back-channels is
> that we're waiting for some sort of ack from MTK. Do we have any
> timeline for this, so this can land at some point soonish?

Well, given that I said to you this morning that I should probably
push it, before you told me you'd just sent an email to prod, now's
probably the time.

To gitlab.freedesktop.org:drm/misc/kernel.git
   798047e63ac9..3ab334814dc7  drm-misc-next -> drm-misc-next

Cheers,
Daniel
