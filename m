Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0A5FBC58
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 22:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6425C10E376;
	Tue, 11 Oct 2022 20:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7B10E376;
 Tue, 11 Oct 2022 20:45:36 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1364357a691so10852252fac.7; 
 Tue, 11 Oct 2022 13:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yk/YC/vwhdA4SmlGq4Gb2K6GBPNqKnbli+wPdxVsRl0=;
 b=loYkHW4XCXD6gN3aQbD2PtMDX6dVUFR4bxTbXpA23pxkHtruKY/rumyNwQi2SKYcKX
 GImappNH+hyJqFQZOYR8FcsDkFBdrrYDaCJ2xgTajT3eGpcdO9azjspMy5gqvqUXpUDK
 /YyA1eyxcMThdyQk04m6QSZjD2bBG5IDt5esqj0ZDi/CD2OmfMZfa/EDxoYZNj7TvmXo
 0+DKsXVEy5i5Ie92oceuxyh8HK27GrhfElbCLXGYqzpDEUzdapONLWeL/GAam/ebyOPV
 0v4+Zlvu1wD0014NfcOVWDWDCMC/4ZR885eqzChDPSoSVjTPHP+TdcHChJVXm4Xyc58D
 mzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yk/YC/vwhdA4SmlGq4Gb2K6GBPNqKnbli+wPdxVsRl0=;
 b=8QNyZaHI5Zw33ih1JMBsB5kTFCVsro1zbaSYqFQSKpnWBeu+18waUjgcnRAFly+hN1
 o/3M35hVVlSIzV6iArvKutSAmAAVkZLS7ts3QfVHbj50vhJMSO5EnEkutKzoFJyi8saa
 JMpYfhgLoE/texmDeZkSGISQi+yt5F2yEB5zDWL25E11cuIqPyLitnG+imZ4dmPuxu8W
 mUfCiE1pFFWSS4U+QpXfzBgZ4M++yBzTDvK4Rk/xxyADXNSCN83iEkm24I/F4hRZXK02
 c0JmXG5+VcpYfU0hkyMk0kBwqzzUHatRhj7UiZtW5Uv2s/bemVNBC6IlCRQQR04eX84D
 hFrg==
X-Gm-Message-State: ACrzQf3VVxmLfCLFryhNtVdUhcsGNtQpNlgJhYSY+dP2Mr4swRL47Fzg
 lS7PnNnDgMy+5aeGVaPc/SJLeVDSk4nyY5tDZJY=
X-Google-Smtp-Source: AMsMyM4eCv5ypQ4ONMv0BAL3aePyZkoRRh+DKTwk9L4CXbyI0un2AuGl6d5pqupKKXwTvJW9TCSnPTX3iUD0/uSZp5o=
X-Received: by 2002:a05:6870:b68c:b0:132:b864:2aa2 with SMTP id
 cy12-20020a056870b68c00b00132b8642aa2mr608499oab.130.1665521135691; Tue, 11
 Oct 2022 13:45:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6838:7e8b:0:0:0:0 with HTTP; Tue, 11 Oct 2022 13:45:35
 -0700 (PDT)
In-Reply-To: <87wn96yggd.fsf@intel.com>
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com> <87wn96yggd.fsf@intel.com>
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
Date: Tue, 11 Oct 2022 22:45:35 +0200
Message-ID: <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the EDID is requested during the resume. But since it's
requested too early, this means before the filesystem is mounted, the
firmware request fails. This make the DRM driver crash when resuming.
This kind of issue should be prevented by the firmware caching process
which cache every firmware requested for the next resume. But since we
are using a temporary device, the firmware isn't cached on suspend
since the device doesn't work anymore.
When using a non temporary device to get the EDID, the firmware will
be cached on suspend for the next resume. So requesting the firmware
during resume will succeed.
But if the firmware has never been requested since the boot, this
means that the monitor isn't plugged since the boot. The kernel will
not be caching the EDID. So if we plug the monitor while the machine
is suspended. The resume will fail to load the firmware. And the DRM
driver will crash.
So basically, your fix should solve the issue except for the case
where the monitor hasn't been plugged since boot and is plugged while
the machine is suspended.
I hope I was clear. Tell me if I wasn't. I'm not really good at explaining.

Matthieu

On 10/11/22, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 11 Oct 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> wrot=
e:
>> It should fix the issue. Meanwhile, the system will still crash if a
>> new monitor is plugged while the machine is suspended. We might need to
>> precache the EDID to prevent that.
>
> Please elaborate.
>
> BR,
> Jani.
>
>
>>
>> Matthieu
>>
>> On Fri, Oct 7 2022 at 01:21:46 AM +0300, Jani Nikula
>> <jani.nikula@intel.com> wrote:
>>> We've used a temporary platform device for firmware EDID loading since
>>> it was introduced in commit da0df92b5731 ("drm: allow loading an EDID
>>> as
>>> firmware to override broken monitor"), but there's no explanation why.
>>>
>>> Do we need to?
>>>
>>> Maybe this fixes the suspend/resume issue?
>>>
>>> (Yes, I'll rewrite the commit message if this is the way to go ;)
>>>
>>> References:
>>> https://lore.kernel.org/r/20220727074152.43059-1-matthieu.charette@gmai=
l.com
>>> Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>
>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_edid_load.c | 11 +----------
>>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_edid_load.c
>>> b/drivers/gpu/drm/drm_edid_load.c
>>> index 37d8ba3ddb46..fbae12130234 100644
>>> --- a/drivers/gpu/drm/drm_edid_load.c
>>> +++ b/drivers/gpu/drm/drm_edid_load.c
>>> @@ -182,18 +182,9 @@ static void *edid_load(struct drm_connector
>>> *connector, const char *name,
>>>  		fwdata =3D generic_edid[builtin];
>>>  		fwsize =3D sizeof(generic_edid[builtin]);
>>>  	} else {
>>> -		struct platform_device *pdev;
>>>  		int err;
>>>
>>> -		pdev =3D platform_device_register_simple(connector_name, -1, NULL,
>>> 0);
>>> -		if (IS_ERR(pdev)) {
>>> -			DRM_ERROR("Failed to register EDID firmware platform device "
>>> -				  "for connector \"%s\"\n", connector_name);
>>> -			return ERR_CAST(pdev);
>>> -		}
>>> -
>>> -		err =3D request_firmware(&fw, name, &pdev->dev);
>>> -		platform_device_unregister(pdev);
>>> +		err =3D request_firmware(&fw, name, connector->dev->dev);
>>>  		if (err) {
>>>  			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=3D%d)\n",
>>>  				  name, err);
>>> --
>>> 2.34.1
>>>
>>
>>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
>
