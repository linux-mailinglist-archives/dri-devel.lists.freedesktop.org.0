Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83702610D5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25AF6E5C6;
	Tue,  8 Sep 2020 11:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC18C6E7E5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113733euoutp02e9c1b3fcda3c4e2f2d04526e38578654~yy-D-d-oq0099700997euoutp02R
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113733euoutp02e9c1b3fcda3c4e2f2d04526e38578654~yy-D-d-oq0099700997euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565053;
 bh=u3Pcq458GxZ7RineOkM2sEHGhZp+iLfw9vPwU7uI9YI=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=OOypelAH/83nPdE+fjKs8DLLFLRQ8kfECKHeXqbqScwBfvLOglwGDTXwrPI+xd6am
 hc4AQL6jo4AW+skiSq4KIG5kjZFRVZq8t6ePlzKJidBpCPw5fXTEGsJ2/GBZ4H38RQ
 AiIOrqiLvyU1K8IPUND5KqscmdMPNVFA8CnAPQ4I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113733eucas1p1c97a9b04cb42c302277a7b6d66d25ad1~yy-D0QOXa1726317263eucas1p1P;
 Tue,  8 Sep 2020 11:37:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5E.55.05997.DFC675F5; Tue,  8
 Sep 2020 12:37:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113733eucas1p19b287b4e09aefe2ed9dce5eb9a7ea13c~yy-DkkMEw1723917239eucas1p1W;
 Tue,  8 Sep 2020 11:37:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200908113733eusmtrp2c6562a6c4782ddbaf4a000171ecadb03~yy-DkBO3k3046530465eusmtrp2a;
 Tue,  8 Sep 2020 11:37:33 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-e8-5f576cfdae77
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4F.B4.06017.DFC675F5; Tue,  8
 Sep 2020 12:37:33 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113732eusmtip232e8ee2a9507b3d9b41b6c302efef1a3~yy-DSuyMX1663016630eusmtip2W;
 Tue,  8 Sep 2020 11:37:32 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 22/29] video: fbdev: Avoid comma separated statements
To: Joe Perches <joe@perches.com>
Message-ID: <736b1915-b6dc-3cdb-2bff-a307406ce354@samsung.com>
Date: Tue, 8 Sep 2020 13:37:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3e56046e67e583ac93030297ff6d58c08ca54086.1598331149.git.joe@perches.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsWy7djP87p/c8LjDZ7dF7e48vU9m8Xs+49Z
 LE70fWC1uLxrDpvF+/2XmRxYPTat6mTzuN99nMnjy6przB6fN8kFsERx2aSk5mSWpRbp2yVw
 Zey5OJG9YDVPxcOeO4wNjDs5uxg5OSQETCSWL9rD3MXIxSEksIJRYkf/RHYI5wujxKcL3YwQ
 zmdGib7nKxhhWv6f6meCSCxnlPi7oAGq/y2jxKPedSwgVWwCVhIT21eBdQgLeEp8WfsOqIiD
 Q0RAUeLuFn6QemaBJkaJJ2cuMYPU8ArYSXyftoENxGYRUJE48mIpWK+oQITEpweHWSFqBCVO
 znwCNp9TIEzixf6jYPXMAuISt57MZ4Kw5SW2v50DdpCEwDx2iSkXtzBDnO0isfr8T3YIW1ji
 1fEtULaMxP+d85kgGtYBvdPxAqp7O6PE8sn/2CCqrCXunPvFBvICs4CmxPpd+iCmhICjxJ1b
 ohAmn8SNt4IQN/BJTNo2nRkizCvR0SYEMUNNYsOyDWwwW7t2rmSewKg0C8lns5B8MwvJN7MQ
 1i5gZFnFKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmGZO/zv+ZQfjrj9JhxgFOBiVeHg/
 eIXFC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJ
 JanZqakFqUUwWSYOTqkGRnv5ny1XjLSO/63cFKClyXN39/YJcntzyyZ0u9YzVciX12yZtCTw
 TarufB2fjIN5T3VWO57qeDaNX9f5b9Tm62+aN+R13lIz3HjCt/35sRv7N7j9XT9ztcZL16gd
 mlHcIrb7elKeRjbNS3uxWc5HVHzS7yN6PiY7698urbvFdVvze/XKV9cL2ZRYijMSDbWYi4oT
 AbQCanIvAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7p/c8LjDdYdZrO48vU9m8Xs+49Z
 LE70fWC1uLxrDpvF+/2XmRxYPTat6mTzuN99nMnjy6przB6fN8kFsETp2RTll5akKmTkF5fY
 KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZey5OJG9YDVPxcOeO4wNjDs5
 uxg5OSQETCT+n+pn6mLk4hASWMoo8WzBCSCHAyghI3F8fRlEjbDEn2tdbBA1rxklZnQ2MYEk
 2ASsJCa2r2IEsYUFPCW+rH3HDNIrIqAocXcLP0iYWaCJUWLpAkuI3kuMEldPfmcHSfAK2El8
 n7aBDcRmEVCROPJiKdgcUYEIicM7ZjFC1AhKnJz5hAXE5hQIk3ix/ygbxFB1iT/zLjFD2OIS
 t57MZ4Kw5SW2v53DPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT8
 3E2MwKjaduznlh2MXe+CDzEKcDAq8fB+8AqLF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVq
 UX58UWlOavEhRlOg5yYyS4km5wMjPq8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklqdmpq
 QWoRTB8TB6dUA6OknOztknpVjzmTF36QviJyyU3NkoE/ZaF46Rm+CsH84y9zNNZPNLr5N0/s
 auLFa3eeWiVrzw9hXnNZh100/95jrkcah2/8WvxN1d9vQ4mJdErzgeSaWTfNsr0svuz5XNS3
 qVS84387P8Oeq79WXp7PNks6KNctrmtWnsX8+Aqz+l8ytb6/W5VYijMSDbWYi4oTAV6q3CrA
 AgAA
