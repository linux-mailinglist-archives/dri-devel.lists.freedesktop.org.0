Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D01D0B8F
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F33E6E9CC;
	Wed, 13 May 2020 09:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D19C890E5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 17:38:50 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d21so6951827ljg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ebjOYMaJ7M7jwUsklPOZCI8Jw5RKKj0xTEHhhpqxFeY=;
 b=wL/JSsWvVethBa2RSUWzhxiibVY/AsKcKJw2HL8qE4PUubrt8MxgDn17BbbhCQfvKH
 sAsI9Pr3kafMWoL20GqgxMGTfVB4dqQcfYsafs0deVrHKMlO3ugjjJkus/G9W3bce+Cm
 enxanYzmfiyMG4g/TD6kCVt5f5KnSHVVVOf1X+TTl9b1qX67ec+wzL1QXiux5O1iu8PN
 ldCdOI1i85elav+vbl0/nFYfhOxFKd6rq1aRGnBdYpTumcdRJLNY3azN4v1/a1nEtCg0
 Y1B2JH3idXntk2tbmdxe1aogzPyYJaSSrdbrePvC/zuxzZjLGmkVZuCZLHVwSpZ/JQjf
 7z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ebjOYMaJ7M7jwUsklPOZCI8Jw5RKKj0xTEHhhpqxFeY=;
 b=dsxMby91C9fNHVtE14IJj3usqjENnqYy7AhbI+d6HxdaPrEZGL2GN+NxzJb4ZgTOUX
 JlqLYS1jQgh1oUJ5iP5YJB+ltlrl2Z9TcknCqkRhzuPeW7TrLxvhvno/hvcJBoIu7uYW
 HBkUTGTfIt+0R5zT64SU4Iu/c4vXOY72Rk3W/aX9hl2f1yBAHeWDiaWltD+L8uFluqjW
 KSpnnSlTp1LEUms0qC1g6DrCl/OtwQ6Z2OKBb2kIUngdQ8zrlerapSBRtCPrwDjpS4yk
 KiolpCf1IhntziM2P38V5D40Pk+DEVD7YmKPqqw/hCvSAwhKIMpZGW9H2aO3BBnrUjw8
 MS9w==
X-Gm-Message-State: AOAM530mblM7OYGh5Q0TpdN4je1nWGy16lKKu6xHGIo++C80muH03ouz
 4a3Hmox6c9/Fb9eomWnWzjg0FYByg3lbGh1WnNmyGA==
X-Google-Smtp-Source: ABdhPJxrzkKUsHKMGkr84dn3JzuEhBp99bszeqe0BVKhGPv9mLow/lhTmZCD3pjfjA/e4Lz62OfEIkE6dHWai3ud7YE=
X-Received: by 2002:a2e:8e8a:: with SMTP id z10mr13936569ljk.107.1589305128088; 
 Tue, 12 May 2020 10:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
 <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
 <20200512172032.185de3d7@eldfell.localdomain>
 <a415bd37-ae23-9cd9-dff3-702824685a60@redhat.com>
In-Reply-To: <a415bd37-ae23-9cd9-dff3-702824685a60@redhat.com>
From: Rajat Jain <rajatja@google.com>
Date: Tue, 12 May 2020 10:38:11 -0700
Message-ID: <CACK8Z6FAv-6f-eSKdM+poT7usGD4GgXSDEy3jpooOLs5=CH_BQ@mail.gmail.com>
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: Sonny.Quintanilla@dell.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@dell.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jared Dominguez <jaredz@redhat.com>, Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 9:09 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/12/20 4:20 PM, Pekka Paalanen wrote:
> > On Tue, 12 May 2020 10:18:31 +0200
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >
> >> Hi,
> >>
> >> On 5/11/20 9:55 PM, Rajat Jain wrote:
> >>> Hi Hans,
> >>>
> >>> On Mon, May 11, 2020 at 10:47 AM Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> >>>
> >>>      Hi All,
> >>>
> >>>      This RFC takes Rajat's earlier patch for adding privacy-screen properties
> >>>      infra to drm_connector.c and then adds the results of the discussion from
> >>>      the "RFC: Drm-connector properties managed by another driver / privacy
> >>>      screen support" mail thread on top, hence the v2.
> >>>
> >>>
> >>> Thank you so much for doing this. I was following the said discussion and eventually it became quite complex for me to understand and follow :-)
> >>
> >> I hope the new doc text makes things clear again?

Yes it does.

> >>
> >>
> >>>      The most important thing here is big kernel-doc comment which gets added in
> >>>      the first patch-chunk modifying drm_connector.c, this summarizes, or at
> >>>      least tries to summarize, the conclusions of our previous discussion on
> >>>      the userspace API and lays down the ground rules for how the 2 new
> >>>      "privacy-screen sw-state" and  "privacy-screen hw-state" properties are
> >>>      to be used both from the driver side as well as from the userspace side.
> >>>
> >>>      Other then that this modifies Rajat's patch to add 2 properties instead
> >>>      of one, without much other changes.
> >>>
> >>>      Rajat, perhaps you can do a new version of your patch-set integration /
> >>>      using this version of the properties and then if everyone is ok with
> >>>      the proposed userspace API Jani can hopefully merge the whole set
> >>>      through the i915 tree sometime during the 5.9 cycle.
> >>>
> >>>
> >>> SGTM. I have actually moved to working on something else now, so I will most likely wait for this patch to get merged, before rebasing my other / remaining patches on top of that.
> >>
> >> We have the rule that code like this will not be merged until it has at least
> >> one in kernel user. I plan to eventually use this too, but that is still
> >> a while away as I first need to write a lcdshadow subsystem which the
> >> thinkpad_acpi code can then use to register a lcdshadow device; and when
> >> that all is in place, then I can hook it up on the drm code.

OK. In that case, sure, I will respin my patchset with this patch once
we have some more comments from Jani et al, and thus a newer iteration
of this patch.

> >
> > Hi,
> >
> > I believe this falls under "new UAPI" rules, because this is adding new
> > KMS properties. Hence an in-kernel user is not enough:
> >
> > https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements

The chrome browser currently uses the API exposed by my (previous)
patchset to control privacy screen.
https://source.chromium.org/chromium/chromium/src/+/master:ui/ozone/platform/drm/common/drm_util.cc;l=180?q=%22privacy-screen%22%20-f:third_party%2Fkernel%2Fv&originalUrl=https:%2F%2Fcs.chromium.org%2F

I know this doesn't help directly, but just to say that there are
users waiting to use an API that we release. If these changes are
accepted, I expect to see the change in browser again, to match the
new API,  although that will be not until we decide to uprev our
kernel again.

Thanks,

Rajat

>
> Hmm, I believe that that mostly applies to new DRI (ioclt) interfaces for
> submitting rendering commands to new GPUs and other complex new APIs and
> not necessarily to introducing new properties.    Also note that all
> properties are exported under X through Xrandr, at least reading them,
> not sure about setting them.
>
> Anyways I do plan to write some mutter code to test my lcdshadow subsys <->
> DRM driver integration when that is all more then just vaporware. But I
> would prefer for Rajat's series to land before that so that I can build
> on top of it.
>
> Regards,
>
> Hans
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
