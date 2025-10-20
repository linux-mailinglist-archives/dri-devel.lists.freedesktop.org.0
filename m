Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6B8BF19CA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0C410E27D;
	Mon, 20 Oct 2025 13:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="dKBWkawh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3FD10E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:47:29 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-87c1a760df5so90143416d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1760968049; x=1761572849;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKZZMRJedp+rsMnIrxlIXP5u4ASLGgSVqwDMmcqgOpA=;
 b=dKBWkawhVKMzMKbVMqEjGBJe7CejQIt5wEdRpgijj+7rH/wviOowTFtiUIAaT54KJq
 2Ed8beWUeFSa9Gb2na46h/u4YI5aVagJjXcbQ+3/QFeERdx6ZF9Byo6eFkcS+E7H9WCs
 s9na2jRZBrIMvdISxrLJhBH0EreVPIytwzqSnf2KP2ixajZNFxXfSkPAr4l7ad6f0IEq
 CZmh9a0LqIswkoXqwO2Gd9mXqSu26u6Q0TEhnSx9CTQ+uGwFeTnN2l9nRsW1F0w3mySO
 66vxtf9iHcWEEsvclxsnVc0vIdae7gnIIUuHEhLZToMvMj/kVFDV8+co9ebaMvNmsbg/
 2w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760968049; x=1761572849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKZZMRJedp+rsMnIrxlIXP5u4ASLGgSVqwDMmcqgOpA=;
 b=wX7svgTsQ9zLMFJNBzKWX660JaXGTTYZNm6UoPIHAZVsoGvCCkulFeKIOhc7I7YJOn
 DIV+gFK6ARDpnRbT6FL2nXDani9vEvEIp/TWLHf2pWGaghh9m2iSPK+dQ6NWXmj+p4mS
 pN9SDGmCAxr+hej+SswP2al1WJ2ygMzqpr9b4mn6T2/Uy/l/ikkO2V7kSxb1yn4hegrM
 gboE0sGY68OWtib0t2lUhGU2Nr46Sjz645pOsDV7hpG28GH76QD+DIo0ZT6JVyMVOKxZ
 Exn10tgK2t0gpfFZijM1Rukk572OIGlPqv3+gcXgdfBGpKKdLWjAyToW3l8f8JJNKWlX
 DZiQ==
X-Gm-Message-State: AOJu0YyBFr3axjOcKuiLi1oh1sDmz2Wi/v6yYZIAyEsMl/QyGT7PKaf7
 aMZvZabEUI+mtwB2XQJn+q2Bf5NkodaKPD8ZoSnRF5Hl9pCtEzGViXu0avSAku5tohESG+tnq2Z
 BNa2a7RJl4OMndUBrnJ0oPOHpYqcxu8cRy2ta4l8VLQ==
X-Gm-Gg: ASbGncuBXPJ0OfTJ2X36aKpQmPqh0FTs16uzOO70XJc/zMdfp1WPs8dOsw28jhPRVTl
 8nzcQHC3mZxMTAxwSHDzMyAzYYpF5hpXBFdfXWpLOO+lsvv+9TGxBIQTrjGYgy12IERU+9pdH5H
 er//Ct7wEdcsPxHmtOMHlWqRdUedVqKXDxPm8JD8IglfBgSmhEqRKSWHMu0xDIz+okddmrJ0cRp
 QHPGClT4+v5iHGTRWzXvRn+s1YCwIyQUcxU/0HTWVdSa6u4sT1qGOh4C7aU
X-Google-Smtp-Source: AGHT+IEnb3jLcZkFDQjKr/hsinDqFhBEWkF2GKiirCkzyc0lfgX5M31zvX+r+4+6Y68G44Rh++XEnKxlypZYhubFPJQ=
X-Received: by 2002:ac8:5d0c:0:b0:4b7:8d26:5068 with SMTP id
 d75a77b69052e-4e89d1d931amr163580051cf.17.1760968048673; Mon, 20 Oct 2025
 06:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251015110042.41273-1-daniels@collabora.com>
 <20251015110042.41273-7-daniels@collabora.com>
 <26943126.6Emhk5qWAg@phil> <6535426.R56niFO833@phil>
In-Reply-To: <6535426.R56niFO833@phil>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 20 Oct 2025 14:47:16 +0100
X-Gm-Features: AS18NWCgqd3zZokt6jwa2aW8nEJhFag9WPKoss1venrEOp6eY7Q_I6V1in552vM
Message-ID: <CAPj87rM=Zvg9HbJ71FCmbGXAe32R0B1yLwRwyS0ztEy6=aww_w@mail.gmail.com>
Subject: Re: [PATCH 06/13] drm/rockchip: Switch impossible format conditional
 to WARN_ON
To: Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, cristian.ciocaltea@collabora.com, 
 kernel@collabora.com
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

Hi,

On Mon, 20 Oct 2025 at 14:25, Heiko Stuebner <heiko@sntech.de> wrote:
> Am Montag, 20. Oktober 2025, 15:10:31 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Heiko Stuebner:
> > Am Mittwoch, 15. Oktober 2025, 13:00:35 Mitteleurop=C3=A4ische Sommerze=
it schrieb Daniel Stone:
> > >     format =3D vop2_convert_format(fb->format->format);
> > > -   if (format < 0)
> > > -           return format;
> > > +   /* We shouldn't be able to create a fb for an unsupported format =
*/
> > > +   WARN_ON(format < 0);
> >
> > What happened to Greg's
> > "But don't add new WARN() calls please, just properly clean up and hand=
le
> > the error." [0]
> >
> > Also, switching to WARN_ON would then continue the atomic_check functio=
n
> > where it currently does exit with a real error code?
>
> So while I can live with WARN_ON as something that should never ever
> happen

Right, I'm following the clarifications from jgg and Kees in that
thread, namely that WARN_ON is being used for 'how on earth did this
happen, the code is somehow completely broken' situations that
userspace should never be able to trigger under any circumstances.

> I still think atomic_check should follow its function and report
> the error upwards like:
>
> if (WARN_ON(format < 0))
>   return format;

Happy to do this if you prefer.

Cheers,
Daniel
