Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A17361022
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 18:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305166EA93;
	Thu, 15 Apr 2021 16:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD9D6EA90;
 Thu, 15 Apr 2021 16:27:52 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so23110823otn.1; 
 Thu, 15 Apr 2021 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sv8ShlWCFYrRvkMTcwOZXNbuS9oUEdPA5USpJjouThE=;
 b=FOOM/KGf5hmW0LDCmdb7lpl3uQgy3UEwO5PjMunL+/tdyf8NWyML93As/uk5No4kVh
 3/iXatPA+uyl4WU4kwgTde2JNYOYaA2k8gyZG2KwJVXV4KAOnN5NjCCyWeTP+Ud0ZITN
 pE6MFRRf6HPHNAGmDLKh/JT3gm5Bi/4d3N+KLC/ChSptzig+a2yUe7WQn8hzzu+KkUSM
 JkJ6fdVOKnXn7dV07WRwH2ec7QWF5jouXuqqnUvEmpY+rbfm+Kf+mD9md/PoGFXfD6BE
 K/n8ukXWUAe7R+IA3uMA3HQyoBCZYyU6u9t8uq7UYz9Zbeaw9uwsADCmwN+TckTsGJRV
 4RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sv8ShlWCFYrRvkMTcwOZXNbuS9oUEdPA5USpJjouThE=;
 b=MpaLhgB6KS0Zmr4jq3SqRRqmKHNbMqfrl5cjaitf0D1J5YWvpI6/v1hH3fO9TngVKw
 mWIn8yfjx0JYvFtalIV9V+avYxJZzCSNiGMfBeyLUqP7eUWbwLq0L/ByLcz9UpL02mtm
 5e7m0o72f6JQSJm7P/gUlgurQ8pLu9bu41cF5Z2jm/KN8pgbFS/OQPmUaduPQHtuY1t8
 38HPKF5EK0lUylgNpkT5lV5rIcyj+3JVkTOwsnQrD0hYemUsQKDVZP1wol6XhFqlasWx
 O0nlUAqD6ksgcIH9O2A5MiOchdTUzSaAUNa3Fq5kKGVwBEpS6oyltmLwrKFp5j4P2Id6
 On0Q==
X-Gm-Message-State: AOAM5330CoAamS0ALz78T9asTT/IbPWVyJqLcxZw6DYdzxm554Yzqkon
 QDzQQSETZiGkBiykmS/8+VvjynRdYqOhqIxDbKE=
X-Google-Smtp-Source: ABdhPJwn2G/eQ/cTmZ4tw/XztL2pHSPpSZmCTo0b2P4Qui2SzWi6hDRqjufrC2EUtW2Zd42jmLZarDzkmZOZXrf+qWk=
X-Received: by 2002:a05:6830:1697:: with SMTP id
 k23mr115526otr.132.1618504072201; 
 Thu, 15 Apr 2021 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <1618479020-38198-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1618479020-38198-1-git-send-email-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Apr 2021 12:27:41 -0400
Message-ID: <CADnq5_OzUTQnTFjp2KFij3M8g3Fgq+dfMJyn8dkjzU+mR3yceA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/si: Fix inconsistent indenting
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Apr 15, 2021 at 5:30 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Kernel test robot throws below warning ->
>
> smatch warnings:
> drivers/gpu/drm/radeon/si.c:4514 si_vm_packet3_cp_dma_check() warn:
> inconsistent indenting
>
> Fixed the inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/radeon/si.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> index 88731b79..d0e94b1 100644
> --- a/drivers/gpu/drm/radeon/si.c
> +++ b/drivers/gpu/drm/radeon/si.c
> @@ -4511,7 +4511,7 @@ static int si_vm_packet3_cp_dma_check(u32 *ib, u32 idx)
>                         } else {
>                                 for (i = 0; i < (command & 0x1fffff); i++) {
>                                         reg = start_reg + (4 * i);
> -                               if (!si_vm_reg_valid(reg)) {
> +                                       if (!si_vm_reg_valid(reg)) {
>                                                 DRM_ERROR("CP DMA Bad DST register\n");
>                                                 return -EINVAL;
>                                         }
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
