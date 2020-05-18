Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB871D7BCB
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4224D89198;
	Mon, 18 May 2020 14:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEAF89198
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:49:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f134so9595648wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w8qWhEGNxXIriwWcPIqvVmLIuxRM5oHqT9io7z4i37o=;
 b=OqVXZ8MSVbpgWC0Q1Q6hCXlwMVhE1C3RR80/TXkoI8YEe36HrvmfeJ4igjHfoNKLLi
 D7iZPCO409nVVbV1A+nRa5nX85YtBW5MsgxvIR1t0gxU25vKAGcTz2Itsldmo6FiQpx4
 0jcjHY39rbJjG7ZrvPFkj/MeRF4dIxkeJzt0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w8qWhEGNxXIriwWcPIqvVmLIuxRM5oHqT9io7z4i37o=;
 b=XHMnoSpK7zFF1g8xYlwf/dVnWOBcHtemsn4gpSMGmsgkcTr7uV+tZyL3y57At2NTK5
 RhcwldV3Bka0VR1iHagwfLUAcZOvA80Ei6OeWyh9BHrILhyLxGr46RV7FnQygmYVxbKm
 yRcL/gtfXtg5Qo7aJWKwPjwRG4WPhkILoFZIkn5JrXa147U1BsCSN7TrXDWOYC4AILsX
 Xv2B3L83aP1+UDjDT+zK1nbKacj3j5jz8+Qu5iRbCSyf7ULoFq0eCyLMYalwEM0D8+ud
 9p9aFfIuFf1EflEmyyylGF26U4j1vFZpJtupMriyuWBmWVFnmYSOSEA9mKhAeY3ujNqk
 yVLA==
X-Gm-Message-State: AOAM531Y24LAbxSS7bO432xUve1Z69qyyWdHIGWCBPSxeHAOAhzeYjXu
 I3B3JChZiZCNyjVimxZIKwg8TA==
X-Google-Smtp-Source: ABdhPJykpcZQxCdyfSSbELW8LfpoS3j4ZjG613g16tNLNCVvQjUgQNXDXBGgbt+BvaOhELZMuE9iDQ==
X-Received: by 2002:a1c:208a:: with SMTP id g132mr19534436wmg.78.1589813358772; 
 Mon, 18 May 2020 07:49:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h20sm16510216wma.6.2020.05.18.07.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:49:18 -0700 (PDT)
Date: Mon, 18 May 2020 16:49:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 3/4] drm: Describe dp_rev for drm_dp_set_phy_test_pattern
Message-ID: <20200518144916.GQ206103@phenom.ffwll.local>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
 <20200516212330.13633-3-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516212330.13633-3-chris@chris-wilson.co.uk>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 16, 2020 at 10:23:29PM +0100, Chris Wilson wrote:
> drivers/gpu/drm/drm_dp_helper.c:1598: warning: Function parameter or member 'dp_rev' not described in 'drm_dp_set_phy_test_pattern'
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_dp_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 43e57632b00a..532b07118542 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1590,6 +1590,7 @@ EXPORT_SYMBOL(drm_dp_get_phy_test_pattern);
>   * drm_dp_set_phy_test_pattern() - set the pattern to the sink.
>   * @aux: DisplayPort AUX channel
>   * @data: DP phy compliance test parameters.
> + * @dp_rev: DP revision to use for compliance testing
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
> -- 
> 2.20.1
> 
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
