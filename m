Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4875F6CAF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AE96E81A;
	Mon, 11 Nov 2019 02:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532B36E061
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 20:07:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q70so7400500wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 12:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:in-reply-to
 :message-id:references:user-agent:mime-version;
 bh=gwf03HQCJcAeKeVV6CDOtpVEM+58xqWFoXIO9s1VR2c=;
 b=SwVzc8bL2Zd3KK+oxxNJ+kiVQkzde841RioVTbXTZm4doMU15w2DSNW1pGGfymbBkz
 qUrh8/sLVW9YhTR/ezrccxGdkdjS5PLV9BsDgvDIAmG+5RooMUECROBV5O8txgV40uFU
 gu0RNb8VENHZf8LKHhkM2M0gF03Fu9I1zzgKyaX0AotT7zKbY+HpZ62C2WWGxs+FnEVC
 wM8fRuRYgbyDp4Jm+cBfmVHiKb2zMEXZaj+S1aCMUCv+cStH4astu0zW/RdzBfq4/mc7
 DZMuoTypi591CR9W8EWFw8rdJHm5BS9MO38dPOWqQ0ju4hu4y5Et4OCT4JrFroha+sgY
 WjPw==
X-Gm-Message-State: APjAAAXUjrMaAp4I3D3HCqi0Hs517nmk6Sj/PWYwoDUFGrlEBDh9WuJo
 mskVaGnHQ2GSGr5xovtkvkQ=
X-Google-Smtp-Source: APXvYqwl9KXzZZqdsQGTX5vggm4+Gvse6h9VoWpyn33lsaQWOqOG4teXB3ND+xZvvQYUQa2fmHTr9A==
X-Received: by 2002:a1c:b1c3:: with SMTP id a186mr10052449wmf.10.1573243675924; 
 Fri, 08 Nov 2019 12:07:55 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id f13sm6612474wrq.96.2019.11.08.12.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 12:07:55 -0800 (PST)
From: Wambui Karuga <wambui@karuga.xyz>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Fri, 8 Nov 2019 23:07:44 +0300 (EAT)
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
In-Reply-To: <20191108160602.GG63329@art_vandelay>
Message-ID: <alpine.LNX.2.21.99999.375.1911082306460.13123@wambui>
References: <20191107092945.15513-1-wambui.karugax@gmail.com>
 <20191107133851.GF63329@art_vandelay> <20191108124630.GA10207@wambui>
 <4996186.DxzAFJqeGu@diego> <20191108160602.GG63329@art_vandelay>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1284482943-1573243675=:13123"
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gwf03HQCJcAeKeVV6CDOtpVEM+58xqWFoXIO9s1VR2c=;
 b=NhDzQyPS3minpgWDPizoGqVOo5LUY7O8ofGjJhFjcBBc0tuZyxmovgfXtvEDtqm6kt
 mAbUOvYMvXf6r2wubPDvUB5Yy3AuG+0bILmDhgKGK5M2SBO6rwpXTQ7ANTanZxpnp9lY
 shWw618Egw0M0qmXLUzqP+VotL72Rbxwo6IsH2N98Kyn3NkwIvaMArjnlkWRPdhIxNzn
 5oSRjKXnIf9Y/nBgd1/K/sQHSg84VlklYgJ8zAs0ELzIRHZ4z1bHMUutqq9VixeCCrKU
 jlUpsfARXvnewUQy2MH2twYVu5srqi8+rErn3h1EFc/y6nouyas0WjWayb5/VMAHwpDi
 gLdA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1284482943-1573243675=:13123
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT



On Fri, 8 Nov 2019, Sean Paul wrote:

> On Fri, Nov 08, 2019 at 03:06:44PM +0100, Heiko Stübner wrote:
>> Hi,
>>
>> [it seems your Reply-To mail header is set strangely as
>> Reply-To: 20191107133851.GF63329@art_vandelay
>> which confuses my MTA]
>>
>> Am Freitag, 8. November 2019, 13:46:30 CET schrieb Wambui Karuga:
>>> On Thu, Nov 07, 2019 at 08:38:51AM -0500, Sean Paul wrote:
>>>> On Thu, Nov 07, 2019 at 01:54:22AM -0800, Joe Perches wrote:
>>>>> On Thu, 2019-11-07 at 12:29 +0300, Wambui Karuga wrote:
>>>>>> Replace the use of the dev_err macro with the DRM_DEV_ERROR
>>>>>> DRM helper macro.
>>>>>
>>>>> The commit message should show the reason _why_ you are doing
>>>>> this instead of just stating that you are doing this.
>>>>>
>>>>> It's not that dev_err is uncommon in drivers/gpu/drm.
>>>>>
>>>>
>>>> It is uncommon (this is the sole instance) in rockchip, however. So it makes
>>>> sense to convert the dev_* prints in rockchip to DRM_DEV for consistency.
>>>>
>>>> Wambui, could you also please convert the dev_warn instance as well?
>>>>
>>> Hey, Sean.
>>> Trying to convert this dev_warn instance, but the corresponding DRM_WARN
>>> macro does not take the dev parameter which seems to be useful in the
>>> original output.
>>> Should I still convert it to DRM_WARN without the hdmi->dev parameter?
>>
>> There exists DRM_DEV_ERROR, DRM_DEV_INFO and DRM_DEV_DEBUG to
>> handle actual devices. Interestingly there is no DRM_DEV_WARN though.
>>
>> So depending on what Sean suggest another option would be to add the
>> missing DRM_DEV_WARN and then use it to replace the dev_warn.
>
> Yep, this sounds good to me me.
>
> Sean
>
Okay, I can add DRM_DEV_WARN and replace it there.

wambui
>>
>>
>> Heiko
>>
>>
>>
>>>
>>> Thanks,
>>> wambui
>>>> I'll apply this to drm-misc-next and expand on the commit message a bit.
>>>>
>>>> Thanks,
>>>>
>>>> Sean
>>>>
>>>>> $ git grep -w dev_err drivers/gpu/drm | wc -l
>>>>> 1950
>>>>> $ git grep -w DRM_DEV_ERROR drivers/gpu/drm | wc -l
>>>>> 756
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>>>>> []
>>>>>> @@ -916,7 +916,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>>>>>>  	}
>>>>>>
>>>>>>  	if (!dsi->cdata) {
>>>>>> -		dev_err(dev, "no dsi-config for %s node\n", np->name);
>>>>>> +		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
>>>>>>  		return -EINVAL;
>>>>>>  	}
>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>>
>>
>>
>>
>>
>
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
>
--8323329-1284482943-1573243675=:13123
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--8323329-1284482943-1573243675=:13123--
