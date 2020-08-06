Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837DC23D790
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE906E88D;
	Thu,  6 Aug 2020 07:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769406E196
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 07:28:48 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z5so26228794pgb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=IvDXjycJnrN8Jo7WOBOS09G5BUYYTTV0IUIJ9wpcXxQy05TLWKQNzNu8lHaucHzSTl
 y68SIu+ULcnB5LCS2k/2pAog5eVaeK59DOrn7Z4pvWw2CZNrj+VSyTR48547nrbJmXLf
 hNYZIS5cKTNqbnINKSo3O+eKgE+R6PSujzrkqM1SFkprvg6OgiQGp1gZ/TVp04zhgHZU
 BFxDkEwDpOwo2cyhyyzPRFE/ToughqUKSMHPNmIpdlRZm3hwFF8IMHtBGdhpe6Soulnk
 B6+2OMFoiJ5pjrGNm2/n7kLLcolyCh+w87JV4SKPjqbid+Hqb9RcSRjygSIOXlNv8dcV
 UIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=YSocKbx/ZJWOrV+14ry7Es/GqckF6O0K3nD2WkkvQmievr9W5+RDyHDqyNeeEIGJNM
 tRoo8KI6a13bRnRqKAYPhMX4BirufhAtSNEf3HnAsLEkH+xq8QlVyz3iMLfbQIf+5Z1L
 KEpvTJX8wJdmIkzkHHTZxMcKZlAmRwV3Xg7X6MaKkko5wq4YHyQ/RkH6yEfjYabfv3h6
 Wt/9fCiLIA6iyzsRs3dIrY20npewscPXPv4UheQFKW7HCfBtvnyJL7X53SAhY/ZLrf+9
 m4mK657X0jdDGp281h1jKZqSm4/WUxPa0a9U7ddILEYpeaA5sy6UmlMATzeCk1Vj6fN+
 SFQQ==
X-Gm-Message-State: AOAM5325D/pKq4SrBm7TIT0QgUy/qweihCFnzxDoC+8PJBwHEpm1X23S
 zA7oNcg3+fVjlRh4ZNX+EPI=
X-Google-Smtp-Source: ABdhPJxVKJqpZfSMdLJ6I807JIkHlELXYBb82Be8Y42ptKkZOHmfshPFYt72e4K8u4JCl6vyNn+7gw==
X-Received: by 2002:a65:484c:: with SMTP id i12mr6512604pgs.145.1596698928075; 
 Thu, 06 Aug 2020 00:28:48 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id e125sm6654646pfh.69.2020.08.06.00.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 00:28:47 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Subject: [PATCH v1 1/2] video: fbdev: aty: radeon_pm: remove redundant
 CONFIG_PM container
Date: Thu,  6 Aug 2020 12:56:57 +0530
Message-Id: <20200806072658.592444-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806072658.592444-1-vaibhavgupta40@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes commit 42ddb453a0cd ("radeon: Conditionally compile PM code")

Before the above mentioned patch, codes between the line number 547 and
2803 were already inside "#ifdef CONFIG_PM" container. Thus, addition of
"#if defined(CONFIG_PM)" was not required in the patch. It also affected
the "#ifdef CONFIG_PPC_OF" container (line 1943-2510).

From the current snapshot of radeon_pm.c, remove:
    1434 | #if defined(CONFIG_PM)
and,
    2213 | #endif

This removes the redundant CONFIG_PM directive as well as fixes the
CONFIG_PPC (earlier CONFIG_PPC_OF) container.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/aty/radeon_pm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_pm.c b/drivers/video/fbdev/aty/radeon_pm.c
index 7c4483c7f313..b9af70bd656a 100644
--- a/drivers/video/fbdev/aty/radeon_pm.c
+++ b/drivers/video/fbdev/aty/radeon_pm.c
@@ -1431,7 +1431,6 @@ static void radeon_pm_full_reset_sdram(struct radeonfb_info *rinfo)
 	mdelay( 15);
 }
 
-#if defined(CONFIG_PM)
 #if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
 static void radeon_pm_reset_pad_ctlr_strength(struct radeonfb_info *rinfo)
 {
@@ -2210,7 +2209,6 @@ static void radeon_reinitialize_M9P(struct radeonfb_info *rinfo)
 	radeon_pm_m10_enable_lvds_spread_spectrum(rinfo);
 }
 #endif
-#endif
 
 #if 0 /* Not ready yet */
 static void radeon_reinitialize_QW(struct radeonfb_info *rinfo)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
