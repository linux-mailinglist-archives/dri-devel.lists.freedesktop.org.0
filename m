Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B743455382
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 04:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDDB6E52F;
	Thu, 18 Nov 2021 03:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCF96E52F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 03:41:38 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id i6so10698936uae.6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 19:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nM+ilNHr8Jh1IA59axtY4h7kpnXK6OLprg2Adk0fxuk=;
 b=P7JhcxD/dpomFqjv4CZPSkgHolofBTNTsbMJVYTTd+W3uJ7JN67a1MXFC6pQyzdUSg
 YiQVt5z1Lpykku+daRkbwn/b+6Sh2wn6ARjjTA5jZtwLsV8uKWvO0EHOt58WbvrQkhVb
 BJtZeRhGRUFf9+T3p+1RoifADytk8r+3epb1ShAZIyYGMs3xVA8wE9zqUJ+XdrrYqyOc
 vEZE46emMVg+HA5we5GQmlINhRw3Uk9TS3/ZpDiCuy53o4iuNMmtX/4Vxg+PACdCpvn5
 irJG6iy6OP5fq9tt/UG9X2GFXTonVWUA+DpNWjTBjjpe+FH3kIhpIP4p2MyvDSMgBXNI
 69cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nM+ilNHr8Jh1IA59axtY4h7kpnXK6OLprg2Adk0fxuk=;
 b=OIv4Bo1Ln4ywh3lYsw+CHQSr4kBDtzr6PVI/+RydMC3xnA24NRWqwVvGS8aj66rkTG
 JQgt15/QEfWQ2Ia7qL8Fxj357oJ7U04tIKAV3CY90ynXG3uwWdwVhA6ZignhuMycTz/d
 szmVMPrLIlKg5wTKCjAWfTGZKH0MjlG0ZElVGEiEV2A/QqVpsGlEfarmrLRLAjUWLiAb
 sy9iFWyUUlAzHgy9KQQqtVJMw9b8DGZaitVq2p5jDMLaQkp+MDpmcxIEgoBmR21Jv/gm
 6fZvFvtoqHP3NiPpaBlK5EI74YJ7aSmXP8HoAMpQ0Tze22XkdPNbCrt7omViNycZnTTB
 HBqw==
X-Gm-Message-State: AOAM530vHQaOKRPbUfA0qkilld1kiNBemArVCuZs1bs5MS3R6zc+SJwd
 Sg3TBv7iq3gMqe39yXaZakzRCMRU+8Yi/MU57RU=
X-Google-Smtp-Source: ABdhPJzO9OXrSNbqAdTzWGxHcWIrsHLRKhgAbR6ZltlK9edEI/DVjoM7gtflR9FVvK/T9x+Kvc/C+z4Vh5+FYgjgWmI=
X-Received: by 2002:a67:ca92:: with SMTP id a18mr76696187vsl.11.1637206897834; 
 Wed, 17 Nov 2021 19:41:37 -0800 (PST)
MIME-Version: 1.0
References: <YZARol5A5hS+5a5m@gineta.localdomain>
 <YZAikieq4bwrJ58c@ravnborg.org>
 <YZFIvfY1j0f3pVQt@gineta.localdomain> <87fsrx3eed.fsf@intel.com>
 <YZK3nPgQRYl8ys8t@gineta.localdomain>
In-Reply-To: <YZK3nPgQRYl8ys8t@gineta.localdomain>
From: jim.cromie@gmail.com
Date: Wed, 17 Nov 2021 20:41:11 -0700
Message-ID: <CAJfuBxxC6Ak8omRw-HJOZX=819kpWFkJssof+rFK-d0wos4E-A@mail.gmail.com>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
To: Claudio Suarez <cssk@net-c.es>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 12:40 PM Claudio Suarez <cssk@net-c.es> wrote:
>
> On Mon, Nov 15, 2021 at 12:24:26PM +0200, Jani Nikula wrote:
> > On Sun, 14 Nov 2021, Claudio Suarez <cssk@net-c.es> wrote:
> > > On Sat, Nov 13, 2021 at 09:39:46PM +0100, Sam Ravnborg wrote:
> > >> Hi Claudio,
> > >>
> > >> On Sat, Nov 13, 2021 at 08:27:30PM +0100, Claudio Suarez wrote:
> > >> > The prefered way to log connectors is [CONNECTOR:id:name]. Change =
it in
> > >> > drm core programs.
> > >> >
> > >> > Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.c=
om>
> > >> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> > >>
> > >> While touching all these logging calls, could you convernt them to t=
he
> > >> newer drm_dbg_kms variants?
> > >> DRM_DEBUG_* are all deprecated.
> > >>
> > >
> > > Yes, I can, but it is recommended to do it in a different patch:
> > >
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l#separate-your-changes
> > >
> > > C&P:
> > > "Separate your changes
> > > Separate each logical change into a separate patch.
> > > For example, if your changes include both bug fixes and performance e=
nhancements..."
> > >
> > >
> > > I will study and send a new separate patch with your suggestion.
> >
> > I feel these logging changes are the types of changes where I'd err on
> > the side of fewer patches than strictly following the above guidelines.
>
> To size the problem:
> - there are about 3434 references to DRM_DEBUG_* in all the drm code, all=
 drivers.
> - there are 413 references to DRM_DEBUG_* in the drm core code, only 66 o=
f
>    them are related to connectors.
> - there are 62 references to DRM_ERR* and 7 references to DRM_INFO in
>    the drm core programs.
>
> I meant I can make two patches:
>  1 - this one with the change to CONNECTOR:id:name (29 changes)

Is there a "committee" that makes or coordinates these log-facing changes ?

The reason I ask is that Ive proposed that the DRM_UT_<Categories>
be replaced by a set of prefix strings; "drm:core:"  "drm:kms:" etc.

If the DRM_DEBUG_* etc api were converted to use pr_debug,
then dyndbg could optimize away the drm_debug_enabled() overheads.
dyndbg would enable those classes of drm-debug callsites using

  #> echo module drm format drm:kms: > /proc/dyndbg/control

the patchset includes a macro to declare a bit-field to implement drm.debug

https://patchwork.freedesktop.org/series/96328/


how would one (hope to) coordinate changes like this ?
