Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A012F7E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 13:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760588422;
	Fri,  3 Jan 2020 12:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ADE88422
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:02:44 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103120243euoutp02892b1fc042a38a64b08ad88f43c572a0~mXs8m6YSv1380213802euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 12:02:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103120243euoutp02892b1fc042a38a64b08ad88f43c572a0~mXs8m6YSv1380213802euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578052963;
 bh=PAufO55jaNXT94zsthBmd3th0zGvngsY5/9dqgbLzOo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FbwxC6YNtyeZz/USnMsk8KOTyKhmMBjBoLS7YDu6UIjoH0LfS2jAg0V6OaG5rX7ue
 H4NAcG0ATsY30HpXoWTc3zPmvMD/HpPfG9oeOSGiQxUkCKjZgTXdyTyXJU0zZ3fOze
 S1ME6TiFWbJsRScS3cYgSRhWOR7zf9qTSwdRqY8M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103120243eucas1p10c27c54cd0e42ad743eee8d258fe297a~mXs8eZI8B0410904109eucas1p1d;
 Fri,  3 Jan 2020 12:02:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 85.A8.61286.36D2F0E5; Fri,  3
 Jan 2020 12:02:43 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200103120242eucas1p2958178febac1f2ed345e97dfcc433517~mXs8OqMzJ3083530835eucas1p2r;
 Fri,  3 Jan 2020 12:02:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200103120242eusmtrp1bf25ab6c67ad25ea01e794f25e7ae5d0~mXs8OCrgz1762317623eusmtrp1Y;
 Fri,  3 Jan 2020 12:02:42 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-09-5e0f2d6326a3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C0.13.08375.26D2F0E5; Fri,  3
 Jan 2020 12:02:42 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103120242eusmtip14c1b0b205aefc41bfa064329a016ce53~mXs7ewkzU2450524505eusmtip1h;
 Fri,  3 Jan 2020 12:02:41 +0000 (GMT)
Subject: Re: [PATCH] video/fbdev/68328fb: Remove dead code
To: Souptick Joarder <jrdr.linux@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <dc887c33-0374-34e7-8d0d-329b87a5a7c3@samsung.com>
Date: Fri, 3 Jan 2020 13:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567428544-8620-1-git-send-email-jrdr.linux@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djPc7rJuvxxBk/nslpc+fqezeLa1QZm
 ixN9H1gtLu+aw2Zx6eMhJgdWj52z7rJ73O8+zuTxeZNcAHMUl01Kak5mWWqRvl0CV8bJW+uY
 C75wVFy7uYaxgbGdvYuRk0NCwESie8oRpi5GLg4hgRWMEsenLmaGcL4wSkye9JwRwvnMKLH1
 xyLWLkYOsJa53fYg3UICyxklZl2NhKh5yyhxoPktE0hCWMBK4mz/HTBbREBbYu7hX8wgvcwC
 NRLf/smChNmASia2r2IEsXkF7CTebdgCdhGLgIrE72kXwWxRgQiJTw8Os0LUCEqcnPmEBcTm
 FHCRaH8zByzOLCAucevJfCYIW15i+9s5YA9ICPSzSzz/f48V4k0XifUbjrFB2MISr45vgXpf
 RuL05B4WiIZ1jBJ/O15AdW9nlFg++R9Uh7XEnXO/2CA+0JRYv0sfIuwo0dp5nRESKHwSN94K
 QhzBJzFp23RmiDCvREebEES1msSGZRvYYNZ27VzJPIFRaRaS12YheWcWkndmIexdwMiyilE8
 tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzCxnP53/NMOxq+Xkg4xCnAwKvHwJijzxwmxJpYV
 V+YeYpTgYFYS4S0P5I0T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6YklqdmpqQWoR
 TJaJg1OqgdExVMl4D8MFi635BRJPYjMrcwXSC+4dfB1y/82kOyu/lAR/X56ySVlIRubcq9tl
 Dj9XXdASClvxVarBtc3z0XqrGjeRFyVBZfffzXQJ9ONwkNgqx3dCx2dz7ZSLQbMXe9ZUaJYu
 3HSiSHbXogNPHc+sNvELY66yObDu4Z5tnYFK32ReNm54nKPEUpyRaKjFXFScCADJKDClKAMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7pJuvxxBjse61lc+fqezeLa1QZm
 ixN9H1gtLu+aw2Zx6eMhJgdWj52z7rJ73O8+zuTxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
 nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbJW+uYC75wVFy7uYaxgbGdvYuRg0NC
 wERibrd9FyMXh5DAUkaJA6cWQ8VlJI6vL+ti5AQyhSX+XOtig6h5zSjxeMZURpCEsICVxNn+
 O0wgtoiAtsTcw7+YQWxmgRqJPZ+WMkE0TGeU2DPjNlgRG1DDxPZVYM28AnYS7zZsYQexWQRU
 JH5PuwhmiwpESBzeMQuqRlDi5MwnLCA2p4CLRPubOawQC9Ql/sy7BLVMXOLWk/lMELa8xPa3
 c5gnMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYS9uO/dy8
 g/HSxuBDjAIcjEo8vAnK/HFCrIllxZW5hxglOJiVRHjLA3njhHhTEiurUovy44tKc1KLDzGa
 Aj03kVlKNDkfGOd5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoY
 3abuWq97UfmhTklBY0dLrdlBTllWA4eZiVNn/X4ZWb1Hbe6KB3y5qkE/ytZ80WLRlQm76MG0
 XS9bZJnElJ1xiTbNgYGPy2f8ztl06FNE8bVDTccN9k8NqpqWPq9J61OZX9mq0uSDKT/PTOOv
 niqmfrRcUzZ60aQPeuZnslfvnm9deU9fe0ueEktxRqKhFnNRcSIAluvgZ7sCAAA=
X-CMS-MailID: 20200103120242eucas1p2958178febac1f2ed345e97dfcc433517
X-Msg-Generator: CA
X-RootMTR: 20190902124317epcas1p3933aec8ee7e526f3f42dd9f08ce6bdb0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190902124317epcas1p3933aec8ee7e526f3f42dd9f08ce6bdb0
References: <CGME20190902124317epcas1p3933aec8ee7e526f3f42dd9f08ce6bdb0@epcas1p3.samsung.com>
 <1567428544-8620-1-git-send-email-jrdr.linux@gmail.com>
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
 dri-devel@lists.freedesktop.org, sabyasachi.linux@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/2/19 2:49 PM, Souptick Joarder wrote:
> This is dead code since 3.15. If their is no plan to
> use it further, these can be removed forever.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Thanks, patch queued for v5.6 (also sorry for the delay).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/68328fb.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
> index d48e960..02d22b7 100644
> --- a/drivers/video/fbdev/68328fb.c
> +++ b/drivers/video/fbdev/68328fb.c
> @@ -405,20 +405,8 @@ static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  
>  int __init mc68x328fb_setup(char *options)
>  {
> -#if 0
> -	char *this_opt;
> -#endif
> -
>  	if (!options || !*options)
>  		return 1;
> -#if 0
> -	while ((this_opt = strsep(&options, ",")) != NULL) {
> -		if (!*this_opt)
> -			continue;
> -		if (!strncmp(this_opt, "disable", 7))
> -			mc68x328fb_enable = 0;
> -	}
> -#endif
>  	return 1;
>  }
>  
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
