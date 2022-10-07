Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3945F72FB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 05:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47DE10E906;
	Fri,  7 Oct 2022 03:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBCE10E906
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 03:03:38 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x59so5277679ede.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 20:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6/aYioF4N5ThTyHVeNoYcSeTR8mlwsDHQnEmk6vsWyk=;
 b=gmrIKuwlQuZQtmboltbIB71xhEuRmUxCcRm4pm4YJux0WLpJoGR+6eRFJsaQE9zGtC
 XzDK8wXvny2ImNsTZEgNZwcdguv+LMBc8HtsRdImlL0gKToERpQuLPjZNr4RstlniC4n
 6FsV9tryo2dVcOmp45gp9fqHJoiR1QqYowXRPzHjimTp/TKy0K9Wiv1wJd0t+J+d8z1J
 LHlr6K0B1+EVEs/c6ttJW0XqWVhwDYG8XQL1o/mPEG789FmVTx9RfQCVrFwJT5ekK0sO
 JbPDTjw2AFxxlqxNJfi8iO71gWbCU0T7jlJ3gfOPc23zS+7TbBCnG7Ekt3SiFvLRgD03
 buzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6/aYioF4N5ThTyHVeNoYcSeTR8mlwsDHQnEmk6vsWyk=;
 b=TCOtREOx80glD+MT4dXJOkHqKey0IPRjnZaogumEUAB6EyR7CsUXT/rNoujtBEDJKv
 0/d33cT6VYZfgrLgh22LBphktWux0PKU1Kb5len2HxvS6BNOzQ/wDBMFeUOVpgCmxsrm
 Z4iEBZkYp+f2TDkq9Jqe3gR/24PxLL9LaPP3akw9tkUvZmAYazQuS5uDu9hTrpdvenHY
 6OiQ1shn1U09b4MBFNuQ4I2ESNWcvbuNZ37Wi1HMsq40tmpOmAjSD7iDzwWTNUBo9w0B
 jxpnMawYP/VRkudtsiZgSG50hDPos0s8fZ4p7nxHZHC7G8q6uGNWCUTgGXRW6S9zKpDe
 dw1A==
X-Gm-Message-State: ACrzQf1S+RGiYMvRUPhyKI7N83jt6p3sy4x0Tp3t4AfTXc9ZZ0nFDvAV
 YDFCyvFy7bUI+P9FSzD25kYgkZ+vk31yPPAsDGg=
X-Google-Smtp-Source: AMsMyM6PQJQsK3xI5al/3JWJB4uphl/G9uZ9iXZo9hJPw8zdzuPKbI4MsJQgPVjzUaBLaivCBPEqBPo0K/0usIHWE80=
X-Received: by 2002:a05:6402:5c9:b0:446:fb0:56bb with SMTP id
 n9-20020a05640205c900b004460fb056bbmr2647543edx.173.1665111817323; Thu, 06
 Oct 2022 20:03:37 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Oct 2022 13:03:25 +1000
Message-ID: <CAPM=9tzQnonp1KDSZ7ziUNdm8EfJX=VhmE9gA4L8wDO_AoYLuw@mail.gmail.com>
Subject: [git pull] drm regression fix
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This reverts the patch I found with rough bisection to instability
around fences and the oops I got from netconsole.

Christian, I tried the two patches from drm-next, but the oops still
occurred, a good reproducer for me was to run vulkan cts with
deqp-runner in parallel here.

Regards,
Dave.

drm-next-2022-10-07-1:
drm fix for 6.1-rc1

sched:
- revert patch causing oopses
The following changes since commit 65898687cf7392c372ea8d04a88617e2cb794465:

  Merge tag 'amd-drm-next-6.1-2022-09-30' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-10-04
09:42:24 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-10-07-1

for you to fetch changes up to bafaf67c42f4b547bf4fb329ac6dcb28b05de15e:

  Revert "drm/sched: Use parent fence instead of finished" (2022-10-07
12:58:39 +1000)

----------------------------------------------------------------
drm fix for 6.1-rc1

sched:
- revert patch causing oopses

----------------------------------------------------------------
Dave Airlie (1):
      Revert "drm/sched: Use parent fence instead of finished"

 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
