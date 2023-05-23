Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7070E11C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7138510E482;
	Tue, 23 May 2023 15:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FFC10E05B;
 Tue, 23 May 2023 15:56:03 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3980f2df1e7so1413181b6e.1; 
 Tue, 23 May 2023 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684857362; x=1687449362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=feR7RDbEdLIuOxFRuDJ8YtvTuElIb6gfqh0e2jlKlZ4=;
 b=BQ/BwtssHhbZ5SXgrL5qqcG4DxAtKpPixF+jH7TZmPAC6I3vktKSEdVhZDZ+ztF5Up
 X3wixHyR4QgoCizXCGPnprd+j9fKQZ8YfRCxcOPlVvd+/TIHG2uLsCxwd83ztdxm/2hq
 w0SwwSU2mAxn5+9WETXaqT7JLlyeES6GGGpGJGNb7kyYSW32dRzDMH8YQNjcENmueK5H
 CyukFJtQHtcLKhQn1KZhezhSsFaC0FzrGS6Wy24v5tKB2mfal6IUZwXkXTDl60M9X/re
 YjrqAi5wA6nuB5HYA4yMhgYBJDsvCPiZz7Tzu9q1ibzAWEX1acOd3gdM2kJpcci6tghO
 +VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684857362; x=1687449362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=feR7RDbEdLIuOxFRuDJ8YtvTuElIb6gfqh0e2jlKlZ4=;
 b=UYA9fgfWJ5csMn6FlfYnlWkP0kGYELe5y+JMfTnIyRFK5Qz7S1kERTbX0G4q40fMe1
 YAkMtL3WTxnfkeL2Yzz/1ZJyJsUNAIo52rT+vBX3JCvhM0WBwFu/2y6CvQYsBAy/Jntd
 8EsCnGsWH57PCWoULMoGmMU2F3S6Z8imDtr3CcJnF3HuWFvUGrOciLdv7hzPHQTiwA+C
 HznJDNC0GsMMvvmddsafaiCUKRCENnvvTmcEwelM0kAPkQowhlh+ALlHAfA6km2TlBhQ
 6pNCXyz2qWU6KrYzlqSg8Fm5KNFSW6LE3V6cycXphA6S108ijMIrXfz3iEgpDQZVz9bA
 qOJw==
X-Gm-Message-State: AC+VfDz8KC0lgnAENl5+Dgq2HgNtyD0uwrj+bnbga76QFxV6B0LUsaZP
 Gka+M98qm62wPJLLDq5q7v4Sf1z4OPKI0ByL1qA=
X-Google-Smtp-Source: ACHHUZ4ZyUpdVtXyIatHPpZHmnxoVWfMnEnl1OVupErapn37R44kVZgKLmbC5muGz5Am7Mmro0S57dh0vvs0jDarnnk=
X-Received: by 2002:aca:1109:0:b0:383:ca99:c70e with SMTP id
 9-20020aca1109000000b00383ca99c70emr6905361oir.59.1684857362565; Tue, 23 May
 2023 08:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230523021811.122014-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230523021811.122014-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 May 2023 11:55:51 -0400
Message-ID: <CADnq5_OxXz7TSvkarQxC8-342SxO+YE4PU_4mSADYtr0urofvg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove duplicate include
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, May 22, 2023 at 10:18=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c: amdgpu_xcp.h is included more =
than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5281
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_4_3.c
> index e5cfb3adb3b3..7fb2d38b010a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -23,7 +23,6 @@
>  #include <linux/firmware.h>
>
>  #include "amdgpu.h"
> -#include "amdgpu_xcp.h"
>  #include "amdgpu_gfx.h"
>  #include "soc15.h"
>  #include "soc15d.h"
> --
> 2.20.1.7.g153144c
>
