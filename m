Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40521125F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 20:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2966E992;
	Wed,  1 Jul 2020 18:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C19C6E992
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593626934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+dKEqbHhlRxeYOhfkUFykiBQJ/HEgkFXQeXPNBD5nYQ=;
 b=ZHIMW9f221Bq7uLDlUaVbkpjUK+SpO0TvRO4Ig0DthjrfiPKw36ToLil2lXGg6pqWEwxF6
 LLLFRxc7EzBC+Nrh/mpeBIA1PI0w7az3i39IxudEdV0W4HjBREAE/mUu+HB9GBUUqvB3BG
 GRvUPcnOTzngN2R9FBHauwPgnGeoMJg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-lI_eLYCpNAqu4npqXPVx1g-1; Wed, 01 Jul 2020 14:08:43 -0400
X-MC-Unique: lI_eLYCpNAqu4npqXPVx1g-1
Received: by mail-qv1-f70.google.com with SMTP id e6so7594404qva.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 11:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+dKEqbHhlRxeYOhfkUFykiBQJ/HEgkFXQeXPNBD5nYQ=;
 b=rTU8HGSBm2x7yRc5qKbkzQbaQa4Diyss5UF1RfV2acv+Zoyo4liD0BzipGT4Pon04A
 fPyEncu7BpgraH3W/oW2gaLFxiIWWRU0KAQMC7fW82Fuf7VOn0fjXdJRgFPiU3PiZ8e/
 6Ryp6zT8tgI6kpaKnQiDPGqlrcMEPw8ynBNVGaGbXt3UpbLNnpy1e1moHW9L4COEua3E
 1CFKQmVqp3kd2/BKXiGPlUSfhY8BKz++pwhiKzhy6eilqlkd3uNSK4GVlKRb/66V08ol
 Y5a4niI4eC1j0XRNHkdS888lNlAZz9RJtIrCvMlLiSLlQXKaLVzH8JC+uNqXksageu26
 b5Cg==
X-Gm-Message-State: AOAM530bt6Zb+C2xE83tppSz9yBrYDMvaU1YX9NUgDzeODg7SZqADzs/
 TN63EiKm+9kUDAj7nAhH/IJEYgoEE9mpiM0R2r/hCudHYACK6/Ij/SLdg/bwPDsZGHKnE9vOI5a
 z/GXfSESD7+otdoJuhsTQ72ctvNEMCuLATjf0XNFffHGF
X-Received: by 2002:ac8:23e6:: with SMTP id r35mr6515646qtr.254.1593626923143; 
 Wed, 01 Jul 2020 11:08:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgNG460Sk2KPjKWLlMlaRlQy86WinN8VCktRUOxKvw9UhZDNM8KB8cmjbPousPk8bSbmEo3GHW0YlABLsCmck=
X-Received: by 2002:ac8:23e6:: with SMTP id r35mr6515608qtr.254.1593626922762; 
 Wed, 01 Jul 2020 11:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <CACO55tvT0fOMai7k7oAP1TL42YAuMwJocxk2seNgjYibs+h5oA@mail.gmail.com>
 <11e5ee1d-8b5e-2721-091e-ffbf9e1271d1@nvidia.com>
 <CAKMK7uEzoFyW6o1gP6xszWH7fKHrVSR32JLs73KeFfYgD=BHPQ@mail.gmail.com>
 <CACO55tu8z_Rt50QXUr+MBKV_vtxZfVgz8Cfoj2xbinbtTYM3WQ@mail.gmail.com>
 <efaf3c55-e2af-09ec-430e-79064fe43668@nvidia.com>
