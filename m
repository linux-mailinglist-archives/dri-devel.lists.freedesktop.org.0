Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85DC8D46B6
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F2510F533;
	Thu, 30 May 2024 08:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uHuyEpux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538810F51F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:08:06 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-df4dda88ce9so393921276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717056485; x=1717661285; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ea398ookltKnMcZe9XrXhw80TYHn5RUehEf25oaXTj0=;
 b=uHuyEpux2eD7fRwKQlW5BZ6lfcm3edePuirZPnUiy1Md6FWAAnLDIGfTagSaNhitDJ
 gZetgXAG5g4/xQuo7hZcFf/YQ9RvLLcoU1YPSeSgjfyNYiqudRyFm90mHx2+hbNcb098
 eJeo19OKDv73rqHwTtmwWF7X6qYZ8crRwR50srpClnk80vESjiBbqQDEGdZyTcXHljou
 86hdhgZhwtCY80sP6wtHvTiOeqq7WN6HDbu0tXjVYcL9KspCSDTkpY26FDumFLS9T2Pq
 scXmkTgYo4cWyEelpgS9txoYrAQaVd/6sVxwe5/H7AY42s1r9182pv51jQX7fz24hkV8
 QOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717056485; x=1717661285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ea398ookltKnMcZe9XrXhw80TYHn5RUehEf25oaXTj0=;
 b=CSbKwOEUATgcytPpMzpYGlRIOc6WI8l6M1/iAjsUTF79jWrjaoJkaOviPNDpJvDKm/
 /XY3vO2vyBQhJDqqAWPImlpYQXPkoj7CE9jDr1RD+6nltU0e4NAfa3oCAzoW6e5iGU/F
 7iUm2tu/2SxHjpflcdcOc8uI8xEr9ZUu0BqnZHzzzEzVWfvVVKL3KmYPigcHo3lXns9Q
 imjDBkVdGDEnQYpLp8Usqr42Bw1kVovjOy0kWS97Hl5epPWxwjHBMQRaTuXE2jGdtYsU
 c4wUb59aT8frkF/cQHzDWnuG0xXkbR8F2nej24hkC8eEH8pets277vMBVMG+N4SrnPJG
 sJMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSsZQWwEwe4K820vAykFUQwaflRyxyiVlUXBaOWIrYzLIMpYByr56UY4TdSGA0DdaQ245gXNs67iOe+c10F/2d7wLS2STrnB+2o/iHRVAk
X-Gm-Message-State: AOJu0YxFUMfGHjgiZVvZj5+XvF0xvq1Nm4kXQm/oMQVpJQuWqRrqGNIf
 6YWlgHyCZUdTU5W8QcsA0zL5QsvEh9sc9jUCfj2GH5OsZOdYTvoqHNV3xwdTajBgmwV28b6ZvFI
 QDShBJkxTnay/0JvThBKtFPqFIo06rXcRYvWOMQ==
X-Google-Smtp-Source: AGHT+IGz+ZsfJJB5VdBGOljgIkzRdHhgei+gaKgI65RBquJxbv4kncJ2bpBR1QliVBmCJF1PLzPJlIZVnBu5WHt6piI=
X-Received: by 2002:a25:ac92:0:b0:dca:c369:fac2 with SMTP id
 3f1490d57ef6-dfa5a5baeb4mr1629327276.3.1717056485217; Thu, 30 May 2024
 01:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com> <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
 <ZldMKZ1MzSDXOheJ@intel.com>
 <g34f3sdk22grheq2vaaonkl543dtk7nb5sffqgmkl5ywtj5skk@p5ht5ug33q4z>
 <873b7a7b-139d-498e-89da-098cb3d7599d@amd.com>
In-Reply-To: <873b7a7b-139d-498e-89da-098cb3d7599d@amd.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 11:07:53 +0300
Message-ID: <CAA8EJpqODpGX-RthQ8qu3oU80qXp8a-N1Chz-dcQXjKYoDfEgw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>, 
 hughsient@gmail.com, linux-input@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 May 2024 at 07:41, Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
>
> >> Also a direct acpi_lid_open() call seems a bit iffy. But I guess if
> >> someone needs this to work on non-ACPI system they get to figure out
> >> how to abstract it better. acpi_lid_open() does seem to return != 0
> >> when ACPI is not supported, so at least it would err on the side
> >> of enabling everything.
> >
> > Thanks. I was going to comment, but you got it first. I think a proper
> > implementation should check for SW_LID input device instead of simply
> > using acpi_lid_open(). This will handle the issue for other,
> > non-ACPI-based laptops.
> >
>
> Can you suggest how this would actually work?  AFAICT the only way to
> discover if input devices support SW_LID would be to iterate all the
> input devices in the kernel and look for whether ->swbit has SW_LID set.
>
> This then turns into a dependency problem of whether any myriad of
> drivers have started to report SW_LID.  It's also a state machine
> problem because other drivers can be unloaded at will.
>
> And then what do you if more than one sets SW_LID?

It might be easier to handle this in the input subsystem. For example
by using a refcount-like variable which handles all the LIDs and
counts if all of them are closed. Or if any of the LIDs is closed.

>
> IOW - a lot of complexity for a non-ACPI system.  Does such a problem
> exist in non-ACPI systems?

There are non-ACPI laptops. For example Chromebooks. Or Lenovo X13s,
Lenovo Yoga C630, Lenovo Flex5G, etc. We are expecting more to come in
the next few months. And I don't see why they won't have the same
problem.


-- 
With best wishes
Dmitry
