Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC804D6D43
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 08:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB2110E110;
	Sat, 12 Mar 2022 07:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE0C10E110
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 07:45:51 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id yy13so23572637ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 23:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4835zrpoRS2nrbhwxOavV/79b/8h8dZXR7yphVPqqJk=;
 b=TGkV97FD5HKzfpXnmTpEW/Y3rJXTQToFDLlcpuzUs2cRYWDYXdNBRlYuU7df1EjlO6
 Njo/xDuI1piuGPGhJMf/8NdaOOZUuysQQpFZB/EkFSsiljC/JpIQpRE+2j0GCgndKT1o
 9re0gBbcqmUf3/Uh3xwhrvLSrmBVgVEQY+HkYS68T7FWgbow4wLJDEAJS2hBLRmRFb/W
 +UOoMa8dLJQTHCi4eVmch/MsFWVEbzq41QFgnxYah6Gem1XhleS08pSQnBCO+VokkhQe
 oTqqAZtE4/gvT+yEEJbQIHGkMNngM+i513CjOk6mwZ4HsonNW2ju8IjCAzFFAU/x0LK8
 AgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4835zrpoRS2nrbhwxOavV/79b/8h8dZXR7yphVPqqJk=;
 b=dkhm9JPYtEeThRuu9BvbllgByx+p/l9vhCpOB4wWCVQcR3QEQLa121eCvheWSgxWhA
 Hc9eZ7etocUqizRRtFvY+Yb7tW9omGrPRshdUmouIAO/xN6Id36d7ZMpnApdppqBbtmF
 xvRDSZ53BwPLfH8aLtQADKpS+FWvUIagE3KIlbzOIR5eMU6eOdODHDGfH7Vk/Wi/r2pO
 ymb906cBCs2B9nUM+IBY5ptJvgcqCfweUJvVCI6xx6rX0y/D6KgmVjwEamDqHaTL7JQw
 yEqWP9P+eKU3iZ+sbUYW/0cR6JiiXOs813F+wwxZWMy/Ufqp542DPhsM/B7LJBrFfoXc
 NbcA==
X-Gm-Message-State: AOAM532bSffbYEHCDBy9k4mI37Kykhii6ZrLfSrgcWnfOreIHsLaoqJW
 edZIqJslOXEUM874OXgdOcftP8yGE1T4gSp1eYc=
X-Google-Smtp-Source: ABdhPJzjtbzf7x03rRzfOfAJe3TZUOVLe4N49aaVEBcQx3Ibw5YAowY/oMZlRD2XUwIFpJXYB297Yu/qIMmSeeNAt6s=
X-Received: by 2002:a17:907:869f:b0:6da:888b:4258 with SMTP id
 qa31-20020a170907869f00b006da888b4258mr11695684ejc.720.1647071149837; Fri, 11
 Mar 2022 23:45:49 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 12 Mar 2022 17:45:38 +1000
Message-ID: <CAPM=9tyAqzcvaba2OffVt_EEP_1tQc3UV6h1J92An0uKOF1TJA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.17-rc8 (kconfig fix)
To: Linus Torvalds <torvalds@linux-foundation.org>, regressions@leemhuis.info, 
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Thorsten pointed out this had fallen down the cracks and was in -next
only, I've picked it out, fixed up it's Fixes: line.

Thanks,
Dave.

drm-fixes-2022-03-12:
drm kconfig fix for 5.17-rc8

- fix regression in Kconfig.
The following changes since commit 30eb13a26014ca640b5eb57b6d010114084d5c92:

  Merge tag 'drm-intel-fixes-2022-03-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-03-11
13:26:19 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-12

for you to fetch changes up to 3755d35ee1d2454b20b8a1e20d790e56201678a4:

  drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP (2022-03-12 17:41:30 +1000)

----------------------------------------------------------------
drm kconfig fix for 5.17-rc8

- fix regression in Kconfig.

----------------------------------------------------------------
Thomas Zimmermann (1):
      drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP

 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)
