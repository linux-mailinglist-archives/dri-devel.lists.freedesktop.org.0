Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711BC63F52E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 17:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAB910E63C;
	Thu,  1 Dec 2022 16:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1544710E63C;
 Thu,  1 Dec 2022 16:24:00 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so2731481fac.2; 
 Thu, 01 Dec 2022 08:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KltAmapYpz63pHSS934XDuUCup563TiM194vCjhuy8E=;
 b=dhMBGMgjjGXudG2yJwPHJvjiMm0oe89iSDLss674ttuPG014RRPaD/1saawpqsgOb5
 B64o1My4Desw43I5WLnXYoUACE/NXEBDnUuB+nQqjwcOj/aK/qtivktSjg2f6QsmHAHp
 5X9rjSj/2zwV///VjVRgX3w2a6tI5zJIp8Mm1iVw74WIMXWjM9dmOhlvNnsmVaLvkkPj
 S/o6tseLe82RugnCpWGBDXCitczR9e677/J/AAwhzMeSNOV7ngR+PtyWSvy6bLJHoUiQ
 ZhXJQpDFO9aWK90f/H2Ia1PE4u8tl0arXqYGskA2nizwQQyXJa1Uqp3Ln2bD0m28kh/C
 r9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KltAmapYpz63pHSS934XDuUCup563TiM194vCjhuy8E=;
 b=ppAtC1RcD51dS7ML6vb9oQDTIeQgmkgmeKe4X2dTRgfqkNvHYr7XBsBgybO5MTDZgH
 fsWbm5iKXH0WDrRY/VvcyXLha1k1lM63APvkIzVp9ZJjlavrgXSkW3g+vTQga4MXQWk+
 uwjh4R7schmjwyiNU+ptUHlusxi9HcDZJejHleIGdIcoCWjXjKMAa0mnxufhV/u31i+z
 lHai2jVa3TMZt4wPpPhXyPYiVvOqQvv/qUgTUsX3T4cqlg/3LrpZ49dFzeaUWzv8Brie
 nBD+G3uWtcB0hOone/Y0XQZvmNm14HrhuyfmAyaFuO4VzH/A/4hM/qJkzLF9zKsyBZE9
 J1Zg==
X-Gm-Message-State: ANoB5pn0vwJKhG2GAo1ex5Ki8bvvyqmbocE5ao28GiRfBJ225t5drQLP
 0nTsjkiQLrog7VAaQo023ONlfLn56+8Kuqf+QOw=
X-Google-Smtp-Source: AA0mqf7BBlikq4JHSEmVYt/WMn5IrbEFJXCqnlubbwten9TagjFWlXEEC/8TM5xBSFPYMY1B5j1ut1/j0/EerkW9IPk=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr28251793oab.46.1669911839290; Thu, 01
 Dec 2022 08:23:59 -0800 (PST)
MIME-Version: 1.0
References: <20221201153820.257570-1-bellosilicio@gmail.com>
In-Reply-To: <20221201153820.257570-1-bellosilicio@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Dec 2022 11:23:47 -0500
Message-ID: <CADnq5_NN08omJKjJC3rCSYY4oLzBJpJwhbf-wgfeHUAZ+BMbnw@mail.gmail.com>
Subject: Re: [PATCH 0/3] amdgpu/drm: Documentation updates
To: Peter Maucher <bellosilicio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alexander.deucher@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied patches 1 and 3.  Patch 2 is not exactly correct, I'll send
out an improved version of patch 2.

Thanks!

Alex

On Thu, Dec 1, 2022 at 10:38 AM Peter Maucher <bellosilicio@gmail.com> wrote:
>
> Explain difference between gttsize and gartsize
> module parameters, and amend related documentation.
> Also, amdgpu does support RDNA GPUs.
>
>
> Peter Maucher (3):
>   drm/amdgpu: improve GART and GTT documentation
>   drm/amdgpu: add GART and GTT to glossary
>   drm/amdgpu: mention RDNA support in docu
>
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst |  6 ++++++
>  Documentation/gpu/amdgpu/index.rst           |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 11 ++++++-----
>  3 files changed, 13 insertions(+), 6 deletions(-)
>
> --
> 2.38.1
>
