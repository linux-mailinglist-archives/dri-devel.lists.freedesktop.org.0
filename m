Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C097E2D11
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84DA10E3A2;
	Mon,  6 Nov 2023 19:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A28510E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 19:39:41 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6ce2eaf7c2bso3202254a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 11:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699299580; x=1699904380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLjTTp2u01IElZGHml90XkiK04GyI0lhbaUbWi23A5s=;
 b=lkXLqJUoj3Emjmu/3JNwtbNFeW38TEf5FuXgNTNFn6kJ01lGKlk8b0cFduJVgUj0nc
 ZDp+pEqhXDdmzLI+szp3vYyH1p2ys9O9Kif0x4gfVlAefHA9SQya32RgzOeL9AaVBU01
 mevYTP4LBhEmIGceJ/BrpudyaEtfSKxhW6ZAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699299580; x=1699904380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QLjTTp2u01IElZGHml90XkiK04GyI0lhbaUbWi23A5s=;
 b=bjNphrBjgdG4Z2H02iy+y5liYUIwSXOLk8q4uqWvXYkTFygkDqx68HJIEjw0xWjZa1
 XwudaOnMs1Xhnc2L1zdO2fKpgfif8UdY+NPx7FG5hIvuqQN8jHZQeyvbhpyW8N2M782K
 mk+klizxy7lqZcRrZNDNl3Ob1jDxNQWK3XJeHk8KHbfP02yZHTp0FDj5p1AXFzP8g+Cw
 v4E86ThXoa7qUBDL/Ch/KV2uBGRSsHraJpnPP6MEZhNYJ2ZWSciXXhwc95YVmcLFgL8o
 XnA7INxvtYsEzT23wZIe+Vj8lfbe6TeVOD7ZZcSm+HHxo+x3HLN2WZgtQzantK439lPm
 XJGg==
X-Gm-Message-State: AOJu0YyIZWMi6+v0VTZib08faMeexQ+FHSnysY8V6UYuzodGwkrUaRFJ
 vr79+fgzQVRMkIw64G0c51po/NzDugUgBRXepjda3Q==
X-Google-Smtp-Source: AGHT+IFKDR9uQHvB7VJxnRv/VD1p/NKzbbk+zvXjVN9+dYZu9QefNjkgF45opouqp4IHkywBd23awpIsOMNE5WdXBO4=
X-Received: by 2002:a05:6830:3105:b0:6bc:c542:6f75 with SMTP id
 b5-20020a056830310500b006bcc5426f75mr42805371ots.0.1699299580218; Mon, 06 Nov
 2023 11:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-4-hsinyi@chromium.org>
 <CAA8EJpoPMkQRhCD-9SPSheiio1dH8V6BUv89MZKfZdrBzsBW-w@mail.gmail.com>
 <CAD=FV=WHzCdiYumsxUm_am+ALqq9SOOrjf=JYHqJuiKFB+Dnsw@mail.gmail.com>
 <ze5xz52jt4helttcmntzmr6fr4ohu7wtslywalbxc4w7w6uvly@nwweqyyl4wf2>
 <CAD=FV=U0sVSGEECFEOeNOEXty2UkO2-F7gK_FVhQ7MCsmn1Qkw@mail.gmail.com>
In-Reply-To: <CAD=FV=U0sVSGEECFEOeNOEXty2UkO2-F7gK_FVhQ7MCsmn1Qkw@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Nov 2023 11:39:14 -0800
Message-ID: <CAJMQK-jFca51-wDCDgb-+mcJpbV2DmX04dxvaG6Xg+p5e2X8kg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 8:21=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Nov 6, 2023 at 12:06=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > On Thu, Nov 02, 2023 at 07:33:48AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Nov 1, 2023 at 11:31=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Wed, 1 Nov 2023 at 23:26, Hsin-Yi Wang <hsinyi@chromium.org> wro=
te:
> > > > >
> > > > > If a non generic edp-panel is under aux-bus, the mode read from e=
did would
> > > > > still be selected as preferred and results in multiple preferred =
modes,
> > > > > which is ambiguous.
> > > > >
> > > > > If a hard-coded mode is present, unset the preferred bit of the m=
odes read
> > > > > from edid.
> > > >
> > > > Can we skip the EDID completely if the hardcoded override is presen=
t?
> > >
> > > Yeah, I wondered about that too. The blending of the hardcoded with
> > > the EDID predates my involvement with the driver. You can see even as
> > > of commit 280921de7241 ("drm/panel: Add simple panel support") that
> > > the driver would start with the EDID modes (if it had them) and then
> > > go onto add the hardcoded modes. At least for eDP panels, though,
> > > nobody (or almost nobody?) actually provided panel-simple a DDC bus a=
t
> > > the same time it was given a hardcoded panel.
> > >
> > > I guess I could go either way, but I have a slight bias to adding the
> > > extra modes and just making it clear to userspace that none of them
> > > are "preferred". That seems like it would give userspace the most
> > > flexibility
> >
> > I disagree. "Flexibility" here just means "the way to shoot itself in
> > the foot without knowing it's aiming at its foot".
> >
> > If a mode is broken, we shouldn't expose it, just like we don't for all
> > modes that require a maximum frequency higher than what the controller
> > can provide on HDMI for example.
>
> In this particular case we aren't saying that modes are broken. There
> are two (somewhat separate) things in Hsin-Yi's series.
>
> The first thing is a quirk for panels with incorrect modes in their
> EDID when using the generic "edp-panel" compatible. In that case we
> now _replace_ the broken mode with a more correct one because, as you
> say, we shouldn't be telling userspace about a broken mode.
>
> The second thing in Hsin-Yi's series is for when we're _not_ using the
> generic "edp-panel". In that case we have a hardcoded mode from the
> "compatible" string but we also have modes from the EDID and that's
> what ${SUBJECT} patch is about. Here we don't truly know that the
> modes in the EDID are broken.
>
>
> > > and also is closer to what we've historically done (though,
> > > historically, we just allowed there to be more than one "preferred"
> > > mode).
> >
> > I have no idea what history you're referring to here
>
> History =3D historical behavior? As above, I pointed out that the kernel
> has been merging the hardcoded and EDID modes as far back as commit
> 280921de7241 ("drm/panel: Add simple panel support") in 2013.
>
> That being said, the historical behavior has more than one mode marked
> preferred which is bad, so we're changing the behavior anyway. I'm not
> against changing it to just have the hardcoded mode if that's what
> everyone else wants (and it sounds like it is).

I'll change the behavior to: if hard-coded mode presents, don't add
edid mode since it will result in multiple preferred modes.
