Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD6A3889D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3988910E56B;
	Mon, 17 Feb 2025 16:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fNm/sYYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7524D10E547
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:02:39 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f2c4382d1so1779136f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739808158; x=1740412958; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=43jaqScBOTTKMVVM/pAEA4ORlDlz298tH89aK7G/qzQ=;
 b=fNm/sYYYaGV/AYgWURcnSL+oExTWpaGe2mjubqbn02m7Re0imUTeAlenGxOIUByhDa
 RQe/TYRiqD/ziC+BxJp/PJZ5QYd2kpLNDB5NBoc9oraAxBQALV9TyV29/LgwOiXgDcQq
 FpLDgD3RVVZFveQNf2+csMvo6UY7GbTc1x5DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739808158; x=1740412958;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=43jaqScBOTTKMVVM/pAEA4ORlDlz298tH89aK7G/qzQ=;
 b=hMQaiVvU73Gkj16/ycekgPQt3QjC21Ud99a3kyq0K1n/tau2qAAghOrLjHIEAUEGi/
 rR8YuDGjLdWK5PLQ3rWT+qR5SoFDdJRNilq5r32Zr+MFu7gPtDWEc8GV8GkJysHamu2C
 Hf2UR96JDw6XivHHkpqv8YSq2Im2B7PjtzbBA+igKNEHdFc5cUpXvV3JPzrC+j52SnOo
 hxLGbCbhRdQITeeP4pZ808T/9M0PUig60lGWWA9kgRIw8aOQNYZXa3A4RLaQ60YIgzQh
 Mk9Sbcjdq+AxktxUnWMpWoVcYFGbTf0e/Qyh7zaQzSUxGIoB5TM19py+/O34D6lmpWoF
 uaRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPW5xpmkNnqxVwVe1tIkfAV6uaalIxsqw6NqMnDifI6nMrgpoFS/7cyPaDWC7mEjoeY0byy7mQ7xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxK0SEz9tP4beD0w4VZugoGyt1jOe9dkhwG8KEp6Hp5y8S7WTyg
 8Uerpomm6uGX9RDZCR7l7Bb7YNA0o9JYmi1mFo4AHlhffFK3RdEC9T6SCoNoCM0=
X-Gm-Gg: ASbGncvh0Oc90u+F1hgzisBT6xieVGWYccSLQE4l42xZTtmR9MaVH8uneU49LF5zuLi
 JowAP6oo37flhgs2gzYKZj4VxlhJUNsksSyYHHrMFSQfxpKD5n1TavlxSk1E9qtIZ6K/N9TWIZz
 9WaC0l0GEkrKugMLUlfKxf2sUiEckyQjTIvPBwFmnvDEJ7v7ryhTZkmXXRsyaGINLEC/8IePjUh
 6pHd84Dmt6MFfWH8FvPxrv66bGlox3lBtmxZUXIFpipv95zFLoykj3efCtTQpEaOMEL5DJdqruR
 kAW5iReJJasP5IC6adDh3lYKzVk=
X-Google-Smtp-Source: AGHT+IE8p/f7NWuxULy0RX/iH0m4yLEHHpOnki67v1mwiYaFNEagW21xEE3gux9AX/k9Qh9uiKXEuw==
X-Received: by 2002:a5d:5f4e:0:b0:38f:2a99:b8e with SMTP id
 ffacd0b85a97d-38f339d85femr9481489f8f.4.1739808157513; 
 Mon, 17 Feb 2025 08:02:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fa1esm12476884f8f.100.2025.02.17.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:02:36 -0800 (PST)
Date: Mon, 17 Feb 2025 17:02:34 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/4] dma-buf: fix incorrect dma-fence documentation
Message-ID: <Z7NdmkEPYRhYi0Ax@phenom.ffwll.local>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211163109.12200-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Feb 11, 2025 at 05:31:06PM +0100, Christian König wrote:
> There isn't much worse than documentation giving an incorrect advise.
> Grabbing a spinlock while interrupts are disabled usually means that you
> must also disable interrupts for all other uses of this spinlock.
> 
> Otherwise really hard to debug issues can occur. So fix that invalid
> documentation.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Oops :-/

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/dma-fence.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e7ad819962e3..e230af0d123f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -169,8 +169,8 @@ struct dma_fence_ops {
>  	 * implementation know that there is another driver waiting on the
>  	 * signal (ie. hw->sw case).
>  	 *
> -	 * This function can be called from atomic context, but not
> -	 * from irq context, so normal spinlocks can be used.
> +	 * This is called with irq's disabled, so only spinlocks which also
> +	 * disable irq's can be used.
>  	 *
>  	 * A return value of false indicates the fence already passed,
>  	 * or some failure occurred that made it impossible to enable
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
