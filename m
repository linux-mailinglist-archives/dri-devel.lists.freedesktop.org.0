Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD58726A3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEDD112C2A;
	Tue,  5 Mar 2024 18:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nV6qdoWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78591112C2A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 18:37:07 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dbed179f0faso15541276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 10:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709663826; x=1710268626;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoNrumIdDmxRFKTd8oqeNhVL7nHIUTBgQcYMEPSY5hU=;
 b=nV6qdoWWufVBPDsmKsSglsNgxoOzVrgS2LWzlEOL2UCnC3YUfTekIBYYDLx3QSoIjI
 VYamZyp5njktXbtDf82VHC9TofxDLoyO2rP8IGe8u0nadEBECni3v2T+BP02bv9vx+S2
 pJGynkekqnFwmNxqmswOVyZpbBU4z7iyqTc7pWCyBf9EVTAD4xFeaBt3+0KS20Pfop6C
 HcUO+SZWSbmXgusb0WKRLNChMRsewPvNEVBPUUW0NQawtOj0el+w9nnFuarqeZiH1xv9
 5lZgc1GEBDGNyyRto/H9wPG50KxLh+sxtRvmfAuOaMA+uE6l73NdGxGdhV/s5DVRS9Kv
 OStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709663826; x=1710268626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xoNrumIdDmxRFKTd8oqeNhVL7nHIUTBgQcYMEPSY5hU=;
 b=eEI32b38U0sKh0ufWKzKNB8VlXJnOAdKcIyXEbW25g5uO6JGVKE6k3dJmQIMTg6gBf
 Rujd1aNrjuordDSQ4NywcITZNwW6zha2Ylqx4esla4Gb9Ng44zIluOR6UxPvcTRCaSc/
 w+y7Z49mUYXsjKTioDrbAnT38SsOm5nxEnzc0z5nmjuDepsynn0yHdTVQ5qLvriSfPRw
 zNswrGedQ+0LnZf9Uxod7swyHwvJqjtEYSG2lnL3O2eirgfS3WkriGC3Ny4EkVUOWPJr
 WbXsiOPz8u1CxPT7je7S7q9n2XWAyyfq65OjByjOx8int9mKPAZtkIaRX1lUdO74Qj40
 FRgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/+k3Co72lEEniSA4c8ZVLlfiBvCNn4rrDfkQ01HyA1YYBoFrQg5TNRKUVvpWNDPlJQoWP8DuQSqUqq71hr1DwoPpmX0lTDjlCjDxI+J4c
X-Gm-Message-State: AOJu0YxpU+LkvNN5nijtLBRAPSE2ggZGzrXNCOkvb3Of2XpnYKc0ihws
 rDCab+suZiJLUVwEFO3iNVWbYB2XoDPDxW/PBf/BLtp3V32k79SWmTZiCRxZCJMDP/ZIg57BYJr
 Im2TS83sq80WlPCqxSycRTk1famIyDc89qxTb
X-Google-Smtp-Source: AGHT+IEoZFcKgWl/szXzeyOtASBiJA8GR+9pZvgd3lMN7BXMAj+p5AQ3HQCYYWPBUm119ytYheFglLY62BfeRkzUV08=
X-Received: by 2002:a25:870f:0:b0:dcf:9aeb:73af with SMTP id
 a15-20020a25870f000000b00dcf9aeb73afmr2705895ybl.2.1709663826235; Tue, 05 Mar
 2024 10:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
 <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
 <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
 <gdkioaqffaoiocsybn22qwfpkgz6cujy5oklrdicgdcbatlsan@v7qjtak5jacn>
In-Reply-To: <gdkioaqffaoiocsybn22qwfpkgz6cujy5oklrdicgdcbatlsan@v7qjtak5jacn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 Mar 2024 10:36:54 -0800
Message-ID: <CABdmKX0PKer3PF49ypH-8XBMT8rsm3xi3ia1iJB7DVHfFS5fxQ@mail.gmail.com>
Subject: Re: [PATCH RESEND drm-misc 4/4] dma-buf: heaps: make dma_heap_class
 constant
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Tue, Mar 5, 2024 at 10:02=E2=80=AFAM Ricardo B. Marliere
<ricardo@marliere.net> wrote:
>
> On  5 Mar 09:07, T.J. Mercier wrote:
> >
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> >
> > Is this really a resend? I don't see anything on lore and I can't
> > recall seeing this patch in my inbox before.
>
> Hi T.J. thanks for reviewing!
>
> I'm sorry about that, I sent the series only to Greg before but I
> thought it had Cc'ed the lists as well. Then I realized it was sent
> publicly only once. Double mistake :(
>
> Best regards,
> -       Ricardo.

Cheers, glad I don't have to try to rework my email filters. :)
