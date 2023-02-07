Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314368DD54
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADFE10E551;
	Tue,  7 Feb 2023 15:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4110B10E53D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:51:24 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id r17so1746099pff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 07:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zJqpF+5l/IPdPEY6JIeF4TFZYJP1idCXHeFCUM83wtQ=;
 b=nQq8QIq6PQv7uMLArYJEKgRPLuFvsE3jWauI90SBHUO/Dz/BIWwD0qzZjJ6qR0h7C1
 +FTx0RN7RsMACnrwLaBMM45ej8qv6JPaY0fq8MIc+ZOPImDDErHBM9LLtWKCYqVH9cZI
 dOMMo8XVpMP8e1vyzTy3s2YF4Sc3OGiE2hnFEw0kBcgFV9pQamPbKyFVKMvzob+tvV6U
 vNLT6drgbZbx28wHdxut58Smh52G2sj4rsnaPKPgSzw31p4ieE787exp+1/pCFaYWHcx
 C35hltFu5sE3tchlHLlQd7ndvO8IRCx37ochztJHVx3CnsFS504iY61rBx67W/WMl1lP
 4Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zJqpF+5l/IPdPEY6JIeF4TFZYJP1idCXHeFCUM83wtQ=;
 b=AAvU1kgOL8cBdqyfXbnXVBzWvCWcZW2Q5cCm7XiKrfatwJtlEKz/qpmoSDD1R0/D4s
 jiGBq+UQYQy7gbVuJBi0oT/MC0pa6nNwAUqC/kJXN5TFUURm39IsVgcgXraqRVM6bcD3
 mOZZ2njGcqmOjtEZ9MjaOFRqLIZLcD732j4jt6avyemHwKXRzdWplNVRRTie31UWSosk
 q4vQFU1M2uPaf/qvmAbvFN3BgbAHqbmWVDmPk3l8T7s5kBMAueiJOjorJY/sUvmTo//+
 8aFNtG6VPVhHl/RxVxMYZFu0GUdcTAiYbZAhRnW5nlDcL2TrKRlF1PU2KtVYUZ/34yrJ
 ZaAg==
X-Gm-Message-State: AO0yUKXNurhkRA2x7F03yrDRvHpFq4q5h4pmhzRHRKh6SHYT9bIiNL2q
 lF2DE6/S6DVUkfoVX593yqVUs+Qwspd3eC+/avg=
X-Google-Smtp-Source: AK7set+3rX9SsIe4o7ouaEK13M8jQ8GlNYxtnmlb+gAP0sP9ZVChMnXMvLIt+2lGwjxQDeEC7xuXFkc3m1otM/x5NL8=
X-Received: by 2002:a62:6d85:0:b0:593:a079:639a with SMTP id
 i127-20020a626d85000000b00593a079639amr959208pfc.44.1675785083642; Tue, 07
 Feb 2023 07:51:23 -0800 (PST)
MIME-Version: 1.0
References: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
In-Reply-To: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
From: Darrell Kavanagh <darrell.kavanagh@gmail.com>
Date: Tue, 7 Feb 2023 15:51:12 +0000
Message-ID: <CAMxBKG3o_6R7M0gaUHXA5yGgSe6HBWYK25fwF=8mN+JTno9t7Q@mail.gmail.com>
Subject: Re: drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet
 3 10IGL5
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Further information:

With the above fix, the very early boot console messages are not
rotated. adding "fbcon=rotate:1" to the kernel command line corrects
this. But these early boot console messages are still garbled - it
looks like the display driver in use at the time cannot write to the
screen fast enough - lines are half-formed before scrolling.

Note that this corrects itself and later boot messages are legible
before the plymouth splash (if in use). I can't see anything that
looks like useful information re the fb in journalctl immediately
preceding the first legible output seen during boot.

I've played around with console, earlycon and fbcon parms to no useful
effect. Any ideas?

Darrell

On Fri, 3 Feb 2023 at 18:32, Darrell Kavanagh
<darrell.kavanagh@gmail.com> wrote:
>
> Hi,
>
> This is another Lenovo with detachable keyboard and 1200x1920 screen
> mounted sideways.
>
> The following has been tested with 6.2.0-rc6.
>
> Thanks,
> Darrell
>
> index 3659f04..590bb7b 100644
> --- a/kernel/drm_panel_orientation
> _quirks.c
> +++ b/kernel/linux-6.2-rc6/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -304,6 +304,12 @@ static const struct dmi_system_id orientation_data[] = {
>                   DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad
> D330-10IGM"),
>                 },
>                 .driver_data = (void *)&lcd1200x1920_rightside_up,
> +       }, {    /* Lenovo IdeaPad Duet 3 10IGL5 */
> +               .matches = {
> +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
> +               },
> +               .driver_data = (void *)&lcd1200x1920_rightside_up,
>         }, {    /* Lenovo Ideapad D330-10IGL (HD) */
>                 .matches = {
>                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
