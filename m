Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B34A3EAB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 09:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CBF10F552;
	Mon, 31 Jan 2022 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Sat, 29 Jan 2022 14:25:51 UTC
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F2810E226
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 14:25:51 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4JmGg50KHBz9w2xj
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 14:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDlLEsZ4wKF0 for <dri-devel@lists.freedesktop.org>;
 Sat, 29 Jan 2022 08:19:44 -0600 (CST)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4JmGg45fyKz9w2xk
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 08:19:44 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4JmGg45fyKz9w2xk
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4JmGg45fyKz9w2xk
Received: by mail-io1-f71.google.com with SMTP id
 y22-20020a5ec816000000b006115762d153so6485943iol.7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 06:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PuqdS3L58mzSCSZWW4CaQY14KAX9H/IcMnqehYd1TcA=;
 b=ojx5o+0AWIsHn6CLcmG9NAIUTp7/bL7NxVhwKewAHTEKEAN/wTmvkqeMwnoqF2EWxF
 MzTDAYUO3ADkb+dmMgKibHfnSlTqcBfmshdXYyd2m7QuzM+VqVZVn6zJtsciQ1IMIzOL
 lEgHz6PGyIgAKWgwprAtYfe6gbnQRc6k8oYFBPhxFQCo+CVzD2qTp/NayfpNsH6Ca3G8
 tjQOaZEv1eVvb/6knAwZe4HRCPl/2jKVbBtq5+VLH+vd4KhmmZKlN3wXqU5dDEY9Qnr8
 l5lvNw4Whkzf1y34AhkFdH6MufWo4LH1u/sWggFn/tJgY2q3gKtlkrj5dG4E4m9u/RFI
 qG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PuqdS3L58mzSCSZWW4CaQY14KAX9H/IcMnqehYd1TcA=;
 b=E3O7NnHj4Xq5q/vATwK7+QyyFoXEwO7JG0NDtdxkoAjS/ou1KSWgyhOn1Q7Met/IAx
 jHP3xQWcIGzzI1Ae3GQi2aRd7GFe3n0Hp5SuEcBVai3WQDgKsnpX9VOfHp6RZOdAAP8a
 DvGXEY7GWTtKDPSH72pD00RJe05TtHv8P6f0jXHjo62CQJWs7VTi1w/o+DRwBf75HfzJ
 n1s61QBMpHgH/bUNq0wKl5AA/aR9BajB4hJoQUiCI3HBczHVqBot9b05bKDsDK1lSA3E
 iX3TfRsjCp5MKVVy7Lgabhey1BY+XStD3Lp2N5rbO39V3cZ88U/09SdoObqmDSAY9mKW
 YIOA==
X-Gm-Message-State: AOAM531Y8dxtCjY38DhvKjEnBan51wuPJpo9LLu1EiivYO0D6cVfsZ8r
 qqaXVfc5WLfOC2TA2UjBzM0AlTHykhLqTvKA06YbMTjNo3R4yqAa6dec/OK2od5TS5MXSjNkIZD
 RQmQQrLiPKPHZNBFDcNBKsNz+pl2nAAyRAkGDUpF4m5FdHXCv
X-Received: by 2002:a05:6e02:174a:: with SMTP id
 y10mr3656060ill.135.1643465984091; 
 Sat, 29 Jan 2022 06:19:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzycOv74QwTAVhQJh+Rc3bAmgfW8CYMlJTqaiuCC50HrW7pW+VbHnCWzlyJTWYfqKN1vkFodBYbD679saM8mT4=
X-Received: by 2002:a05:6e02:174a:: with SMTP id
 y10mr3656033ill.135.1643465983736; 
 Sat, 29 Jan 2022 06:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
 <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
