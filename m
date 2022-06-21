Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC655396E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 20:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6810A10E798;
	Tue, 21 Jun 2022 18:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A29F10EF65
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:16:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so7683561wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=apT0ANeqWm9+pTrO0iJp5VV6HKv4djCO1v/acmOTfvY=;
 b=hZdZgaOVVwP88XsbsOuXHWqYWNO3vi/CPma1pPt2mdtVBbrxU8v0OjThEwgFsS8Y88
 RDXq4pC4pVwbdtAWQjFCA7i85PR2yFDuiJhp+M4NWQbuoDvA9p+sf0DsSETdyVy3rmm3
 8yDIfFmHHzpFoeZHFVfoZ3/NCCZPQnz+OTLNI/sKUqzExRGLltZkw6PGjUOc3w8KGwty
 aE99kVNJDW7lHm/sCq4YUofpGmtVHOhsH2/pj/6mrUyyum5NOOdyfDam0f1o+LaJ60Cp
 m21ltz8RI0TSaCrwZreyeiVsHBBFZ4Q7xBxF++IcjJetO4bdwb1Dgm8Bp7EMvOZVWO+V
 ufzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=apT0ANeqWm9+pTrO0iJp5VV6HKv4djCO1v/acmOTfvY=;
 b=3/eXagvo+p7rR8hGqUUQkTB4CW7CnJC4NywxiHsJF9h7SCEm2ShMPqrXTDGF12RcJe
 lKffwUx3pg3phTIuI/9BddoQJCBUNKGB6YF7wPzzHYH44Go1PWv1AryR4MNe5XEUQd6d
 vRurFtJKe1oua+D5qo9ZfPT1Q+qBwryrAB27aotVLN4Auli3NHa50cog+aQV/JOoApqP
 JO+mO7i+dHF/jfjGIG08emcmKufvd4v8saPeuUQ+hjnsKgEaKb+pA6GOAXe7IWcMMcp5
 TJBSK8oCHY+yjFr7ef1FY4cofKPG7D7Y1rC9keZ/SAcQvRFal+uQ7xHuM34YfuAmgRkd
 07dg==
X-Gm-Message-State: AJIora+RLo1LQMXssbeKjtZ8TI+RyveW8S89zgRuk+94sfliL2CYoiAa
 Pw4pmL9nKDFHxPcVh2GrQhs=
X-Google-Smtp-Source: AGRyM1v2x8XQjMkHBy22K+zRqshHQGdU3odTKCt3cgCbAs2n1G0K+OjjEtYRm9ugKZrBBh8mKn0+Kw==
X-Received: by 2002:a05:600c:a07:b0:39e:da6e:fc49 with SMTP id
 z7-20020a05600c0a0700b0039eda6efc49mr29346749wmp.143.1655835362839; 
 Tue, 21 Jun 2022 11:16:02 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b0021a38089e99sm16670822wrf.57.2022.06.21.11.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 11:16:02 -0700 (PDT)
Date: Tue, 21 Jun 2022 20:15:59 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH v4 3/3] drm/doc: Add KUnit documentation
Message-ID: <20220621181559.GB3209@elementary>
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
 <20220620160640.3790-4-jose.exposito89@gmail.com>
 <CABVgOS=nmio08_==bOhXK1qLBoGVBO9=7A9srcp6PBUS06CTqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABVgOS=nmio08_==bOhXK1qLBoGVBO9=7A9srcp6PBUS06CTqA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Tue, Jun 21, 2022 at 05:38:38PM +0800, David Gow wrote:
> On Tue, Jun 21, 2022 at 12:06 AM José Expósito
> <jose.exposito89@gmail.com> wrote:
> >
> > Explain how to run the KUnit tests present in the DRM subsystem and
> > clarify why the UML-only options were not added to the configuration
> > file present in drivers/gpu/drm/.kunitconfig [1] [2].
> >
> > [1] https://lore.kernel.org/dri-devel/CABVgOSn8i=LO5p7830h2XU1Jgg0KrN0qTnxkOMhf1oTgxjaKKw@mail.gmail.com/
> > [2] https://lore.kernel.org/dri-devel/CAGS_qxqpiCim_sy1LDK7PLwVgWf-LKW+uNFTGM=T7ydk-dYcEw@mail.gmail.com/
> >
> > Reviewed-by: Maxime Ripard <maxime@cerno.tech>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> 
> This looks good (and doesn't seem to introduce any 'make htmldocs'
> build issues on my machine).
> 
> You could also mention that using --arch=x86_64 (or similar) instead
> of the UML options is another, equally viable option for running the
> tests. That'd make it more obvious how to run on different
> architectures: UML, while a good default, is quite different to other
> architectures in not having any PCI support out-of-the-box.
> 
> (Maybe we should make the --arch=um default config include these
> options? Or have um-pci as another architecture. We did decide not to
> bother with SMP and x86, though...)

Javier suggested the same:
https://lore.kernel.org/dri-devel/20220614180952.GA7067@elementary/

I prefer to keep the docs as simple as possible and link the KUnit
docs for more information. However, you both have way more experience 
than me and agree on the topic, so I'll be happy to include it in v5
if you think it is a good idea.
 
> Regardless, this is
> Reviewed-by: David Gow <davidgow@google.com>

Thanks for reviewing and building the docs, appreciate it.
Jose

> Cheers,
> -- David


