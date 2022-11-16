Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65C62C773
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 19:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD71891B4;
	Wed, 16 Nov 2022 18:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F6C89125;
 Wed, 16 Nov 2022 18:17:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so2068762wmi.3; 
 Wed, 16 Nov 2022 10:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:cc:to:subject:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+/VZ3RMW0QVdjT2H/GHgdqvioDH8XccO8qT951ymUI=;
 b=Xa2MG+lKQnb4RBJQ7TeUqQp0zluX+FZtAY9c6prWDRU03oEnuyYbsdivvfLOLU7BH2
 /2RxAfGo3h5wAOOSa9OFNU6Y7SlWhDHO4SABS5oLW+Ub+c/JmGPXIJirkrGLBIpD3JSH
 kOeHv9Y9OtpadrZZDvP/AbStRuT1q0RN24tUkTHhN74n/DtBYmHfzhtQK0e3CYkw7VcP
 XXjLhgqiaD2vsBf7yKIkWKNsukiYRYiTwwz0NZl9HGgrXq6PHGuNZW0ai4hhIC7peeBQ
 dTYOo/Yjr+OUoxiJwGb5pLXpA97XkORUVch215WYUF7y0MRc6Z8ZaG7BwvXJifNBjQ6o
 WsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:cc:to:subject:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+/VZ3RMW0QVdjT2H/GHgdqvioDH8XccO8qT951ymUI=;
 b=kF5ohpf5VjS5CMVS5fTLft+21WgRzuoIgi105KkkuMGtQ0P6L9FCnVZZ0qt2rb5kgo
 EowUFaD+uECUlkF8kgJImm2TGlWUNC37reSLandstxBDbvqVJU/uI69AN0iFQXU03jLn
 5G6xHl8Tz/kS29lQmp/LdBHWePBW839qI6BSY7Lsq2sbxQu9VFLSYicSVVqTA23ZyuE7
 EDeMSZBflJ4GUYtLrQV0AOgdcNwJamVUpJjfIYN8XWeAsbnq/3nXuqSKYwb3esrkQ41s
 f1AFgGax9Fp2t28qbcMOWIN4/mKBxtdgxBDAdfm/6NKZVsQisUK06R4flOpHqons7AYP
 FTcw==
X-Gm-Message-State: ANoB5pmFSCjBgXiaQPC8KmN5uSka5t0vBx+PUvom3dh6MapPrhA+39aW
 LJ5Ju6J4eUC70k/MMLi/Ti0=
X-Google-Smtp-Source: AA0mqf5QitMkc/r1bFmQhhnLt2yF+eJwBDUXTNMWm1MME7xBNglPRCni4Y4UWtcSP8PRp2eOTPdB7w==
X-Received: by 2002:a05:600c:6890:b0:3c5:dbf4:baaf with SMTP id
 fn16-20020a05600c689000b003c5dbf4baafmr2867485wmb.105.1668622648419; 
 Wed, 16 Nov 2022 10:17:28 -0800 (PST)
Received: from [192.168.0.181] (82-64-129-2.subs.proxad.net. [82.64.129.2])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5001000000b002368424f89esm15503327wrt.67.2022.11.16.10.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:17:28 -0800 (PST)
Date: Wed, 16 Nov 2022 19:17:21 +0100
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [RESEND] drm/edid/firmware: stop using a throwaway platform device
To: Jani Nikula <jani.nikula@intel.com>
Message-Id: <XGDGLR.D2ABLOUR010J2@gmail.com>
In-Reply-To: <87wn7v10vi.fsf@intel.com>
References: <20221114111709.434979-1-jani.nikula@intel.com>
 <0422ebb6-d4ff-52b0-b773-c643489e8fe9@suse.de> <87wn7v10vi.fsf@intel.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you everyone for your work!

Matthieu.

On Wed, Nov 16 2022 at 03:32:01 PM +0200, Jani Nikula=20
<jani.nikula@intel.com> wrote:
> On Wed, 16 Nov 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>  Hi
>>=20
>>  Am 14.11.22 um 12:17 schrieb Jani Nikula:
>>>  We've used a temporary platform device for firmware EDID loading=20
>>> since
>>>  it was introduced in commit da0df92b5731 ("drm: allow loading an=20
>>> EDID as
>>>  firmware to override broken monitor"), but there's no explanation=20
>>> why.
>>>=20
>>>  Using a temporary device does not play well with CONFIG_FW_CACHE=3Dy,
>>>  which caches firmware images (e.g. on suspend) so that drivers can
>>>  request firmware when the system is not ready for it, and return=20
>>> the
>>>  images from the cache (e.g. during resume). This works=20
>>> automatically for
>>>  regular devices, but obviously not for a temporarily created=20
>>> device.
>>>=20
>>>  Stop using the throwaway platform device, and use the drm device
>>>  instead.
>>>=20
>>>  Note that this may still be problematic for cases where the=20
>>> display was
>>>  plugged in during suspend, and the firmware wasn't loaded and=20
>>> therefore
>>>  not cached before suspend.
>>>=20
>>>  References:=20
>>> https://lore.kernel.org/r/20220727074152.43059-1-matthieu.charette@gmai=
l.com
>>>  Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2061
>>>  Reported-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
>>>  Tested-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
>>>  Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>>>  Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>>  Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>=20
>>  I looked through request_firmware() but did not see any signs that=20
>> it
>>  somehow depends on a platform device. I assume that this might only
>>  affect the device name in the error message.
>=20
> Thanks, pushed to drm-misc-next.
>=20
> Matthieu, thanks for you patience and the report as well!
>=20
> BR,
> Jani.
>=20
>=20
>>=20
>>  Best regards
>>  Thomas
>>=20
>>>=20
>>>  ---
>>>=20
>>>  Resend with a proper commit message; patch itself is unchanged.
>>>  ---
>>>    drivers/gpu/drm/drm_edid_load.c | 13 +------------
>>>    1 file changed, 1 insertion(+), 12 deletions(-)
>>>=20
>>>  diff --git a/drivers/gpu/drm/drm_edid_load.c=20
>>> b/drivers/gpu/drm/drm_edid_load.c
>>>  index ef4ab59d6935..5d9ef267ebb3 100644
>>>  --- a/drivers/gpu/drm/drm_edid_load.c
>>>  +++ b/drivers/gpu/drm/drm_edid_load.c
>>>  @@ -172,20 +172,9 @@ static const struct drm_edid=20
>>> *edid_load(struct drm_connector *connector, const c
>>>    		fwdata =3D generic_edid[builtin];
>>>    		fwsize =3D sizeof(generic_edid[builtin]);
>>>    	} else {
>>>  -		struct platform_device *pdev;
>>>    		int err;
>>>=20
>>>  -		pdev =3D platform_device_register_simple(connector->name, -1,=20
>>> NULL, 0);
>>>  -		if (IS_ERR(pdev)) {
>>>  -			drm_err(connector->dev,
>>>  -				"[CONNECTOR:%d:%s] Failed to register EDID firmware platform=20
>>> device for connector \"%s\"\n",
>>>  -				connector->base.id, connector->name,
>>>  -				connector->name);
>>>  -			return ERR_CAST(pdev);
>>>  -		}
>>>  -
>>>  -		err =3D request_firmware(&fw, name, &pdev->dev);
>>>  -		platform_device_unregister(pdev);
>>>  +		err =3D request_firmware(&fw, name, connector->dev->dev);
>>>    		if (err) {
>>>    			drm_err(connector->dev,
>>>    				"[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed=20
>>> (err=3D%d)\n",
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center


