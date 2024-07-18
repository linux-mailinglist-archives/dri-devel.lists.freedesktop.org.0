Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E899345A1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 03:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5A110E1A6;
	Thu, 18 Jul 2024 01:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dbt974XE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237110E1A6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 01:09:43 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5a015a79e80so177179a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 18:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721264982; x=1721869782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a24lA42kj1IKUpXd+h7uBNc53/x1IhEKAp0DRNXWxaA=;
 b=dbt974XEcTy1584v8tuLK+M2z/2rrse4mDlgGzLNSXGCJGnCuj7ZQsTK9GJsq5XbJK
 3yhD5dtxbxna9GwK5+kJTiazEevkLUj6jkoCF+DultKPGLbVb2+Q6+Prp9x9w2+NyM1g
 cDQCUTxGNAkNn8nscYXEpJl3PLBhcozpeGIxKWoOSxGjzC8jlOLfogzTouMGNvL5AeqT
 pscxSgZ8/SWcaypeMv+6zIYR+slsGn9HSysbB2UBYQZXXSuPQNgIAHt0JItc8aYzPsaF
 Xx864Zhy8KGrk7Yz5svKwQsubxOObpknCvowyFsAInEocGK4edPEOksWXMjI1toLZzVe
 OSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721264982; x=1721869782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a24lA42kj1IKUpXd+h7uBNc53/x1IhEKAp0DRNXWxaA=;
 b=b18Q0R+iasgrQQBAfx0lAGVY7y4urOA/sKydS2vFoWY6PtNFT5rxbzlVxzAub4Cr9L
 KGV9VGXzIo2OcjkdJU6MJH03CenXb0ugXome29IV6BwNI2lJH5ByKBJqsqZwidiLQQWm
 B1zhiYlmx5hPHAe1PwlPlTtV3PHgJZ/qDuImVD1b3ERSID5dtoG4frV1MLSLygOpHXLh
 1WrcPgDMBwFwGalQNvjKITq4KayEAiZBqD9pmsv2sCi6yOWl/eCTqSNc9ZG1BqH6KvrM
 ZnyEs57LV/BAkXTOw5mdzFWgTJS0DW2hO6xIBpvrx288MwifgqLp7mePuE++p5ylg8rn
 ajaw==
X-Gm-Message-State: AOJu0YwEo8jNPqiYcZBUZDoAA4ATnWU5bvyQzQ8+DJhsnyrDmcVQjZIt
 v6Qv5UcWW8KiYxfkPpMi+90RXNcNxQCyuUv09w44NCUSEhmV6XreH23RqKUORLqych1/23nogqh
 4WQKkpa2UGd20aqYvP7/MiZtBsgs=
X-Google-Smtp-Source: AGHT+IEkQ1X1zBYds0LOtzFbshmU1UkroOPkGrUOvyXXeF3zQwEuX9vynegPp0P6goCLWVTcWk2q9FcIS4AwlVNjHmY=
X-Received: by 2002:a05:6402:40c9:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-5a05bcc9a88mr3575667a12.24.1721264981722; Wed, 17 Jul 2024
 18:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Jul 2024 18:09:29 -0700
Message-ID: <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Just a guess on the panel timings, but they appear to work.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn'=
t
> > find any datasheet so timings is just a guess.  But AFAICT everything
> > works fine.
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Given that this is a Samsung ATNA<mumble>, is there any chance it's an
> OLED panel? Should it be supported with the Samsung OLED panel driver
> like this:
>
> https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f658=
a3@linaro.org

it is an OLED panel, and I did see that patchset and thought that
samsung panel driver would work.  But changing the compat string on
the yoga dts only gave me a black screen (and I didn't see any of the
other mentioned problems with bl control or dpms with panel-edp).  So
:shrug:?  It could be I overlooked something else, but it _seems_ like
panel-edp is fine for this panel. Plus, it would avoid awkwardness if
it turned out there were other non-samsung 2nd sources, but so far
with a sample size of two 100% of these laptops have the same panel
;-)

But that was the reason for posting this as an RFC.  I was hoping
someone had some hint about where to find datasheets (my google'ing
was not successful), etc.

BR,
-R
