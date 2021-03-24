Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF74A3473FB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 09:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D496E40A;
	Wed, 24 Mar 2021 08:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090F66E40A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:54:53 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id f11so5257698vkl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 01:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRxwIC3bM0aWnGeWfgHlFRedOLEA/dGDm4UbRmEj3Vw=;
 b=FxxA5/eYLrr1H2pnS6N+5Nx1J+TksoR86pXKF4xMfZXsMBdSy/WSzhhtgt13godeFq
 OyALu5LkTJn6MAYg4Edjzw+OrV3a4i3hYqLLvyqJq8pNEjtakf+v/1YXqD/EXaQXKgEs
 QWr3xSWu7ev4bBs7XnTfh+Q1YC3gfMezVlP7U6SdXEDvH9gQqH4fDDfNVL5De64S/nMR
 Z1mTOvNmaMTLl7bAuriIMQXailtd9RlQS+dXy14yl5vGKpMRYarf5BDLFEFMKaerh/jZ
 +/hj9P4NcHW1D5uueXWWPnBDgXKz3qPo1YcpIDbzj0Q8VNSnYtuAi3rcLJr5r9euzfea
 gmTA==
X-Gm-Message-State: AOAM533GlJaf6t6zJGsRxaWoECR+42oD/8aA5VbqxrZVcrhKC3tYRpyZ
 bwUKkFQ7VIMwpDRdZOufFWswsUFvt8b7/WEsTwo=
X-Google-Smtp-Source: ABdhPJzMDF6Nt1AF/bI08S3WTSedZ75tpHSB9bs9VB4XV/vIslxfCLJOjjnhguNbqq5W3XrjdDnyZdfuy6oLhuNoxdM=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr1032890vkl.5.1616576092193;
 Wed, 24 Mar 2021 01:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
In-Reply-To: <20210323083935.GF2916463@dell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Mar 2021 09:54:40 +0100
Message-ID: <CAMuHMdUamD4rAY1Sn-3Fb9Xf1B9g0FY0Pob8rAFsFR0ZcNZ0rw@mail.gmail.com>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
To: Lee Jones <lee.jones@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

On Tue, Mar 23, 2021 at 9:40 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 22 Mar 2021, Daniel Thompson wrote:
> > On Sun, Feb 28, 2021 at 01:41:05PM +0100, Konrad Dybcio wrote:
> > > Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> Why are you Reviewing/Acking a patch that was applied on the 10th?

Only 12 days later?!?

It's not uncommon to receive acks for patches after they have been
applied upstream. But it is if the patch was applied 10 years and 9
months ago!
https://lore.kernel.org/linux-m68k/F5513AE92A5A1047AC2F91AEBB9202680288CBBA3983@E2K7-MS2.ds.strath.ac.uk/

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
