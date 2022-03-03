Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E24CC39E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D91510EABE;
	Thu,  3 Mar 2022 17:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341C910EABE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:24:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x15so8889623wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvfQxkJzRDPW+wX8/sxn+DFVMxJJWvPXRKTHdc+XrVg=;
 b=YQkmHzEB4s8OqwlKwhItlO/pKbcIFQjQovA1+vledCMdv/kfouLxi0pSHh/WigFPTN
 HSecIrR42Qy/Hmbm5JQoMcGNTeTtrPgdfAi8mk48/eq/gUfUIM/8aOwc6Z/eRvVD/aeL
 xvjkVU2MmxyAnmXVzNWo2doxQC8R2/6Qt9Qg34Hv1wkreyUiea6h2DrZeeQbma6bVrg9
 FIHHN43UgqrlxCBPFfkeQC0kvXRChcDLSTYm1xsee7aE8jWz3gGxj2K1OGUmn1Lxxix7
 7VJxMdRgoBd8nY1mggnwVTv8tLY6fpiGvUQxxoyUtOGedMbaCMKsNI1elzBoobAMyvTc
 Rp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvfQxkJzRDPW+wX8/sxn+DFVMxJJWvPXRKTHdc+XrVg=;
 b=DDgPcrO8x11n9T/XcUsw2aD6xlbdtRsEqbd8BRIwDfOwJuHKrFIMnDwX27MKJoPwn4
 URn7A2j33InEjP7eOQ5Z49CtUQKRb32KkQxmtzVc+al9Tc6Ia/Hgi93uY8KZEm5kLXdy
 8H7xxIuhAlsV5Ivl8PqNMUfHiyf9akICA3zTTzTHdeGLDckeUXIjYCHD1E4U4/CDXETN
 5svoGQZyGEgNzMTgNGXetXtF8pefRL+Q9gUf8KLYG+FhvCv0jZDOBq9uxDUdtKSt6IGS
 4V6XhtQomIfsskiLTqwxi0Zg7FhP/+xbHhgaWa7R4NFhanMN5tj5j4lWWlqenw3aekAV
 qFrg==
X-Gm-Message-State: AOAM530QeoWovt0gj6R+1Ta6WvrVcJ+zO9VnC3HYbBndZi2ODJr6rFpV
 21cgbGuDeQKokit3GU5xXH4=
X-Google-Smtp-Source: ABdhPJxDxade1EkWFZLf5wF6H5zZli5HRloQHKc0Wg9/2uchIadgTHbfs5N5QOO31d2oUxKXkUS7WQ==
X-Received: by 2002:a5d:648f:0:b0:1f0:567b:5619 with SMTP id
 o15-20020a5d648f000000b001f0567b5619mr2704816wri.66.1646328272327; 
 Thu, 03 Mar 2022 09:24:32 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm10298928wmr.47.2022.03.03.09.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 09:24:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: marex@denx.de
Subject: [PATCH drm-misc-next 0/2] Use default
 drm_plane_funcs.format_mod_supported
Date: Thu,  3 Mar 2022 18:24:16 +0100
Message-Id: <20220303172418.12565-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

This series is a follow up to [1]. Some of the patches were merged
in "drm-misc-next", however a couple of them, included in this
series, are pending.

I rebased the pending patches on top of "drm-misc-next" and added the reviewed
by tags.

Thanks,
José Expósito

[1] https://lore.kernel.org/dri-devel/20211226112503.31771-1-jose.exposito89@gmail.com/

José Expósito (2):
  drm/simple-kms: Drop format_mod_supported function
  drm: mxsfb: Drop format_mod_supported function

 drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------
 drivers/gpu/drm/mxsfb/mxsfb_kms.c       | 8 --------
 2 files changed, 16 deletions(-)

-- 
2.25.1

