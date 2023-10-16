Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59AD7CB535
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 23:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE7510E031;
	Mon, 16 Oct 2023 21:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0284F10E031
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 21:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697491223; x=1698096023; i=deller@gmx.de;
 bh=GWUbh7pGVR/h1ijcKK5YwaWOr2HdMU1IhnXSZVQcncg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=C8UsoCdnizVjhyRkJiYe3VkT4vP3UA7fpaLbynBCXfgg7hsfaOB6oCsJbbyHmy2qinXA4cOBtFp
 XBCE2WtK1VFi5ES50d5AUmf1W43K22Oluo0FQpRNY4rIEnVeZRaPc/zlB9qGuwkvhUQWGCdAKhes/
 QZ6jrL+SA3y7egb3JaVaptb8HaZeLmMvrrE1HtpELPbnsJFDw/D3Ue5kF7RqMy8po+g7XqCQsMmRX
 XLN7/mo7+JXbj3DLsBAUk75A+62GCUPmS6uhkI1o0+upzDK7KYb3/3O/IDvP7WkFckJabA4tAbzBW
 tR5ZvCfot3fCGcsk3QXtQJXPRoRgEg/Yf+5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.153.197]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzFr-1r9tIs28wb-00HygD; Mon, 16
 Oct 2023 23:20:23 +0200
Message-ID: <758a2d2e-20d7-420b-b07e-69bba79a45b8@gmx.de>
Date: Mon, 16 Oct 2023 23:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev/uvesafb: Remove uvesafb_exec() prototype from
 include/video/uvesafb.h
Content-Language: en-US
To: Jorge Maidana <jorgem.linux@gmail.com>
References: <20231006204347.2594-1-jorgem.linux@gmail.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231006204347.2594-1-jorgem.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bTDjVyejDKF1Y/3ZyyZeV17Dx8C0/e0S5lgZiLY+7eOHDwryyJv
 Bc12tk+G2y8/V0MW7/kh0/9lSfAVpLEmQTW/rchrLQGANfBV9vwyEHV2kwv8vt9Tq7c8byk
 DL1XPaaIL4ihHUhj+RVVD7pEnuEtBoGOxGLRLsxq3sz27k3isHX+8T8qKvl2bVt4/rsVj/H
 is/vLHVXsm2oRKIP6z+8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qqGdopg7N+k=;7Q6F9Z6YSefV8mPIgbXJWGBWDlG
 /9Rpg/px77H3Mg+m2635LO28uh0NXSEQVy5JPeeaKd2nX+CTduZVztX+/l4RApvuIrB7NLU7W
 g/6zIqOgQvpi8Bf9+v+x+HDBvKo687QFkPPEebWQSuwrDAIItxfAoVECyErB46B4sPgkdm6Ts
 FKv4cbTAwel10QfP7fOb2CUhB351SpNhf0DKuJKTYzpjV48OSbGfO428/9nJ76vF580f5um4D
 1jAUv5oXqxVyzC/EqINkVE4ZKqgyFZDbpo/sgnNDMh5+lVVmkC/FNrPsxH7ol+mH9Rlaor0/g
 vx8SRY/OnsG91X/8GTawpW3CigzxdsOj1bkJqBl1NsyROG99yWnoYBFRVS0Jr0/HaK818AE2r
 8hBixThzW8rJ9qO85H1KZt9bKFIyAFR/Q/PjvBgLEXfzF1wMYCi07Xbb+zpy4QOwK2VK3cpUm
 q4EkNxM8z5o5cznVmoLeeR8qL2hpNRpvhMId3kAQI+os5BWAeqc+1WDSIqORsHU9dmcYhd3gS
 TaRUYSRebVidNDJzYf4oeFVIY4DT28YXKBBs6TnTfrvXV7Lxe3YJxY6/XcvSUwytKNLf1EYEu
 4xZK5KIYdDsqNlFo/YbzBuWvNqzF7JOwgtGtNim1yu5m9jDJuSg4wqOnfmLT4+vVpAAmwaypU
 aW8MTB/Tl3FJnrJfBZtW/mNB5148DQ3qIWS0WMm/t2QS/i+AvTjEBHfs9EM1Lt3mDvqDVeYAX
 CBOSBy9OJR+46ZRLOxomNZ+UHAXH5TFlCbiSy8zzT/RgQcPVpqoS4J9pnBkV5sDdczKYT2KlS
 l95d7bQYECkGGfmLMiHP7zeV7wtctb6YQdrCMrsDTifFsZujVFu69iGFuJeoZFW9YI1n4bGCP
 66WqLklqGBEe/q85LCvi3wT0RueDMFf0mX4BlsJlWQj3iaNqJka78G/p0oEOcLrqQKnSy3+0g
 ZMxoxw==
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

On 10/6/23 22:43, Jorge Maidana wrote:
> uvesafb_exec() is a static function defined and called only in
> drivers/video/fbdev/uvesafb.c, remove the prototype from
> include/video/uvesafb.h.
>
> Fixes the warning:
> ./include/video/uvesafb.h:112:12: warning: 'uvesafb_exec' declared 'stat=
ic' but never defined [-Wunused-function]
> when including '<video/uvesafb.h>' in an external program.
>
> Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>

applied both patches.

Thanks!
Helge


> ---
>   include/video/uvesafb.h | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/include/video/uvesafb.h b/include/video/uvesafb.h
> index 8d2a3bfc8..47d96e75e 100644
> --- a/include/video/uvesafb.h
> +++ b/include/video/uvesafb.h
> @@ -109,8 +109,6 @@ struct uvesafb_ktask {
>   	u32 ack;
>   };
>
> -static int uvesafb_exec(struct uvesafb_ktask *tsk);
> -
>   #define UVESAFB_EXACT_RES	1
>   #define UVESAFB_EXACT_DEPTH	2
>

