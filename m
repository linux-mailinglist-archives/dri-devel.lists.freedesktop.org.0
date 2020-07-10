Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2121B873
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 16:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41936EC6D;
	Fri, 10 Jul 2020 14:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392C6E098
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:24:07 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200710142406euoutp029933b79c6f1bfff08d0bbe5aab02fdb1~gajWaLUmb0877608776euoutp02N
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 14:24:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200710142406euoutp029933b79c6f1bfff08d0bbe5aab02fdb1~gajWaLUmb0877608776euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594391046;
 bh=PJaw4qA6aoVbSe+NmWHswntCdkvYkMsimoVlG4G6jVg=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=AuwiE49ecbGMxnfmFmEauXqDbuaFLWSjFkACjlKuUQPB7uLFmOxX0wN+cM2Trl7Cr
 qNb3mMIz3Fw87hDNvdv7uhB2RMZbWFLcjJCTrVz2uWPNJSkw5zQ9l+4koWW0sfG+CM
 OutqCkgK3zp6J3LPzboQroN1TFkbEGoWF3TKh7nQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200710142406eucas1p2c2986735d9cb892535dbd1e04b2b0ea4~gajWO485K0956909569eucas1p2I;
 Fri, 10 Jul 2020 14:24:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.DE.06318.60A780F5; Fri, 10
 Jul 2020 15:24:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200710142406eucas1p16bb32654aa14bf6f6b6b2cb7bb64521c~gajWA9VJa0592905929eucas1p1j;
 Fri, 10 Jul 2020 14:24:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200710142406eusmtrp182d50e203d03256a2d8f59c7c8210ce3~gajWAPcGB1135411354eusmtrp1u;
 Fri, 10 Jul 2020 14:24:06 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-58-5f087a06baf9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B4.E1.06314.60A780F5; Fri, 10
 Jul 2020 15:24:06 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200710142405eusmtip126ac62dd2a90a7172719131e8ae07076~gajVp85MC0341503415eusmtip1V;
 Fri, 10 Jul 2020 14:24:05 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: sm712fb: set error code in probe
