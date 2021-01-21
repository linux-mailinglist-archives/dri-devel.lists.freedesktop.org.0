Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55E2FE282
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 07:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447096E8CF;
	Thu, 21 Jan 2021 06:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3728E6E8CE;
 Thu, 21 Jan 2021 06:17:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g24so1059470edw.9;
 Wed, 20 Jan 2021 22:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A97A8d0LgZ2piujaXoT9KMxRZfIwdOn8yICKCCnmsVk=;
 b=InwiBaNRflX/xXIUomzBs4/MQ3wlbay5XIF1/yGLV+Yoww2rmIQE79QzAPJr4kEQ5h
 DSKKs6X6ZxAm7dA1OgJnl1kA/dqWRv1FCVDCokt3EozhPKySlyRbmFR/vD529z+wCxh8
 dqo/DJfFAzxhbAPfEsnVIgPHJxkaRpLx9RiG/LvHFkTuM4WFliYQ64qnSA2uW5mMp5vv
 TTby8E3mu01T7TS2z1iWQf/GKM6t9eEtKrhFPXxisXmZ+nTLxn0U9QJQgyQwsexA1+pX
 r8Tnn+xoPzpPI3E+/SAg7lxQPlvghRjuwq4ETJhpB/GfJCTVgVsnzS99Z0qz3Y0zLdS9
 Bs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A97A8d0LgZ2piujaXoT9KMxRZfIwdOn8yICKCCnmsVk=;
 b=kQZZJvf3vVQjkS5djrj6TnqxCv0wBHIFFMkjVOiitFYTIYD3pVj7kYzfCP1guaSWSQ
 JzdUVWJ2ZFbA7UFBAJOkrsIucu7gHZGyJyHebzfPCMjsl2ggZG01pNh7QzKO9s/MCdQ2
 DJGbWUisjaxtriI/K0VaB+jhrsFxVrZPyU9DrLWYWo+zUVzTnKILicCX/VEysMtUt6Jm
 iyTw+ouw6F3st/q6pIPzjJAGBDv1GMfjK5oDIZPrB0XzQK/a6D/3wAy21OPKd1Xwxiib
 mSea5UQ1dAUCAW7MKPIWBMVRhLwwzGfUvfOcOdl8Twa6fUomDZ19XXbyjxX+9+WIbWZl
 p9Vw==
X-Gm-Message-State: AOAM533+IFyJ/eDwcKXU4iIKf94IypsV7W/9cA3nj9uD+ctdYwMTIoTL
 iyX0n3xVaNm/FCuOQvyrJxi2pw4OY3o=
X-Google-Smtp-Source: ABdhPJwiIRJ7qK4nzHotIcGbiO9ReJDksKWwIOlfWy3GuLD7TZsjBKTf2ClpdwykG14YuXzN6GlVrA==
X-Received: by 2002:a50:9f4d:: with SMTP id b71mr9922499edf.310.1611209840425; 
 Wed, 20 Jan 2021 22:17:20 -0800 (PST)
Received: from twisty.localdomain
 (dynamic-2a01-0c22-c84c-8e00-6cbb-50d4-b91e-5b37.c22.pool.telefonica.de.
 [2a01:c22:c84c:8e00:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id w4sm2225551eds.40.2021.01.20.22.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 22:17:19 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Some HDMI deep color output fixes for DC on DCE 6-11
Date: Thu, 21 Jan 2021 07:17:01 +0100
Message-Id: <20210121061704.21090-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

these two patches fix non-working HDMI deep color output on DCE-8.3,
AMD Mullins when amdgpu-kms is used with Displaycore force-enabled,
ie. for radeon.cik_support=0 amdgpu.cik_support=1 amdgpu.dc=1:
I suspect they might fix similar problems on other older asics of
DCE-11.0 and earlier.

Patch 1/2 is a fix for some oddity i found while hunting for the
HDMI deep color bug. It fixes what looks like an obvious mistake,
but the fix did not improve or degrade anything, so maybe the hw
doesn't care all too much about the wrong clamping/truncation mask?
Anyway, it makes the code less confusing.

Patch 2/2 fixes HDMI deep color output at 10 bpc or 12 bpc output
on AMD Mullins, DCE-8.3, where at output_bpc 10 or 12 the display
would be scrambled. With the patch, the display looks correct, and
photometer measurements on a HDR-10 monitor suggest we probably get
the correct output signal. I found the fix by comparing DC against
the classic amdgpu-kms and radeon-kms modesetting path, readding
missing stuff.

Given other encoder/pixelclock setup functions than the ones used
on DCE-8.3 showed the same omissions, i added missing code there as
well, but i couldn't test it due to lack of hw, so i hope that fixes
instead of breaks things on asic's other than DCE-8.3.

I also created a similar patch for DCE-11.2 and later, not included
here, but during testing on a Raven Ridge DCN-1, the patch neither
helped nor hurt. Output was correct without the patch, and adding the
patch didn't change or break anything on DCN-1. Looking at disassembled
AtomBios tables for DCN-1 and a DCE-11.2, i think AtomBios may not do
much with the info that was missing, which would explain why the
current upstream code seems to work fine without it? At least as
verified on DCN-1. I can't test on DCE-11.2 or DCE-12 due to lack
of hw with actual HDMI output. But it would be interesting for me to
know what changed wrt. Atombios in later asic versions to make some
of this setup apparently redundant in DC?

Do you test DC wrt. HDMI deep color starting at a specific DCE
revision, given that the bug went unnoticed in DCE-8.3, but things
seem to be fine on at least DCN-1?

Thanks,
-mario


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
