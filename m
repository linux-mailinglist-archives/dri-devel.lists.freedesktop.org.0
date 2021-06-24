Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C93B3828
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 22:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BE36E043;
	Thu, 24 Jun 2021 20:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A156E043
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:49:24 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id df12so10460157edb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1FoludG0zTCOWDoXA67etNwJJOSrZgn5xRhT3cfHusw=;
 b=DifrTcunILwhnLaiYLGwL98uWSNTHN/daKEPkumYY1vPF/eTK+gTgUidkOrl6d6FnZ
 5gTCrjvSnKprxkIa4znvfQ5YwiRyW56B2ZoGUy4/a1gMSvfzokAfgFGLUg1yhAj+Frmh
 AZ/6gUpV8V/5sMAWiiXzVwzsS7Qu4LeLqjoa5997q8car0KLT6yZYb5NvZ8nrZc/uQAD
 UVgHBh7POQSAqO/D5/KR4D3i9SfoAFKeSXV6H5+T0jo67UxQFBk6E3MYxaHVk4UG7fdh
 d+TBrl2mEXgOoc0jjBGaPeJj6szu/BbtTsRMbS5s7dX8lrn8z2M+G3oggNe7m2aJ/SQs
 ICMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1FoludG0zTCOWDoXA67etNwJJOSrZgn5xRhT3cfHusw=;
 b=BfmJr9TLEqyQjfIEUM9lN4ydzJej4LEpccA/dx1FrEe9rYh5K5gb05iSKae6c/N5QM
 qaaLHvaMk0VqB1FNGUkWHBesN0d3fDmJ4QGKojWY7CAXTXWGWHM4gsTFiHVSPjXjp16r
 yCwZ3AiUfE3c6620zR8m/Ykq6AZxg6MKCqCBwIa1g6IikjOat6gv78DSF1PFRgW6DZfO
 /9EWbU5h32diDn1K8tG3jg3R84dkRmnVmGCt6Wbu4IO9WWdA6fcqOF+91phPyVcsJMUR
 EpBlaiT97AoK5end3Lw3kq7WVBEWzuLMjsVUM3TdDZhaA6jOidrCN8UayIPRRcr12ZGV
 CS2g==
X-Gm-Message-State: AOAM5311EjtbnVWeVhjbpeOa0/pMkz3VZ5LL7zLUREupYt7ir5yotGyg
 7VrwCfrzZ0Zkxh9KMIJXZKM8tFye+qPm691Xo0nbZbOewWL1OA==
X-Google-Smtp-Source: ABdhPJxH18D90MOJWPzaPDNwTJP1U5mQXLsGxw8f8UpaJMncbPTAmBqnfbm0X79hlvfYT5Sjc5pgrHgUGltLSXHsYvE=
X-Received: by 2002:a05:6402:2210:: with SMTP id
 cq16mr9830057edb.261.1624567762799; 
 Thu, 24 Jun 2021 13:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-7-daniel.vetter@ffwll.ch>
 <20210624204500.612710-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210624204500.612710-1-daniel.vetter@ffwll.ch>
From: Emma Anholt <emma@anholt.net>
Date: Thu, 24 Jun 2021 13:49:11 -0700
Message-ID: <CADaigPWAXhKa6JNZ3yYmZ07UqC+rsKDihWFizXrnkXpvyqhfEA@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Move drm_sched_job_init to v3d_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 1:45 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Prep work for using the scheduler dependency handling. We need to call
> drm_sched_job_init earlier so we can use the new drm_sched_job_await*
> functions for dependency handling here.
>
> v2: Slightly better commit message and rebase to include the
> drm_sched_job_arm() call (Emma).
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Emma Anholt <emma@anholt.net>

OK, makes sense now.  r-b.
