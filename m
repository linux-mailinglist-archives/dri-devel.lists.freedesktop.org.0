Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC40AD2F06
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF7D10E484;
	Tue, 10 Jun 2025 07:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B88410E484
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:42:19 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4dfa2aeec86so1987223137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 00:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749541338; x=1750146138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UnZjYYMGXevSBSY6sWftUADSaMU5dwOK3x4IkbxMbu8=;
 b=J8ZSZFfgcatlNn+53i02BO8QrpdOBGoDoedlcxdpd62n9BDU3FEWIkjZlrJLXFoPy3
 ExX3riP30jMgMuSYwjsw4MctmhFhc2UWTxwO8oD6a06aw+VWIMwVJeGDXeEM4oaQNYTo
 F7fPwBNOkOJsruSF7Sm6/XJ1h2+mZcaWvbSApvqKSAguzxj07uLyXotlX/nycDliI3E3
 +5QieCW95X7qCwohzp57Dpschg+vgnt4frSPeReJwRf2GkG7oAKPNIys6JMf9cOEpfC9
 izVTtmsM0VOLYdKAvvWT6WV5iIEw/SltzElj9uYxPoQhcsyCKmp2Ug1K9tvEUjKPaYxW
 IsVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0IyqS8ZhdNOGErMEwj/gY+XwpGKhdE2UwEqOiP0xeVjH4ssEuGVhk0hB6+zk+7bjxmcRKqCX/8BI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmWKJa+y7mZoCK3t6WoyrXZ2egAHkraM9NyPUEwdmawbIAehg7
 /lWzNixN4DMqtw3NG39NXhQXl0Lkc5QN+0HjCHdWN1Gtdci3xa43AbA50Fbtqz2V
X-Gm-Gg: ASbGnctRhUp+oT4PEwdWjEBFROPVzNo2soZfP/9WK/pfnZBXk5D4LjKYt+yLZwPtXAn
 GGAsqLCmWL1QmGg44M1p/FicQFNquNLJjwkSt5P3orTWqJWRRGzzSi5xtL3HpML+J+HHuH5NkEV
 gKTkYt/IoIdWtQVIaGa6D29DPEIXks79JAj39yL+AQzmdan+fs0rmP4+PZM9xmDLJU2Tz4Z28Sl
 TV1Zp5w5HRzU1jC2AeMV+SHdlWlwrSpN3e+N5Bg9rOgb+U8bXkY76vtNJQZe7sFgOX+hAhgPGVl
 yl+jTP2GECgYYqm8gaYvN7q1zUA0812ENPdeKfJytVKOycvorIaBZEbEGSKmYFx+cp8RIKdvGhR
 45y/wiYS0TM7Ao8g3jnI3j8c5
X-Google-Smtp-Source: AGHT+IFi9EC1/1NxGqX4XBHdJMtN5fjcl2jNVYqo/ZivJyiEdRrtfdFGNETtQlaxRAZpI5/82wyraw==
X-Received: by 2002:a05:6102:3f89:b0:4e6:f86c:43a8 with SMTP id
 ada2fe7eead31-4e7729cb566mr12762851137.18.1749541337540; 
 Tue, 10 Jun 2025 00:42:17 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e77394b598sm6031002137.21.2025.06.10.00.42.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:42:17 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-87ed0370355so332310241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 00:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIDdKAM8MDQCCDIFOkwsQrKmKUIPvgjeLucjoOqvSRq5Vl3Qytg11rSMZCDOFG8xAUNx1faXGRhhU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:689b:b0:4e6:d995:94f9 with SMTP id
 ada2fe7eead31-4e7728f4656mr11525695137.12.1749541337050; Tue, 10 Jun 2025
 00:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250607194959.2457473-1-alexguo1023@gmail.com>
In-Reply-To: <20250607194959.2457473-1-alexguo1023@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Jun 2025 09:42:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
X-Gm-Features: AX0GCFsmjX0CF6UEjYJ9k9A05JUeI50EYyxt9NE7N8zAYiqfImbi0RyB1A0JuFw
Message-ID: <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: pm3fb: Fix potential divide by zero
To: Alex Guo <alexguo1023@gmail.com>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Alex,

On Sat, 7 Jun 2025 at 22:14, Alex Guo <alexguo1023@gmail.com> wrote:
> variable var->pixclock can be set by user. In case it equals to
>  zero, divide by zero would occur in pm3fb_check_var. Similar
> crashes have happened in other fbdev drivers. There is no check
> and modification on var->pixclock along the call chain to
> pm3fb_check_var. So we fix this by checking whether 'pixclock'
> is zero.
>
> Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
> Error out if 'pixclock' equals zero")
>
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>

Thanks for your patch, which is now commit 59d1fc7b3e1ae9d4
("fbdev: pm3fb: fix potential divide by zero") in fbdev/for-next.

> --- a/drivers/video/fbdev/pm3fb.c
> +++ b/drivers/video/fbdev/pm3fb.c
> @@ -998,6 +998,9 @@ static int pm3fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
>                 return -EINVAL;
>         }
>
> +       if (!var->pixclock)
> +               return -EINVAL;

While this fixes the crash, this is correct behavior for an fbdev driver.
When a value is invalid, it should be rounded up to a valid value instead,
if possible.

> +
>         if (PICOS2KHZ(var->pixclock) > PM3_MAX_PIXCLOCK) {
>                 DPRINTK("pixclock too high (%ldKHz)\n",
>                         PICOS2KHZ(var->pixclock));

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
