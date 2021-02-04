Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741231010E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 00:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752356E175;
	Thu,  4 Feb 2021 23:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36C6E037;
 Thu,  4 Feb 2021 23:52:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t5so6510085eds.12;
 Thu, 04 Feb 2021 15:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ra+uVv0AOKF5IWdsNTvTAlwtdjfa/ya/PpGduOS0OQE=;
 b=UiDieoSxH+9MmOCXflkoXMs8JXz90gU8uIWnjkdHxFOyu6oHPCTibnG8pKNjJx2d3P
 0Jui5HX1bdYIpkiOUevQPtkDEisvgkWU1FFbPsHZ88ptibMRZRxXr+7qf4swrVXWXdD/
 g5QQwK78pGC34fBprU8AhmiCLLEpqydmjwRk+DSLNEdzoAyzI+YZ0QO7ggZR5xaY6Bof
 l/uuy5gR3r7mnkOCvQWCPQOdBuK9RGXR4VhI7sWTtJriRaYSLGkFn4fV7ujHeb8m79Tq
 P6VTwbWRbvpSo/xY5dd2RZlgfztEFjHq56IslK0Jyp9Y1mgpokfVCZFElEkDtmIDTH+V
 eoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ra+uVv0AOKF5IWdsNTvTAlwtdjfa/ya/PpGduOS0OQE=;
 b=GXPdxFgh7oEZeKU265qpkW+d+8yXqh8AZUHroD01a+4o2DdsvaZtksi17pnki/mQZo
 45kZbIjkIIPZNa87z0xTncofedWGxZmmuAkiSPVQtgpbW6eOKe9uzxfAVFcJxyeNm6hu
 dJU8LxFmQB51E6Ck7kyHtIj05lgKgxK/2vYfCRvP+cHIe+z5xDuS3amTL8KbJ8gESAUS
 btHxIO0f66rK5xu08i0kUe9R2WSHJL1mC3iT7kaf2+lyVB7rYfuN3bRjOszFW5Fi5TgN
 vHAvkc5iMpOCUDo20rX6NudZzXbZlpFmuogcTxuDhtjObs1RjmDD7xWI+MXtOk7b4fSN
 5oKA==
X-Gm-Message-State: AOAM531tEDGpziTD764mmX4yuj7v8sBHsracHXqpE63vdFeRbsLB8/Zr
 LHuKM3ELzPP4ltIdhvI0v3qmxnlFxYkkXL72Ndc=
X-Google-Smtp-Source: ABdhPJz3P2u/y0QpIszTieutFucdnAPusnOiCD+qY2tL9tm17ybEEmMv/iUN0EzUfeIDsFjdTxZlP83waDtTj6xWvyw=
X-Received: by 2002:aa7:ce93:: with SMTP id y19mr941582edv.119.1612482721409; 
 Thu, 04 Feb 2021 15:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20210204045717.3823-1-alexander.deucher@amd.com>
In-Reply-To: <20210204045717.3823-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Feb 2021 09:51:50 +1000
Message-ID: <CAPM=9tzKzgOTQd4zorqn8LP2QJhSLuD_xJhm5saSH2uUJE7_+w@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.12
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Feb 2021 at 14:57, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi Dave, Daniel,
>
> More fixes for 5.12.  Same PR from last week with the issue Felix reported
> fixed and a few more additional fixes on top.
>
> The following changes since commit a6b8720c2f85143561c3453e1cf928a2f8586ac0:
>
>   Merge tag 'amd-drm-next-5.12-2021-01-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-01-20 13:08:18 +0100)
>
This brought an arm32 warning with it, I've applied Arnd's patch to
drm-next to fix it.

https://patchwork.freedesktop.org/patch/msgid/20210125124849.102037-1-arnd@kernel.org

However that function has an ifdef around an ifdef that probably could
do with cleaning up.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
