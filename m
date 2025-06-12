Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A38AAD7D5F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA10010E1AB;
	Thu, 12 Jun 2025 21:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="BRZXnM8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E904910E1AB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1749763458; x=1750368258; i=deller@gmx.de;
 bh=1YipSJii6VD3Hn8TJwWfmMQXdMHIvq1Peay95rA40pQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BRZXnM8p8k3qtxiI9rwSYiZA+ysAKXAEe9H4hZqyFQqpIcV0hYuBsb6mIcIuk9vL
 pygOA5LpjWZb8MH9uszzl/0R/8xF35ajJmD5EzjPoY3+rFQZF6b0ldR+A9EX1NQnW
 1ziXzvcBlXo2dEvZ9gd/0o+xuCtviru583ZT3ptICyDlgnzHPWSWmhX7OuMaIStQ3
 kPmGqm5Ud25SkcNjkznXILoyaBdV5b14tMHCkpoNyVJIi1KmJ/cMtg4MZfWwW0xeX
 Ca5csfJvkWZlxRA0Gj5aJuBfPzIZtkdgq6WBrDpT2+xWS+3kZqF6sxQAt+79i2+le
 nNw0g0XLiFG3M2opKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1ps8-1uNdYA2KNs-009SOe; Thu, 12
 Jun 2025 23:24:18 +0200
