Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A94220C97
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 14:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C505F6EB2B;
	Wed, 15 Jul 2020 12:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8CA6EB2B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 12:03:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so5311104wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=1FfPLCjiOZfVPMY6SEoLGJR3cEuEk/qp9UiuwmY8/Zw=;
 b=GkljGvwOCvf76Prs/T1i+Yd+t6gjS1q2k0DDuf8Nw3P2TZeBhiKCa2W28KEezNnfjJ
 ta7zQwmbNPFnYUnKRwCJ7wpo3PXTVaijagpMhPGkaj4Hv8iNYMv6KrMkXMkR81pk/ep0
 nCKtHZuztA/GRllSpUW06if8oWgRaGxpuVN3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=1FfPLCjiOZfVPMY6SEoLGJR3cEuEk/qp9UiuwmY8/Zw=;
 b=YCni8jrSU8XInFWqRSd5AiHROSDgi72T6ajHa5kGooRERPVoH24whEddyQmYAv6cwv
 wKrMEh8X9yZ4hXud1bZI6RE2uH+8aOpat7XsJ7Ruh5za3cHjOzloFwatep52BBpCXLIl
 ki2oHKvzCFuIHLQI2IugtzgacqQQPo6guutyH874Oc41MOwt9omHCZUpE3GgNINR10dU
 moMIyTrD0opKmJlvda+uKUSoAf8GYwaDZksFu9qnr3YNsCJWUg0745DS/xtxl5nL9Gw0
 tP6lpnZ5s0OmIVPslshWrnGEG0dyWEGPYpA4CGxcVRCs4clmqYyBlr5IOhbnd7cAduFA
 Vu2g==
X-Gm-Message-State: AOAM531grpUokWhmFMZFZyD6I+tiZRr0lb2SDIBUTiBZ/HJima10uHaG
 bD63/YdcqZE/aIGBqqlE4vA92w==
X-Google-Smtp-Source: ABdhPJybPrQq/NJXSsfzu2zrR2PYj1djREC+vWdXXMxKQd32mcieYtJ911F5wuoWXIjo/InQSCTdEQ==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr8205466wma.18.1594814621638;
 Wed, 15 Jul 2020 05:03:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w128sm3557542wmb.19.2020.07.15.05.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 05:03:41 -0700 (PDT)
Date: Wed, 15 Jul 2020 14:03:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/7] drm: drm_atomic.h: delete duplicated word in comment
Message-ID: <20200715120339.GI3278063@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <20200715052349.23319-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715052349.23319-1-rdunlap@infradead.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 10:23:43PM -0700, Randy Dunlap wrote:
> Drop doubled word "than" in a comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Entire series pushed to drm-misc-next, thanks for your patches. Should
still make it to 5.9.

Cheers, Daniel

> ---
>  include/drm/drm_atomic.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200714.orig/include/drm/drm_atomic.h
> +++ linux-next-20200714/include/drm/drm_atomic.h
> @@ -103,7 +103,7 @@ struct drm_crtc_commit {
>  	 *
>  	 * Will be signalled when all hw register changes for this commit have
>  	 * been written out. Especially when disabling a pipe this can be much
> -	 * later than than @flip_done, since that can signal already when the
> +	 * later than @flip_done, since that can signal already when the
>  	 * screen goes black, whereas to fully shut down a pipe more register
>  	 * I/O is required.
>  	 *

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
