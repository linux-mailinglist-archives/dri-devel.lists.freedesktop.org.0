Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066DB180A6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 13:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2145C10E833;
	Fri,  1 Aug 2025 11:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="a/DsAYXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E6710E833
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 11:05:11 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-73e58d51060so385434a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 04:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754046311; x=1754651111;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+jMRUVcZ6t8Pl8l4LNW+ajilhtOkPFN+4QMcHsiT+g=;
 b=a/DsAYXYqDav6ReMG+INudwdtHk9Oqi1bccOFf+1WOWQE+jUmUtQ6QCwpKEv+8JGx8
 b5AHDCUbogQ1plsIN10qv1HLbU1a9huWlyNFU3I5Kve5wgdWbQUAp3nvtIp44J71BnqK
 FG7RyfPc1Q5yQZs7XRXNi/E4gc53OgQGCGbsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754046311; x=1754651111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+jMRUVcZ6t8Pl8l4LNW+ajilhtOkPFN+4QMcHsiT+g=;
 b=GvjL0huIIHGqNqHiqf4Y8Bijot8tGhC0mBDjObiKaf7FNntL/3BCZJUEisAtxznW3J
 i+joA+PCdoenp5z0313XsFoFSNT14dGInNPuIJiLX28O7zy6O0qjXbIyhC+a0HjZd8f3
 vxuDfQ1aNuRXXYkv43U6Ostezfwmiv3op6JtSA9a8AC41LGaGj1Nn7aUktrs2L8sM45X
 Nfyrv8ZGdFcOkr4CBJFqPJzS4mehONpPwcr9+RwK8PbEv4JFA6xGUXnwppU6IXVAda/y
 2wLJkertvi2ZQZTjX+JCN0jyN0WFMU+qoHF8MGbXHBVvqr5uf6YTp+7mlaFh0zf2CrMS
 Hm2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4G8RXSkjL4aiZtoAJHt9RHZKgvFKDNGgyfBb+vJWTHR28+RC8VgfJw4EHu3TuhS9iJwYk3xywI1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8vHxDEenaNwIbJ2XMHiqpEfb8dyBdrcMDLQVRECGp5H4mK5Ua
 J5zrYuTldVTj9Jaxhe/kMwmScJZUFcXu2hLTNGT/+D3D5E1rYy5ym9mSspP1d6+yguLgCqgXjCI
 L1qXyQ9Zt9uQGQXgGOHXBq7wET1oCZ/PNkiGumTt7
X-Gm-Gg: ASbGncvfHXZOwdAqXOmaENEa/+bb/KU2XRaXKLpllYDMUAShRBHOoz4RLFwYNlhJvLU
 Z10lOrvaTSVCV59xkMrS3KXResvbKnyBcfWq5KmxyVVTkXNgRygiZR5SLLDHZ2oG+YRoAVLp40Z
 pdcYLvJ/JeQc8Byt1H8IRmHKapKnNB1MdyeU7nNw9uXitR5SXSvO+jzKzzPXzzAoVXYT+R+jzyv
 l2zeqjvu5RBGZXl39PA7mxUWuIsqHA30JSW/ICvkjL2AA==
X-Google-Smtp-Source: AGHT+IFcu23cfo1L+r2ndOaJ6tIGjp3L6Og5YNOYpWEWiKowVEeAG4TrrXquLF+MqSuI+nCk5jD+RBvLEHmkGlbWWB8=
X-Received: by 2002:a05:6830:3987:b0:73e:9293:554b with SMTP id
 46e09a7af769-74177aadc6fmr7049993a34.12.1754046310929; Fri, 01 Aug 2025
 04:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250731101344.2761757-1-treapking@google.com>
 <1519a7c3872a59b7b5f12e99529237035499bc26@intel.com>
 <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 1 Aug 2025 19:04:59 +0800
X-Gm-Features: Ac12FXz59Gv-xeWJuJdY52SRDvtajWsArQQuLuzom-4gp2vT2ns_QxyRWnAtOXk
Message-ID: <CAEXTbpcPxpbtwy70uGxMcwsTcjpTqEX3EBZUyMg-6k5ULE1PmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Doug Anderson <dianders@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Chen-Yu Tsai <wenst@chromium.org>, Pin-Yen Lin <treapking@google.com>
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

Hi Doug and Jani,

Thanks for the review.

On Fri, Aug 1, 2025 at 12:38=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Jul 31, 2025 at 3:31=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Thu, 31 Jul 2025, Pin-Yen Lin <treapking@chromium.org> wrote:
> > > Some touch controllers have to be powered on after the panel's backli=
ght
> > > is enabled. To support these controllers, introduce after_panel_enabl=
ed
> > > flag to the panel follower and power on the device after the panel an=
d
> > > its backlight are enabled.
> >
> > I think it's *very* confusing and error prone to call follower hooks at
> > different places depending on a flag. The hook names and documentation
> > say *when* they get called, and that should not change.
> >
> > I think the right approach would be to add .panel_enabled and
> > .panel_disabling hooks to struct drm_panel_follower_funcs, and have the=
m
> > called after panel (and backlight) have been enabled and before panel
> > (and backlight) are disabled, respectively.
> >
> > In i2c-hid-core.c, you'd then have two copies of struct
> > drm_panel_follower_funcs, and use one or the other depending on the
> > quirk. You can even reuse the functions.
> >
> > I think overall it'll be be more consistent, more flexible, and probabl=
y
> > fewer lines of code too.

I was thinking that we probably will never have a device that needs to
register both .panel_prepared() and .panel_enabled(), so I implemented
it like this. I'll update this in the next version.

I'll also fix the s-o-b line. Apparently I've messed up with my local
git setting.
>
> Yes, exactly what Jani said. We've wanted to do this before, but I
> just never got around to it. There's even a (public) bug for it in the
> Google bug tracker and I've just assigned it to you. :-P
>
> https://issuetracker.google.com/305780363

So my series is not a new idea :P
>
> -Doug


Regards,
Pin-yen