In-Reply-To: <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
From: Kangjie Lu <kjlu@umn.edu>
Date: Sat, 29 Jan 2022 08:18:55 -0600
Message-ID: <CAK8Kejr6E76u2kf_OKxC1RT_qsCWXDf7q4WcTC13-OJz5CseWg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
To: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 31 Jan 2022 08:35:18 +0000
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 1:58 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Jan 28, 2022 at 8:54 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > >
> > > Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> > > I pushed this already but I will go ahead and send a revert for this patch.
> > > Will cc you on it as well.
> >
> > This seems short-sighted.  If the patch is valid I see no reason to
> > not accept it.  I'm not trying to downplay the mess umn got into, but
> > as long as the patch is well scrutinized and fixes a valid issue, it
> > should be applied rather than leaving potential bugs in place.
> >
> > Alex
> >
>
> Even though knowing that malicious code can be introduced via
> perfectly fine looking patches, and sometimes one will never spot the
> problem, this patch isn't all that bad tbh.
>
> So should we reject patches out of "policies" or should we just be
> extra careful? But not addressing the concerns as Greg pointed out is
> also kind of a bad move, but also not knowing what the state of
> resolving this mess is anyway.


Seeing some discussion here, I feel I owe you some quick updates on
the state. We sent three testing patches in August 2020, which is a
serious mistake. We never did that again and will never do that again.
All other patches including recent ones were sent to fix real bugs,
not to introduce problems. Clearly, although most of the patches are
valid, some patches are still not good enough, but it is not about
malice. Fixing bugs in Linux isn't an easy task and takes so much
effort.

We did not ignore the concerns pointed out by Greg, and have seriously
taken some actions. For example, we explained how our static-analysis
tool found the bugs, and members in my research group have internally
cross-reviewed the found bugs. We sent these patches after contacting
Greg---I thought Greg allowed us to send patches, but also requested
us to work on the last process with our administration. Unfortunately,
the process has been slow during the pandemic, but I hope this can be
resolved soon. Of course, before this is resolved, we will not send
any more patches.




>
> >
> > >
> > > On Fri, 2022-01-28 at 11:18 +0100, Greg KH wrote:
> > > > On Tue, Jan 25, 2022 at 12:58:55AM +0800, Zhou Qingyang wrote:
> > > > > In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> > > > > passed to memcpy(), which could lead to undefined behavior on failure
> > > > > of kmalloc().
> > > > >
> > > > > Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> > > > >
> > > > > This bug was found by a static analyzer.
> > > > >
> > > > > Builds with 'make allyesconfig' show no new warnings,
> > > > > and our static analyzer no longer warns about this code.
> > > > >
> > > > > Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> > > > > "secure boot"")
> > > > > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > > > > ---
> > > > > The analysis employs differential checking to identify inconsistent
> > > > > security operations (e.g., checks or kfrees) between two code paths
> > > > > and confirms that the inconsistent operations are not recovered in the
> > > > > current function or the callers, so they constitute bugs.
> > > > >
> > > > > Note that, as a bug found by static analysis, it can be a false
> > > > > positive or hard to trigger. Multiple researchers have cross-reviewed
> > > > > the bug.
> > > > >
> > > > >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> > > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > > index 667fa016496e..a6ea89a5d51a 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const
> > > > > char *name, int ver,
> > > > >
> > > > >         hsfw->imem_size = desc->code_size;
> > > > >         hsfw->imem_tag = desc->start_tag;
> > > > > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > > > > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > > > > -
> > > > > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > > > > GFP_KERNEL);
> > > > >         nvkm_firmware_put(fw);
> > > > > -       return 0;
> > > > > +       if (!hsfw->imem)
> > > > > +               return -ENOMEM;
> > > > > +       else
> > > > > +               return 0;
> > > > >  }
> > > > >
> > > > >  int
> > > > > --
> > > > > 2.25.1
> > > > >
> > > >
> > > > As stated before, umn.edu is still not allowed to contribute to the
> > > > Linux kernel.  Please work with your administration to resolve this
> > > > issue.
> > > >
> > >
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> > >
> >
>


--
Kangjie Lu
Assistant Professor
Department of Computer Science and Engineering
University of Minnesota
https://www-users.cs.umn.edu/~kjlu
