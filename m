Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E5013C63E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 15:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90F66EA29;
	Wed, 15 Jan 2020 14:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16786EA29
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:36:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200115143612euoutp021cf917c519ef54ca313a67711f5e5729~qFiYN9xyq0944909449euoutp02X
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:36:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200115143612euoutp021cf917c519ef54ca313a67711f5e5729~qFiYN9xyq0944909449euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579098972;
 bh=G52O5VyNkErB7xWbsCXmqXw9uHYiR3BQe0k0xtJJtVU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=WwT7A7LQB5GyCxHAvpvm5OyvguqNhGfwu00DhWFoyUsH3AdQOttSGSe4ZFpU1yiFe
 hlNBlmBWoAW7O8mP3JMNa+fu8BXUDSnR9JIYgfgU1ZXikRiyWBevlxmiv91uCb5HUg
 CjUCqtUh8+g4+jiLOoGTDKOE/xB8fwKvVvIOUtXs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200115143611eucas1p1b99d81b0eb3e49c193f0dd438e304573~qFiYGx7rO1192611926eucas1p1A;
 Wed, 15 Jan 2020 14:36:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id E5.BB.60698.B532F1E5; Wed, 15
 Jan 2020 14:36:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200115143611eucas1p1fb720b3a7cd83378e2fa86128b2fa5d3~qFiX3FwvZ1254612546eucas1p1I;
 Wed, 15 Jan 2020 14:36:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200115143611eusmtrp2503177ee93c20432211e2990686bb9d9~qFiX18H3W3077130771eusmtrp2e;
 Wed, 15 Jan 2020 14:36:11 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-e0-5e1f235be781
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A2.78.08375.B532F1E5; Wed, 15
 Jan 2020 14:36:11 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200115143610eusmtip1d1664341b38dc49e35cdc2e08ea10735~qFiXMRjAU2108921089eusmtip1q;
 Wed, 15 Jan 2020 14:36:10 +0000 (GMT)
Subject: Re: [PATCH][next] video: hyperv: hyperv_fb: fix indentation issue
To: Colin King <colin.king@canonical.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <060a65e9-1880-0356-f8f3-447cb391b4e7@samsung.com>
Date: Wed, 15 Jan 2020 15:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191114172720.322023-1-colin.king@canonical.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUyMcRzf756Xe7o5+3mKvkLZY5kMed8zTIzZzYaGmXk5jp4V3dXteXqR
 sGh5ObJiqKtJmHR5abfqLqxRVkIdlWZXG5vb1OWSYojQ03NN/332ednn+/ntxxCskwphDiQk
 CWKCwcjRGrKq/qdr7s4ZYfr558qW8L/Ksmm+7dtnmm936PhK9xTeU1ap5p+d76P4S7l9NN/6
 oJDm7Xfaad5X94RYpdFZM7Jpnd12hta9O9ug0mU5h9S6AXtoNLVDsyJGMB5IEcTIlXs1cT/d
 tWpzDXPoclYPmYEGaAsKYAAvht5TvciCNAyLbyN42JKvlgUWf0Xw6iUowgCCTzXl6tFEfbFL
 pQglw4Lvuz/uQ3DTm0fIrkC8Hpy+H6QFMUwQjgBXsyh7CPxUBcWPLlCyh8bLIPeUDclYi1dC
 5vPckQYSh8NrbxUp44l4O/S/r6MUzwRozPeM8AE4Clqvvh3hCRwMbk+RSsFh4PAVEnIZ4Odq
 KPjSTSpnr4UCVxel4EDwNlT450yFv9VFKiVwD8HQ6S5/2oGg5OIf/zMth87mQVqeQwzPuf8g
 UqFXw4/j9ZRMAx4Pb30TlCPGw4WqK4RCa+H0SVZxz4TyW+X0aK2lupTIQZx1zDTrmDnWMXOs
 /3uvIdKGgoVkyRQrSIsShNR5ksEkJSfEztufaLKj4f/04k/DNyeq+b2vFmEGceO0cb9D9Sxl
 SJHSTLUIGIIL0jbmTdOz2hhD2mFBTNwjJhsFqRZNYUguWLvoevduFscakoR4QTAL4qiqYgJC
 MlByJlc0tbLsQ/4WzovZVjHiE2uytVVTthPuzHRHVU5jxyzTpGOb9H9Ltj4OXbeq4kj40hdD
 xo13ByoSLy2gSzdXRPVE7TrU0n/DbLvyJMZUujDjFx2cl5oevaEv502hZnmTxBzc1t68Jv4j
 O904p9fs8JydNDg4Wd2Z1d9xtMkbzpFSnGHBbEKUDP8Ax8FLUUsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7rRyvJxBvOPKlv8Xt3LZnHl63s2
 i2vbPSy23pK2eLJ6K7vFib4PrBZTJ35gs7i8aw6bxaY119gs3h4+yOzA5TGroZfNY9OqTjaP
 +93HmTxad/xl9/i8SS6ANUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEv4+etQ+wF+zgqprW+Zmlg/MzWxcjJISFgInFs4XmmLkYuDiGBpYwSpya+
 ZOli5ABKyEgcX18GUSMs8edaFxtEzWtGiZOrV7KDJIQFvCR2vP0BVi8ioClx/lwRSA2zwDEm
 iev3PjJCNExilJi+dAITSAObgJXExPZVjCA2r4CdRPOpiWCDWARUJS6+2sYCYosKREgc3jEL
 qkZQ4uTMJ2BxTgF7icvzbrCC2MwC6hJ/5l1ihrDFJW49mc8EYctLbH87h3kCo9AsJO2zkLTM
 QtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHxuO3Yz807GC9tDD7EKMDBqMTD
 m/FHLk6INbGsuDL3EKMEB7OSCO/JGbJxQrwpiZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTBV5
 JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYJaP/y31kDrr6YNuM
 7RqJAndWGZTLzOFOjzqQKmKaUlfAk7VhTb1UycoHwSU9J5bcX6pkY1YvuqA+3frD88n5nhYZ
 n+wOtzGdSzr5smGK/gWRJ7y/Oi6WnLfcvXqv7bsc5W3MbaXyga85vuw5ebmGSaVIIuaa3snK
 S49yFn5VMF4qsj1/SaedEktxRqKhFnNRcSIAc9kMwt0CAAA=
X-CMS-MailID: 20200115143611eucas1p1fb720b3a7cd83378e2fa86128b2fa5d3
X-Msg-Generator: CA
X-RootMTR: 20191114172730eucas1p1206011eed67d59f39fbbcf0b9ad1bbca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191114172730eucas1p1206011eed67d59f39fbbcf0b9ad1bbca
References: <CGME20191114172730eucas1p1206011eed67d59f39fbbcf0b9ad1bbca@eucas1p1.samsung.com>
 <20191114172720.322023-1-colin.king@canonical.com>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "K . Y . Srinivasan" <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/14/19 6:27 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a block of statements that are indented
> too deeply, remove the extraneous tabs.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch queued for v5.6, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/hyperv_fb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 4cd27e5172a1..5fcf4bdf85ab 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -582,8 +582,8 @@ static int synthvid_get_supported_resolution(struct hv_device *hdev)
>  	t = wait_for_completion_timeout(&par->wait, VSP_TIMEOUT);
>  	if (!t) {
>  		pr_err("Time out on waiting resolution response\n");
> -			ret = -ETIMEDOUT;
> -			goto out;
> +		ret = -ETIMEDOUT;
> +		goto out;
>  	}
>  
>  	if (msg->resolution_resp.resolution_count == 0) {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
