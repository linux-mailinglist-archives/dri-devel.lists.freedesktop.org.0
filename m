Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67CFA7F587
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E7F10E1AE;
	Tue,  8 Apr 2025 07:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZQux2T0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C596B10E1AE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:04:59 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bfca745c7so46807461fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 00:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744095898; x=1744700698; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9RvH6nJLCGwOS3IUf0/jo5Vvg4n1Cl/DgCkb9I5L20=;
 b=ZQux2T0htcfV9Du7EvoSoc8J3IFt7V2mWhEzlsHSs9tPCwjAoq4IuKFjdnouXdKMQA
 ccJd0UnC6Ww0gw7IUrTy58paWT8HepAXTBypYGVNzvjsPVeTt8j6Llnu3jUXc/PsC7BV
 8WxoIlrMPBYcFtXbd16JY7JCLStsDbFlhddUkyB9X1SsY309+cWoF82Y4c1U13BuF+6K
 l7TPXtDSU6TMa+Mh63Do2DXJfN5k8DrFhGsi5SVI/y4R+fYrCoIkXlAaWWof9giZoWeF
 nVeyk0zm/K2sZot1Ib7Xe2qgc31Eeioor83g6qWnX0YxmS6AHApQxBnoOKdtimFiVwmZ
 071Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744095898; x=1744700698;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z9RvH6nJLCGwOS3IUf0/jo5Vvg4n1Cl/DgCkb9I5L20=;
 b=phbF+9IeIvGiGFDim5QJRyjPncTkiuDLomk7WdHRyFF67j6fOyFbxt3521m3vugIkM
 SSmekypNW62fMOSGscX/LwNbXWZAFJSLD1Jpjd45G9qL/2+lA8cXwjCGRBqN7pG2lhcy
 mLyA83bGuJzf+9/De/Z7Lrk7op8W9GYsB2qt2cfr94rfuPIAMkK7iMV1SaGjF7yfNLJy
 yvashiFymFFk3XIkmusgiCmperVvB1rPgKVY7kIkeWR0kRA+r0HDVU4iT0cKbM3SSIUH
 /PKF5KW+gadyL/BmMhZp7reYkjeLfDwC9D+XaoOTUv+iFN3s+Us6FCAk13RaDwaADlTi
 alzQ==
X-Gm-Message-State: AOJu0YxZBs1jIDCyHOcCd1HyT5nH55nSqkdPjJK0pvwDhFlBbYrtb++3
 tfj9htceZsBHt/Qv8k+/u3aO8B3r4QQvU/TI4hW61R08nv1QAg6q
X-Gm-Gg: ASbGnctKj3hwahosyrTc4i1VmBPC+O7iremlLdVZYXrJ3brQNtrQrVZqIgqO8RJuKHV
 ORpGRwXB4vOu2t1T0RlD5tNL6B+ciVU36kTWTdJTMdEVdrs0262+5VT+5mjq4pncx2BZ/+etLZQ
 LGue2NvbI1Pmb26FrsjnclmZ5MaVLHZbGyqd5fbYCrPT1Bs056nBMLqwb09AiUzzckWYHvjZfJO
 csFnnU4Tzxk6TdSKb9xcLzmvvgmnfnKoj7B7dPXvFgMSi36BBxLWHs9bhtc1NdIXszFL/rAMPqw
 l5mawssZrtqiNK2D0xTkvpck9UKbMw78Hj90+BBipMK/MBGjWTJQcN5paloc3mOws8fVMP4nI/X
 CjuIFB5kqxsM06AxnqDI0Hms=
X-Google-Smtp-Source: AGHT+IGHZ5XDw5CVJD6Mj7fkx1Ax4avmRtdNAL/FMZrSclddvl9CK4M3rbRK8XAjnFF8Yiqd4LfUnA==
X-Received: by 2002:a2e:a0c5:0:b0:30c:11ef:98ea with SMTP id
 38308e7fff4ca-30f1650ebb9mr22936511fa.15.1744095897589; 
 Tue, 08 Apr 2025 00:04:57 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031bcd37sm19252841fa.76.2025.04.08.00.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 00:04:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/3] Add support for Sitronix ST7571 LCD controller
