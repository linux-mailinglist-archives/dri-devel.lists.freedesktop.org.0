Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7CA2F2A64
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D58B8952F;
	Tue, 12 Jan 2021 08:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393F89452
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:54:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id c124so1158967wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3/6My/N1YrLFvQDKg+gKz1VOU4Sl62rFDPI1zr03AR0=;
 b=LDm1vYWycYft6Pq1UQdop0V2dt9egf1Bb+hDoXxwwKXmz67k+i3wXtV6hgytCieHso
 ldxW7TKOf2KymtwLZTnMdid8A+xzJJAIZxROY9sEyPbL9lKK+Bl4tg5QTRHt30wcji0n
 9+UMQjHeI4ll7QU6SqCMwmSWlwPW7uUDEnj5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3/6My/N1YrLFvQDKg+gKz1VOU4Sl62rFDPI1zr03AR0=;
 b=Fj2OQwPRKRywtAm9SY3N+objx8VkKTh1YoONvW11aPO9jwh5oiE4BjQtgfwBkYcaVV
 ypHxSeg7EpyASNlh8R8FYyIWScRTa57lUALZQXgbVaV7qFT2t8cYCBjpn2Miphs0FTth
 Gyr+E3Zce41+6utcQ6falOwrBMH45Ww43oMREkQZY45HEITcvvzxdnBFTplsQML+lDtF
 Kvca1hhD259cA8+UuEoYprdfVBuSOBAGMtig/jtxt3zhyZRGE2mc5kq2rGSifVkOJq2x
 DwvntJtmcqvWPS6PhTg8PtFoS0k/paH84gNsLK6C3KMiMstA0LEi+AAzGs29kcm38yig
 M2lQ==
X-Gm-Message-State: AOAM5320ZiNTLNPhLk9ZA2ya9xqAAFWsMSVjd+Jj7mi94EP3SmV0YUb3
 CHdZ4CL2RLnQVqyAyr8t1gKxBYKIjsXxY1I/
X-Google-Smtp-Source: ABdhPJwjLMRuPAkF9U461wZdBK24OTyLSLPwahSw4uPrcB/jwHCmwl7tQSgzfp9ZXUXgPpEVMto7bQ==
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr2438928wmf.59.1610441694774;
 Tue, 12 Jan 2021 00:54:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c20sm2772008wmb.38.2021.01.12.00.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:54:53 -0800 (PST)
Date: Tue, 12 Jan 2021 09:54:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zhaoge Zhang <zhangzhaoge@loongson.cn>
Subject: Re: [PATCH] drm: Removes invalid function return value comment
 information
Message-ID: <X/1j3Cb7KCvHD9ct@phenom.ffwll.local>
Mail-Followup-To: Zhaoge Zhang <zhangzhaoge@loongson.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1610415567-32171-1-git-send-email-zhangzhaoge@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610415567-32171-1-git-send-email-zhangzhaoge@loongson.cn>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 09:39:27AM +0800, Zhaoge Zhang wrote:
> Signed-off-by: Zhaoge Zhang <zhangzhaoge@loongson.cn>

Applied, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_file.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index b50380f..8548e8b 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -240,9 +240,6 @@ static void drm_events_release(struct drm_file *file_priv)
>   * before calling this.
>   *
>   * If NULL is passed, this is a no-op.
> - *
> - * RETURNS:
> - * 0 on success, or error code on failure.
>   */
>  void drm_file_free(struct drm_file *file)
>  {
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
