Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC6AD6C24
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D07E10E42C;
	Thu, 12 Jun 2025 09:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE0610E44E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:29:21 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-87ec5e1cd4aso213852241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 02:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749720560; x=1750325360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NERsyttcJtkIczzHslePzMNvEb9gRLTeDCgd7sAMOcQ=;
 b=pwN1uZnldZzYyME9EfdlLaFCOtFmgSAWtIrco4nzpzrLj1Ng51S3EacNI4BLCVYhOH
 zMNTU3mkCbuiFqcc2A/qxag2n4WgOiPMiSO85KAjwcp6YTVWsuy3lYcjtJRCTcrPSBIS
 1v/Pahy3QYWtuABAoLa4DWd276Z2Ys2ZRU4z6mHpotFZ4iCcn+mulbRnCOJK5oU7uDN7
 nnL0QZ3vnP+T7QvahIt0fHCfL7T3WLD2DwjzhE1QC4EOd2xbkBFfGV+qT4b6hWs+12Q0
 kWtghBhOzSiLyIOcwN9NurZfLs0Y+4EesJiCts0wYzoLTMTXNf+Ki6lqwgUfxG6+Ql3G
 6jzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkHs7BwQ6CxQDgLvXI53JNzwU+nrl6U4sXNpjYkfPWoBYuN6SlzSRvnESX0Bzr0HU8k1qe1T5Wd1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyykm1i5lEgLrVR5syxZxRzXYSR8tHgrzkK6sZ4cYxtbSGmIMBf
 2u928Z5hbjBbf1rHCKFG/zNkbQDK8Rq2R1d/lFej6LB0zpLDnubqV7Pcozv7vat2
X-Gm-Gg: ASbGncvxX5o5qtUORKMe90xnfjCwvftGwTdhCsSinowtl8ZmmkSkQCRcrj2mW3CMWmf
 KhE2zEpqNiocKUsGt8Ok80oy6BJCxjqCXO1mYMsugaZcQUYyA0cU53ltNbwtHdfCae8NCFL7ZEw
 BB8dlmpygx6zWD05KNgoifGqKxWmg5hv1dXe6U4RfkTrKtm4O5ZHDjJoyipGTKnyK5N9L8K8aO2
 +NP4W9xLI9bwyurtl5rAEpot/z6aq6puFtORFobzWNXh4evxK/+xtsyRWfWRGEWYqpoLdUMaDA0
 PtLpB7XEMoTET1PDdrCVcO6dasAmugiFPXNoJKEZWxp/v3aR3F5mXHSbuyEFzX1ptcH1ZEQa797
 f8frukduhDqGc3Sb6h12jlcS2
X-Google-Smtp-Source: AGHT+IHiZBGxDrBMNUWOa+VPVMSPClXIZX7TibxAcfLXVj8+TbmFcOgpm7sJSsBIcQDdqU1NGa5cmg==
X-Received: by 2002:a05:6102:3e12:b0:4e7:7787:1cf8 with SMTP id
 ada2fe7eead31-4e7ce8308b4mr1675644137.7.1749720559803; 
 Thu, 12 Jun 2025 02:29:19 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e7d07d6dc0sm176145137.11.2025.06.12.02.29.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:29:19 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-4e79de9da3fso194103137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 02:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxZCE5dtZa2fFTpC7EfCrwcf6UuXwOVjCn+x7qSM21mNqDQxPCXn9sk50tgj/u7JmBdVud4sohsww=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3e12:b0:4e7:7787:1cf8 with SMTP id
 ada2fe7eead31-4e7ce8308b4mr1675643137.7.1749720559317; Thu, 12 Jun 2025
 02:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdW5wU1ForGOGD-+HDUu7wcnBx3jx911nLEqbJ71t4MBsg@mail.gmail.com>
 <20250611161207.4031677-1-alexguo1023@gmail.com>
In-Reply-To: <20250611161207.4031677-1-alexguo1023@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 11:29:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=GyUHsfqtSD8iYaV_nRszEunaDMCoL6zWf5_bPS0T4Q@mail.gmail.com>
X-Gm-Features: AX0GCFsIv4ID6KhU6t-X5eNite_AO0HV8CCJC0-uReM8yNgsMZKrhCmvXGEXb8Y
Message-ID: <CAMuHMdW=GyUHsfqtSD8iYaV_nRszEunaDMCoL6zWf5_bPS0T4Q@mail.gmail.com>
Subject: Re: [PATCH] fbdev: pm3fb: Fix potential divide by zero
To: Alex Guo <alexguo1023@gmail.com>
Cc: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 11 Jun 2025 at 18:12, Alex Guo <alexguo1023@gmail.com> wrote:
> > On Sat, 7 Jun 2025 at 22:14, Alex Guo <alexguo1023@gmail.com> wrote:
> > > variable var->pixclock can be set by user. In case it equals to
> > >  zero, divide by zero would occur in pm3fb_check_var. Similar
> > > crashes have happened in other fbdev drivers. There is no check
> > > and modification on var->pixclock along the call chain to
> > > pm3fb_check_var. So we fix this by checking whether 'pixclock'
> > > is zero.
> > >
> > > Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
> > > Error out if 'pixclock' equals zero")
> > >
> > > Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> >
> > Thanks for your patch, which is now commit 59d1fc7b3e1ae9d4
> > ("fbdev: pm3fb: fix potential divide by zero") in fbdev/for-next.
> >
> > > --- a/drivers/video/fbdev/pm3fb.c
> > > +++ b/drivers/video/fbdev/pm3fb.c
> > > @@ -998,6 +998,9 @@ static int pm3fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
> > >                 return -EINVAL;
> > >         }
> > >
> > > +       if (!var->pixclock)
> > > +               return -EINVAL;
> >
> > While this fixes the crash, this is correct behavior for an fbdev driver.
> > When a value is invalid, it should be rounded up to a valid value instead,
> > if possible.
>
> Thanks for your confirmation and suggestions.
>
> I added this patch based on existing checks on var->pixclock in other drivers, such as savagefb_check_var, nvidiafb_check_var, etc.
> Are you suggesting that it is better to replace an invalid value (var->pixclock == 0) with a default valid value, instead of returning -EINVAL?

Indeed.

> If so, could you advise what a suitable default value would be for this case?

The answer is hidden in the existing check below:

> > > +
> > >         if (PICOS2KHZ(var->pixclock) > PM3_MAX_PIXCLOCK) {
> > >                 DPRINTK("pixclock too high (%ldKHz)\n",
> > >                         PICOS2KHZ(var->pixclock));
> > >                 return -EINVAL;
> > >         }

It can be replaced by:

    if (var->pixclock <= KHZ2PICOS(PM3_MAX_PIXCLOCK))
            var->pixclock = KHZ2PICOS(PM3_MAX_PIXCLOCK) + 1;

The "+ 1" is needed because of rounding.

> Actually, I have found a few similar issues in other functions as well. I would like to make sure I am addressing them in the correct way.

That would be great. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