In-Reply-To: <efaf3c55-e2af-09ec-430e-79064fe43668@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 1 Jul 2020 20:08:31 +0200
Message-ID: <CACO55tvZN=r3MgiF=MMV4L+hw9GXfumEkOBNXt9KwrFoqqKETw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 1, 2020 at 7:37 PM James Jones <jajones@nvidia.com> wrote:
>
> On 7/1/20 10:04 AM, Karol Herbst wrote:
> > On Wed, Jul 1, 2020 at 6:01 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >>
> >> On Wed, Jul 1, 2020 at 5:51 PM James Jones <jajones@nvidia.com> wrote:
> >>>
> >>> On 7/1/20 4:24 AM, Karol Herbst wrote:
> >>>> On Wed, Jul 1, 2020 at 6:45 AM James Jones <jajones@nvidia.com> wrote:
> >>>>>
> >>>>> This implies something is trying to use one of the old
> >>>>> DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifiers with DRM-KMS without
> >>>>> first checking whether it is supported by the kernel.  I had tried to
> >>>>> force an Xorg+Mesa stack without my userspace patches to hit this error
> >>>>> when testing, but must have missed some permutation.  If the stalled
> >>>>> Mesa patches go in, this would stop happening of course, but those were
> >>>>> held up for a long time in review, and are now waiting on me to make
> >>>>> some modifications.
> >>>>>
> >>>>
> >>>> that's completely irrelevant. If a kernel change breaks userspace,
> >>>> it's a kernel bug.
> >>>
> >>> Agreed it is unacceptable to break userspace, but I don't think it's
> >>> irrelevant.  Perhaps the musings on pending userspace patches are.
> >>>
> >>> My intent here was to point out it appears at first glance that
> >>> something isn't behaving as expected in userspace, so fixing this would
> >>> likely require some sort of work-around for broken userspace rather than
> >>> straight-forward fixing of a bug in the kernel logic.  My intent was not
> >>> to shift blame to something besides my code & testing for the
> >>> regression, though I certainly see how it could be interpreted that way.
> >>>
> >>> Regardless, I'm looking in to it.
> >>
> >
> > I assume the MR you were talking about is
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724 ?
>
> Correct.
>
> > I am
> > also aware of the tegra driver being broken on my jetson nano and I am
> > now curious if this MR could fix this bug as well... and sorry for the
> > harsh reply, I was just a annoyed by the fact that "everything
> > modifier related is just breaking things", first tegra and that nobody
> > is looking into fixing it and then apparently the userspace code being
> > quite broken as well :/
> >
> > Anyway, yeah I trust you guys on figuring out the keeping "broken"
> > userspace happy from a kernel side and maybe I can help out with
> > reviewing the mesa bits. I am just wondering if it could help with the
> > tegra situation giving me more reasons to look into it as this would
> > solve other issues I should be working on :)
>
> Not sure if you're claiming this, but if there's Tegra breakage
> attributable to this patch series, I'd love to hear more details there
> as well.  The Tegra patches did have backwards-compat code to handle the
> old modifiers, since Tegra was the only working use case I could find
> for them within the kernel itself.  However, the Tegra kernel patches
> are independent (and haven't even been reviewed yet to my knowledge), so
> Tegra shouldn't be affected at all given it uses TegraDRM rather than
> Nouveau's modesetting driver.
>
> If there are just general existing issues with modifier support on
> Tegra, let's take that to a smaller venue.  I probably won't be as much
> help there, but I can at least try to help get some eyes on it.
>

I am sure that your patches here have nothing to do with it, just
inside mesa since
https://gitlab.freedesktop.org/mesa/mesa/commit/c56fe4118a2dd991ff1b2a532c0f234eddd435e9
it's broken on the jetson nano and because it's so old I am not able
to tell if this is because of some kernel changes or because of the
modifier code inside mesa being slightly broken.

Maybe you have an idea, but Thierry knows about the issue, but I think
he never was able to reproduce it on any system.

> Thanks,
> -James
>
> >> If we do need to have a kernel workaround I'm happy to help out, I've
> >> done a bunch of these and occasionally it's good to get rather
> >> creative :-)
> >>
> >> Ideally we'd also push a minimal fix in userspace to all stable
> >> branches and make sure distros upgrade (might need releases if some
> >> distro is stuck on old horrors), so that we don't have to keep the
> >> hack in place for 10+ years or so. Definitely if the hack amounts to
> >> disabling modifiers on nouveau, that would be kinda sad.
> >> -Daniel
> >>
> >>>
> >>> Thanks,
> >>> -James
> >>>
> >>>>> Are you using the modesetting driver in X?  If so, with glamor I
> >>>>> presume?  What version of Mesa?  Any distro patches?  Any non-default
> >>>>> xorg.conf options that would affect modesetting, your X driver if it
> >>>>> isn't modesetting, or glamour?
> >>>>>
> >>>>> Thanks,
> >>>>> -James
> >>>>>
> >>>>> On 6/30/20 4:08 PM, Kirill A. Shutemov wrote:
> >>>>>> On Tue, Jun 02, 2020 at 04:06:32PM +1000, Dave Airlie wrote:
> >>>>>>> James Jones (4):
> >>>>>> ...
> >>>>>>>          drm/nouveau/kms: Support NVIDIA format modifiers
> >>>>>>
> >>>>>> This commit is the first one that breaks Xorg startup for my setup:
> >>>>>> GTX 1080 + Dell UP2414Q (4K DP MST monitor).
> >>>>>>
> >>>>>> I believe this is the crucial part of dmesg (full dmesg is attached):
> >>>>>>
> >>>>>> [   29.997140] [drm:nouveau_framebuffer_new] Unsupported modifier: 0x300000000000014
> >>>>>> [   29.997143] [drm:drm_internal_framebuffer_create] could not create framebuffer
> >>>>>> [   29.997145] [drm:drm_ioctl] pid=3393, ret = -22
> >>>>>>
> >>>>>> Any suggestions?
> >>>>>>
> >>>>> _______________________________________________
> >>>>> dri-devel mailing list
> >>>>> dri-devel@lists.freedesktop.org
> >>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>>>>
> >>>>
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>>>
> >>
> >>
> >>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> >>
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
