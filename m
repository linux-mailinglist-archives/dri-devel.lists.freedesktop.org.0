Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5241D4653
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247EE6EBFC;
	Fri, 15 May 2020 06:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0A96EA68
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 18:29:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d21so648492ljg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X86OFMEI3/R4f7xr+sTnRSFdQvnKcDJuqB1kpefRERY=;
 b=bJk+WQZndLpoXQlCiTVBAmOgjVVfJ0YRga8HsdDBxUu10/p/Nh57t0BlBjYdvNDP97
 qclH/Y3kPK6s55oXBJzCTsyRHAVtIggjBudCCRhojCyojfKcJG2DUpN87FdyV+rv1R2r
 /V8w9ZbGYmxwfZVSy5ZeTexcYBozm9HBhjrCBxZe7AMBt9va0m2kIvnkmorPTWvmsauO
 3NOSP2GN23H6aInxPWtesrRKrbJ5D67VYrhAueG48Xw8CqZKXypepe11I0MuDBl/4EOZ
 bcbvarAMt6ZaNVqUJv8rr4vk8IDgdTlqkxfw91IQXMGKleGRqDZlLyUl8zt7Iv/Cp/Db
 eCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X86OFMEI3/R4f7xr+sTnRSFdQvnKcDJuqB1kpefRERY=;
 b=L83++Nl42R5tDygiboGH1/GUMi7hVeDUvjbeGOvRVAh7WdBHI/u79ElYZpxrBN7miT
 RgutcQmLbipjiAn0kUhxkicaitFYcQvMpfvAq6iGdYBMI09TOHySVWEn4mHU6C7B8DW9
 2LHnXrO9Ur8O/XSp/PK4yezNwi8wIOBsYLgitK8rcO9S1d1jWkcbKuhUFwWZFuY8gwR9
 b6OQOs5ssSU6PcIUAubXKgd1n0YHB8QaIpWpPbEQuPE/snWC+iPAryr5SSC4RQGRCCvx
 M4lC7HT2p3xjouMo0uED0UEdu4Npyy6NpotUd64YiyuzD77DOg7pp+YzGCLGE7Lb2dJY
 dUNQ==
X-Gm-Message-State: AOAM532OWWqd4uwl5rF5I4cN2WoRgS9H1wXlIAOAtOoQKeuzb3+4WWcR
 0fH8Qk+nWCJBJ8oLK8ssvsCKVj/v3jxkLDgysriVGg==
X-Google-Smtp-Source: ABdhPJwc3E+JACtZHkYwThiV8q7yrecMQDwO+e0PJugEcSL4hCRlobDIXcH//+rzNi8ZjTUM2Bcp3LxYXcGr/74Jkuw=
X-Received: by 2002:a2e:7a08:: with SMTP id v8mr247924ljc.66.1589394555317;
 Wed, 13 May 2020 11:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200511174724.21512-1-hdegoede@redhat.com>
 <CACK8Z6HG3sM-4cBYurHCba1jopk_5SVBd7KULEvOR27eKfxpyg@mail.gmail.com>
 <8f273c2a-2544-10fa-02f3-832cb1f398ad@redhat.com>
 <20200512172032.185de3d7@eldfell.localdomain>
 <a415bd37-ae23-9cd9-dff3-702824685a60@redhat.com>
 <20200513104943.34d92639@eldfell.localdomain>
In-Reply-To: <20200513104943.34d92639@eldfell.localdomain>
From: Rajat Jain <rajatja@google.com>
Date: Wed, 13 May 2020 11:28:38 -0700
Message-ID: <CACK8Z6FP-5BzhW6_wf=XrdN=9k9c4U9MaPBNSe7g5p5zCingWA@mail.gmail.com>
Subject: Re: [RFC v2 0/1] drm/connector: Add support for privacy-screen
 properties
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
 Hans de Goede <hdegoede@redhat.com>, Jared Dominguez <jaredz@redhat.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 12:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 12 May 2020 18:09:15 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
