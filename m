Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC47223529
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E576E0EA;
	Fri, 17 Jul 2020 07:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E236B6E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 07:07:08 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 12so7251238oir.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CPnX6ZZ4pxkd9TAEZP+nlom1WGP6ShX2uzkhMxmoCgs=;
 b=Z0/isLNmTG17gmG6L59e06uZwFWTkG8667jfHIAozBpa6HGgY8MTxvN87ov9noGknf
 ROx8mOGckDSd85/k3criF7VUrhME58WXh95iPmWNWTP5goFt+mjfIpABBJN15TPoCp+Z
 cs3/jV1pYvFMgfXabtoWtWc1XCsFSstQFrnsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPnX6ZZ4pxkd9TAEZP+nlom1WGP6ShX2uzkhMxmoCgs=;
 b=cFO5nhrmozr62jkjUX6Si6ty2/IVeu60l0FQdIdBYS1V8StYAUh+YDtuw/NLwSf/fS
 WNclhlxYSiiPBRtj7OCcfAVkZRbIfLu/k3Y6X2fPmy+6xwH9KEEF0mHxfJZMlmqwCwMh
 bqvCGj8TIgE0dqwl1L2O7tHwhQEikdiQres+CUY1AYqLv66NmrXQAFqij/cd5QkO7uWx
 S+TOBSQI1UhEE4R2oLQZv00X/xxixBe5KquPWEkgOZ9iHB0zNnwsVCVzYVpyv+jU0X/3
 8xhaGmUKHu8d3TPSW19AVodChVmTvIE7i6RbpvlTZDB6TCkjBPDye5s4mIZ3ZadiccDt
 MorA==
X-Gm-Message-State: AOAM531fcbY53L/B7kubUzM4vvBIBhs0OkvMR1BbNkd/qrbAs1vnN4nT
 3HJgtygsk2dONUcnJyvPRxbngAftLSSYiiHSKhxwZQ==
X-Google-Smtp-Source: ABdhPJxQMEGaDN2TI7WZI9cZeuv/fedq3mzV9H5A703+/MWxi0v21K2uuqaxm5IjyKaaYDVrylh/NF7mAhXcgLjbVPU=
X-Received: by 2002:aca:da03:: with SMTP id r3mr6602701oig.14.1594969628090;
 Fri, 17 Jul 2020 00:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200716090333.13334-1-miaoqinglang@huawei.com>
 <20200717064017.GA76612@jamwan02-TSP300>
In-Reply-To: <20200717064017.GA76612@jamwan02-TSP300>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 17 Jul 2020 09:06:57 +0200
Message-ID: <CAKMK7uEpmhKok9Q3Rrg0v=1p7pv-wpV0Y3-k9GVav+Ad5Z4AkQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
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
Cc: nd <nd@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 8:40 AM james qian wang (Arm Technology China)
<james.qian.wang@arm.com> wrote:
>
> On Thu, Jul 16, 2020 at 05:03:33PM +0800, Qinglang Miao wrote:
> > From: Liu Shixin <liushixin2@huawei.com>
> >
> > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> >
> > Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> > ---
> >  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 13 +------------
> >  1 file changed, 1 insertion(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > index 0246b2e94..4a10e6b9e 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > @@ -41,18 +41,7 @@ static int komeda_register_show(struct seq_file *sf, void *x)
> >       return 0;
> >  }
> >
> > -static int komeda_register_open(struct inode *inode, struct file *filp)
> > -{
> > -     return single_open(filp, komeda_register_show, inode->i_private);
> > -}
> > -
> > -static const struct file_operations komeda_register_fops = {
> > -     .owner          = THIS_MODULE,
> > -     .open           = komeda_register_open,
> > -     .read_iter              = seq_read_iter,
> > -     .llseek         = seq_lseek,
> > -     .release        = single_release,
> > -};
> > +DEFINE_SHOW_ATTRIBUTE(komeda_register);
> >
>
> Hi Shixin & Qinglang
>
> Thanks for your patch.
>
> Reviewed-by: James Qian Wang <james.qian.wang@arm.com>
>
> Since your patch is not for drm-misc-next, so seems better
> to leave it to you to merge it. :)

I do think it's for drm-misc-next, what other tree would it be for?
Some people put -next in their patch tag to differentiate from -fixes,
so maintainers know what to do with the patch. It's also not part of a
series, hence I think this is on you to apply it.

Cheers, Daniel

>
> Thanks
> James
>
> >  #ifdef CONFIG_DEBUG_FS
> >  static void komeda_debugfs_init(struct komeda_dev *mdev)
> > --
> > 2.17.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
