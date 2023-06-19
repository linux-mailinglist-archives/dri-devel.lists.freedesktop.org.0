Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB5734B95
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 08:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C02710E09C;
	Mon, 19 Jun 2023 06:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90A910E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687155086; x=1687759886; i=deller@gmx.de;
 bh=P+Esof1YkoJviOw/O1LMFwIZDYvJjAHEzRBugaxqQ08=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BePiKZC93rn8fb3tdbAg2dfQTQDxM6OtIMabvFnND5NRxQw6VZJb13KN4qydEIBwaWhzg/A
 7tIqj/ORg5X9/EuzaJCTIxMFpWd2E4BQqEhxd/CxItD5CrezVgnPqteX73hVcGhpicPyYTcw9
 8QjVD3qMKtJoUBeyKfzgI2TG1hJVTGT2tmT/i7yPHrF/jQ2Zcgceq+5sPgX//0JykMWXupXOY
 pqkl8PiSLisNPWmpwd9q/jJ3NowUA2ZdqYJTGtr4C/VDrQ/2TOTW4bNHQSDcLMOIcWubvPV3V
 JEMT8cf48Yke8Awy1ZRodTcazyDEtLVRQNmRJew29K3YkBMNfRew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.144.204]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacSY-1pZ3Su09tK-00c7D5; Mon, 19
 Jun 2023 08:11:26 +0200
Message-ID: <761b02d9-d2a8-ffd0-d7aa-0b3160fc9e5c@gmx.de>
Date: Mon, 19 Jun 2023 08:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] fbdev: broadsheetfb: Add MODULE_FIRMWARE macro
Content-Language: en-US
To: Juerg Haefliger <juerg.haefliger@canonical.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230616120705.1030177-1-juerg.haefliger@canonical.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230616120705.1030177-1-juerg.haefliger@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hfcVO7x5PoJ9wUPo2VY6PYhbeY5iIVs48mMTqC1se1qLyRYGVMI
 v8u+3EYAQ4/jGacPPv9n/hkejCM6bFQ0WP225Gx1wOHL44MfTzupQevSiIgHIj0viuFGCvk
 GUzWPx5+a0gb4RaW7dYPclN5U78ijHXyuwrb06P3edefeA6cXni1L3FZ5qFhvjTlh0Mj9Lj
 ues2EfwxB03uyM3NNZIWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Ag5jfjhGsQ=;qdlVMD8TfhfR7aT+8a6uoU3+c1H
 JI+t0bkgiHlhSYEKHpnTmj8Cjh9NtQXIkeWKVn2DFp7DxSkXdGHF1Lqn0yhcKNYProLIx5CsD
 Y6UyQJv7uULHiLZjd2LK9z/eyFZ3QJxmwxSHpk+3Ws3kKI9sODia9gGgX3nSzyVGtgN2cBJxd
 vmPIjkFlw5hc88iuHL19BV1mxIDtXeRlqzYJRIHhqLVJPPvcXznerkGcO6YnOq1ZPogFUztli
 n7ntROY2iiU+dKQuDIS0svPWcKtmgjMit9io52puP8yrHWqBo1KUCKfmKNnD6X40d4lqfv5Kr
 Nfuc9jVj3hq7iSY40VYSjt+G20DjnqmxYHEHuA/JFuaQXOI6ZFf2ioU5jyoGd7fF+gXhDiIQK
 +w5uzdtPlC5Ljz+zbBuOyMI4K8tChIyqdKNi9RBnBHdh6JYyGnPlxATCTfccscMui6QJRHfHk
 qOYx7XG9OBDVQ6FlQIyqMIoXs+uE4xhDNTUoe6YgI+Z/jLyhpsdTtFvRBP5LD40oAqyNd9LQF
 PXlngLbpZTy+vXqH1jko3m0azI230OPJtg5kX5oMK624iioGwPVRw4rax//p8ZJrdD4z8QwAd
 Zk+C9HajA38ODObt4fuc+ThWoFm3TVBxiyYst8wEnn6HURNknW2XlXyQCVKVwgPymgmaJk7Ki
 ZftUXPFR5jWoXdQZDYZ8qGdnFWVds1cNbnTwdmvqyjXiV+qhChHJsZozSHNz3WFMhbMe3SLvM
 xO9dvv1sD0Usae6aScmJ8gKBFFJwWYZ/0RedWX6vVGFcwnMQNRq80I3M68v6tIap2mNcMLSRO
 MTkw/534DZc71UVMWQxL0+XvMU0LOZOXgLpx5dGiW79b+OxRfZ8kBGo/n/e83nQjgHyIWLp4a
 S9bMSu71pugLRQSqgTEJXRiLB5nArYPa0/YeXQCLXj6/s8vUcHGnpkVVKa7eQphjYly13994P
 SCL9xo3RdX4rWlQV9Oqv/X74ozo=
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
Cc: linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/16/23 14:07, Juerg Haefliger wrote:
> The module loads firmware so add a MODULE_FIRMWARE macro to provide that
> information via modinfo.
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

I applied both of your patches to the fbdev git tree.

Thanks!
Helge


> ---
>   drivers/video/fbdev/broadsheetfb.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/br=
oadsheetfb.c
> index b518cacbf7cd..678d182d187d 100644
> --- a/drivers/video/fbdev/broadsheetfb.c
> +++ b/drivers/video/fbdev/broadsheetfb.c
> @@ -1223,3 +1223,5 @@ module_platform_driver(broadsheetfb_driver);
>   MODULE_DESCRIPTION("fbdev driver for Broadsheet controller");
>   MODULE_AUTHOR("Jaya Kumar");
>   MODULE_LICENSE("GPL");
> +
> +MODULE_FIRMWARE("broadsheet.wbf");

