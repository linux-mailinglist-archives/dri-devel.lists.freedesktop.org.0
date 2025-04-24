Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66270A9B49B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 18:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68BC10E450;
	Thu, 24 Apr 2025 16:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V3G7/Qnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BFA10E450
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 16:51:37 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-707d3c12574so11387747b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745513496; x=1746118296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rhOPT0e1r3Giz9fOG9P4UwNB4Pxq9ccasHzycgLN8t4=;
 b=V3G7/Qnlql/lagwefD4Qy6SQF1p2FCkTCQx+uO+fCU5b0lb4+YtKMFBhtI3Xp8bK0l
 ods8Sv3VFOyuprFnGJ/lG2faLlfRvjFEuZnAQf6JjLUVIVh560eFk8sSrwwLX5BC52hl
 8ezSdLQD8pba2KliEDY9OuzUyQP8DwnEWnYU+hBXwMdm8A/XdiQRqfcieOHGEtv+rRIc
 dX6KimSIz858tT6sHIzd17EDwFIHH4bxlWFdJAQedCxbyM6180mPG3yLpUteGEHxRiSc
 UAeQ1IZZmaI6XbIQ1XYiD+G3K437iay4UgQV8fAbT15fkXZkpk3iPKflSPUbXhtvpqQe
 SF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745513496; x=1746118296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhOPT0e1r3Giz9fOG9P4UwNB4Pxq9ccasHzycgLN8t4=;
 b=uj6DRYtckIO6hvyG4/kBuyLH5ZXmZlTFPZVN3TkchRLOxHhd5+0uYmkToZdw9EyJR+
 olpEyxtqPsEKTrkbUOo2pPPdEXeLyjeWYlqCSiS8+sTlip7zeH/WkCPOVQTr9JiLXHNQ
 yDjXJA4+dmjoOW6JXnOiGLTM5GcEBvOXONzaXXGe6xUl5lyx54tsK3wYDGaO4UvBQCOr
 fVtLK+ikI7AyNbELkz9FwnMJq4ti375htRIA80r1fxeiyJIHAhKCYotZw+zYVveM6/nU
 HQJ/qr2gwWbJ+6nJVDXNfgPHi5u5nPnbO9yHrKqS1fw21YrqEzfs9QAyMdBX7FC6p7YO
 eUQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6wrci6oJ/Lj2SM3HsIqJLApBMwzKTxDfE/SXFnNk1qNkcnDbVfTeLWzX7FYffXpRv0CL6HkFRvl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqpJYgLQ3PaopEdVvZIO3U2yW8IUS5gvK2ETHwFZ2COoS8ooiJ
 T5iJan6mWNCbfOdjtAbBWFoDGbv2GLbDN0i+m7S0Bcm9Yo5Im+GTqfFeXRQZhf71xEZsq5zl28a
 Tk83P8NoPFttpsDX56sD8BXs4MdBxkakwJpWPrg==
X-Gm-Gg: ASbGncutc6xTPYRFaSMhARON1OHWl7oXb7NP/7RWeBMfeILWdVrejfYItbuG+veSLQj
 Y9ycuaRtfsdv0hVjLB+X/6FqAWxi/djYxbfSeUe3o6InAr3fT0f1YslmJOHsraV8seRfchSGTAB
 SZjDtwHdISClArhmyzw9jP/q8=
X-Google-Smtp-Source: AGHT+IEEs5xpXrn/Gy6ZKVAC++BN0ySj3Ol6R2Q7H49jw3nb/AVQ/nGqoQkOth8cQwpLnS19kr0sXiN3reDfdCQJutw=
X-Received: by 2002:a05:690c:112:b0:6fd:33a1:f4b with SMTP id
 00721157ae682-708418756dcmr40063507b3.4.1745513496489; Thu, 24 Apr 2025
 09:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
 <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
 <b9c4182d-38c2-4173-a35a-0e1773c8f2ed@samsung.com>
 <CAJZ5v0gE0anjW_mDSwNXY8xoZ_0=bDDxiSbUq1GP7-NycDojrQ@mail.gmail.com>
 <cbf20469-02ab-403a-8db7-2b66e9936b4f@samsung.com>
