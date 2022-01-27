Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307AF49DF7F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDD610EE6D;
	Thu, 27 Jan 2022 10:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B192D10EE6D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:33:10 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id s185so5037651oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 02:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M9lbSU/ybc6OppgRIX8ZBQPJXb4PzkNkIkqyzEe4vsM=;
 b=h5X8KiOAwvCCoeask1zcBMENoSVPTMzB0G9oA/mLHo88nDVixWpSb7px6ea/B1fPEL
 PkvItn1CwvuTQktdczAAqHeDGBXOYOfOrLz2U+mxe7iuVSUwVTaAEcOAqnvnrVcvfqS1
 h5tS2oE1tTYgRY7YfjUQIijdf9VNx0qvTN4IJLLVTFntzU7jOJfQDSa01XLgSnH3EvZ3
 pEmGFTmgQZT7p4xg7+zEOjpe66HJFk76oAeJhm0Gi1hrITnqHwkuyechpuEh0xvKNaac
 3mMOk3jpmNiwzprGnlDdUxUkeGeterETUL3Z6t7fc3PHj58yCj3ZowkQVhwGMfoI1SQt
 b/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9lbSU/ybc6OppgRIX8ZBQPJXb4PzkNkIkqyzEe4vsM=;
 b=EkPrctOx65cvaXIVFehHxGrU6mRi6XukBprah3U1dKtQpi2B+aT7Lttg6+FuKoyQav
 YSdYOrUamWlDn+oyImmaOo6S7xx56P0fjL4s6ssUSOzbZDf9SusbtvucM3xu1yq1VgFK
 axV9L6Dzt+6ICrz2Gn1ndUieL4f8YkKUvGOYJJUKYD815nD6MTGer7/SV16W1ipKiTzI
 /ZO7h5GOn9ODavjsXNt6LoDgJY3GLlTKk1fyY2fh3v6fDPRGxaP9gNqnIZ4fCsDEbcCy
 nDkT7o/d4Av7yh+wWL1yWbSg5H4v5kC+zhWMkhxl87i2zSLsXKEAE6admjy+NGfvhpZ7
 S8fg==
X-Gm-Message-State: AOAM5310YCUP9zz/ZAw87rIoo/FRqOW+vN3s95ef+pRW5ihgyOosQhWc
 SQHk3T7kkCzPYF9GTgKmX/Ssajl30sMKpbO0x7U/KA==
X-Google-Smtp-Source: ABdhPJy01OZg2SzTN7RAjLIdxIQiBfvVYOOHfj92G4lxP3BuUPFrtmf9Vh+t5p9LhrGQAJTdPvmIkkVRVunGv9b2WW0=
X-Received: by 2002:a05:6808:b10:: with SMTP id
 s16mr1773942oij.307.1643279589694; 
 Thu, 27 Jan 2022 02:33:09 -0800 (PST)
MIME-Version: 1.0
References: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
 <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
 <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
 <20220127062945.GC1951@kadam>
In-Reply-To: <20220127062945.GC1951@kadam>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 27 Jan 2022 11:32:58 +0100
Message-ID: <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 at 07:30, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Jan 26, 2022 at 11:31:02PM +0100, Daniel Vetter wrote:
> > dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > The other advantage of staging is the I don't think syzbot enables it.
> > > I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> > > get him to disable FBDEV.  :P
> > >
> > > The memory corruption in fbdev was a real headache for everyone because
> > > the stack traces ended up all over the kernel.
> >
> > Uh Dmitry disabled all of FBDEV?
>
> No that's the opposite of what I meant.  STAGING is disabled in syzbot
> and FBDEV is enabled.

Is there still any problem with syzbot config?
syzbot configs are stored here:
https://github.com/google/syzkaller/tree/master/dashboard/config/linux
