Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC2E489C43
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 16:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8910E67F;
	Mon, 10 Jan 2022 15:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D4F10E67F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 15:35:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u21so32537252edd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 07:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rdTgBG3kZyz0k3JIYUMXYFVRX/phoQToB19ld1SM7P4=;
 b=THet/eJXVlBTej2P8+hHk/6ga2sZ2Tma8tuzogiDp9T8Bd4UUiLyiJLowCh7omAK/6
 4YDdRA/SrdVuzvRwVpldBbliTyfRL6QnyaUAyMxVDJI8xLoFVntcuVHRaRJkYxkbKqo4
 8u1uI48Ax9YeO+AnTVRfdVnGtDM1fCMifOSwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rdTgBG3kZyz0k3JIYUMXYFVRX/phoQToB19ld1SM7P4=;
 b=Ton/ATUC9ap7hLIfetLMV8l64CpEXtgUxX+5mVkYamsATVTQIubbYcNMkqpuliwLbK
 fPFDW9IRN70DIcapV1/kAwIz08l6rusEZ54OvCcC22c8GBkQzmRj/kk+WhzMzHfrKfvd
 e3fb6+VHifPZazrnaRg9nAR9Je2hHlrzPw1sf6OIKPV1fwM/K9sSaIIq2/kI8NExlqM7
 owwSLJOrNUFADyFyKvLU0tpFFTB+MwlJiYldZ+xwKCMUwZX5m1pYcMTiPZNV+vN/mJSa
 TxT7iZri1BaE71d68EhrT4+f6hQuVmHM3qNMuVb6Xj3A38624qvxmlHe6OMxAu5AN9tC
 MreQ==
X-Gm-Message-State: AOAM5336nYKx8qWtd3G514AbtOxJu6x8p+26j7oHmOw4KPpEpS0S8WT5
 7407x/oqGsm3rb8N7BVhJY88T9KbySpPOKF181d4OA==
X-Google-Smtp-Source: ABdhPJxpbwMxn8i0mDhl7IEBRf6cevBVAwimipQimI46BYzk2xcAUheTDkQD6Eoj0AR9Pp/9jsMXGPlgzeUkrXdfrwc=
X-Received: by 2002:a05:6402:5190:: with SMTP id
 q16mr184753edd.157.1641828910164; 
 Mon, 10 Jan 2022 07:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <CGME20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599@eucas1p1.samsung.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
 <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
 <CAMty3ZArYY5ECD5AWZiNa8pYn16ziWi=S-39o3VuTXGA1eN1DQ@mail.gmail.com>
 <CAMty3ZA_UsvmTprozT+MgfZ4Q4LthSk340rV_0YwcmTy1Vyk4w@mail.gmail.com>
 <CAMty3ZBp7_JFvsBcQTpRMBYS7oWcT0TagUW2uQRGMuaakzF+cQ@mail.gmail.com>
 <1a195d36-3ac0-389e-442f-ebeb7f85ab40@samsung.com>
 <45de6555-7407-5f48-247b-4d093eb17fe2@samsung.com>
 <CAMty3ZCCT-ecR1LLecsixbt4Hd26zi_nqZ-1GJH7Wji91XT-tQ@mail.gmail.com>
 <CAG3jFyty+tdcm--gTHyXbmeQFx0btF0X-orD3HV0keC43FLfow@mail.gmail.com>
In-Reply-To: <CAG3jFyty+tdcm--gTHyXbmeQFx0btF0X-orD3HV0keC43FLfow@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 10 Jan 2022 21:04:59 +0530
Message-ID: <CAMty3ZAti1MRDmks476R8+-moM9138oa=OBftH2R3QDrAOG+MA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

On Mon, Jan 10, 2022 at 9:02 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Jagan,
>
> This is a mistake on my end, I must have been looking at reviewing
> this series and then accidentally included it with another batch of
> patches. Thank you for catching this.

Thanks for the response.

>
> I would suggest reverting these two patches[1][2]. Is that ok with you?

May be I will revert 1/2. but 2/2 is valid. Please let me know, if you
have any concerns on reverting 1/2.

Thanks,
Jagan.
