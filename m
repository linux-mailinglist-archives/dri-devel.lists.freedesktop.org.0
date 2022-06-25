Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0455AD3E
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F1E10E8C8;
	Sat, 25 Jun 2022 22:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DE410E8C8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656197887;
 bh=jWlf9Li4o1PihZBbd+feGv/a8K7Posspn35L+8Fijj0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=H8OKcRpmh7rm2SrH3hVxSSrbusDK+HkGvJardMarPtImUIugU3WHLR6VAu+Y4HT31
 EYRaojr0E0IdZ4qIg2wI3gD7atkoRjC5pC+aerVJSBgEAyZTGugzS85nOD5ZW5aiRR
 8tzv1gdzd6yHMtF0bcwXyadHp0ZH6jEaL71sDTMg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b2T-1o1ess0CvV-007yxt; Sun, 26
 Jun 2022 00:58:07 +0200
Message-ID: <6c876dde-0651-b378-edbf-2f6ced49b339@gmx.de>
Date: Sun, 26 Jun 2022 00:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/4] fbmem: Check screen resolution change against font
 size
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625220630.333705-1-deller@gmx.de>
 <20220625220630.333705-4-deller@gmx.de> <YreNUfv8d9QeJT8C@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YreNUfv8d9QeJT8C@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5sVdUrOSsGBHbI0Y4Uk0pSIYp85HEvC2SWjheHKutR6QwiU4Xvx
 Sv4Hu7Wru+TETx/SYMSPSyBn+zsAV1vPJMY+rTAhEblYnXaBGwI2P1OV1P85A+TTQb32K6h
 dIqPYNWhkolxbBYfKdhCDngg6FlzynXqR64jd8jhpN6WatV3oOkhUgTSkoj0ftL7Km7v+Ev
 Zg3K9DYRQTO0jflwiRinA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yYfbvEJaAqA=:+MAPSnnfmtQlLk0k2nPFdA
 PtGm9RP7BH3/mv90Fxu9GQMA1cegtOEzvD044HPF+Bpl10npFjammIRwcX2biJS74LGT0s5+K
 VH/hAR1Px1WiWAg7JbyyT7IxFOA7dddcoVTr+4srrKZAOZxab5UhoS8RiYLoXg51BEbOgrrga
 lNEK0WAgZdeVAURLr/WqesU2jyOhx2AG1joHgQpxY6/TYlETZsFloIcoOXctUMjrJWAKIFDxm
 somerdUZcH6H/XEEyRxG5o7gOjON6jtq5574BoWcn0IPFXXy4wsF1EjbFIG4ktHaEw0l4CXh4
 JNfW7WkY0acoggH/7BbxiikhHqzimFFUZDvO/DDFBtBTmXP6+CHdT451QKEcw/HoKWgZShVnM
 kJLmMkJXbkQITVh8HcYCvWDMb6Pj6+76OSck+nPXBD0jUIAiJJcc/BY9CDwndqTUoUdyIDyEp
 18suBGAHMyuDQB4oRCQlVgyQTOo0fnQQzdmV2fe/YvifH9Uu2WA12tf+a0ijVwoZaZIXDj2lL
 s6McdwhEMtCvTYOBFeRDJCdLbbm8jLmCo4n8tEZnvQKNYsqFBCyT8Pz4VhhqVJqr0JwLxUkIC
 o1q7TO8hleLiMh0fPRT1MCJ5dzmiw5W1tdf52GrbvHHiaIu7YXnTdUF3v5bU0T4XzZUAYH0ng
 F4H1wcmhZsU/H+1LUJBBndJXekHGCJUk59BFjQdtiEPH2GuJBnosFv/b/4g1viEIiVh7W+Zgi
 sJxnaiheEHBPDnVM+ED8yna5yfC3zvxBywoK5dfdgmI9Ko8ew89+9yr1fDsqwQQgVahkXf9/o
 3FSCuJQTtCEy+5VWsS5gUq1VkilTVS2rlwNldbbuh2Jij1iCSmPElDa/qsJEbFYK9SkhqXpVf
 HaKwZFd/cajZ0wls3UsuIeRfeF/puP9hwj0X4wMqxkCm4gwuJv768t1WvLw9ROoLYxLiuOdC9
 T7TxZ0rugPw1S+3nMxRqggqu84NnSPWPw+OkdOXZfx8vpZf8kpMVt3n+4UkbX3FyR1xBkK/JQ
 uMM80gmXu5oiq5KyO8RhoVlU2ACcrqDGlusZW3Y8cuJUkaWwtyOVo8yeeukUI54cs2OUSA8bu
 PoG3z8/A1vFUExE6bf+8wkheyD+S9rVMO7Uu4flOA8pAVO/G48IEzyTpw==
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/26/22 00:33, Daniel Vetter wrote:
> On Sun, Jun 26, 2022 at 12:06:29AM +0200, Helge Deller wrote:
>> Enhance the check in the FBIOPUT_VSCREENINFO ioctl handler to verify if=
 the
>> user-provided new screen size is bigger than the current font size.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>
> Please squash with previous patch.

Will do.

> You might also want to add a note there
> that on older kernels backporters need to open-code
> fbcon_info_from_console instead, since it only exists since
> 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup")

Good catch!
For sake of easier backportability I will change this (joined with previou=
s) patch
to use registered_fb[]. Those patches can then easily be pushed backwards.
In addition I'll add another patch to this series which fixes registered_f=
b[] usage
back to fbcon_info_from_console(). That patch is only applied to v5.19.

Will send new series...

Helge

>
> With these two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>> ---
>>  drivers/video/fbdev/core/fbmem.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index afa2863670f3..160389365a36 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info, uns=
igned int cmd,
>>  			return -EFAULT;
>>  		console_lock();
>>  		lock_fb_info(info);
>> -		ret =3D fb_set_var(info, &var);
>> +		ret =3D fbcon_modechange_possible(info, &var);
>> +		if (!ret)
>> +			ret =3D fb_set_var(info, &var);
>>  		if (!ret)
>>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>>  		unlock_fb_info(info);
>> --
>> 2.35.3
>>
>

