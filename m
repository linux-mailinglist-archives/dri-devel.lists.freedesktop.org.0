Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E286938B75A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9533B6F507;
	Thu, 20 May 2021 19:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766916F500;
 Thu, 20 May 2021 19:21:01 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 e27-20020a056820061bb029020da48eed5cso4029829oow.10; 
 Thu, 20 May 2021 12:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jFT2vUjneyK4vqRQTSud440oIlDIOlBm9ntEGOINv5Y=;
 b=D/khYlkLs8eViqkgfzspKIJORMK1dqfOo1QORFPm78nkMtTSIa1UQj6LQt0fIE6ssK
 O9lGaXHlOXL0EV3fv5Y7a3jr8Zi4S3yLbWxTmBOLNyY0PZvYryPpLCycq/h5tkzT2HuY
 3jV0KhJ1nlMefUkBn7EhcQ3JcPl/mvqQg2LfwO2IHXEmlwsyszD2SCOp6Oxpo90sUv48
 07FSiNdFZFri7Qmk2zpc9QYfYxH+jElnevL3fMYQsO5uiR4P7O5gYqgVfynSMG3iWNAI
 ffhBH8v2gU5bqy03nFTAr4jH8Vf9/R3ruvrIfz59jVqo0gHklxN+Pv9gT1P4hByy4TNd
 rnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jFT2vUjneyK4vqRQTSud440oIlDIOlBm9ntEGOINv5Y=;
 b=J3dqYhzER5uWhzi+1os5ZXiWWLxTP9ZJG9X46axwnjCPZoUYNrh3wIhnj7E/yWlhJw
 lStOqjT2APkWW2dWUZujB47VzLAXXxJCWanDmVpwY2xR/7rwpTzPf34AWj5ab0vBsY7l
 IldvJQiEbKMHaaqaZ2hBv0nYc7YRcm5UW5ddTmwKoZ8nmM+FPbaUmQ6yjyY+Ui4BFjpn
 Tg1shMi1vAEYmRxeT6677HY1cBkcL+HiyqbgKS2EJ+n8URyLEo48xK9WueRZUsp5szr1
 fYckow1KjJoLRJ/T62U+KMUkQzc41C0LhSdPUgjtMrvZ+Ni1askK9prlZECVPCrRbWLh
 d58g==
X-Gm-Message-State: AOAM533MiDoCD3BMi7k75YKgSPH9MC8RWhQtF1XulOWCfjrPM4CdWahv
 EoLgb4IbK7kwQvRW1CLF5nDRiNJluPoClddLc/g=
X-Google-Smtp-Source: ABdhPJwJQXId/bdVgc0jHCEOn9JarUKc13A1Cej/AgWqhMN32NoS8pW18t/ZaSTqNE9XaYPco1cgGarYCI/JzluP2as=
X-Received: by 2002:a4a:d543:: with SMTP id q3mr4945275oos.72.1621538460855;
 Thu, 20 May 2021 12:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-30-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-30-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:20:49 -0400
Message-ID: <CADnq5_PjnKC8qRMY7+TGfi2mpOXpiF-0bkm6VfB9+aqgi3bWmA@mail.gmail.com>
Subject: Re: [PATCH 29/38] drm/radeon/r100: Realign doc header with function
 'r100_cs_packet_parse_vline()'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/r100.c:1423: warning: expecting prototype for r10=
0_cs_packet_next_vline(). Prototype was for r100_cs_packet_parse_vline() in=
stead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/radeon/r100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.=
c
> index fcfcaec25a9ef..3c4e7c15fd159 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -1406,7 +1406,7 @@ int r100_cs_parse_packet0(struct radeon_cs_parser *=
p,
>  }
>
>  /**
> - * r100_cs_packet_next_vline() - parse userspace VLINE packet
> + * r100_cs_packet_parse_vline() - parse userspace VLINE packet
>   * @p:         parser structure holding parsing context.
>   *
>   * Userspace sends a special sequence for VLINE waits.
> --
> 2.31.1
>