X-CMS-MailID: 20200908113733eucas1p19b287b4e09aefe2ed9dce5eb9a7ea13c
X-Msg-Generator: CA
X-RootMTR: 20200825045729eucas1p2a05e6a670152b105f1b4cf31d6e2090c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200825045729eucas1p2a05e6a670152b105f1b4cf31d6e2090c
References: <cover.1598331148.git.joe@perches.com>
 <CGME20200825045729eucas1p2a05e6a670152b105f1b4cf31d6e2090c@eucas1p2.samsung.com>
 <3e56046e67e583ac93030297ff6d58c08ca54086.1598331149.git.joe@perches.com>
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
Cc: linux-fbdev@vger.kernel.org, Jiri Kosina <trivial@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/25/20 6:56 AM, Joe Perches wrote:
> Use semicolons and braces.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/tgafb.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
> index e9869135d833..666fbe2f671c 100644
> --- a/drivers/video/fbdev/tgafb.c
> +++ b/drivers/video/fbdev/tgafb.c
> @@ -989,8 +989,10 @@ tgafb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
>  	/* We can fill 2k pixels per operation.  Notice blocks that fit
>  	   the width of the screen so that we can take advantage of this
>  	   and fill more than one line per write.  */
> -	if (width == line_length)
> -		width *= height, height = 1;
> +	if (width == line_length) {
> +		width *= height;
> +		height = 1;
> +	}
>  
>  	/* The write into the frame buffer must be aligned to 4 bytes,
>  	   but we are allowed to encode the offset within the word in
> @@ -1171,8 +1173,10 @@ copyarea_8bpp(struct fb_info *info, u32 dx, u32 dy, u32 sx, u32 sy,
>  	   More than anything else, these control how we do copies.  */
>  	depos = dy * line_length + dx;
>  	sepos = sy * line_length + sx;
> -	if (backward)
> -		depos += width, sepos += width;
> +	if (backward) {
> +		depos += width;
> +		sepos += width;
> +	}
>  
>  	/* Next copy full words at a time.  */
>  	n32 = width / 32;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
