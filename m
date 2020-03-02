Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B6175F02
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C206E529;
	Mon,  2 Mar 2020 15:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE5F89E65;
 Mon,  2 Mar 2020 15:59:22 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id r18so251842vso.5;
 Mon, 02 Mar 2020 07:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WH58ny7aXuxsvw6YgV8ScOHhdjPS9+weIiZQCBBEH5I=;
 b=Mf9zJqK0WohGSW2D4DX37f95oFvl2aL8nUBqIhisMSiry4psQijIVPI0SI+hBbIo1S
 k9Sxw/gAVeoWl0cd9BE90qcfX6/G3SeCEgl5DriQuIc5dOHKFSwegvydrMZaWDCgeWSu
 WQS1Bk6JWWHRD0w/D71cyp2fpJluUhblChNN+CAvqekmalpWTcoOLT3hto5ORoi8eTqo
 IjWUCtBMsz9a7/wJHQKrbvWeO6X9tBEm0qBd2V2f6kbvI6JB8gWa056nrEECQ861j9g7
 EhMkiq0YwievM1bd1wW0motoW2z0eYfbHXS7wm5OjBfFLR75Pvl6Pm1yEIhnQYnBPlMD
 vVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WH58ny7aXuxsvw6YgV8ScOHhdjPS9+weIiZQCBBEH5I=;
 b=DTD5CmNUUj5nQhGyHq7esHX/jJrb93kSeFqQYwa640syVXZOctO/it+73Wqi4IX3YB
 8mF6cj3O9dkKo7TTnoRnbywAWvfa1W1KlBii2tX1VHbrEThlPFTxNiz2IcVeiugkwiar
 HA7RvI2dgRLugQo3zeqfTHzazN3omlBoIFLogrBpSLyfZmZOCdrJ8OR6ekRr0r340wEF
 Uv/8rrLnCE8i8tZW6WerHkPQOzjeVb/D1bdhJab3TwY6nedlpVBINLv47li1lhfvUExo
 faxuP0ZGIUtxU3iPZMEMxpN/RBTRZ6eV87eCvX3wCBLBHzsVLEAjMusIeqC/pNQoCZ4S
 Gqcw==
X-Gm-Message-State: ANhLgQ2y/bHdjF8yxQJS4rA7ZiWLSo582Vr9vTSnwRGT4poseoqM8LnJ
 MX8e05RSfq3zMilOcT4P4L34W8yDOm2SFp31r1g=
X-Google-Smtp-Source: ADFU+vsYtoy0RewAodRd3a/iEhmKuSXuEK33faWkm6Ag7s3G+91+q7geEOeW+ZnwHscVTwE9SShPloM7Nfxpb8yoicM=
X-Received: by 2002:a67:8d43:: with SMTP id p64mr2370534vsd.37.1583164761213; 
 Mon, 02 Mar 2020 07:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Mar 2020 15:58:49 +0000
Message-ID: <CACvgo52+LRrLkyRdbGOXGzUWdakHOJfps9PJp78x-N6ZXT-SWQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/9] drm: drm_fb_helper cleanup.
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 Mar 2020 at 13:08, Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
>
> This series addresses below drm_fb_helper tasks from
> Documentation/gpu/todo.rst.
>
> - The max connector argument for drm_fb_helper_init() isn't used
>   anymore and can be removed.
>
> - The helper doesn't keep an array of connectors anymore so these can
>   be removed: drm_fb_helper_single_add_all_connectors(),
>   drm_fb_helper_add_one_connector() and
>   drm_fb_helper_remove_one_connector().
>
> Pankaj Bharadiya (9):
>   drm: Remove unused arg from drm_fb_helper_init
>   drm/radeon: remove radeon_fb_{add,remove}_connector functions
>   drm/amdgpu: Remove drm_fb_helper_{add,remove}_one_connector calls
>   drm/i915/display: Remove drm_fb_helper_{add,remove}_one_connector calls
>   drm: Remove drm_fb_helper add, add all and remove connector calls
>   drm/nouveau: Fix unused variable warning
>   drm/bridge: remove unused variable warning in tc358764_detach
>   drm/fb-helper: Remove drm_fb_helper add, add_all and remove connector functions
>   drm/todo: Update drm_fb_helper tasks
>
With 6/9 and 7/9 squashed into 1/9, as suggested by Laurent + the
wrapping retained as-is, the series is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
P.S. I'm loving the diff stat :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
