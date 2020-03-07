Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854717CD9A
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820C6E1B4;
	Sat,  7 Mar 2020 10:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A206EDD4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 01:27:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h18so4106972ljl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 17:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tM5rNBDzDBfUzH8FigDCfHhd1rXYSHwTeF/Tvps25Ao=;
 b=HpWAYO0LOjmlNMsNvaoN+lgWUHGKA8P4Sdwn1m2ycN0+57X7bxCNbb4H/jMrbdlkFG
 O+tISKs7zkNKeaL26enQ0oB+/d1pULikT52MHYmfhd/C+qFMjwppkxxHiwwOgoLtO49n
 OIFjOgVCPylgn+ZSTR/4wEnhsRFMXOTd3FBSDy+a2A+Bbk0uEww0vtON8gfJMNvMmrOz
 mm9+lyc7fLEYhWUT0UxiVLifqQClK0Bj3Ese/LbI0Po2RpPpEtEx7AI5CIcKCLBkBBx9
 pQYXoRJ2Eu63G0SPdGTbc5Y6ygn1lRPtwhCC1MQk4h00NyIOehUvSzO4UXnAZDUT4KDv
 c35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tM5rNBDzDBfUzH8FigDCfHhd1rXYSHwTeF/Tvps25Ao=;
 b=QyQ0M29l4yd5jK++jzbOPGUFMS9laZvinfo/FdK/kStI9kv9caV8hVsg8+DTH7/+WD
 QhCoHmXIuDCWAW4Dym26WW/FEv+pDHYrEOT1IqfBSwFNhZ99BQ4VD4Haf6ju+Utmm1ZN
 u0R6bhULO/EAV3ua95JCc4c6MATuk98eCT0N2VnlEzpVdvXdj2rHy5b4nQVe3BcVZ4y8
 D3SINp6huc/H+hyimQOTLNRnQd3BL515TNeASi2L0AaypZV2+Rd+XsvAwnQtBuXTi0fV
 FITeWzSOqxFwk0XkWzgoPEMtV4J+ANBmJN2Y3ah4Wttg8k5qkP8EJMNZre9NJuI6ydw1
 5fTQ==
X-Gm-Message-State: ANhLgQ3neFv6NLZ1x6SUUeXxgf4PSfRSSQdOGEBBiqZBG66GQh9rZbC+
 ueC6pawDy7+Y+vurKk+T6rRkkJDa025LrbIUe9oDzw==
X-Google-Smtp-Source: ADFU+vswaj44TqozErjCWa7iRzdIsg2d5K2y0B3N/jpQwQkIl3T1+K9wNnp5/KhPTopivHokdBJHWhLYsjVl7GpbTvY=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr3340787ljp.66.1583544477713; 
 Fri, 06 Mar 2020 17:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20200305012338.219746-1-rajatja@google.com>
 <20200305012338.219746-4-rajatja@google.com>
 <87k13znmrc.fsf@intel.com>
 <CACK8Z6ERZpZaSXsxrk_yGrRAtrgwytb5TEpyt1sX+V40U7m0sQ@mail.gmail.com>
 <87pndpoklz.fsf@intel.com>
In-Reply-To: <87pndpoklz.fsf@intel.com>
From: Rajat Jain <rajatja@google.com>
Date: Fri, 6 Mar 2020 17:27:21 -0800
Message-ID: <CACK8Z6G1y+osmBeOFmGyFgC2SX=HoY=rogKxk=F6D2GPxoMt1w@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/i915: Add support for integrated privacy
 screens
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Guenter Roeck <groeck@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Mark Pearson <mpearson@lenovo.com>, Tomoki Maruichi <maruichit@lenovo.com>,
 Jesse Barnes <jsbarnes@google.com>, Rajat Jain <rajatxjain@gmail.com>,
 intel-gfx@lists.freedesktop.org, Mat King <mathewk@google.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@denx.de>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Jani so much for the detailed explanation.

I was able to write the code for this, but I am facing one problem, see below.

On Fri, Mar 6, 2020 at 2:15 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 05 Mar 2020, Rajat Jain <rajatja@google.com> wrote:
> > OK, will do. In order to do that I may need to introduce driver level
> > hooks that i915 driver can populate and drm core can call (or may be
> > some functions to add privacy screen property that drm core exports
> > and i915 driver will call).
>
> The latter. Look at drm_connector_attach_*() functions in
> drm_connector.c. i915 (or any other driver) can create and attach the
> property as needed. drm_atomic_connector_{get,set}_property in
> drm_atomic_uapi.c need to handle the properties, but *only* to get/set
> the value in drm_connector_state, nothing more. How that value is
> actually used is up to the drivers, but the userspace interface will be
> the same instead of being driver specific.

Understood, done.

>
> >> > @@ -93,15 +97,18 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
> >> >       struct drm_i915_private *dev_priv = to_i915(dev);
> >> >       struct intel_digital_connector_state *intel_conn_state =
> >> >               to_intel_digital_connector_state(state);
> >> > +     struct intel_connector *intel_connector = to_intel_connector(connector);
> >> >
> >> >       if (property == dev_priv->force_audio_property) {
> >> >               intel_conn_state->force_audio = val;
> >> >               return 0;
> >> > -     }
> >> > -
> >> > -     if (property == dev_priv->broadcast_rgb_property) {
> >> > +     } else if (property == dev_priv->broadcast_rgb_property) {
> >> >               intel_conn_state->broadcast_rgb = val;
> >> >               return 0;
> >> > +     } else if (property == intel_connector->privacy_screen_property) {
> >> > +             intel_privacy_screen_set_val(intel_connector, val);
> >>
> >> I think this part should only change the connector state. The driver
> >> would then do the magic at commit stage according to the property value.
>
> Also, this would be the part that's done in drm core level.
>

Yup.

> > Can you please point me to some code reference as to where in code
> > does the "commit stage" apply the changes?
>
> Look at, say, drm_connector_attach_scaling_mode_property(). In the
> getter/setter code it'll just read/change state->scaling_mode. You can
> use the value in encoder ->enable, ->disable, and ->update_pipe
> hooks. Enable should enable the privacy screen if desired, disable
> should probably unconditionally disable the privacy screen while
> disabling the display, and update should just change the state according
> to the value. Update is called if there isn't a full modeset. (Scaling
> mode is a bit more indirect than that, affecting other things in the
> encoder ->compute_config hook, leading to similar effects.)

For my testing purposes, I'm testing this using the proptest utility
in our distribution (I think from
https://github.com/CPFL/drm/blob/master/tests/proptest/proptest.c). I
notice that when I change the value of the property from userspace,
even though the drm_connector_state->privacy_screen_status gets
updated and reflects the change, the encoder->update_pipe() is not
getting called. Just wanted to ask if this is expected since you seem
to imply this update_pipe() might *not* get called if there *is* a
full modeset? (What is the hook that gets called for a full modeset
where i915 driver should commit this property change to the hardware?)

Thanks & Best Regards,

Rajat


>
> Ville, anything I missed?
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
