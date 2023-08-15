Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AD77D527
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 23:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B564510E29B;
	Tue, 15 Aug 2023 21:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4925510E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1692135253; x=1692740053; i=deller@gmx.de;
 bh=E9CckG6XcdFR8HPPz/iR9yKn0KhZK9QhCyWiDWcz09Q=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Wq9BrPnssV/EenoS0RCM0prLNu0jYmlaycFHYYri5AjAIjlCe+myxc7cdk5vX90cyXMP7zr
 sPhfc9jcLA4J62SKeFJ6Ah+bmcWPRGwh0MnaLFeS3Lz9KR2WNju5v3vxoJGxPmp4XzMkZMPdJ
 cbPPIuo+p0dfBfYUNBDWFtWpfGpQF2DGRNsSLhu39TQEGlhUNwbJvfZYpWqFlvS7tmA8KDZGh
 6Q7Xs68o50zhUgdx8yJX+0+m1SO2VuJEeosLgc8FTYMvuwsk3mk6arY5IqS6hYwENAHUWl6/6
 gx8bGjgTuU/HZGbGn8M/eWqE6IU9GPHgCAAoATFN3+u6UYr5RkpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.222]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMobO-1qFSCH1sA8-00IlXW; Tue, 15
 Aug 2023 23:34:13 +0200
Message-ID: <0423ff9f-f783-0986-9867-7862560b8c59@gmx.de>
Date: Tue, 15 Aug 2023 23:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] fbcon: mark fbcon_registered_fb static
Content-Language: en-US
To: Min-Hua Chen <minhuadotchen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230804113237.51653-1-minhuadotchen@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230804113237.51653-1-minhuadotchen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p6BM+Ff27coe+zLMg2wCwXzgpqVyC5WXdEQyoFGtRmHOqROCrt0
 sC6IoF0xcSBdrWVwHXaIJq6kqhuhRVw//tdfPxoOkXs7oEG3od0ZW1Ta0lrgeSMZUrp2QhP
 FRROI6wauRG0C2CnobYXU0xY8TWUtDV/spdXxvQkAdahbIhyVFX+LU9DvgKlRT3Ew42oEP6
 Cxw7ctFz2aaHkVdgLr0Mw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YYDjm/h8/2Y=;3WRuj6txlGau774QBVBT7QGpwov
 3XOZzXwjg6UKeMnjjyqwCu6jG926bKJb38+SmWGjyh/KKA66fWYQ6YLaHkXd2XskzR5JX6U76
 nlvB0B7Bk+yr62EgrpY+e+B4K4mZ7SlYuBng2NUxFeB1ZJ2cvzB4lDDGLn+dM0sugwpk83ZFF
 SYl9KeYFjfauGPLsACx1djLIs5jo4APj0Oeorf0Bl1P4A/jRQUEDpCDdj8qD4KqyVnrYdI+wD
 UIQa1pqNZ6ckRbHRzg+o2hpdZZKood2LBYrANADalF43Ufos/G0sEHJ5Wjz70H4aREDzulUW4
 umzWwV4Q5mSBqG+5etyyS4danQ9bQZ3ZgLWfo+lS/Y1oZsgLPQbxduDVHLhJcDQWLIANtyytp
 278aog6uk+XtlAWdXGRe3xCdph6AScEbCQA5IkT5Ig6ln9gKSzPdqJpm71lFAQL3gTghNbgGy
 je+VAZPbxXr+cM7VBQVEY3tD1UxtU80yPHHVY0BSfCe0bP7lImLqHkLdDb29LVe0Egtq+pLDt
 qElaUD5g7YUX3VPXzY0cjMA4aX0aCMPDX7L3hBZk2b374GvqQ4ZlMkar4FOClLcNdAXJor8Rj
 PxopP/M+d1/pwYNTjpNH0NHRqotLxnyuBEmIgqMKYqUL0TfYIs5xMHfwXTwe4LS644B4fkOtG
 V1Uqk41JE+rz+ysPQi5w3zADud8JSRr9JE/Oa2It9f7InYGP4/9lljPIKXKPEYCVBniHJmRyT
 v7fD7sNBJ7ev5lepSJBF6y04wch/csBvfATMmYnWVr9HmaPByairjWfaiI8gJAs2qarUhT14h
 XOecrnad+ybtDljXsSUzbWpsE0r0hgkqssZ3Q5oILv/Hrmnr22VbzskD3zlObI7DhE6Rn0uoJ
 WoUstQ7i0ndfLh0t3w16SMj04jW4xHjLmj4TnrKetgcopoLObFZjTm+CBlrBqGwhaIr1tWHVJ
 mtXO7VMMTBdKenfgdTIyaeGEyfY=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/4/23 13:32, Min-Hua Chen wrote:
> Mark fbcon_registered_fb, and fbcon_num_registered_fb static
> to fix the following sparse warnings:
>
> drivers/video/fbdev/core/fbcon.c:105:16: sparse: warning: symbol 'fbcon_=
registered_fb' was not declared. Should it be static?
> drivers/video/fbdev/core/fbcon.c:106:5: sparse: warning: symbol 'fbcon_n=
um_registered_fb' was not declared. Should it be static?
>
> No functional change intended.
>
> Cc: Helge Deller <deller@gmx.de>
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>

applied to the for-next-6.6 branch.

Thanks,
Helge


>
> ---
>
> change since v1:
> 1. registered_fb and num_registered_fb are still used in drivers/staging=
/olpc_dcon,
> so do keep them as-is.
> 2. change the subject to fbcon: mark fbcon_registered_fb static
> ---
>   drivers/video/fbdev/core/fbcon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 887fad44e7ec..976900d6893c 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -102,8 +102,8 @@ enum {
>
>   static struct fbcon_display fb_display[MAX_NR_CONSOLES];
>
> -struct fb_info *fbcon_registered_fb[FB_MAX];
> -int fbcon_num_registered_fb;
> +static struct fb_info *fbcon_registered_fb[FB_MAX];
> +static int fbcon_num_registered_fb;
>
>   #define fbcon_for_each_registered_fb(i)		\
>   	for (i =3D 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\

