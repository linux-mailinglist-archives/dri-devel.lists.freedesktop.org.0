Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A99B5E41
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 09:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47D10E2AD;
	Wed, 30 Oct 2024 08:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Cwcga/9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192EC10E2AD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 08:52:31 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so7938386e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730278349; x=1730883149;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZnoNZrdZV2/crQbUH4IG8um4cL2sl75Grz7lZVdnH8=;
 b=Cwcga/9yyI6gy1nFOcn9EnAaSRHlnnuGreNoM4cdvleSJ5Kc4Qdr8BpLSGrtXeGxzt
 gXIhZVHW7XXlfNGhas110rnDwLKlDbEzmGLrFgxz8mtrMR+5kvqIgbBI6YSFSkJAGNZn
 HQDIZsP/T+PD7i/6Pwu1fZteKHcEWHYdDKXf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730278349; x=1730883149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZnoNZrdZV2/crQbUH4IG8um4cL2sl75Grz7lZVdnH8=;
 b=bt0Exqjc5eZWX5N8xYSO2+vR8FqWtm0aRbkF42aff3unKk9mV38ZG85gnT2D01srlX
 DE+l/uZkJmQjf2boUmrsFjV/l2uU/nU/zFk1BpjQ7oh+LInb38EaCKvL2hGcesyURxOL
 Sm9ms+x19nzUu95DeaT4MHCE9/I96A5yUnMXeIJS2YPS60dghEARsagidqtuM1hH9NAe
 /Fa7YFbGcQw1w3jTRbSYgZP/GTGmdwYKMavpb42NUV/bKlZzFNhedJfJJqUhODQRYZyY
 I1CqoF2R0LitAzgeXm1xF0Wx0oX/d2kOlbTKhtaEYYPYOv7grA5ZbF2eqdZ9V0K+dDN+
 1j5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmI2u6zK1UknJ4d1HHEm107GBw/vdC/X3j2fMxlP8cSDjxgOdAnMGkORKruwCW6KPtpT2Q2/K3YF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweLlJxAm3b29oOJHGwBJ69NQJpehvhFI/vwg4clqOdIHUEVe4W
 shpFnDlgj/XCEfYLpN8D5VXHnuYmclwe+f07BnyiGM8VdGJS+guqhVHpvyk6uYVx3a8LvItPKD/
 pPWQswOpjS7powIsOXZLUasXTVbgf9B0OTSYr
X-Google-Smtp-Source: AGHT+IFN+5L8Zy7+Hnrc96LK5WeSb49IZ59brkNk4NXUJ6HqftStgtUU7GRQnbHmisIT1dsrtBDF17VQ5Tz/yjajEuE=
X-Received: by 2002:a05:6512:350e:b0:53c:74dc:2252 with SMTP id
 2adb3069b0e04-53c74dc2378mr320758e87.49.1730278349113; Wed, 30 Oct 2024
 01:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241029111309.737263-1-wenst@chromium.org>
 <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
 <20241030-hot-peridot-falcon-57bdbb@houat>
 <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
In-Reply-To: <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Oct 2024 16:52:17 +0800
Message-ID: <CAGXv+5EWyGGKYo+NNQ3Ykd3QUUO2cOManSnhZQaVhhCnupNx=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mripard@kernel.org" <mripard@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>
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

On Wed, Oct 30, 2024 at 4:48=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89)=
 <ck.hu@mediatek.com> wrote:
>
> On Wed, 2024-10-30 at 09:25 +0100, mripard@kernel.org wrote:
> > On Wed, Oct 30, 2024 at 03:30:34AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=
=85=89) wrote:
> > > Hi, Chen-yu:
> > >
> > > On Tue, 2024-10-29 at 19:13 +0800, Chen-Yu Tsai wrote:
> > > > External email : Please do not click links or open attachments unti=
l you have verified the sender or the content.
> > > >
> > > >
> > > > The recent attempt to make the MediaTek DRM driver build for non-AR=
M
> > > > compile tests made the driver unbuildable for arm64 platforms. Sinc=
e
> > > > this is used on both ARM and arm64 platforms, just drop the depende=
ncy
> > > > on ARM.
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > >
> > > I find this days ago, but I don't know there is someone who apply it.
> > > Let this patch go through drm-misc tree which already has the bug pat=
ch.
> >
> > If you are ok with this patch, why didn't you apply it yourself?
> >
> > I think that's very much the expectation, so it's probably took a while=
 to merge.
>
> That's ok for me to apply it if drm-misc has no plan to apply it.

I'm confused. The culprit patch is already in drm-misc. So this one has
to go in drm-misc as well.

I can try to apply it to drm-misc myself, or have a colleague assist with
that. I'll let it sit for another day in case anyone has something to say
about it.


ChenYu
