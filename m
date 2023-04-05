Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A905E6D7F63
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C5B10E998;
	Wed,  5 Apr 2023 14:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D6610E998
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:27:11 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-54606036bb3so514615197b3.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680704830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2CDOKe00GnUjHdkbrE4uqIZXQFd1rirDCgy3XORGC0=;
 b=GlbqkCpig7IPrSTg10DT1HGJE3iQoSZSheTEkp/deI4+kgPyCkyhoySWQ5r3W7NLdd
 FmGo4FMUOjBa1S+ZRhlMQtLzMxvcV3kk1Cmb+Qu3hfkoR+mUd4+27gm5haAPFqTDeMgn
 sLGcXrToa9ecnD4n3NOE27F48KvgYq/ixq1/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680704830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2CDOKe00GnUjHdkbrE4uqIZXQFd1rirDCgy3XORGC0=;
 b=sv/KATzi0WpQJMtkUqgIaatyJykt57yiBQQ8+ZvFHa98D53cSaREsdv0ExZ8Bno4ic
 i6w32whrl0+A5kYYG+s0BehNLYkLlQ5GAODZUHfhCToQgAYqk7Ry0jyjmKBk60pPWzqD
 JUkeZFbLaUXRF6c0JoExHMsTGNS+UkKRWM1lAADc2UohzBM6zaiFZrkT3cVJnXUmddMd
 dMoBygfLiQEDQC8L77s44lkSiKdsUx9LjIv5QqMZ1uIORfcFMmvr6pWNzywzuhG+IXz0
 Qv9bIR2c4AanlbZLkqstkzTIQ2gYQmTQc1XLFddABNa1w5kE8qRVNn9bgSO3QdYdBfS+
 NrVA==
X-Gm-Message-State: AAQBX9cbqz05ly56QpYzgMW+9V4VKn8rUQ9e5JtSzdJ+CU4a2LEXubRS
 kZ7ihn2WMeR+guKF6Hy6fWBUUeulANe8UpktaPAyQQ==
X-Google-Smtp-Source: AKy350Y9iYQEAuwm8U51IV0OzmCsUWkboTMxqxuC2KD5swgILlish/b/RdhzJdJOdC+GBvdZWmpSqpuyclhyYclJ2ng=
X-Received: by 2002:a81:c509:0:b0:549:143f:3d3 with SMTP id
 k9-20020a81c509000000b00549143f03d3mr3713100ywi.0.1680704830604; Wed, 05 Apr
 2023 07:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230330012725.124031-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230330012725.124031-1-yang.lee@linux.alibaba.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Apr 2023 19:56:58 +0530
Message-ID: <CAMty3ZCVBCTZ=jRKBmdP1uHQfEK-Fu_vTGx3T0NFOzeAnHhFmQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: samsung-dsim: fix
 platform_no_drv_owner.cocci warning
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: neil.armstrong@linaro.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 6:57=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/bridge/samsung-dsim.c:1957:6-11: No need to set .owner =
here. The core will do it.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4640
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
