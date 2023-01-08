Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3BB6613A3
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 06:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502CE10E1DD;
	Sun,  8 Jan 2023 05:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7647210E1DD
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 05:09:14 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id j18so731801vkn.10
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 21:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BW9SCwkQvWRl+q9IQ687IZ0RzMYUR3VBChAmUMeDYGQ=;
 b=KeBAh68k2DqBr+8SwBK41NwQ/DpgQbnjiaPags7V6E5+Kl77w8ZLd14iM2YadgfsVk
 pguQFg8RCL7ehQ/GePzW8iLiBmjSGxoDqLKiasK7gxYvYHXc64m3aVdoBnwp6Fdek4Ey
 MTvgRhlNmhV+u0mOHrZkJxN5he0lwmgF4bquIDY0cCC63N5y7wh75975HDNBtOk8gRat
 lSPag94ioFFbN74u8AxtuV5lvN/u4271hy/YD5UOyogr2GgL6bRRqZ8PwHnC0AQB0FTn
 OPpoj6nFCXtlAH9vdpffUxuGxootziAF1Dpw/EbQcnDo4j/sCKk7Oq6G1JyFGKDG6xP3
 /nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BW9SCwkQvWRl+q9IQ687IZ0RzMYUR3VBChAmUMeDYGQ=;
 b=4s9QR2o00ZkCD+hIduALv+0hYKk3T/9KeVT+JTrO6KChKUtAD3a9KcPQddD+X6Sx3e
 Naus+iI1KFl1zrgUZD9hvskQfr847rVdb2v01C9RB8GSVExOEDlIIRsOznPTzop7buEj
 nWkfLq7Ev67O0c3AXcLo0Gnk/9Fg70dLxGK8H2WbvyEkDo5MLbz0H9Wi1eHzRjsn3x+B
 YiD31vhTgrDNBWqRQ/rwLzTYyXP7A5SUi1ldYBcGXcA2+7rUwE7oHC1Om4Et80IL/15R
 4a9pOvfEHLMDLi0HTIGbouWvOquXL8aiLfc0IgcVAfPTFYf1GB21AyZEZLL+xAEaemjf
 FdNw==
X-Gm-Message-State: AFqh2kpWhaPFtWiqgnbQb77F+0vDy6ahiEFQz5OnP3tPE5pRzJHSW+JB
 3DoGRh+Rst0/rxu6QSb0pTg7IW6FkmDhzmQgxC104Q==
X-Google-Smtp-Source: AMrXdXuhGAjWmdFvDqNPZrxlfLsxfrrUZGIpqg9fe5TPaKBWWURCFlqNvG//0e+7ia8CQPjgkbZJHisOcBUL+EbTRk8=
X-Received: by 2002:a1f:aad5:0:b0:3d5:4f47:3130 with SMTP id
 t204-20020a1faad5000000b003d54f473130mr5838577vke.3.1673154553152; Sat, 07
 Jan 2023 21:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20230105052325.514970-1-yixie@google.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
 <Y7buUnTE91GC+VZb@phenom.ffwll.local>
 <CAOvqHj68uPoPdBrbKaBMg4QOre-EjRJOH12XqBBR+1bAx-fQwA@mail.gmail.com>
 <Y7fvyQ6Ve6duSjho@phenom.ffwll.local>
 <CAOvqHj4r8OY53bQ6aKLVtSUKnpc4EnTyBjtpPcnWGtGqp8QyXA@mail.gmail.com>
 <leMSjV3Lro5cqAe0WzDVQVYXRhIpds5U9oz8eI1Of9Ee9uvW2d66cmymBQg5I6uJFcSOWLYSnXS5SwrHMxSK7j96LNOZlwtee1U9QYxR3Bs=@emersion.fr>
In-Reply-To: <leMSjV3Lro5cqAe0WzDVQVYXRhIpds5U9oz8eI1Of9Ee9uvW2d66cmymBQg5I6uJFcSOWLYSnXS5SwrHMxSK7j96LNOZlwtee1U9QYxR3Bs=@emersion.fr>
From: =?UTF-8?B?VGFvIFd1KOWQtOa2m0BFbmcp?= <lepton@google.com>
Date: Sat, 7 Jan 2023 21:09:01 -0800
Message-ID: <CAOvqHj7BHT-7y5tarzTxz79ArdmMVFEy96TthDLfRJH7z5NMEg@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
To: Simon Ser <contact@emersion.fr>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 Yi Xie <yixie@google.com>, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 7, 2023 at 2:45 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, January 6th, 2023 at 23:28, Tao Wu <lepton@google.com> wrote:
>
> > On Fri, Jan 6, 2023 at 1:54 AM Daniel Vetter daniel@ffwll.ch wrote:
> >
> > > On Thu, Jan 05, 2023 at 01:40:28PM -0800, Tao Wu(=E5=90=B4=E6=B6=9B@E=
ng) wrote:
> > >
> > > > Hi Daniel,
> > > >
> > > > May I know what's the requirement for adding render node support to=
 a
> > > > "gpu"? Why we just export render node for every drm devices?
> > > > I read document here
> > > > https://www.kernel.org/doc/html/v4.8/gpu/drm-uapi.html#render-nodes
> > >
> > > Thus far we've only done it when there's actual rendering capability,
> > > which generally means at least some private ioctls.
> >
> > Hi Daniel, it looks like vgem is exporting render node by default.
> > Per my understanding, vgem provides some DRM API so users can play
> > with graphic buffers. I am feeling it's natural have a v*** device
> > which provide
> > the surperset which vgem and vkms provides, so it sounds like it's
> > natural add rendernode to vkms, or do the opposite, add kms related
> > stuff to vgem. I still don't get the point: what kind of issue it
> > could bring if we just
> > add render node to vkms? If your point is, we don't do that for other
> > kms only devices, then my question is, how about we just enable render
> > node for every DRM driver? what could go wrong with this approach?
>
> This is wrong for at least two reasons:
>
> - A render node has a semantic value: it indicates whether a device has
>   rendering capabilities. If we attach a render node to vkms, we lie
>   because vkms has no such capability.
Thanks, then my question is, why vgem provides render node? What do you
mean by "rendering capabilities" here? Are you meaning things like GPU
acceleration?
> - This would regress user-space. wlroots would no longer accept to
>   start with Pixman on vkms, because it detects a render node on the
>   device.
>
> I'd advise moving away from abusing DRM dumb buffers in Mesa.
