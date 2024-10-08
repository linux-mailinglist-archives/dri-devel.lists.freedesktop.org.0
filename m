Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA699506D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1879A10E548;
	Tue,  8 Oct 2024 13:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ja0m963s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B9610E476
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:17:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42cb7a2e4d6so53735095e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728371842; x=1728976642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqD8iqeCt0GqppWDT8y8/ry5l0Y/IERdHPAHK2N/B+k=;
 b=Ja0m963sLHYf1wrSSXfo1nPchy9asZSUzChtZtwJe9dV8l6Q4zGnfLmIgMW3T29PCi
 4QipKDfjgTSTB2BTAv1vmPhHuluQ6fF5d9AfA6MeYGw0W8gx1pOyWwwCuoNbv2hzRUKi
 tUoX1wlL1mttBRfj2/ikoAIgxYm1RjixzB6TN7SSrVm6V9XR10KpewXmZn9YuuaxEvYI
 mKENwDUadrCCfCK/WiTTgVOPSLdZElX8NY4plO+oVI3VwW4rk0xkzwpTgvnDecgPMVTg
 PnNyhYY2gUfa5Qmag4YXzldEGL36BTHrMMEur/gJrOCjdCkMJdrtY7Bz6vyL5xqbfmCq
 yC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728371842; x=1728976642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqD8iqeCt0GqppWDT8y8/ry5l0Y/IERdHPAHK2N/B+k=;
 b=U1/zXaVUsU1cuRlcO0JCY/fwMHSkX036HQvzdfYMJ+kysinpZS9ho127C4cUJ85S2L
 hp0QCMMoknCFKo6W7xH9VwPatD/cqtHlGskE1XvwC664UyxYYtIuhpQ3T2ndNflXPspf
 fh6MLaJ0+xmnU23wD7gJWTuoqaTQNE72ESq7PCgC7Ahep3r2L/QFyf/rUfXNkARna4hq
 kHrPNwXdDft7o4ukm4/GYW0R6GfdMJ//2ioSmdHABcnm1QpUrUqCLjYCA3gHahfKZjrV
 UmbXw3L6tNrLyinXPQdXWwRcmQ0c8e+coQyVjYRuEOo0ZZODgExSNIy2XfCOhM5ao8x6
 bm6Q==
X-Gm-Message-State: AOJu0Yww62kaY5Qk6vR6aNoBT8mgaejBacVld3OWYyydjG8F55WM/LB4
 nQdKYIklTw6utAP/0izC8TRci2fv5/DEl3bUrZMaQ6T5ErpRpNf3L08akKr8HfptVSX0rNrm01f
 X0ueLJblzY1oN72eb+DpgBUjJdQ==
X-Google-Smtp-Source: AGHT+IHYqrHlksLmb+lIQAF3s95zgOe5Mj7cA+9ugMm8JXbL5HBLLAud3+BbO/26fB1ycD4CsNH4EPqGVpbnhy5L/Lk=
X-Received: by 2002:a05:600c:4e89:b0:42c:b750:19d8 with SMTP id
 5b1f17b1804b1-42f85a700ecmr103217595e9.4.1728371841994; Tue, 08 Oct 2024
 00:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241007201356.10430-1-alex.vinarskis@gmail.com>
 <CAD=FV=UsLHQ5KkOekMntQ1GK=TFoGKN9kaMcLnUmXBLtrmP4qA@mail.gmail.com>
In-Reply-To: <CAD=FV=UsLHQ5KkOekMntQ1GK=TFoGKN9kaMcLnUmXBLtrmP4qA@mail.gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 8 Oct 2024 09:17:11 +0200
Message-ID: <CAMcHhXpSDe_kMc0hbOEzKu5fOqKTb_u-_H2CjFHdyi7TpTNQ=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/edp-panel: Add panels used by Dell XPS 13 9345
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com, 
 Peter de Kraker <peterdekraker@umito.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 08 Oct 2024 13:41:08 +0000
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

On Tue, 8 Oct 2024 at 01:04, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Oct 7, 2024 at 1:14=E2=80=AFPM Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
> >
> > Introduce low-res IPS and OLED panels for mentioned device.
> >
> > SHP panel's timings were picked experimentally, without this patch or w=
ith
> > `delay_200_500_e50` panel sometimes fails to boot/stays black on startu=
p.
> >
> > LGD panel's timings were copied from other LGD panels and tested to be
> > working.
> >
> > Particular laptop also comes in high-res IPS variant, which unfortunate=
ly
> > I do not have access to verify.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > Tested-by: Peter de Kraker <peterdekraker@umito.nl>
>
> Your signed-off-by should be _below_ Peter's Tested-by. That means
> that you're the one that signed-off on the fact that Peter tested
> this.
>

Got it. I thought the author's signoff (me) would always be first.

> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> This looks OK to me. I've been requesting people include the RAW EDID
> of panels that they add in the commit message, though. Could you do
> that and send a v2?

Probably missed that requirement, my bad, will respin.

> Also: note that since I didn't see Peter provide
> his Tested-by himself, I'd probably wait a little longer before
> landing to give him a chance to object.

I'll drop his test-by, and he can mail in himself directly then.

Thanks for the review
Alex
>
> -Doug
