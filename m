Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E265C1EBDA7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 16:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EEF89D4B;
	Tue,  2 Jun 2020 14:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392B089D4B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 14:07:57 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id u15so921347vkk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J8xPMI/J/UPiXjoWDiiyg6o8zpJPhJIt2b5WwcEF9E0=;
 b=dS1zX8fJi2B1vGF2Z5dg/Gx4V391ld67f0FTyxNDhlDDuArCZJ7dR/CMWc8nQXlkPJ
 6QSmlKw9CzGJ22ICtkEjVn0Ti6FQTkYb+6YkuhnObJfvnxPidiFSz+cpvySh6QYh7UWs
 zv8BeeWiAgBOoeMsb/7vNfOZFhaaPhuoyIOEtu3Fse7SRwZcuXWSa3ebqVjSK+UDEFd7
 nHU/cEShh0nbPvA3oDTELijVKITZR0hj9aUz458PtQlDSbL6jWcqUCU1ZjvPz8Vsdxqd
 pCqhM29P4ETdxzVY28IlXgiBOw8ACfNNAnLYFp4kcQ5J8mf/wjJBm7XfDfELRgRJatxk
 cRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8xPMI/J/UPiXjoWDiiyg6o8zpJPhJIt2b5WwcEF9E0=;
 b=IgGi57r9SGjA/td2wFIkIQQet6R9kT+PeoTxOeBxC4KO6EC6bdAllHrQ6j3JNjHGWZ
 +tmM2IxZHWoVEKvEVsFk/C/Q01Q3M4dTVdg5qOMwtfx9EIYL8NSesT3U3dHkVfotkWvo
 uS7J2Uxy2AZXaSYtzXVGgCihs7ujxtBdCQpqaWyWBrB4M2lFI87hO/6LKYByRKfp+UM+
 qs4QSRO3Y8seyI9luLf/1edrtGuFoeO/C2o2NWvZqYtmiiQkuCwtQ782GFwdSe8gbnc/
 z0VvgXl2w/4X7uYxN5JgI9ata/4IGc8mtTv+jxrgF3CSeK15N26rk6Fl3U/+RF3rFzhR
 3Ftw==
X-Gm-Message-State: AOAM5314UFZUtoMZGVOkhB625azg/rGUviLb9ycxAhEl3P2iWm5GsgnV
 ZB78EfzX5phlFryyY4ZucQCXS+RgiPeUlLum6yI=
X-Google-Smtp-Source: ABdhPJypGS0oJ4fntkWSo49y5zTssL01yfKEkKGKx4k68oGS4ds8TIfxu0kGhHn0bPQ1u5aluLkGq0H7LniVF+rQA2k=
X-Received: by 2002:a1f:2ac6:: with SMTP id q189mr9323002vkq.28.1591106876436; 
 Tue, 02 Jun 2020 07:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200601065207.492614-1-sam@ravnborg.org>
In-Reply-To: <20200601065207.492614-1-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 15:04:39 +0100
Message-ID: <CACvgo51z0Vvz9LkfqePmuwx19+NhaMEBHe9r5=uYWqhEdnia_Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/16] backlight updates
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, 1 Jun 2020 at 07:52, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> v3:
>  - Dropped video patch that was reviewd and thus applied
>  - Updated kernel-doc so all fields now have a short intro
>  - Improved readability in a lot of places, thanks to review
>    feedback from Daniel - thanks!
>  - Added better intro to backlight
>  - Added acks
>
>    Several other smaller changes documented in the
>    patches.
>    I left out patches to make functions static as
>    there are dependencies to drm-misc-next for these.
>    When this is landed I have a pile of follow-up patches waiting,
>    mostly introducing backlight_is_blank() all over.
>
What happened with my suggestion to use backlight_is_blank() in fbdev
core itself?
It effectively makes 13/13 and the above mentioned follow-up series obsolete.

That said, series look spot on. With the documentation fixed (pointer
by Daniel) patches 1-12 are:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
