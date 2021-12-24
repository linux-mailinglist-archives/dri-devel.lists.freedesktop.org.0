Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCFC47EF65
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 15:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B54F10E464;
	Fri, 24 Dec 2021 14:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B1B10E464
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 14:12:31 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id mj19so7756312pjb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 06:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VtPf/Iw3oKW7SjqgJKtt+Q5d6Jb37vINBRVmuoZAHlw=;
 b=ENc6ky9e/mt/VRWpBsDP/fT+YyPj602j72RD0InZqfV4ILpG9XdJYMiYd+/SP4Rutz
 jjIEw7ZD8vEHFsdIW+Rl5y5TCsAMPxqDcJr+tghirPYRPDL8xErWN+sT30KOVtTUi7ak
 MDhyEXx3fCZhPt/SSCbYL5zmXaYN7Ol8WHHfvBpqdft8Jzi/d4O/UsEMQOFrtHinvP+j
 n1/wV4KoiF+JMLM8VPvmqfqK9LN0nHWUkaI/X+RUC4E35aB6HdDzV2oraogH7JPOtaz2
 aOElZjNaxQYRfxkkWv4iNlKHv3LdXKUrEHpPfj09oc4uYhYUqiiV1K2PJcGy1y9VOvKx
 IUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VtPf/Iw3oKW7SjqgJKtt+Q5d6Jb37vINBRVmuoZAHlw=;
 b=gnO5nT+UrDEr+1voNYLhxrQW62E/7ME5+ncCm/8AyarIjyZQV+qDVhicGVT78FFSj3
 1AkymoCZDMHZMxN4yzEQOEcje8+KyVyzBevioG6s2VbuVsQtXFv77xhBUEnnsBRcDwsa
 n6pkFA8FJJUKkyBQ48mVW2a4URmAi27NKTHmMT8o6AgSBRZFwCkljF3UJnE0z0UZqzQN
 JB3VEooh93qomOPq9WKaZDHqMWl+XLvuZpanCOEN9co8ZHdSX97LP1mhTkRVX1NlRFuG
 rC0uiwdn9NKI5sqSrf8HNOsrnTVIC3PutEvIQSHugx/DYtqR5WfQ+sLTff40ieev7sbD
 WctQ==
X-Gm-Message-State: AOAM532JsVvqwTjHIm+T8TqWwzZpgjDOVv6wf8YeoTIuST9hrDBqbyNd
 Ul+U0x2d5gGRoymBsj6xtqU=
X-Google-Smtp-Source: ABdhPJwuHNQ5wIihLXmE4RhuD5G0B9yFVj7TU/csvtFs8majuv8qgopdCGHaYHkmq75cFt+ukir3Ww==
X-Received: by 2002:a17:903:2302:b0:148:e4c7:5573 with SMTP id
 d2-20020a170903230200b00148e4c75573mr6824405plh.109.1640355150821; 
 Fri, 24 Dec 2021 06:12:30 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47a:800:94db:99e3:c3c:2dfc:8554])
 by smtp.gmail.com with ESMTPSA id h7sm9919140pfv.35.2021.12.24.06.12.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Dec 2021 06:12:30 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH v1 0/2] sprd drm cover letter
Date: Fri, 24 Dec 2021 22:12:11 +0800
Message-Id: <20211224141213.27612-1-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, kevin3.tang@gmail.com, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lukas.bulwahn@gmail.com, orsonzhai@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1:
  remove the selected DRM_KMS_CMA_HELPER in kconfig
  drm-sprd-fix-potential-NULL-dereference

Kevin Tang (2):
  drm/sprd: remove the selected DRM_KMS_CMA_HELPER in kconfig
  drm/sprd: fix potential NULL dereference

 drivers/gpu/drm/sprd/Kconfig    | 1 -
 drivers/gpu/drm/sprd/sprd_dpu.c | 3 +++
 drivers/gpu/drm/sprd/sprd_drm.c | 8 ++------
 drivers/gpu/drm/sprd/sprd_dsi.c | 3 +++
 4 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.29.0

