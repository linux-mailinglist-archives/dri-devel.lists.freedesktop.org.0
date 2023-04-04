Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A106D5FF5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F2910E25C;
	Tue,  4 Apr 2023 12:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE3210E1E8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:14:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ew6so129628033edb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680610495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ghmTYqJOyZOn2MTihV4T6tw9iNwJh1T6pNKtc6GlOxE=;
 b=h1PzQUMXt2Uk/Ldc2XTLIZtB3WPQOEdRjphdDOBgAEcm1KmHS76fpTq5BoiDONEemN
 mBisOKtJ8ujURSQl5crnW6uhdg3juvp/K9EysVzMQ9nUO6H5kxdkq6ZY0Fi9LhrgBpC4
 c8E5273o0S9gIzLnlWjV/z2CbRntYc4r0Xr+Aa1T47YEgCnjPkZD9AKFv3F/vAZdJLHb
 9AXxhgMCsrDibV+Bz7Tt+Ic/a8QU9bsmhvrpL1e+y6H6mT6YJRsRL6LNQuQxxUf+Z3Mx
 uoDrk5agmiPHcZ6RyPcdrRFk8TxNjwVeU7jRj699oW3TBJCHeAg9+D7u8qimvVdFQ/+0
 nrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghmTYqJOyZOn2MTihV4T6tw9iNwJh1T6pNKtc6GlOxE=;
 b=8KPoLZnvf+DUYjFDeJbWZxRyZXougvrO6GfhYlLyENaJleifDSzse5n7T+NUh66f4m
 03qNM+dptRCs9pMwPpDICrbXL6mv3xZI2ev94hL1IOn0SraId6CdkaQAynFXJFjw3WEK
 G0+wYWPu1q1RI7o/eEvJ2+JgLKQoQMFESzBpuZuGwaS9WIdZNWGhgNX1eyhhKiz9R59N
 PgjWIG7VKetICNq8qyM0dr4HQ5gJ9k5VIyYnwvspO08PFGD4/+LJOoO29rpPXf233kMl
 /7UPJhPh7w+plPOeYIg3wX/vgXzJGT8mesxRe2nhoX2L9v5QlDneKJ7VFRLxaZ91+aGu
 gPwg==
X-Gm-Message-State: AAQBX9dM4AnuC3ieX4GzC7PS3/FbTGmJ2NFw5rYFOVt37cKCujqNFW3J
 96mWXEEwVG5hmwjkiUFnpiw=
X-Google-Smtp-Source: AKy350ZfGorSMIPnJg72IcXpSjnoQ7lSIoJ5Al8iPen06Hp6G0tNLsCirKTEXy26ryySRml3WIgiVw==
X-Received: by 2002:a17:906:13c2:b0:8b1:fc1a:7d21 with SMTP id
 g2-20020a17090613c200b008b1fc1a7d21mr1724192ejc.5.1680610494608; 
 Tue, 04 Apr 2023 05:14:54 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a1709060b1900b0093e39b921c8sm5850341ejg.164.2023.04.04.05.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:14:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thierry.reding@gmail.com
Subject: Re: [PATCH] drm/tegra: allow compile test on !ARM v2
Date: Tue,  4 Apr 2023 14:14:45 +0200
Message-Id: <168061024447.2054665.2842597656281966346.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322103915.376533-1-christian.koenig@amd.com>
References: <20230322103915.376533-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Wed, 22 Mar 2023 11:39:15 +0100, Christian König wrote:
> This compile tests on x86 just perfectly fine.
> 
> v2: fix missing include complained by kernel test robot
> 
> 

Applied, thanks!

[1/1] drm/tegra: allow compile test on !ARM v2
      commit: 224718f4e59442e205524c7307815f09148f051b

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
