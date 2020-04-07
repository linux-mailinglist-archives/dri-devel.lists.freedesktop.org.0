Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F51A0907
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943CF6E7EC;
	Tue,  7 Apr 2020 08:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C006E10D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 06:07:39 +0000 (UTC)
Received: from mail-pj1-f70.google.com ([209.85.216.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jLhOb-0005XE-VR
 for dri-devel@lists.freedesktop.org; Tue, 07 Apr 2020 06:07:38 +0000
Received: by mail-pj1-f70.google.com with SMTP id l9so602737pjq.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 23:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rKcIrGYLaZasUY/dGlYc6IfmlJJj/4gRzNcvO+62t4g=;
 b=hmQekTLJMhZlcD1fqDJrRMjVJ5l9MFGMi96q5niWf3rEXwWxGh1MgvrpmyYINPJzsZ
 oi79ko16eln4aWIJa5ZOfvUV3AB1ggMf8IVnCSA+c95FqslUncooEYShsqxJEC4w3Q7K
 0IEo4Hvwa55UH7rbIUOVmMHB35m1nC8fVCyrNPPJEdazKzbAWwf3BosSqEVRVHjZ/tiN
 1nD0AHt4yYuPiZw6w2TwCT0UtFXlB48VOGVF7q6mHhu6/A8YhpQCOsN1IM4pmK2v4dul
 0ciEsX72FgMmYl54/fxnmYa1Wj3DS5CiYF0FCGlug9JC3ogFqUFPzAnZY40KApGDDOt/
 mWPw==
X-Gm-Message-State: AGi0PuYqu4h19SuGuy1AR5aIIbRBeUmlPGWYf3UIQomSWlqyEpRoeu/S
 JWu4Ft5TqOnewYbGc31t+kmvItnpFg+NtqM5/cGnaGHE4Wf7ZrsDfB+OOATOEo0SgGEwZy0mQBy
 FU5P0SG/BgNFTGHm8lbVPvJmO3dhn3sM69nMrMqO51+wyEQ==
X-Received: by 2002:a17:902:bc4b:: with SMTP id
 t11mr1002695plz.2.1586239656387; 
 Mon, 06 Apr 2020 23:07:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypIIVyuQxWKtSF5cfUw0BN07y2sRFKFXDRNq7JG6JKzUKbDp/X7Mq47CYE5saZCyJub5T1wzhg==
X-Received: by 2002:a17:902:bc4b:: with SMTP id
 t11mr1002678plz.2.1586239656091; 
 Mon, 06 Apr 2020 23:07:36 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id 8sm13108207pfv.65.2020.04.06.23.07.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 23:07:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for HP Spectre x360
 Convertible 13t-aw100
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <41FD4AD2-81F9-45E8-B5D6-9CC255D0581B@canonical.com>
Date: Tue, 7 Apr 2020 14:07:33 +0800
Message-Id: <1F57CA05-3E23-4CA8-A138-6785906ED465@canonical.com>
References: <20200323053528.3147-1-kai.heng.feng@canonical.com>
 <41FD4AD2-81F9-45E8-B5D6-9CC255D0581B@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
Cc: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Mar 27, 2020, at 19:03, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> Hi,
> 
>> On Mar 23, 2020, at 13:35, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> 
>> There's another OLED panel needs to use DPCD aux interface to control
>> backlight.
>> 
>> BugLink: https://bugs.launchpad.net/bugs/1860303
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> 
> Would it be possible to review this?
> I'd like to send a similar quirk for a new panel, and I want to avoid causing any merge conflict.

Another gentle ping...

> 
> Kai-Heng
> 
>> ---
>> drivers/gpu/drm/drm_dp_helper.c | 2 ++
>> 1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>> index 8ba4531e808d..a0d4314663de 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -1301,6 +1301,8 @@ static const struct edid_quirk edid_quirk_list[] = {
>> 	 * only supports DPCD backlight controls
>> 	 */
>> 	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>> +	/* HP Spectre x360 Convertible 13t-aw100 */
>> +	{ MFG(0x4c, 0x83), PROD_ID(0x42, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>> 	/*
>> 	 * Some Dell CML 2020 systems have panels support both AUX and PWM
>> 	 * backlight control, and some only support AUX backlight control. All
>> -- 
>> 2.17.1
>> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
