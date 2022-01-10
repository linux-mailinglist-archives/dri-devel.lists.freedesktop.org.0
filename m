Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DA4891B4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 08:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF1811B690;
	Mon, 10 Jan 2022 07:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287B11B690
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 07:38:48 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id bj47so2550892vkb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 23:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjI5/tOCXa4LhOlobTI7CWiqFNOTrhMglYVnreX/oyA=;
 b=iGgzUHu3rY4zs0WXd5wz2ke0rLmiHn5f0Fl1Ruuo8AONJ5YrlcQjQZv8VGU7/Ixrks
 usUlpSxUa8YBGzPYSmoK/x1C4MpH/QH7M/XoMwSUsdC4UZ4pTEIGM77df2Vhzp3RT7qL
 b1cIfl8cAYz+qF2F8fy3D2yH+YhHucCdLQx2wjn5myetQQsJx3s5qWNQtXRODi0r+FtW
 TYn0fuhU6m6t0uo7t+M2c2WAJdcHlhaQ/fk8OflpmUoRhSu5grCJxGvYiybol6V/EX/B
 rlZs/1CBTSHro3Qhqprjd9Fu+NkMACEicz4pcAHPofLLfX12NII5wB/xZJ6OVYe1rhZL
 liQw==
X-Gm-Message-State: AOAM533L+QjOrUKNh1Xq+xhQZBV2+0GoKHUqNXdidAovmsTwy4upaXQw
 lPwHAp7hnnaW2lzJ7R//pLs4o7eR+0XqPg==
X-Google-Smtp-Source: ABdhPJxnouiaTc8g5tF9vca7mT5y7gRJ9M+65hvoGVI3XpwguVKo2dCMW6DdgTFi9EAk8cOrJfeyQw==
X-Received: by 2002:a1f:45cf:: with SMTP id s198mr798717vka.16.1641800327517; 
 Sun, 09 Jan 2022 23:38:47 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id r9sm3310648vke.20.2022.01.09.23.38.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:38:47 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id p1so21818677uap.9
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 23:38:47 -0800 (PST)
X-Received: by 2002:a67:c81c:: with SMTP id u28mr24272101vsk.38.1641800326823; 
 Sun, 09 Jan 2022 23:38:46 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twJOj8+cfEPArF7N_TZpVM8vN+S4s2mMM7phsS-ZOgmJA@mail.gmail.com>
 <163789349650.12632.8523698126811716771.pr-tracker-bot@kernel.org>
In-Reply-To: <163789349650.12632.8523698126811716771.pr-tracker-bot@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 08:38:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEKbc9ovGPqtO8v-xRCoSKF=KZ-53g+7vRKnDZMCmeGA@mail.gmail.com>
Message-ID: <CAMuHMdXEKbc9ovGPqtO8v-xRCoSKF=KZ-53g+7vRKnDZMCmeGA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.16-rc3
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 27, 2021 at 8:29 PM <pr-tracker-bot@kernel.org> wrote:
> The pull request you sent on Fri, 26 Nov 2021 10:52:04 +1000:
>
> > git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-11-26
>
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/a4849f6000e29235a2707f22e39da6b897bb9543

The commit that merged this branch made a seemingly innocent change to
the top Makefile:

--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@ VERSION = 5
 PATCHLEVEL = 16
 SUBLEVEL = 0
 EXTRAVERSION = -rc2
-NAME = Trick or Treat
+NAME = Gobble Gobble

 # *DOCUMENTATION*
 # To see a list of typical targets execute "make help"

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
