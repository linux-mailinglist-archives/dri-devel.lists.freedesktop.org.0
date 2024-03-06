Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24B872E76
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 06:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C3810FA33;
	Wed,  6 Mar 2024 05:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qWeYsPQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01F310FA33
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 05:39:20 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-29b6f82125dso707553a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 21:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709703560; x=1710308360;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qcUilGZ4h9+6q9Pt6yhuKYLmboCM89xOd3b/ir0MpKQ=;
 b=qWeYsPQLuoUhXAjTzJ8FQabQslRh1m/65fmoNUl6T5mkIAsHgooLM0gK529HP7JSzZ
 Oe3lTwkgAf65j0v1IFtOYlSQGJboq9R72g+c/5h7mW76A37m82NAr3/5XC6g49lyu0D8
 Fvk6C1GmY2frx9/TkbxqNPlIjGcNhtiU1VqQMlGYjBD+rrsNYQI5GFMUhfeV4pX7fQjd
 +OY4g8MHrXnZPvlBnCMRirAel0wQuhp35ebC0wznjKg4NVi4Uhr0JcDGjTIty+1jTdKq
 9QXmdH8aSIWUfUZDhNO4pCXc8c3+6bTtiZJy9pco6nsitJpTKCGGY3qH9w+JWt5gAXQ7
 YsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709703560; x=1710308360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcUilGZ4h9+6q9Pt6yhuKYLmboCM89xOd3b/ir0MpKQ=;
 b=F9sl1/vKLpNa+HKulrMmGrmV9+o+Q/WojAlWNMc9qLIFLdqxPLDBcYPDRsMjOVyZ9s
 +JexZ9/ixtQxQihbG2meVBkTx+oo1tF4RBtt/jwQtgkKHhm0zqz6hYvJUS0BNUDhgbYf
 E8/Vi7BjK9GymRVclBZqWZzINSN7J2BS5igCTud/z2NbZ0JRyc4hNE8wcaEUzUF9hD+g
 tV6tLwnM8jha4nHl/JDbz+O2Z6YJ9ktvr1cjUqr3X+2ltnKj6sUjkhBuIWCbc0KQoQBv
 p6AC3waOAZ5TyGirX/A0vtCWN+eaTihc6m0RoRowGeG9rxx3gwI7JKznclC6SK71rvkm
 Bwcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXesII7nAkyyqJfPFNvlbcb+Kz2kl5LAGkYl/RLogo4DSu5j6VwzM6g2Qzba2QTwZHwJ+oKktCWxTFF3e+xo5PgBS2h9185qVIuS/4BsVSg
X-Gm-Message-State: AOJu0Yy1ijm7Mm0KyZQASJjJjTSFmzVsBxd0UE8wg7+Lq/E1K+YNgnGa
 eVJGaxoXaxBOR65gUOELR1TpxHgAPxIGhRhvrFl+e3i0x9Grf5c4vKVxcfVyKLv0sNs1zMFyaCv
 Pp1Uzmeg9Eu6RewKlL4btuYzPGlmnn2iA7zdKlg==
X-Google-Smtp-Source: AGHT+IGRZyAT81pD6X1QOmiFpoQvC39nCipzeG7JdrCxsGsdvCjP7koRXqRQWO8jSQhWMylo7OsdCSwgbU90nLHqVEg=
X-Received: by 2002:a17:90a:1097:b0:29b:2779:6ceb with SMTP id
 c23-20020a17090a109700b0029b27796cebmr12289518pja.34.1709703560306; Tue, 05
 Mar 2024 21:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20240305012604.3869593-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=XUhBUscqx5TY6Ax94_St6xggnirP6hiy_VG9Y_1uB-kg@mail.gmail.com>
In-Reply-To: <CAD=FV=XUhBUscqx5TY6Ax94_St6xggnirP6hiy_VG9Y_1uB-kg@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 6 Mar 2024 13:39:09 +0800
Message-ID: <CAHwB_NJqu==AMT9LMM3Cdzp0iugOcFC3VnT01HTPx2HbjNX4OA@mail.gmail.com>
Subject: Re: [PATCH V2] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP (again)
To: Doug Anderson <dianders@chromium.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@chromium.org, swboyd@chromium.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B43=E6=9C=886=E6=
=97=A5=E5=91=A8=E4=B8=89 08:23=E5=86=99=E9=81=93=EF=BC=9A

>
> Cong,
>
> On Mon, Mar 4, 2024 at 5:26=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The current measured frame rate is 59.95Hz, which does not meet the
> > requirements of touch-stylus and stylus cannot work normally. After
> > adjustment, the actual measurement is 60.001Hz. Now this panel looks
> > like it's only used by me on the MTK platform, so let's change this
> > set of parameters.
> >
> > Fixes: cea7008190ad ("drm/panel: boe-tv101wum-nl6: Fine tune Himax83102=
-j02 panel HFP and HBP")
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> I actually already made these fixes myself for you and applied. My
> notes were mostly for you to keep in mind for next time. This is
> already in drm-misc-fixes as:

Oh! I see. Many Thanks.

>
> 9dfc46c87cdc drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
> panel HFP and HBP (again)
>
> -Doug
