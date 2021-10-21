Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8649436098
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1C6EB55;
	Thu, 21 Oct 2021 11:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB826EB55;
 Thu, 21 Oct 2021 11:45:36 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 s80-20020a4a3b53000000b002b7ad17e169so43475oos.8; 
 Thu, 21 Oct 2021 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WOkBwlSoZofkybAk4F+yxr1MJ3MNGeAkoQp5SMBScKI=;
 b=lrkoDgGU3oxSva13UKIskhuNcjuvSuSsT7JEAyq2Cha7HhbJk2jnVLmW1GUm+w9btL
 WG/bzZVmeUr/9uk99LTnK1FHpQvaPbiPtSGCebfJV0A3jEYSzlYVQSeWrSOMFMUXQlgn
 ldViDb7zAj/ZHUA3JcLWdMOYAta84p2vC9i2+yokMESA2mMCpspkDn8ZwTwUwpP7vG+0
 J1w7E4AMgc8zwWFT4NlPhJ+lAUC58gmZ9W1z/lgNfDapR+qkLElTk1BOpakG0pjgYb8u
 a1mgXlPXLDL/550UXd2DPfNGPEZSgbiY+la8zb2ppsBcNuP15cVD6dxShA96O0Z4XkfF
 86mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WOkBwlSoZofkybAk4F+yxr1MJ3MNGeAkoQp5SMBScKI=;
 b=Qv5HhUy2EctGRPqkFRa2apIE0QEEScTi0EwHrggMbz2UBxV1BLvEZ+WmP34vE3/I1f
 /V2yHBnXxXSDF0d1yItKTwIa9XTc6R6fTjyiE5cwNFXBBfr5NV86KHi27QNZxR0ivfcV
 +yZK6dDHvn43955Ib1Mx9TXWdgOC2YF8TgSFtBWU+zUJoSxX+QCW0MN0TwgMnjZ5xATg
 VbqbWbkCTtUzA7aXIqHUb2/B+OaLtX7hUClal02eJIqOvDsaDWn9IpcbzDb3IQC/1Wde
 GSb3Q2lOAyXIEQJ5IwSfE1vknCSkLYcJLyFMvU07k4ArV0urOAfH5BUFpMzL55mQ/+0X
 Gw3g==
X-Gm-Message-State: AOAM532lZshJGitGgWOwfvV6DL/ngs9WREEyDww5aPPV00vq9TWaxH2G
 rdrgiPJsuK6TJ0n2OFgx6wakiz9+4n8e8Rd3guc=
X-Google-Smtp-Source: ABdhPJxxuBQAfkMeaF90FZTJmaSeTos98bFunKxz22ZrFszUOg9x/rgoAANU+p34amMBcnoous/70+nWhD6V4bvA4OA=
X-Received: by 2002:a4a:e9f0:: with SMTP id w16mr4041723ooc.3.1634816736053;
 Thu, 21 Oct 2021 04:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634200323.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1634200323.git.siyanteng@loongson.cn>
From: yanteng si <siyanteng01@gmail.com>
Date: Thu, 21 Oct 2021 19:45:24 +0800
Message-ID: <CAEensMxkPb9KexjJpy4j5x1Bf7npdknH44KfzSEx4JHm9DK7oA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/msm: fix build error
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

Yanteng Si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B410=E6=9C=8814=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Include linux/vmalloc.h to fix below errors:
>
> error: implicit declaration of function 'vmap';
> error: implicit declaration of function 'register_vmap_purge_notifier'
> error: implicit declaration of function 'unregister_vmap_purge_notifier'
>
> Yanteng Si (2):
>   drm/msm: Fix missing include files in msm_gem.c
>   drm/msm: Fix missing include files in msm_gem_shrinker.c
ping?

Thanks,

Yanteng
