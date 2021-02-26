Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26058325E9C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 09:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B74F6EDB3;
	Fri, 26 Feb 2021 08:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A366EDB3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 08:08:55 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id gt32so1728643ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 00:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PZiCMEz0tOMX2WzkrWtR6QgXv9DMntKv5FHlKNqZMbI=;
 b=emhvtbJ3maYTseT5zBCBN+yUfFdMY8iHly1nEiWHzF4pUU92Y6gGp8Cm6Mud4cTFdC
 h89sqCGQeFBo3KhF4CQXW0rMGAefRL279qbC/ssji2QxWH1JEthWNi/acH8XjOY37YRi
 6DK0FMVMzOsPXM9IE8OJr13FTAp6To44sIxlZlDRMtBI2MukGYYGfmY27X4l7tDUOfw3
 FvW2Bcfs45G0COYWzGrHBsAuLdT6CDj8Np8Hx7rH9NGzlAj5X8PgZmHpaeDHZBt6JUTL
 Wvsvnp7cVfroE+2StcVHPn42hktNcMPa6REGHHjvnKrHQB/cmoBoheEkOMkU1DTE2Ctb
 etag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PZiCMEz0tOMX2WzkrWtR6QgXv9DMntKv5FHlKNqZMbI=;
 b=dsL6BmvbA/IOvdxMYUzDQ71fUWTQxArBPWwpNFopD3ampaB2f38SGo0pC3ONTnJQTT
 EjKyW6obpm/Yshur3NG8OeEms8l8hAEK/s902NUEtdJiMvCPfIGeERJ/LHcEUfGO6Tlt
 77bDxfHBeXJoG1amiaMkSaYECzTstDE/abj6YaZDIHAHSF9lQpafZgu5ZP8Jr2r9s6ru
 DcP1eSlWnJiXeGg/3/0/u2KVw9Fg0bNhMFXAaKXWrB6dumR8xwv3hgcGlqBPMg11y/eg
 Xi57Towr3VX+nVf2dgH7zwCZKek3sn2xDq6owuEC1qkayIS08nqcuVF+pdn10RxHZiBE
 Lobg==
X-Gm-Message-State: AOAM533dBsu0OXQ7nzHxh4aGPEmR1zksY3LbwbFY+Dn9PJghfWBoSTY3
 ifmjHfNPNjbVNkBGAKZnokybdVZkWhwCMHJmQTdCog==
X-Google-Smtp-Source: ABdhPJwDmWhi34W5Iwsxl9agykzmF3W1N+V6xfsQMdqmsWBrlSy1+PuZBMJ82U+1chgOAJpnO8nSHCz0FgqPOQSJ598=
X-Received: by 2002:a17:906:a44f:: with SMTP id
 cb15mr1980471ejb.420.1614326934054; 
 Fri, 26 Feb 2021 00:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20210204113742.1814456-1-emil.l.velikov@gmail.com>
 <CABjik9cHYArtsTgYvcGbH_AOEcdVWpX-pTrHMq4uv7ct4_NSKQ@mail.gmail.com>
 <CABjik9dnH0dQ2Am-nfPUstF8Uv7dSixcCZ7pN7yLWNQ4QgTaAg@mail.gmail.com>
 <CACvgo53wwtkr-DeCMsnKRpjsBO=GhTVWBODC=32-6sNxgaQwLQ@mail.gmail.com>
In-Reply-To: <CACvgo53wwtkr-DeCMsnKRpjsBO=GhTVWBODC=32-6sNxgaQwLQ@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Fri, 26 Feb 2021 00:08:36 -0800
Message-ID: <CABjik9dnYjYLTBObPgn1S+1Wyc36byX+8r0PJJy+W7fa0Aj6WQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 1:07 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Do send a patch, unless someone shouts against it, I'll be happy to
> push it and churn the whole copy to drm/mesa game.
>
> Thanks
> Emil

Hi Emil,

Were you still planning on pushing the patch? I sent a v2 on Feb 8.

Thanks,
James
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
