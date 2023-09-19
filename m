Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206857A5A82
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCF310E252;
	Tue, 19 Sep 2023 07:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6D710E252
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1695107224; x=1695712024; i=deller@gmx.de;
 bh=r5t9cUCGv3a37mlKLeHHbaySGjBsxcfrvQV0RTErLfA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Ve27XpHjFHRxpmAqbCuZXfdOx9G0XvX+TuQPKgqD+dXIMK36PVgLsLj7KszWf6pynJmy8GlsN6C
 rIU70JdwRmWzXetKzOVL5eBur2DqabwxSnbTx+TVdcgptvkTcnO0XRGCjDGOY3sAKHEeKtFD5ZQPs
 zeqU/ud4Mtk2azEQKrIvUEKJIE4E6fxfUoueBlSnbGhaE/zExSlUe+lKYysodZPwYj9dGiGmrQgX7
 7NxqhO5mYMi7RhkimhhtCucCjeZdmQVMounayuflUQ6ZNqDZNXUr6fl2khso7hL9KxMvuSRtZgbMj
 +1YD27rJh0sQT6xYMZlGoyryA7EycCPIXZRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.158]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GQs-1rmc0W187c-014D6h; Tue, 19
 Sep 2023 09:07:04 +0200
Message-ID: <fbc9a479-d3ca-cd7c-bae0-52f19dd49585@gmx.de>
Date: Tue, 19 Sep 2023 09:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] video: fbdev: core: syscopyarea: fix sloppy typing
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230918205209.11709-1-s.shtylyov@omp.ru>
 <20230918205209.11709-3-s.shtylyov@omp.ru>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230918205209.11709-3-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0nah+QU3R8SHzVJdNqv5TKQPny+6f/A61S9JJxmaliODv+Wgcan
 L1GJLPkTI54qpadeoxvnpBEq6+PMeu6zsw4mtkkeD2b5jVAxpjWGKkJxOLehNzDJ9uCNhE5
 0TrvRiyC9IZfyZif2KCzOuloz78jKfTQ2oV1nG11tDnQaRKwUz59zSANfYtJ8GRJCRgRQ6T
 DpQasq1IZNKv9oynf6SCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:24jfBQ+DaUM=;ukl10pbSsxqE50PZO74p7F6miyk
 r+271wYeB+RxkpISw6keCH0o2YhiDuCqf/hc4c+jsoDSmlgf5DmkO5GvMleUv/t2UUF//23LZ
 N+eRJSWVSjg28XvoGH5JgD+KIlAFNkH1D/KRCgJ054xzqV7dVDxfdPioZNYz3nAQBvSHMo3to
 xm7bkDayDgZ/042YJ7sAtJMoBFXDPsQCVIp+YyWCtkulOb6HBE15+fPAJ/1iVcxPKhnlVEGzN
 fFP9q2H0ommVCLDTOfg0KnsmALOgGt0F2+48B8WA+p+AlViVUQW1sHtajQxsD0HjIHUNY3w7U
 +lLp6XahfmbHgiRHdNo1aXkfEYxXJTsYSBkzK911CdBVapPL07RIIqnebe4F5DgaGFXNw3fcZ
 v6tFkNGlkfdtNWYxbYY5PcwpWykmydmyIdWwy9s9vx4YNo7uwrkoSBxLkHLLL9gP7W+LeoH3L
 niHzc9WV3Dlhh4vlOT45U/D1TvZctt6KR3n3LMNOVyxg1a7dXCdlTZZEjfTBWSwtawYzrqvha
 scqzn1AprOqLYxbNZ9YmIbLn9ZH5Mz1rB1oyazl3MJTWoaqtuuXmDBRyzMmFzKvlJ0NOSbCL7
 7U6B4P4sO5tCRiG1SF0ju+qY/ntiDR3bpIcPHsOjq5JnJg5CpTjL/4CKSbOitZz+KtUajj1ij
 GHLE79UgBYmMdoNw5ZzS4UDzEceaA8/7DStSGpnYqjrAiF3ii8I3o+aL4OYq8+E+UB2jH8DhA
 KNPcM7HLmZUUWZn7af8XKekMis7pNgo+FOcYEoyJKq8qoGXg90hbFTwVR1bD/e4tlgF7ntVOw
 rmFImVaEUCZ6jXwhvAs9UOkHgLhzjvX/10s250zbOxmUUM7l+W9rz7IVANEskZjfi5RehbcC6
 2ounV64vGJJ4BFuSCiJFsm8kpoe4ihCwlVYzgo4+AWvAVXVnQhB7moNpKjP2Nqj1VJVnH0uIN
 IwXe++HrISaCFwu5kgWHyrH6W0E=
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
Cc: stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/18/23 22:52, Sergey Shtylyov wrote:
> In sys_copyarea(), when initializing *unsigned long const* bits_per_line
> __u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u -- whic=
h
> might overflow __u32; multiplying by 8UL instead should fix that...
> Also, that bits_per_line constant is used to advance *unsigned* src_idx
> and dst_idx variables -- which might be overflowed as well; declaring
> them as *unsigned long* should fix that too...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace sta=
tic
> analysis tool.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Cc: stable@vger.kernel.org
> ---
>   drivers/video/fbdev/core/syscopyarea.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/syscopyarea.c b/drivers/video/fbde=
v/core/syscopyarea.c
> index c1eda3190968..1035131383a6 100644
> --- a/drivers/video/fbdev/core/syscopyarea.c
> +++ b/drivers/video/fbdev/core/syscopyarea.c
> @@ -316,10 +316,11 @@ void sys_copyarea(struct fb_info *p, const struct =
fb_copyarea *area)
>   {
>   	u32 dx =3D area->dx, dy =3D area->dy, sx =3D area->sx, sy =3D area->s=
y;
>   	u32 height =3D area->height, width =3D area->width;
> -	unsigned long const bits_per_line =3D p->fix.line_length*8u;
> +	unsigned long const bits_per_line =3D p->fix.line_length * 8UL;
>   	unsigned long *base =3D NULL;
>   	int bits =3D BITS_PER_LONG, bytes =3D bits >> 3;
> -	unsigned dst_idx =3D 0, src_idx =3D 0, rev_copy =3D 0;
> +	unsigned long dst_idx =3D 0, src_idx =3D 0;
> +	unsigned int rev_copy =3D 0;

As mentioned in the other mail, both patches are not needed.

Helge

>
>   	if (p->state !=3D FBINFO_STATE_RUNNING)
>   		return;

