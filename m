Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F5A5E2DE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 18:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D230510E053;
	Wed, 12 Mar 2025 17:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="irtKFsc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71210E053
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 17:35:18 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5e5c9662131so20569a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 10:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741800917; x=1742405717; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6itC58RDPc9+jdX4hl/V1XStffyRKyTd6Z2t1zkuSMk=;
 b=irtKFsc4qU3wVwg9N+4sv15llBJJIXctwgb1ckbdxnh2pGHat05KUalp2v/Ge5ra4m
 VJcXInEX9GC+akvxDVG/XPwxmPPAhCRz2UzkbeuFMRTQKTZnmqZrpyajufNbdeNqZSAb
 howuvf2aq5fl7PC0wxxWrtt4rndEL0txBin2iS0avxMH69K7s3sVvQ2fDMWSgIS5eLTn
 M50vwAHItp2RcmZdICL+wKUrAvjCHk4pUU5yDk2ZIyQ40TezFEp8cLSwXlQOD8p92Pem
 O1jhp9cULxeHOqa+nxvEvxOxFdXKwcp7W2yCyhu2OSlXAjyEH4IPGYBUcGurgYIR3OXO
 Xxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741800917; x=1742405717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6itC58RDPc9+jdX4hl/V1XStffyRKyTd6Z2t1zkuSMk=;
 b=VKkMZXTdK5eKOTRGqCDX5kjRQKRqcOpKsTzdaHIY9ezR9ZNyJVaF8uIKI12Wvbu02i
 H/t3sPfQO+VR3I0fcSWOTl0r0j3TGU1UcgAezF1FLUyVhZxJbeteKI6IedLhghT0Wooy
 qpt3UyWT1YMeNRZx/fA41X13tPBm8QinrBsshFwdBHAG8e5MFdN1G0ANbXFFLWPc3jQB
 ka9zbkn5I+3m1msUvRNTV7ECPc8rE4fUGb+eDMLM3QiwyXuvLoyU0ZhpaDISLzJbisLI
 VaaTSEjChmDsHKqGvwAgPLPxe+mYGVlxdLWaB+lyeqEjqAzKT+P+aNDKmmdvddVfr7mg
 stNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz3GJ8oiyGPsdOy43AEu5VLuVhIX5l0f4bhG4jj2s/VV8/8yk3gkDH/vqy4Hr1SZWiG9Q2BGGjCvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxt7lZFMAOIoOteRrc6vefqb2Ns+e8QqKgRF2PkQv61ghvyk0V/
 o5hsAACYYNpSOJgr7xYDp6QFzx+z7JyPMRgsMOs8qTrUBXE3JlG8T3UjUHzYscsnj3LS9C5iYiY
 RiVlfXy2+x7z5pi7zoVDUI14zgM4=
X-Gm-Gg: ASbGncvxqlWugz5Zo0SGkcZHdodNwN3xA1n8p4owQCjybaXz+5/ye14RyyPjVEZv3b3
 5IgmbaYd35fmc3xC7mkIgUEWrvoEgqr4Xa9b1n3L1a1ra9OCieLBKR4+WgIaa87xsZh+yCge4XB
 wt36JBX4u7OH6trekf3oIcIutfrBG1
X-Google-Smtp-Source: AGHT+IFDzeYP1Rd72+Vr7SCEfb7pdNq50IjtiFv+mj1QSr9R/2om6v0abAOf0Jca+TaJsRapGKORZ3/gIqQ5/3PgskU=
X-Received: by 2002:a05:6402:50cc:b0:5dc:7643:4f3d with SMTP id
 4fb4d7f45d1cf-5e5e22b1c7bmr25671828a12.1.1741800916472; Wed, 12 Mar 2025
 10:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250228132620.556079-1-vignesh.raman@collabora.com>
 <CAPj87rMqHWtovJy82WXuJ4ZsKg3PbD7Z4hX3kzOYpUyrrdxE2g@mail.gmail.com>
In-Reply-To: <CAPj87rMqHWtovJy82WXuJ4ZsKg3PbD7Z4hX3kzOYpUyrrdxE2g@mail.gmail.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Wed, 12 Mar 2025 14:35:04 -0300
X-Gm-Features: AQ5f1Jpu-8A8U8eE3tfSxfRNN2kIgOKjLIFWgW5B5DHqO3j2Kp8f5iiPIZ4lXDE
Message-ID: <CAPW4XYbC2nbUfRG13Jxeva+wD62c30L6Pp2ia2S4bt1XiXc3vA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/ci: fix merge request rules
To: Daniel Stone <daniel@fooishbar.org>
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 daniels@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
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

Em seg., 10 de mar. de 2025 =C3=A0s 05:25, Daniel Stone
<daniel@fooishbar.org> escreveu:
>
> On Fri, 28 Feb 2025 at 13:26, Vignesh Raman <vignesh.raman@collabora.com>=
 wrote:
> > Merge request pipelines were only created when changes
> > were made to drivers/gpu/drm/ci/, causing MRs that
> > didn't touch this path to break. Fix MR pipeline rules
> > to trigger jobs for all changes.
> >
> > Run jobs automatically for marge-bot and scheduled
> > pipelines, but in all other cases run manually. Also
> > remove CI_PROJECT_NAMESPACE checks specific to mesa.
>
> Thanks Vignesh, this is:
> Reviewed-by: Daniel Stone <daniels@collabora.com>


Applied to drm-misc-next.
Thanks!

--=20
Helen Koike
