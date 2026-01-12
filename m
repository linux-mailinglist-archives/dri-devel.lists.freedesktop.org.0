Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6BED112D6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BEB10E25E;
	Mon, 12 Jan 2026 08:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="CP8+jxNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B9310E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:22:03 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-382f9930e54so35906641fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 00:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768206122; x=1768810922; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsyXyJP6Y/3pXJrsSmemWHA6G4lKJakyXCrRJ0Arp2E=;
 b=CP8+jxNwFh+ZAvlLKJ/WLlkugDHaIOlOyBGZTIhCndSRmfyom2xcEtQcCSYAa2qZ+k
 uXxOAYAePtJV7fSEu9a8rnzEBEYM7NxNyWdrRnwo/sUKQJxAGWnWN6eMV70V7v1McvOf
 WXLs6ui8zt2OwxwOlU2hM5wd7Nh4iFwDBHwQ+kauzbHSGqcsyoLLK3A9/oQ2wK8opp6D
 3q8BpEtuOlr+aaZNi0O3Fv2zOY8V1Zc2eHfd+uzj1SnvYmvF5Io3dCGPp7B+YV9P7SyU
 uDyEed0Uhchq2o5MgZVboSkjjtfJUINSTO8ZsTzrQb5r8czRjffekphqjmnlczCI1iav
 2pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768206122; x=1768810922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XsyXyJP6Y/3pXJrsSmemWHA6G4lKJakyXCrRJ0Arp2E=;
 b=lx/2UY8vQZlN8DP4vDLeuS3Qhffn7Mk/zjBbuW7ctzWD5Udh0eCvQI42U28YymG3sD
 PNWa1n1oN5dRhrWsjsOswihG2BCR75JiXSEDJwltWkJtH10w9qrcDHp+xrBufixf1hli
 noD/7ZBOvAo1zfASY4aGmfjJC4Gb+2k+lXa5fUoSIYzAAQv8q0cnzb8OWoniiMbds8Hz
 aeMxTlj+H9qT6UEEIo+VMUIzKt9iT47F/sh2FUbqFhjLKRc5dC6Yjy4BDNny1bww4pz3
 cIe+/ps+237bOFcotL6EzgmLe2NnR85PYU1qJecGZNQHvL6Jk1YhQkGl9EBxnpZWn7Yo
 gSag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxK/KBW2yRRepDR0HDFj/e70ryy6jGcOXOCUkivguUKbzxC2nW6XQE3+cA/ZdCurALHL2XxcBFvuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlCS2lVu4CmxHLxPAyNJrlcoi3roi6VlvjPbiiSNKWuCtVDvr5
 1V/XERsWLBmSFKMH0gjz1Og3oyrVZcsDB9Kf+NGHhPiGGF3lWo6YccpGaVu5UDWdDB25HKInmpN
 1PPAd6ccsXgzyNzUQTH5AbJyl9gAucPm9vDPthWnbZg==
X-Gm-Gg: AY/fxX4MqdbU2iLynyqUEiOyEMlkjwu7dWO6VEin4HeIoi0wZo1MhbDNNBYI3blc1GT
 js/KOv/T2YLxVcyVe2GhAz6ox9mHlj0A60LYo2tKz5hW069nZPOzJVW//XZ+U0AaZzv4OOOui1S
 VoCVPxbQwFJdfz3vsdychaJQsGmvw85JhxQXkQMvp3o+EsN7cit8mtSk7HrttbglWa8r1UIoTYl
 6AQ5D9iixYrJCN0pc92X54vcYY7MIEC2VfD5gqx9fdvSqdcyXm1oekkw0TFIS12NF9aTccdwdSQ
 KBUasimoL14pi5tZ7OLGC3Nzd4mM
X-Google-Smtp-Source: AGHT+IFuACUf1fWUB9ZbsS9Sdz3QYI9+Xh93xr/4w50+jKvzzUPK2Cpq3akkyt4wX04ScI0yktbmcb7GtHOnPKgWtos=
X-Received: by 2002:a05:651c:3044:b0:37f:d634:ba27 with SMTP id
 38308e7fff4ca-382eae93866mr56991641fa.9.1768206122134; Mon, 12 Jan 2026
 00:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20260109155717.269221-1-marco.crivellari@suse.com>
 <aWFO5bWNIy+N5/AS@lstrano-desk.jf.intel.com>
In-Reply-To: <aWFO5bWNIy+N5/AS@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 12 Jan 2026 09:21:51 +0100
X-Gm-Features: AZwV_Qgkje68RNYGplu1gjIwyLliDf0WfCkpizl2GJC68hku_3XVzv-uAgzd4Ec
Message-ID: <CAAofZF7iaXC-KEp_Mq0pFWyVGi1R6Zd_REx-SBBMuhPZwa8eYw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe: Replace use of system_wq with
 tlb_inval->fence_signal_wq
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Fri, Jan 9, 2026 at 7:54=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om> wrote:
>
> I hate to be nitpicky but this name / kernel doc isn't great.
>
> How about:
>
> /** @timeout_wq: schedules TLB invalidation fence timeouts */
> struct workqueue_struct *timeout_wq;
>
> Functionality everything in this patch looks correct.

Hi,

Sure sounds good, I will send the v3.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
