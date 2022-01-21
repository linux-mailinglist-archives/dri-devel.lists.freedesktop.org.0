Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9A495D99
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 11:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828210E9CB;
	Fri, 21 Jan 2022 10:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE39A10E9CB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 10:17:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id v123so17014519wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+qjyKZOszfxARlUjaf8ExNQkAP8pObI31nb6cY6ygyE=;
 b=Q1L8146j2oVMl5S7ZA5dp36WxXZYEmFQqLOJsBJEnYRnC0GKhsyNxpXqxzcIuhLiXR
 AWjog25dOBimu3Pafw7bfjwJoIL99Uw1wUiO7ABNuu/U86Rh3JYEP2uwthabb90fgNHS
 YxMnC07a3qDk8hS3QfDEoyqOMUm+lKUjGc/PpK++VbX/KyztLmDJGCNCZi+Kh1JCWYdD
 uyQamEsK+V8Ko13zw0w3c9uCeN/gkjCC7u3ByWcD/LPqFV33S45vhxs0tvqvcrFvNgCV
 4EQ4TASBm7FLIRTpvPP51J/v3XdU6srhhn5PKKmsvGO2sFnoFGZa/1j+FSgnE52YGvio
 FqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+qjyKZOszfxARlUjaf8ExNQkAP8pObI31nb6cY6ygyE=;
 b=q/U1L8/0qtNi9dNzwr1F59Gi+yCAE8LovPzXR1dtlVTjbNwcrANFjY5oV4AzQ1P+o5
 4BccIf2UK5Xg7kwcm/tO8OkW54Dhw65tRU+g+ZcfaXWrKiNQT7dyVLJF9CcfK7eiOmeo
 5pz9Z6HeXsiU8tTvd3/UO8yxduyCkwu2YjU2IA7mBAfHemQELYOrv1g++BalFTTZN0jG
 BaJezq1lXgM0lLAto5YfxpWdclh1r1Z62FtW5EBVO+kRcvPpmRCs3Pwn6ZWpvuhuUKBL
 rbGRo3bdFF5jdOiIN4lUsqccl5EIDUC1F7Xcw4JIt4EUZ1APd24L/JaUTnv4FXE13RDA
 WSFA==
X-Gm-Message-State: AOAM532y0mhm487pmCbjI+9AsTnTFVyo7S+64UB/iRux6Z6X56z1vTm5
 uKaGmkBLE5k//4zCfZyrnGETcg==
X-Google-Smtp-Source: ABdhPJzo/PMT8MItnYFhOxxP48Ab+NXa5j0UbzbG5l58oX+SIXHyM3HP7gyFVOAyDxjayedzmb25UA==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr111558wmk.12.1642760271378;
 Fri, 21 Jan 2022 02:17:51 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net.
 [86.15.223.86])
 by smtp.gmail.com with ESMTPSA id b1sm6355459wrd.78.2022.01.21.02.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:17:50 -0800 (PST)
Date: Fri, 21 Jan 2022 10:17:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.17-rc1
Message-ID: <YeqITV9pAyI6clOB@google.com>
References: <Yeg11pHSqx29yg/T@ls3530>
 <CAKMK7uGeGBBvTGFyBxLwvTAxEWwXMS8U1rrYUb_7gbui-jV+KA@mail.gmail.com>
 <87fsph4fr2.fsf@intel.com> <Yep6te0wrK0ZQ8SB@google.com>
 <016269c1-cf56-04ca-91e8-02417f770af5@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <016269c1-cf56-04ca-91e8-02417f770af5@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jan 2022, Helge Deller wrote:

> On 1/21/22 10:19, Lee Jones wrote:
> > On Fri, 21 Jan 2022, Jani Nikula wrote:
> >
> >> On Fri, 21 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>> On Wed, Jan 19, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
> >>>> A first bunch of updates and fixes for the following fbdev & backlight drivers:
> >>>> ocfb, aty128fb, mb862xx, omapfb, qcom-wled, dt-bindings, hyperv_fb,
> >>>> lm3630a_bl, omap2, controlfb, matroxfb
> >>>>
> >>>> Nothing really important, mostly cleanups, const conversions, added null
> >>>> pointer/boundary checks and build fixes.
> >>>>
> >>>> Signed-off-by: Helge Deller <deller@gmx.de>
> >>>
> >>> Not sure whether Linus missed this or just wanted to let the
> >>> discussion settle first. But since this is all random patches for
> >>> drivers that many distros don't even enable anymore there's no issues
> >>> here, and I very much welcome someone volunteering to pick these up.
> >>> I'd expect there's a pile more since it's been 1-2 years since Bart
> >>> took care of these and merged them consistently.
> >>>
> >>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>
> >> ...
> >>
> >>>>  drivers/video/backlight/lm3630a_bl.c                     |  1 -
> >>>>  drivers/video/backlight/qcom-wled.c                      |  1 +
> >>
> >> Backlight changes usually go through the backlight tree.
> 
> Sorry, I didn't know yet.
> 
> > Yes, they do.  How were these applied to the DRM tree?
> 
> I did applied them.

When you apply patches, you should reply to let the contributor know.

> Shall I drop them and you decide about them?

No, there's no need for that.

> Next I round I'll take care not to pick backlight patches.

Thank you.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
