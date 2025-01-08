Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BAAA06346
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7459910EC2B;
	Wed,  8 Jan 2025 17:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KD+fAskQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773F10EC2B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:24:46 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d84179ef26so5791225a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736357025; x=1736961825; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nxLGQEDMPtD183tpaO1bgNB/TKXIgR1C+GAZs1bJ25k=;
 b=KD+fAskQtxSnjDn014Lcz3DNDlsT44BadLAfi/g8WFYZH4fa1sjUPRavT0oJ+r67RO
 F+hWfwJQeCEXhXQp18DVFZQTz13OLVvTIgTKZRUWzqxKbULfSZ6P8syNo7cz04n8Q1xM
 epaPnWe5BdVoJ5Fy8JomNx8xF/MY9QLbl3B5sdb8xteXnRtWFQZf3jaIokN/1B3IHUkn
 ldpQXRfuTsOLY6TvkjAj9yAUkKA8vISwBE23UV2zrNDvvCinu3NtphLES9ZBeTWeoe87
 6CWl/E5lDc4fbOjrFSkBLH7hJx1JLFanK+K52DHyK6NubU123uVHM26hx1YUIjUBdDmu
 8Klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736357025; x=1736961825;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nxLGQEDMPtD183tpaO1bgNB/TKXIgR1C+GAZs1bJ25k=;
 b=OuEzHl96BCU4+uLb/oHFse+LCy+S2Q4+SVxMHrKwCVl8b01DuTvVyispXeE8S25JJe
 /nXhqBmIHCUpK2qyu4O9LItOe4FQ+0/52mwbFmUYg7ccfxz8H6j1K4AKd27gHwDulRKv
 GXHndG5LxaUUc2YyW4e+7ykJzi/cEIWUynYctucmDlaviZF9nzoRwHNPShmDvkn6RD/J
 WHi0eEDWqEyL8mCEhrykhBYxLvwLKeSsfJ3EnJCTsw/RxXD+1j+RccAwekPhel1E2Rgv
 PbgConfZ8wsNLkX/h/KVdESPu0dYJluy2y08RaAPu4hNhUdRBlDlxn/49BxYDdsgspaA
 ZdSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh+aqoj4q7IIR0AFyDILRX/IVy7yCG/s1QgAiAHo+D0SnjeKXthPGHBJLf1vHcG6RDUxCF/ySdFc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywywu4m7U+ncSV9Cc6ekKigl7NDea7ixKpgoBFgFvNL0pq41PGn
 4LwHbmzy8HkbwMzZVzQH5Pkflq68L477rY/Noh1A81A0bxMApnGbHbOyrNFYz5bMkZtCntn65cr
 l
X-Gm-Gg: ASbGncttLNOpg6sHHI8gOalUTaJDcgtafE1TnqAK0SIv0z7tb2Z9ZIgTVN83mRdGiu8
 +lrQe17D5S/v8aWAz80wQzF2ib1isS2J49O128Uea1X08o2pSnbIh7iYLEW/YJvKw0wb2sst+Q3
 91DTepwAQn4G1Z06m4PItNIu8YjQyfU+J+49n72a0esBl/qIMkQetLt1MMPYn+6WJy/mdpLXxjH
 DAf3eSSR+JPB+Jj3UBIJkY1IesFyCprsVpf6tSxNElRdMpg7EImmwn4
X-Google-Smtp-Source: AGHT+IF+4BJuelALL0kX/bpo95c7rpr7kjWjUMQ1Q3GKwXReRDAQAIpMxH3G6HI0ncvlTZMIBqUbSw==
X-Received: by 2002:a5d:5848:0:b0:385:f7a3:fea6 with SMTP id
 ffacd0b85a97d-38a872da433mr2578805f8f.13.1736346723190; 
 Wed, 08 Jan 2025 06:32:03 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Wed, 08 Jan 2025 16:31:42 +0200
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6MfmcC/53OTWrDMBCG4asErTNBP5btdNV7lC4kzygRxJIZC
 dMSfPcqgRJKV8nym8XzzlUU4khFvO2ugmmNJebURrffiens0okgYttCS90paRQgz4ALzGUGhwi
 XWheGyi6VxTGlCnNGgkIVlOkntD4gyUE0b2EK8eve+vhs+xxLzfx9T6/qdn2lsiqQMLng/XG0N
 nTy/RKT43zIfBK3zKoftFZP0brRaI+yJzSj1+M/2vzSVra3n6FNo+1k+iF0Xg69+UNv2/YDjrF
 tFZkBAAA=
