Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10528306D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 08:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C4689AA2;
	Mon,  5 Oct 2020 06:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D406C89C25
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 06:44:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o5so8147488wrn.13
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Oct 2020 23:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OzN1JPXKv6Spexj0EdyUYa+k+0ic40CtwBqEYlJv0uk=;
 b=K80mYXkydLOgDeuGd2WdrPXA+RMrX5tV+XPfZ2lA0PXfqWNKLkf+quBbJkZcH/POmM
 qgGx6+HeSWCa515mA1hGILJ2IACkf/UFm/kWiHYN3beQpCSzzXxNN2oYxVdzojwi0crQ
 yL2sOSiXwPhqRWr4stdCOrQfuj2ER0J/hul8bkWw055vDENA2l+qYVp8d3ktVwMojgCp
 swoBV8gTEZl8EPRpAGHz53+ntWMnpzj5sZC1WiP9Vy26D9K3qaYe0x/E8aGDNs0ryXGT
 HMdltQJ1lGIkpOkADdm9zLfwWyZsvjP/A1Jjgcx+FUabTQ853tlXt5Ewd0fXQOsRbSD/
 mg9w==
X-Gm-Message-State: AOAM530NLK3j0n8WwXPGYZM43AP373TSaOibagfahs5SW88lmhmEXoAO
 2Ay8OwwjF+Bs2mJrRiPRug7C9xjYxgYq7mXoTT8=
X-Google-Smtp-Source: ABdhPJzJraKz/rfOgCeb7Og+IIW+gvj3yn/RrgEdiZeXLCFiS1Menw7IFtSrPZBBB90TxwYwsWX0dVxlg/op711mQkk=
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr15240286wrx.133.1601880253409; 
 Sun, 04 Oct 2020 23:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
 <20200611085900.49740-2-tomeu.vizoso@collabora.com>
 <1b72d5ad-365f-e7fb-624e-b88420ff264b@arm.com>
In-Reply-To: <1b72d5ad-365f-e7fb-624e-b88420ff264b@arm.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Mon, 5 Oct 2020 08:44:02 +0200
Message-ID: <CAAObsKBHe1a4cSe0LS64ikEVzU55FBK4yQbLpMxvOJsP9s=1Nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] panfrost: Add compatible string for bifrost
To: Steven Price <steven.price@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Jun 2020 at 11:00, Steven Price <steven.price@arm.com> wrote:
>
> On 11/06/2020 09:58, Tomeu Vizoso wrote:
> > Mesa now supports some Bifrost devices, so enable it.
> >
> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
> I've also dug out my Hikey960 (from the box it's been in since lock down
> started), so I'll see if I can get things running on there, at the
> moment I'm seeing some DATA_INVALID_FAULT regressions running my hacked
> DDK :(

Hi!

Has this one fallen through the cracks?

Thanks,

Tomeu

>
> Steve
>
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 882fecc33fdb..8ff8e140f91e 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -677,6 +677,7 @@ static const struct of_device_id dt_match[] = {
> >       { .compatible = "arm,mali-t830", .data = &default_data, },
> >       { .compatible = "arm,mali-t860", .data = &default_data, },
> >       { .compatible = "arm,mali-t880", .data = &default_data, },
> > +     { .compatible = "arm,mali-bifrost", .data = &default_data, },
> >       {}
> >   };
> >   MODULE_DEVICE_TABLE(of, dt_match);
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