In-Reply-To: <cbf20469-02ab-403a-8db7-2b66e9936b4f@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:51:00 +0200
X-Gm-Features: ATxdqUENtu5F1LST4-s_k9n76eHWAuQ6u_ynqkGko5ZMfaiEw5aNABhT-1bG-Qs
Message-ID: <CAPDyKFqND2JrH8nLUzAqwWgHkwia6M9XOJoY6AqxtR0t120JUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed
 flag
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
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

+ Stephen

On Thu, 17 Apr 2025 at 18:19, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 4/16/25 16:48, Rafael J. Wysocki wrote:
> > On Wed, Apr 16, 2025 at 3:32=E2=80=AFPM Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> On 4/15/25 18:42, Rafael J. Wysocki wrote:
> >>> On Mon, Apr 14, 2025 at 8:53=E2=80=AFPM Michal Wilczynski
> >>> <m.wilczynski@samsung.com> wrote:
> >>>>
> >>>> Introduce a new dev_pm_info flag - platform_resources_managed, to
> >>>> indicate whether platform PM resources such as clocks or resets are
> >>>> managed externally (e.g. by a generic power domain driver) instead o=
f
> >>>> directly by the consumer device driver.
> >>>
> >>> I think that this is genpd-specific and so I don't think it belongs i=
n
> >>> struct dev_pm_info.
> >>>
> >>> There is dev->power.subsys_data->domain_data, why not use it for this=
?
> >>
> >> Hi Rafael,
> >>
> >> Thanks for the feedback.
> >>
> >> You're right =E2=80=94 this behavior is specific to genpd, so embeddin=
g the flag
> >> directly in struct dev_pm_info may not be the best choice. Using
> >> dev->power.subsys_data->domain_data makes more sense and avoids bloati=
ng
> >> the core PM structure.
> >>
> >>>
> >>> Also, it should be documented way more comprehensively IMV.
> >>>
> >>> Who is supposed to set it and when?  What does it mean when it is set=
?
> >>
> >> To clarify the intended usage, I would propose adding the following
> >> explanation to the commit message:
> >>
> >> "This flag is intended to be set by a generic PM domain driver (e.g.,
> >> from within its attach_dev callback) to indicate that it will manage
> >> platform specific runtime power management resources =E2=80=94 such as=
 clocks
> >> and resets =E2=80=94 on behalf of the consumer device. This implies a =
delegation
> >> of runtime PM control to the PM domain, typically implemented through
> >> its start and stop callbacks.
> >>
> >> When this flag is set, the consumer driver (e.g., drm/imagination) can
> >> check it and skip managing such resources in its runtime PM callbacks
> >> (runtime_suspend, runtime_resume), avoiding conflicts or redundant
> >> operations."
> >
> > This sounds good and I would also put it into a code comment somewhere.
> >
> > I guess you'll need helpers for setting and testing this flag, so
> > their kerneldoc comments can be used for that.
> >
> >> This could also be included as a code comment near the flag definition
> >> if you think that=E2=80=99s appropriate.
> >>
> >> Also, as discussed earlier with Maxime and Matt [1], this is not about
> >> full "resource ownership," but more about delegating runtime control o=
f
> >> PM resources like clocks/resets to the genpd. That nuance may be worth
> >> reflecting in the flag name as well, I would rename it to let's say
> >> 'runtime_pm_platform_res_delegated', or more concise
> >> 'runtime_pm_delegated'.
> >
> > Or just "rpm_delegated" I suppose.
> >
> > But if the genpd driver is going to set that flag, it will rather mean
> > that this driver will now control the resources in question, so the
> > driver should not attempt to manipulate them directly.  Is my
> > understanding correct?
>
> Yes, your understanding is correct =E2=80=94 with one minor clarification=
.
>
> When the genpd driver sets the flag, it indicates that it will take over
> control of the relevant PM resources in the context of runtime PM, i.e.,
> via its start() and stop() callbacks. As a result, the device driver
> should not manipulate those resources from within its RUNTIME_PM_OPS
> (e.g., runtime_suspend, runtime_resume) to avoid conflicts.
>
> However, outside of the runtime PM callbacks, the consumer device driver
> may still access or use those resources if needed e.g for devfreq.
>
> >
> > Assuming that it is correct, how is the device driver going to know
> > which resources in particular are now controlled by the genpd driver?
>
> Good question =E2=80=94 to allow finer-grained control, we could replace =
the
> current single boolean flag with a u32 bitmask field. Each bit would
> correspond to a specific category of platform managed resources. For
> example:
>
> #define RPM_TAKEOVER_CLK        BIT(0)
> #define RPM_TAKEOVER_RESET      BIT(1)
>
> This would allow a PM domain driver to selectively declare which
> resources it is taking over and let the consumer driver query only the
> relevant parts.

