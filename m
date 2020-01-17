Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90370141268
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 21:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0596F913;
	Fri, 17 Jan 2020 20:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97EB6E040
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 20:43:54 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t2so22341636ilq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Bedva7uR9RCxWnglqLnOetZ7iPOlTbuJ7vu8I/S3FI=;
 b=B0d5YRbWLVMYdXdrXgUgamVBrvj9IQb0JlhV/eIhDfFAddKa/n1TwR1/ASeYIROtCb
 NtdDLnJmWH4BP8iQ+2tW8qMvjOhYcsNWzqPHrigsBUrpEfjXA6ATv/OKtr6yR0xb9ifF
 3tXAllbEjk5sTldU6B+Km/1pQi5s2qKa0NmZ4mra7ieRwTwp+2olTluhQ2N6ULRztoUv
 GkXVxWc60OTSECDFjQ7d6PE6aXYoa8Y5/0d2EVsR8OUg/FDqzf8jieCRwcPLr/IIFtrz
 Q0FmleFHlai1mx8uIdRHZ24/Il5cslf6kD+YxzfcwY+7GVkcmrg4cEibsIo6z4lgAQRM
 U51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Bedva7uR9RCxWnglqLnOetZ7iPOlTbuJ7vu8I/S3FI=;
 b=YpPerGDZYvX0Ua/cA2SDhmzCRgYYam+j5MO/PuViEfuWePtj66Y2BZfZzfaOTDuzOn
 qKDhvcXGSPq2yTsNYU025t6hPPcCF1yVrabC7EOgQUyOiMEJjH7hn6nr8vH4RDKuwPCw
 0e/5Bcq6LI0wCkaLtPIP62yzGdHd42Q9ax7lzfnQXEvUOpWJ3dekMdTg3o5xoN/dNQIG
 mQp/t3UmJWbzDtzb2Lsaz9EXW4zo3yhQy2CLGaGtTniSAc9UORS4Ic0h9eIQrdYlIDcs
 BKcMJg3kJzHZzqAA2a8X6HgT2qdTr0bo06m7yTjV3EQgoemEzNWdBiUkRMuhu1OpCkP3
 DNGg==
X-Gm-Message-State: APjAAAUaduftasdyxf4u3QzyuQgZADkjmpz1b8IQwBd+SBdxSZx29Sy6
 kQghav14ilV0hxtjRASL4ePzYdtFCa5YVLiAuwL/Yg==
X-Google-Smtp-Source: APXvYqzvNMYw6bQh4ZpYpE3e0JCVyRjqeCJDQOiElcrPWk6yW5BITe9gYwxXa8hsS7KDL/Jw3vVatm7410trYoNTVUg=
X-Received: by 2002:a05:6e02:102c:: with SMTP id
 o12mr319100ilj.165.1579293834244; 
 Fri, 17 Jan 2020 12:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20191205090043.7580-1-Wayne.Lin@amd.com>
 <a6c4db964da7e00a6069d40abcb3aa887ef5522b.camel@redhat.com>
 <ec3e020798d99ce638c05b0f3eb00ebf53c3bd7c.camel@redhat.com>
 <DM6PR12MB41371AC4B0EC24E84AB0C84DFC580@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQK+pS40SQibFuirjLAmjmy8NbOcXWvNsFP8PanS6dEcXWw@mail.gmail.com>
 <31d9eabe57a25ff8f4df22e645494d57715cdc0b.camel@redhat.com>
In-Reply-To: <31d9eabe57a25ff8f4df22e645494d57715cdc0b.camel@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 17 Jan 2020 15:43:17 -0500
Message-ID: <CAMavQK+pOtQ62mp4DSRDW7nHDz4doW3LA5AV1NML-wFa3s3cQA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
To: Lyude Paul <lyude@redhat.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 3:27 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Fri, 2020-01-17 at 11:19 -0500, Sean Paul wrote:
> > On Mon, Dec 9, 2019 at 12:56 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Lyude Paul <lyude@redhat.com>
> > > > Sent: Saturday, December 7, 2019 3:57 AM
> > > > To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > > > amd-gfx@lists.freedesktop.org
> > > > Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry
> > > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>;
> > > > stable@vger.kernel.org
> > > > Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology
> > > > mgr
> > > >
> > > > On Fri, 2019-12-06 at 14:24 -0500, Lyude Paul wrote:
> > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > >
> > > > > I'll go ahead and push this to drm-misc-next-fixes right now, thanks!
> > > >
> > > > Whoops-meant to say drm-misc-next here, anyway, pushed!
> > > Thanks for your time!
> > >
> >
> > I'm getting the following warning on unplug with this patch:
> >

\snip

>
> I think I've got a better fix for this that should avoid that problem, I'll
> write up a patch and send it out in a bit

Thanks Lyude! Should we revert this patch for the time being?

> >
> --
> Cheers,
>         Lyude Paul
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
