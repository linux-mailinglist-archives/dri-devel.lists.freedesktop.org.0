Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF63F55B07D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963C714AE3E;
	Sun, 26 Jun 2022 08:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5EE14AE2D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656233874;
 bh=KPon+7tHhVYBxyHhPcpOWyLBwECh8h4RrGvj9Xo1c9E=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eMRw5kuTAnpkYyCDUUyqsyzluzNXnGWXvawOwLfo2jBypp+Ql9VRchq3FztZjPFVF
 4cVTyL+629k9E/9BovG9s5esSMr8dUrTFT+HQBqWIoHO4f9zsYatJUHalebrWyxMw7
 jjl5lMsIs46m8nhJvRzJBhYHZlxAuzpoB3MLyCQc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.166]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDNf-1nIqzt1kKt-00qkIT; Sun, 26
 Jun 2022 10:57:54 +0200
Message-ID: <e6a3668b-ea68-b9e6-fbcd-e60d5482ee11@gmx.de>
Date: Sun, 26 Jun 2022 10:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/3] fbcon: Prevent that screen size is smaller than
 font size
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625232703.401821-1-deller@gmx.de>
 <20220625232703.401821-3-deller@gmx.de> <YrgdzT7LwoCv6Vok@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YrgdzT7LwoCv6Vok@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AGdJJzmiHyl+f6aN89ZJomthDGJ+bUu4WWF9SB5rQadXFk0Ll8I
 5rZXORiqCu80CpFtDwTADyLYeiL5ysk3cGVszF504LccpzYLp8QW/TNznDUwka/huTSK10c
 L41PvrQuBz7zGqeiCGhwFkNIIwG4OWz2+fjxOmOQSMEoHyhbTtackQOx+30u0KBJsADH6xJ
 a22O6TVhij9yTS/9aJ2gQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+SR9jcnuU+0=:J8QMPA/R473KT3kenOdeIN
 /J9jV3VSTq885mF1Xlj3a+1XpYx1foeIja0XYWCE61BWYA+AvJEz8/jcVEvR0GFZWz8Di4UB1
 Gy8xILzDy6uWQ9J7fPIGnas16kEn4XiyNXGSGW5KoRExRg6N+Fhrp+ejx0kPhEROuhYfD1C7D
 4TVevv6URT+LPciNcwzY+voESu0nqLN1FJ4x4T2oow5H2c1wqLkwYoBOviEaqVkXIxDj3bD/G
 UYwzW36TalId2hkmkIICTDu4nldlZIBHap6K44X3cmZ1YJ97I37jnomU1TQOLEiT1xLABu9OP
 uFMGvwyouBGeSUzQLwV+5as3Z90izFs8iyl7QB33Ly6wDFWVcRm/b+P6b9d/51pKR8mrs0TDB
 O9Z7MVZW3i56UFMK4tp9+fP/6UgBm+YsubXK5Kf1ZO2fi2yEHwyIvVNMkJLaujF+vwsF1Ym3p
 1Q77dl7BvjvKPEWoe7MKbMePKYAjP3a7zrzUer7lLTjzIpXYHOvQJCSHv0MooTPuhCYcLAIx6
 cAzqm/zUOs83llRLD1Nq/b+qoe/gPxzXDe/Et6sLN6lIJvi377TttYqypv15ZFWDI7olydVSR
 XgBINDJTorDoqkgUr6qNaCXJkMoA+a7uu9aD3sIjF5b6uw4oDc7rpJ7o+Mp/0ki3XEGh/kM/R
 H8PYnnW7cj9O4k1uO7eDa3oojpiTZdCEq/oKIh16guqlWMORHaEMiMZd+sdN+sYKq8w4183y5
 S8m3Cja3lBu2TXED1LholBhYl5/zQsw8krWR4UefRdkwbjoufGymwx7+EXP1HK3Tvdm0pVLSS
 rolVYHP+6DN+/LefuKgYLrXowKkGFoqWudQGhp1kl465K7debfBe2y93KaplV29UyRbnIHoRv
 6ECvBxcFa2xHGp129r3+z8RajFZk2eG/ke2t8sOs6nwKQDRJENx1yxKcGHfR8LrNaCCSwycuj
 FXfc6nHypVt8+Y762ysHBC/1G3siD3XdcnsXK9fGjOr5f1C5/+RUR0v7bZkDczUo2IBqElO5W
 tsTpHUCCRWGMeRPXL2PHP7NJznYaTvpSbwR3i3oEpoz4XtjuGf4+N5M1y4km9uEegjkVu1+4+
 M1ErcIu6aSOmL4fZrZ4McEVg2hH552D3fWNe0Iz9lbdUmFO5fAYCtkJiw==
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

