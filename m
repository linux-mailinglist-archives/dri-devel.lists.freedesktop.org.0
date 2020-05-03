Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C491C337F
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 09:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C396E15D;
	Mon,  4 May 2020 07:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6806E0BC
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 20:00:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b2so7654392ljp.4
 for <dri-devel@lists.freedesktop.org>; Sun, 03 May 2020 12:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zLPE4D1sK0zsHGMlXa0Pxw17ACXHcfJqsNrgMQ+yusQ=;
 b=MoWFwe/ISoefeYi0uYDrYATw+tIdx6gFDmppAi/CnTIz8roXxfUJ6Ab4QL8hRC3NzN
 PaLN4fwk3uQOqKKH7JJlzdUbItmZbfamGgKniB/eDlzUl6eqIzMSiPcaqykrV/SxjCmY
 aHDX9StPG0YGB5mzlk6IUVPpqjafmjulD+GByo9qpjNb99qXBXXwTruhYco6dEPsq12H
 7X7PTNo9/gWDYcPpZDmqtlrbelvrcy7OyYnXAlhebJNBJdsKKF6brchm6awxOrm4ZVqY
 DHgpQtq4tpInB/trZOG4UlfU7mR4jHrUT4M1k2LesHQL/9V/mJM5YqlpAN+foE7H3Kzj
 YjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zLPE4D1sK0zsHGMlXa0Pxw17ACXHcfJqsNrgMQ+yusQ=;
 b=Xf/d20e9BMgMgTEE+O2p1zJ/gcRUXsbBRXXkPG00x3uJ0XXEXTwzNAzyvL1YZAIpzT
 j6AiQzFPLaxREyxubiFzlWb/ZxKcFUVPcJCs36JixS5qg/Ahd58kp1Fb7x10gimEfryU
 /sQP8Ulj7+GMsXSoGDIlrfRuz+N3pg7FzrmV9KXsAyDUuxfFSfXBxtUHz8fSOxJ56y3U
 j/NVe2CjYTSDvr2z7Ej0Sy2Uuo0Qd0nDtW34IPVK4Csbh8pdKVdxb4B8jhTmb2TPetfo
 psVS9pg80ubCgoGFT+B/EjtkEFSvRh6NUl4bsn6VyTgY1zPwdLFu2vh9oD4eSAxstJCC
 j1QQ==
X-Gm-Message-State: AGi0PuYEvYnCiY/N6btgu/hVW8vd8r5uk42aJJv62OnuEXRbo1zq5UZm
 m/67Pbo+BXXwhkFtvBK+CLY6T2sbmSIekTlOrV4=
X-Google-Smtp-Source: APiQypJdPIGKEeUOvDrKstspkPFWNnHxClOnLOmE9E9/8W4198p/LZr+UDHjXayyyV+8kSNHjmY0HQTKVR4QHTOhKHw=
X-Received: by 2002:a2e:7815:: with SMTP id t21mr8540277ljc.146.1588535998430; 
 Sun, 03 May 2020 12:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <1588370291-7746-1-git-send-email-jrdr.linux@gmail.com>
 <20200503174040.GA27362@ravnborg.org>
In-Reply-To: <20200503174040.GA27362@ravnborg.org>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 4 May 2020 01:29:47 +0530
Message-ID: <CAFqt6zb94Wj_dkSb2NJ6TOJczxJErvFRB7OSzZieOTot-EL+qw@mail.gmail.com>
Subject: Re: [PATCH] video/fbdev/matroxfb: Remove dead code
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Mon, 04 May 2020 07:17:19 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 3, 2020 at 11:10 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Souptick
>
> On Sat, May 02, 2020 at 03:28:11AM +0530, Souptick Joarder wrote:
> > These are dead code since 3.15. If there is no plan to use it further
> > it can be removed forever.
> Could you explain why you conclude this is dead code sine 3.15 -
> and maybe point to the commit that made it dead.
> I failed to look it up.
> And I would assume I did not have to look it up, but that you have
> provided enough background to evaluate the patch.

I trace this back till linux version 2.3.9 & 2.4.0 in
drivers/video/matrox/matroxfb_DAC1064.c
(3.15 was the version when this is moved to
drivers/video/fbdev/matrox/matroxfb_DAC1064.c)
and I think this driver support was added mostly in 2.4.0, but as it
is pre git era, unable to provide
commit id. Code commented with *#if 0* in discussion existed since 2.4.0.

First two *#if 0* can be removed as these are just declaration of
variables, never used.

-#if 0
-static int def50 = 0;  /* reg50, & 0x0F, & 0x3000 (only 0x0000,
0x1000, 0x2000 (0x3000 disallowed and treated as 0) */
-#endif

 static void MGAG100_progPixClock(const struct matrox_fb_info *minfo, int flags,
                                 int m, int n, int p)
@@ -843,9 +840,6 @@ static int MGAG100_preinit(struct matrox_fb_info *minfo)
        struct matrox_hw_state *hw = &minfo->hw;

         u_int32_t reg50;
-#if 0
-       u_int32_t q;
-#endif

In my opinion 3rd *#if 0 is not for documentation purpose and can be
removed as well.

-#if 0
-               if (mga_readb(minfo->video.vbase, 0x0000) != 0xAA) {
-                       hw->MXoptionReg &= ~0x1000;
-               }
-#endif

There is a 4th *#if 0 in this file. But it wasn't removed as there are
some documentation
comment exists for it.

#if 0
/* HELP! If we boot without DFP connected to DVI, we can
  poweroff TMDS. But if we boot with DFP connected,
  TMDS generated clocks are used instead of ALL pixclocks
  available... If someone knows which register
  handles it, please reveal this secret to me... */
hw->DACreg[POS1064_XPWRCTRL] &= ~0x04; /* Poweroff TMDS */
#endif



>
> Sometimes dead code are kept becasue it documents something etc.
> So it is not always a simple removal.
>
Yes, I agree there are some dead code kept tree wide for documentation purpose,
but many of them are truly dead code as well and it differ from case to case.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
