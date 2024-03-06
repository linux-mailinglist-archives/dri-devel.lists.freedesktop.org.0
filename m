Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA4872BE3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9EB10E75F;
	Wed,  6 Mar 2024 00:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="km8KvaTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2686310E75F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:48:39 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5a140a072fbso1093197eaf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709686118; x=1710290918;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8YUqfSxXbAYFGGNrVtx7LjoshPbACk3MhhzqeZBjss=;
 b=km8KvaTqzaC2Ff8mD9pU3jxArT/lR16rQJF+5P4plsljv0AMdFrcNNUSaTG3KyOlF6
 tuTzrD5oe7Qjdio5rgm1kjXYFD3sd8Acyak2Logvfql314CgpkKzogGkf6aEqpIO6J51
 FoEYRISzir8Enfr8fBmIDiNkVeX2pjt/2VTAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709686118; x=1710290918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8YUqfSxXbAYFGGNrVtx7LjoshPbACk3MhhzqeZBjss=;
 b=jVDctNrszDcAytvUysRf/1zP1su41JdPzMxlcEFDWuaVexVyuMaEz3o4Gs8JrPohh2
 LCDcTunTTrzPir+4Z8kcGiXhvTFKbB6OJ5qtuoTpp9J/ht81Yc3PCXMCyyk5cqdYKuw8
 JM/Xk4lImavjPA9edSBLs5Twl4iIMhr04muM/6SmZNUlnVk0PLybH04PkyWqLWHHbh4h
 Yo31ejAJr4VKo6QT8pc0c8rNyCD/tTeLJPb6QJjW/eWYHH3/XKF1EqvZ4GxfgR9HNr2+
 EYTSxiErD1hWR12a8THOFi4RRhy6Xe40tkBbmOCwsS3SfBdwGK3aLgkaTclvXuEf+42X
 W5sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWZ6ma9AKSYMd2N+uAZBNIIUdqxtHqbGIJJmiQK+6iRMggrJkE05tAQw+0zI5xX7US+JvKSdWxd3Z3ArlVwyny//tLo12rx/D6QdkkM+VA
X-Gm-Message-State: AOJu0YyYH5z+lYLsgCM+Xufv1ztqno/dcmKugD7c583jHC2Fi0N7AQym
 jWV0xg5lwFtFhC+k4xDBFXRvJphSD6OX95j0cEuCKHh+vv0rnRpNER/8G0uW9py/tGRTw9VhLml
 5+d5M5/JU37q649qpOqAdU9VRhSOiFkn5GUEK
X-Google-Smtp-Source: AGHT+IHThZOocFCZMmHlyA07NzSu/hUzk0+wRXvbdVZwsQ63Hxp4vmWebG9XV+3+bsLjN4hF9iqXD16nnPW8ixndG/0=
X-Received: by 2002:a4a:9b17:0:b0:5a0:e486:cbbc with SMTP id
 a23-20020a4a9b17000000b005a0e486cbbcmr3765020ook.6.1709686118132; Tue, 05 Mar
 2024 16:48:38 -0800 (PST)
MIME-Version: 1.0
References: <20240304195214.14563-1-hsinyi@chromium.org>
 <20240304195214.14563-3-hsinyi@chromium.org>
 <87a5nd4tsg.fsf@intel.com>
 <CAJMQK-j4wGah=szyUW53hu-v6Q4QjgR7WMLKnspoFaO9oPfaQw@mail.gmail.com>
 <874jdl4k01.fsf@intel.com>
 <CAJMQK-iWHoh6s-hkcNULzZLjMg9UnTuWfjaJ=YfnHU3sQ1NBEg@mail.gmail.com>
 <CAD=FV=UOhTGnhtc9gOQ5C_aAdgVcB+K7NL9RGm4umunF91Wkpg@mail.gmail.com>
 <87y1ax2iu1.fsf@intel.com>
 <CAD=FV=WzLLeEw-b0Kug-Pm-9EYm7eHvmukEUJ8VHnu-4YY3WNQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WzLLeEw-b0Kug-Pm-9EYm7eHvmukEUJ8VHnu-4YY3WNQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 5 Mar 2024 16:48:12 -0800
Message-ID: <CAJMQK-hE8sWL2rO-N2WZuyXzPhnXZJN4LUL_TwzKGhq_Ozz6Vw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
To: Doug Anderson <dianders@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, Mar 5, 2024 at 11:25=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Mar 5, 2024 at 12:17=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Mon, 04 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> > > Hi,
> > >
> > > On Mon, Mar 4, 2024 at 4:19=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.=
org> wrote:
> > >>
> > >> > > Probably change to u32 drm_edid_get_panel_id(const struct drm_ed=
id
> > >> > > *);? Given that we still need to parse id from
> > >> > > drm_edid_read_base_block().
> > >> >
> > >> > No, we no longer need to parse the id outside of drm_edid.c. You'l=
l have
> > >> > the id's in panel code in the form of struct drm_edid_ident (or
> > >> > whatever), and use the match function to see if the opaque drm_edi=
d
> > >> > matches.
> > >> >
> > >> drm_panel prints the panel_id info on whether the panel is detected =
or not.
> > >> https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/gpu/drm/pan=
el/panel-edp.c#L792
> > >>
> > >> Is it okay to remove this information?
> > >
> > > Hmmm, I guess it also is exported via debugfs, actually. See
> > > detected_panel_show() in panel-edp.c. We probably don't want to remov=
e
> > > that...
> >
> > You currently print the information via panel->detected_panel, which is
> > a struct edp_panel_entry *. That doesn't change. It'll be slightly
> > restructured to contain a struct drm_edid_ident, which will not be an
> > opaque type.
>
> Hmm. As Hsin-Yi pointed out to me offline. Somehow we'll need to get
> the actual panel ID out. Right now in panel-edp.c we have:
>
> dev_warn(dev,
>   "Unknown panel %s %#06x, using conservative timings\n",
>   vend, product_id);
>
> Where "vend" and "product_id" come from the panel ID of a panel that
> we didn't recognize. For instance:
>
>   Unknown panel BOE 0x0731, using conservative timings
>
> We need to still be able to print this message for unrecognized
> panels. Then when we see field reports including this message we know
> that somehow we ended up shipping an unrecognized panel.
>
> Any suggestions on what abstraction you'd like to see to enable us to
> print that message if everything is opaque?

Sent v4 here: https://lore.kernel.org/lkml/20240306004347.974304-1-hsinyi@c=
hromium.org/

Besides that it still keeps drm_edid_get_panel_id() to be used on the
kernel warning when no panel is matched, other parts I think are
following the comments.

Thanks.
>
> -Doug
