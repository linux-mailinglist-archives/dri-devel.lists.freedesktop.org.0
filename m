Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38859173D2F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 17:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9913A6F478;
	Fri, 28 Feb 2020 16:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68C96F478;
 Fri, 28 Feb 2020 16:40:33 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c7so4086552edu.2;
 Fri, 28 Feb 2020 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=LBzqVgkSBMQoXRl/FnbNZpFHPZCwyHEtb7aUpugamR8=;
 b=gsw4SLW5qCHuoB7Q0zIyZ58tQGhNAJBs9d5H0Qn3wXzcqmGMfbyI21UdDwtf6PgQby
 ckO2iRD7WDVsQpPh2Ckqotcb6Ybl3zsePd3UwVf5c7GA0A3HRwwUAgHxuhtqDERguWZH
 MYMhHmCUAmggzDMoihqnF1EXIfkhyILA+vhuR6h16d4H3pfer/DS2BGaOWRM9Oci9Fui
 y6ScH2YNMQbExT6wFd51vyRpbwKYM1qv1qsp2op+eNFsoAeIWP/31CUxcUnDRi1l16Jm
 ddZKpMrkOTrhR7MjFmo+gJuna9y0sQJLo1tinoWdzktkiEnWmSa1jOzYP7e7nyKizuJo
 vrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=LBzqVgkSBMQoXRl/FnbNZpFHPZCwyHEtb7aUpugamR8=;
 b=ThVV98v1rd1dziwwPI0Zu6V6doIhBtRRepSAb85Tg7RulmETFVOvSBwp9Wsnc5N4H7
 UfVvKpZAdE+W/WkBsqc/aoAViA7ADDskL1pvqNEyAnponP9GvakIUJNHaB9HwS47ZO9B
 ca4deQFxWjwDMMGJA6hWWqVVMf2xKnzCI7LkYJew312EWHrBlJdC7Wz9884upAoGsyYm
 IJ8isI7avsNPN9/ZOdGmOkbX3U9aJmOSMJCOMOVJypLhpspWvqElcXvFWff8HDc51LuK
 f0TSkjYKvO+CUuWAaUB5jF1B37cdSW0i9hWhTSTD0FtCXcembwIpZkee3gfjc9ybYYjf
 rCcQ==
X-Gm-Message-State: APjAAAX8lRE4NNTagbywwSkx+3GHMGTSiy6OiWAAodquGlE6PwQupQu/
 LrkLhCLLcDXsUx1DRs8Hlu4=
X-Google-Smtp-Source: APXvYqx+jWTwk6LGNR0+pA91pM1SSnE6oXHjqXSaoPZBTrWH6xMCWtiZpQzRjCndL4ZT2Uqx+dLWcg==
X-Received: by 2002:a05:6402:cb7:: with SMTP id
 cn23mr5020041edb.72.1582908032490; 
 Fri, 28 Feb 2020 08:40:32 -0800 (PST)
Received: from smtp.gmail.com (1.77.115.89.rev.vodafone.pt. [89.115.77.1])
 by smtp.gmail.com with ESMTPSA id r19sm104180eja.5.2020.02.28.08.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:40:31 -0800 (PST)
Date: Fri, 28 Feb 2020 13:40:23 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v2 0/2] drm/amd/display: dc_link: cleaning up some code style
 issues
Message-ID: <cover.1582907436.git.melissa.srw@gmail.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset solves some coding style issues on dc_link for readability
and cleaning up warnings. Change suggested by checkpatch.pl.

Changes in v2:
- Apply patches to the right amdgpu repository.
- Remove unnecessary {} added in the previous version.

Melissa Wen (2):
  drm/amd/display: dc_link: code clean up on enable_link_dp function
  drm/amd/display: dc_link: code clean up on detect_dp function

 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 64 +++++++++----------
 1 file changed, 30 insertions(+), 34 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
