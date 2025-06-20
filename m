Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D16AE1A83
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 14:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAEF10E129;
	Fri, 20 Jun 2025 12:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="Gz6ex48o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D1A10E129
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 12:07:11 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ade326e366dso326240466b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750421230; x=1751026030; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG/pp+YecK6TL9JZ8UqalWMy4MkbPjqfLN1AxeBtCuM=;
 b=Gz6ex48oqQM4CoAQKswkOPEUSJgc20fMtN4GxR8NcMx9AvMFcOobuE88pLLu1eb2z7
 H+rowTybURGB8D7bescQn3ovhywcSBtg7/AEtF3HFv8PwpgztuznsZRbOfrJc13F6ngB
 W6S1ZsWuNps9uYt3WMIIFexYVv0n1cq/xpQYrq9XYcYLDa2rX+LcD6owyWWGZuIDCiyh
 uNpflS4I5bWs5XOaoyLSZZYiEoYdW0ZY1b9PC917dOB5qgsuTtj2RmDKMHhrtdFPGIkB
 IQxuvK8K4tHWvGAZwOZ2Is6P6Wi1kHSiPz3YAjLEvFPfr7L6qzZ0TCj/OtxSuoBm+/3G
 8fNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750421230; x=1751026030;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lG/pp+YecK6TL9JZ8UqalWMy4MkbPjqfLN1AxeBtCuM=;
 b=tUHMPL2m5//P1OqiC+/3mDMM0l8uz+3YJWvHkOi/co23chrmGJNWjeqKsHC3GAWGq6
 AAq7FNpRQnFsmvd6HEXmiGHqO6+O8Eno5ggpOVFXdLNr9mzwiCoG/SJ/8FpBaRC3u0iA
 9rQXD71D5Is2fo1f+5/e1/S0ostPRQ9051uvOYwL+aXG3qAvK0xDtnaqvoNz+JHw+VHZ
 AwVL6QvMXP7lwqcpwv0IMqLiGRNv0azr9Hhs1fz3CiDjkvRlt6SsV9ZetVGPO2MJmQXg
 Kph2epgHfa3cvSIL3TKFGOweAuobpGkulSCODEPVI3lqGHwtDaZaxGpOlSN41sAR1YMD
 BnYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZfc0EcxxOUugVtLLCMtAo24rZr244OxPmc4YeCDbCwERyHYjJuFllzyS+Y/kFMa8d54ufKSjYNx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCIt8R79X4MMRysMWPzAcPpJx3s7XaWypx6fFK0H1SVU2WVWaL
 Mci+rutZmPPOl7o5LV76WRc0AtubD1JFIz45uRVI6S2GJVyskWDveNVFGz438BKMTN4=
X-Gm-Gg: ASbGnct1jbuvmP46OSHHH2BO6zkMwXcQZ7LJ1fNBLUjU9TjJ1jzQxSwbn6LxvCAUP7h
 vD3J7SsBkw0Q01NKjGPl3A19cdWcLwLtdPuPULPalJho1MBIBuMpEig8jw28DH5d1G0jvr/oaz0
 Fpm7oL27U2Dzp3kErsTe6tCzIj02Qzp+QD01tfl8Ur3X5SvAgdFeSUJ8KiHQDWu7p1iM+kHT5pj
 HY5qgSmJue2S8KGf1vcJVM4Mm39wXQS3nOKn2SZ9vwZiWGO/zdRtxk6cl7hfNqmiG7HUJSPBNqe
 KH4uA535lawDDUw9pn1iosMzbMWIy70aDoLMJMgG7E3NKy4JOpQpeWqYMa/N7lFVD4NZy1H5rMA
 +nnYTaOoTHBN1ICMWKNN6RpzIVVvXulM=
X-Google-Smtp-Source: AGHT+IF+wrgDWF2MbI5/b7UwRcOpVaso3voR+Zg/6OIhVMjvknso7RtJOSmtvATMmjnDhH2I7Iju4Q==
X-Received: by 2002:a17:907:7244:b0:adb:2bb2:ee2 with SMTP id
 a640c23a62f3a-ae057f1f567mr241816566b.41.1750421230048; 
 Fri, 20 Jun 2025 05:07:10 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054080a6csm154878566b.93.2025.06.20.05.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 05:07:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 14:07:07 +0200
Message-Id: <DARCJEWMK6C2.21Y93IPCZO7NM@fairphone.com>
Subject: Re: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Hans de Goede"
 <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
 <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
 <cf29862b-496b-4825-aa0f-493eb44838a5@suse.de>
 <DARBA03BEQA1.3KLHCBFNTVXKJ@fairphone.com>
 <4475251a-ede7-42d1-a95e-497e09beba0d@suse.de>
In-Reply-To: <4475251a-ede7-42d1-a95e-497e09beba0d@suse.de>
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

On Fri Jun 20, 2025 at 1:28 PM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 20.06.25 um 13:07 schrieb Luca Weiss:
>> Hi Thomas,
>>
>> On Fri Jun 20, 2025 at 1:02 PM CEST, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.06.25 um 12:31 schrieb Luca Weiss:
>>>> Some devices might require keeping an interconnect path alive so that
>>>> the framebuffer continues working. Add support for that by setting the
>>>> bandwidth requirements appropriately for all provided interconnect
>>>> paths.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>    drivers/video/fbdev/simplefb.c | 83 +++++++++++++++++++++++++++++++=
+++++++++++
>>>>    1 file changed, 83 insertions(+)
>>>>
>>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simp=
lefb.c
>>>> index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc779e=
84db80f7f9b743d074 100644
>>>> --- a/drivers/video/fbdev/simplefb.c
>>>> +++ b/drivers/video/fbdev/simplefb.c
>>>> @@ -27,6 +27,7 @@
>>>>    #include <linux/parser.h>
>>>>    #include <linux/pm_domain.h>
>>>>    #include <linux/regulator/consumer.h>
>>>> +#include <linux/interconnect.h>
>>> With alphabetical sorting:
>>>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Thanks for the reviews!
>>
>> For both simpledrm.c and simplefb.c, the includes are not strictly
>> alphabetically sorted (1 mis-sort in simpledrm, 3 in simplefb), shall I
>> just try and slot it into the best fitting place, or make them sorted in
>> my patch? Or I can add a separate commit for each driver before to sort
>> them.
>>
>> Let me know!
>
> Best is to try to fit it into the <linux/*> block. In simpledrm, it's=20
> probably my mistake. Don't bother with sending an extra cleanup if you=20
> don't want to.

I was mostly asking whether this diff is okay as part of my patch (for
just adding <linux/interconnect.h>)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.=
c
index be95fcddce4c..f2efa4b51401 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -13,18 +13,19 @@
  */
=20
 #include <linux/aperture.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
+#include <linux/interconnect.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/platform_data/simplefb.h>
-#include <linux/platform_device.h>
-#include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/parser.h>
+#include <linux/platform_data/simplefb.h>
+#include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
=20

Or if you want this churn to be a separate commit. Either way is fine
with me, just trying to figure out the preferences of this subsystem :)

Regards
Luca

