Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E23FC4C9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 11:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA1089958;
	Tue, 31 Aug 2021 09:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4690A89958
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 09:52:01 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id g9so23838909ioq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HtHyg8rQp5wB2dqxPJUR6f3KHhh9TxPYkel+BqDOL4A=;
 b=FcmrJN7u6bJB28HNRKhVZIUw+ZATnS9aCmqqC48oXwe9wLet89Kb4EGDZ9f0VethpP
 ZKb9YsFZOUnLspfMiunp+rrNWA2qdFPvLrm2TF5bwY0wO96qzmeUnAE8krFxB+ZH5D8T
 of/UHYGQQ/C0cKlSMbjfqvR3BfH1ve0Mv6Kkwq1IIioB4ADpn1bffUqc/r/z49zr7h7e
 LFnsyXhWeb7KLOCmMKvnejEHcE8lqAan8LykhqSf9+ruHqTsBW5sGs/d6bLJlInfRa1k
 B78ut8Ss/J2ZRSh8iYpkmsHsxqHixi9UwTZF1s5dSon30/ujWV+SPj3+Rux9NqYaA2yi
 IqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HtHyg8rQp5wB2dqxPJUR6f3KHhh9TxPYkel+BqDOL4A=;
 b=ftxkhG2MKwoK6ZXG08fTftVc2jQZJS5k1IrF66ub4Xi9gOpz8kNi2O+DZtYTR/V1qc
 JZ0DU57rMZPg33DU1YKXHU1pK9KGlMYngTptn0q8ZS03Hhl3dRCdSTf1QH8PCBPYH9Uh
 Vb/4OTZEd+A44aRs/gWKDcRMxdAiElH75t8ff4vLgNyhtINpJKc/lKDVVzeyVZpx4zF8
 cxql9frM4SUoAOaEX0bY8LfbQtrcRVKysLP/3RFen9/Bl57n5F+15K7aaSXQ2HjKofIo
 zHUik8WbvBvZYjgKQXl1ndZB/5KpthAxFuORAtthNpc43T/B5cubjqpxzr9+uuU9gcGY
 sSmA==
X-Gm-Message-State: AOAM5331VGCJP5MSfmutkzM2kaFw1/5I3f4RWM64Tnchg9KlLnDripf1
 z4sf9DJqBmKU2/xR+YmSKaRFxWNEOzTQf9xZanLCkA==
X-Google-Smtp-Source: ABdhPJxm+QXPOQqeBc/6xcKSl5KqQc8mT62v9Cr48x+RKcWVtGaGJ9c0kNxiMwl1GPLJJLVB/9aQG3kDxs7/JxEXWl8=
X-Received: by 2002:a6b:8bcf:: with SMTP id
 n198mr12556204iod.178.1630403520626; 
 Tue, 31 Aug 2021 02:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210817204329.5457-1-anisse@astier.eu> <87pmtuarhh.fsf@intel.com>
In-Reply-To: <87pmtuarhh.fsf@intel.com>
From: Anisse Astier <anisse@astier.eu>
Date: Tue, 31 Aug 2021 11:51:49 +0200
Message-ID: <CALUN=qJ9DX2nRPXUb08t7orJY1=+O+Y3Th=dgiURc8Z4VYvw8A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] GPD Win Max display fixes
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>, 
 Daniel Dadap <ddadap@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 11:33 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Tue, 17 Aug 2021, Anisse Astier <anisse@astier.eu> wrote:
> > This patch series is for making the GPD Win Max display usable with
> > Linux.
> >
> > The GPD Win Max is a small laptop, and its eDP panel does not send an
> > EDID over DPCD; the EDID is instead available in the intel opregion, in
> > mailbox #5 [1]
> >
> > The first patch is based on Jani's patch series [2] adding support for
> > the opregion, with changes. I've changed authorship, but I'd be glad to
> > revert it
>
> If you don't mind, please just add:
>
> Co-developed-by: Jani Nikula <jani.nikula@intel.com>

I don't mind at all, I think you should be first author for this
series, I just didn't feel like giving you the blame for the bugs
after this many modifications, without asking first. Will be in next
iteration.

Anisse


>
>
> Thanks,
> Jani.
>
> >
> > The second patch is just to fix the orientation of the panel.
> >
> > Changes since v1:
> >  - rebased on drm-tip
> >  - squashed patch 1 & 2
> >  - picked up Reviewed-by from Hans de Goede (thanks for the review)
> >
> > Changes since v2:
> >  - rebased on drm-tip
> >  - updated commit message
> >
> > When v2 was initially sent [3] Ville Syrj=C3=A4l=C3=A4 suggested that i=
t might be
> > a good idea to use the ACPI _DDC method instead to get the EDID, to
> > cover a wider range of hardware. Unfortunately, it doesn't seem
> > available on GPD Win Max, so I think this work should be done
> > independently, and this patch series considered separately.
> >
> > [1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
> > [2]: https://patchwork.kernel.org/project/intel-gfx/patch/2020082806194=
1.17051-1-jani.nikula@intel.com/
> > [3]: https://patchwork.kernel.org/project/intel-gfx/patch/2021053120464=
2.4907-2-anisse@astier.eu/
> >
> >
> > Anisse Astier (2):
> >   drm/i915/opregion: add support for mailbox #5 EDID
> >   drm: Add orientation quirk for GPD Win Max
> >
> >  .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
> >  drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
> >  4 files changed, 85 insertions(+), 1 deletion(-)
>
> --
> Jani Nikula, Intel Open Source Graphics Center
