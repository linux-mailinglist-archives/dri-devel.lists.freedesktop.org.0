Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06C175F59
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B256E536;
	Mon,  2 Mar 2020 16:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00D06E536;
 Mon,  2 Mar 2020 16:17:41 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id k188so281149vsc.8;
 Mon, 02 Mar 2020 08:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UdToZ4xf99rijFZ30jxvOOFm2SNaAmw0HrSZJF10syo=;
 b=evp+zsYKrsG2MIku/3qm623YqFGLXsOeglNeuPIDCk8wpjoxPFmdwNJ3EPzc0J395U
 xDtcPxuUBirujzfLePTn/fzlhU88KFO6RfST9p2HDAD7bz3SviVnWEPRUdyCl2DP/QPY
 Z/XXAGvy9ulBD8ZbvqJDuZKU64ERT7xKHUedc5K9pYFJtuvUuwfvGRl5PyB2FgAKwnPS
 hzAkA3h2FjNFx5Cb/PbbPbAeYuYyF1WL0glE5Vk6Fy8ulCBHi0Ak1d4wlzyv1Zq8yjml
 XOvAe4OwE82/USff0Sr3FfiHo+QPloAPU0WconGwZ4tq7fnzvqRLGLw9+2kHVk/B/8/D
 7k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UdToZ4xf99rijFZ30jxvOOFm2SNaAmw0HrSZJF10syo=;
 b=EnzhsqvYWj5ctUox0YdOcnIs2LnKz7UU8WQbTgH2sjOwJc2bzgRvmD4fpJ2zwHIT9f
 NNHWs3thaSLoYkM/aNqsqmuJQB0zkwItWnN+rPCmLoFh9kdFyIrnsy3DdBZh4g1S3ley
 suGm7Ay+2KOLFn2g/zzqbakMLraMaRjTnnEZFaADa+ylv9Dv3AoWNpWrOh461mBYB69N
 XhbGRB5sZGv6b+Sfbx3NqEsrahqeBBpkBoThEZKubbfNcs1wTDv7InAE8LDqFyN8WJMq
 mfEIokduVqwN1Cz5br8AF4jlSMzqWAbL+IfH67Px0Kkh7SXEbDeY6RDJgphwe8G1Z6gT
 4vDw==
X-Gm-Message-State: ANhLgQ0ZpFXBfu1LjP/hpmsLBN+6nvEcacB1mebPSAJmvxETVtnCwX3n
 mXluqww5+4O1G6QiH9HdSvU/Ll1DWdBTVOl04pcexOZvn7U=
X-Google-Smtp-Source: ADFU+vuTyTVEK3G2BCRXxukZorh+OE6MzDXazl81ZTwv3D6V8b8GegKn+hr7CeIeYqu+8VFakjCNAGGA0CJkCH9Q8sg=
X-Received: by 2002:a67:c50d:: with SMTP id e13mr9955628vsk.118.1583165860686; 
 Mon, 02 Mar 2020 08:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <CACvgo52+LRrLkyRdbGOXGzUWdakHOJfps9PJp78x-N6ZXT-SWQ@mail.gmail.com>
In-Reply-To: <CACvgo52+LRrLkyRdbGOXGzUWdakHOJfps9PJp78x-N6ZXT-SWQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Mar 2020 16:17:09 +0000
Message-ID: <CACvgo51CS=Fvb_rZatzSzyJVK5DbuEfhU8kq9VhQb2cosow0+w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/9] drm: drm_fb_helper cleanup.
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 Mar 2020 at 15:58, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Mon, 2 Mar 2020 at 13:08, Pankaj Bharadiya
> <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> >
> > This series addresses below drm_fb_helper tasks from
> > Documentation/gpu/todo.rst.
> >
> > - The max connector argument for drm_fb_helper_init() isn't used
> >   anymore and can be removed.
> >
> > - The helper doesn't keep an array of connectors anymore so these can
> >   be removed: drm_fb_helper_single_add_all_connectors(),
> >   drm_fb_helper_add_one_connector() and
> >   drm_fb_helper_remove_one_connector().
> >
> > Pankaj Bharadiya (9):
> >   drm: Remove unused arg from drm_fb_helper_init
> >   drm/radeon: remove radeon_fb_{add,remove}_connector functions
> >   drm/amdgpu: Remove drm_fb_helper_{add,remove}_one_connector calls
> >   drm/i915/display: Remove drm_fb_helper_{add,remove}_one_connector calls
> >   drm: Remove drm_fb_helper add, add all and remove connector calls
> >   drm/nouveau: Fix unused variable warning
> >   drm/bridge: remove unused variable warning in tc358764_detach
> >   drm/fb-helper: Remove drm_fb_helper add, add_all and remove connector functions
> >   drm/todo: Update drm_fb_helper tasks
> >
> With 6/9 and 7/9 squashed into 1/9, as suggested by Laurent + the
Oops s;into 1/9;respective the patches;g

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
