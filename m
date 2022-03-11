Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D64D5C47
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 08:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1058610E220;
	Fri, 11 Mar 2022 07:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D8710E220
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646983552;
 bh=tb9da2vliY1QQTm6kyIGSzjr3e4h0kXK9SeRdQvrfr8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=i4fEm40CgZn7fcVYKtJObjuy0qSJvvuy/1qk4V3wue+LK7pgYyHmS5jFqBD3FlLzf
 EWv4O/J6+VOBsnJhWJzAg5CzeWKKmj36pda7c+o+BeyEjsjWuSLubcxrdc/frPE1m5
 jwp8pTUaTmoS/Lz8+inXBBLC+1OIT17mO+0lZxSQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.134.231]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1nYVy62kiQ-00TFb0; Fri, 11
 Mar 2022 08:25:52 +0100
Message-ID: <648cd020-a275-ea0b-e0bf-ff064dde16b0@gmx.de>
Date: Fri, 11 Mar 2022 08:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] video: fbdev: fix warning comparing pointer to 0
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>
References: <1646967409-27868-1-git-send-email-baihaowen@meizu.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <1646967409-27868-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9oHRzazegTYr+s16w14CND5n3RyXpeXOh+Y9VrQJYT7QBCkwN7D
 NXyPXPpNvAipyCienSK4HucCXNaM6vB4+ngkxx/fHFap4JmUgs7JA5nm5pWbuOg2anoccpi
 YUJV570vjxqDLFehKcewTagQsjQLTB+cRq0Q7s3G/WD2cLEWrGNzYHD0bzauyPs8+Ydg2C0
 /cy+rcNy+7FaUjqcR1TaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VNOq6dyrtT8=:EmOPAaPuupqWtIOfvgapHL
 FqBCLVShH5WDoTQn04cj+c+TeFajMbtN90vC0d4wce4jfNSqLjywCk9B5l7U9/vkb8arMudRh
 0H/AnBAGYdCugjfK6UqA+YMXNlgP6TLJYHDMI40yi0eruc+gIsEU7RPI+KfjW0EQU4Wg8uZRJ
 B6ap2liCYZUnOFRhrrlRMkzU5uO+Wvu/t23i62aKWZcaG1eaUQVixNagNacpug8RPVJkWCFvo
 3GXVtlOXEEK1XzEVuWCMSJW5RZdRUPpIzPHm6g5aIcrNL618pWH+kZ7ZwUPfrS7skeLn6odYe
 gy/prYGr/N44VB0srG9pp46fXKV4EAd4TxisMEeIFrpwoJ3KjWGvOakn6NgnY8xJwhhCLoPrA
 mSy9ItlZVg7ec/X0oZJYqKHrZYakfrK5orYpIKVVLUp17TG9UvVtX3wiuAm7HRQmCbhvmqPD3
 C4xgG1PQjTEIaZd4j9eXLHeuy9RGcaLS/rWkIB1X8zvbFLcuod50w5auiTS3jDY0XEaCkS/uJ
 wu0t9ViOjR3ekFK4/J7SaHEAgS0bv1EPN9qMtUqlAsUIjXti+++jSSuM2n3sK9RWaEtjhL0a+
 8duHdsY49mUqKtcs5Jffg55+3JPXkQQ4EdN9SGTimFZ8DYJJq+TORiWmPDvJbwDlCLHy85myD
 zUwc22WPgk6DMNDVyldX7lT4Q8Xn0rDaRhufXf3MkG2AwS0nE8UTZLVFkzO2N3oJIC+kxN14K
 aXFeMHQAOr/3kEExH+LUdimaKJJGbu2EZycFfVSvx0q2DKE5w/tW2mGQE7HJJkYxrcHx+liIF
 qlShWQ5nDYK7d+ceoogi3QxekzzS1Ukjo6T8AN9dqcAYmlfaTFlW/6Te4fHXVV97dCn70qX5N
 xwQe7ew61b02tp4+WWyOsF7+k32O/dqmRCgYwcqB07kGIq5DtCKqpMZqpfVREpkj/iuM9N2oA
 G1ba1aXAMhlXIYTNDY5INSEFHTiwNEtl4g7JvjB/DkP3tr1S8PYZw+JLzAspJR1VK7jD8pDDP
 qahOC37lGt/V/VbCTeBdrQZpL/W68qx44U+PshgtFFZISUlFx+0sDLEBOtMCxK6Ta4mIwXexT
 TR0Hejbcadi0pY=
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

On 3/11/22 03:56, Haowen Bai wrote:
> Fix the following coccicheck warning:
> drivers/video/fbdev/offb.c:415:13-14: WARNING comparing pointer to 0
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

applied.

Thanks!
Helge

> ---
>  drivers/video/fbdev/offb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index 4501e84..afdb6aa 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -412,7 +412,7 @@ static void __init offb_init_fb(const char *name,
>
>  	info =3D framebuffer_alloc(sizeof(u32) * 16, NULL);
>
> -	if (info =3D=3D 0) {
> +	if (!info) {
>  		release_mem_region(res_start, res_size);
>  		return;
>  	}

