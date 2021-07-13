Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D943C76F0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 21:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B2289C63;
	Tue, 13 Jul 2021 19:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B836E89C63
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 19:26:16 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e20so31612554ljn.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AbX9Xu9c06giO/U+v639pJu8KA6hGm26Zdj5YP+EUss=;
 b=wJkZmqOLp3rfXdWR0LRg0m1k77k9osElwcslBYsP5olnnrFdbmizZCuiAyJGUbNDrj
 RhP1BkAqsytHhIRPh1S2nuT2JzNd9vOolTErTK/OtfRAD3coj7OqigabzAQgL1vWLCnU
 2j4EBRkGHXIMGhgGfbtH1wK1GumCaRRLyLZKm6mqbRR7ky4VeP5tM9K1Q0/OuImTzIEZ
 Pi4I0sF+5FyuE0HP9tGRK4aUGl3m1Xd4IGaVgNbvlI4PWkh0UnE65BP39sJRy8lH8Nrq
 k2wUNGjLxwwVJsGXQJRcg5t0GovPby8hSzWzHuEArLCOl1tDO2RxyBlwERWmMOuBsIO+
 KIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AbX9Xu9c06giO/U+v639pJu8KA6hGm26Zdj5YP+EUss=;
 b=R7V8gghQkNM754NQTHSF4AaBpOt00DQgo2J+/FwNHER2PhBCtHOBKDjE4ewGVBd51q
 M4w4F0KeesGADb8KPKXqheXm4Cv45/tDEm7m6CAkjOMpDp6UE3yDDrKNWLawE3BoE/9G
 6d97F873nGuRhN7w7fYS6pVmt66pm1VyD2voeaH5tTbO19cs1iFdNQTEgFLnH/BxNJ0i
 27C712GEqyuWS+g/fqZasnaOOztQ1X7AktIdcIA9iLNxECjv9yK0TDJmqwVqWSvVaJng
 3oaGXorNuQylgzTfv2XRY7FTNOr9J4RlE2y8W6B2uuX1tn7Y48nMOPoxCs9w/0lKiIGW
 hQQA==
X-Gm-Message-State: AOAM531MSMhfFMQxD0k31TH2M04wGbrvpKU/gCXFPzADD7OEJPbn9ct2
 gUIxG2lWQ4ThdqCARQmjvmcGLoWLQczSCAxMk2pIDw==
X-Google-Smtp-Source: ABdhPJwazSjMBKSD1KsMMqLDNHfhs748K2fCEmgqZmF3JvX9SK0I+hv55CRW5kFDjp5Stk4bfpPF2SoviRNY7ckKzGI=
X-Received: by 2002:a2e:8909:: with SMTP id d9mr5534574lji.65.1626204374759;
 Tue, 13 Jul 2021 12:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
 <0D708B40-20DB-4D5C-BFAD-74A30D5DE477@getmailspring.com>
In-Reply-To: <0D708B40-20DB-4D5C-BFAD-74A30D5DE477@getmailspring.com>
From: Rajat Jain <rajatja@google.com>
Date: Tue, 13 Jul 2021 12:25:33 -0700
Message-ID: <CACK8Z6FPsywe49fP=5pVc5DFm--4xt0daYLDzpbujA1_qoK7Dg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector
 properties
To: Marco Trevisan <marco.trevisan@canonical.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mark Gross <mgross@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sebastien Bacher <seb128@ubuntu.com>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans, Marco, et al,

On Tue, Apr 27, 2021 at 10:03 AM Marco Trevisan
<marco.trevisan@canonical.com> wrote:
>
> Hi,
>
> >>> There now is GNOME userspace code using the new properties:
> >>> https://hackmd.io/@3v1n0/rkyIy3BOw
> >>
> >> Thanks for working on this.
> >>
> >> Can these patches be submitted as merge requests against the upstream
> >> projects? It would be nice to get some feedback from the maintainers,
> >> and be able to easily leave some comments there as well.
>
> FYI, I've discussed with other uptream developers about these while
> doing them, and afterwards on how to improve them.
>
> > I guess Marco was waiting for the kernel bits too land before
> > submitting these,
> > but I agree that it would probably be good to have these submitted
> > now, we
> > can mark them as WIP to avoid them getting merged before the kernel side
> > is finalized.
>
> I'll submit them in the next days once I'm done with the refactor I've
> in mind, and will notify the list.

Any updates on the privacy-screen patchset? Can Hans' patchset be
accepted upstream now?

Thanks,

Rajat

>
> And for sure we can keep them in WIP till the final bits aren't completed.
>
> Cheers
