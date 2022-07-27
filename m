Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380A581E88
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 06:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE7DC0E9F;
	Wed, 27 Jul 2022 04:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD0BC0E9B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 04:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658894963;
 bh=tDo3f2pmvZrsYMJdCO/2ELplL1eJAZ6qc5wfUzsfN8U=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=ZCXYDFVrcKqWLjSiDzXLueJc73bUL+Hxs5WRd0X4n/oXKCXEuh4oqkUyCrLmH4y2s
 EFUP2/Wngf29ISuvEjw00ZVNdm4kk3B0vq7wYno5Hda+GMCj/Boo5rk6/1EF0/uShI
 DEsCXCr4SpMZf1Yo8FPXyS0wfWWt1gx9krCSi9kg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.186.181]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWASY-1nxJJB1tNK-00XZPc; Wed, 27
 Jul 2022 06:09:23 +0200
Message-ID: <99055c9c-82bc-8d65-f2c4-33530298db0f@gmx.de>
Date: Wed, 27 Jul 2022 06:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fbdev: Make registered_fb[] private to fbmem.c
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220725075400.68478-1-javierm@redhat.com>
 <4b3e4d1b-e219-1ecc-5dd3-d693c69f6124@gmx.de>
In-Reply-To: <4b3e4d1b-e219-1ecc-5dd3-d693c69f6124@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EY7w9p4S7r/Em3LQbbWXLyNqFQx99psOB3rex+4CjThww0H02jM
 oNoVYjCGwU3/AV8ZN8P2+8LrC+IfSScX8HMmsX1bPzSuWoBVH2JbJBAM+cjHx5FLjKfh026
 Qp2q9XlBoDco7mrkCN67uQHLgJraoqrn49SxQ1JCdqfgCec62Ygm8bHlFB8uYCIvhFARu99
 7OcneetaY4nVa20Wh0qJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5LVKn6VWkXI=:A8nTlAd+8hPNNtQGjNXxBB
 9iMBQjOq6YV9mQvWlW8SixIyDaGvFuE928MN1ZZFWDmqWvF+4AHWUTB+WLpA3UipE4jwU1k9r
 UoFKRMFxAT1mfz8XiwtGn/y2uau5WxTTRxkXSW3mFCbgwiutMSTmTxvEGye8DG54xq5CSpa27
 BMQvRAQozVadBqVDMBmFtcccn5BKEAE8loDZb2lFGB9xD9kyN+FPrXatLOlDaIJ5pQs0ZjyGa
 vQVh8eL6p4x97HRlWAoWimfDKLo2jypUHslhlMD+2rlZYPfjRr5E3lyou/ncnusqQb5lPJI4k
 QAy+aZSsyuwbXwyj0jHtXpCwpOOea6G4/zwAQL+jNScIw71toZu6k8czY+zALFHPor2IkywJR
 cM1F4HSj3TyPiQGAKfl6V1oaZaP9RzuvGmmlmpwfFWbaFEdpeYrwWAZgRp2CzYGNaW5MSu9Os
 8w2CVtb2hcPYehUJieaDAYX01nStdTI0f/gRdmwmQ/+GDs7I6psNlE1iJdC8Agg7nNNq/td1Y
 4ThKso1Lvw720ZPnjr9iwyfhxObe/teCqDVzUdBQ9RgKx4Xa10FwXK6a2bh9fOGEyhjrapVpg
 JyZ03m12BL9inVIN22x78v4pWpOwyoMng/TDTD6VNPFYXlyAJXn/QvffqnHaPVElDGZQWVWJN
 HDWNolGODdEJIpn7D1D+4czoqfJ+6vLyuhUVdzCBzF+XNhkBsqzATZvGD5OAkIP9r5aoJYWVC
 Vjmd2f8zyXKT/imm4PPvvyMhOhh6bygDqsoDavUt6df3lqwQHPiSTkx2PAr6CCYYDxl6GQGNW
 C9MZCIDfKdkP/fJCM8E2yrCuAk2i2dn13pSF81jfZMKsw0UGWKTkx6StfMcm48ozkKQmv/Zv4
 GpanPKqHNewOv1G7x+XXar0Ljv/p3VP/zHCbK4cTSzExXbAEQXLHUb3rnoGti97qTtAyQ+lEq
 Q95uah4fB732mrlwREfd+xBgskt04KzVUsXw2+USLyOctB9eEln0ZpEwP/XfdbFG/D6SHk6vW
 43o7hzocWSmCjLgiVp/GsetWq03J/yvJI5wJ0wu51THobeL6nMkjKa6nN5hVVgZO/QoBCH+TA
 EBHgVix5W0syapS6/yVAKTpSn45TXqRgiiGQJymvAcxWKP3/Dz8K4QirQ==
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/22 09:22, Helge Deller wrote:
> On 7/25/22 09:54, Javier Martinez Canillas wrote:
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
> I've applied it to the fbdev git tree.

I've dropped that patch for now from the fbdev git tree, since
it gave build errors [1] in for-next:

 drivers/video/fbdev/simplefb.c:426:6: error: use of undeclared identifier=
 'num_registered_fb'; did you mean 'WB_registered'?
           if (num_registered_fb > 0) {
               ^~~~~~~~~~~~~~~~~

Helge

[1] https://lore.kernel.org/all/202207270857.mo9oRcRE-lkp@intel.com/


>>
>>  drivers/video/fbdev/core/fbmem.c | 6 +++---
>>  include/linux/fb.h               | 6 ------
>>  2 files changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/cor=
e/fbmem.c
>> index 6ae1c5fa19f9..1e70d8c67653 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -51,10 +51,10 @@
>>  static DEFINE_MUTEX(registration_lock);
>>
>>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
>> -EXPORT_SYMBOL(registered_fb);
>> -
>>  int num_registered_fb __read_mostly;
>> -EXPORT_SYMBOL(num_registered_fb);
>> +#define for_each_registered_fb(i)		\
>> +	for (i =3D 0; i < FB_MAX; i++)		\
>> +		if (!registered_fb[i]) {} else
>>
>>  bool fb_center_logo __read_mostly;
>>
>> diff --git a/include/linux/fb.h b/include/linux/fb.h
>> index 453c3b2b6b8e..0aff76bcbb00 100644
>> --- a/include/linux/fb.h
>> +++ b/include/linux/fb.h
>> @@ -627,16 +627,10 @@ extern int fb_get_color_depth(struct fb_var_scree=
ninfo *var,
>>  extern int fb_get_options(const char *name, char **option);
>>  extern int fb_new_modelist(struct fb_info *info);
>>
>> -extern struct fb_info *registered_fb[FB_MAX];
>> -extern int num_registered_fb;
>>  extern bool fb_center_logo;
>>  extern int fb_logo_count;
>>  extern struct class *fb_class;
>>
>> -#define for_each_registered_fb(i)		\
>> -	for (i =3D 0; i < FB_MAX; i++)		\
>> -		if (!registered_fb[i]) {} else
>> -
>>  static inline void lock_fb_info(struct fb_info *info)
>>  {
>>  	mutex_lock(&info->lock);
>

