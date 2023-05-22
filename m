Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6B870BBE6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A9610E2D8;
	Mon, 22 May 2023 11:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5BA10E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:33:18 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f603d4bc5bso12597215e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684755197; x=1687347197;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x+pgQ2Qrf2Xld+O/wIq9n1xqFexrJ7htcdWZiMO4et0=;
 b=r/Pj3Pu8YyU6Mh2Epd39G75D+3faLnmYt41Fe9T/6rPu5LWXmXlJbdQc88F+W+eK9a
 qrh+5CDRJY2SUcHEAxVVYV4vaUsww6Hxkow4O9H18icQb/2x3eItOnVC0EO6ZiEMMDsl
 OHBsZIVkMbv8fdVngTKOzQrvQ9UZQAivnhNP97J76g26KHwi+llcsEUmHL3ZGVnun/mW
 fVw+4AgO3uD3N1GfUiFa6KMohLZcBr6YwYp10RsE7YjhpbEPmefXFmZ6fDBZAHeXC+wf
 20bGeqkAMBJsZ3luw6L9dX5mlzqKWutCXfOK4y06fwUBZP6faWbWYUZAcg8W9rxtfUb3
 //3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684755197; x=1687347197;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+pgQ2Qrf2Xld+O/wIq9n1xqFexrJ7htcdWZiMO4et0=;
 b=i3H9/S/TYuaSdhwz38nZj03VaXsoBNLRnSlVmTINaTu1WhQbMATovuMny+ZywOrMvP
 K8wpxT9yVNMPLIDLGsW0xARfcewOv0+ilU2o/9DeoX/3ywhw+g3UlHCVVsEPU9xYyg7G
 BbV5sxKaQkXkILbW1fF/bK+ofRVxj0Gmxb3gWkKIBeyHxjeK/PZZAhIuWF4WiBMCL251
 UvqKwDguJUAg484N3r1SkAT+LYC9Lyj0+HYvmZhM0ouXoDkrqIrRPeWEx1KAkbtO+6GU
 n9Qfrs2FviRN6PHYFgyfqz9lQ1tuvJNBBGctDoj4Li/WIQWRuJ0j4Bt8uqJksHRYmXg5
 ULnA==
X-Gm-Message-State: AC+VfDzy4DQo9IV1Zl/jFWPsP0hwpBBB+uNkekZkYx2Vx/bCRqnqG61R
 wGPL08B+OQKOulBqR7UJmeYqgg==
X-Google-Smtp-Source: ACHHUZ4TpHax5uBNK9rrvHb4IoqRDTQIoEeL3BdA21kinyhLzWugDlz+NTJ1segachNGqMykV7EoFw==
X-Received: by 2002:a7b:c855:0:b0:3f4:2158:2895 with SMTP id
 c21-20020a7bc855000000b003f421582895mr7076513wml.3.1684755196811; 
 Mon, 22 May 2023 04:33:16 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y21-20020a1c4b15000000b003f60119ee08sm5792849wma.43.2023.05.22.04.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 04:33:15 -0700 (PDT)
Date: Mon, 22 May 2023 14:32:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/4] accel/habanalabs: remove sim code
Message-ID: <9f136057-92c9-4979-8bc8-c52632213564@kili.mountain>
References: <20230522112548.1577359-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522112548.1577359-1-ogabbay@kernel.org>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks!

On Mon, May 22, 2023 at 02:25:45PM +0300, Oded Gabbay wrote:
> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
> index cab5a63db8c1..ca15c8d0d042 100644
> --- a/drivers/accel/habanalabs/common/device.c
> +++ b/drivers/accel/habanalabs/common/device.c
> @@ -2328,13 +2328,9 @@ int hl_device_init(struct hl_device *hdev)
>  	hdev->disabled = true;
>  	if (expose_interfaces_on_err)
>  		cdev_sysfs_debugfs_add(hdev);
> -	if (hdev->pdev)
> -		dev_err(&hdev->pdev->dev,
> -			"Failed to initialize hl%d. Device %s is NOT usable !\n",
> -			hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
> -	else
> -		pr_err("Failed to initialize hl%d. Device %s is NOT usable !\n",
> -			hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
> +	dev_err(&hdev->pdev->dev,
                 ^^^^^^^^^^^^^^^

> +		"Failed to initialize hl%d. Device %s is NOT usable !\n",
> +		hdev->cdev_idx, dev_name(&(hdev)->pdev->dev));
                                         ^^^^^^^^^^^^^^^^^^^

I hate to be picky, but would it be too much to get rid of the parens
around (hdev)?

regards,
dan carpenter
