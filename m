Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C9802302
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A725C10E294;
	Sun,  3 Dec 2023 11:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C1710E294
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:29:58 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9eca5bbaeso12860511fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602997; x=1702207797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L0LyKzKnnjQNBqpZgr3H1rimZEhXmRz8udpJ0Q/WYuk=;
 b=LGuOTk55+bbtTUqbmlEpRJ3WCm1KIZtw6Cpthm9wfSqwr+NoUYjY1hvOfSq+5Cv+Yy
 LuJhS970KtuwebP6EPKrjASehlRaubKItZwHu5JlxXInQEdyAyqE4jT4h5+2/4hBJFzl
 UK5h9vQWneJi9WVOCONXdT4KQE+dIw/zQJ7eaTT+NUp7tYxiwvekmPGyjECIC4mbAvmY
 khbX8obQpVIOG1jp/YZIn1cFl35nmq6TQf06c35DiOSQ0iq2WuRSzJGh8UaMIm9mpZCl
 QIlOEWStocYr6y7SevqiCQ9hqZ2S9Wn31dYXNJIDgzHCphQeH/wIBeq8i9jIS1jTdwP0
 GnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602997; x=1702207797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L0LyKzKnnjQNBqpZgr3H1rimZEhXmRz8udpJ0Q/WYuk=;
 b=RzdSNIusJhvEDmoESlQJ776zcKc+l9hRDLUH5gaXstlljJJvXM910AGtD36y1zDAvW
 jYyvepdFOWbTvEM+rmZruvi7uLWUykDMe6mWei6Nq1mOsw3bcBjCqpZxAtG41ISQkWHV
 BY4E7TZhXmLsg/YjEQqr6LIYNceYXvHVEnAQRk85oVM/1a8iwExeqqBxDbeMr20f31JX
 KWyw02U4I01CrktmD3Jz3Dg+LHgWvFBsN3ABWnVt4eiftjRzi/UKUKxYrDSeEs8hQyYm
 On4vaneEeHJUEnj2aeUHEFUa30o6HcLqhIPy3ZvUwl8ugLBEANY4hcsNOBKJUVrZMzqi
 mjSA==
X-Gm-Message-State: AOJu0YzlAtcWMeAMLHq/5fYB/Pja//bvc+yBNPxoyItyZ8mvxwS7X9RK
 Cp174ULdG8FkPRV7iFVxXomGUg==
X-Google-Smtp-Source: AGHT+IGTWhetex2umS/MYFjg06ukzdRjs5bcWAHhEyNkgUiBPD5J1u1F0p2cwaRW9I0sqe5Y/14uTQ==
X-Received: by 2002:a2e:8483:0:b0:2c9:dae6:442a with SMTP id
 b3-20020a2e8483000000b002c9dae6442amr715352ljh.172.1701602997158; 
 Sun, 03 Dec 2023 03:29:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a39-20020a2ebea7000000b002c9f70a0419sm274718ljr.140.2023.12.03.03.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 03:29:56 -0800 (PST)
Message-ID: <2d5acbda-61a9-412d-bf9d-04a372c927c5@linaro.org>
Date: Sun, 3 Dec 2023 13:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/gem: Cleanup submit_cleanup_bo()
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231121003935.5868-1-robdclark@gmail.com>
 <20231121003935.5868-6-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121003935.5868-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/11/2023 02:38, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that it only handles unlock duty, drop the superfluous arg and
> rename it.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d001bf286606..603f04d851d9 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -248,14 +248,10 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>   	return ret;
>   }
>   
> -/* Unwind bo state, according to cleanup_flags.  In the success case, only
> - * the lock is dropped at the end of the submit (and active/pin ref is dropped
> - * later when the submit is retired).
> - */
> -static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
> -		unsigned cleanup_flags)
> +static void submit_unlock_bo(struct msm_gem_submit *submit, int i)
>   {
>   	struct drm_gem_object *obj = submit->bos[i].obj;
> +	unsigned cleanup_flags = BO_LOCKED;

Nit: checkpatch will warn here, it should be unsigned int.

>   	unsigned flags = submit->bos[i].flags & cleanup_flags;
>   
>   	/*
> @@ -304,10 +300,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>   	}
>   
>   	for (; i >= 0; i--)
> -		submit_cleanup_bo(submit, i, BO_LOCKED);
> +		submit_unlock_bo(submit, i);
>   
>   	if (slow_locked > 0)
> -		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
> +		submit_unlock_bo(submit, slow_locked);
>   
>   	if (ret == -EDEADLK) {
>   		struct drm_gem_object *obj = submit->bos[contended].obj;
> @@ -533,7 +529,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
>    */
>   static void submit_cleanup(struct msm_gem_submit *submit, bool error)
>   {
> -	unsigned cleanup_flags = BO_LOCKED;
>   	unsigned i;
>   
>   	if (error)
> @@ -541,7 +536,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
>   
>   	for (i = 0; i < submit->nr_bos; i++) {
>   		struct drm_gem_object *obj = submit->bos[i].obj;
> -		submit_cleanup_bo(submit, i, cleanup_flags);
> +		submit_unlock_bo(submit, i);
>   		if (error)
>   			drm_gem_object_put(obj);
>   	}

-- 
With best wishes
Dmitry

