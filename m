Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE3B38CB52
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 18:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1846E0AF;
	Fri, 21 May 2021 16:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1FB6E0AF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:53:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621616000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GtBZJNmfi/v/kAisjZU0tr49hHMPjKyZXZ+HZ0R8LGI=;
 b=PFExVpoIcbcqZHMSZkPDe5oDiXHUkHs6N0Hd0+krIQx3VwRSl/QlnuIev1usID2EGX0mi4
 6MW6kSUv42biO9jiebY8R7GuNLUfP2GqrDJJKy8aecVa3AGpeo/+51Usle6o1d0VthW/34
 Qo2mJlzGoSZZl8KJju4eDC+FPP0B/3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621616000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GtBZJNmfi/v/kAisjZU0tr49hHMPjKyZXZ+HZ0R8LGI=;
 b=AoQHMNJOczhuvH22t6Y8ts690eBjuRCNud0FQYaKBWVrs/IP99JkMvAObAIEpgsf2NWRyI
 eL7R3XsIWJbYO0AQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0234AB64;
 Fri, 21 May 2021 16:53:19 +0000 (UTC)
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
Date: Fri, 21 May 2021 18:53:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TDC7z8OvM0VcFemQPSOA5LJHp8ZtIXAwI"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TDC7z8OvM0VcFemQPSOA5LJHp8ZtIXAwI
Content-Type: multipart/mixed; boundary="Q5rdZSZKGaRlX38IpcwB0qqlARh7fYvgO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Message-ID: <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
In-Reply-To: <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>

--Q5rdZSZKGaRlX38IpcwB0qqlARh7fYvgO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.05.21 um 17:33 schrieb Daniel Vetter:
> On Fri, May 21, 2021 at 03:19:10PM +0200, Javier Martinez Canillas wrot=
e:
>> Framebuffer devices that are registered by DRM drivers for fbdev emula=
tion
>> have a "drmfb" suffix in their name. But makes them to be quite confus=
ing
>> if a driver already has "drm" in its name:
>>
>> $ cat /proc/fb
>> 0 rockchipdrmdrmfb
>>
>> $ cat /proc/fb
>> 0 simpledrmdrmfb
>>
>> Instead, let's just add a "-fb" suffix to denote that are DRM drivers =
FB:
>>
>> $ cat /proc/fb
>> 0 rockchipdrm-fb
>>
>> $ cat /proc/fb
>> 0 simpledrm-fb
>>
>> Suggested-by: Peter Robinson <pbrobinson@gmail.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> So what with all the drivers which do _not_ have drm in their name? Als=
o
> I'm never sure how much these are uapi or not ...

Why do we need a suffix anyway?

> -Daniel
>=20
>> ---
>>
>>   drivers/gpu/drm/drm_fb_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
>> index f6baa204612..bbaff92c509 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *inf=
o,
>>   			       sizes->fb_width, sizes->fb_height);
>>  =20
>>   	info->par =3D fb_helper;
>> -	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
>> +	snprintf(info->fix.id, sizeof(info->fix.id), "%s-fb",
>>   		 fb_helper->dev->driver->name);
>>  =20
>>   }
>> --=20
>> 2.31.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Q5rdZSZKGaRlX38IpcwB0qqlARh7fYvgO--

--TDC7z8OvM0VcFemQPSOA5LJHp8ZtIXAwI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCn5X4FAwAAAAAACgkQlh/E3EQov+AB
sRAAmuKXo2SiiIcXp1PwrjztYN4Iv7mttdjAGCUa+M1Vjxxo9SkHlnZFlOLOelWngNO4l+t+rDVe
cL6iaQUf2rOA8x/hGIiVgR8E88PVZmVwa15mFescVa38sE8xnvGcnSELeOL2v49CR+lSyzvmkVaE
DwmKhdHBuslxqo24qOllX+w3FVEJDMpi7LPkXURsO2jP7c9csPeXgTi/an9Lc2TYqu9nzM3MKC97
hFTSYaMOgODak/3s+/4cg9B8rMgKWNkqheTKrGhrpEqCNA1Q7Bif0QhgVM/cBn3LoHQwpCdLBaGV
AVcTCRQjjFznHnvy1d9iL8bG4/ANDpdYh1IgDV76ZbVrEqEAI/i6p7Dsfvr0d8ruO9eSNZt2duDw
jD6mhx64c7g7oWNHOa/M9dFrsNi6D/+Sh6KcJTjtM3Is+Q86Tsa/ydTpfD0hgI6Zd5Z9nEBtODsX
MBqlAt3OGKDbgvICMBMqdXF/5Bmgv8mfI1o9E3AZJ4GB+ZOPfp7SRjo2hdMAKnNSs9WYDVxN/ovL
rxWmvakHRzUPI7njWhBHOPf0Oh/zfwWv6k0GDYS/XfNofAPHw7/Lk9ISvvChjkrmK8ySkefqiuUO
LltWGSe7TA6aXI7QMLfzJ0AV1kE+i7oj/9Y/Hq5OPu3kGrw6K3OUB9g5uu5xAF4051YJqf+JOYyY
hxg=
=C3jq
-----END PGP SIGNATURE-----

--TDC7z8OvM0VcFemQPSOA5LJHp8ZtIXAwI--
