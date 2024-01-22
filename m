Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B9837592
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 22:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEBB10EF8A;
	Mon, 22 Jan 2024 21:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6048 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 21:42:09 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4323810EF8A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 21:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1705959726; x=1706564526; i=deller@gmx.de;
 bh=i71/Im2vJBPoIH97PmmNuIvGmWy12BUCJjc8Usoyn/A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=c0ijoK+QXWNW+5JWK8fqfqw8PUICZPFYNJzuVffCB2luGRSkglUC3t/wtGx4TA5/
 2bGL9TsZpxihbLAgBAXCHvZCLBRJpHZNGFvaTCIXcHqh1Cd0RpNG20I3LPwJOTooz
 1NRdmZI0UjvUMgeBg311uRAGroJHdzSmhfb4lk7s2Ko6TdU8AxNHQK+KAFXA2zCwE
 T97yXmVMwjgkAv6Q96hNDx0Pql454KMxIDnSA3xCnpfMGMJ7BS3oNhCjixueH3RRv
 gDIgyvhr6nRdT0r2qDa8NE0HQnrGQbcuwt8mEPJt+yNSGzQ3H6gvkJgQHslxR26rE
 pqbBss9I5FKSLEIu1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.156.47]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XPn-1r65Jk3YhN-014W7k; Mon, 22
 Jan 2024 22:42:05 +0100
Message-ID: <de2bae83-f6dd-4097-b94a-6086c527360c@gmx.de>
Date: Mon, 22 Jan 2024 22:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Fix incorrect printed function name in
 fbcon_prepare_logo()
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel@ffwll.ch>
References: <d15dd1d81ffebed4e5028e156f0082c44ebbf2fc.1705935864.git.geert+renesas@glider.be>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <d15dd1d81ffebed4e5028e156f0082c44ebbf2fc.1705935864.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BpE0nKae8j3gt/XgzzOkuGicTJkvEmUgGimjr8J5j1TaDER/zzK
 vlnfRAg33aAANo1G28KReEf49izeDzO0rzCYiC1YcG2dA0665hRrPhYYfVBewJXGBnatqy4
 WG33WQ5N3Q7zQt37WXbUuNfI05FCCEB7Bm4taBSNW8N8wt4FqqJbjdYLdOUQ9YfyRAMSM+E
 SB7HuwbyxJQ2xbzi21pkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5OU6LLIzLn4=;abhVIj0GhOVfrnPgtXp3MeUa8Vg
 X5JpHISx3SGj1JpxoItsobjlXGQHi/t19ryNjffoJLWYugRPwT1qdTsxjNyh0kVYUlN6H2QxF
 JoeMyJun+zHcDZS5qEXcEHlt3j3W9UkLbkHkznOWqyV4bd3uSbYx8PwwcpmYUIyW0FrNlCygq
 De8QS03V897oGeIwnYMvoMWSXKaIHixBzBuvcL/jamu6sfn1FzBqS9Rz7jKwPoz9sZ/g99lrp
 Flyhxl0MslklTO369DadlIrprbUGTopV1rRUQOmHdZtj3M5/s71Uo8Mo2FUo1+MAtIQjnjg5i
 vsYTrd14IV6cZbEPQdjLGDmSIsWWzbyu069yZaeHrKOf0CAPzEBxi5GCvNHfDYDXuvFkALFJD
 hZgWPKTGNQq+OOWc7W/WiM7HvTl9Hq6nT/sCHZCI9L7FlgA0KwzNJpAZqaGzdILsVaK4kdlLc
 SWPVXaRI/sEugTZ3KpU6JubbAoHZYRJBSDDeDyf4K9AqriLs2wQ/9e/224QMg0lyCT4g6z6F2
 3mDihwZVlsSNkw1jbhxmuU8V6ntCSp5TZVA5VO2JmUVDFW8HuUuINo9OAU6pyzk3VX46UI5k+
 irPIqBsMSqyL/I9iNuGrHkaIhlfG4YKko0fsq/LBbKO+KFYF5AeEVgGeYgxpVEfThYV9nNu78
 raqxIFAOQgNn3NawZ6jubC2K5YTb+t+PnuoNh7YIX+nHI5AGTd6nClmBKM0yYcn1VGX/B+HDe
 nbVZ0NFbVb1wb86KuAfouIsGQ0BjmQDDIdNIKYOKL6v9l7V7NtKQptIsxfDPmDFK21blSjyQp
 PWQV7rj5bPqUh2fXNFy1Z9kfzeFhvt2FKZ9Jf7CHnQ/K7EvSnXCTuFFsCiRKucukFkUh+i/LA
 Rkt5FUpJ3if6xRbVGdStx1EoqjV5PTkB0agSXRIyvZY7NWiG1Y83FLV0a6A4/hS4xI/4UDRym
 HgZiiRTpUpYkn29TFBfLPUGxg5E=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/22/24 16:04, Geert Uytterhoeven wrote:
> If the boot logo does not fit, a message is printed, including a wrong
> function name prefix.  Instead of correcting the function name (or using
> __func__), just use "fbcon", like is done in several other messages.
>
> While at it, modernize the call by switching to pr_info().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

applied to fbdev git tree.
Thanks!
Helge

> ---
>   drivers/video/fbdev/core/fbcon.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 63af6ab034b5f1bb..1183e7a871f8b270 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -631,8 +631,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, s=
truct fb_info *info,
>
>   	if (logo_lines > vc->vc_bottom) {
>   		logo_shown =3D FBCON_LOGO_CANSHOW;
> -		printk(KERN_INFO
> -		       "fbcon_init: disable boot-logo (boot-logo bigger than screen).=
\n");
> +		pr_info("fbcon: disable boot-logo (boot-logo bigger than screen).\n")=
;
>   	} else {
>   		logo_shown =3D FBCON_LOGO_DRAW;
>   		vc->vc_top =3D logo_lines;

