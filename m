Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AAFA2E2DD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 04:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61B910E17B;
	Mon, 10 Feb 2025 03:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FAtdmj2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C771610E17B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 03:41:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so39791281fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739158873; x=1739763673; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
 b=FAtdmj2PUI9K69wSRb6wVVnsrS9AJXFlfG8c+dIcJrRBjrd0GmRK6GlBY7xFwYsbf4
 pshi6sG6KQtA12dspH5MezkA8uveVE+2lK7b7Sf8VNIUF4UR1IDpTX7xJmbr5xiBtOX9
 d2nYK9ahd2efP/x0wZQviE3vIubC0httcDvP3W7UP6LYBtXMH49SIhH4e4L8dDBvsjy0
 EiTzNYgip3cpYozpUvuDo/gx82SbY+0nJHHgP9GQpJlqZYpQHOip4KjzE7fOsZ880nYd
 QDL22EIfLi6eXcvwQ/RRIpmHT0rEVXhsOK0mhuPLipJel4N3SgY08vPMsVtODZvZ1FBk
 K15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739158873; x=1739763673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
 b=ct9w0QifouQ+0aN9M/oDZ6RZhaOi6sPM7+SyDtlwl+p9vDVwn2OsjbxDDreeoTLErj
 qxf1WchlwRaQvbACQewLCH3hwEWknY3M+JC0zKInq0WTAwb3UOhM6Op9461NTbNrZ3la
 EGY9AYmAmR8m/+1WFFyOUjxp9Vp7ydAgdUjIKnxR6Y4zNUzkz3uimvMdGJVhsam+duVh
 Hw8fHOjXOZ7lBQP6TYWOqwjp1tqu8EU2CRfoPmDqzX61aIIGmYOql+OVVAXGDMU/va2p
 nt8JaWVhof/dOsjImwDydPbNZAhm9mKl/+auEiQAUdZeczLy7QbS3T2XJpTTjicg+Thx
 B6dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT88nfNXXUk0uU79CrCIXx5snWASG80rKbBpQ1aUt85KZuBUGO6CHd1I7fk1R38KGRoPIyCVpyNwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnAJyYow475Wb8jXUdOSR7XqvDrQoIwxiabu2r2iZP+pD97K8s
 BLZQcbF6pN0q0waAcUfaROVZ2aqyd9ptis45P06lNsTs7eY2SqsHkdiy8i61ahE=
X-Gm-Gg: ASbGncszibTbeRPkkBkMQ78EWhhx67IkugWZIF0jmz2cEfFDKkctVMhiBJIkxjLCyTQ
 T7cnQWU1vGWJLmC17Z3onpBxFDsHk0eW2UQ1kxTk38tmS2elEs2Nc4Z5joTkJQ6XwCs1Mb/UFXc
 DlB0SdW2W52xjyqCKqlKYRxPZ+LlY6QrAkaAPJtlSqOI6erTvjBF67oXEG/qJ4xqkFZO9KM1ntv
 PM6kAPasX4xpjGQ1Xk3tZ4wplsbxaYbZ1J9IW/0h/fd2gBEfkoEi/vMd274UTPw5/ffp82mO9u2
 DqlLLAshbCtZLQpM9pk1Q91axidzPtd9uDeTcTEdNKjXG6vpDTxwl0YCHIKU5aiVqTBOiMQ=
X-Google-Smtp-Source: AGHT+IH7m6oiasYVqnzqsfHHyi3NYn+WrwlbtgfZKMfhDxmQoU4N6KPHZD2MhJ82kLTvoCVN0EbGyg==
X-Received: by 2002:a05:651c:1986:b0:302:3356:7ce2 with SMTP id
 38308e7fff4ca-307e57ca9acmr39237721fa.11.1739158872958; 
 Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308f2d7fae7sm567661fa.39.2025.02.09.19.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Date: Mon, 10 Feb 2025 05:41:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix uninitialized variable
Message-ID: <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>
References: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
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

On Sun, Feb 09, 2025 at 10:32:33PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       unsigned int num_planes)
>  {
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;

Thanks, but I think it better to make the function return ret from
within the loop and return explicit 0 if there was no error.

>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> 
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250209-dpu-c3fac78fc617
> 
> Best regards,
> -- 
> Ethan Carter Edwards <ethan@ethancedwards.com>
> 

-- 
With best wishes
Dmitry
