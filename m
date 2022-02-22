Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385074C0583
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 00:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB6610E158;
	Tue, 22 Feb 2022 23:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FC510E158
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 23:47:42 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p14so47616146ejf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 15:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0F77fbIU1LkyDEiRwNiDPK4+9RtifiKKhYt8ZyZykg=;
 b=OtP7IFPifLHaL18s430w4QMwCl8fqgUQZF6vITBFV0Y2ISfFMWayXI1UbC79Swbr2q
 Y9zB2Loo9QWTHv3XZEzrZbb6fTeRpW+NDy5LYOzubMU09FjBJzlWv470tLJLosmvvlH8
 oaWdtvbT3xjZun9F1YAretW7g5VOMCyfIEbF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0F77fbIU1LkyDEiRwNiDPK4+9RtifiKKhYt8ZyZykg=;
 b=RIzHVp1aVkh67O1XY46MyQSeIRPco6aT0Rvu8Xk2seJqLa4Z4yaDPgVJIPVlm95fru
 41SBfT/fRYa4Ie9vFW5NkZtxUCKy+ATkQY/0IFoXEK3SfYxTVFxa7+Fc2fTXO/LdIliR
 l8s4zVbeL3S0kBCwbj54i0t1xQ+QEcP+R3eVfv5R/jz9VBanKzSdO+gF4lNveG/D/yg/
 5UFAy8LV/LZuQIbyDOfMCAGurMrIOx6SOvTs5A+E+VSqhiXPZI3t5WTl4yO0ExM0vU4v
 VhELmU5VuunigzsX5JgtpKKRDjNLQ+KgtuYN39Q5nqe0r8Tsner0Ts+mwczKo0iuT831
 WJCg==
X-Gm-Message-State: AOAM532dDks8RTkfye43CVStOVR/aoPOUULDsYR0tzV7odejYFRzybcu
 u+RdvY2FyJpDvPbZBXl7kD0SPcx6YcawWObALNY=
X-Google-Smtp-Source: ABdhPJyhA9E+ms79XoENx5uvuR98h5C1jUoOO+bVdNNwc8XvwJVmcVF/B+KF7nc5aKcNvocPRh1tgg==
X-Received: by 2002:a17:906:2ed1:b0:6b6:bb09:178c with SMTP id
 s17-20020a1709062ed100b006b6bb09178cmr21209609eji.382.1645573661043; 
 Tue, 22 Feb 2022 15:47:41 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id b19sm7320705edd.91.2022.02.22.15.47.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 15:47:40 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id d28so8682018wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 15:47:39 -0800 (PST)
X-Received: by 2002:a5d:64ea:0:b0:1ea:8148:6b97 with SMTP id
 g10-20020a5d64ea000000b001ea81486b97mr4917201wri.679.1645573659282; Tue, 22
 Feb 2022 15:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
 <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
 <e6670fd7-1f75-56f7-b668-20db9902cac6@intel.com>
 <CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com>
 <87ee435fjs.fsf@intel.com> <ce339fc7-b6bf-b19a-be10-54ee86487b96@redhat.com>
In-Reply-To: <ce339fc7-b6bf-b19a-be10-54ee86487b96@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 15:47:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VRa5DKUpGru9_0sOUXB1y_BZ2rd6uwToRYnx6a_TNRcw@mail.gmail.com>
Message-ID: <CAD=FV=VRa5DKUpGru9_0sOUXB1y_BZ2rd6uwToRYnx6a_TNRcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: Plumb debugfs_init through to panels
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, jjsu@chromium.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, lschyi@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 16, 2022 at 1:36 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 2/16/22 10:25, Jani Nikula wrote:
>
> [snip]
>
> >>
> >> I actually wrote said follow-up patches and they were ready to go, but
> >> when I was trying to come up with the right "Fixes" tag I found commit
> >> b792e64021ec ("drm: no need to check return value of debugfs_create
> >> functions"). So what's being requested is nearly the opposite of what
> >> Greg did there.
> >>
> >> I thought about perhaps only checking for directories but even that
> >> type of check was removed by Greg's patch. Further checking shows that
> >> start_creating() actually has:
> >>
> >> if (IS_ERR(parent))
> >>   return parent;
> >>
> >> ...so I guess that explains why it's fine to skip the check even for parents?
> >>
> >> Sure enough I confirmed that if I pass `ERR_PTR(-EINVAL)` as the root
> >> for `panel->funcs->debugfs_init()` that nothing bad seems to happen...
> >
> > Yeah, the idea is that you don't need to check for debugfs function
> > return values and you can safely pass error pointers to debugfs
> > functions. The worst that can happen is you don't get the debugfs, but
> > hey, it's debugfs so you shouldn't fail anything else because of that
> > anyway.
> >
>
> Thanks a lot Doug and Jani for the explanations. That makes sense and it
> explains why most code I looked was not checking for the return value.
>
> I guess we should write something about this in the debugfs functions
> kernel doc so it's mentioned explicitly and people don't have to guess.

For anyone interested, I've taken Javier's suggestion and tried to
update the docs:

https://lore.kernel.org/r/20220222154555.1.I26d364db7a007f8995e8f0dac978673bc8e9f5e2@changeid
