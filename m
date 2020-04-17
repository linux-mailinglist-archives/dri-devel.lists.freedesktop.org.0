Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD301ADF00
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE6C6EC12;
	Fri, 17 Apr 2020 14:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DDF6EC12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:05 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140803euoutp02eac114ae66af362eb74e3074b60b853d~GoJXHqhvC1553115531euoutp02n
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:08:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417140803euoutp02eac114ae66af362eb74e3074b60b853d~GoJXHqhvC1553115531euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132483;
 bh=p0knefIWVbpJwNxUj9aq5DHsz2u6zZAUU6p5PMrJL2Q=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=sow4vDkArhOduC9cwFkyaQyI4o8K8i4rCxTcD9SS5U/NU2wf9QhrnjBQWdR6uBex6
 kjY+yD+0LreIIITWQ9NGohdUFk6fUCLXMVrGRRibT3U1ZTdqZ4KoPgCqWdKhbPVmOC
 H1Riqi17/VcQaMdoasxquRfauVy1dVeJfKO1OjLQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140803eucas1p135961562a5c94c26691659bd73801d28~GoJW5e3Xu1490114901eucas1p1-;
 Fri, 17 Apr 2020 14:08:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 61.FF.60679.348B99E5; Fri, 17
 Apr 2020 15:08:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140803eucas1p216eefb5bc5cc23b85f1eb1d95eccc490~GoJWevrE82051220512eucas1p21;
 Fri, 17 Apr 2020 14:08:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140803eusmtrp1e646b7271835acb774d0c96be0a124d9~GoJWeK1m-2228222282eusmtrp10;
 Fri, 17 Apr 2020 14:08:03 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-f0-5e99b843e017
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A5.E0.07950.348B99E5; Fri, 17
 Apr 2020 15:08:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140802eusmtip149189934c231fcd5d1e960da6712087f~GoJWHjkxr0880508805eusmtip1O;
 Fri, 17 Apr 2020 14:08:02 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: vt8500lcdfb: fix fallthrough warning
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <850a8da4-c0a2-7916-4932-d63ee55ce737@samsung.com>
Date: Fri, 17 Apr 2020 16:08:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200412202143.GA26948@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djPc7rOO2bGGTT+UbQ4Nf83m8WVr+/Z
 LPa//clqcaLvA6vFip9bGR1YPXbOusvucfr9IVaP+93HmTyWTLvK5vF5k1wAaxSXTUpqTmZZ
 apG+XQJXxqeLfUwFJ3krtvRuYmlgnMjdxcjJISFgItF2+TFzFyMXh5DACkaJmbP72SCcL4wS
 9+a/ZodwPjNKrHv+nAWmZU37DmYQW0hgOaPElKZAiKK3jBLz320DS7AJWElMbF/FCGILCzhI
 LF34BSwuIqAscfz8NVaQBmaBDkaJqZPa2UASvAJ2EpO2XgXawMHBIqAq0TefHSQsKhAh8enB
 YVaIEkGJkzOfgB3BKWAkcWjtLiYQm1lAXOLWk/lQtrzE9rdzwP6REFjELjH9+2JWkJkSAi4S
 /YuDIR4Qlnh1fAs7hC0jcXpyDwtE/TpGib8dL6CatzNKLJ/8jw2iylrizrlfbCCDmAU0Jdbv
 0ocIO0r8XdfBDjGfT+LGW0GIG/gkJm2bzgwR5pXoaBOCqFaT2LBsAxvM2q6dK5knMCrNQvLZ
 LCTfzELyzSyEvQsYWVYxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEppvT/45/2cG460/S
 IUYBDkYlHl6DnplxQqyJZcWVuYcYJTiYlUR4D7oBhXhTEiurUovy44tKc1KLDzFKc7AoifMa
 L3oZKySQnliSmp2aWpBaBJNl4uCUamCU8d/2j72xwCWl+87xZY94mxKX/ul8eZbtnPbyydzP
 z/fWLvsh+6R1UpBU84bCDIFqba6prop1USkb7WXYrYT1Ux6Fnq/xsoieFadydlpM+By7+7/W
 3A3oVDV7O6/HzDR53fuNb4UPxR1u/H7oT0jZ2fca7WffOWYpH5J6u31BlOK+5IDyUDslluKM
 REMt5qLiRABJ/Iy5MwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsVy+t/xu7rOO2bGGezoZ7E4Nf83m8WVr+/Z
 LPa//clqcaLvA6vFip9bGR1YPXbOusvucfr9IVaP+93HmTyWTLvK5vF5k1wAa5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexqeLfUwFJ3krtvRu
 YmlgnMjdxcjJISFgIrGmfQdzFyMXh5DAUkaJGzt/sXcxcgAlZCSOry+DqBGW+HOtiw2i5jWj
 xMXb39lBEmwCVhIT21cxgtjCAg4SSxd+YQaxRQSUJY6fv8YKYjMLdDBKzFsZB9HcyijxcPci
 sAZeATuJSVuvsoAsYxFQleibDzZTVCBC4vCOWVAlghInZz5hAbE5BYwkDq3dxQQxU13iz7xL
 zBC2uMStJ/Oh4vIS29/OYZ7AKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJucWle
 ul5yfu4mRmB8bTv2c8sOxq53wYcYBTgYlXh4DXpmxgmxJpYVV+YeYpTgYFYS4T3oBhTiTUms
 rEotyo8vKs1JLT7EaAr020RmKdHkfGDs55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnN
 Tk0tSC2C6WPi4JRqYLzOdzr5oEPCgcsrHWz37+vOr40OdBI7P5PzXMK7BgXfOi6Z948Fvx3b
 t2fP1e+bk22fWybuOd618oOwSs+js36y0XcPx0tubQp/05bx1aCyw6/23RXDtCNBXfN9Owyy
 Vvmwpb8We/Exz6j4RsGtojN/xNjfrDmzqZIhL6PC1uuYxxumBOMPGUosxRmJhlrMRcWJAMO+
 WPrFAgAA