Message-ID: <75ca4181-5044-4fe5-9b23-e9c4c1c1cf7b@gmx.de>
Date: Thu, 12 Jun 2025 23:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] fbdev/pxafb: Unexport symbol
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250612081738.197826-1-tzimmermann@suse.de>
 <20250612081738.197826-12-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250612081738.197826-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:95kzWK90Na1nCuuKXbShCjx+QIfnreL5hO6r7HIBrUI80uEBtBe
 sTCvNVUVdTuyTf/3a2/gA0H9IKpgoxFxOpyfpmywWKVUa7WmrKtZ2EiZ+pV77QPfUuegAir
 JsEN2hhKSp7SF3gBmjVsgGb2Mf5dC0Gzc1q2SGE16c1LZMpxRQAVL2+DCzGZoXiNo5XL0cz
 N/ebww0GlGatHDtsQqspA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9YpYqcINHt4=;K4CDAu1vRQR8giu+cMdQD17QxLv
 23uZroLqCzcwrcNa31A8ltIjGImgztI0pjp9VL3Y/oTSR9XgaEWxKNnJV0lvg+SUfYbNdIDhP
 xD9ko+wKIzqe6Qq6BeFv0uukNCZECcM4NjqHtj6x3Yd6/vCUnO11t/dEo4nupakVGo21+GmC2
 yAjTWU2DmmP1uQYXuT7Eu3kGp4YD4qL60RUFW7BDa2Mfdy0xn/PXGhk1630wuH1+z+4+jSFz3
 ca8caxVO/5Vj3jdt3gnLpq/ods/yF5l3awpi/XD87Kw4+dRfUdMGZ4ZlQczdT2mYzBE+DY1w2
 BlBT1mQIqmxY4hIxTSb0mBMOqEKEr/Gc3whtD8E3gz5WkhoAg+ybRyZ4xhADkjJzRHyCFjp6X
 4V3Ff57wldCkCFP04qlX4mvoptYRVsDlDavxld6OOHwXrn/bM7NjmAh5VlQCggLmG9NgEz04e
 RlR3WGu0WQgL/PqAk8gT200E/S+TReUWaPMAqs3ltKTkT8/Cz4+TZyfsN05tzOIUu3JiqiaTx
 9ZxZU0lkLeg+G3/dQ56EUr8FY4EGoS4+MaYECzTIJL4qnlo8cns9hdfvxU39BUWtLzy1Ah7uY
 z/FYw5abKPbLRk5EDyTSsl8omxI+Cryj+AR2dDW5DNlj0nOgt7FXp3k0LZZv8muiUoY7eyQCY
 sp9Bw9Pi6zdNsUtQGchkSmOF8taNyEv8w5oEEOpJObm/QO68H7T5njmtG+Yvf1zMXKZxiJuA9
 fojKz4AU4NCG9BFRX7ZMpVdAn3tf6jEck3ZOYh4R456ywHuBj1zdl8zRoGkdBF4dJRwVrzRQG
 kWDq/m/IiVnBesFgZrEiyUJh4Oxp5GK7kQB+zwdGCTboUw+JZvQWvh5xmm1LKuUTgA0h4VZ4D
 lGdyqFkQPYQ3hq8pVdYFjaEMMsthsdbQ1uEYlF3wpH5KHB2GJP/Zen7W4roFrWhlEOb/PoBD+
 qxYReXyUffThdOMI/rFN82es3pfVJVxTwc5CnQiHMmjTcBsFzEneUYfufNnPNzKGfXHtY4+Wh
 +E9SblUnxcCp98J4qiecgyVWa2p7WCvb4BsFYOmS7rCtlBMyKyVMjWdv5Jn6UfZuHwO9RTlel
 c9VTA2hGRhy0tMN55VFyCOFPew7vLl4CePURJdveZhrWhR52bsAiejN0sEYhqNJi6fPhqsaXR
 AvkXuWr1dTTmxvNea2hs8/6sLogDb0JhfYbcKzw6s4bE4yRsbtCqy2eB/bNOMcnas7ugoo43c
 nR+uTc1Dkz2Jqr8VUeXhOp1Uy582wmQd6qOVpNBRTwxppM/KNUCf261EBIWsDCud1i0sHhW/8
 rRmCxMoODFmp0DaVaFOqitFiFW6ZO6fQGXR5l3VRE71zgp0qTQijk3VFWpyLm92yKLgwJ6qjG
 W0ID6jQ2RfJWcI1WSR1NkLfsshNsUlo184hMtlGc0hR99sYfcMvvQ10J35V3/5F89NaDE1IoJ
 PanBCRCoQkOnKxYUbEaE+Ix3TZeiOtucUSN0MJVKZTOAWFtkRLlC4/vkiTVnyuQfRkIh61Be4
 96SqoIBQMagtF5eUI0CQNWuPbrU4qPc31hw7KnhlhxFlXMAGRf2Z2cfF1T+NmZ3FQUSiVWhZh
 +uht9sJEnq9+rQFylEXAcJHmDSutZGdcMB1CFImcQAFSUfIXVQ6y9BnC4OQP2qgOGGLiyOwX8
 +6WlvTXeJaUl7iXwjC9yJt9gajiROsomNLitFG4UyY7CuKY5mUufltOVAeeJOwH8s6n5jZgOr
 74Kb5r+LFwaUg8uAsdsuB2/Bepi1SqAIEyTvUREnVDLe24JV8q/ccqg5mjftsBcaxw7Qp9EHr
 6a48OgEmHhRrN/ll5Y//G45ozZcZWFHA3VP3oNYnvHHUztSI5HbTWGtoLX+RSJ9wTikP9i/DD
 9QyHff9WhQog2c4YdO2FIyEESRFmGV+IpgQ0LkNu5y9nhhh9ZqP5Zp9ZKxp617VIYOtVupbEv
 Gp6OFQgxwAiEzDHzFOT4K6tbDxCkkwJmLgJq152XB/CpIle2lohYclLz5UpZ6jF+AsdT6cg21
 TO1b4MD3/rFRfVbNNiEwFo0I4kjcOjzYNTYCxfYfK3+ebuuya4xfWVJ0kIzPtsaLTnqnY8th1
 QHpw96KQZZSeIAf1b2hYxuUTE9DT7kWNcbMMoujYc+3Y8ddwpMR+cO1YsKzbHfKBemHGXX0e3
 0KHhVeiE4UwScIDlb6gE6Zu6Xvseit8fXELkReJUsmNleEBSYGY4fHVAHpDNyjZJvTvFF5fiT
 MeWbOirDv2oWiATD4ttqBnOrGpl63RZmHsFSlsMKszoYSgj2Itjm4vsVvTJcXsLQjE4FHJpVP
 WT6ZfR1VrauDhe8cM38UfD3sokoVAKfppaDOOYaL5w4izpRbjhdeEgMMWWWTV0IcrZfT38Jr6
 MdXG1FlFdpULSNb9TWGg2Fggm69SsR+PD6DPF1SORETCddfDfdZdL7LljGfYJ/T5vRA9QmkUj
 Ag+iubOeOHk398CN2Ud1uAfpTsmwBgQrVlF22yRbupoa35k4ICkFzHHgyVBDC+p/DjX8lZpcC
 5txhtO0FuJP5K5j0Mp3qzvk+r5Py2Cog5IejaTyPnML6r3ANXivtBcnFuLCaZpS6xNzm5njAR
 gHGIA/ljWwIAgX+XioT8gFXDaLkTafcwzsmvX5SFYqyEzCsBIPszWPE/Sx71RtSuNHDGQfnqI
 rytKNR7I7IAi1wbh8/d4VpKjy1VczYih6/VgnosDecBcSZYG+Q7SJIQssZPJPNfF/QkxPAiH4
 cfu5f1RhPokDjmBuIvU4+a+oJ6u/ojHw3uWFWxvziWMaWCcqS8ctlPhMiXXp7T37BFupAssxU
 7ElOukIcsy8Y8KQrkaIX1hvPXUEuwWanjhIPSoY/bSXA0YIO+Dm61KpikOISNOPGFV7KiS/sk
 rD7aiK/jWeWkSW3kRnfMFRgjUtEaygIxAB6Yg9XBkYLUAp+qJOl0khhRPtHbR8dgNzMVf4Idi
 uzNWNjpvMGXtzUgg/1gL3Lir2BTCCSxlk9Zpg2beWbeqsBCg5EcdaKumOphuC40ntF7RDuPop
 3J1ZH31jm59dQxWyligIOJLmnVbkz/e0mDVZa4ExFQDc1K60P8e411/Dxj6yN80JvP3uDKR9b
 PHktWBhNv6sgrUx3UTfDFA/ChO/Gs/hiWEZdu3YpqfrmDgzDC5bQRRYLNCEZrVRwLfBkK9edv
 9FiI=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/12/25 10:16, Thomas Zimmermann wrote:
> Fix the compile-time warning
>=20
>    drivers/video/fbdev/pxafb.c: warning: EXPORT_SYMBOL() is used, but #i=
nclude <linux/export.h> is missing
>=20
> The affected symbol is not used anywhere, so remove the function
> entirely.
>=20
> v2:
> - remove unused functions (Helge)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/pxafb.c               | 17 ++---------------
>   include/linux/platform_data/video-pxafb.h |  1 -
>   2 files changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Helge Deller <deller@gmx.de>
