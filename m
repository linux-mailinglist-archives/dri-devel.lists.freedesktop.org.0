Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AB13C8B0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 17:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079776EAFD;
	Wed, 15 Jan 2020 16:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C306A6EAFD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:04:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115160409euoutp024de662a2f9e1dfa478cd936f06d999cc~qGvLR1tPo3095530955euoutp02a
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 16:04:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115160409euoutp024de662a2f9e1dfa478cd936f06d999cc~qGvLR1tPo3095530955euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579104249;
 bh=JNoHgjvybzOR918hCf0sW82RgR6qUXdh7J7cH64kGnQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=pZleq9BSydWIxgcIfq15BjdstwrVvVUfyY+swrMWTl182dMDAZfMY0MujNW9uyiLX
 GbOlu01j9TE7IsWlUdIs1YI5fKX/akRP0x1p10dm1gXqUjaU43ts5Ui383RQNrH1uq
 8LluMxVNfVz5N8e7xjwK5v+M/qOPSZ3vW2bL7pRg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115160409eucas1p1e6151b5882ac620595bed5741dc7d075~qGvK-wjEX0715807158eucas1p15;
 Wed, 15 Jan 2020 16:04:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id DE.77.60698.9F73F1E5; Wed, 15
 Jan 2020 16:04:09 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200115160408eucas1p2934b15554794b0d286d52fecd0ac159c~qGvKlEsLR1927219272eucas1p2r;
 Wed, 15 Jan 2020 16:04:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200115160408eusmtrp1dd2fde83dde46a4861541748dc72a10c~qGvKkceYj0755607556eusmtrp1d;
 Wed, 15 Jan 2020 16:04:08 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-f6-5e1f37f91b85
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 02.23.08375.8F73F1E5; Wed, 15
 Jan 2020 16:04:08 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115160408eusmtip1ffa3439495cd450599e31ddbc03818fb~qGvKTCImt1313113131eusmtip1a;
 Wed, 15 Jan 2020 16:04:08 +0000 (GMT)
Subject: Re: [PATCH 07/16] video: sa1100fb: constify copied structure
To: Julia Lawall <Julia.Lawall@inria.fr>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <84714bc2-1c5b-7428-a8ae-102f43605f67@samsung.com>
Date: Wed, 15 Jan 2020 17:04:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1577864614-5543-8-git-send-email-Julia.Lawall@inria.fr>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djP87o/zeXjDO6d4ba48vU9m0XTqn5m
 i623pC1O9H1gtbi8aw6bA6vHpBeHWDzudx9n8vi8SS6AOYrLJiU1J7MstUjfLoEr4/XU86wF
 b9krntxaxtrAuJqti5GTQ0LAROJS2232LkYuDiGBFYwSi57OYIZwvjBKXNz0ng3C+cwo8WbN
 HbiWew2nWSASyxkl1rR9Z4Vw3jJKPFjSzAJSJSzgKnHt2V+wDhEBDYmlG1eAdTALNDJKzNqy
 ByzBJmAlMbF9FSOIzStgJ/H4zSkwm0VAVeLkwqdgtqhAhMSnB4dZIWoEJU7OfAI0iIODE2jB
 7cecIGFmAXGJW0/mM0HY8hLb384B+0FCYDK7xKJtDxkhznaRWPtwIwuELSzx6vgWdghbRuL0
 5B4WiIZ1jBJ/O15AdW9nlFg++R/U09YSd879YgPZzCygKbF+lz5E2FHi7+p7TCBhCQE+iRtv
 BSGO4JOYtG06M0SYV6KjTQiiWk1iw7INbDBru3auZJ7AqDQLyWezkLwzC8k7sxD2LmBkWcUo
 nlpanJueWmycl1quV5yYW1yal66XnJ+7iRGYXE7/O/51B+O+P0mHGAU4GJV4eDP+yMUJsSaW
 FVfmHmKU4GBWEuE9OUM2Tog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWp
 RTBZJg5OqQbGoxdmTv7Ecv+teQfn4yo72X/LayI7D/cZzPcNkN/+QKlv1tGlX8ui3epSNjOe
 M+z8ciPx8Qv5re8+LOCdXGWt0vH4gLnmy/YGPuX87sX+wTmvZ6WKLjwTwafhavhzu4SfkoJW
 a3/FelvViC4Z39B8v4Cpjy0Megr3y9xp2bxi0neDpjlFM9OVWIozEg21mIuKEwGPJ4yPKgMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7o/zOXjDJ4d07W48vU9m0XTqn5m
 i623pC1O9H1gtbi8aw6bA6vHpBeHWDzudx9n8vi8SS6AOUrPpii/tCRVISO/uMRWKdrQwkjP
 0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4/XU86wFb9krntxaxtrAuJqti5GTQ0LA
 ROJew2mWLkYuDiGBpYwSv3oWAzkcQAkZiePryyBqhCX+XOtig6h5zShxZ9oyRpCEsICrxLVn
 f8EGiQhoSCzduAJsELNAI6NE/56NTBAdlxklDjycxQ5SxSZgJTGxfRVYN6+AncTjN6fAbBYB
 VYmTC5+C2aICERKHd8yCqhGUODnzCdhFnEDbbj/mBAkzC6hL/Jl3iRnCFpe49WQ+E4QtL7H9
 7RzmCYxCs5B0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIExtK2Yz83
 72C8tDH4EKMAB6MSD2/GH7k4IdbEsuLK3EOMEhzMSiK8J2fIxgnxpiRWVqUW5ccXleakFh9i
 NAX6bSKzlGhyPjDO80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
 MIrdm//pplKs220hEQPuq7edHVc2P2ndqZXiK1OmcPlmw9uixyeNq2pWLex9dnXPsow2m1X5
 AfXyTgblnX/nLE1SifQTUHPd6vL/dcJpoZOKWnE/fjtcu/Ww76Kcykm+Fc+nsa5M+vElNKVi
 nZPTlWv+Kqu3fnr3K89x17G5R0VtgjVb36bqKyuxFGckGmoxFxUnAgAr47NSuwIAAA==
X-CMS-MailID: 20200115160408eucas1p2934b15554794b0d286d52fecd0ac159c
X-Msg-Generator: CA
X-RootMTR: 20200101082012epcas5p2b0169522e476fa40aba6bbdd569ca0f0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200101082012epcas5p2b0169522e476fa40aba6bbdd569ca0f0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
 <CGME20200101082012epcas5p2b0169522e476fa40aba6bbdd569ca0f0@epcas5p2.samsung.com>
 <1577864614-5543-8-git-send-email-Julia.Lawall@inria.fr>
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/1/20 8:43 AM, Julia Lawall wrote:
> The monspecs structure is only copied into another structure,
> so make it const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch queued for v5.6, thanks.
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/sa1100fb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
> index 4680cc3efb81..c77b43dbc256 100644
> --- a/drivers/video/fbdev/sa1100fb.c
> +++ b/drivers/video/fbdev/sa1100fb.c
> @@ -1053,7 +1053,7 @@ static int sa1100fb_map_video_memory(struct sa1100fb_info *fbi)
>  }
>  
>  /* Fake monspecs to fill in fbinfo structure */
> -static struct fb_monspecs monspecs = {
> +static const struct fb_monspecs monspecs = {
>  	.hfmin	= 30000,
>  	.hfmax	= 70000,
>  	.vfmin	= 50,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
