Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270C4A9750
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3367910F52E;
	Fri,  4 Feb 2022 10:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F86510F52E;
 Fri,  4 Feb 2022 10:00:20 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id 48so3421404vki.0;
 Fri, 04 Feb 2022 02:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qfMcnOHtfS1bLvkZ8irbT3G/RJ7P/0NHu2x4nFmRtw=;
 b=NTqw4R8HLzZjo2eEvjXRLhlISWf5LrBG/zADFGmy2eDtrN07khUhls9Kjr2D9wbuJa
 aSwo1uBL/tMIlYqvhsIomJmvr+6iW9ad/PRxBQ0akfKR4wjuZitHWNlGISpzVPa3Ngpf
 0mipfb9QKv9Y8fiOzCusBCXmAA9okJP1m4NQX6FeFNfCNaoS/dqhwB6OV7437RxBI26j
 y4EBh+t8vxn+BVvN8y15MKWJLpW6SKa8o46QgTAmNxUYTsq2Zi1yKwDXU2Hf+e3bCzbL
 XZfXW6TyjoIzp62n8+c5QXpVZl8mnHDj/UDU7vqdYLidzllCLDmiosTSLmB5tUUuSTlH
 MGaw==
X-Gm-Message-State: AOAM533s/BjzDvayDQbQucVsGc6mwTc3mgcn4SVqSZNYj3uPTjdvEXix
 Xwz2tuufUZNM7BEPnD66dWN/oZyCPStoag==
X-Google-Smtp-Source: ABdhPJzal0lNsk6e6glHNQt9YZ1Ct392M3PBT6A4fiGHf9DK94VbGpSa7Tboueu1fd5eaZ/Rqb9t8w==
X-Received: by 2002:a1f:9d0f:: with SMTP id g15mr771526vke.4.1643968819295;
 Fri, 04 Feb 2022 02:00:19 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id d74sm359859vkf.1.2022.02.04.02.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 02:00:18 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id c36so9860465uae.13;
 Fri, 04 Feb 2022 02:00:18 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr528892vsb.68.1643968818566; 
 Fri, 04 Feb 2022 02:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-5-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Feb 2022 11:00:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUL=8xay27vvBvbv0iQ0T0oSwMgxMNrLdDmj03ozAM4Gw@mail.gmail.com>
Message-ID: <CAMuHMdUL=8xay27vvBvbv0iQ0T0oSwMgxMNrLdDmj03ozAM4Gw@mail.gmail.com>
Subject: Re: [PATCH 04/21] fbcon: delete a few unneeded forward decl
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 9:50 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> I didn't bother with any code movement to fix the others, these just
> got a bit in the way.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
