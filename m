Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0D4B3727
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 19:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881B410E151;
	Sat, 12 Feb 2022 18:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4DE10E151;
 Sat, 12 Feb 2022 18:23:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso9148204wme.5; 
 Sat, 12 Feb 2022 10:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=9OHuOKJbgH8itw9N7Okbk0KMW/V0yB0rDcvgbCzUOV0=;
 b=A7o0J6x2xfgsnZEqjw3jFbuYBBni4Tv+mlsISCbWTKTCGRdMPyC1txf4R148E4SF6h
 /cSII785FMECRtktBQiY7VW2WDOqPI4O1l6QkyE8gDfKOVGsJV7uy0kgZOLmkzb6eu7k
 NdOJBX68lVa5KpKEWGfK9ul/LuwblEI3mEKbUkqyysyt0xVUu1iLTp5b3j7WJ0B08Lv4
 4Hg8hQbfuZsaPFZiy6nW3fUbeTeBPu3D7pEGFlfyDoBmMg1aZD4BUWeWOt3v5YjP2EwF
 18l3LuMpXxpr2OaKU3lMyL1fNw47mI1Fb+wKyeMnuhkaO4s+9vIJTHFDXnMXNV7EcFMN
 mqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=9OHuOKJbgH8itw9N7Okbk0KMW/V0yB0rDcvgbCzUOV0=;
 b=I4CMZlHD24myy0Te6E+ikm23y8wk265V3na51T8E7nyQ+hLmSD0cPte0Mx4mbIb8Dv
 IG3e7l87G6ve+7EcSbihui0JBjvSMk4AzTwMoXEwfj2oeYD+17OUJrixwTcwd40IZxrZ
 id6qweGNf2NGzeis2BSEmVPlKV2KrK+TVhKU49S0rv6Y26MeMscFxsdpJIHHVAqEqVV5
 S1prfmPliHEJyY8SjlYwpHu3gCgz4wVJk1npVyg0tpYOP82jHO3LdA/bEwiyNcy+XkMQ
 KJZvpJcX1T65qLaURIqw9N+ok7eCMyv/CV2oobf27kLiAFQpC+vu7/ZA1Qe+/gXDu6Xv
 5nrA==
X-Gm-Message-State: AOAM533ZSvN2mXhhy+bprjk9Uy74lfQM2l/mmLX6Vh4NGU1RT/rlg7we
 VRnrql4ZmBf6t8KIkDG8NLc=
X-Google-Smtp-Source: ABdhPJzxmTgOVXXFWsejdulN4FAuR4wJNcyd7X7eM/NZoFOfS9+zOBb6XM7tmDaofyQGvmR+rJEgQA==
X-Received: by 2002:a05:600c:4e16:: with SMTP id
 b22mr4832663wmq.31.1644690220157; 
 Sat, 12 Feb 2022 10:23:40 -0800 (PST)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id c8sm8619122wmq.34.2022.02.12.10.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 10:23:39 -0800 (PST)
Date: Sat, 12 Feb 2022 19:23:38 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic in
 suspend (v2)") on suspend?
Message-ID: <Ygf7KuWyc0d4HIFu@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, 1005005@bugs.debian.org,
 Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dominique Dumont <dod@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex, hi all

In Debian we got a regression report from Dominique Dumont, CC'ed in
https://bugs.debian.org/1005005 that afer an update to 5.15.15 based
kernel, his machine noe longer suspends correctly, after screen going
black as usual it comes back. The Debian bug above contians a trace.

Dominique confirmed that this issue persisted after updating to 5.16.7
furthermore he bisected the issue and found 

	3c196f05666610912645c7c5d9107706003f67c3 is the first bad commit
	commit 3c196f05666610912645c7c5d9107706003f67c3
	Author: Alex Deucher <alexander.deucher@amd.com>
	Date:   Fri Nov 12 11:25:30 2021 -0500

	    drm/amdgpu: always reset the asic in suspend (v2)

	    [ Upstream commit daf8de0874ab5b74b38a38726fdd3d07ef98a7ee ]

	    If the platform suspend happens to fail and the power rail
	    is not turned off, the GPU will be in an unknown state on
	    resume, so reset the asic so that it will be in a known
	    good state on resume even if the platform suspend failed.

	    v2: handle s0ix

	    Acked-by: Luben Tuikov <luben.tuikov@amd.com>
	    Acked-by: Evan Quan <evan.quan@amd.com>
	    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
	    Signed-off-by: Sasha Levin <sashal@kernel.org>

	 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++++-
	 1 file changed, 4 insertions(+), 1 deletion(-)

to be the first bad commit, see https://bugs.debian.org/1005005#34 .

Does this ring any bell? Any idea on the problem?

Regards,
Salvatore