Date: Tue, 08 Apr 2025 09:04:27 +0200
Message-Id: <20250408-st7571-v3-0-200693efec57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzK9GcC/1WOywqDMBBFf0Vm3ZQ8q3bV/yhdxDjqQH2QSGgR/
 71RsLTLc5lzmAUCesIA12wBj5ECjUMCdcrAdXZokVGdGCSXhmsuWJhzkwtWqkJWpWscVw2k48l
 jQ689dH8k7ijMo3/v3Si29UjIIxEF40wZUV+qErHS9tb2lp5nN/awJaL81fRXk0nTLi+sTQ/U5
 k9b1/UDbhadJtMAAAA=
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Thomas Zimmermann <tzimmrmann@suse.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eEpZz8tbfoFeBVxKAYzPIl0JRGnarfa94dGMMm/aZIE=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn9MqDYL4Rhfhi8V+kf9Zem2olB5P2Qq/M3efES
 knX7dZ79KmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/TKgwAKCRCIgE5vWV1S
 MvNaD/sGDNFrhZRmkpqyysOxA57JnfIB2WFb37egut7976M91VnMr0YN/Rs3Cn0MtEkHjVDNHVU
 MbypurmU/NsWEgM9BP5ghIenoCn2xtAcU6dmpQz0MSDZep9xIQCm/sK6z723NysZ7QIDHA9XnaN
 Iysrkr99XbVU7EGymnoR9arbKya5PfTTnFf9KWsHwKKjolw0p5fTM79UmEMC/1N2FmHsaYFX2PC
 XimwRJIm2qqxlEI0xBBeWI5Pb97pu0DoejnFzCDoyjMVJwZjUxBRNiP9Im/OhM2TsktyX5DNLII
 LDOU4hKIa/UEXWHTbchvX/ZpZI/DBwh8nbYHzuU0eDReZBdCf3zcFiZNxW4VakjC/TwicqvkiVv
 fcD6iIC6G5zeIUwn397ZZqRzidgX+1DPI+DBtX0+md8Oh7VPSOHJRrAuaVNV/lNSH5lieH7vdXI
 FxSYQIQSg/Unm8PGgaF0e8owc/617Es0USBBJL7mRRQ+uaLKpP6JuvkxfktxYQVQzD4YBCmZKsA
 yZqIL5eV0opXtAa2j/qTqKGl9UxLyzvBxvAtCm9Vzphojzs1QL3ST3/ZnpPVX9VTB3yoEBJflvK
 sCmf6hkiuDvY5lcd66ABAmfjNmQ4DxA2mzEX00NLU9lDM/wgRLmuwCikZj5XwNzBRCoYSQAsGHY
 d5qXODS/H3OxT3Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- (dt-binding) Use 'Controller' rather than 'Panel' in texts
- (dt-binding) Constrain the reg property
- (dt-binding) Remove panel-timing description
- (dt-binding) Change description
- Mostly cosmetic changes in the driver code
- Don't call drm_atomic_helper_shutdown() in remove()
- Link to v2: https://lore.kernel.org/r/20250404-st7571-v2-0-4c78aab9cd5a@gmail.com

Changes in v2:
- Reworked pretty much the whole driver to not use obsolete code.
- Use panel and timing bindings to specify resolution and panel size
- Link to v1: https://lore.kernel.org/r/20250402-st7571-v1-0-351d6b9eeb4a@gmail.com

---
Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 LCD Controller
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add entry for Sitronix ST7571 LCD Controller

 .../bindings/display/sitronix,st7571.yaml          |  70 ++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  11 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 721 +++++++++++++++++++++
 5 files changed, 809 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

