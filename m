Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4119F757450
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 08:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCCB10E2D5;
	Tue, 18 Jul 2023 06:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D7E10E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:37:12 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-47ec8c9d7a0so1885507e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689662231; x=1692254231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gBoG3t1UefRa8EkOhssPB7UZLWGuGIe6z2Ts9f7jOk=;
 b=bEke5BuJ8ozhIP3kmA8f3lB0O2yXtncsd0xG7i5YJu9GInFfFvMxV8pyQcoUJc/iza
 Wkt58V7uHgG+4P026IwVUvMLWnEppGnx7bJQOZduKfkIFCFsDiyqZ7DA2zYPb4R8MFOk
 H22RYXHd4wDn8A4b496I7MK44cLzBSIJEskvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689662231; x=1692254231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8gBoG3t1UefRa8EkOhssPB7UZLWGuGIe6z2Ts9f7jOk=;
 b=TAce2lpv4gbvUDFo36xn+JpbMi0RJ0rVnrSaQONYLYnxJ24PNrMVNX4tgo0/OtLeFi
 awwdJlcKMYw06kVzELWkrXptk8Z4564csOOoVmFaSCzqzXWl0EMRHM5C1UVMNbDNd0jw
 xe4+ZTPaXll/XWLEcmxyysdg93HpmzGxeRb2HFuxOUdXneL2yB+0qxAmx5YBnptgkAfH
 ihdqM9CxnX0uj0mhHfYB6Pk3yahOGQySecCYbPj+XhJv8zJ1DUPKDpwb5nQP9HyonjfT
 J0Ly/CU6XrHw6PjbdEmpwmwgCLJqCWFTOu6rtAFGOCxPCUcxAez4sS5lrwyjUE3keEr6
 B3Ig==
X-Gm-Message-State: ABy/qLar5zCL6/GvnwcCFmaSlpOafawQCwiLU7voM6r1ASB1qEhZXw0Q
 fSu1P/0GnR5z1A/lJfiKpEdo76TMrLA2dMtscAeEvg==
X-Google-Smtp-Source: APBJJlH1qnC65qp8EOsAPsktOzCwybrfdVeNXU1/cIgj71YvePCV7l/VEGzQzcTLdXzUy67HQB6TtAIg49/fUtpYi6s=
X-Received: by 2002:a1f:dd84:0:b0:471:cfa1:5065 with SMTP id
 u126-20020a1fdd84000000b00471cfa15065mr1103389vkg.3.1689662230790; Mon, 17
 Jul 2023 23:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230711091155.2216848-1-wenst@chromium.org>
 <CAD=FV=UW=VrrCB8Ko7ysWTia--hG6t+4BmRwodY=nkL=DyP6CQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UW=VrrCB8Ko7ysWTia--hG6t+4BmRwodY=nkL=DyP6CQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Jul 2023 14:36:59 +0800
Message-ID: <CAGXv+5Fu1JR_9Mjn+hQNnh+iZYL6D9u=KM4AuAKEkSW3JTNxhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO B116XAB01.4 (HW:0A) panel entry
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 5:40=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Jul 11, 2023 at 2:12=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > This panel is found at least on the MT8183-based Juniper Chromebook,
> > also known as the Acer Chromebook Spin 311. It matches the common
> > delay_200_500_e50 set of delay timings.
> >
> > Add an entry for it.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index fbd114b4f0be..df7e3cff004c 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1866,6 +1866,7 @@ static const struct panel_delay delay_200_500_e20=
0 =3D {
> >   */
> >  static const struct edp_panel_entry edp_panels[] =3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B12=
0XAN01.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B11=
6XAB01.4"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B13=
3UAN02.1"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B11=
6XAK01.6"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B=
116XAK01"),
>
> You're about 1 month too late. ;-) This landed in drm-misc-next as
> commit 1ebc9f0365ef ("drm/panel-edp: Add AUO B116XAB01.4 edp panel
> entry").
>
> You can find it on drm-misc-next: https://cgit.freedesktop.org/drm/drm-mi=
sc/log/
>
> Specifically see:
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1ebc9f0365ef

Argh, you're right. I vaguely remember it. I was on v6.5-rc1 when I sent
this.

ChenYu
> -Doug
