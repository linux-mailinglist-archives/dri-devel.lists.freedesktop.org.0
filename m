Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744BFAF03EC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 21:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79908928D;
	Tue,  1 Jul 2025 19:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e5iucJr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7836810E2F0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 19:38:48 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3df2e7cdc64so49388295ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1751398727; x=1752003527;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
 b=e5iucJr32QJDIsL1j8vpfVTl7teW2GMvUsPLSTfUhhWjHtfT40Vt70aEqmtMff2xMK
 TukyHtZQ+hfkmZ0HV9ORjmbN8gwUqBLtEjCNYptZY/EwcTw4JhIAzpZbZsZ1VIfvoSzE
 sXLZFXSLhNC5wil4fUSYiAgT/GF3s3xD/oQsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751398727; x=1752003527;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
 b=ovYuVaAUNyZ2ZAzqVTzeve/ExxmXdYvtD3YvoTuRKjZ0J+5aHc6uPHqvw5Kh2fd11S
 3DvbI8wSv8Y3CQtr+O0oTg7ob+nCKW8f+xVWIPy1JaZhzEArKA32fmvBBSG6tGUdd+qm
 3eoXQ/LzQBtlyZvGfOuL57ubwGCm9P1gc2DTyqD5ZV95UfWy1t1cke3F1bcz6+7E6lrY
 Xxau6O3aLwEntdME6cvagn6BkVCXzV7Vg66e3jhoTE6ymoAeV1f9Q8RvohKyKj5fQFCW
 z/14VxyLJ8HDT0NAiE5oTXXvSTeo1o5438PqmPltYi5Fw7GIqmz97aAxNQO0PaW9yDUb
 BRqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYbK7NmrU/fx1kljg1PdfPk5dOlNcFrX8ASH2O6XgKpJ7x2R2RD6/JnEcesWJuAiXmLlMMblyAjzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyO7rAwlPl6Le2Xa0biEB1EBhDC2XZTsMQufWn0XDDWJdpaPvt
 gDzRF7ZYxpknqRlBi9KhRebTrXZ2Tmt6WGB2ZtB1XRcZN5PGcQGXlwJtHaT+E+uwu8M=
X-Gm-Gg: ASbGncu+BF/vQKQNMvhFIX1LE7LqLVRA/fXP/FDBk2pQuG8wOARsxhnZ0vMT40KuqLj
 JcVKe6qCHrAAzW1CJiAzsAGE9CwemJebgJKpw7PeQlQJPLwUE+8eI7l7B4iPYkY6qBKjvpz6/nb
 4l/hAWliTUuNbellqJaPLhjquDatRCIBrVydXig6QCiRD7j7sBHfhs9lrm7Zu5waVfuwB6P9DlH
 YqZfpQfGtgDxplLhbKkaXj3OlQX/2WE6oRSpPLy57Y4lNvkSdUmOvqJV0uyIrpDF4MQQ63lZBrW
 0vXgUqdV8ZUqlAU/8z8RKOribzjXwaFsXG/AyR51ceNsW3mAsfQ9Uc4m+U2jAqXUJSoIuBRvfWE
 +B/GD13qN
X-Google-Smtp-Source: AGHT+IGvl85HXknFk5WCMqL3KGp3aOWaEvzVt6Rqv1FGK+Z9f2Q+2wtZthqKmGchchXpQiY+DMOzSw==
X-Received: by 2002:a05:6e02:74a:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3e054a307fbmr3075225ab.18.1751398727532; 
 Tue, 01 Jul 2025 12:38:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5020486ba41sm2570574173.28.2025.07.01.12.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 12:38:46 -0700 (PDT)
Message-ID: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:38:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: I Hsin Cheng <richard120310@gmail.com>, robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250623184734.22947-1-richard120310@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250623184734.22947-1-richard120310@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/23/25 12:47, I Hsin Cheng wrote:
> According to the report of Coverity Scan [1], "sync_file" is going to be
> NULL when entering the "if" section after "out_post_unlock", so
> "fput(sync_file->file)" is never going to be exected in this block.
> 
> [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d4f71bb54e84..cba1dc6fe6c6 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   out_post_unlock:
>   	if (ret && (out_fence_fd >= 0)) {
>   		put_unused_fd(out_fence_fd);
> -		if (sync_file)
> -			fput(sync_file->file);

Are you sure you want delete these two lines? It might not make
sense to check sync_file inside if (ret && (out_fence_fd >= 0)),
but it is ncecessary to fput.

>   	}
>   
>   	if (!IS_ERR_OR_NULL(submit)) {

Check the error paths carefully to see if this is indeed the right fix.

thanks,
-- Shuah
