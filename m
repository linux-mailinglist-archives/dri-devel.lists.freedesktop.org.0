Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125BB7BEBFB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036EF10E19E;
	Mon,  9 Oct 2023 20:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623E410E19E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:53:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so124865e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696884807; x=1697489607;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59tO/iIlQ73UqQX7Kk8ekqFEIp7s2Jv+HxK9i4t6u3Q=;
 b=V3eauY21L2+5+vajJC10VUfyPKhl43prUSSMWdibQgLnM470mBYS7cPqE5Ja1YAUbt
 RgpP0+e2u0nelf3PJsBl/YEEYYKxqShHQbOnDkGGUaqwlUai/WJ18SogLNDG3f0kWR7v
 z1AvUSNpL2zpMWUOSvYYoVMVH6z9ts0isIWp70e/OrtNoagidx8dD0BQoqjV3fclfq6S
 ZoPDTfwXZhh5AATTAcx70qQ5lc2idtI+KsreA4doVJc6Mjug43/ox9+clwVl73s8b1yq
 ldl+caexq3PEG2WZroyTJTORe8Co4ppzEfqNG+mnPyNKqh2MBwT6rd+G21kb7gu9YtPE
 qfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696884807; x=1697489607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59tO/iIlQ73UqQX7Kk8ekqFEIp7s2Jv+HxK9i4t6u3Q=;
 b=EPKyRFYcji9aekmIvrEPP/eKWZBXNX/R7nIkqXIrjr6h1RU3iuIZ90EJZ1wdsSrsKT
 bmNScMjTRKZ30hU/NVBpluw/50UVoZA3CGvAORKI7LN9uX6Npada5ZDNd91vX5vJh9+9
 wkJi2tqeeHwp5MpYBAXxGI0EsQkU90M9m3DCRtj9/u/izZPKvzzoCMS8s2zBGkMntuNB
 LuLS617tY/rt7hJRs345hG4zqYfv7mT+e8sJrHdBG6GzOCGgUulNpj/p1weBi3YjwbSe
 XC7hPIpimwSMe7Utn3wgPU3Km4W/XspEt5YC5NWUu271bAiiFrwuCnDmdWVerV/Thwnj
 rS/A==
X-Gm-Message-State: AOJu0YwrNfv23YAyaLtloG3fF/X1LoFzD1EEqblc3hWEeRWNpTvhnxgr
 7P6leWgjD6qKoqqIIq8oeoyMsFfeuOv3A6n1ho5obA==
X-Google-Smtp-Source: AGHT+IHq7N3/6OsWTZHhFPYxj2swHPTNEn7XPdgUv+UA1bljGHW5UFtKZwxam1OQNUu0b+Wrsm4hBPVG6ZOVmvI2H/o=
X-Received: by 2002:a7b:c3d8:0:b0:400:c6de:6a20 with SMTP id
 t24-20020a7bc3d8000000b00400c6de6a20mr385036wmj.3.1696884806574; Mon, 09 Oct
 2023 13:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <CACRpkdbek0-Vhk4_34qY+0=EGrQxJS_CfLuF_5fRozMMyc+=Kw@mail.gmail.com>
In-Reply-To: <CACRpkdbek0-Vhk4_34qY+0=EGrQxJS_CfLuF_5fRozMMyc+=Kw@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 9 Oct 2023 13:53:14 -0700
Message-ID: <CAD=FV=UFa_AoJQvUT3BTiRs19WCA2xLVeQOU=+nYu_HaE0_c6Q@mail.gmail.com>
Subject: Re: [v1 0/2] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Oct 8, 2023 at 12:33=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Oct 7, 2023 at 8:06=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > Linus series proposed to break out ili9882t as separate driver,
> > but he didn't have time for that extensive rework of the driver.
> > As discussed by Linus and Doug [1], keep macro using the "struct panel_=
init_cmd"
> > until we get some resolution about the binary size issue.
>
> OK works for me:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Dough, if it looks OK to you too, can you apply the patches?

Thanks for the review. I had a few small comments so I'd expect a v2.

I suspect it would look a little weird to add your Reviewed-by to
patch #1 since the way Cong has it you're the direct patch author. :-P
Cong, I suspect you may want to change the tagging on patch #1. I'd
suggest setting yourself as the patch author (git commit --amend
--reset-author), then tag the first patch like this (I put "x-" first
to make it obvious to any bots reading this that these are not tags to
actually apply--remove that when you tag your patch):

x-Co-developed-by: Linus Walleij <linus.walleij@linaro.org>
x-Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
x-Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
x-Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

Also: just as a heads up, Hsin-Yi measured the impact of removing the
"command table" for init and replacing it with a whole pile of direct
function calls. She found that it added over 100K to the driver (!!!).
I believe it went from a 45K driver to a 152K driver. Something to
keep in mind. ;-)

-Doug
