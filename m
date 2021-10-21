Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014E4369D9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3C26ECD5;
	Thu, 21 Oct 2021 17:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C826E48B;
 Thu, 21 Oct 2021 17:56:03 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id g17so1235974qtk.8;
 Thu, 21 Oct 2021 10:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hAV42tauO1V5AmOfnutuHncYWnOdndS+sBToQSeaE04=;
 b=jr1dw8eboC1lwuav3MPEXlH8YoXTL8MiSlst/iZX6kHbvaiNKQ0apnepusYZK5A925
 0fr8V/zTsFI7kphXkfcxJumqId7+5VQMYbrSLomdi5kbFo1WipAN/uonnQa9p6Zfkzd4
 KSyUn4QKQxYeIcibCaYSxg/xdzL8yUKCflNCHTnvECklQDfYznW/lbFRqfzBbuzSzq7L
 5vfqm7dUkmZXWuNSqlWtL5CNJ/o3F3swKwxnDw9yVuCjPJwLMW35whBnB10tkd1qkfyC
 Z9AHdIkQm3GoxvO0bd3ynrRqEc7mGrdQivEua+7gCpduZeKKBG+evPT0cVeeNDBa+HuG
 FSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hAV42tauO1V5AmOfnutuHncYWnOdndS+sBToQSeaE04=;
 b=Q8/1eIWy7gE8I1u+QjkkrZoo8Hmchy9D+mqac6AFMUcdekpz88HeeFuFElTQd+cKFT
 rKGt3NUMuzL8Fyv7mI398j0B9PhF60XsqxaYeCTIvAakeRTX75zgZyO1bNJ8bRJMV5VK
 eL+aKUQ/nBLUwqoXE/DiW+FvgbK6zAyJmySFvkk5XiGwcoxtEsknZD34B3wgCd7QP2tO
 XC19PIboNVfuOC5OfUyD0ns8urz6MfwNHcYEPQL9Q6aBbq9Nq5tqvL2Q2KGTBSajd+qI
 6TGTxowhb4M+NcEkex9BUYZRMKiisVcwtKksQk45CWvPyDSjP6lQZziD6Bfg/tkIirMV
 lBKw==
X-Gm-Message-State: AOAM532ixPc0sccerkZ2vvKTzXli511qGeVV6aHZAjQ62tMuGCJv9J4z
 CuM1WVneUJcFyGoixBLnQ/6WAszRkFWH9Sq1x8Q9PyZQugk=
X-Google-Smtp-Source: ABdhPJw1WAWtzBqdH6NXbYpG0Sf4eWPlbXKcnC6nLgGgEXUYv5mKh9RLab0um9Dzk3BdLnBoO5Ml4zfm1kE3CVQLA14=
X-Received: by 2002:a05:622a:1209:: with SMTP id
 y9mr7955263qtx.13.1634838962903; 
 Thu, 21 Oct 2021 10:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-16-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-16-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 18:55:35 +0100
Message-ID: <CAM0jSHPza2KL2CmquMCyOM9q7+kN306+KN+FuQ+vZW9oB8Hdpg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/28] drm/i915: Rework context handling in
 hugepages selftests
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> In the next commit, we don't evict when refcount = 0, so we need to
> call drain freed objects, because we want to pin new bo's in the same
> place, causing a test failure.
>
> Furthermore, since each subtest is separated, it's a lot better to use
> i915_live_selftests, so each subtest starts with a clean slate, and a
> clean address space.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
