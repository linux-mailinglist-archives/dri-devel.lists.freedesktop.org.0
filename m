Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1033596699
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 03:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC7010E27D;
	Wed, 17 Aug 2022 01:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA4110E1CA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:18:51 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EEC6B3F12E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660699129;
 bh=QB/N93Jt8jeRbC+nYshhBQqqf2b7gP/bAzKdLJW4IoY=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=NMYkjZeax++J7fEsyJYct1SlrQZpf6KPSGNea6DqyA128/x+zybH6clt9DX9s6Onp
 E/P8WyQwxWBgCYWDQtzrBo1ANuhg8xp23bRltFMSkyKz5on8hfTCTnfM+3GUJdujdK
 wUuVCU23fJO/SpB4gNCFQB/fojohdyEY+9KFuteuy9toUeNRC0So1/QROl9mfIKWeH
 OcNkiji7ZvpqLmrFW9YtsK/lQfKGlFAHU0xs/Dsqs80kXIiZHO9LMxK01w1G8MMfe2
 lXunxOCOlDBUluYwbHWP7sLap4FMLEZS8f27L/rFe0QWRaMh9YjAh9wPHPDvuVAuV5
 qXNVPDUfyFgsg==
Received: by mail-oi1-f199.google.com with SMTP id
 bb10-20020a056808168a00b00342d91dd857so3252109oib.21
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 18:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=QB/N93Jt8jeRbC+nYshhBQqqf2b7gP/bAzKdLJW4IoY=;
 b=LdppvX+D1uvXGdLqOaYR4JJO/csivKiXZv0ote4RM0CjrnSRYmqs7Y2DC4LKZgOK6s
 YwOt13ic79HYoiIBsDXBdUcPy4K3neK6i2sInzyoxp460/3B5mbU4/SGA2FrXKuQprnN
 a6S+wpSJ3mTTodEKV1YkjpX9l0Oi8EH4yTzo4rbl+4D6R/tSAN9kJ7rq4w6xQ5QynDzW
 YxcG9p4Df8ZK2js+7SPrws8p9sdCEUyaMHatpfFQijmWCBSdExIw6mtU97e1SMRCPkxW
 Wk12WeYN+ZJ1jXEMzCLUHNu1QlYlWjcV12IGxaT8LZD/rAxIQR0NtZpDa7M51ym9rNeW
 C1gg==
X-Gm-Message-State: ACgBeo1ugPFyTu0E0uKHWCtpFiwGjXuHWC3399Lk0JgBhmW1fno4CncO
 7qo5VuWFgr1gfDDgWDGEc523d0i/QHKRLDZTX2rx86VMZHe7KGoHhAREwm6cxkwwy7qx18adbva
 /AiPWtfNV+5lrRdwvY5axPYLTSFUxs2PvOCGoqKte6swPMfo6JvXf2ZY8SajjXg==
X-Received: by 2002:a05:6808:209f:b0:344:8f50:1f29 with SMTP id
 s31-20020a056808209f00b003448f501f29mr538905oiw.42.1660699128697; 
 Tue, 16 Aug 2022 18:18:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4z0ckBseo0DvhMsjK8u68wPgPVvhD5xGInUN9KS3WKNbIl+FGWT86akRupbmaylKkx03qn6le2zNiMt4kSPAI=
X-Received: by 2002:a05:6808:209f:b0:344:8f50:1f29 with SMTP id
 s31-20020a056808209f00b003448f501f29mr538889oiw.42.1660699128446; Tue, 16 Aug
 2022 18:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <CACO55tt=Op=0E94kK+1M8cDXNCk5Tkc=FMR8=OQFc5ohehjwaw@mail.gmail.com>
In-Reply-To: <CACO55tt=Op=0E94kK+1M8cDXNCk5Tkc=FMR8=OQFc5ohehjwaw@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 17 Aug 2022 09:18:36 +0800
Message-ID: <CAAd53p49X95MKrTDUq92LuHw3y2i09fUA2HEPzM1EcO8xO97Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
To: Karol Herbst <kherbst@redhat.com>
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
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 2:50 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Tue, Aug 16, 2022 at 4:53 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > dGFX so external monitors are routed to dGFX, and more monitors can be
> > supported as result.
> >
> > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > on intel_dsm_guid2. This method is described in Intel document 632107.
> >
>
> Can we please not do things like this just because?

I there's a very good reason to support more external monitors,
especially when eDP is already 4K so iGPU don't have enough buffer for
more displays.

>
> It forces the discrete GPU to be on leading to higher thermal pressure
> and power consumption of the system. Lower battery runtime or higher
> fan noise is the result. Not everybody wants to use an AC simply just
> because they attach an external display.

The system is designed in this way.

And many (if not all) gaming laptops and mobile workstations use
discrete GPU for external monitors.
We just recently found out we have to use a switch to make it work.

>
> If the problem is "we run out of displays" then can we have something
> more dynamic, where we are doing this only and only if we run out of
> resources to drive as that many displays.

This is a boot-time switch, so it's not possible to switch it dynamically.

>
> Most users will be fine with ports being driven by the iGPU. Why hurt
> most users, because of some weird special case with mostly only
> drawbacks?

This is a use case that hardware vendor never bother to test.
And this is not a special case - the system is designed to use dGPU
for external monitors.

Kai-Heng

>
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
> >                   0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
> >
> >  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> > +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
> >
> >  static const guid_t intel_dsm_guid2 =
> >         GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> > @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> >         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> >         acpi_handle dhandle;
> >         union acpi_object *obj;
> > +       int supported = 0;
> >
> >         dhandle = ACPI_HANDLE(&pdev->dev);
> >         if (!dhandle)
> > @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
> >
> >         obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_DSM_REVISION_ID,
> >                                 INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED, NULL);
> > -       if (obj)
> > +       if (obj) {
> > +               if (obj->type == ACPI_TYPE_INTEGER)
> > +                       supported = obj->integer.value;
> > +
> >                 ACPI_FREE(obj);
> > +       }
> > +
> > +       /* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx */
> > +       if (supported & BIT(20)) {
> > +               obj = acpi_evaluate_dsm(dhandle, &intel_dsm_guid2,
> > +                                       INTEL_DSM_REVISION_ID,
> > +                                       INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX,
> > +                                       NULL);
> > +               if (obj)
> > +                       ACPI_FREE(obj);
> > +       }
> >  }
> >
> >  /*
> > --
> > 2.36.1
> >
>
