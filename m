Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0657FB32
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8EC8B17A;
	Mon, 25 Jul 2022 08:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D26D8B137
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658737480;
 bh=Q/fzEFlwcS/PYAbsBodtIxc86HI6kWU6z8JxCzps4eo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=haMhWUlCPSH5CFEkb0z9XyWjeCnaOXm7B0Gjp52g2V2KjksyrBJ0nx8UQPbs7OJ1g
 DS29IswjQ2h6ZFbmPiR8keX7HDDJNADZXCJ0m/CbQycVn3WGjVvwh5pG+ZmRyuhZHv
 vIq/xaXqGnMzT4ajuKB9or8374i45vckYEUKwPek=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.140.141]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9T1-1oP04v0xDF-009CJD; Mon, 25
 Jul 2022 10:24:40 +0200
Message-ID: <1a640421-9b22-28a3-4712-714c4f12b9b2@gmx.de>
Date: Mon, 25 Jul 2022 10:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fbdev: Make registered_fb[] private to fbmem.c
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220725075400.68478-1-javierm@redhat.com>
 <c06cccc7-9e7d-5659-c23d-40ca386574b0@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <c06cccc7-9e7d-5659-c23d-40ca386574b0@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZjD4JArpyofLO9WHEqMo7VhreBlhRkiYZWwkzSJ3Pv2a4CUMFyH
 GpzCKg2poPDFbIftn7s2o5SN25CTaCkb9CJ9zhnYW2itdAoGH1OBhyAjghiSxr6IOIh/Oti
 8eEHUYQ+sKfYY7F0fp7JWhHUL8Ky+ZppQKYTk3pyTY/9vWpsoEQyDxtzGtLrhjNeiIaTYd0
 EWoBMPhLFis81KNIAv2mQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DUwW8Qj4G4M=:rbDf/oYyOEYdx/kjrJdzjh
 aakadAtGrJJ/GrLKujso2nN1ycLy28ElhpfL7mCeCfxLdjLo4dQthoO9u8j8tfNQWhbdGXLqM
 8Ixx7v2Tt5Rdzc63KyupPoGyuwcUxdPBgbbKfYH4i1WgmXL4ElGxnPadr8NCS4jpZ+0zbdnKA
 MFYqqygzz4UbwC76HGPwlhjzohYkZnlUCqk3nmLLM0jeEiN3g4FahKeswfEe4KmqcAy8HbdBs
 l/jCv5L9sPDRYll0VIe3O7KHXpd05ezXfE3SENW/AwbJA0E6kaJa6rogLsv5MUgMKDcGxgftR
 XcRYM2kgqkDbAHRQolQjF0mnsw52b81I8D/vuWApPemCG74yL/vEdn7+IiNacTMA3IapOsKGD
 fNeU+LOwpoqE6fFaIlBsKhX3JL9z2AMprM209B1k4C6qHCWwbW2KCVBK6b2kFdaePjGmYZUf5
 DIoUgJnbtmn8gR+HFPxo3KX1/5Ish/uMJKObGkBZeD9WV2j3fm/8tlXhYbSd0L77FG9spUsfi
 eunv3i1ws7IQM9YWZbdR/CEnUjfCoDpfi8mBtXglfc1O0MkGQ2D01tuwoyKO8reMVVBdDKMJY
 HRVUEtPzdh8SRVOUm2qjABmwPaoOfXgoh8MpJvJ954KPa38VVIxpGaR0eTm+Tr2+c3TVkWf8V
 U4HQ200lja4Qf8/FXH3vUCIN9PmEOwRzZRIOoXcgd2K2igDNJnH6Ho0gdpIvyN3UKaR8yyzJC
 pjbx14nfHISOJIsDqCRpHYHhpHCAFDDMYfrGxEqUYZ4ZY3rA7nHFlJb3D8TqNXO9qA1zelo06
 nlZI/QAF8aMBT+KiHSx+Dy9QJDQiYK8d7E5VZ6brncCBYgHN2Y9ifKVKt4nwibK1bJo4jLXZe
 xj2WGXt5Nv37EdkfFfTMIemj8OfjPJ10lJi2lpmkwEEQkILRe9D/V/nZDjwWHviB3MlK8BKOr
 0SbUE1KnidP/jg1mlhk7yfAFrp0BEDheR7x/a0OK6xLhshBAmanms2Lq/jCy4ZLbqa6DtL/L+
 PFNW335uVyXxwxUKNkG0vLTv4nUnfYhWDit2Di2qDnw5BLFcV+SU+RLr8jZEJRlYPdIDaoSmn
 OLDxm1sKFNQuctnCqQrwsiTFICrPDrmek+vHWmbsq3yT76Fi5IOTbn+zA==
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/25/22 09:55, Thomas Zimmermann wrote:
> Hi
>
> Am 25.07.22 um 09:54 schrieb Javier Martinez Canillas:
>> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> No driver access this anymore, except for the olpc dcon fbdev driver bu=
t
>> that has been marked as broken anyways by commit de0952f267ff ("staging=
:
>> olpc_dcon: mark driver as broken").
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Helge Deller <deller@gmx.de>

Helge

>
> Best regards
> Thomas
>
>> ---
>>
>> =C2=A0 drivers/video/fbdev/core/fbmem.c | 6 +++---
>> =C2=A0 include/linux/fb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ------
>> =C2=A0 2 files changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index 6ae1c5fa19f9..1e70d8c67653 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -51,10 +51,10 @@
>> =C2=A0 static DEFINE_MUTEX(registration_lock);
>> =C2=A0 =C2=A0 struct fb_info *registered_fb[FB_MAX] __read_mostly;
>> -EXPORT_SYMBOL(registered_fb);
>> -
>> =C2=A0 int num_registered_fb __read_mostly;
>> -EXPORT_SYMBOL(num_registered_fb);
>> +#define for_each_registered_fb(i)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < FB_MAX; i++)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!registered_fb[i]) {} e=
lse
>> =C2=A0 =C2=A0 bool fb_center_logo __read_mostly;
>> =C2=A0 diff --git a/include/linux/fb.h b/include/linux/fb.h
>> index 453c3b2b6b8e..0aff76bcbb00 100644
>> --- a/include/linux/fb.h
>> +++ b/include/linux/fb.h
>> @@ -627,16 +627,10 @@ extern int fb_get_color_depth(struct fb_var_scree=
ninfo *var,
>> =C2=A0 extern int fb_get_options(const char *name, char **option);
>> =C2=A0 extern int fb_new_modelist(struct fb_info *info);
>> =C2=A0 -extern struct fb_info *registered_fb[FB_MAX];
>> -extern int num_registered_fb;
>> =C2=A0 extern bool fb_center_logo;
>> =C2=A0 extern int fb_logo_count;
>> =C2=A0 extern struct class *fb_class;
>> =C2=A0 -#define for_each_registered_fb(i)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < FB_MAX; i++)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!registered_fb[i]) {} e=
lse
>> -
>> =C2=A0 static inline void lock_fb_info(struct fb_info *info)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&info->lock);
>

