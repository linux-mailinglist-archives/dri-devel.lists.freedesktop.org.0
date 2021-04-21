Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CF0366E45
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 16:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749DF6E9BB;
	Wed, 21 Apr 2021 14:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BB66E9BB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 14:32:30 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso16627912otl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KatKMRcorHaCB8knJAAJ9JHDSKXTyx9e9HLULQuHgrw=;
 b=Lk9mhpUltJNpMeMC/+MYMF5AVtHdMcxa/Gaf0vfsQCCCNJj9tDSD+Yt0gsFvik3kR2
 I1N0CxLCo6qJDWjfOHXnxmah+smujMVA5FU8CRp/HjbzUew2IJ4z238DWKHVzWQGQvAn
 bss0JKTo5oLvIuqC1kbc1BJqut9z24/EJO/4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KatKMRcorHaCB8knJAAJ9JHDSKXTyx9e9HLULQuHgrw=;
 b=uDXtoTJ8h4JxYMMOl5AINxwIuiywCxm3/Ewvl5SjGv8o5QYFnm1CVnw6yx9HNfhipi
 KeoTGmd/iRMI12XNhblmhMs8+vyxxwEZHu21B36gw/vqequP9Z1DrkmhDcX/6zk+q85G
 JbnXCJXUKphpE8r/s73YFtgZjjVBcw1um7DJ7SpCFZNZmyJFiZVnn3B7TvgOJaphTx82
 nG8UpGiCy6HfIiuXlMeP2Dh93Nnh65RqT20gmnI3tqm2DDH8VJt2lrJHbtvo8hE2qoeo
 mpLviTsclbVKq/ZcRRaXG4sITQvUolB96Tr90rSz9wJ3lK/dozMr0H2d2i/anLu5DPr5
 nChw==
X-Gm-Message-State: AOAM533mO9o9EKfF8VuW/Sg++ocdLVyLd3EI9K/ieATzMOs7Et9guZ5M
 gVpnTPYiOK65fR4ZpSQV/pFxl4DbZyGK9f5zjVNGTw==
X-Google-Smtp-Source: ABdhPJzhesco6THmq6TsUiGIDC3hulWXQaMptXynVdEEkp0XyOzFvk6Agm/HhpxmFj31qNzTiQMCz5w39aqGVCzGpgs=
X-Received: by 2002:a05:6830:1398:: with SMTP id
 d24mr24080226otq.281.1619015549354; 
 Wed, 21 Apr 2021 07:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210421120353.544518-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210421120353.544518-1-maarten.lankhorst@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Apr 2021 16:32:18 +0200
Message-ID: <CAKMK7uFpoY7YMEMbftjq+P5XHR6L+F0KwFtbK7CtuUFy7HsLkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Fix docbook descriptions for i915_cmd_parser
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 2:03 PM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Fixes the following htmldocs warnings:
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'jump_whitelist' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'shadow_map' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'batch_map' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_cmd_parser.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
> index e6f1e93abbbb..afb9b7516999 100644
> --- a/drivers/gpu/drm/i915/i915_cmd_parser.c
> +++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
> @@ -1369,6 +1369,18 @@ static int check_bbstart(u32 *cmd, u32 offset, u32 length,
>         return 0;
>  }
>
> +/**
> + * intel_engine_cmd_parser_alloc_jump_whitelist() - preallocate jump whitelist for intel_engine_cmd_parser()
> + * @batch_length: length of the commands in batch_obj
> + * @trampoline: Whether jump trampolines are used.
> + *
> + * Preallocates a jump whitelist for parsing the cmd buffer in intel_engine_cmd_parser().
> + * This has to be preallocated, because the command parser runs in signaling context,
> + * and may not allocate any memory.
> + *
> + * Return: NULL or pointer to a jump whitelist, or ERR_PTR() on failure. Use
> + * IS_ERR() to check for errors. Must bre freed() with kfree().

IS_ERR_OR_NULL or needs an actual bugfix in the code since we're not
consistent. Also s/bre/be/
-Daniel

> + */
>  unsigned long *intel_engine_cmd_parser_alloc_jump_whitelist(u32 batch_length,
>                                                             bool trampoline)
>  {
> @@ -1401,7 +1413,9 @@ unsigned long *intel_engine_cmd_parser_alloc_jump_whitelist(u32 batch_length,
>   * @batch_offset: byte offset in the batch at which execution starts
>   * @batch_length: length of the commands in batch_obj
>   * @shadow: validated copy of the batch buffer in question
> - * @trampoline: whether to emit a conditional trampoline at the end of the batch
> + * @jump_whitelist: buffer preallocated with intel_engine_cmd_parser_alloc_jump_whitelist()
> + * @shadow_map: mapping to @shadow vma
> + * @batch_map: mapping to @batch vma
>   *
>   * Parses the specified batch buffer looking for privilege violations as
>   * described in the overview.
> --
> 2.31.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
