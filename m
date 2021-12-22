Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0E47CEC1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3684810FBFE;
	Wed, 22 Dec 2021 09:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7F910FF49;
 Wed, 22 Dec 2021 09:05:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r17so3502224wrc.3;
 Wed, 22 Dec 2021 01:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yFNkjOhkbVUPCPag3+lAuNDHEf6o3ru8j250NbFjPto=;
 b=PWovdBphqrEK39M+gpDvGqxAdVPJl6QRH08LDrE+POux+PO7tP7Nq3+hmvFGa/a53/
 XL4qcWwkKXpqepZ9OJ6dRIlDgLiBr3KiSIaAltvzLJG+QFcoIeTRF+DE3+Lq8xaCSkcO
 DCmqg/yNfXwUSWbixP4Nz4sPf/o+ES/VSQZ8Jq8iUBnnixA7IEI2eepCOHFPVWsyTEre
 VrauRXaUmPCXzMC+Pnr0GHA4Aj7LOhjmvVG1i0T5IXo8SZiYdj/FkZZ7dJSrSMSN3tbx
 c+6weXHSCO2prqtwazZPDjQ4pA2nwe5rCz5NLTI4oGG5wPHKr2CBamLoX96GgGiPaFHp
 cY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yFNkjOhkbVUPCPag3+lAuNDHEf6o3ru8j250NbFjPto=;
 b=6OY7TDEd1dPkif2JwtEySM941cuQrf3zQILdISqN8gsltqNS9POjx8Pg8AhjBNwXi8
 l9RZ8tRDNz7uHcdrn0Fsb3SY+ONzWkHTa7i1hBC22ylTu5B/ETc5gCWV6GNTcikx4qpX
 a8870t7XeE0w0sF+JXoEue6n7iwXQr/+B9g7dBtatvUXZ74wCjrnxxmGlOpJkJj5gMUA
 Y3ylUQG9ZnrHQGF7lq0iCX28SWyBm7KhUx4OH+pQqZsOB++nyDpRGvSgblsJ45oTPGbd
 jvHfy+Eu+OHGstrHjfTqg6XtVNfHMjRqs9KqAATbj4fD298UKekuvMRDw2+sdlfdnVNR
 M8kg==
X-Gm-Message-State: AOAM531XfVGPlo6QJNICQF0TP5vjaBGZwBoZ06Nq9EE4hW0jFflDml4p
 SCtswp89pRDRneO4xlllbxM=
X-Google-Smtp-Source: ABdhPJy7flmzMTQMI+3SUiNfM2NPwtetHwfXTX+i112NC6r7WXwuYpXcaDAx0EErcXx/XtP7nmcycA==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr1384847wri.197.1640163956459; 
 Wed, 22 Dec 2021 01:05:56 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:05:56 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v2 0/6] Add missing format_mod_supported functions
Date: Wed, 22 Dec 2021 10:05:46 +0100
Message-Id: <20211222090552.25972-1-jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, s.hauer@pengutronix.de, rodrigo.vivi@intel.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This patchset supersedes [1]. Now the title is a bit misleading, but
I left it this way to (hopefully) facilitate the maintainers' work.

A little context: Originally, I sent a patch adding modifiers to the
VKMS driver and Simon Ser kindly reviewed it and pointed out that
"format_mod_supported" was missing [2].
I asked if the docs were incorrect or if it was a bug in
"create_in_format_blob".

In the first version of this series, Simon Ser and Dmitry Baryshkov
agreed [1] that the code should behave as documented and
"create_in_format_blob" should be changed.

This second version implements the required changes and drops the
"format_mod_supported" in the drivers that can use the default
implementation.

Jose

[1] https://lore.kernel.org/dri-devel/CAA8EJpqJ-tWmb5Ba6XSK59toCtLb3nRRmVH8da4Ud_rrRYytmw@mail.gmail.com/T/
[2] https://lore.kernel.org/dri-devel/20211216170532.GA16349@elementary/T/

José Expósito (6):
  drm/plane: Make format_mod_supported truly optional
  drm/plane: Fix typo in format_mod_supported documentation
  drm/simple-kms: Drop format_mod_supported function
  drm/i915/display: Drop format_mod_supported function
  drm: mxsfb: Drop format_mod_supported function
  drm/stm: ltdc: Drop format_mod_supported function

 drivers/gpu/drm/drm_plane.c                 |  8 ++------
 drivers/gpu/drm/drm_simple_kms_helper.c     |  8 --------
 drivers/gpu/drm/i915/display/intel_cursor.c |  8 --------
 drivers/gpu/drm/mxsfb/mxsfb_kms.c           |  8 --------
 drivers/gpu/drm/stm/ltdc.c                  | 11 -----------
 include/drm/drm_plane.h                     |  2 +-
 6 files changed, 3 insertions(+), 42 deletions(-)

-- 
2.25.1

