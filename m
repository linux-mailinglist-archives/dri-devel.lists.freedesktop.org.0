Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40CE61FF71
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 21:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537BC10E441;
	Mon,  7 Nov 2022 20:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29D510E441
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 20:18:34 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id a27so7555339qtw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 12:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NhhjPI8PeKyeQTLHpd35qfaAH6UqB+dSFDo9Mc6Wxkw=;
 b=mIXKOpX5fM3HKKeOe493jDQzWp5+uLEewv3FgLRoOMLOB0cb+gILRzKR4sNN7USvTY
 CPmBTY8MZUUeZItAf24N+CY4tuvRP+cF2f2DdNuu1YaQBZ5RneyXJMXB7kIAmdQokGAn
 8uQ65uDwe2SALzNfqJNYiA1Qc4kJkzkZI2R4FqjijZIbBVKxc0gW9EpppldIQ1RGmqhQ
 Fq2AQYevgCzTcsjZTs4AWCarga+hiCH/ek5Ad4sCkvoFckm9MIvqOGPz2LJac3zvs5MI
 ntCF5cUIAFJGjXQ85bT/8GRpM+3tZoKQDg2BYFVVwOKPB3MNN2uCtOQTWGdX4XvQcU73
 Mg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NhhjPI8PeKyeQTLHpd35qfaAH6UqB+dSFDo9Mc6Wxkw=;
 b=64qbnU1teaqIuFpBlWX10vfCY3PjuevXT/EZt6Az/ARiXyCvevELEx3dROHR81Uid5
 vfu2PGXvV/FpLpsiO4GBiD8M9AlrUS9V+ZVnHV9BFdD8466iKF14j7dQ4s8Gnj64UgUY
 +KGxbnx6hvWSC4w0cTCQD6ry7CoJkU4/pxM61sa4hMKcDP/3yAiUdD2YDqyshx3zaEvL
 I8dIP3Tt3tfoJFAaJPlmLLyCLcyE2YrW/an6LAZlZ3dUFfMoKnVKR3w1DWM4bFih4Uzs
 BBzpuZjtHFn90eDF8vpIcjfOYDNxxHZHiNjsRzWHJWjBHN0oZSftmQiLaa8NmeTsRrGJ
 cf6w==
X-Gm-Message-State: ANoB5pmawxJ2enBBuBOZIRlMCDm2IttwLvrYAxyTe7s0D3F/4EuiEnrD
 3vLCyLgY61HAFnrDJjgjvi9ty0NDPq/QJkbfr0U=
X-Google-Smtp-Source: AA0mqf7jOU63BklyhiJ1pUeKEtHV4hBzufzAPnYS2tHwuQ4GGbGmAjvVk/B4zJOlJvMXb8FwUwvp2AUuo1DiMMpqHMs=
X-Received: by 2002:a05:622a:1c1:b0:3a5:8416:690d with SMTP id
 t1-20020a05622a01c100b003a58416690dmr6991039qtw.61.1667852313679; Mon, 07 Nov
 2022 12:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
In-Reply-To: <Y2kDzPswkKyZyRpS@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Nov 2022 06:18:21 +1000
Message-ID: <CAPM=9tyP6mfEDzZ9wUdJc_0YTNk2HyvB62qF74ZkiYfdOx3opw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 stanislaw.gruszka@intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Nov 2022 at 23:10, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> > I don't agree with your statement that it should be "a layer over top of DRM".
> > Anything on top of DRM is a device driver.
> > Accel is not a device driver, it is a new type of drm minor / drm driver.
>
> Yeah, I still think this is not the right way, you are getting almost
> nothing from DRM and making everything more complicated in the
> process.

You are looking at the small picture that is these patches, there are
just infrastructure to start the process of merging drivers and
reusing other parts of the drm code.

We aren't going to ever get anywhere if we start splitting code out of
drm just in case, we get this stuff rolling in the tree and if we have
a pressing need to refactor it out into separate libraries later then
we can address that from a more educated place, instead of just
throwing huge refactors around before we have any code to even use
them.
>
> IMHO this is much better, because accel has very little need of DRM to
> manage a struct device/cdev in the first place.

Right now it doesn't, but when drivers start leveraging the other code
it will reuse a lot more code.

I'm not going to spend too much time entertaining this, devm vs drmm
memory etc are real problems drm has already identified if not
completely solved.

Dave.