> > Hi,
> >
> > On 5/12/20 4:20 PM, Pekka Paalanen wrote:
> > > On Tue, 12 May 2020 10:18:31 +0200
> > > Hans de Goede <hdegoede@redhat.com> wrote:
> > >
> > >> Hi,
> > >>
> > >> On 5/11/20 9:55 PM, Rajat Jain wrote:
> > >>> Hi Hans,
> > >>>
> > >>> On Mon, May 11, 2020 at 10:47 AM Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> > >>>
> > >>>      Hi All,
> > >>>
> > >>>      This RFC takes Rajat's earlier patch for adding privacy-screen properties
> > >>>      infra to drm_connector.c and then adds the results of the discussion from
> > >>>      the "RFC: Drm-connector properties managed by another driver / privacy
> > >>>      screen support" mail thread on top, hence the v2.
> > >>>
> > >>>
> > >>> Thank you so much for doing this. I was following the said discussion and eventually it became quite complex for me to understand and follow :-)
> > >>
> > >> I hope the new doc text makes things clear again?
> > >>
> > >>
> > >>>      The most important thing here is big kernel-doc comment which gets added in
> > >>>      the first patch-chunk modifying drm_connector.c, this summarizes, or at
> > >>>      least tries to summarize, the conclusions of our previous discussion on
> > >>>      the userspace API and lays down the ground rules for how the 2 new
> > >>>      "privacy-screen sw-state" and  "privacy-screen hw-state" properties are
> > >>>      to be used both from the driver side as well as from the userspace side.
> > >>>
> > >>>      Other then that this modifies Rajat's patch to add 2 properties instead
> > >>>      of one, without much other changes.
> > >>>
> > >>>      Rajat, perhaps you can do a new version of your patch-set integration /
> > >>>      using this version of the properties and then if everyone is ok with
> > >>>      the proposed userspace API Jani can hopefully merge the whole set
> > >>>      through the i915 tree sometime during the 5.9 cycle.
> > >>>
> > >>>
> > >>> SGTM. I have actually moved to working on something else now, so I will most likely wait for this patch to get merged, before rebasing my other / remaining patches on top of that.
> > >>
> > >> We have the rule that code like this will not be merged until it has at least
> > >> one in kernel user. I plan to eventually use this too, but that is still
> > >> a while away as I first need to write a lcdshadow subsystem which the
> > >> thinkpad_acpi code can then use to register a lcdshadow device; and when
> > >> that all is in place, then I can hook it up on the drm code.
> > >
> > > Hi,
> > >
> > > I believe this falls under "new UAPI" rules, because this is adding new
> > > KMS properties. Hence an in-kernel user is not enough:
> > >
> > > https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements
> >
> > Hmm, I believe that that mostly applies to new DRI (ioclt) interfaces for
> > submitting rendering commands to new GPUs and other complex new APIs and
> > not necessarily to introducing new properties.    Also note that all
> > properties are exported under X through Xrandr, at least reading them,
> > not sure about setting them.
>
> Please check with Daniel Vetter.
>
> My belief is that all new KMS properties that were never exposed by any
> driver before are new UAPI.
>
> My personal opinion is that Xorg/RandR exposing a KMS property does
> *not* count as real userspace *alone*. Simply plumbing a KMS property
> through RandR and then nothing actually using it does not prove
> anything about the property's design or usability.
>
> IMO, if you use Xorg/RandR as your userspace, you also need something
> that uses RandR and really pokes at the new property to prove it's
> viable.
>
> But that's just me.
>
> > Anyways I do plan to write some mutter code to test my lcdshadow subsys <->
> > DRM driver integration when that is all more then just vaporware. But I
> > would prefer for Rajat's series to land before that so that I can build
> > on top of it.
>
> The DRM maintainers make that call.
>
>
> On Tue, 12 May 2020 10:38:11 -0700
> Rajat Jain <rajatja@google.com> wrote:
>
> > The chrome browser currently uses the API exposed by my (previous)
> > patchset to control privacy screen.
> > https://source.chromium.org/chromium/chromium/src/+/master:ui/ozone/platform/drm/common/drm_util.cc;l=180?q=%22privacy-screen%22%20-f:third_party%2Fkernel%2Fv&originalUrl=https:%2F%2Fcs.chromium.org%2F
> >
> > I know this doesn't help directly, but just to say that there are
> > users waiting to use an API that we release. If these changes are
> > accepted, I expect to see the change in browser again, to match the
> > new API,  although that will be not until we decide to uprev our
> > kernel again.
>
> Chromium counts as userspace, I think many new features have landed
> with it as the userspace.
>
> Is that from some development branch, not actually merged or released
> yet? If yes, very good.

No, it's released (in Chromium for chromeOS platforms).

> When you submit kernel patches with new UAPI,
> it would be nice to point to the userspace review discussion where the
> userspace patches have been reviewed and accepted but not merged.

I doubt if that would happen - because they won't do it unless a
feature is available in the kernel they are using. I can definitely
create a public bug about what they need to do though.

Thanks,

Rajat

>
>
> Thanks,
> pq
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
