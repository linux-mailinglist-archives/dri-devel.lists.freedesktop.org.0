Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73802610C8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DF06E5A4;
	Tue,  8 Sep 2020 11:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3496E5A4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200908113710euoutp02e5532a80e696e92fad391e7b3a65892e~yy_uSrPXF0099900999euoutp02B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 11:37:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200908113710euoutp02e5532a80e696e92fad391e7b3a65892e~yy_uSrPXF0099900999euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599565030;
 bh=v/ErI8JZiQ4Gu6SQuSCQ0wdF0up8zANm/1N79AxbHY8=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=N1A37vEcFv99D2JOebOwG7EKFsegFvbx0A5vuS2zLlrkIt9EigcWiKff7If/t2YJT
 2zftlZ108TdLMfhNiKqiE0UmFDcw4Rr8+lFY5noHvPu7wNOrvwDn+d1S5UUVxvahwb
 LZcurBhuZ7XWv87drdzVbzpO+cikyerBUNYBJFTQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200908113709eucas1p10a1fb40d4cc8b161aab0807005defe50~yy_tsiMSA0482504825eucas1p1s;
 Tue,  8 Sep 2020 11:37:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0C.45.05997.5EC675F5; Tue,  8
 Sep 2020 12:37:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200908113709eucas1p1ef92b424313a618c2f015d8c51094207~yy_td29_61732217322eucas1p18;
 Tue,  8 Sep 2020 11:37:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200908113709eusmtrp10eb8c0d0716671845ed9f3f294ce2f95~yy_tcfWoA2002820028eusmtrp1T;
 Tue,  8 Sep 2020 11:37:09 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-9a-5f576ce5a999
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DD.A4.06017.5EC675F5; Tue,  8
 Sep 2020 12:37:09 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200908113708eusmtip2dc0ff00bf34ecab347b3dd056cfc893a~yy_s9Xnnk1482414824eusmtip28;
 Tue,  8 Sep 2020 11:37:08 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] coccinelle: api: fix device_attr_show.cocci warnings
To: kernel test robot <lkp@intel.com>
Message-ID: <3c266a0e-a2b9-ffde-0768-3b4fa89b0bfe@samsung.com>
Date: Tue, 8 Sep 2020 13:37:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200810092100.GA42813@2f5448a72a42>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGe3fv7u7M2du0PC0zGBVW2iojLhViJnULgjBIK8pWXuxjrtrU
 Pv6SUpOZlEpKU9EsplPJGjZ1JtiEpi2Lakn0gRqLcrL8KI2FzbzeJP97znN+z3vOgZcm5P1i
 BX1Km87ptGqNkgogrU99L6O+aBKT13/IX8WUfGwTM3cGPhGMa3yYYlzP2hAzeXeMZEz9TsT0
 5Pci5o2tnGI8Vz9TzIg3nWm3VyKm1vcIxQayOa//UGxJR5mEbZ+oItlW4ycJe/fxoIh1u0pF
 bHvTaTa/zE+yffkOEXuv5C3F/rCE75t/KGBbCqc5lcnpVDHHAk6aXG+oc6P4ojV7EmWhIZkB
 SWnAm2Dq+RRlQAG0HNci+FraRQrFTwRD7a8kPCXHPxBUlyfMJgZ9oyIBqkHgsHwWC4UXQfed
 ApKnKLwFCq/VIV4H493QZeYTUjoEr4SWAdNMmsA3CHj3vXomIMMxkNPwa7pB0yReAf7h87y9
 CCfBWH+nWEAWQvdt9wwuxRuh0GojeE3gUHjvrhQJejk0e8sJ/n3AOTT4CgYIYe14qO+9hwQd
 DB5Hk0TQYeAsvk4KgfsI/uR9+5duRlBT7KcEait8fPGb4rcj8GpotKkEeztkD0+QvA04CN55
 FwpLBEGRtZQQbBnk5coFehU8MD2gZscaWs3ETaQ0zjnNOOcc45xzjP/nViGyDoVyGfq0VE6/
 UctdWKdXp+kztKnrTpxNs6Dpf+f0O362INvkcTvCNFIGykb2HEiWi9WZ+ktpdgQ0oQyRxfU4
 j8plKepLlznd2WRdhobT29FSmlSGyqKrB4/Icao6nTvDcec43WxXREsVWagwyh2+NzJOW3yo
 JiK3ua8vvChhrTXPMa+Y2nc4st88krRD0ZCoeKmq/VoEOipyZ1N0b5tlRUtNrNdRn7TnVg8s
 mxBfoTOfbJYkPDR3NSZW9DZ2hHnIDuuWqSUL4jI1ps6Jhs6W918Sd3XFVVmG94dsGo+If1Fh
 NixWjRs8qQeVpP6kesMaQqdX/wVcXQZQcwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsVy+t/xe7pPc8LjDXo2i1lMu7Ob1WLhw7vM
 Fle+vmezuHJqN6PFn8WfWCyWPTjNaHG2+xqjxeVdc9gsXjU/YrP48LbEYu+h+YwWK35uZXTg
 8Wi99JfNY9qB2ewee78tYPHYOesuu8fiPS+ZPJ5cmc7ksXdLlkf37H8sHve7jzN5LJl2lc3j
 8ya5AO4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsE
 vYxlVy6zFXwUqNjW8oexgfE1bxcjJ4eEgInEy58fmboYuTiEBJYyStz9cYO5i5EDKCEjcXx9
 GUSNsMSfa11sEDWvGSXeTNvKApJgE7CSmNi+ihHEFhbwlDixEmQQJ4eIgKrEjofLwIYyC0xk
 lmh5+gyqey2jxM2+HcwgVbwCdhKta74zgWxjEVCR+Pe+ECQsKhAhcXjHLEaIEkGJkzOfgC3j
 FDCSmLhtF1grs4C6xJ95l6BscYlbT+YzQdjyEtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWj
 SGppcW56brGRXnFibnFpXrpecn7uJkZgfG879nPLDsaud8GHGAU4GJV4eD94hcULsSaWFVfm
 HmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBvE5mlRJPzgaknryTe0NTQ3MLS0NzY
 3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QD4xKh064shYnGxxayfDxvJntu8/4D/48s
 ZXlk298ZUu1R7SL6d8/dsNQNYcy1qY9ctTZkXvsmsP2PXsq5jn9ty4V/TfLcwGN0Lj/WNSil
 amlEPceaRHOFIyFWy97EPrW02LA1reuLpumKH5+azPjSJuVNSVoXa/HgyIWEhZrftuVHexyS
 3NDHpcRSnJFoqMVcVJwIAGNSKjoFAwAA
