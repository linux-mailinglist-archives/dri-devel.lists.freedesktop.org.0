Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A944B7A1DA1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 13:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373C010E177;
	Fri, 15 Sep 2023 11:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928F210E177
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 11:43:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96E31B82D2C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 11:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4574CC433C8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 11:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694778216;
 bh=FlAHMnQkvWyp23uJAvJzhK6xAIyf+lyO3vske58RO3o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QNHUtpw18u6+udjFQsqTWGxhVUWD0IzQnCCoF7X3x0CuWB1cZCi2wlOZ010/hlhB3
 KHpBPRclBuesfORKB0TUnmVIUTxBuZvVZei38UVFBU59RMEOC2vP+MMpLJp0akDZqy
 jfSLhZBb7RVTQsUtuS5ZukQXnGUkeSX7lzOD/TT/EXBT6GuF52608QMnN/XZQ+qxLD
 NIsy1gGaz/B1rL9Nweq9LKkwg2WA0k0FerERj4sf1lS6rIRw8TLebC0cxX3pyChJq2
 MGNR1zxJHxGswFOUNgDJru2ZF7BsEKm/9wkxgaPYw5aKDYS2mUoyp6yCT3ua+ibYnB
 jne3QBuMteV1Q==
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-68fac16ee5fso1863182b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:43:36 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw9DsWZu7XcgTjZnOHlpIahjFRDFH5BMEKqpqvq1aYxBorf2t1N
 5b2uNBF88lHFs6ZZa/r+B/M2OQKW/o4rf2opwVns/A==
X-Google-Smtp-Source: AGHT+IGUuLKgUwNtIjG1fIGjq/Ez1QTYt06r5r84TvYJ54GxUMB058oLN/ORSHhyBlBTkhJxXDYp9jz3IIFX4/sP1+g=
X-Received: by 2002:a05:6a20:2446:b0:147:fd40:2482 with SMTP id
 t6-20020a056a20244600b00147fd402482mr1772669pzc.44.1694778215877; Fri, 15 Sep
 2023 04:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131951.2473844-1-jani.nikula@intel.com>
 <e20aa74f-3b40-4901-963d-41fa8286244f@linaro.org>
In-Reply-To: <e20aa74f-3b40-4901-963d-41fa8286244f@linaro.org>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 15 Sep 2023 13:43:24 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5EBbRmKn9A_2R5MHzuqw5+-5UMWe7b4ZF1vRdR+5oHwA@mail.gmail.com>
Message-ID: <CAN6tsi5EBbRmKn9A_2R5MHzuqw5+-5UMWe7b4ZF1vRdR+5oHwA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge_connector.[ch] files under
 bridge chips
To: neil.armstrong@linaro.org
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 12:31=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 14/09/2023 15:19, Jani Nikula wrote:
> > Clearly this should be under bridge chips.
> >
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Robert Foss <rfoss@kernel.org>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >   MAINTAINERS | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 354ac7ef553d..c331f2ea89d7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6909,7 +6909,9 @@ T:      git git://anongit.freedesktop.org/drm/drm=
-misc
> >   F:  Documentation/devicetree/bindings/display/bridge/
> >   F:  drivers/gpu/drm/bridge/
> >   F:  drivers/gpu/drm/drm_bridge.c
> > +F:   drivers/gpu/drm/drm_bridge_connector.c
> >   F:  include/drm/drm_bridge.h
> > +F:   include/drm/drm_bridge_connector.h
> >
> >   DRM DRIVERS FOR EXYNOS
> >   M:  Inki Dae <inki.dae@samsung.com>
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>

Acked-by: Robert Foss <rfoss@kernel.org>
