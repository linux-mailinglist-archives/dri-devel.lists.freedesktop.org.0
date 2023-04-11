Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E46DECF8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 09:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8053910E28C;
	Wed, 12 Apr 2023 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9018D10E226;
 Tue, 11 Apr 2023 10:49:41 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id q2so12313510pll.7;
 Tue, 11 Apr 2023 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681210180; x=1683802180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBq+Uus/FZgXLcP8xGrtvuI6hfCEGIicJ5yksbFAHOs=;
 b=VP8SPdz6m7bZCqjSwbu2CWMhRIG43BNbcqdzzY7lI+mm1XgQkzJoznsPKHwRhbsMGR
 KYzhqjfPAwtY8v6VwvJh72H3PD+8p6AzBCbYDZflR9rIzXLnpIOjS0e5auJMYOSvfpne
 Jg0SO4gptkizxsgzz1qgvjQ5IxSvBh1QFBLpZ+ztV8uZiQlV8weiOAgIHibrfLgz0Yfe
 yy0dUANC2umHn13hoAARAuhapAXPhTexD/2+22p9hmxDqPnNQx2UkYfILLDOxPVlYiV1
 dpcgX82R8z+0y/xrGeeziqknvIHW6oSVk7QV6hBa+g89OeE5e91f2I/FbPGJG2beo4AI
 o+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681210180; x=1683802180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBq+Uus/FZgXLcP8xGrtvuI6hfCEGIicJ5yksbFAHOs=;
 b=TXt/enzA06Zc6C+0lPOYILrVmXv0OwdfnETrVa/s5mpnK6Vm+OAj0AI+5D0dnwRD/x
 Jbc+BaiuMmgVOe+ka5rBNY4CPWGWHxj6dmJjEAHTbZoE20xJfOJT7k90r0i1MKCGTys/
 R6HB6jeYGRhuWyarclMVnid3ySKsxK3B0EympP69kJ9npMumKyDfGJ0fqaaQW1FPCunN
 tUbqWPl6Lh8dj4Y/BFEHHkW6LD0NrXiT5Q22XdPplZNYGIsPQRGbvJaVmfjdIgRDbtMQ
 Vh3+UWHePUMnUuwWp/FEn+QUjXYJDv9bFEla1mST7u+G/TSTJb661BAvGL1cNd13hWgG
 Yinw==
X-Gm-Message-State: AAQBX9c6ODczH5hSZUcrkP1IQKcRvcdQF1H0Ia/FfAPJOoRKKxji+PtG
 c+FDXdLAwwXgbX4nFeZ/2MHdPK/cd+4+/40GgUE=
X-Google-Smtp-Source: AKy350bBaHnbfX5Z4+nwRR0UpaT9fDAZeLkAIJE04Q3LMr4Qeoz1k+1ZhYYkSfXpJw7gduNPvA9r6OY5zluuA05qVUQ=
X-Received: by 2002:a17:90a:d3c8:b0:240:d397:e66f with SMTP id
 d8-20020a17090ad3c800b00240d397e66fmr3918615pjw.6.1681210180619; Tue, 11 Apr
 2023 03:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <50439958420f91cc97ad929437334bfb19ca4d90.1681208396.git.geert+renesas@glider.be>
 <fd7c23298f2c62db85abc9114d12059ef5e5f330.1681208396.git.geert+renesas@glider.be>
In-Reply-To: <fd7c23298f2c62db85abc9114d12059ef5e5f330.1681208396.git.geert+renesas@glider.be>
From: Marc Dionne <marc.c.dionne@gmail.com>
Date: Tue, 11 Apr 2023 07:49:29 -0300
Message-ID: <CAB9dFds_C9hfwW+YBMbF8sakUwVXm4etVPSAXgXQpKMeTA9+yA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: Spelling s/randevouz/rendez-vouz/
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 12 Apr 2023 07:51:40 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xinhui <Xinhui.Pan@amd.com>, Pan@rox.of.borg, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 7:44=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Fix a misspelling of "rendez-vouz".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/drm/task_barrier.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/task_barrier.h b/include/drm/task_barrier.h
> index 217c1cf21c1ab7d5..59ead429acb2afb0 100644
> --- a/include/drm/task_barrier.h
> +++ b/include/drm/task_barrier.h
> @@ -24,7 +24,7 @@
>  #include <linux/atomic.h>
>
>  /*
> - * Reusable 2 PHASE task barrier (randevouz point) implementation for N =
tasks.
> + * Reusable 2 PHASE task barrier (rendez-vouz point) implementation for =
N tasks.
>   * Based on the Little book of semaphores - https://greenteapress.com/wp=
/semaphores/
>   */
>
> --
> 2.34.1

Sorry for the drive by comment, but shouldn't this be "rendez-vous"
(with an 's' rather than a 'z')?

Marc
