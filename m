Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47F4AFF2B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 22:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DD110E22B;
	Wed,  9 Feb 2022 21:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC86B10E22B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 21:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644441894;
 bh=PGc0WNXFAjQvHZe7dxOMXdROYvVfqvz2T9AO1zIL3gw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VPznTXkcqbmLxu3pxExCt9ueBSZvVH8/8uIk45B/uLnShnX8mOdgvhw0W3LATDCUY
 OIirKJUBXWeEL5fBR+PCFbys5+TBhIlxZTQC2pPnCBnh5OlW9bOsVfmGrHL71SkxTX
 /zyre89prVIow/Yz0W69RfGjcfDI8ktalcZenUmg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.150.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1Obb-1oKiFR1jsh-012mVq; Wed, 09
 Feb 2022 22:24:54 +0100
Message-ID: <2bfcb259-5f81-2110-2027-cc9e61d4d671@gmx.de>
Date: Wed, 9 Feb 2022 22:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] fbcon: use min() to make code cleaner
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, cgel.zte@gmail.com
References: <20220209084810.1561184-1-deng.changcheng@zte.com.cn>
 <YgQN4WXXjSHVDiBK@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YgQN4WXXjSHVDiBK@ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:42z7V6HGvHKO01ZXFESGhB6onaGQz+EgEZLEwRYRWfcGOdxRYLD
 9+oR0V3WTV7T8z04HfUEJ9krjI09hKpvIApkF/inaY+3VN8FhRS5T7xTc3/mbgWl46Jcw5a
 GDTLmkSaCOHMy9j+3jfEmdH51Jv17frlHfioXT30moKjj20PLKp7yzYo1xXVMfmltU4r5Qu
 NQbRHW/tJd8r4apj1Lv/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4JcwXyelHy4=:+MM5hST94MEtH02gMwvaW0
 ZcliY+zGZF7L1yG3yKtZP4vh5pMTwyJPaTGL3qgFq9I/3BW8aDoInHfLfPpoKi2rwyla2ceE0
 ncadHtEaxG6hbDU9R/PYztGw5ywwSOu66sVfV/aLV7m53cXbPlWuimAqyUkcQ4MBWPq7Ugz62
 MAkCyz+JVxNnAnMXFLNdRn/oh2bK/ltOP/7S8sKT8SVYLLGDBcgxPCrb8J41r0A/XD9Cyw+Ef
 1VoUXAWiEjOZsqH4jrYSicK+MwAe6FC1NyMKLTb2AEEFjfGC2Ki36tFSx5nqSo1Cp1SvNgw7k
 7AtmAIWnLdkUj/48LKLmu+ZMEMSoeH22FcJ66EIxd+P2KwDcVZ9k4MOJ9t93sokJkBCBh1Nc3
 Gooj+73FPpnbPG0j3Nr4F6zpOwIdKsluJ6On8zno5IjrdweqJ9DMOQ490rSZxSdazwFlxuyGY
 NWvCugZGmD0LrD2pMMc5lwaEIi+0ICGSs3bf/h1OIe4hejIZOlmqQvfX//Lc49Qqg8M/VCnt8
 xgWoaSs7dOYXUR1bLPoDu7xQ6LQ5swWI0y2BtY6D6eu4mggwDUBuP1aL5ajhuTIVMS4/byhCp
 1/FpJ3DjnM9MNBZRqoWpnz/NjYlJzLAyDk2v8C2f4WyhjG3nJavpFmtXQOwxu9erpUFqVpgz+
 pIgC3giGGFfxpXgff1hmk+7wWzK7guy7Dd29d/OoO05FsoXiZEfxfs20/akgHt+75pxDaUttA
 qbrb7qOglYmcZQuYg8MlGN1uzMfyZ70txlietIhMwUnVlwU9dAqyKRQP2QlU5aeDKPIEJfFSO
 u/MJtraLTHfBwRTHRpEVuuWP5JkvOB8OFL7nrcmhYkBh78WXvt09wW/7BTiSqwc5hCXrLodXy
 LXuzCIPJB8SmBam3HvUGoR7aiHF8cIeqimWlITnX3Mt51i67+utU7J+tKJmv4ybc/LIVJW12Z
 Rm1G8GffB1K/P3zTE8PrEBAibEgwRlYplWmRuM4DTzYZ6AtU2I05stcyE2s8rfVErnHkzT9/I
 58/rT+QKBjw0JMeYXearxyJAk+OdJgIykTT0z2LymPzpkBst9oERHTVDG5qSL2fCyvy1hrnYF
 ZNkzpCupdleQDE=
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
Cc: linux-fbdev@vger.kernel.org, ducheng2@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, daniel.vetter@ffwll.ch,
 Zeal Robot <zealci@zte.com.cn>, deng.changcheng@zte.com.cn,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, cssk@net-c.es,
 geert@linux-m68k.org, svens@stackframe.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 19:54, Sam Ravnborg wrote:
> On Wed, Feb 09, 2022 at 08:48:10AM +0000, cgel.zte@gmail.com wrote:
>> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>>
>> Use min() in order to make code cleaner.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> I had preferred in minmax.h was included, but it has an indirect include
> so shrug.
>
> I assume Daniel or Helge will pick it up.

Daniel has quite some upcoming changes to core/fbcon, so I prefer
that he takes it when he thinks it's the right time...

Helge

>
>> ---
>>  drivers/video/fbdev/core/fbcon.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index f36829eeb5a9..61171159fee2 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -602,7 +602,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, =
struct fb_info *info,
>>  		save =3D kmalloc(array3_size(logo_lines, new_cols, 2),
>>  			       GFP_KERNEL);
>>  		if (save) {
>> -			int i =3D cols < new_cols ? cols : new_cols;
>> +			int i =3D min(cols, new_cols);
>>  			scr_memsetw(save, erase, array3_size(logo_lines, new_cols, 2));
>>  			r =3D q - step;
>>  			for (cnt =3D 0; cnt < logo_lines; cnt++, r +=3D i)
>> --
>> 2.25.1