Assuming we are targeting device specific resources for runtime PM;
why would we want the driver to be responsible for some resources and
the genpd provider for some others? I would assume we want to handle
all these RPM-resources from the genpd provider, if/when possible,
right?

The tricky part though (maybe Stephen had some ideas in his talk [a]
at OSS), is to teach the genpd provider about what resources it should
handle. In principle the genpd provider will need some kind of device
specific knowledge, perhaps based on the device's compatible-string
and description in DT.

My point is, using a bitmask doesn't scale as it would end up having
one bit for each clock (a device may have multiple clocks), regulator,
pinctrl, phy, etc. In principle, reflecting the description in DT.

>
> >
> > Also "rpm_takeover" may be a better name for the flag in that case.
>
> Sounds good, bitmask could also be named like that
>
> >
> >> [1] - https://lore.kernel.org/all/a3142259-1c72-45b9-b148-5e5e6bef87f9=
@samsung.com/
> >>
> >>>
> >>>> This flag enables device drivers to cooperate with SoC-specific PM
> >>>> domains by conditionally skipping management of clocks and resets wh=
en
> >>>> the platform owns them.
> >>>>
> >>>> This idea was discussed on the mailing list [1].
> >>>>
> >>>> [1] - https://lore.kernel.org/all/CAPDyKFq=3DBF5f2i_Sr1cmVqtVAMgr=3D=
0FqsksL7RHZLKn++y0uwg@mail.gmail.com/
> >>>>
> >>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >>>> ---
> >>>>  include/linux/device.h | 11 +++++++++++
> >>>>  include/linux/pm.h     |  1 +
> >>>>  2 files changed, 12 insertions(+)
> >>>>
> >>>> diff --git a/include/linux/device.h b/include/linux/device.h
> >>>> index 79e49fe494b7c4c70d902886db63c4cfe5b4de4f..3e7a36dd874cfb6b98e2=
451c7a876989aa9f1913 100644
> >>>> --- a/include/linux/device.h
> >>>> +++ b/include/linux/device.h
> >>>> @@ -881,6 +881,17 @@ static inline bool device_async_suspend_enabled=
(struct device *dev)
> >>>>         return !!dev->power.async_suspend;
> >>>>  }
> >>>>
> >>>> +static inline bool device_platform_resources_pm_managed(struct devi=
ce *dev)
> >>>
> >>> Could this function name be shorter?
> >>
> >> Maybe:
> >>
> >> static inline bool dev_is_runtime_pm_delegated(struct device *dev);
> >> static inline void dev_set_runtime_pm_delegated(struct device *dev, bo=
ol val);
> >
> > What about
> >
> > dev_pm_genpd_rpm_delegated()
> > dev_pm_genpd_set_rpm_delegated()
> >
> > respectively (or analogously with the "takeover" variant)?
>
> Right sounds good, so if you also like a bitmask idea they could look
> like this:
>
> static inline bool dev_pm_genpd_rpm_takeover(struct device *dev, u32 flag=
s);
> static inline void dev_pm_genpd_set_rpm_takeover(struct device *dev, u32 =
flags);

These names sound fine to me. Although, as stated, I am not sure how
useful the 'flags' would really be.

>
> Regards,
> Micha=C5=82
>
> >

[a] - https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-man=
agement-driver-stephen-boyd-google
