Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00EC318C0
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB6210E60F;
	Tue,  4 Nov 2025 14:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gsyxo6Cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8CE10E60F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:36:26 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-57bd04f2e84so6697316e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762266985; x=1762871785; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRe5N1gvJKZc2vDaZX021q1WB+aCvlwd3XnyftzGbRs=;
 b=gsyxo6CnKIFrvzU1Es4Eh1uzdJYMdX4mySNj53s3QlaqdNWM3q3JxenNUPAGGDx0g4
 wO4ijwcjcJEQmhquXq38N511tN8sidwfG0yTERB80Ml6Q275DetOgyhcBCeujOXguRCJ
 QohOWGXzxBKWAW72qRKusJfL43KpC4+qlYnP2Y5A8f4T/xf41Rbq5uTwYwNiTA23F572
 Nh5Dv/CWLV0y4C+Mj3P1w37g1pgB9fB/LMeRUDfO55Kd0JpINfp+P2Dr2/5wtqv/uqyd
 NxAd8ApVFrdbRJN8UKroTTEe4ZjVpDrIEWXv9d61DkmjLMBT35xbM6xVkeQzl4jF9HP2
 USBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762266985; x=1762871785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRe5N1gvJKZc2vDaZX021q1WB+aCvlwd3XnyftzGbRs=;
 b=haI5rbvUi6gn/dNImpJJOqCKS3egxEABVikW+uTJ6LhjJ9ftFHBADcOA4BtCCPtMnX
 A2NPoUYDuS0SswDKekgxK1segR+M9DzW1sY1SEuMPW6PnHSdtDQQOe6yPFv8ub/firWp
 sR31gsADBcG8NG42InVQyMc++r1o3i1iaxCpgIvp63ulJTrdJASDxS6BaUUCsHIfFO6b
 gAaEVram0gu+i2Tn7i2WtVRr2uKKyiaWFcI9WH3PLQdoanm06w7TP2IqnNDgFEAhnITp
 xzzgImBTVNwY51v2d7iDVCfhoCKIg7Tf0lR/jfJ+knztkm/Ylfs55gLnX64Rvxaf+B2e
 wYaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeoYVoRkGI8l8LRTO6qy/+3hYTNuoWNeFwOPn1vboa6vZBx6PyGYfyKFEBbhxTv0cv2yfEG4xFZAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTDyRQjh1ex0lMpRfeCWZ7C1FukzmUQ/oo24yjUe8JPEg/CsiO
 JM9UR7NAZpvAADfYKFT9lRaMnMjynSPezvaHfQt/INOozSpqxIFTGyEUCY+nSMsblLwO2CIiz73
 P9I8vtyyCvkWVOQwpojNiLZBrV4fA9CMOc9CYBrcSqIcajXnI3NQVmATqFg==
X-Gm-Gg: ASbGncuiy+l8Gqcdxi+msbOxAOxce5wjdsP8KAqoLwtgpcvKNXcisVcgQLn1u+9bv81
 VxBWOQTTrMYYPuG83uWdpQ4NMO1MWaNIfpQ+PKV6++YWjimug2H+36jXjhHisjBQHh0pxxbl1Qt
 L1lTOyuqKs7GmzDdhAZJ+gphpax9HhoqIp9JSZQMxvZlCvQ+j415g1QCDVBpeQ0CM1Nk3rcL0tU
 tNRoBwLUo9NeZjO5XeCl4u0vIEk2Xek/AFqeTTbCa7Whd8QyPgo+V+JdJt4
X-Google-Smtp-Source: AGHT+IFUKVZD7VWQm45vplHvtHy5UJE1UGINP1JP9zNUYCUQQvP5csTaajyGJHq2F9a5sVC5Gw7K4cB8eh/E13JVFyE=
X-Received: by 2002:a05:6512:2212:b0:594:292f:bbf2 with SMTP id
 2adb3069b0e04-594292fc1b4mr2228159e87.37.1762266985087; Tue, 04 Nov 2025
 06:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
 <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
 <CACRpkdYth1-QMDRW17bERXdzYvxvkfLq0o5QVTiis+o6NqubBA@mail.gmail.com>
 <22eb27cd-5ce9-4189-803a-14295b6650c4@ideasonboard.com>
In-Reply-To: <22eb27cd-5ce9-4189-803a-14295b6650c4@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Nov 2025 15:36:13 +0100
X-Gm-Features: AWmQ_bmbfIFA7jlO40M79OCT68LCB_eLTD0lCkagVZ-9fE2GrDjRIiCg8xut7eE
Message-ID: <CACRpkdazwqEUi7HR6ygUYE8Jr4zfMvJR+r9UL1+S0jduPqAyrw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>,
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org
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

On Tue, Oct 28, 2025 at 4:13=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> > I don't know what that's for, the panel bridge isn't
> > using it so it doesn't help any panel driver?
>
> What do you mean? drivers/gpu/drm/bridge/panel.c uses it, see
> "panel->prepare_prev_first". I do find it confusing, and I'm not sure if
> I should say more about it until I read the code to refresh my memory =3D=
)

OK yes it is there, I did a misgrep...

panel_bridge->bridge.pre_enable_prev_first =3D panel->prepare_prev_first;

> But I think the idea is that the panel's prepare is called after the DSI
> hosts pre_enable. Probably that doesn't help here, as you need the crtc
> to be active, and, afaik, the point with the whole pre-enable/prepare
> sequence is that the video is not active at that point:
>
>  * The display pipe (i.e. clocks and timing signals) feeding this bridge
>  * will not yet be running when the @atomic_pre_enable is called.

Indeed.

So what is needed is for .enable on the preceding bridge to have
been called first.

> > FWIW I think it is fine to require the DSI panels to only send
> > DSI commands in .enable/.disable and not in .prepare/.unprepare,
> > it's intuitive in a way, if we go for this semantic I can send a doc
> > update after the fixes and try to look over the panel drivers a bit
> > and see if there are more offenders.
>
> No, I don't think that works generally. In panel's enable() the video
> stream is already on, and the DSI link is in HS mode. You might need to
> configure the panel first (at least the first part of the setup) in LP
> mode. Say, to set the number of lanes. Or, see
> "20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com", tc358768 can
> send long DSI commands, but only if the video stream is not enabled.
>
> Conceptually it makes sense to do configuration in panel's prepare(),
> and do the final enablement in panel's enable(). But unfortunately I
> don't have any good ideas how to sort this out. Feels like whatever we
> do, it's not ok for some bridge/panel...

So what shall we do with this regression?

Shall we just revert
commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
while we still can?

Yours,
Linus Walleij
