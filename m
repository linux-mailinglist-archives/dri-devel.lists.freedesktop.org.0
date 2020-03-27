Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9E19752E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E16E05F;
	Mon, 30 Mar 2020 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB926E094
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 11:03:35 +0000 (UTC)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jHmly-00008C-0c
 for dri-devel@lists.freedesktop.org; Fri, 27 Mar 2020 11:03:34 +0000
Received: by mail-pl1-f200.google.com with SMTP id 64so6711074plf.19
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 04:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=4crqkcDa1cMvjuMptqnnf+6Biw5Iu2+wMpwA6yeSEso=;
 b=rjMh72+LmZhMIMWylT/ishlT99lVeyzlFnL1+I4qhz5A6y1cAuSYyQDt4yT2z1S+A+
 Q5OyeZUFVWGrmuHbPdgcHDxPnTcgqWS5j9kgU2+gOsLGmeHPENs/Rd5Jq4CEAuGxsshP
 XfK3N0/8G0kTkNrrO2iw/SxW+OtqIW8FxEsmy9Fw4p/Kb9pyX6fvWv64cS97nYPzwb9t
 AV6Thj2Tlk+6wYp2QOXSKyNPSiPO/279NfxPrJn0ZqFKoB5digYQ/RzjQGdSxYzJkPNG
 KTsXU+xRrSOqiVrrh5FiHaTC2WQ4gNVHVet/vN1z0h56tcOSAGAmFY5Qu+4ptD8t0I+T
 IgoA==
X-Gm-Message-State: ANhLgQ2TYFH0BVEa8olR4mLGZ/Oc2wp+qwR/AdXJTwsVmjvDHlX64Fzc
 vhTlbGS+cEqKPNNdL6i5rBh4uJI1HLNOjDwLdda8Ir8loaYtEKJygzjiAcavDtt5iB7vbZ3kpDA
 TWx76/YhBlZgXokBEF3w/cFxCDKzUitd1zFWIgxJSOOg41Q==
X-Received: by 2002:aa7:9566:: with SMTP id x6mr14121997pfq.104.1585307012291; 
 Fri, 27 Mar 2020 04:03:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuxxfXRfgKbsH0hsGV8BhF/ACIktFsowvrKfYYjdEGovkm+Ou4UR209n3gvSkXPfi+rEfp2OQ==
X-Received: by 2002:aa7:9566:: with SMTP id x6mr14121922pfq.104.1585307011385; 
 Fri, 27 Mar 2020 04:03:31 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id i7sm1784358pgk.15.2020.03.27.04.03.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Mar 2020 04:03:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for HP Spectre x360
 Convertible 13t-aw100
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200323053528.3147-1-kai.heng.feng@canonical.com>
Date: Fri, 27 Mar 2020 19:03:27 +0800
Message-Id: <41FD4AD2-81F9-45E8-B5D6-9CC255D0581B@canonical.com>
References: <20200323053528.3147-1-kai.heng.feng@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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

Hi,

> On Mar 23, 2020, at 13:35, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> There's another OLED panel needs to use DPCD aux interface to control
> backlight.
> 
> BugLink: https://bugs.launchpad.net/bugs/1860303
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Would it be possible to review this?
I'd like to send a similar quirk for a new panel, and I want to avoid causing any merge conflict.

Kai-Heng

> ---
> drivers/gpu/drm/drm_dp_helper.c | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 8ba4531e808d..a0d4314663de 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1301,6 +1301,8 @@ static const struct edid_quirk edid_quirk_list[] = {
> 	 * only supports DPCD backlight controls
> 	 */
> 	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> +	/* HP Spectre x360 Convertible 13t-aw100 */
> +	{ MFG(0x4c, 0x83), PROD_ID(0x42, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> 	/*
> 	 * Some Dell CML 2020 systems have panels support both AUX and PWM
> 	 * backlight control, and some only support AUX backlight control. All
> -- 
> 2.17.1
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
