Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6961E9C1E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 05:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34B089EB4;
	Mon,  1 Jun 2020 03:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0359689E9E;
 Mon,  1 Jun 2020 03:41:59 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id p123so4502746yba.6;
 Sun, 31 May 2020 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYmBlz5UTewvMo6VU7zofeZb2KwsJcE+c5rzEdcDxAs=;
 b=TNGRzCS1pVr/YFvfdNCKPdt1UNOXloplCFlL8JiwhG880Op453GRDwDjrwSB17N5rY
 SL0Bq08xdeW+wGuyQmAnUPJe8/z16qEGO9oG5PcSqKySJyqiuWCQUQPePgg2qAT6OjDd
 FmCwqnWlAiWIxcCev45E1PDw3lzSgsI7pTf9qoCqRDpDVY7H7XHP+r9RISD3aeRIILQ+
 2s45+RwemqIAmA3Rdxr285xYiKGYuASRCgKh66HZ4y9ucVd79na1q1eU+myW85sl5NGL
 USY/cGKx15a6PlPLklngEWs1ynzK5GbJhi1wj7A15z2UgfF6ZYbo9ciC2cZHIz7c8tL1
 uClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYmBlz5UTewvMo6VU7zofeZb2KwsJcE+c5rzEdcDxAs=;
 b=CIkFD1O/o3jsHIv2oOmAt0zuzA80eN6siCYsV6OiJI1i0sqiTTNaNBNjYTNYlc6yMt
 d5Hytg5a27eNDRTULLNkYrMy0BITzzoNTXC7Umak/EB7MyDTQhXcuwSsLFpu/wyFRrGc
 VdVtEq2anm+9hZ6TNVPvCvziLN9YoTq298BHfrmiXswD8V7T1QZLmwJHAfOAzOehaktT
 W+Bs9LCmnW9IrS6k4emPQCwGAnxk6JNf+o8PcW3P4gAF8V6Gz47FOrd/KHFbuZkZCk76
 s7o/5sBml86ICgoYhuzcpfIleCUKbOzwIko/gewJjTDBcTXj7qlKuswQGdNdcE/a/cp+
 UL2g==
X-Gm-Message-State: AOAM5330OvdD3CnEED6XkMYRpWKQM7KmlnT/zPz6KRCd9uHRhx+xYrGm
 p1REgxbeNf2xS8tjDkiWVIjTp6Qao+xw2ixuKsJwsxFTui4=
X-Google-Smtp-Source: ABdhPJySmAErk26rEvDftoaHaCg1eBbzZB3s3cyagkr2yK8Ypc9yi/+QiwUHA42lTGn9VL0ushxpCL1O8VZURDrHLm4=
X-Received: by 2002:a25:8b02:: with SMTP id i2mr30981552ybl.283.1590982919170; 
 Sun, 31 May 2020 20:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
 <CACAvsv73wZK_pKk4TDHaTeBUqxYHvK0KhLQBgPC8Be_VviY2jg@mail.gmail.com>
 <6a65a5b1.dd4b7.1726deaea0a.Coremail.dinghao.liu@zju.edu.cn>
 <CACAvsv5kcUC_kOfMPxqY-irSAexmhm=WKO8Vk=wTZWdsbaartw@mail.gmail.com>
In-Reply-To: <CACAvsv5kcUC_kOfMPxqY-irSAexmhm=WKO8Vk=wTZWdsbaartw@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 1 Jun 2020 13:41:48 +1000
Message-ID: <CACAvsv5t2gWDae_8b0-fH9e8fzgmxfiUtZTPeFuhmKXDFAmvGw@mail.gmail.com>
Subject: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new
To: dinghao.liu@zju.edu.cn
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 kjlu@umn.edu, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Markus.Elfring@web.de,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Jun 2020 at 13:37, Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Mon, 1 Jun 2020 at 13:27, <dinghao.liu@zju.edu.cn> wrote:
> >
> >
> > Hi Ben,
> >
> > > > When gk20a_clk_ctor() returns an error code, pointer "clk"
> > > > should be released. It's the same when gm20b_clk_new()
> > > > returns from elsewhere following this call.
> > > This shouldn't be necessary.  If a subdev constructor fails, and
> > > returns a pointer, the core will call the destructor to clean things
> > > up.
> > >
> >
> > I'm not familiar with the behavior of the caller of gm20b_clk_new().
> > If the subdev constructor fails, the core will check the pointer
> > (here is "pclk"), then it's ok and there is no bug (Do you mean
> > this?). If the core executes error handling code only according to
> > the error code, there may be a memory leak bug (the caller cannot
> > know if -ENOMEM comes from the failure of kzalloc or gk20a_clk_ctor).
> > If the core always calls the destructor as long as the constructor
> > fails (even if the kzalloc fails), we may have a double free bug.
> >
> > Would you like to give a more detailed explanation about the behavior
> > of the core?
> If there's *any* error, it'll check the pointer, if it's non-NULL,
> it'll call the destructor.  If kzalloc() fails, the pointer will be
> NULL, there's no double-free bug.  *every* subdev is written this way
> to avoid duplicating cleanup logic.
Actually, gm20b_clk_new_speedo0() may have a bug here if kzalloc()
fails as it doesn't overwrite the previous pointer from
gm20b_clk_new().  That whole ctor() sequence is written a little
strangely.

>
> Ben.
> >
> > Regards,
> > Dinghao
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
