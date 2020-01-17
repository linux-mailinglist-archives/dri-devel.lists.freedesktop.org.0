Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D241416EA
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3697D6F9E7;
	Sat, 18 Jan 2020 09:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465046F91B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 20:48:11 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id c129so7021657vkh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kvYoN4fXranoTX+Qa5a0sJ3/lj3Hn7yx+pDCue4/XE=;
 b=k5d/i0E8CkSojnVTZut2knWfj21OwOXmdo8M42Tg7VctwZXbTz4V/giKwj5QPWrtND
 5lOgNmPuGjz/W9R+Rgl1Ed1GeyFLknOE8yyOucUTpUTfCFTa0Ej0N3Uu52sgf5B5uFF0
 LKSmm921h73ejQAO7KNBMDsqVHZBI0Bgkn5e82q3JZPCa2904XduX8eOA3UXQ0o0Iolz
 fwNhnpiaNL2MTEsqW9Pq05ZTmOEeKXEHpihRitgcsMhci1bd9WdzZmsBhwW198PAtMU1
 dGgPKK4Ac2bpqOVnmEAMbh+abS13iZ5jFWrhOzktZdlFDOombq44J05cjnUbE/RgQpz1
 6D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kvYoN4fXranoTX+Qa5a0sJ3/lj3Hn7yx+pDCue4/XE=;
 b=TgQKPZb3TwOdUY9sMwUGMjXTabhBkJN+FowNMQd6yaCFfgmgjwpz/1nJMVgnO7scn+
 B85oyMNLdilz1kuTXPXxyahndg59OvS+dbOmkK2Hdizq8ZLLYSSSFve7Ss0AyU2pV7/Y
 HgtcZnVzaZjt1wGUc/ROJ/b3ji3NnfY/Z5dFCJGnLL6ufqqVYD1zltQZI1bQxHrXLN1Z
 zm+5HU/lJlV/J9i+eyrJRPCFPXiSMziOxd1oB11COf9+jJaeb3zHv34MtIXa5C1wdo/E
 loO+Xf8NIsEMKrYhGA+CoXu9ipobyWTlfCeY4xP9krcRavjdB1QIeRHgrPXOZdXdGYyu
 i8zA==
X-Gm-Message-State: APjAAAUB8Gtb6n4tgVxgsddUm8wT5/btqhpz0pWojvJz2BR3MxudvTys
 nFoj0Sr5+lGYJ4fBvJl0hKx7GknFZv9X3IiYd0TovQ==
X-Google-Smtp-Source: APXvYqz+kmGzGuNvOvVxhPATYhmcnsL6GJHTgKQ9ubRXxPOlN1Q7ZFiZ1Z8r9MVbFsMAsMjwDFzboW2Vqzv8b8zV5ew=
X-Received: by 2002:a1f:5e54:: with SMTP id s81mr25168776vkb.78.1579294090074; 
 Fri, 17 Jan 2020 12:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20200115205649.12971-1-brian@brkho.com>
In-Reply-To: <20200115205649.12971-1-brian@brkho.com>
From: Kristian Kristensen <hoegsberg@google.com>
Date: Fri, 17 Jan 2020 12:47:58 -0800
Message-ID: <CAOPc6T=bfEt3=VbzAQGtFi01oDgcxgrZLkMb4QWO1WWEou3_Ww@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
To: Brian Ho <brian@brkho.com>
X-Mailman-Approved-At: Sat, 18 Jan 2020 09:55:11 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 hoegsberg <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 12:57 PM Brian Ho <brian@brkho.com> wrote:
>
> This patch set implements the MSM_WAIT_IOVA ioctl which lets
> userspace sleep until the value at a given iova reaches a certain
> condition. This is needed in turnip to implement the
> VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.
>
> First, we add a GPU-wide wait queue that is signaled on all IRQs.
> We can then wait on this wait queue inside MSM_WAIT_IOVA until the
> condition is met.
>
> The corresponding merge request in mesa can be found at:
> https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279
>
> Changes in v2:
>     * Updated cleanup logic on error
>     * Added a mask
>     * 32 bit values by default

For the series:

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Brian Ho (2):
>   drm/msm: Add a GPU-wide wait queue
>   drm/msm: Add MSM_WAIT_IOVA ioctl
>
>  drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.c |  4 +++
>  drivers/gpu/drm/msm/msm_gpu.h |  3 ++
>  include/uapi/drm/msm_drm.h    | 14 ++++++++
>  4 files changed, 80 insertions(+), 2 deletions(-)
>
> --
> 2.25.0.rc1.283.g88dfdc4193-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
