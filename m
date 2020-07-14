Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B63721F59A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 17:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84606E82E;
	Tue, 14 Jul 2020 15:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1CE6E1CD;
 Tue, 14 Jul 2020 15:00:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z2so22263323wrp.2;
 Tue, 14 Jul 2020 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m59HlNWnnijhup2N6/gP3q1N+dQLZkPGUJT6GpfAj7I=;
 b=tMovU9EXODTSjEjZcXFaSowJOF+NdFuvRrCYxo+LU5ndjJKm2tRth+GQkXf1gceQiT
 dHMFRbRVE78+Tik9lwMGOI3M776CldzluFPZUVHFMm6+iH1iNWTmbTTXVkSDFvpecTwj
 w2D7MFZXpvqvjUKa9+FFmItoeN070gkQlxOJBmAfbCDd7qQSTwu8sBZtwpAEkMD//zxs
 GjYs2H+7C3xOtEa+u99FFfSeTZe84XqpvG4BDfwad30N+VdfQIp+ObDA81Qfgq8J0tMw
 ov7xhR3EdNCX+r4KO+I+fD/4lwwFZ9trum/BBXMC4aSroFNXWoxrU5OA8PiZ54DOeS6q
 OwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m59HlNWnnijhup2N6/gP3q1N+dQLZkPGUJT6GpfAj7I=;
 b=ifx3m74LUyv9M7MQAxbmvTiXmeF+HDBSFAw/KMBM7ilyZZE64dtQQ+Cb7ZRvNEFPU2
 cIYl2sXQ0v2hbmG7uemQY2MYtX1LDo+ddwiY5dPJFgA3ZOsNjOvUWfUPiJQjqvKgQX0M
 fbVgdLf93O5sv4E3CiDpaUJZ9uQdqgrsA4bKBHZiVUMHxR+4/hfpYcLt9/nrMdN1AVm8
 7VXRegwfDElrSdJEG5VvZ4eLgim9yYbuJ/0PWx6UT4hMVB5vY0ZLVDt0dfD8raaJtV+0
 OvRg8f7IgB/vQcYKnqkFbxRbLVGWrO4oIyKi3yc1vrgcy/ParoRKZ72mPL8WmaiEBJb9
 X6Xg==
X-Gm-Message-State: AOAM533rBIpyO26sz2O/fIHMTOTY2ixy0pibHahviaJWo9inzo+HvNey
 9Kh4LRy5C2BXDGDQnFGoCcCUdmwKPu6DThqhWRQ=
X-Google-Smtp-Source: ABdhPJyBLeGqdtVhfAhwMXnqmqAxt3RjTLzaJDgUQZ7IJiZkFh2deHB4q+aRjfziN9NE5zJWmm7p4R1cUyGHmhpLlso=
X-Received: by 2002:adf:fa89:: with SMTP id h9mr6158347wrr.120.1594738848683; 
 Tue, 14 Jul 2020 08:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200708164335.25097-1-hdegoede@redhat.com>
 <CADnq5_NeJBbCFKR96DWbCQteaRPCmThwD7_2biy7vSb-MifD9A@mail.gmail.com>
 <e6e73584-4e96-2250-6dc0-f3a26ee880fc@redhat.com>
