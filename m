Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E46140C0F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 15:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F5B6F58B;
	Fri, 17 Jan 2020 14:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5EF6F58B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 14:08:12 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i15so22627668oto.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 06:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxppi7pIj8e5sSfdrBldrP06c7HVZk7Bw8KYy+1AxaI=;
 b=q6XFMvODLEOzRoaiz/EqrZPKzzOXX8Um9+Et88v32Efzx4cBYD6ooVgpnUUBY7esiU
 s7Kekx51tJpPrI+xy9Y9gbodsINm464vnDqqQ6v7Vuey6yi2B/s41DgHqDGarkVQ++sk
 l19tcqU3Xd+BoR+oCjszsl/8HHJh/Kt38WXCZYDZMzWBFkage14D8CqnchAIkI+a+FXQ
 18Sc/cgT8QISfAN0rm0iXqby9i5MpYKy8d75HEJe58rZvPKCNkcwLmmFZukBTqUNJ+HE
 rDq37TH3ztB5oREwdyNF9TITqcIEjyeodtmiRLMXNrZoyonnE+bbDqc90sUsoiuJR5pV
 ZYkA==
X-Gm-Message-State: APjAAAUsyOvEpH1hNEHgIttUoxVtU/illhYrNWGPy0oUpqPne9fU5nw6
 L42dHX5MwGzBqBM84S5Lbxj3KM4nyfMUwMkTikg=
X-Google-Smtp-Source: APXvYqz7FBS/FtklMvm4sU6CKtZ5bnsEJ9X8DfF6z56uTKJJzPruMzWUh0wv+Ed3caYwy5q2M9Zw0WNyCnMymcjACSk=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr6064660ots.250.1579270091226;
 Fri, 17 Jan 2020 06:08:11 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200116145116eucas1p2d512db3f05f01d87bc9039af5bf70af3@eucas1p2.samsung.com>
 <c687dbc5-cf5a-9508-2a61-e757a1a14568@samsung.com>
In-Reply-To: <c687dbc5-cf5a-9508-2a61-e757a1a14568@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2020 15:08:00 +0100
Message-ID: <CAMuHMdW0qSAn3S+bpFieP=xukK5SapAq1oRC8XouuMJ6fgqOBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] video: fbdev: sh_mobile_lcdcfb: fix sparse warnings
 about using incorrect types
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 3:51 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> Use ->screen_buffer instead of ->screen_base to fix sparse warnings.
>
> [ Please see commit 17a7b0b4d974 ("fb.h: Provide alternate screen_base
>   pointer") for details. ]
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
