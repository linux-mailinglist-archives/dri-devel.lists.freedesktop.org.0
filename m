Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781975E929A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 13:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDB410E1DE;
	Sun, 25 Sep 2022 11:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3775310E1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 11:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664104340;
 bh=EwNoUweFLTpcmFCyNapA+75NoiwY+UAqj0hC3LTdWEU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WUauERvDcCQfhCuVW1zf8u6xdzLcogebMkeo7hJDT95lqGEAIVsUA4XDIZR+o+CGL
 GtSa9zR6HwNP3hvB/EZsNCiCR/gm+9mKU6oiNbeXmH/3GL4cZxKr4blQrPKM6F+I8K
 3iqh8h2kncMW53Po27dm3eALBfKeyva4yNJhZjZE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1omtAg0One-00S89Q; Sun, 25
 Sep 2022 13:12:20 +0200
Message-ID: <a4146b46-4936-80c9-8839-45bbe2c39cb6@gmx.de>
Date: Sun, 25 Sep 2022 13:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] fbdev: remove redundant initialization to variable
 identical
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20220907135056.679617-1-colin.i.king@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220907135056.679617-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mG9+uJLhs0rJ7EE5NDTStivRp3V89GlvVCbk/OupfS7Q8yElvXV
 yXjZUtue2QzY/2HLxGdvjmtUCUeqcfaqyOgb5eZ0TwP9JR3oMC0rd/mGP5u6mUyBBcxTRsu
 yK3m91s9iabxguFSxf/nnLdSkrRHh8uzME5n7MElYs2HAXBCpB1Fx/PQ6U6l0MnqbPwPUFw
 rAQCZMHlmQXIGM880ASUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6lrueAwRMV8=:AbZaT198Quszb3I2ffvjmE
 83olQqzOwn7O/bckw5T+FOvQSvirPlsnSol5EGp5IMN7ldujGYMh0tskMMWcGgDy+qby0zVcC
 LJPoVtEMDd0CvBzr9lx5hRvusmBnFnrLwC+qL2UG/Qy8HZbBRPjs1lCf8jXQu5wrMaApUPsK9
 FlRTvcC70c32fMOG/6xZElgC9aCRRv3exxanf7LNCA0KFCrKLbNOzizvl4ppYbf2cimS0i4yZ
 BwEiq+Td3dSWc7F8iWBPUwB5mLptdo4ZykMahTQx3BYDmrLW5aFMj2gEoEZZlkc4FcDZB/Gpe
 H0WcwEVMa+YXAQ6OAXALdmrI2NolcMVuvEW3sePTF8c8HO6hhUnzs7/R8i7K7OHh7AlwOWOff
 9sPIe9k/sFX9kKPs5MUM56Axh1rC68MCpT7EzRR6Ziglvs7YMPZue+t0eLH7vMaajx0ZLvBbP
 k/K+cOnsGne4DRWOkWqbcotW+keeTwN9QylkyPf0qLjDfCa4G4M848GOt/bVQXJxf1oWva02w
 vTdcOV6W2f3e2ZKBw2BuM1BCULl7paA9TqlYxWp1fXkyQzHrgJDOd4mrt/r0uNshebttzNIXk
 KdzfiQIDxfxiUFMrTiTmkIgvMygb0sBrab73t2/XmoclHxGuycUQMLBawTpOnCb3YWOcMA/NV
 S0jeIvMCWiqIW2R7qphJH//VqrvBvD3ZXOlLDsLls4P+q2h53NUEQsmzMfvtIR9PjcjW5hHim
 0PXytQPFNKnJwJEHoMtltGYU650VtxcCcLFp8YGWMcZOAEKYxvVFtNHhwighQSaXVzhWVIiUz
 C3WMwLfDbTHXxuP2T4+G7HD+nZC9GMhRHeIv4yW7dyQN5E2PPBhypFIQcpr7tArBD+E0o5ppD
 VpZNNWF/1F3ckqqznwveCfW72i7NE0j0C25yMTJYyULjSxgMCHfvLzuXmxoy4SlQO78PURew2
 wHEtHGtsxLOq0i+jCFWiOeXiLMJ1FjR4wQzXUlmynJDlJ3FokkzPzmurfNzblCvkprxtKBIGT
 OOhfgTfoEKC0PANR86OuXvc7IsnVsnhPHE55CA1aT6OcSypt2obKS50E4/OEX8VETVrAkce3D
 5smdMsQkuSfPO7mXyfWVRvoixbvLXDV9T0de/2aV/dd1EQLnGQ/RADaZRWYAr5H4V+ZtA3HFd
 TQDhyNkfXsiDve31qAneXyyqYM
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/7/22 15:50, Colin Ian King wrote:
> The variable identical is being initialized with a value that is never
> read. The variable is being re-assigned later on. The initialization is
> redundant and can be removed.
>
> Cleans up clang scan-build warning:
> drivers/video/fbdev/udlfb.c:373:6: warning: Value stored to 'identical'
> during its initialization is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/udlfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> index c863244ef12c..216d49c9d47e 100644
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -370,7 +370,7 @@ static int dlfb_trim_hline(const u8 *bback, const u8=
 **bfront, int *width_bytes)
>   	const unsigned long *back =3D (const unsigned long *) bback;
>   	const unsigned long *front =3D (const unsigned long *) *bfront;
>   	const int width =3D *width_bytes / sizeof(unsigned long);
> -	int identical =3D width;
> +	int identical;
>   	int start =3D width;
>   	int end =3D width;
>