On 6/26/22 10:50, Daniel Vetter wrote:
> On Sun, Jun 26, 2022 at 01:27:02AM +0200, Helge Deller wrote:
>> We need to prevent that users configure a screen size which is smaller =
than the
>> currently selected font size. Otherwise rendering chars on the screen w=
ill
>> access memory outside the graphics memory region.
>>
>> This patch adds a new function fbcon_modechange_possible() which
>> implements this check and which later may be extended with other checks
>> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
>> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
>> for a too small screen size.
>>
>> This patch depends on commit 409d6c95f9c6 ("fbcon: Introduce wrapper fo=
r console->fb_info lookup"),
>> so it needs to be backported as well.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.4+
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks, but sadly pushing commit 409d6c95f9c6 isn't easily possible.
I've just sent a new series v5 which fixes it up..

Helge

>
>> ---
>>  drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++++
>>  drivers/video/fbdev/core/fbmem.c |  4 +++-
>>  include/linux/fbcon.h            |  4 ++++
>>  3 files changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index e162d5e753e5..2ab7515ac842 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -2736,6 +2736,33 @@ void fbcon_update_vcs(struct fb_info *info, bool=
 all)
>>  }
>>  EXPORT_SYMBOL(fbcon_update_vcs);
>>
>> +/* let fbcon check if it supports a new screen resolution */
>> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_scre=
eninfo *var)
>> +{
>> +	struct fbcon_ops *ops =3D info->fbcon_par;
>> +	struct vc_data *vc;
>> +	int i;
>> +
>> +	WARN_CONSOLE_UNLOCKED();
>> +
>> +	if (!ops || ops->currcon < 0)
>> +		return -EINVAL;
>> +
>> +	/* prevent setting a screen size which is smaller than font size */
>> +	for (i =3D first_fb_vc; i <=3D last_fb_vc; i++) {
>> +		vc =3D vc_cons[i].d;
>> +		if (!vc || fbcon_info_from_console(i) !=3D info)
>> +			continue;
>> +
>> +		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yre=
s) ||
>> +		    vc->vc_font.height > FBCON_SWAP(var->rotate, var->yres, var->xre=
s))
>> +			return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(fbcon_modechange_possible);
>> +
>>  int fbcon_mode_deleted(struct fb_info *info,
>>  		       struct fb_videomode *mode)
>>  {
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
>> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
>> index ff5596dd30f8..2382dec6d6ab 100644
>> --- a/include/linux/fbcon.h
>> +++ b/include/linux/fbcon.h
>> @@ -15,6 +15,8 @@ void fbcon_new_modelist(struct fb_info *info);
>>  void fbcon_get_requirement(struct fb_info *info,
>>  			   struct fb_blit_caps *caps);
>>  void fbcon_fb_blanked(struct fb_info *info, int blank);
>> +int  fbcon_modechange_possible(struct fb_info *info,
>> +			       struct fb_var_screeninfo *var);
>>  void fbcon_update_vcs(struct fb_info *info, bool all);
>>  void fbcon_remap_all(struct fb_info *info);
>>  int fbcon_set_con2fb_map_ioctl(void __user *argp);
>> @@ -33,6 +35,8 @@ static inline void fbcon_new_modelist(struct fb_info =
*info) {}
>>  static inline void fbcon_get_requirement(struct fb_info *info,
>>  					 struct fb_blit_caps *caps) {}
>>  static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {=
}
>> +static inline int  fbcon_modechange_possible(struct fb_info *info,
>> +				struct fb_var_screeninfo *var) { return 0; }
>>  static inline void fbcon_update_vcs(struct fb_info *info, bool all) {}
>>  static inline void fbcon_remap_all(struct fb_info *info) {}
>>  static inline int fbcon_set_con2fb_map_ioctl(void __user *argp) { retu=
rn 0; }
>> --
>> 2.35.3
>>
>

