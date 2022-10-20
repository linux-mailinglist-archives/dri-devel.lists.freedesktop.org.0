Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C760689F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 21:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF72710EF53;
	Thu, 20 Oct 2022 19:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36C510EF53
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 19:07:08 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id t16so316873qvm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n88/Z7epJ6toETOQg3utDf/EXJ58Cna77R79FUONCHI=;
 b=CHEqIGHM5CQcAheUFK49ZRTcbzqWojHYG7L4eaLNmE1jcbu//0fq5P9k9VMBj99R+c
 skjsuIsnGcV2ytJ/I4yY7ASCjMwaz6lW+rYPgRWdAG+enHx3Z8cuGVJFwEFFOwviugAH
 RICRZiwKpKybxbu+96NLddWXM3jJpg3gE2WsOs4OGO2SU1CCGCkYY6NinLciMjIa/Gzt
 VXUPeFvFWUXZBT2YBxECwYV3l6f52Gk3BBkkttZpMGALEIpTbiSjgvzcZHusInHo/8id
 Ay6cnDukrDbqLpmSrUcNNsbpNfZao3p7fdz7FHrDARHWu4xRzG9ds34oe5CbnNMPFUB2
 /5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n88/Z7epJ6toETOQg3utDf/EXJ58Cna77R79FUONCHI=;
 b=5CCNDXTxzWMzk4QlIyb2SDGdx+Gu5rIosJzZppYWm1qxJF31aW9ub51ti8nfs26UBE
 Viw19gCRbmJlzPoW/ogkC7wS0A4sfcWUXw/tzgyor2Sw3HxmGsM71oLPxG6IJB6eZD76
 8084tm2y5mlsNOe8Np/muqFgDLu8pSFWAgdxkAMRwuvrS6gFNAdKNVJ4edoGGYa+vm5T
 6XD27/sdVhJpnGbq9WRR1OqZa5JeqpwK6zvhJoqkP2kGhTSeRobwt2mB2+KSjTiSylHn
 SCgrOY5DamLNewqoEJT1jjhj2oWAL1WCcyKsT1cD7MuMTfhFkur/+0RZffVe3M8A8KWU
 wPww==
X-Gm-Message-State: ACrzQf0VeKt574mghsTBl1/gU4lMfPMKxeeHIxaTw5v9BBl/WigMhn04
 cqR2o7FmIuYRw1pFSSjfaCdCxmcW/daI49udyAo=
X-Google-Smtp-Source: AMsMyM6iodZMIEZRZTfFp3h2doYla41qrFujEl/ExOZ/wZPvTFttLK+91bJY1ZaJnJGd9Afbubo5B0hnQMPw/9KFBdI=
X-Received: by 2002:a0c:e352:0:b0:4ba:16ce:b464 with SMTP id
 a18-20020a0ce352000000b004ba16ceb464mr1455419qvm.11.1666292824363; Thu, 20
 Oct 2022 12:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-7-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-7-maciej.kwapulinski@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Oct 2022 22:06:28 +0300
Message-ID: <CAHp75Vcb-EMD3DC81kw6sMhCYV5fGqWy2gBt5j4fEeHx6bdyvw@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] gna: add GNA_GEM_NEW and GNA_GEM_FREE ioctls
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> drm_gem_shmem_object is base for memory objects provided by the patch

Here and in some other commit messages don't forget English
punctuation, like trailing period.

...

> +struct gna_gem_object {
> +       struct drm_gem_shmem_object base;
> +
> +       uint32_t handle;

Not u32 or __u32? Is it a subsystem requirement to have uint32_t? Or
your driver, then why are you not using similar types elsewhere?

> +};

-- 
With Best Regards,
Andy Shevchenko
