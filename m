Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67654EFBAC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60C10E0AD;
	Fri,  1 Apr 2022 20:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C235310E0F3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 20:33:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so4248661wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 13:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Lla8R4PXg/dU464Bg728GYNjfxsjGcIx+VuygdwbQXY=;
 b=vt+4iAtzb5kaqgHwNJSBXkqCXXX8qY86z7861l3d9snz3lA6qk0BSWFXeX1pMoznj5
 NDpcKra/UyhUxCZkPF6SAQNqaMb6eN3dPmV2Q7vk/d/R/DlSo4FwP9HZFWRIKB09T7RG
 qhywYWTId1dH1WzC1LOBchmCNDimYOswJu+WAfcCGnqVI03Jw4lXSg1yOdriyD5rRAoe
 MxtgsbGhMpWCTlsJ79zJaCsRN2OL2UU9yvVxHqkIUgemSORHFGy9qIkf/r+f3snHAabg
 vSL6KMkAVAVwrWQ/4Td1RZ1x0dWsEWUJ9tqCmASLqf7zMXZRzI+bk3BXEmYhyUacaBsy
 K2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Lla8R4PXg/dU464Bg728GYNjfxsjGcIx+VuygdwbQXY=;
 b=I17Q9gTp/Qayj6gA/J+Q72u77Uq9COuRvSQZQV7mFxrHHtj0IlLqccsrqP7VKu+JHy
 s5BeiJ4yRjJMTs9yN7gKXLA3b5q60GtMmLDHHhYs0Tm4VFruuzQbhienUJRh2bB0OqIK
 zirmlrrnvw3riAHRSV/LyoVuK7Jf69/dUItCL/sVxmhKDk1uxXWp99r0WPsRv7lGk4zE
 bRIaFqJIQFefjbjcaWETlnXdUuQCiLbuwJG35v0CoGmyjtUcki3oTtOVFoItdDZ7az7y
 avgPkDRMjT/pV07QPk9tTMB2w+r6Oigsg9PDLlIwRHoGEpB29fgwevoneLBMgQnMgOOI
 7UIA==
X-Gm-Message-State: AOAM530GgOARckGeWMn5oKo7aaYB5zmYB6hYskrO2BMGPAPXXST7OmIp
 4Aceq4OU23tEIBXPMd7cssdxPw==
X-Google-Smtp-Source: ABdhPJyAU0HMUKElzMdYCjku6ZPYDX3BM2AIUFITC+RuOtWy0PB9zLwyqmupKopNv/itYzW4ZoajKA==
X-Received: by 2002:a05:600c:3547:b0:38c:92a6:5a17 with SMTP id
 i7-20020a05600c354700b0038c92a65a17mr10270509wmq.20.1648845184241; 
 Fri, 01 Apr 2022 13:33:04 -0700 (PDT)
Received: from bilrost ([2a01:e0a:28f:75b0:dea6:32ff:fe0d:99f9])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b0038b5162260csm3770813wmq.23.2022.04.01.13.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 13:33:03 -0700 (PDT)
Date: Fri, 1 Apr 2022 22:33:02 +0200
From: Anisse Astier <anisse@astier.eu>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.17 001/149] drm: Add orientation quirk for GPD
 Win Max
Message-ID: <YkdhftH7tyPU8Gqt@bilrost>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sasha,

Le Fri, Apr 01, 2022 at 10:23:08AM -0400, Sasha Levin a écrit :
> From: Anisse Astier <anisse@astier.eu>
> 
> [ Upstream commit 0b464ca3e0dd3cec65f28bc6d396d82f19080f69 ]
> 
> Panel is 800x1280, but mounted on a laptop form factor, sideways.
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20211229222200.53128-3-anisse@astier.eu
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I don't think this patch will be very useful, because it won't fix the
device's display orientation without the previous patch it came with,
titled "drm/i915/opregion: add support for mailbox #5 EDID"
(e35d8762b04f89f9f5a188d0c440d3a2c1d010ed); while I'd like both to be
added, I'd prefer if we waited a few more weeks to make sure it does not
cause regressions.

My advice is to drop this patch from all stable kernels for now.

Regards,

Anisse


