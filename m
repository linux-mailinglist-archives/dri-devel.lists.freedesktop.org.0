Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144151D2E20
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 13:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467A26E326;
	Thu, 14 May 2020 11:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8BA6E326
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 11:21:03 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 63so2023022oto.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 04:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjaEhAMukt4Q737HPM6C7TaDlquG096H0lSzCeaiEoc=;
 b=mOXBRYwJnKRNXGpLr1E6rMWnYCaRIEDjBCruqko+V0Q0OB0xHrlU/fJMuSD+M7k/1d
 wSKA9T83yjHOIz9do4fPtC+wuD6K3kkIXH6/meq76g7xE41jGtRJVHl53Vsa5GzPe8rg
 15MQCwCH/d6sauRn5xtEH/cZhKfJVn+0bikBQ1PSWvVzopiX0ZiY1o4IIl1idq+syKwI
 AvITZHAUsMi7xoVH5yV62eihovHNxe0F2LmMY6KKM8jM4GD8Cuuihq3NQ0g+Dd2G23VU
 WdBEq/gtU4kWMZ7wkQtTXaRJq7ErHhLWMxqGoAJYpItNt6Qi9p36bAsw6j6VQZ3fZgRM
 CUPw==
X-Gm-Message-State: AOAM532CRkrE2Ou/AFYI0rjiEe18lU3DBc2oeqmvxPI63ZapiFGWdiNQ
 cz6bTF0qsmzJOCA5GhJpcCi9mZsZbNVXqem7q9o=
X-Google-Smtp-Source: ABdhPJyTpBVQvJyPeh8jlL2d0XL6Aye1NJbTU0L7nP/qUpDkvDYChurJ2m7cErQetQ0NI1Dhki2u1VhMPXPI4JktJ7I=
X-Received: by 2002:a9d:6356:: with SMTP id y22mr2944323otk.167.1589455262888; 
 Thu, 14 May 2020 04:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-10-emil.l.velikov@gmail.com>
In-Reply-To: <20200513214351.2138580-10-emil.l.velikov@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 14 May 2020 13:20:51 +0200
Message-ID: <CAJZ5v0iM5H03=RTtk2sZtUzaW0XJ+AaX1M00C8QjvaNz0ZE3bQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] kernel/power: constify sysrq_key_op
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 11:46 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Len Brown <len.brown@intel.com>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

and I'm assuming that this is going to be applied along with the rest
of the series.

> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
>
> IMHO it would be better if this gets merged this via the tty tree.
> ---
>  kernel/power/poweroff.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/power/poweroff.c b/kernel/power/poweroff.c
> index 6d475281c730..562aa0e450ed 100644
> --- a/kernel/power/poweroff.c
> +++ b/kernel/power/poweroff.c
> @@ -29,7 +29,7 @@ static void handle_poweroff(int key)
>         schedule_work_on(cpumask_first(cpu_online_mask), &poweroff_work);
>  }
>
> -static struct sysrq_key_op     sysrq_poweroff_op = {
> +static const struct sysrq_key_op       sysrq_poweroff_op = {
>         .handler        = handle_poweroff,
>         .help_msg       = "poweroff(o)",
>         .action_msg     = "Power Off",
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
