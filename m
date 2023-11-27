Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524937FAE74
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91F310E40B;
	Mon, 27 Nov 2023 23:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9F110E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:36:28 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5d17d58c194so1070497b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701128187; x=1701732987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxfDgaFC4m6dvQrI/xxwWv1ne3cvruiJUHEQ9EmXeMY=;
 b=Vyo6fGhbxBMYgxDwBLLtxGSF+EKNaeHOoY+T7LI9ImKEQsIRHEQvH7bGGQ655eA/cn
 6oz7nUDAAQAiy6yzLJkh77wJpyJdgSqtNMoLH1RSP8DR0kz7HAQ5GLPpSd8TvQ8/62Ge
 9HGERSH2Pi/CW7FN39H7kHg1v6WbicuRZgqp8mENP78cxb3Liwy/MPULpCiEUUlXOw0q
 hC03980PM25ecGbJWbjHaOrCYgyLAXINOrtLZZbckHtAeernOVepnmA/9dblVUlV7Mfd
 QIev+m4PrR7H62RCSEd/kdWKuIYTuLMk09ibKOBmwWCEobdiCcc6sP8OD3P5IOYkZXgV
 TLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701128187; x=1701732987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AxfDgaFC4m6dvQrI/xxwWv1ne3cvruiJUHEQ9EmXeMY=;
 b=hb42uXXXaY+v/ySahuRtw51RuS/0wqTqEXyJahuetCgPDv7aHZRZO/6xJIM6DimtAX
 vg0vPExHO/7UlxZ6eRMI85ROxFA06u0Dz/7PC6glyvK4fYVIUEpawf09f3k+VJ1Y12dZ
 PtwVYEnE66AryrsfvLPetXhtCJpV+o8LZyPt8mxtC9hQfklOzUCol/4gdjqoXfLGO1Ja
 NpSkBbXYOXIVPTyKc95sU+md/yxtHodcA+qv5rT+WumIZuv8+yuPb/r5jG3OOfXKpZMe
 bPHkLA1KwB0v8YPqv6dJUjEuu1W40rtJhUo5r0hn9gfWQGMYyAkhRLdRL/MsfzBDmbxG
 kD+A==
X-Gm-Message-State: AOJu0YxqrHwQ/sUqb2JHuRFthJmSv+jJbfRdB/gf3sqJ6Rk/pZJ6YSGE
 cAntd3nGPJp2NAR4UHBUE7KyBIpZxV4aQkfwuYZEzg==
X-Google-Smtp-Source: AGHT+IGfr0I9La4Kr//PgkPIyvm3aD+su31rYz/shnFc17Jv2+3LBLLPhjJe+M3dYscwj691DO6cbenHSGUKNV0HBVI=
X-Received: by 2002:a81:ae68:0:b0:5d0:4199:de09 with SMTP id
 g40-20020a81ae68000000b005d04199de09mr5390153ywk.35.1701128187543; Mon, 27
 Nov 2023 15:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231127232542.GB25590@pendragon.ideasonboard.com>
In-Reply-To: <20231127232542.GB25590@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 00:36:15 +0100
Message-ID: <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert panel fixes and original buggy patch
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 12:25=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Nov 28, 2023 at 12:10:18AM +0100, Linus Walleij wrote:
> > This series reverts the attempts to fix the bug that went
> > into v6.7-rc1 in commit 199cf07ebd2b
> > "drm/bridge: panel: Add a device link between drm device and panel devi=
ce"
> > and then it reverts that patch as well.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Linus Walleij (3):
> >       Revert "driver core: Export device_is_dependent() to modules"
> >       Revert "drm/bridge: panel: Check device dependency before managin=
g device link"
> >       Revert "drm/bridge: panel: Add a device link between drm device a=
nd panel device"
>
> To preserve bisectability, you should revert in the opposite order.

You mean apply patch 2, then 1, then 3 so the kernel builds after each
revert?

Yeah that's a good idea, I don't know if I should apply these though, bette=
r
someone else do it since I screwed up too much.

Another option is to just squash the reverts into one, that bisects too :/

Yours,
Linus Walleij
