Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D3725890F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9FB6E22D;
	Tue,  1 Sep 2020 07:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123846E566
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 02:35:21 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f2so5615730qkh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 19:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sAkSksCshNCD0adm0PWVHtppOopUbUnVb4Kv/b5sxpQ=;
 b=X7VDKvWuVcCm6d71WbRGDBPl2PRAA3caYAsvX9a0iQnhlqUGnVr+3lTD9uiPKrGseV
 wvPYn+EjmvIw6hkJcskfTKPfWbrPa7yIAcqVY2uT5fcssTxk0ZIs53cKvafxjTE5fNpQ
 jK16OSHp6Y65G+bHCw/vFEXPKBFsH6Lb1UgMPJaaDUpwVy5tgHc+2vAabhmoMBNYb5NJ
 b5jDpAsGaWNATCkGPINy9jYFeTjF/zBU9R25CFrPGzRlE+Y75c1hBeJcPbcYDWBu8zvo
 vt0AzczXlEUBbhTgQp6yM7xku5oqHjQl9CDobdE8t5xv2S3t5FLTki5btvB1VzQiRAiy
 RkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sAkSksCshNCD0adm0PWVHtppOopUbUnVb4Kv/b5sxpQ=;
 b=Txbwt54TIdQmVEnhkQXhLhzddaeHeGBFysDJniuEQriFJZ/Sdiy0RGPYhcLHUpGGK4
 i06q7Ye7CAGsWVEmY2dRcZJ7lSuWk6be8GgGfJzJ1fVAvUqgFPgT7A03GNeVUfVa/PxH
 XiWbshqSPBqo1cLUoIDYZqhbGxyzTdhEksgE3URLpsYBpOMY89jcFR4BnB7F5SlKtNfV
 Bl6elzD/KM3ZG+zAhhmYRYZW3H9GUP5gLhUTgmIn7s++GkQzA1++f+9uXeeTJfjHETyr
 VrK09EtXPJU8KLZngSt5NkPRxY7t8PQi4T8CAIlxT6YWNpmPI6ehpizOnUZ/jiHLoPHU
 Aphw==
X-Gm-Message-State: AOAM531u9fdJfvWIpwy2auuZWrz9fYhximWLTK/w8AuEO5d43CKGMvM5
 cRzVi3sfC23zAohYwr7VM4tj/nmX0gzqJw==
X-Google-Smtp-Source: ABdhPJx7BeaFp2dnidck1oOhhHfYj6kzJNHKwcvWvxlyJU5srYROFYeR2ubg0/k9FzuVLaIx3C+6Xg==
X-Received: by 2002:a05:620a:567:: with SMTP id
 p7mr4710228qkp.164.1598927720041; 
 Mon, 31 Aug 2020 19:35:20 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id f22sm3589377qtq.64.2020.08.31.19.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 19:35:19 -0700 (PDT)
Date: Tue, 1 Sep 2020 02:35:17 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 01/19] drm/msm: remove dangling submitqueue references
Message-ID: <20200901023517.GA54956@uller>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-2-robdclark@gmail.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, iommu@lists.linux-foundation.org,
 Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 14 Aug 02:40 UTC 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Currently it doesn't matter, since we free the ctx immediately.  But
> when we start refcnt'ing the ctx, we don't want old dangling list
> entries to hang around.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index a1d94be7883a..90c9d84e6155 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
>  	 * No lock needed in close and there won't
>  	 * be any more user ioctls coming our way
>  	 */
> -	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> +	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> +		list_del(&entry->node);

If you refcount ctx, what does that do for the entries in the submit
queue?

"entry" here is kref'ed, but you're popping it off the list regardless
of the put ends up freeing the object or not - which afaict would mean
leaking the object.


On the other hand, with the current implementation an object with higher
refcount with adjacent objects of single refcount would end up with
dangling pointers after the put. So in itself this change seems like a
net gain, but I'm wondering about the plan described in the commit
message.

Regards,
Bjorn

>  		msm_submitqueue_put(entry);
> +	}
>  }
>  
>  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
