Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D958A094
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 20:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F39894FE7;
	Thu,  4 Aug 2022 18:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A159E9BEC0;
 Thu,  4 Aug 2022 18:37:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p10so730539wru.8;
 Thu, 04 Aug 2022 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=B8IeHwDJ6wqDm/ZlgAQSN22yY4qh5x2F6/SpKGeiUr4=;
 b=RFdiP7g41bMHSuMHMiydnwChvxj1DJWx5rXs+ZgU3/sQs9HhnLQlrPwdGj3Gqqnn9n
 5z9sg2V6E0k2bf4iy5j5GzNAwM16wjfIT7NubNfE2zdsNcVG//wlm3eQozf6aRqWwdzz
 A9oMzSdzLMARXzg3mKeGg+bpOPVKB4zBDazlwiZnS643LJda8iK3l0aclLgfHDlCKHCI
 oMFAW/cnYCqY8qwlYxGNfuu3xlFa0qGS9SKQXnT5H/8U7dkBN8yIo+ciPo49zlXrIu3S
 06w88Fnm55q4Mb2OZaKqYBm+mdk+9S5lzoytIKUoufIHrV/QdZKZjBo0VqJv6UoXJZ8Q
 5bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=B8IeHwDJ6wqDm/ZlgAQSN22yY4qh5x2F6/SpKGeiUr4=;
 b=4RP8rxKBbAGQFZQl+UKxl+eG4srZhecxITrlhCGY8eD2wBMGN3F/F1S8jtlbBaiGnV
 4n+UxD+ZzQPBjJjvZvKZK44YS3ZTCWm72OEOSeuGqSC5ZElkkVX2gAWIy+l1vuuiVq7+
 czaG7T/55nDerz+R6yHfifP5+gY9tHWjPsEFviDgVmMcahGt2m5rCqPAp/CUmln1hSNx
 gdYChDiYNLawj/DRlDyWHtFzQywd+hblbceHNWqaAAGvo+Hd7YYoL2Q66OHLwzNy4Bwb
 uJbZfSx8hlT9amOF/SdtSSWoe1GB+DpPrLYjj4Pt06vUFRIZGgItqq4BtD3wn1MdsvgO
 JneQ==
X-Gm-Message-State: ACgBeo0toy8CCg+m2hLEE1xKxPHoHCJn6dpg1kUMNcVdb2QBYzmTERre
 lFdP2BRVBz0gqqBtuNhv0uGW6FVQPaw=
X-Google-Smtp-Source: AA6agR6BXtu4trhevGRN8TVyo6MRrwFBM4GRm3VN7u8yo8mEIkgNVkRgvawIxNMQllSvIRGPR7rAVA==
X-Received: by 2002:a5d:4f86:0:b0:21e:f78b:33f1 with SMTP id
 d6-20020a5d4f86000000b0021ef78b33f1mr2331775wru.38.1659638228064; 
 Thu, 04 Aug 2022 11:37:08 -0700 (PDT)
Received: from debian ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adfe6ca000000b0021f0cf9e543sm2070037wrm.2.2022.08.04.11.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 11:37:07 -0700 (PDT)
Date: Thu, 4 Aug 2022 19:36:57 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: mainline build failure for x86_64 allmodconfig with clang
Message-ID: <YuwRyQYPCb1FD+mr@debian>
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
Cc: clang-built-linux <llvm@lists.linux.dev>, David Airlie <airlied@linux.ie>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The latest mainline kernel branch fails to build for x86_64 allmodconfig
with clang. The errors are:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3596:6: error: stack frame size (2216) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2184) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1726:6: error: stack frame size (2176) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)

git bisect points to 3876a8b5e241 ("drm/amd/display: Enable building new display engine with KCOV enabled").

My last good build for clang was with e2b542100719 ("Merge tag 'flexible-array-transformations-UAPI-6.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux").

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
