Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A34507102
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8693510E306;
	Tue, 19 Apr 2022 14:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526410E306;
 Tue, 19 Apr 2022 14:50:52 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e2442907a1so17727620fac.8; 
 Tue, 19 Apr 2022 07:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Tg5nZzh9oQDL1KQptjvk3ZiAVxwof7ABn++cYNncss=;
 b=jTfmgMbGgpK2pFoqKs+aBE32BYvM2n2aKjYyoCe2lQ5+kWewpr1JDFdMXK6YQKcd56
 0Y5VkKgFsVvxWH7EW3wHq8n280yuRTJYli6DfghqSch0dWkpqamWyZ0vbUM49KSaGtBb
 3fnqVGuAXNPG1i3lPsSckn7aWDqL5e+3E5MAMHJm21+TTty28/NZUmq9pAeDndnFbA0J
 JOvbO76AGwEo3RdqJtZumr1fuTJ9hpSHXYk1gGSMXLQFVM5wUp+opXHILw4vP29veUCH
 dcLCM9X5Zk7EDPNUhflH6L6uKkyf2yso846VRIHnlgxWC8FP7zkbuhdjjekfIwU+pZeP
 elyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Tg5nZzh9oQDL1KQptjvk3ZiAVxwof7ABn++cYNncss=;
 b=06Mga+JuXaSSoTPolULdXPawJ0Seaw0BMU4wwf3MlTDC/0MYO9P+jOjQBNHreyxdx3
 aoUHRThh2jrWexXoKrr79D5f6S4JwxB8LlR25AzODhMx0Qa/LO5//S4x80r1GQtIU6Du
 iUrG/YCcoRxY+BF06veX4mQyp2N+Ehk4UIZYQPyMMaitf4/mkV9b1tXriYoPFxHyr4Ow
 wA6L8hSNgYP524kRc4u0OcsnGeR8C+rYgNIoYrsO6DwF0NIEpFJVa6g3FiUCVqfMwl8Z
 yDKf/fZ0LG2p80JsdwAouyt0CkRajRjruWa1ai5nOc2fPEiWJ06n274J2VzI3CfyBX1s
 m/YQ==
X-Gm-Message-State: AOAM530NDyyXII4G0g/QNRDP4TqiM62rTP9tU0T/TmuuuULGj7RxLJua
 FzPfyDeuW3tHyfBvaiXZ0V5Pnh2FNzKolSIj5Fw=
X-Google-Smtp-Source: ABdhPJxqXxqKIvUyCMkpdd15R7yoX0oYv19nBoQ8aXfGbeSnhB+k6n+l60epVZPfGevIPY1sac2Iy3lI/5vW2NsATLM=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr6769659oap.253.1650379852002; Tue, 19
 Apr 2022 07:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220418194830.3266024-1-trix@redhat.com>
In-Reply-To: <20220418194830.3266024-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Apr 2022 10:50:41 -0400
Message-ID: <CADnq5_Mjzbg5jpnnAU8v7C7At9i-s_Dq=qZ21UNudyM+rKrWQw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: add virtual_setup_stream_attribute decl
 to header
To: Tom Rix <trix@redhat.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Apr 18, 2022 at 3:48 PM Tom Rix <trix@redhat.com> wrote:
>
> Smatch reports this issue
> virtual_link_hwss.c:32:6: warning: symbol
>   'virtual_setup_stream_attribute' was not declared.
>   Should it be static?
>
> virtual_setup_stream_attribute is only used in
> virtual_link_hwss.c, but the other functions in the
> file are declared in the header file and used elsewhere.
> For consistency, add the virtual_setup_stream_attribute
> decl to virtual_link_hwss.h.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h b/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h
> index e6bcb4bb0f3a..fbcbc5afb47d 100644
> --- a/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h
> +++ b/drivers/gpu/drm/amd/display/dc/virtual/virtual_link_hwss.h
> @@ -28,6 +28,7 @@
>  #include "core_types.h"
>
>  void virtual_setup_stream_encoder(struct pipe_ctx *pipe_ctx);
> +void virtual_setup_stream_attribute(struct pipe_ctx *pipe_ctx);
>  void virtual_reset_stream_encoder(struct pipe_ctx *pipe_ctx);
>  const struct link_hwss *get_virtual_link_hwss(void);
>
> --
> 2.27.0
>
