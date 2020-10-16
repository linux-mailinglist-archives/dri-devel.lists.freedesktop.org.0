Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E4C290E07
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 01:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BBA6F3DC;
	Fri, 16 Oct 2020 23:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492DE6F3D6;
 Fri, 16 Oct 2020 23:13:27 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id w5so1775451qvn.12;
 Fri, 16 Oct 2020 16:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7RuxfDmYh7992kjsGyJV2rciQYqk7U7xwMsOsYsjz8=;
 b=PVGGhCmPeDg3HPMKADOXVdBENiFIOlBQzu2/zYPq8cy0+s7tOH8PJUBo7MT/lWedOW
 Ya1K8wEEwLlQDs+CSbv3cHALEksYKcWSOPJLas04behaEU6l2Etu9yyDdFo9AHwGKCec
 BhttibS0A2pCaHtHAkc97KWpHtVUUs/jLcPahOSvPWyiiLlI0V4JpQJaqLXK9ifqcXCn
 HI7kp5ij8WMPCnAWSDUDzrP8Urlhw7tebL+YpUTgRhuY8X1tkcQzNxtEX6+vB2l4tm+c
 kuPqJJDi/V7tbZYuegIYec/82EWljJHuIYYGTYJ/hcZJcDGRRTfFXUA9tfLmjm/nBu5a
 9KOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7RuxfDmYh7992kjsGyJV2rciQYqk7U7xwMsOsYsjz8=;
 b=YjJLop4kf+m4AhuHLIbJwLfXgNK5FKYNfBpisTNJ2JQFW/A2Zd1asZuSSpWobO0+VY
 9DeCcBqOtzkYMp0U2b0eaZlig+aOxRLAnA726m/4QgR0xmrQbF+mtFQkIS9Odayy7Z5L
 pKNAyDCeVaGnQhtTLCYf4QbJgFl0fewrmSYRLT973Lpmm4n98YHuc8qLybNMA75zqUxM
 ita6GDto2gKXfWIlIOWLhrWxLB/P5aqtyai8jwsFtMxx6RBs5sFP/VSKxmDq3rGlxBLz
 ysw88rBBjjfa1V5ROt9tgmciKn/ZEDO8N+UCFSMjsP5srObpMxNLu6XzqqYGaSHUFtOP
 /w8Q==
X-Gm-Message-State: AOAM530are0wJOeE2EG1K5TYZIPgjlINxw1iZSKIUiqHvi/DyJhWWbIO
 LGTbRlLWrHHWRzAx9bWxNDYYx5TdWI3cTfExRh8=
X-Google-Smtp-Source: ABdhPJyTWnWZMvObmoTFCM33QH97SBYnRZjKmzDBNHfBEr5YdbQJ1Y3/ou5QGpm7rwdmDkrNlHcERU6B0/1nz4PPOrk=
X-Received: by 2002:a0c:85e3:: with SMTP id o90mr5853975qva.46.1602890006306; 
 Fri, 16 Oct 2020 16:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200916171855.129511-1-lyude@redhat.com>
 <20200916171855.129511-2-lyude@redhat.com>
In-Reply-To: <20200916171855.129511-2-lyude@redhat.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 16 Oct 2020 16:13:00 -0700
Message-ID: <CA+E=qVegN8qe+j73Cu=fjqHgSa2fn2pNcfLBZNHfc4orCiafAA@mail.gmail.com>
Subject: Re: [RFC v2 1/8] drm/i915/dp: Program source OUI on eDP panels
To: Lyude Paul <lyude@redhat.com>
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
Cc: thaytan@noraisin.net, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 10:19 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Since we're about to start adding support for Intel's magic HDR
> backlight interface over DPCD, we need to ensure we're properly
> programming this field so that Intel specific sink services are exposed.
> Otherwise, 0x300-0x3ff will just read zeroes.
>
> We also take care not to reprogram the source OUI if it already matches
> what we expect. This is just to be careful so that we don't accidentally
> take the panel out of any backlight control modes we found it in.
>
> v2:
> * Add careful parameter to intel_edp_init_source_oui() to avoid
>   re-writing the source OUI if it's already been set during driver
>   initialization
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Hi Lyude,

Sorry for a late reply.

Whole series is:

Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

Regards,
Vasily

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4bd10456ad188..7db2b6a3cd52e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3424,6 +3424,29 @@ void intel_dp_sink_set_decompression_state(struct intel_dp *intel_dp,
>                             enable ? "enable" : "disable");
>  }
>
> +static void
> +intel_edp_init_source_oui(struct intel_dp *intel_dp, bool careful)
> +{
> +       struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +       u8 oui[] = { 0x00, 0xaa, 0x01 };
> +       u8 buf[3] = { 0 };
> +
> +       /*
> +        * During driver init, we want to be careful and avoid changing the source OUI if it's
> +        * already set to what we want, so as to avoid clearing any state by accident
> +        */
> +       if (careful) {
> +               if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf)) < 0)
> +                       drm_err(&i915->drm, "Failed to read source OUI\n");
> +
> +               if (memcmp(oui, buf, sizeof(oui)) == 0)
> +                       return;
> +       }
> +
> +       if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) < 0)
> +               drm_err(&i915->drm, "Failed to write source OUI\n");
> +}
> +
>  /* If the sink supports it, try to set the power state appropriately */
>  void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
>  {
> @@ -3443,6 +3466,10 @@ void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
>         } else {
>                 struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
>
> +               /* Write the source OUI as early as possible */
> +               if (intel_dp_is_edp(intel_dp))
> +                       intel_edp_init_source_oui(intel_dp, false);
> +
>                 /*
>                  * When turning on, we need to retry for 1ms to give the sink
>                  * time to wake up.
> @@ -4607,6 +4634,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>         if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
>                 intel_dp_get_dsc_sink_cap(intel_dp);
>
> +       /*
> +        * If needed, program our source OUI so we can make various Intel-specific AUX services
> +        * available (such as HDR backlight controls)
> +        */
> +       intel_edp_init_source_oui(intel_dp, true);
> +
>         return true;
>  }
>
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