X-Change-ID: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4108; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=ZClYMHhO90yxP02Bf6DXqae6J3owpAkl8IL86ewSv3w=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxYh9oLMlCfm1yqHjBxsGL4ZQNZaXg+L2Pps
 PovE6qSScGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MWAAKCRAbX0TJAJUV
 Vs7MD/0XJvOEeHzxnCHJv8GLI6NnjGNoP7ACN9V2PtSecMfT9742OCDGdfAdYF6nvuky0jtSkwi
 30gSXj2NM24yBcuDhFO7Qc+b9ITjIII3YLiCFeTt1rOKnpkJBR7nceOKYDFmVp0BCjQYxQqCJok
 +Zh2jm7X68OIm4QrO0KVMRuNEUBbSv/aE6Y1+EEnEb+HvsBuXIgnqazVAzYsRUXfTnXNqttfN4+
 OVcq22LApVK5MkDXl6Yxn48WN8a7X7M8qU5KcZ5c4b59Yf+NJDf7uglkbf01egPbF07YgtvTKw3
 tjH40mOame7qtDsag1HdLPa2sT44V2bK5C6sDIPqXuM/wU9e+54nJx9SGoWNR0P3I09M32rvPVa
 hsrWgcTiXnxpNRJ3jNy9zIRyGuQ0YxFLtHZAp/+BXUug7ARUKhUmujgFhi9W6HXSM1XoWIGBoU/
 KIam6xNp3gjBC7STHBNwz6v+8wRv2HMIE8+h1RAgWI0ZQRlHRupdVOtkNX9Rz6uDXuFSfyqEWZC
 Xp0admjTecBy/FGDyPCgNWUTlqgYFBJM24Oa5C1i0cz4O10daXenYJqD89leNWo6bXqEt4aNBBV
 Jg8toO+d5I5oF6zHkTzyBN6dtisJSurg6v1QIey0ZJq0Bgzs2bqRSdGV+rrYzwT8zTDgC5LvIvt
 UjoQYLnkpKflVoQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Looking at both i915 and nouveau DP drivers, both are setting the first
LTTPR (if found) in transparent mode first and then in non-transparent
mode, just like the DP v2.0 specification mentions in section 3.6.6.1.

Being part of the standard, setting the LTTPR in a specific operation mode
can be easily moved in the generic framework. So do that by adding a new
helper.

Then, the msm DP driver is lacking any kind of support for LTTPR handling,
so add it by reading the LTTPR caps for figuring out the number of LTTPRs
found on plug detect and then do exactly what the i915 and nouveau drivers
do with respect to toggling through operating modes, just like the
up-mentioned section from DP spec describes.

At some point, link training per sub-segment will probably be needed, but
for now, toggling the operating modes seems to be enough at least for the
X Elite-based platforms that this patchset has been tested on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Picked up Dmitry's and Johan's R-b tags for the drm generic and drm
  msm patches.
- Moved the comment about the roll-back to transparent mode inside the
  if statement and fixed the typos, like Johan suggested.
- Added more details in the commit message for the i915 changes. Details
  about the update that the lttpr_common_caps need w.r.t. rollback to
  transparent mode in case of failure.
- Link to v3: https://lore.kernel.org/r/20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org

Changes in v3:
- Picked-up T-b tag from Johan for the drm/dp transparent mode set helper
  patch
- Re-worked the return value of the drm/dp transparet mode set helper
- Added some more details about what the values of the lttpr_count arg
  is expected to be for the drm_dp_lttpr_init(), like Johan suggested.
- Re-worked the non-transparent mode disable->enable so that the rollback
  doesn't happen unless enable failed.
- Picked-up Lyude's R-b tag for the nouveau patch.
- Dropped extra parantesis at the end of the drm_dp_lttpr_init() call in
  i915 patch.
- Picked-up Johan's T-b tag for the drm/msm/dp patch.
- Added some error handling and an error message in the
  msm_dp_display_lttpr_init(), while dropping the unnecessary lttpr_count
  local variable.
- Link to v2: https://lore.kernel.org/r/20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org

Changes in v2:
- Added new wrapper over the set_transparent new helper in order to
  move the non-transparent disable and the its enable->disable sequence
  mentioned in the DP standard section 3.6.6.1 entirely in the generic
  implemetation.
- Switch all 3 drivers to use the new wrapper.
- Fixed the return value of the helper to return 0 on success and
  negative value on error.
- Added explanation about the transparent/non-transparent modes into the
  msm dp commit message.
- Dropped the condition for non-eDP in msm DP driver since it is allowed
  to try to get the number of LTTPRs even on eDP and it will be always
  0 anyway.
- Dropped the RFC prefix
- Link to v1: https://lore.kernel.org/r/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org

---
Abel Vesa (4):
      drm/dp: Add helper to set LTTPRs in transparent mode
      drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      drm/msm/dp: Add support for LTTPR handling

 drivers/gpu/drm/display/drm_dp_helper.c            | 62 ++++++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
 drivers/gpu/drm/msm/dp/dp_display.c                | 17 ++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
 include/drm/display/drm_dp_helper.h                |  2 +
 5 files changed, 88 insertions(+), 34 deletions(-)
---
base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

