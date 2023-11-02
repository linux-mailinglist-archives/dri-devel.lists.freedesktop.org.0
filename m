Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F217DEEEE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443D510E835;
	Thu,  2 Nov 2023 09:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9667810E835;
 Thu,  2 Nov 2023 09:32:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40850b244beso5384925e9.2; 
 Thu, 02 Nov 2023 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698917532; x=1699522332; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WqxvJKYv5vpdTxmgr1nqq+qFlX0PIIBhjoeGRz1GRg8=;
 b=fTcFR3GHGY5TMU4BdDqHfms2H3gf8INCaww9Vc0iD7T2mJJUdcY6Q8qhOpsEzZi/Qe
 tiP1qDKZztlsFQKf6SaxHHeE5uBA86RO1nvsP220NK/MxN/6mjV+bx4DAX7C8Fdabyh4
 V2I4U1UWdSupsBnAhxbpS+8xQ1xWZGfPWhCQjgwV7PzA9MtUuybt/Cn6TgLr5CBQqnFc
 0G85XfcyYx3AoQ1a5UriJEGH3B7Bwn5WtNFFnaUaCGVMkyufQdUNVihh5pjB+oAX9X3b
 Jl5/f1jW+MUaAArkHqOZOtTmjCG7/jr62AatItijqdwv/Dizjaq24xLMHsBtC01BZGXA
 bZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698917532; x=1699522332;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WqxvJKYv5vpdTxmgr1nqq+qFlX0PIIBhjoeGRz1GRg8=;
 b=ouk8biHHHfH7gkhcxoVV2XJlKBY0nBw2VHkQekRWU191iIzflnqV1mdVTn4qkiHJQx
 emwm2xjgDEZFod1+gXD45wX9eF2vjtXAKRPnQ/UOusfpanWE4oHeYZ5mQ3vJiPiUqUAg
 NUks4tg6UmoRhxnVXAt/5kltS7zKqF+fY7cE0SbC/zoDCgpSVMOI9RQVEId7GY6JrV+o
 M0Bh+iv+g43he2I618kpaJd3s+V0zztveq30oup5itQxGjcGrBLGXcw6hOiNwpMGLwp4
 RjsoJ+ijGZNOhtm9gutqChAnSjyedydX0qVKF3EXCIdV4ckMCw6azBZ3eMZsmqONbp1Z
 Vgbg==
X-Gm-Message-State: AOJu0Yx/5pGvOP1mTW7Iwo9LUFCqTpMHfbcWR2yjyIqr0xkO3eH2qxY+
 WTFk/jEVgUu+I1Swn1Vg2hk=
X-Google-Smtp-Source: AGHT+IHc0wpbmRp2tgf8ByRrDxa2IV0hXvaKz5WVhrwURQsV1he73lF5J1ODWGCP4OWwTpvppn7IUg==
X-Received: by 2002:a05:600c:5119:b0:409:2f7:d771 with SMTP id
 o25-20020a05600c511900b0040902f7d771mr15550596wms.4.1698917531582; 
 Thu, 02 Nov 2023 02:32:11 -0700 (PDT)
Received: from debian ([167.98.27.226]) by smtp.gmail.com with ESMTPSA id
 z6-20020a7bc7c6000000b00401d8181f8bsm2240311wmk.25.2023.11.02.02.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 02:32:11 -0700 (PDT)
Date: Thu, 2 Nov 2023 09:32:08 +0000
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
Message-ID: <ZUNsmJGbYwgPaUpY@debian>
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
Cc: regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 "linux-kernel@vger.kernel.orgLinus Torvalds" <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The latest mainline kernel branch fails to build x86_64 allmodconfig
with the error:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 6707 | }
      | ^

git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2")

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: 7966f319c66d9468623c6a6a017ecbc0dd79be75

-- 
Regards
Sudip
