Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F0A5A00B5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54E38B068;
	Wed, 24 Aug 2022 17:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Tue, 16 Aug 2022 11:35:27 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5DA18A6AD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:35:27 +0000 (UTC)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F0B483F03E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 11:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660649365;
 bh=aSmJyx7D+51w1LpJgRV3eRqde7lEGdt1JKguqJZK45s=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=J7+OYlnkQpf1uYZ2ozVsmLf9M0ZZm4z/MQBgW/NrJeHttVSNgSYdQvMNS8CP8opNx
 uz0MM1JCUL/Jh9a70wJp9/VjpAoRMLcUAbquA8Eb6TqD8l8sTN3Bz4yXTin2fHXfvw
 f4WbbdE9aPgztYNEwqfKzTqdRK4Fw0QObb0S4ciiQKZCNa8STmVhj2y/pu6CTrg4kU
 XF7+ijXtTGw6U+AsPbdevrC+9OqB/0gBbCgRA6+hJepqOQxAqwRs3MiMlSXSLZJmUB
 yvAMMzT9esGTY35H3e/dsVBDA3lR76tX3PYKeS9tv8pth5vTOLBcpFKeu8wYS+OQ9S
 Goolch5grqKIw==
Received: by mail-oo1-f72.google.com with SMTP id
 t25-20020a4a7619000000b0044a8eef0d7dso4380003ooc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 04:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aSmJyx7D+51w1LpJgRV3eRqde7lEGdt1JKguqJZK45s=;
 b=rZ7p7Vx5xM1197Ex8tkDx05TZMjrZbf2SeAPuZCKbAPTc2FaX59MfcWAFPwUi0Xipc
 g6aI5RUMHSj0wo96Ai9IcEOfNGbndgziJJcOfnLBk+aFRHF9UmilzWnCZJngYSfSNXb9
 rEhCCEgelzZ306NW5wZNzRQHHgPURmcFfmVq32I2Ctz+nnnOD5d0OSVV42mRzgoKAfo4
 wU/JBW007Js2Lzg9AY2xNWmuRfo4P9NqIH6+gpyo+ibqD9dFi64xp1SJL38GtRP+j/6S
 I1RhNq1vxbsTdZqIZTPoKr3G0KhFzUio9eF1QDnRcpEi7KqOibxk5CZpqiG41I5zafSR
 jzbA==
X-Gm-Message-State: ACgBeo1eSpvyXj08sI+/C/q83MSHPzX4IpHE5i1o+8YQKfQglopDzzXW
 V7uMIIL0lBPGu2aFWLP3hRsoBxCf3RQqC+wgqui0bkaOvwzV525bMvihIHoleWtwqfQMRMpEFmm
 QMKZZnUOImYQHEGWtvO3IKkjv4aCbeTes8xSyq9PlMq+rvwOIUvLRhrqlzER3EQ==
X-Received: by 2002:a9d:f05:0:b0:637:1068:1081 with SMTP id
 5-20020a9d0f05000000b0063710681081mr7028765ott.224.1660649364938; 
 Tue, 16 Aug 2022 04:29:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR40aLi1aejRJbmvKkK+SamiRZIPYXn99+43Y4C0pFABoznjtNDPzRNRT6iTGkRayNIBEZgpA6ErMuo6SjBRYzA=
X-Received: by 2002:a9d:f05:0:b0:637:1068:1081 with SMTP id
 5-20020a9d0f05000000b0063710681081mr7028758ott.224.1660649364645; Tue, 16 Aug
 2022 04:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com>
In-Reply-To: <87leror4sl.fsf@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 16 Aug 2022 19:29:11 +0800
Message-ID: <CAAd53p76ut7QRFdM4NjaRua=Hc4bu9_=7+Q_t8ExJysEAhJf=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 4:06 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > dGFX so external monitors are routed to dGFX, and more monitors can be
> > supported as result.
> >
> > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > on intel_dsm_guid2. This method is described in Intel document 632107.
>
> Is this the policy decision that we want to unconditionally make,
> though?

I believes so, so more external monitors can be supported at the same time.

Kai-Heng

>
> BR,
> Jani.
>
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> > index e78430001f077..3bd5930e2769b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > @@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =
> >                 0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
> >
> >  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> > +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
> >
> >  static const guid_t intel_dsm_guid2 =
> >       GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> > @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> >       struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> >       acpi_handle dhandle;
> >       union acpi_object *obj;
> > +     int supported = 0;
> >
> >       dhandle = ACPI_HANDLE(&pdev->dev);
> >       if (!dhandle)
> > @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> >
> >       obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> >                               INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> > -     if (obj)
> > +     if (obj) {
> > +             if (obj->type == ACPI_TYPE_INTEGER)
> > +                     supported = obj->integer.value;
> > +
> >               ACPI_FREE(obj);
> > +     }
> > +
> > +     /* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
> > +     if (supported & BIT(20)) {
> > +             obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
> > +                                     INTEL_DSM_REVISION_ID,
> > +                                     INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
> > +                                     NULL);
> > +             if (obj)
> > +                     ACPI_FREE(obj);
> > +     }
> >  }
> >
> >  /*
>
> --
> Jani Nikula, Intel Open Source Graphics Center