To: Evgeny Novikov <novikov@ispras.ru>
Message-ID: <6f500a1e-96d8-2238-ad26-99a39dca61ec@samsung.com>
Date: Fri, 10 Jul 2020 16:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200706155328.8396-1-novikov@ispras.ru>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0iTYRTHe/Ze9jqavE7Ng0bBJKXIG0YME8sI25coP2WS6dIXtdwmm1r6
 aUJemGnmvSF5S2e2vE5NSa1FLR1JWamUooSyWcqsKaE4yflO8tvvXP7P/5zDQ2GCLsKbSpVl
 MAqZJE1I8vC+dxvjAWQOFR+sa3YXfVm3kiJtkRoXvS9ZJUSfB2tJUdOwiit6ZarARLonL9E5
 rnhAM8sV12xXIvHMLzshnisycsTmuUVSbOs+coWM5YUnMWmpWYwiKCKBl1JhHEfpDdRdTUcZ
 pkKTpBq5UECfgirLGKFGPEpAtyJ4UGx2BmsI/rY1OQMbAl3dV86epLtxFLEFLYKRgUYOG6wg
 sG1tch1dJB0GDwvakIPd6XCYap7DHexB+4Eqb3SXMfo7gqFFPwfz6QjomqjCHIzTx0BX3Us4
 2JOOgT/zbwi2xw1GHy3sal3o02D5WEOw73jBt4U6DstHoX+lFnMMBLSBC0VWs3PsCzCf14hY
 doefRj2X5cNgKr+Ps4J2BPZCi1Pdj0Bbvu280xmYGd/cYWrH4jh0DAax6UhomGxFjjTQrjC9
 4sYO4QplfdUYm+ZDYb6A7faDzpZOcs9WPfAUK0VCzb7VNPvW0exbR/Pftx7hbciLyVRKkxll
 qIy5E6iUSJWZsuTARLm0G+18JNO2cf0FGt66aUA0hYQH+fUSKl5ASLKU2VIDAgoTevDPfzDd
 EPCTJNk5jEIer8hMY5QG5EPhQi9+aONSnIBOlmQwtxkmnVHsVTmUi7cKBT5r9TDhg7/7YrT2
 5xexzcjo6E5bm8yeqxsqM10eS054HdH+Vn8yv/fTyFV/7+XSgKUDqz9ibWfNes9rSf6bURZt
 2PXZiUTfQ6uufqEFLYTvgn+xj1VumLo1HzW9cS9P3mGNU/Toaxq2mJURfkhwydLj9OVK81pP
 lcHNNzP3khBXpkhCTmAKpeQfy74840QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xu7psVRzxBpd3MFtc+fqezWJ5dxeL
 xYm+D6wWl3fNYbNYvK+B3eLA6SnMFmuW7GF0YPfYOesuu8eMf1MZPe68/svqcb/7OJPH8/tP
 2Tw+b5ILYIvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3S
 t0vQy5hy/BxjwUKOilnrJzE3MF5j62Lk5JAQMJHYtOgkYxcjF4eQwFJGiRsNu1i7GDmAEjIS
 x9eXQdQIS/y51sUGUfOaUeLF0UeMIAk2ASuJie2rwGxhARuJ60vvs4DYIgJqEg2tJ1lAGpgF
 bjNKtK56DbWhk1HizP1WdpAqXgE7iY2XpjGD2CwCqhJrpm9lBbFFBSIkDu+YxQhRIyhxcuYT
 sKmcAmYSLy7MAKthFlCX+DPvEjOELS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYw
 sqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjMBtx35u3sF4aWPwIUYBDkYlHt4FiRzxQqyJ
 ZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGByyCuJNzQ1NLew
 NDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwFiyP81zr8ZzDuvGlMbfqhv+Vj/f
 tsY2OD3q1LoWXn2L1aarPdfVBEWXTOQrXFzmF821bP3C2Pk778nutTmxu3PxV+vTX0MPasZV
 fdwy4cmB9gbbhrkJPEc+RcR9uvp95cQpV+rmRSyVObZTfvKMdqepPr9djETPXhDsTpTQ/LV4
 poD0gnlvSiWUWIozEg21mIuKEwEFZxT+1gIAAA==
X-CMS-MailID: 20200710142406eucas1p16bb32654aa14bf6f6b6b2cb7bb64521c
X-Msg-Generator: CA
X-RootMTR: 20200706155341eucas1p2081ccd8bd81c097272e13e7fe84244ee
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200706155341eucas1p2081ccd8bd81c097272e13e7fe84244ee
References: <CGME20200706155341eucas1p2081ccd8bd81c097272e13e7fe84244ee@eucas1p2.samsung.com>
 <20200706155328.8396-1-novikov@ispras.ru>
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
Cc: ldv-project@linuxtesting.org, linux-fbdev@vger.kernel.org,
 Teddy Wang <teddy.wang@siliconmotion.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/6/20 5:53 PM, Evgeny Novikov wrote:
> If smtcfb_pci_probe() does not detect a valid chip it cleans up
> everything and returns 0. This can result in various bad things later.
> The patch sets the error code on the corresponding path.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Applied to drm-misc-next tree, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/sm712fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
> index 6a1b4a853d9e..fbe97340b8e0 100644
> --- a/drivers/video/fbdev/sm712fb.c
> +++ b/drivers/video/fbdev/sm712fb.c
> @@ -1614,7 +1614,7 @@ static int smtcfb_pci_probe(struct pci_dev *pdev,
>  	default:
>  		dev_err(&pdev->dev,
>  			"No valid Silicon Motion display chip was detected!\n");
> -
> +		err = -ENODEV;
>  		goto failed_fb;
>  	}
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
