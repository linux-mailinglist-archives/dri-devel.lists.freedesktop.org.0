Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FA3B7E62
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 09:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D686E944;
	Wed, 30 Jun 2021 07:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8536E944
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 07:52:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id p8so2437412wrr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 00:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wOxmLFndlXa2d1V0T05sYsl4lT5itOeNvlkZk0Avz+Q=;
 b=ikNfwr8dsQxPYvXVd2JpCFSsQN7+jQCSxES3AoMvrS0X1BfZiMLDkRN7PmDBKF8TRj
 vhMoJjYQ3yQVBr3edmNod0PjwEx3xtFE68H6deOd6D69foAog+Xcmy9u8Yj1DMW0moJU
 KKQkhjbPkendNisnKCISBQBAiGYashIYC5owE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wOxmLFndlXa2d1V0T05sYsl4lT5itOeNvlkZk0Avz+Q=;
 b=WknBkJXG4YN7ARJmusJYw6IlBkvVlJawTXhCJNJA+oLQO8GnjvXoZAfp1btKtfOwca
 W8sQgQvjTuC88MJTz/hV1uwq7qN+OtGGGpmCvJwte6qXx7Uxd1mc1R/u2XBGgd+cdYAl
 QojmjH5iDUb5bsF/DwvKCWLyu6HzXwnQ7U/hNJ10E3AuD9jTaxaOi/r3oTn5jmtq/otx
 wEYc3ukg9ZHWbbsuBt61LX0mbsfbebx8s9t4+/+oiY002sVU7kKOOIq//f92b8AzCusf
 xopIPAtyxDXFSAvt9hZtwRjj/lzUMDzLfmZaKcYFkNZB9RSH3RP1pqEmZBCmN99nfr/k
 SYYA==
X-Gm-Message-State: AOAM533CHakhWxhak88VB0v1IDRRPbH0RhJLjezipvZTA3onOZk4oHI0
 Q8vPljIVjELpmKJBnU10yCTa1g==
X-Google-Smtp-Source: ABdhPJzksDLLyl5JYz/VO3JfGdb3+XltUAqhsuRuplUq/hWSV8jMYKi9pKpp/4ZO1ojV15tAH2Hj2A==
X-Received: by 2002:adf:fa0d:: with SMTP id m13mr12174307wrr.325.1625039577675; 
 Wed, 30 Jun 2021 00:52:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c8sm20141944wri.91.2021.06.30.00.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:52:57 -0700 (PDT)
Date: Wed, 30 Jun 2021 09:52:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/2] GuC submission / DRM scheduler
 integration plan + new uAPI
Message-ID: <YNwi138/oYKTlp+p@phenom.ffwll.local>
References: <20210629193511.124099-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629193511.124099-1-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 12:35:09PM -0700, Matthew Brost wrote:
> Subject and patches say it all.
> 
> v2: Address comments, patches have details of changes
> v3: Address comments, patches have details of changes
> v4: Address comments, patches have details of changes
> v5: Fix checkpatch and docs warnings
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Pushed to drm-intel-gt-next, thanks a lot!
-Daniel

> 
> Matthew Brost (2):
>   drm/doc/rfc: i915 GuC submission / DRM scheduler
>   drm/doc/rfc: i915 new parallel submission uAPI plan
> 
>  Documentation/gpu/rfc/i915_parallel_execbuf.h | 122 +++++++++++++++
>  Documentation/gpu/rfc/i915_scheduler.rst      | 148 ++++++++++++++++++
>  Documentation/gpu/rfc/index.rst               |   4 +
>  3 files changed, 274 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
>  create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst
> 
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
