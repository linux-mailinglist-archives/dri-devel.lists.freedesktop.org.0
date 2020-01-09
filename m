Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15530136166
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 20:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413F76E95E;
	Thu,  9 Jan 2020 19:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB656E048;
 Thu,  9 Jan 2020 19:49:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so8733213wru.3;
 Thu, 09 Jan 2020 11:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1+BPUFdGjZolNEIZXyhgzf9fZtNW05/3LYukVrt9S1o=;
 b=Vn7VkzfN6G2DUWXXfNzcVAnLgsoj7O4UZGQAn/gcBfPiTy2uvzKmxP8jBU6Z7YqWL8
 Rfbmf2jpmNthnpWNXvB1c0OHI7JwSBAGX/rRQJDw6Gs66sChgQJZLh611CFC/Z/OVYdD
 rs5L/AeBrcDP+Reyc1sODLuNwhz6q6gXLVoq80hAcbOpjcpX0KxLlCBzqHM3ClEXwuh0
 rQMq6CvlV4YP+3uvnpaIUVjA69q0ubhqek6AdzD/mFOQhJSChzb+VMrYxBWcnKPH9GWO
 rJfnX9Iti5UbOqC+PXqTerdzrYXlDfQX+g7kUEHlpKzi+ljWmXSyEgJgRUnRwoZ/3aBJ
 cXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1+BPUFdGjZolNEIZXyhgzf9fZtNW05/3LYukVrt9S1o=;
 b=AiXU9xjrBxgmOj8u3Uj9ouS0/sw3KJ1szObV3C0i6oyK6BQYci5J1U7Gazb21EeiYy
 UVaFGaxPnflbj6gxbi7sxC5sv9NPZfZ9MOXBuVF8zButgVwZE6Z7tO0v09YMxzPDdxlW
 WI6jNG6k5JC/cSnlMnLBvRPYRoxx2lZgzMelI8ks4GfEblHMV3I6kGgjfKbulCsEanMx
 C248kXO0yt9fquJiVGQEF5wte+lw9OBGyMdBYXJKVMm4Phv8qCQF/KUNoycnL7/y68Tt
 6uYeAKVm2RReM/Goa3gbPkOvVFnnfHPpXxpZ3AQdoMQyoOKUvxsrO5GRevpgzPOQ65ut
 UWyQ==
X-Gm-Message-State: APjAAAXYsdUsPxJV/WPdLQrlHc66QTS51W9LUnyM92FzUjQ9t3wDgHww
 sge9nA8WP384hDgKK82Jr2RMnDMkFoAdK37Hqa0=
X-Google-Smtp-Source: APXvYqz0ORhs0Mqz7yE/AIWpadxxhqlhWG8q+jKGYDvCRZuRRuyCcTfEodgVdWQ+rMIXd6/ZXFFaS6Z2x6WZrzZ9jtc=
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr12865990wrn.50.1578599366338; 
 Thu, 09 Jan 2020 11:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
 <CAEsyxyjTvuCHHA3D-NJd=aGkHz2d=obSizwGQL8B4k1B7i2jJg@mail.gmail.com>
In-Reply-To: <CAEsyxyjTvuCHHA3D-NJd=aGkHz2d=obSizwGQL8B4k1B7i2jJg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Jan 2020 14:49:12 -0500
Message-ID: <CADnq5_NPdg8MjQ5cB2aCD+US1Hv+FoP1gqKcA4W2e0pouG8cGQ@mail.gmail.com>
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

