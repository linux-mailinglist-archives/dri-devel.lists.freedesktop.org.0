Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40F2F3BB2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 22:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E527C898F0;
	Tue, 12 Jan 2021 21:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCC1898F0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 21:04:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d13so3919602wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v4xV9g2m1b67bsLcVGdEvyfTd+DgiyIQglAT13edfZk=;
 b=NtZkZGFam5ta+af3U6MCp3WsAKc45QXgaxIvvE/J4lBRovmutCyzaZNtW5KFIqspRE
 5lLlCaibg+H4qVOgS+AcHh4LXg3y1g40vcNGBOJvO36+/72O1APWlLNXI3tWOZCm/qtA
 mcn+mYRAQFP1THwRWWuXFE8Yn5B6C9tDCumvdnJzHJb9eRNOmSrVp60/E1qreV+6/4rL
 yEi5YBlNnpgPic0LcbO2R0x+HWorkovAmY9+06bHMYcKMp/+W3rpdsngtCSgf6pE5c+i
 8clNhp5JOyjsdzK9sOe32B8I7bhwisoeII0hYMc0sIp7hvIb0xR5TclA9q5zPqnMKFIX
 l7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v4xV9g2m1b67bsLcVGdEvyfTd+DgiyIQglAT13edfZk=;
 b=TrJpl4TlscyY2iEBDB5avuHGgunDf3hxRyOmbx7wMlePCEFCPDTlrPhshaOhUcpYlr
 atq7SDOQ8c0n/t608WGWwyxRkFWYwz13MrX2C+VKeNhs1jLrKeDoBFgtMk2F3/s3hZgy
 OZz9bhcODAIqM5QCRKn4ZB5dig0vKyrM6Fgex+iRkhy78pY2DAMRCyqDvwrST0DK5VOj
 e/mRgo6HcmNZzjfz20gkuW9o1pVfZQ/sqx5PQkgBgXxU7nPgi9ru5maI4ZxA/3oyMwNl
 5bTdftYNCp6YZ/CptGU2isFE5mZ3AIwLLeAFdAT7b2EEqjPonJs2uq+3sxUaUnU7l9Jq
 C8VQ==
X-Gm-Message-State: AOAM532996EiOon6oE9RHsqXLUsDA9UPq8kjdhHdWEXpmQYlz4/3EQFp
 4lWPOl9c3lgVoCEZEfC2o5c11y43wFyOww==
X-Google-Smtp-Source: ABdhPJx2pI+nhlLJi41E3ignw391szWh1B4zzxhhvVavwSBaKM+QRdRepzD46HilHW7CQNirUMMeYQ==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr681390wre.344.1610485497530; 
 Tue, 12 Jan 2021 13:04:57 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id d18sm5449676wmb.30.2021.01.12.13.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:04:56 -0800 (PST)
Date: Tue, 12 Jan 2021 18:04:50 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V5 0/3] Decouple config data for configfs
Message-ID: <20210112210450.dzipxaiu4e26hyak@smtp.gmail.com>
References: <cover.1610391685.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1610391685.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12, Sumera Priyadarsini wrote:
> This patchset aims to lay down some prep work before configfs can be
> implemented for the vkms driver. The first patch in the series adds a
> new type vkms_config to track device configuration. The second and third
> patch add module testing support for writeback operations.
> 
> The first patch is developed by Daniel Vetter.
> 
> Daniel Vetter (1):
>   drm/vkms: Add vkms_config type
> 
> Sumera Priyadarsini (3):
>   drm/vkms: Add vkms_config type
>   drm/vkms: Add support for writeback module
>   drm/vkms: Add information about module options
> 
>  Documentation/gpu/vkms.rst         | 12 ++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c    | 45 ++++++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_drv.h    | 13 +++++++--
>  drivers/gpu/drm/vkms/vkms_output.c | 13 +++++----
>  4 files changed, 68 insertions(+), 15 deletions(-)

Applied to drm-misc-next.
I fixed the extra line issue while applying.

Thanks for your patches,

Melissa

> 
> ---
> Changes in v2:
>  - add Co-developed-by tag
>  
> Changes in v3:
>  - correct usage of Co-developed by tag(Melissa)
>  - add enable_writeback_feature(Melissa)
>  - modify commit message(Melissa)
> 
> Changes in v4:
>  - split previous patch into patchset(Melissa)
>  - fix checkpatch issue(Melissa)
>  - update docs(Daniel)
> 
> Changes in v5:
>  - modify docs patch(Daniel)
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