X-CMS-MailID: 20200417140803eucas1p216eefb5bc5cc23b85f1eb1d95eccc490
X-Msg-Generator: CA
X-RootMTR: 20200412202152eucas1p13ca8cce6878a1184f5450e88e035c4ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200412202152eucas1p13ca8cce6878a1184f5450e88e035c4ea
References: <CGME20200412202152eucas1p13ca8cce6878a1184f5450e88e035c4ea@eucas1p1.samsung.com>
 <20200412202143.GA26948@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>,
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/12/20 10:21 PM, Sam Ravnborg wrote:
> Fix following warning:
> vt8500lcdfb.c: In function 'vt8500lcd_blank':
> vt8500lcdfb.c:229:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>       if (info->fix.visual == FB_VISUAL_PSEUDOCOLOR ||
>          ^
> vt8500lcdfb.c:233:2: note: here
>      case FB_BLANK_UNBLANK:
>      ^~~~
> 
> Adding a simple "fallthrough;" fixed the warning.
> The fix was build tested.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: e41f1a989408 ("fbdev: Implement simple blanking in pseudocolor modes for vt8500lcdfb")
> Cc: Alexey Charkov <alchark@gmail.com>
> Cc: Paul Mundt <lethal@linux-sh.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v2.6.38+

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/vt8500lcdfb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
> index f744479dc7df..c61476247ba8 100644
> --- a/drivers/video/fbdev/vt8500lcdfb.c
> +++ b/drivers/video/fbdev/vt8500lcdfb.c
> @@ -230,6 +230,7 @@ static int vt8500lcd_blank(int blank, struct fb_info *info)
>  		    info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR)
>  			for (i = 0; i < 256; i++)
>  				vt8500lcd_setcolreg(i, 0, 0, 0, 0, info);
> +		fallthrough;
>  	case FB_BLANK_UNBLANK:
>  		if (info->fix.visual == FB_VISUAL_PSEUDOCOLOR ||
>  		    info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