On Thu, Jan 9, 2020 at 11:47 AM Mario Kleiner
<mario.kleiner.de@gmail.com> wrote:
>
> On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner
>> <mario.kleiner.de@gmail.com> wrote:
>> >
>> > If the current eDP link rate, as read from hw, provides a
>> > higher bandwidth than the standard link rates, then add the
>> > current link rate to the link_rates array for consideration
>> > in future mode-sets.
>> >
>> > These initial current eDP link settings have been set up by
>> > firmware during boot, so they should work on the eDP panel.
>> > Therefore use them if the firmware thinks they are good and
>> > they provide higher link bandwidth, e.g., to enable higher
>> > resolutions / color depths.
>> >
>> > This fixes a problem found on the MacBookPro 2017 Retina panel:
>> >
>> > The panel reports 10 bpc color depth in its EDID, and the UEFI
>> > firmware chooses link settings at boot which support enough
>> > bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
>> > DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
>> > so intel_dp_set_sink_rates() would cap at that. This restricts
>> > achievable color depth to 8 bpc, not providing the full color
>> > depth of the panel. With this commit, we can use firmware setting
>> > and get the full 10 bpc advertised by the Retina panel.
>>
>> Would it make more sense to just add a quirk for this particular
>> panel?  Would there be cases where the link was programmed wrong and
>> then we end up using that additional link speed as supported?
>>
>> Alex
>>
>
> Not sure. This MBP 2017 is the only non-ancient laptop i now have. I'd assume many other Apple Retina panels would behave similar. The panels dpcd regs report DP 1.1 and eDP 1.3, so the flexible table with additional modes from eDP1.4+ does not exist. According to Wikipedia, eDP 1.4 was introduced in february 2013 and this is a mid 2017 machine, so Apple seems to be quite behind. Therefore i assume  we'd need a lot of quirks over time.
>
> That said:
>
> 1. The logic in amdgpu's DC for the same purpose is a bit different than on the intel side.
>
> 2. DC allows overriding DP link settings, that's how i initially tested this, so one could do the "quirk" via something like that in a bootup script. So on AMD one could work around the lack of the patch and of quirks.
>
> 3. I spent a lot of time with a photo-meter, testing the quality of the 10 bit: It turns out that running the panel at 8 bit + AMD's spatial dithering that kicks in gives better results than running the panel in native 10 bit. Maybe the panel is not really a 10 bit one, but just pretends to be and then uses its own dithering to achieve 10 bit. So at least on AMD one is better off precision-wise with the 8 bit panel default with this specific panel.
>
> On Intel however, we don't do dithering for > 6 bpc panels atm., so using the panel at 10 bpc is the only way to get 10 bit display atm. Adn we don't use dithering on Intel at > 6 bpc panels atm., because there are some oddities in the way Intel hw dithers at higher bit depths - it also dithers pixel values where it shouldn't. That makes it impossible to get an identity passthrough of a 8 bpc framebuffer to the outputs, which kills all kind of special display equipment that needs that identity passthrough to work.
>

As Harry mentioned in the other thread, won't this only work if the
display was brought up by the vbios?  In the suspend/resume case,
won't we just fall back to 2.7Gbps?

Alex

> -mario
>
>> >
>> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
>> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++++++
>> >  1 file changed, 23 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> > index 2f31d226c6eb..aa3e0b5108c6 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> > @@ -4368,6 +4368,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>> >  {
>> >         struct drm_i915_private *dev_priv =
>> >                 to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
>> > +       int max_rate;
>> > +       u8 link_bw;
>> >
>> >         /* this function is meant to be called only once */
>> >         WARN_ON(intel_dp->dpcd[DP_DPCD_REV] != 0);
>> > @@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>> >         else
>> >                 intel_dp_set_sink_rates(intel_dp);
>> >
>> > +       /*
>> > +        * If the firmware programmed a rate higher than the standard sink rates
>> > +        * during boot, then add that rate as a valid sink rate, as fw knows
>> > +        * this is a good rate and we get extra bandwidth.
>> > +        *
>> > +        * Helps, e.g., on the Apple MacBookPro 2017 Retina panel, which is only
>> > +        * eDP 1.1, but supports the unusual rate of 324000 kHz at bootup, for
>> > +        * 10 bpc / 30 bit color depth.
>> > +        */
>> > +       if (!intel_dp->use_rate_select &&
>> > +           (drm_dp_dpcd_read(&intel_dp->aux, DP_LINK_BW_SET, &link_bw, 1) == 1) &&
>> > +           (link_bw > 0) && (intel_dp->num_sink_rates < DP_MAX_SUPPORTED_RATES)) {
>> > +               max_rate = drm_dp_bw_code_to_link_rate(link_bw);
>> > +               if (max_rate > intel_dp->sink_rates[intel_dp->num_sink_rates - 1]) {
>> > +                       intel_dp->sink_rates[intel_dp->num_sink_rates] = max_rate;
>> > +                       intel_dp->num_sink_rates++;
>> > +                       DRM_DEBUG_KMS("Adding max bandwidth eDP rate %d kHz.\n",
>> > +                                     max_rate);
>> > +               }
>> > +       }
>> > +
>> >         intel_dp_set_common_rates(intel_dp);
>> >
>> >         /* Read the eDP DSC DPCD registers */
>> > --
>> > 2.24.0
>> >
>> > _______________________________________________
>> > dri-devel mailing list
>> > dri-devel@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
