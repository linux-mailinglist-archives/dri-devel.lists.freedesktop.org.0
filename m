Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0541B403AD8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488F56E0F3;
	Wed,  8 Sep 2021 13:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C706E0F3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:41:51 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id t190so2515099qke.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tw7XxMESVLmbsHl/4z6dHN87Xrt6dlGHCofspseE0d8=;
 b=aQZ4NXWBv1FR1DIE17IREX93J1gIamrgGwAoKDt6thTq2bqzxFSyZ+fs1WkMWtyxgG
 IlIU2QXf2QURyD3h8t9s5WBznh3tZq24lwdqXvzQbmZcMsfxR2D02GQHCTGYQnNAYZKP
 MpA38l7tDZSBows+oEN/f1JDWDgzFgSuWMa5uiv8ad2BiCqaW3ozhp1I2KW8n1+FY0nv
 lyaHgHnioU68j82OrK0uZPNrfDc0bM6kqckjsMjm4bofzaLTCN/D8QSu+BMDsI76nuDW
 ozA4xoN1kmRAgH0M2U/ZzpDTS4k4HCZuTU0vTnMb1rUUIzgBs+g0AvVea1I6LGs4I6UG
 elbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tw7XxMESVLmbsHl/4z6dHN87Xrt6dlGHCofspseE0d8=;
 b=QiqJcdbEqIiHUKY1CURLzh2EaqUIBkVQhqpyp+tw/PhWLugO4GYzcQe9r6aIA9Ga1r
 /9R1Ymj6CzucxiEbQQO+ym1THvmwR2FKDJwD4joLp9Gf6Ju4indyJTKsuV5WfyGanhql
 MC54zZ4B0jJFrLii20LWnGm0TNyY6R1DjhROq9iWh5NnrJFkklWLIqzjiZA7Sh/mc8R/
 vLkLXW067kcmtvqMgTDQAKKqbP7TJCgAApxtglg5/1AyB5YQJSC9kKu2bajRygwgMZJ1
 JzgIUXYjc26bFeak9bDCImcxXSrKOQIF6tvaMTTMUGzZPfrtUA9ycVA/MlgCqvCcTU/y
 giCQ==
X-Gm-Message-State: AOAM531/EeTHjHx+kThwovjJJVQ28IQ+qDKcB0JJOAu3iK1+QnOSISiI
 bI0jHG9rkIttN+hw5CGb11eRESJl82/sRQXeuV4=
X-Google-Smtp-Source: ABdhPJwV3hXkdktcodyLFNncPrtXJCrOFqLHjXL5Zd0Qw5HuqkfVRDFHK/DLoiB/Oj5wBGWigh4Fy2vMnhfliXHXP5I=
X-Received: by 2002:a05:620a:228a:: with SMTP id
 o10mr3423802qkh.342.1631108510981; 
 Wed, 08 Sep 2021 06:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210908132933.3269-1-christian.koenig@amd.com>
 <20210908132933.3269-3-christian.koenig@amd.com>
In-Reply-To: <20210908132933.3269-3-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 8 Sep 2021 14:41:23 +0100
Message-ID: <CAM0jSHMGYvQt8hf4xmvVEwUdxjpHMypJ0GRq83g-VOqTq8CpWA@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/ttm: add some general module kerneldoc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, alexdeucher@gmail.com
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

On Wed, 8 Sept 2021 at 14:29, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> For now just a brief description of what TTM is all about.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
