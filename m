Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA623285967
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A006E8A4;
	Wed,  7 Oct 2020 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA056E895
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 07:01:36 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kQ3SA-0007FL-Ua
 for dri-devel@lists.freedesktop.org; Wed, 07 Oct 2020 07:01:35 +0000
Received: by mail-pf1-f198.google.com with SMTP id a27so844279pfl.17
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 00:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aDHyXgdm7hfW/ykfIHC0qVcjekojXJSCsJVjtCVF1oQ=;
 b=efHGvsoCViFILcPoxCLxESJK+31nFUsjC0EuBIjn6JjnD9bale8vOxL7xy6H/wTOlj
 U5d+dPciZ6+7kHG4nqrCuheTE/KE7xy2rqQ4S3Dt5RaFl3/5wk+PFp+c4XbhNLJjBkNl
 9hsmkfXzgoipgvPNfKOGCtI6E/b/Jdp9xzLZq+O2mGGTQ1Eu0iFguxjSHwJWurZUbmzT
 eGSwkZNr9Z1jWi1SDgj8BOEntsLQGajBygSe7LmC3hiP6TxDiY+xMa6rTOz5EozgGcTn
 lypLzFgNNDWWM6QuNIOuBYxfZ6yXr8ckG0J74zyTInB6N+OuIrGHgzvod74FPc45bElO
 j8Nw==
X-Gm-Message-State: AOAM531o/f+UCO9qsMKLf6aZiWfD92wAJHHI4DQ19Yb4ir6KQhUXI8LC
 XZGo0RVywZ8aH5C8k/7u3xRohcGSdcb7Oj8lfz0rQve1Lsr1+qAw5SNsrD0rLCHOoK+mQ8wVJMu
 2NFUiy6WZv/9KEE5MDaLUF5431zJNcvHcdut/L9xRUiaq2A==
X-Received: by 2002:a63:d841:: with SMTP id k1mr1795048pgj.59.1602054093133;
 Wed, 07 Oct 2020 00:01:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDljykDoJqTzxAjBt18ADgzxnYunTaOiFk7PoEw1AcsgiPaYLQ3RAoRNnmkHOyz/1LFkWBCw==
X-Received: by 2002:a63:d841:: with SMTP id k1mr1795028pgj.59.1602054092790;
 Wed, 07 Oct 2020 00:01:32 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id b2sm1603211pfp.3.2020.10.07.00.01.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2020 00:01:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for HP Spectre x360
 Convertible 13t-aw100
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <87mu7migqq.fsf@intel.com>
Date: Wed, 7 Oct 2020 15:01:29 +0800
Message-Id: <7436CB1B-FB93-4D74-84E2-B7CCB9E6C38C@canonical.com>
References: <20200323053528.3147-1-kai.heng.feng@canonical.com>
 <41FD4AD2-81F9-45E8-B5D6-9CC255D0581B@canonical.com>
 <1F57CA05-3E23-4CA8-A138-6785906ED465@canonical.com>
 <87mu7migqq.fsf@intel.com>
To: David Airlie <airlied@linux.ie>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Apr 8, 2020, at 15:22, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
> On Tue, 07 Apr 2020, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>> On Mar 27, 2020, at 19:03, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>> 
>>> Hi,
>>> 
>>>> On Mar 23, 2020, at 13:35, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>>> 
>>>> There's another OLED panel needs to use DPCD aux interface to control
>>>> backlight.
>>>> 
>>>> BugLink: https://bugs.launchpad.net/bugs/1860303
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> 
>>> Would it be possible to review this?
>>> I'd like to send a similar quirk for a new panel, and I want to avoid causing any merge conflict.
>> 
>> Another gentle ping...
> 
> Can't really review, but if you say that's needed...
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

David, 

Can you please merge this patch? Thanks.

Kai-Heng

> 
>> 
>>> 
>>> Kai-Heng
>>> 
>>>> ---
>>>> drivers/gpu/drm/drm_dp_helper.c | 2 ++
>>>> 1 file changed, 2 insertions(+)
>>>> 
>>>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>>>> index 8ba4531e808d..a0d4314663de 100644
>>>> --- a/drivers/gpu/drm/drm_dp_helper.c
>>>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>>>> @@ -1301,6 +1301,8 @@ static const struct edid_quirk edid_quirk_list[] = {
>>>> 	 * only supports DPCD backlight controls
>>>> 	 */
>>>> 	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>>>> +	/* HP Spectre x360 Convertible 13t-aw100 */
>>>> +	{ MFG(0x4c, 0x83), PROD_ID(0x42, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>>>> 	/*
>>>> 	 * Some Dell CML 2020 systems have panels support both AUX and PWM
>>>> 	 * backlight control, and some only support AUX backlight control. All
>>>> -- 
>>>> 2.17.1
>>>> 
>>> 
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
