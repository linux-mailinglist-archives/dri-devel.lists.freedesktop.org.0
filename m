Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3594F1FD539
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 21:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21ED89AC9;
	Wed, 17 Jun 2020 19:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524A989AC9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 19:13:18 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id x14so1141931uao.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 12:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YrPvmWq+X8NgwhXx/4LblQNwQtLW2ZlA9du2sqxkydg=;
 b=MNJA0Tlx6Tf1x/YELEAxX3Pg09MKtZ/LM0wMBZ1KULStfRfUXTXcClFcLs8JC3Loi0
 TvxlL5k2eB9sO+8wYRhm4QuDL8gnQIU3U/t1gDi8PcfGyLPVTmcuRFD1ZS7BsbmYa2NA
 J7LJHsOlqT5ee0iqdjf7028/HKG4fGninY6uiYWd0xzAnJCj6fcncdeCoOENczoYBMjA
 2zHNfMXb7MgDJqPS98GimAzhPkLQVWFIZe19vHLrzWB74zYSBTc7aWw1iJlW7qL0QKxV
 6wV91OSgEx4IEkQNKjCHHm3kUq3TuKVo0Z1D54oubzNBoR9bjC0WNvkEQY0y7WCg/1ER
 J03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YrPvmWq+X8NgwhXx/4LblQNwQtLW2ZlA9du2sqxkydg=;
 b=DX6vKOeE+cVwcQhpUDz2FjL+oqhcE/4rj+8mN6xtGo3d2d+TYFJecN6/NXcRW6mzf5
 WRSzW7YiV9YNbsCO8cKke4INYF6a5iGoqibzvF3B83gcqczoqzib830vxWhaABxU7Onu
 thF4slIPts8K3gJ9iglJm7Jijw2Qp5WtoTA2YTpmhq9SZwjtKzYBRQvEUQ5SWixXQuGg
 3qfzCehxxbUf8XNoVMjFnsbSnQc2bchTQ1c1IM16gsfwM0QmEaJs+1UvS7faL9nMA6ru
 HIt0XsdWFqO70ccLpGiG3qfjWeLC79dM70y+9DbJdXFRxX8GL0UjI6DvdM8qZp2IeBxU
 nkhw==
X-Gm-Message-State: AOAM531t7UT3Ubs8yGClsgbVKUk9mq4aqa7QKZ/jnTcTOX6E1Q2Mz1lJ
 IZkRbZgr/p3MNeZRhu7S9fJfl82MWJi6LS4DZ78=
X-Google-Smtp-Source: ABdhPJys9jhloG81To4CERbiQ0/cQxEdGCy2EMqh9Z2PVzov2lCaOui3dODHCStJbRy3xVaIX2HIwSjzHudVOLt1q2I=
X-Received: by 2002:ab0:2758:: with SMTP id c24mr423151uap.64.1592421197471;
 Wed, 17 Jun 2020 12:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200616142630.20129-1-tzimmermann@suse.de>
 <CACvgo52NY98wQ4Pm3LozSmdewQf_ftX4cYZbx=t6=s9CNE27kA@mail.gmail.com>
 <ea09692a-5a8f-d315-3bce-d416e8a01c7a@suse.de>
In-Reply-To: <ea09692a-5a8f-d315-3bce-d416e8a01c7a@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 17 Jun 2020 20:09:34 +0100
Message-ID: <CACvgo52eaz6GRets0JGTz_3AKnCnFTGoZM7zqcceXLwgVJXERA@mail.gmail.com>
Subject: Re: [PATCH] drm/mgag200: Don't set <rammapen> in MISC
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Jun 2020 at 07:28, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Maybe I can write a better commit message to highlight the change.
>
That would be amazing, thank you.

Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
