Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32B32589F7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 10:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6D16E04E;
	Tue,  1 Sep 2020 08:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053066E04E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 08:00:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e16so409982wrm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=DON1B93KuY7+9jae4Nfyo1xwWGGkPp0uBIPW2CFRtfU=;
 b=c6IRa5I6XYQCLPqGTJsIr7RCaMQAMLIllRq+6f+J3imB/VrFXhWjyNpAnEhRDVz5Z0
 yoTbvPnYOI4N+haMYZYnQAQ0mcrIqMSVyJRCGGUwfFwUTtoUvUmEX6FxynSycfoX1BxM
 nTCxbJ2Nu4wnlVINRUXJWL6szXrSVjNRoOz3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=DON1B93KuY7+9jae4Nfyo1xwWGGkPp0uBIPW2CFRtfU=;
 b=LhoG1tt5wk966Kabjb8Sj/HsmSBqJvakiw1P33tAiUrSVxCwUjGDyTZtWdbyomjg1f
 b1S/XZQBnb8E1P6oAAzPSq5SPgItV3S3f8k6GJD+gZZdbahOocMruWl+EcKuubYp/X+a
 AxejvO2gK17Ad0W3gEVRcECXvO1TiCT0EJsCVP7+VYT9msPenbOO31SYjdYpNF+GejaW
 76EzjM/J4l2gkegqITf3Qk1fw5LqN0yle1IYHMSoQFCCI0TBcihoBvLTy5GFL6ghG+lK
 vh6uwLvFj0v6GAGJY+iJreIZfW1kOotrdJOBzAwJApWV55kXSAej2iVrWmO0rgix7Xx5
 QPiw==
X-Gm-Message-State: AOAM532amwgk6/52KomZ+3GlwdC5MlmxftSOPsN4QaiFbfsrQqy56ejZ
 G/XnGYBwAA+/pQcPDcMs6ClKnQ==
X-Google-Smtp-Source: ABdhPJwaDhlNyESVJ0PGHhggeCb5VFlqhaqFSBsqiKLpPib5mEobf7ijjahF+KtPtyeHzw7r+mYNsw==
X-Received: by 2002:adf:f605:: with SMTP id t5mr537595wrp.144.1598947227737;
 Tue, 01 Sep 2020 01:00:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t70sm1492636wmt.3.2020.09.01.01.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 01:00:26 -0700 (PDT)
Date: Tue, 1 Sep 2020 10:00:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: fix dma-buf.rst underline length warning
Message-ID: <20200901080025.GY2352366@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <1b22d4c3-4ea5-c633-9e35-71ce65d8dbcc@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b22d4c3-4ea5-c633-9e35-71ce65d8dbcc@infradead.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 04:41:59PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> /home/rdunlap/lnx/lnx-59-rc2/Documentation/driver-api/dma-buf.rst:182: WARNING: Title underline too short.
> Indefinite DMA Fences
> ~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 72b6ede73623 ("dma-buf.rst: Document why indefinite fences are a bad idea")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>

Applied to drm-misc-fixes, thanks for your patch.
-Daniel

> ---
>  Documentation/driver-api/dma-buf.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- lnx-59-rc2.orig/Documentation/driver-api/dma-buf.rst
> +++ lnx-59-rc2/Documentation/driver-api/dma-buf.rst
> @@ -179,7 +179,7 @@ DMA Fence uABI/Sync File
>     :internal:
>  
>  Indefinite DMA Fences
> -~~~~~~~~~~~~~~~~~~~~
> +~~~~~~~~~~~~~~~~~~~~~
>  
>  At various times &dma_fence with an indefinite time until dma_fence_wait()
>  finishes have been proposed. Examples include:
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
