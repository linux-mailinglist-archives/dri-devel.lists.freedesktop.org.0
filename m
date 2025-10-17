Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428BBECABE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 10:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FBF10E3D1;
	Sat, 18 Oct 2025 08:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=murena.io header.i=@murena.io header.b="NY8XNLq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Fri, 17 Oct 2025 09:13:03 UTC
Received: from mail2.ecloud.global (mail2.ecloud.global [135.181.6.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4870610EB86
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 09:13:03 +0000 (UTC)
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail2.ecloud.global (Postfix) with ESMTPSA id 36BEC720B9E;
 Fri, 17 Oct 2025 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
 t=1760692007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BtrUe1Xa/80xcMvV7FMu02L5CsCTPdKQgF94JpB/R7A=;
 b=NY8XNLq6o9z7YfK57oO3c9IhGdvRRRGJ+hMP+xTnEFpze4nRe0buV/EikBr+4RLwT98V+/
 VL6a9b8YYG0ZZH9C0YfNmIbaFbAy3rgckoU6guEHqiIoq0tu1ew/Tk7bawtMmg+rdYoxlh
 Zg+cD5i+5MAtf/J1wy6U/digSNoJqBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
 s=mail2; t=1760692007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BtrUe1Xa/80xcMvV7FMu02L5CsCTPdKQgF94JpB/R7A=;
 b=HU5kC9ctsLInAEDp5jXNMdGatGb4gIQN3EIP2l0QkqV1hC0zAn1n8kyxMCDBuNyVTIZRab
 TvP5P91g32al4nTqqnoCHAIUw1grxUY4DHYJqnQzyUvjZD+Qeg3NY7tR7rn0plHHnyEGoh
 Exohf6t1eQCJ+4IVrI36LBSF3dCCbg4=
ARC-Seal: i=1; s=mail2; d=murena.io; t=1760692007; a=rsa-sha256; cv=none;
 b=UdE9mc/509lz95D+Xr9R+oAJEmYQnmJAAJJQ/8yTN1zWcCyBycb4ioxNVqnca7snusbQUx
 NCsDFEIuoIoZON9PkUviLKDJ2pyCIxc0LYlUpxSZ7FcvsvFiSYdYy8BFIJ3zu/f65gR9VD
 QSeKScsdFmkWcFIejhgB8Crfu/5oyt0=
ARC-Authentication-Results: i=1; mail2.ecloud.global;
 auth=pass smtp.mailfrom=maud_spierings@murena.io
Content-Type: multipart/alternative;
 boundary="------------TceQuwZmUaNoBeikk3jAB80l"
Message-ID: <8f1838b1-3027-46a9-9a94-7eac2a3cb4a9@murena.io>
Date: Fri, 17 Oct 2025 11:06:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v8 2/2] MAINTAINERS: Add entry for Innosilicon hdmi bridge
 library
To: Andy Yan <andyshrk@163.com>
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 knaerzche@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
References: <20251016083843.76675-3-andyshrk@163.com>
 <040d8fe8-da2f-4aa5-a2c3-1aec0cf2e8f0@murena.io>
 <671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com>
X-Mailman-Approved-At: Sat, 18 Oct 2025 08:38:36 +0000
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

This is a multi-part message in MIME format.
--------------TceQuwZmUaNoBeikk3jAB80l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andy,

On 10/17/25 10:56, Andy Yan wrote:
>
> Hello Maud，
>
> At 2025-10-17 15:58:22, "Maud Spierings"<maud_spierings@murena.io> wrote:
>> Hi Andy,
>>
>>> From: Andy Yan<andy.yan@rock-chips.com>
>>>
>>> Add entry for Innosilicon hdmi bridge library
>>>
>>> Signed-off-by: Andy Yan<andy.yan@rock-chips.com>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>   MAINTAINERS | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f9f985c7d7479..0adcfb1c264a1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -12299,6 +12299,14 @@ M:	Samuel Holland<samuel@sholland.org>
>>>   S:	Maintained
>>>   F:	drivers/power/supply/ip5xxx_power.c
>>>   
>>> +INNOSILICON HDMI BRIDGE DRIVER
>>> +M:	Andy Yan<andy.yan@rock-chips.com>
>>> +L:	dri-devel@lists.freedesktop.org
>>> +S:	Maintained
>>> +T:	githttps://gitlab.freedesktop.org/drm/misc/kernel.git
>>> +F:	drivers/gpu/drm/bridge/inno-hdmi.c
>>> +F:	include/drm/bridge/inno_hdmi.h
>>> +
>>>   INOTIFY
>>>   M:	Jan Kara<jack@suse.cz>
>>>   R:	Amir Goldstein<amir73il@gmail.com>
>>> -- 
>>> 2.43.0
>> I believe this patch should be squashed into the patch that actually
>> creates the files listed in the MAINTAINERS entry, like I do here [1].
>> Checkpatch should be complaining about patch [1/2] if I'm not mistaken,
>> when you run `b4 prep --check`.
> We talked about something similar here[2]：
> Maxime believes they should be separate patches,
> And I've seen many merged commits in the kernel are also handle MAINTAINERS entry as separate patches
>
>
> [2]https://lore.kernel.org/linux-rockchip/3ygqnj4idey7u4m7ltlv7pnfhkkvcepmpfdijdszctaeopq3ky@qteg33comjl3/

It seems there are indeed opinions about this [3], guess whatever the 
actual maintainer wants is what will happen, sorry to disturb. Would be 
nice to get some central guideline about how it should be. [3] 
https://lore.kernel.org/all/51b72003-e9a5-4f34-ad08-249fc24b3041@kernel.org/

>> Link:
>> https://lore.kernel.org/all/20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com/ 
>> [1]
>>
>> Kind regards,
>> Maud
--------------TceQuwZmUaNoBeikk3jAB80l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="monospace">Hi Andy,</font></p>
    <div class="moz-cite-prefix">On 10/17/25 10:56, Andy Yan wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com">
      <pre wrap="" class="moz-quote-pre">

Hello Maud，

At 2025-10-17 15:58:22, "Maud Spierings" <a class="moz-txt-link-rfc2396E" href="mailto:maud_spierings@murena.io">&lt;maud_spierings@murena.io&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi Andy,

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Andy Yan <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com">&lt;andy.yan@rock-chips.com&gt;</a>

Add entry for Innosilicon hdmi bridge library

Signed-off-by: Andy Yan <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com">&lt;andy.yan@rock-chips.com&gt;</a>
---

(no changes since v1)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f9f985c7d7479..0adcfb1c264a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12299,6 +12299,14 @@ M:	Samuel Holland <a class="moz-txt-link-rfc2396E" href="mailto:samuel@sholland.org">&lt;samuel@sholland.org&gt;</a>
 S:	Maintained
 F:	drivers/power/supply/ip5xxx_power.c
 
+INNOSILICON HDMI BRIDGE DRIVER
+M:	Andy Yan <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com">&lt;andy.yan@rock-chips.com&gt;</a>
+L:	<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
+S:	Maintained
+T:	git <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/misc/kernel.git">https://gitlab.freedesktop.org/drm/misc/kernel.git</a>
+F:	drivers/gpu/drm/bridge/inno-hdmi.c
+F:	include/drm/bridge/inno_hdmi.h
+
 INOTIFY
 M:	Jan Kara <a class="moz-txt-link-rfc2396E" href="mailto:jack@suse.cz">&lt;jack@suse.cz&gt;</a>
 R:	Amir Goldstein <a class="moz-txt-link-rfc2396E" href="mailto:amir73il@gmail.com">&lt;amir73il@gmail.com&gt;</a>
-- 
2.43.0
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I believe this patch should be squashed into the patch that actually 
creates the files listed in the MAINTAINERS entry, like I do here [1]. 
Checkpatch should be complaining about patch [1/2] if I'm not mistaken, 
when you run `b4 prep --check`.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We talked about something similar here[2]：
Maxime believes they should be separate patches, 
And I've seen many merged commits in the kernel are also handle MAINTAINERS entry as separate patches


[2]<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-rockchip/3ygqnj4idey7u4m7ltlv7pnfhkkvcepmpfdijdszctaeopq3ky@qteg33comjl3/">https://lore.kernel.org/linux-rockchip/3ygqnj4idey7u4m7ltlv7pnfhkkvcepmpfdijdszctaeopq3ky@qteg33comjl3/</a></pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">It seems there are indeed opinions about this [3], guess whatever the actual maintainer wants is what will happen, sorry to disturb.

Would be nice to get some central guideline about how it should be.
[3] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/51b72003-e9a5-4f34-ad08-249fc24b3041@kernel.org/">https://lore.kernel.org/all/51b72003-e9a5-4f34-ad08-249fc24b3041@kernel.org/</a></span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Link: 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com/">https://lore.kernel.org/all/20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com/</a> 
[1]

Kind regards,
Maud
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------TceQuwZmUaNoBeikk3jAB80l--
