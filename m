Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FC17F19F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED3D6E81F;
	Tue, 10 Mar 2020 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F446E5BD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 00:10:02 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j17so4788644lfe.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 17:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qgrrl/PIS4y9k8c+4r54kiLV+rLBtZ0nrsWDLZmeMn4=;
 b=MIynxTGDbmrJlCOvfmOik94Q8oGE0PsOjavcV+1d61XGYkRoLB1qrCJIi8VIhezGuR
 sMIhJZjGAfnmbCB/ldF9KkgTjYgL9aHpUWFKOH7MjRLCAakxN1pw5bsnfSC/v0H8kKsL
 zNhp/U/O8wx+lJ60wHTqEajE8uSFkfo4bulvlBhsjHmJOMQr7qLMz/wtXhQaWK2DgKs7
 ULYhtHP6mxfbf0vk1XeDO61EfEW/SECdbsUMxFJZIGLTTUBQBLPP8o3g+RGbJpNkkqAx
 RpL4g4roKcNrreA2utPOR8gust4fdB8coMyE/9t3o5dg3Xntr0bpe/Zfbrz50BSMk/yW
 RTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qgrrl/PIS4y9k8c+4r54kiLV+rLBtZ0nrsWDLZmeMn4=;
 b=FO6W6MXWPgstyMkVbrc1qjFEMD3s1VglgnxitHBEdSEvQxirNBgAuTBIulUbuxzNIs
 2HuEFeL9K3opJxLsx/g8RiQ6w68dxl0uAxyh0pLAy3ePuQTp9OqedoBpApP2Mo3NiUZw
 +rquCS28QEfbWkBnWDdLYG4kBqUxzJW6BxHeVj2qwGT0X0TyrS/jNoNY/HKW+YgYuelO
 IoBQJ9uaXXB4Vt91q+r4Qm0rBt15dMKV1T5Qz/1wPtqm8bgr+dekaP7/xrdBE/aWUQBB
 LB+kMMdD0y0e7d11YF4u4UBYN9ju07lqte2cOeQSLVSGPdjYE+MAAiPXeYqEAwS2Jyh7
 X8Jw==
X-Gm-Message-State: ANhLgQ0RpYAn++X76KfelMYeUrwr/GmYI+kGU4/idTTeNX70Et9tOfF1
 k91+1mo8CLzyka8g9thPdu+vOm5wVKEYp9WM8S4HDQ==
X-Google-Smtp-Source: ADFU+vt32UZtqnvEuXoVRdT8OyeT2tec9wmF5Ooht3N0fo2TBipeo6oX7FEFlDeeQ7mewl8OPgZY6Eb6w2C2DpYd0jY=
X-Received: by 2002:a05:6512:512:: with SMTP id
 o18mr10503227lfb.122.1583799000954; 
 Mon, 09 Mar 2020 17:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200305012338.219746-1-rajatja@google.com>
 <20200305012338.219746-3-rajatja@google.com>
 <87o8tbnnqa.fsf@intel.com>
 <CACK8Z6HRB9q1KeborGr7V-0Qp0AApHV6gBTkc6xD5NokH8gr0w@mail.gmail.com>
 <87tv31om53.fsf@intel.com>
 <CACK8Z6HFOpsfhHo=y9Qj_NSdiCGBHsvchZ335mU1BQ5CYQq1VQ@mail.gmail.com>
In-Reply-To: <CACK8Z6HFOpsfhHo=y9Qj_NSdiCGBHsvchZ335mU1BQ5CYQq1VQ@mail.gmail.com>
From: Rajat Jain <rajatja@google.com>
Date: Mon, 9 Mar 2020 17:09:23 -0700
Message-ID: <CACK8Z6FW3p6h1pfW2kPxiwBoDDcK3R76Aoxa-17P+MpU+w20hw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/i915: Lookup and attach ACPI device node for
 connectors
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
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

On Fri, Mar 6, 2020 at 5:38 PM Rajat Jain <rajatja@google.com> wrote:
>
> On Fri, Mar 6, 2020 at 1:42 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >
> > On Thu, 05 Mar 2020, Rajat Jain <rajatja@google.com> wrote:
> > > On Thu, Mar 5, 2020 at 1:41 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > >>
> > >> On Wed, 04 Mar 2020, Rajat Jain <rajatja@google.com> wrote:
> > >> 1) See if we can postpone creating and attaching properties to connector
> > >> ->late_register hook. (I didn't have the time to look into it yet, at
> > >> all.)
> > >
> > > Apparently not. The drm core doesn't like to add properties in
> > > late_register() callback. I just tried it and get this warning:
> >
> > I kind of had a feeling this would be the case, thanks for checking.
>
> Thinking about it again, it looks like there is a difference in
> creating a property and attaching a property. I'm wondering if drm
> would let me (unconditionally) create a property before registering,
> and attach it in late_register() only in case a privacy screen is
> detected. (If not present, I can destroy the property in
> late_register()). If this approach sound more promising, I can try it
> out.

I tried out this approach, and it worked. The new patchset is posted at:

https://patchwork.freedesktop.org/series/74473/#rev1

Thanks!

Rajat

>
> >
> > >> 2) Provide a way to populate connector->acpi_device_id and
> > >> connector->acpi_handle on a per-connector basis. At least the device id
> > >> remains constant for the lifetime of the drm_device
> > >
> > > Are you confirming that the connector->acpi_device_id remains constant
> > > for the lifetime of the drm_device, as calculated in
> > > intel_acpi_device_id_update()?  Even in the face of external displays
> > > (monitors) being connected and disconnected during the lifetime of the
> > > system? If so, then I think we can have a solution.
> >
> > First I thought so. Alas it does not hold for DP MST, where you can have
> > connectors added and removed dynamically. I think we could ensure they
> > stay the same for all other connectors though. I'm pretty sure this is
> > already the case; they get added/removed after all others.
> >
> > Another thought, from the ACPI perspective, I'm not sure the dynamically
> > added/removed DP MST connectors should even have acpi handles. But
> > again, tying all this together with ACPI stuff is not something I am an
> > expert on.
>
> I propose that we:
>
> 1) Maintain a display_index[] array within the drm_dev, and increment
> as connectors are added.
> 2) Initialize connector->acpi_device_id and and connector->acpi_handle
> while registering (one time per connector).
> 3) Remove the code to update acpi_device_id on every resume.
>
> It doesn't look like anyone on the DP MST side has cared for ACPI so
> far, so I doubt if we can do anything that might break MST currently.
> In other words, the above should not make things any worse for MST, if
> not better. For connectors other than MST, this should allow them to
> get ACPI handle and play with it, if they need.
>
> WDYT?
>
> Thanks,
>
> Rajat
>
> >
> > >> (why do we keep
> > >> updating it at every resume?!) but can we be sure ->acpi_handle does
> > >> too? (I don't really know my way around ACPI.)
> > >
> > > I don't understand why this was being updated on every resume in that
> > > case (this existed even before my patchset). I believe we do not need
> > > it. Yes, the ->acpi_handle will not change if the ->acpi_device_id
> > > does not change. I believe the way forward should then be to populate
> > > connector->acpi_device_id and connector->acpi_handle ONE TIME at the
> > > time of connector init (and not update it on every resume). Does this
> > > sound ok?
> >
> > If a DP MST connector gets removed, should the other ACPI display
> > indexes after that shift, or remain the same? I really don't know.
> >
> > BR,
> > Jani.
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
