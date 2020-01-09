Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372FE135CF4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 16:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945566E444;
	Thu,  9 Jan 2020 15:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BA788422;
 Thu,  9 Jan 2020 15:40:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so7900761wrh.5;
 Thu, 09 Jan 2020 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2FXvRMIVk8bn9cjNVgP4WrHmhTUUL+l34Q5pmxvITU=;
 b=L6z8Kh5+QNNcByppEJGEHTu6cGnYCcNZQ/PYrjkx9ZfIQ5HiWQ+Mqaw1Ph2G+8KbXx
 aNXWyBFVzotfGHJG1cnsnlAf/J6CR8l7zPfsv5LT1q3q1Y9DB29Btrwb+hOyuajvyX76
 8d7I+aB0kfGNFqbeGc3i135KbfAeb1aBrhlPMbSCsoTPd59IoyU0gWafNGFpBxuF7S5F
 kCdA7J4xPUfHU7THEZjjUHGiSZdtcbDPlU/AV1hIDbjKuGHDLg3a2Tw0qRMGZ1LUUTP3
 CE8cwVf4beYJxYEpf0Os1wvSl14k7ItJlpFbS3WNu/aSgc5gp7j18vhtBY0O90jwMRTo
 oG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2FXvRMIVk8bn9cjNVgP4WrHmhTUUL+l34Q5pmxvITU=;
 b=QRB+PStKzBt3UXuexrzdXQnvxt55kz+EeEVV+G6fwwWmqVjNX4ZmjQiGIphc7q/PVH
 SroTntzPmF3NKn05AflxQNJqsAkM+kIHYxFY+WTZEs6pIQE4SH2qvDtLwAqTwU4if+1p
 wEsaZb9mHZbZSNia6qyLLkZr5gqR59ItIJGECSwDRQBZdsPa/SGJcRJXnRUoC1CqN3qc
 FbHSPl8hN5vjno64dOdouGoanbeXUKAtjgGHBR6X/CbM06fy/+IeChRIX9tGM25iOyMW
 w47ffOLLuXqLNREW2Qxbhy8OtKonKzbzVE3mtl6jKcK1eu1ZEcdOqoelReS/1ur8M27D
 nomg==
X-Gm-Message-State: APjAAAXD4UmP51BXOuWkhe3PW66fH4ZDGeVpKpRnpBTYnHHYkD12BUED
 QxdFSmNmIIyPzrcq9o+g6v+ZDxS2NpswRYtrWoo=
X-Google-Smtp-Source: APXvYqwvReVIw2A1fLUv6WJsGkHCmgSZkm0XsbCmnxnbMvY8DFgCv4BR445ksLq7tzVeynp5sIbI2eA+F9yGXtbqEks=
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr11880866wrn.50.1578584410939; 
 Thu, 09 Jan 2020 07:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
In-Reply-To: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Jan 2020 10:39:58 -0500
Message-ID: <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: mario.kleiner.de@gmail.de,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner
<mario.kleiner.de@gmail.com> wrote:
>
> If the current eDP link rate, as read from hw, provides a
> higher bandwidth than the standard link rates, then add the
> current link rate to the link_rates array for consideration
> in future mode-sets.
>
> These initial current eDP link settings have been set up by
> firmware during boot, so they should work on the eDP panel.
> Therefore use them if the firmware thinks they are good and
> they provide higher link bandwidth, e.g., to enable higher
> resolutions / color depths.
>
> This fixes a problem found on the MacBookPro 2017 Retina panel:
>
> The panel reports 10 bpc color depth in its EDID, and the UEFI
> firmware chooses link settings at boot which support enough
> bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
> DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
> so intel_dp_set_sink_rates() would cap at that. This restricts
> achievable color depth to 8 bpc, not providing the full color
> depth of the panel. With this commit, we can use firmware setting
> and get the full 10 bpc advertised by the Retina panel.

Would it make more sense to just add a quirk for this particular
panel?  Would there be cases where the link was programmed wrong and
then we end up using that additional link speed as supported?

Alex

>
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 2f31d226c6eb..aa3e0b5108c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4368,6 +4368,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  {
>         struct drm_i915_private *dev_priv =
>                 to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
> +       int max_rate;
> +       u8 link_bw;
>
>         /* this function is meant to be called only once */
>         WARN_ON(intel_dp->dpcd[DP_DPCD_REV] != 0);
> @@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>         else
>                 intel_dp_set_sink_rates(intel_dp);
>
> +       /*
> +        * If the firmware programmed a rate higher than the standard sink rates
> +        * during boot, then add that rate as a valid sink rate, as fw knows
> +        * this is a good rate and we get extra bandwidth.
> +        *
> +        * Helps, e.g., on the Apple MacBookPro 2017 Retina panel, which is only
> +        * eDP 1.1, but supports the unusual rate of 324000 kHz at bootup, for
> +        * 10 bpc / 30 bit color depth.
> +        */
> +       if (!intel_dp->use_rate_select &&
> +           (drm_dp_dpcd_read(&intel_dp->aux, DP_LINK_BW_SET, &link_bw, 1) == 1) &&
> +           (link_bw > 0) && (intel_dp->num_sink_rates < DP_MAX_SUPPORTED_RATES)) {
> +               max_rate = drm_dp_bw_code_to_link_rate(link_bw);
> +               if (max_rate > intel_dp->sink_rates[intel_dp->num_sink_rates - 1]) {
> +                       intel_dp->sink_rates[intel_dp->num_sink_rates] = max_rate;
> +                       intel_dp->num_sink_rates++;
> +                       DRM_DEBUG_KMS("Adding max bandwidth eDP rate %d kHz.\n",
> +                                     max_rate);
> +               }
> +       }
> +
>         intel_dp_set_common_rates(intel_dp);
>
>         /* Read the eDP DSC DPCD registers */
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