X-CMS-MailID: 20200908113709eucas1p1ef92b424313a618c2f015d8c51094207
X-Msg-Generator: CA
X-RootMTR: 20200810092148eucas1p117cc6af85f23fb6e457fddb913d2b41a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200810092148eucas1p117cc6af85f23fb6e457fddb913d2b41a
References: <202008101736.EtK0s7BQ%lkp@intel.com>
 <CGME20200810092148eucas1p117cc6af85f23fb6e457fddb913d2b41a@eucas1p1.samsung.com>
 <20200810092100.GA42813@2f5448a72a42>
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
Cc: kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>, Qiujun Huang <hqjagain@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 8/10/20 11:21 AM, kernel test robot wrote:
> From: kernel test robot <lkp@intel.com>
> 
> drivers/video/fbdev/core/fbcon.c:3509:8-16: WARNING: use scnprintf or sprintf
> drivers/video/fbdev/core/fbcon.c:3484:8-16: WARNING: use scnprintf or sprintf
> 
> 
>  From Documentation/filesystems/sysfs.txt:
>   show() must not use snprintf() when formatting the value to be
>   returned to user space. If you can guarantee that an overflow
>   will never happen you can use sprintf() otherwise you must use
>   scnprintf().
> 
> Generated by: scripts/coccinelle/api/device_attr_show.cocci
> 
> Fixes: abfc19ff202d ("coccinelle: api: add device_attr_show script")
> CC: Denis Efremov <efremov@linux.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> ---
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fc80c51fd4b23ec007e88d4c688f2cac1b8648e7
> commit: abfc19ff202d287742483e15fd478ddd6ada2187 coccinelle: api: add device_attr_show script
> 
> Please take the patch only if it's a positive warning. Thanks!
> 
>  fbcon.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -3481,7 +3481,7 @@ static ssize_t show_rotate(struct device
>  	rotate = fbcon_get_rotate(info);
>  err:
>  	console_unlock();
> -	return snprintf(buf, PAGE_SIZE, "%d\n", rotate);
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", rotate);

buf length is at least PAGE_SIZE and rotate val is an int so
shouldn't this be converted to use sprintf() instead?

>  }
>  
>  static ssize_t show_cursor_blink(struct device *device,
> @@ -3506,7 +3506,7 @@ static ssize_t show_cursor_blink(struct
>  	blink = (ops->flags & FBCON_FLAGS_CURSOR_TIMER) ? 1 : 0;
>  err:
>  	console_unlock();
> -	return snprintf(buf, PAGE_SIZE, "%d\n", blink);
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", blink);

ditto for blink val

>  }
>  
>  static ssize_t store_cursor_blink(struct device *device,
> 
 
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
