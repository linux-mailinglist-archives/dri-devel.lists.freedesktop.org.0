Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965E151F9C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 18:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1914389C48;
	Tue,  4 Feb 2020 17:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A34886A4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 17:39:46 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j20so9452791otq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 09:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MfTrfXuWJZvmTinqgH9BhTb81pXVw324bWiLHoptFMQ=;
 b=Azrpb5sw1SMnIel9KIecTesoNjAxLDTRpJV6+zOGRiWs188ginfcarbuHw/aorEoES
 xhQ0q/AxzoWf/KG5YlpbGry0xSdPEiWWetDwPA6IDyMO+3thPdS/ZhFDORgXWarc8w/L
 AKYaJq4K8mAVkybDbgvDN2UHYIxXxBwEPkTVeWDKVNrJ8iunC626d1UhfuK9s8t04Vun
 BLHF05lPE4QEfEQ02YEh1CwHIkhdBnWu03tE1NpQgrE6Jov/Wpw4OqyK7U7r7dHgXvop
 +fzpRfalJZUa5C0GAbDRB6qA4JWrN1jB2SbgW8oOIMgPP2yre59+4VdvZR7u36fXXU3h
 saPA==
X-Gm-Message-State: APjAAAUN8inXYODnkGXNAgVM83KCoLqb3vR/SUOPyGmP8/0QdSl81iTp
 KzvkCXYcADS8RpIw/4W8DjYJchylMWg7FzJ5ouE=
X-Google-Smtp-Source: APXvYqx9f9SWF/55QKPhce0GISuI6/YtUC2HQmARzMxBnJbY401BCGr8IO8WU8RPHjBLF8lwNuxC9qnjvMaHP0VxhZE=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr23636696otm.297.1580837985305; 
 Tue, 04 Feb 2020 09:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2020 18:39:34 +0100
Message-ID: <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Replace with appropriate types.h.

Thanks for your patch!

I have only one very short question: why?

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
