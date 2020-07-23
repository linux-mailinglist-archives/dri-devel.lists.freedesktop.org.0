Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755822AA46
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 10:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2E76E200;
	Thu, 23 Jul 2020 08:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251166E200
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:01:29 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id w17so3754832otl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=udszHcSXsT4dQ3NuGugQMUyp4GH9Oigj4Zp+/fN1xeE=;
 b=F3BMSeBeZ+HLzAI3wwQ4zN4ZWw/DyqownjHjQ82cXNtIE4vpJJqqetNX2gv3IYaMA+
 ca0/0T0EScyio7LiFBuNI9iQsjtXOFjgfsPRlHr0SD+rbwohcgmxftm9s5PlgDrtdvAl
 0GondLm/gxwNQCtw0IDwQVLM24CSsULefWPyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=udszHcSXsT4dQ3NuGugQMUyp4GH9Oigj4Zp+/fN1xeE=;
 b=abX7DJPNaQHuUiV1vovclxK85fn16mjnPgj03a9z09uvj2Yxb0rJ1TFyoOl0dAgTNQ
 vG4mvEaMmsLP3KS+bEQXwjsc5dCSZA/i9iCHBKRSlNeFSAt8B5FO+CIDy8SM11F2LkZg
 o1wNKAqZgkOX1s+F0icdca+bDDIYhE/wG2EY5d4h7n/ZJtoSuColX8ef5JaetjRznZdI
 7G0inQoXRhmi2dpxuVrvnUlLvyiLEFLwqEpxDyVVTyb3DiZrSrqVHOr49hkCVhs1/TMP
 OuchwbU8LRGt48DsS7rVsCpIpucPnZpssUKMKF6DBtks4QVgXXeJ85V27nsTHPmfnYCY
 XLNw==
X-Gm-Message-State: AOAM532+D9dPEsMK0Lokc/l5SIJgzi6ebc2fCBfAC9uuDvF2nbisE7Dr
 LtIaOMS1IeqVrhSqhfbQzxvbg0nc8OfOmj1T29lVFw==
X-Google-Smtp-Source: ABdhPJyErzT5Y8MQ0PTeEY2azu7bSVDw5wjEK5u+1316FD7VE3IPZHbIJjK4KSESg+aThLWlAYcVH2ah+V7lo4STqC8=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr3416440ota.188.1595491288375; 
 Thu, 23 Jul 2020 01:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200722143417.42b52c73@canb.auug.org.au>
In-Reply-To: <20200722143417.42b52c73@canb.auug.org.au>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 23 Jul 2020 10:01:16 +0200
Message-ID: <CAKMK7uGZ4qdtkD6r_RzRUiEXrumkdAwENuKfKmfsuscQZtkWqA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 6:34 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> [I can't find a previous email about this, sorry ...]
>
> There is a semantic conflict between Linus' tree and the amdgpu tree
> between commit
>
>   d7a6634a4cfb ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
>
> from Linus' tree and commts
>
>   fe098a5d6443 ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
>   836dab851903 ("drm/amdgpu/atomfirmware: update vram info handling for renoir")
>
> The automted git merge leaves two "case 12" labels.  I have been
> reverting commit d7a6634a4cfb since July 3 ... This will need to be
> fixed up when the amdgpu tree is next merged into the drm tree, or a back
> merge of d7a6634a4cfb could be done into the amdgpu tree and the older
> "case 12" label removed in that merge.

Yeah this is a bit nasty, I just crashed over it too (btw moved to
drm-next now). Alex is this the right conflict resolution for -next? I
think we should bake this in with a backmerge ...
-Daniel

>
> --
> Cheers,
> Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