In-Reply-To: <e6e73584-4e96-2250-6dc0-f3a26ee880fc@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Jul 2020 11:00:37 -0400
Message-ID: <CADnq5_MQrxj6cx2wQpsRxJjN5fgdvTbduUyEv+cZEa120p1aEQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Add privacy-screen class and connector properties
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sebastien Bacher <seb128@ubuntu.com>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 8:48 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 7/8/20 11:25 PM, Alex Deucher wrote:
> > On Wed, Jul 8, 2020 at 12:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi All,
> >>
> >> Here is the privacy-screen related code which we discussed a while ago.
> >> This series consists of a number of different parts:
> >>
> >> 1. A new version of Rajat's privacy-screen connector properties patch,
> >> this adds new userspace API in the form of new properties
> >>
> >> 2. Since on most devices the privacy screen is actually controlled by
> >> some vendor specific ACPI/WMI interface which has a driver under
> >> drivers/platform/x86, we need some "glue" code to make this functionality
> >> available to KMS drivers. Patches 3-5 add a new privacy-screen class for
> >> this, which allows non KMS drivers (and possibly KMS drivers too) to
> >> register a privacy-screen device and also adds an interface for KMS drivers
> >> to get access to the privacy-screen associated with a specific connector.
> >> This is modelled similar to how we deal with e.g. PWMs and GPIOs in the
> >> kernel, including separate includes for consumers and providers(drivers).
> >>
> >> 3. Some drm_connector helper functions to keep the actual changes needed
> >> for this in individual KMS drivers as small as possible (patch 6).
> >>
> >> 4. Make the thinkpad_acpi code register a privacy-screen device on
> >> ThinkPads with a privacy-screen (patches 7-8)
> >>
> >> 5. Make the i915 driver export the privacy-screen functionality through
> >> the connector properties on the eDP connector.
> >
> > Care to create a patch 10 for amdgpu?  Lenovo sells AMD thinkpads with
> > a privacy screen as well, presumably it works
> > the same way.
>
> Yes the AMD based Thinkpads should work the same way.
>
> We will need similar changes for amdgpu and very likely also for
> nouveau. The problem is I don't really have hw to test this.
>
> Do you have access to a recent thinkpad with amdgpu ? It does not need
> to have a privacy screen, as long as it is new enough that the ACPI
> tables have the GSSS and SSSS methods you can test by ignoring
> the presence bit for the privacy-screen, I use this little change for
> that:

Thanks for the hints Hans.  If I can find some time, I will give it a try.

Alex

>
>  From 9438bababe77dfccbade5c2377bdc7d6a777a6c6 Mon Sep 17 00:00:00 2001
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Wed, 27 May 2020 14:38:42 +0200
> Subject: [PATCH] platform/x86: thinkpad_acpi: Hack to allow testing
>   on devices without a privacy-screen
>
> Hack to allow testing on devices without a privacy-screen.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/gpu/drm/drm_privacy_screen_x86.c | 4 ++++
>   drivers/platform/x86/thinkpad_acpi.c     | 4 ++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> index f486d9087819..87725766a90d 100644
> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -41,7 +41,11 @@ static bool __init detect_thinkpad_privacy_screen(void)
>         if (ACPI_FAILURE(status))
>                 return false;
>
> +#if 1
> +       return true;
> +#else
>         return (output & 0x10000) ? true : false;
> +#endif
>   }
>
>   static const struct arch_init_data arch_init_data[] __initconst = {
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 1583c18f7f77..92aad746d1f8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9747,8 +9747,8 @@ static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
>         if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0))
>                 return -EIO;
>
> -       if (!(output & 0x10000))
> -               return 0;
> +//     if (!(output & 0x10000))
> +//             return 0;
>
>         lcdshadow_dev = drm_privacy_screen_register(&tpacpi_pdev->dev,
>                                                     &lcdshadow_ops);
> --
> 2.26.2
>
>
> So if you have a machine with an AMDGPU and with the mentioned ACPI methods,
> then you should be able to implement this yourself. You can read/write the new
> props under X11 with xrandr. And you monitor if the changes make it to the
> hardware by doing:
>
> cat /proc/acpi/ibm/lcdshadow
>
> And you can simulate external changes (like through a hotkey handled by the embedded-controller) by doing:
>
> echo 0 > /proc/acpi/ibm/lcdshadow
> echo 1 > /proc/acpi/ibm/lcdshadow
>
> When you do this you should see udev change events for the properties, you
> can test for those by doing:
>
> sudo udevadm monitor -u -p
>
> ###
>
> With all that said, I can take a shot at blindly implementing this for amdgpu
> but I would greatly prefer an actually tested patch, even if it is tested in
> the way described above. When the patch is ready you can just send it to me
> and I'll add my s-o-b and add it as patch 10 in the patch-set for the next
> version.
>
> Regards,
>
> Hans
>
>
> >> I was a bit in doubt if I should calls this series a RFC, or just call
> >> it v1, since there is no real userspace code using this yet. It was
> >> tested using xrandr property access and udevadm event monitoring.
> >> I do expect / hope we will have patches for a userspace consumer of the
> >> new properties (mutter) ready soon.
> >>
> >> But since the code is completely ready, including API documentation,
> >> I've decided to just call this v1. Hopefully we can get patches for the
> >> first userspace consumer of this ready during the review of this.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
