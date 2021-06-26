Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D73B5979
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7A56E221;
	Mon, 28 Jun 2021 07:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AC76E9CA
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 08:33:56 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d11so13458427wrm.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0BmE1vieJjpmwVPE3TFArQhsrXaHwB+6efFDaJCHBL8=;
 b=isGByER2yEl0MYzeK0LOmniKQhWYeR+HhU7ZMZsP33vqx7JR6e9F3R68B5Lt5jb5oy
 Y7WU3pBAOBXcOTOUuuSsTgq3410M8bQ89KPm+G+S51o7w9iCZQhte9o4w28M3rJEzvlY
 gfYxpQIvS5ElkArj1M34aQ+s6XZUzKoAXgpu4tGO48EB0s1yJ/OEDRfXBqC1wMyoADzY
 ZVI0yfAymLXvcOnMSFMSITu0ZGiDPDRIG4Lz8eoZJdJkbpq3lr+2yM3C4erYU6PAysZY
 tEhprTS3kpzJ+cy/+YcoqQWrdk8avvKo5S3EG2+l0vybhs+b1M5VPtto8e6n2BlM6SUV
 xgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0BmE1vieJjpmwVPE3TFArQhsrXaHwB+6efFDaJCHBL8=;
 b=tH5wnzjeuUjPEpOGcy85lNoiHHPtjcgVxd43RI9biGNxq14zeFR7YxCI+0JetHzUG2
 WdGypXMTyWM127KiDBdf6cxPoQcbGe9rkqahkAUFon3V5OUMji1dLcjROQlw4x0dMxt+
 0Vi6Mx2CObEIolNsoEuPWbH+zmksgwYgyC23XCAKZ8a8kC9n7uh9rLg6UzrAhcTCUsj5
 zsJqKfVQlJb+Y51JjKW+fQ44VL5bZLdYyqlNmADvOAqyul6r0uZkcovF40f8yiNIKGyO
 +cmYpY6h3diuSMDEj1xlqQNPLOBByR4EJoDTzOb/MRxxnjMLu+iGrRlbMSSaF+BgvHo4
 iJyw==
X-Gm-Message-State: AOAM533QDJFk4I01mf4wj1ulOJJqxCiLiGcbRnKhkFvbMA/oJ/oSmvAr
 eIKLcpM3+ghyElXGHoebYQ==
X-Google-Smtp-Source: ABdhPJwR+CAGf0xPnXsVekgBRBoHQUEAfPeUCeRo7NAConWkvU53Cpfndoqnj5pfmWE7I63TAIaY1w==
X-Received: by 2002:a5d:5919:: with SMTP id v25mr15338955wrd.319.1624696435125; 
 Sat, 26 Jun 2021 01:33:55 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de.
 [91.67.75.139])
 by smtp.gmail.com with ESMTPSA id k4sm495958wmj.19.2021.06.26.01.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 01:33:54 -0700 (PDT)
Subject: Re: [PATCH 09/12] media: hantro: Enable H.264 on Rockchip VDPU2
To: Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-10-ezequiel@collabora.com>
 <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
 <c882d9c4f9eacd9d0f82e6e4ce3b33c383087d8c.camel@collabora.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <1979d843-129a-8b48-2926-0f50157974ec@gmail.com>
Date: Sat, 26 Jun 2021 10:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c882d9c4f9eacd9d0f82e6e4ce3b33c383087d8c.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:06:06 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ezequiel,

Am 26.06.21 um 02:46 schrieb Ezequiel Garcia:
> (Adding Nicolas)
>
> Hi Alex,
>
> On Fri, 2021-06-25 at 01:13 +0200, Alex Bee wrote:
>> Hi Ezequiel,
>>
>> Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
>>> Given H.264 support for VDPU2 was just added, let's enable it.
>>> For now, this is only enabled on platform that don't have
>>> an RKVDEC core, such as RK3328.
>> Is there any reason, you do not want to enabe H.264 on RK3399? I know
>> H.264 can be done by by rkvdec already, but from what I understand that
>> shouldn't be an issue: The first decoder found that meets the
>> requirements will be taken.
>>
> Thanks a lot the review.
>
> I really doubt userspace stacks are readily supporting that strategy.
>
> The first decoder device supporting the codec format will be selected,
> I doubt features such as profile and levels are checked to decide
> which decoder to use.
>
> I'd rather play safe on the kernel side and avoid offering
> two competing devices for the same codec.

I wasn't aware of that. Current ffmpeg v4l2_request implementation seems 
to not do VIDIOC_ENUM_FRAMESIZES - so we might end up being able to 
decode up to 1920x1088 only if hantro decoder is picked/checked first.

Thanks for pointing that out.

Alex

> Kindly,
> Ezequiel
>
