Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F12CD3F9E7E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 20:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54646E9A2;
	Fri, 27 Aug 2021 18:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FF46E99A;
 Fri, 27 Aug 2021 18:05:06 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id t4so5231963vsm.5;
 Fri, 27 Aug 2021 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88JiBN68KFkPvgUKvvgM6auDxOEjKddEpXMvH74tSU0=;
 b=OlwWwQfPg4x+JJlvPNh300Bq1LWQakwQ25UjGQSFu+e/ONGVka7NnKHJa+lgNw1pXV
 O/VaBhbQV0p5s2/S3HszX9pzR0SadV3bqBaL/0a48gJ9IGvbaB4+SIEcxTiCHR7KQJ8B
 J1a5QBQJPr4qWh90Oj3DuALxdosTczcnDdni2cSNTkI8cSuqR8wklMDBXc8ldGdEK46o
 0zcdpFqpN0s/xEFW3FLjXWWA1ZwBWL+8GLjzKkkgYnRZh7SCSIlTLkDqH2XmtErs4aPk
 1rqZ/YjPwLsXASog5KOY4AHNWfaWbxESg1O/qpwsb3e0lfivzJjauzD88S0GagWg5pQz
 pVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88JiBN68KFkPvgUKvvgM6auDxOEjKddEpXMvH74tSU0=;
 b=HZ5nwJ+TfaN1KFaxclzph4OsR4Ac4WJ+aXTexK3/mFEWC0hTHMDmX/PmX4IbhL/Wud
 htPomGH0Z9Sh7yTsqhhAS3+iGBAmJnG0tc1chHc54Q7vU1y74EtmgWBOkhYCLZeGCOMp
 kudfJWOiy9PC/2N7GTGzFCLVWJB53FvB0GswENKL5p2kolhhtBHTWVcljJbf/mWzIxww
 TdTz6nyEuBD5sPVAbhZkqV+0HamwQaLKMMyuRcAQmCEhsnFzcqaf5a5zbyZlcI7SAc/n
 EujE3XL3dLH3n8lbB9dUzE9wIfOx93C93vE4U/6WqczxBWoDEDLgyhIFwTGdoKo3znDq
 +A+g==
X-Gm-Message-State: AOAM531QQwzkzafoLtctztBdf27KkcF0gSQd3fDzSx3cE7M+NzNmRgG+
 t3O3Pkqr1RoRwbS+fI61Jdw9EvgeqingDzxUll8=
X-Google-Smtp-Source: ABdhPJzGaciYM1/s8m8/B975vUfIbvCRz+B6Bp+lNCm9eTPHyZtDPjmUuOFML4/BZkts2fosFQFBO2nGMugI2IF9+i8=
X-Received: by 2002:a67:c789:: with SMTP id t9mr8673774vsk.60.1630087505693;
 Fri, 27 Aug 2021 11:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
 <20210822222009.2035788-2-jim.cromie@gmail.com>
 <c83b0814-b8e1-91f5-ba28-f9db3f363ce1@akamai.com>
In-Reply-To: <c83b0814-b8e1-91f5-ba28-f9db3f363ce1@akamai.com>
From: jim.cromie@gmail.com
Date: Fri, 27 Aug 2021 12:04:39 -0600
Message-ID: <CAJfuBxz83LUFqPmApV22d0R1pHxFH4ZhObi7PgQeQ75w4zvb7A@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] moduleparam: add data member to struct
 kernel_param
To: Jason Baron <jbaron@akamai.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sean Paul <seanpaul@chromium.org>, 
 Jessica Yu <jeyu@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 25, 2021 at 11:13 AM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 8/22/21 6:19 PM, Jim Cromie wrote:
> > Add a const void* data member to the struct, to allow attaching
> > private data that will be used soon by a setter method (via kp->data)
> > to perform more elaborate actions.
> >
> > To attach the data at compile time, add new macros:
> >

>
> I wonder if kp->arg can just be used for all this and avoid this patch entirely?
>
> define something like:
>
> struct dd_bitmap_param {
>         int bitmap;
>         struct dyndbg_bitdesc *bitmap_arr;
> };
>
> and then just pass a pointer to it as 'arg' for module_param_cb? And then in
> the get/set callbacks you can use kp->bitmap and kp->bitmap_arr.
>

yes, thanks, this is working out nicely.
I think I was thrown off by the arg name,
if it had been called data, it would have slapped me

> Thanks,
>
> -Jason
>
