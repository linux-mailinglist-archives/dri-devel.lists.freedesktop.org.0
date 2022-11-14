Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32F627A0D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 11:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52610E058;
	Mon, 14 Nov 2022 10:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C46610E058;
 Mon, 14 Nov 2022 10:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668420483; x=1699956483;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yOVQIHkuUCyb9yuVJwgc7s85bbeRz6iUd3ajHxZ7HeA=;
 b=OVd6U6H3ndTaEQp9DZJ+v6A5qnztIanD+L+ZXF/vhNLLplT6AYpxh4Ta
 VjMKbZcHtOEZ3QGZ2aXjhuJLFPl5TwUaBkD9YJjy/eE63RKzUiQHE0zry
 b5SYOPSflsVsZyjArF1uch7jtQ51sEyhHHEMlyuvC8HOYGuQXvpzET0ak
 wBvJbQ/xAqiSHvuMT54ljOXEnPg/DsSfgbwATvV4aRdnduku7SeXU0rze
 x75UaOHu0/1cUhmUpraqQCMgXkTpSG3/M9SxEBERf5CcbiB+nUSYmdQGS
 NZV4NKfVxKza7bO2MrZvjG6U3GUlNlbr0LMiWUQey5TWghxdqbcnf5J64 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="295294501"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="295294501"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 02:08:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727466802"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727466802"
Received: from dsmahang-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.240])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 02:07:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Karol Herbst <kherbst@redhat.com>, Kees Cook <keescook@chromium.org>
Subject: Re: Coverity: nouveau_dp_irq(): Null pointer dereferences
In-Reply-To: <CACO55tvaXFyAMiAYmx2DKNj9fNtapThejHkRsvZd_5StYXTy+w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202211100850.7A8DD75@keescook> <87iljl6ehe.fsf@intel.com>
 <202211111110.11B554B@keescook>
 <CACO55tt5KOgDYMEw=spDeoMaYuj2GQOuHU+BEgadr1nQiFOGhw@mail.gmail.com>
 <202211111215.1F421B7E@keescook>
 <CACO55tvaXFyAMiAYmx2DKNj9fNtapThejHkRsvZd_5StYXTy+w@mail.gmail.com>
Date: Mon, 14 Nov 2022 12:07:55 +0200
Message-ID: <87fsel4zno.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Nathan E. Egge" <unlord@xiph.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Nov 2022, Karol Herbst <kherbst@redhat.com> wrote:
> On Fri, Nov 11, 2022 at 9:16 PM Kees Cook <keescook@chromium.org> wrote:
>>
>> On Fri, Nov 11, 2022 at 09:06:54PM +0100, Karol Herbst wrote:
>> > On Fri, Nov 11, 2022 at 8:21 PM Kees Cook <keescook@chromium.org> wrote:
>> > >
>> > > On Fri, Nov 11, 2022 at 11:13:17AM +0200, Jani Nikula wrote:
>> > > > On Thu, 10 Nov 2022, coverity-bot <keescook@chromium.org> wrote:
>> > > > > Hello!
>> > > > >
>> > > > > This is an experimental semi-automated report about issues detected by
>> > > > > Coverity from a scan of next-20221110 as part of the linux-next scan project:
>> > > > > https://scan.coverity.com/projects/linux-next-weekly-scan
>> > > > >
>> > > > > You're getting this email because you were associated with the identified
>> > > > > lines of code (noted below) that were touched by commits:
>> > > > >
>> > > > >   Mon Aug 31 19:10:08 2020 -0400
>> > > > >     a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")
>> > > >
>> > > > Hi Kees, this looks like a good idea, but maybe double check the Cc list
>> > > > generation? I was Cc'd on four mails today that I thought were
>> > > > irrelevant to me.
>> > >
>> > > Hi!
>> > >
>> > > Heh, I was recently asked to _expand_ the CC list. :)
>> > >
>> > > For these last pass of reports, I added a get_maintainers.pl run to the
>> > > identified commit. In this instance, the commit touched:
>> > >
>> > >  drivers/gpu/drm/nouveau/dispnv04/disp.c     |    6 +
>> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  192 ++++++++++++++++++++++--------------------------
>> > >  drivers/gpu/drm/nouveau/nouveau_connector.c |   14 ---
>> > >  drivers/gpu/drm/nouveau/nouveau_display.c   |    2
>> > >  drivers/gpu/drm/nouveau/nouveau_display.h   |    2
>> > >  drivers/gpu/drm/nouveau/nouveau_dp.c        |  132 ++++++++++++++++++++++++++++-----
>> > >  drivers/gpu/drm/nouveau/nouveau_encoder.h   |   33 +++++++-
>> > >  7 files changed, 244 insertions(+), 137 deletions(-)
>> > >
>> > > And the get_maintainers.pl rationale was:
>> > >
>> > > Ben Skeggs <bskeggs@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:1/1=100%,commit_signer:6/16=38%,authored:4/16=25%,added_lines:23/124=19%,removed_lines:36/152=24%)
>> > > Karol Herbst <kherbst@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:2/1=100%)
>> > > Lyude Paul <lyude@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:9/16=56%,authored:6/16=38%,added_lines:92/124=74%,removed_lines:107/152=70%)
>> > > David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
>> > > Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
>> > > Ilia Mirkin <imirkin@alum.mit.edu> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,removed_lines:2/2=100%)
>> > > "Nathan E. Egge" <unlord@xiph.org> (commit_signer:1/1=100%)
>> > > Jani Nikula <jani.nikula@intel.com> (commit_signer:6/16=38%)
>> > > Dave Airlie <airlied@redhat.com> (commit_signer:5/16=31%)
>> > > Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/16=25%,authored:4/16=25%)
>> > > dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
>> > > nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
>> > >
>> >
>> > I'd say it's good enough to message supporters and the mailing lists
>> > for at least Nouveau code, maybe even all drm drivers.
>>
>> i.e. leave out the commit_signer hits?
>>
>
> yes.

Agreed.

I understand the point of commit_signer, but I don't think
get_maintainers.pl does a very good job with the heuristics, or
filtering out "insignificant" contributions to the files being changed.

BR,
Jani.

>
>> > Not sure what to do about actual maintainers, but I doubt Dave and
>> > Daniel want to be CCed on every Coverity report here either.
>>
>> I updated the CC logic based on this feedback:
>> https://lore.kernel.org/linux-hardening/87h6zgfub4.fsf@kernel.org/
>>
>> So maybe just mailing lists?
>>
>
> That should be good enough, but maybe the DRM subsystem is big enough
> so it's reasonable to add special rules. For Nouveau either way is
> fine.
>
>> --
>> Kees Cook
>>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
