Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46540FDCD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08616E02B;
	Fri, 17 Sep 2021 16:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C60E6EE52
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 16:22:33 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso6638424ota.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d6UdQGKX2roiV1JMYHMnVyevfGMqOqtCIBxz/mzHdCw=;
 b=bzpCRhCLF+BXjoUlT1W9P7aOBoYu91Yt8j7VdR7GftEpGolTvdc5XMkePMX4tWfWEz
 HY4ZTC1xSbOzyNSoi+7T6gW+CBNQ0fRwjBuGq9mpOd7L09gywSxkT9byOo0qJ9bRm019
 D3RRsBDTutOnv+OXh1MHDkwXLiLzTxKwZ9/C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d6UdQGKX2roiV1JMYHMnVyevfGMqOqtCIBxz/mzHdCw=;
 b=4x6MXvYZvLTGUOsGO27NC21upiJp5RLfa6sjxkf1SJKQOJgp39GDhidrp7ndnkY3wf
 NJ3paXz5pq4Ut0/nlP1COnI/HvjI6benXhZAJz8H4gBUFi0H6FGjdJPMPod3QvKgnOfp
 oHw5Jj1xTZ7+OAUXxn90bhlMAWBcK7aZRhQuCA8+GEqdTI9uTnXVO5g3yfnSpazk2WDL
 MG5SihoZmPhtw0f5VqsFhy0lOGTAqfqWZ8L5YVfOMmmaJO7JcImNVOzzKTyk0n7+ZIl1
 UwIu5JibHvSIKkVSWx0FmQ782tYPn0ZOZ1aILv4ofVxPM+Tgz+maV0QAklmMyTlCWbJn
 LtDA==
X-Gm-Message-State: AOAM531FidMAwEfv+7GbQDF7Scu0bHFys0bYULnPOvvRjAqDGdIpC+9o
 j0czMy7OiSAJ3BZ2XjB0C48XLZupY105CA7TDVigxg==
X-Google-Smtp-Source: ABdhPJzNn7/XgFdOwYTGvNp8CKSb7L3KqMjJ8mZACL8n6QprxtGLoZqwzXFKTqxdR4iycYxcqq7JfcPJp9tWfFFqbuE=
X-Received: by 2002:a9d:724a:: with SMTP id a10mr10089647otk.323.1631895752168; 
 Fri, 17 Sep 2021 09:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210917161540.822282-1-alexander.deucher@amd.com>
 <20210917161540.822282-2-alexander.deucher@amd.com>
In-Reply-To: <20210917161540.822282-2-alexander.deucher@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 17 Sep 2021 18:22:20 +0200
Message-ID: <CAKMK7uGL01nrMBaRs6P_FKREDj6B7vxa4hqnWrW6oSYcj5g_6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add Andrey as the DRM GPU scheduler
 maintainer
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>
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

On Fri, Sep 17, 2021 at 6:15 PM Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Now that the scheduler is being used by more and more
> drivers, we need someone to maintain it.  Andrey has
> stepped up to maintain the scheduler.
>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: airlied@gmail.com
> Cc: daniel.vetter@ffwll.ch
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 379092f34fff..9d567e66a65f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6369,6 +6369,14 @@ T:       git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/ttm/
>  F:     include/drm/ttm/
>
> +DRM GPU SCHEDULER
> +M:     Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> +L:     dri-devel@lists.freedesktop.org
> +S:     Maintained
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     drivers/gpu/drm/scheduler/
> +F:     include/drm/gpu_scheduler.h

Ack: me
-Daniel

> +
>  DSBR100 USB FM RADIO DRIVER
>  M:     Alexey Klimov <klimov.linux@gmail.com>
>  L:     linux-media@vger.kernel.org
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
