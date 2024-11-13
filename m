Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E49C6E7D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0544D10E6DE;
	Wed, 13 Nov 2024 12:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VfPgKkEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E64610E6E0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 12:00:05 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e35e0543b07so1747399276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 04:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731499204; x=1732104004; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k596TkgrTDI/utTSIuBX3I56IpPI7g6dbjiEOxEyzaM=;
 b=VfPgKkEUtE3QU7Xg5lWIL+XDV/4XfSl9/wMDHlNTOV24hn5hSXeufKKqzJyZhUP0Iv
 80q7mX6IhUC0zNXD4Lfwf28o3UGnTrWaOIDLAvHtzfNLoIdN9hPFE1RZQJIAu12toQFB
 jhuKVMEqT/piurwVyw5TflnYJRhsH7W1GzD28pklCoG/LnSOFo2juMbkh/o+mp/l5oBN
 jjp2+QU0h8xeCqRl523zkTqipuPbf0zaT+6Qt5Aa2ZpS2Uncp8dxc6OPaQZ0ORbV9nAU
 L7zw3TnBJu3dL5RQKCbvBIDV4UOALwtWkDecbrPnd34HRjry056W3dawqlNFroGXF4na
 1crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731499204; x=1732104004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k596TkgrTDI/utTSIuBX3I56IpPI7g6dbjiEOxEyzaM=;
 b=JfXMyoBnbHk98/BdIJ3diMeVm5QJjgjhdUT+acBmcgkNqAItwyPpS0pGkeUdsSE+4p
 pAMFuTIDayU+1JTiHKMHh68z7CbQVIt7KiovgUdd/JoGm4Jk6bwYZhjfojAUjp39XE+X
 RbEIv/WH1CAJ4J9B+GlI8BPRCVLx4hsHSrvYhexY3M52oWw3mqg4RDh3+9N1rVImK/kd
 lr6CM34bhLJfbtDERynVeIkQsxRHzlE5Nx1IitOxkcLzYTr8EWSIY++lXhcV41EqHtMu
 sY68VDI0dLnqccLn5JKkh48Py77CpdyfcugxHetp26gjmxOOJiaJe4zjb03E8ifY1jhG
 k4WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc6QhNYQKwQl/gRyw5N4CQ2Y/5XG3PUEWmSEaYhZ9bJsfCDHfxLKcrktNEknxABugt8POtCERizj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlXdSTiuQdPO7id4Yup1UwYdRpvC0bxMylZhPJDiMV9Jy8kx55
 OlTagzwLdLJ7BCkEve5CLHqXhfDbnMqo6C/i18cz8h6z/JuQ7vuMVeoWuKAUMKU5IvT4k4NkoPy
 k5PkB5veudfJAoiUdwuR6QLQlZhD5h+xFeSdfPA==
X-Google-Smtp-Source: AGHT+IGsfhJyx7HitisMHHA/fWs2Ill2LxOo1g7wiX41CtypK1CZq6dLU052J92fnNbQTwcKpCJRGkLjMZxLGn27mTk=
X-Received: by 2002:a05:6902:1083:b0:e30:dc66:5877 with SMTP id
 3f1490d57ef6-e35dc54772dmr5688914276.17.1731499204256; Wed, 13 Nov 2024
 04:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 13:59:52 +0200
Message-ID: <CAA8EJppomD1MTFOjb3hTiYgkNhNbmDyh19DuznMy1Pyg95kJuQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Add display support for QCS615 platform
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Nov 2024 at 13:52, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> This series aims to enable display on the QCS615 platform
>
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615

Please don't send next iterations until the discussion on the previous
one has finished.

>
> Note:
> items still being confirmed
> - missing reg_bus_bw
> - missing refgen supply

So, NAK, I'll wait for v3 after concluding discussion on v1.

>
> This patch series depends on below patch series:
> - rpmhcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com/
> - gcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com/
> - base
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> - Apps SMMU
> https://lore.kernel.org/all/20241105032107.9552-4-quic_qqzhou@quicinc.com/
> - I2C
> https://lore.kernel.org/all/20241111084331.2564643-1-quic_vdadhani@quicinc.com/
> - dispcc
> https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
> - dispcc dts
> https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> Changes in v2:
> - Added b4 check and check passed

Added where?

> - Added necessary blank line

where?

> - Added correct S-o-B
> - Added correct maintainer
> - Added correct To&Cc

where? Is it a change to the patch?

> - Added QCS615 DP controller comment in commit message
> - Added comments for dsi_dp_hpd_cfg_pins and dsi_dp_cdet_cfg_pins
> - Added missing port@1 for connector
> - Changed patch order
> - Changed 0 to QCOM_ICC_TAG_ALWAYS for mdss interconnects
> - Changed 0 to GPIO_ACTIVE_HIGH for GPIO flags
> - Fix indent issue
> - Fix sorted issue

This is not descibing the changes at all. Please take a look how other
changelogs are formatted and what is actually being described.

> - Moved anx_7625 to same node
> - Moved status to last
> - Renamed dsi0_hpd_cfg_pins to dsi_dp_hpd_cfg_pins
> - Renamed dsi0_cdet_cfg_pins to dsi_dp_cdet_cfg_pins
> - Renamed anx_7625_1 to dsi_anx_7625
> - Removed extra blank line
> - Removed absent block
> - Removed merge_3d value
> - Removed redundant annotation
> - Removed unsupported dsi clk in dsi0_opp_table
> - Removed dp_hpd_cfg_pins node
> - Splited patch according to requirements
> - Link to v2: https://lore.kernel.org/r/20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com
>
> ---
> Li Liu (9):
>       dt-bindings: display/msm: Add QCS615 DSI phy
>       dt-bindings: display/msm: dsi-controller-main: Document QCS615
>       dt-bindings: display/msm: Add QCS615 MDSS & DPU
>       drm/msm/dpu: Add QCS615 support
>       drm/msm: mdss: Add QCS615 support
>       drm/msm/dsi: Add support for QCS615
>       arm64: dts: qcom: Add display support for QCS615
>       arm64: dts: qcom: Add display support for QCS615 RIDE board
>       arm64: defconfig: Enable SX150X for QCS615 ride board
>
>  .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
>  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
>  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 118 +++++++++
>  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 252 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 109 +++++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 186 ++++++++++++++-
>  arch/arm64/configs/defconfig                       |   1 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
>  drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
>  17 files changed, 982 insertions(+), 1 deletion(-)
> ---
> base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
> change-id: 20241112-add-display-support-for-qcs615-platform-674ed6c8e150
> prerequisite-message-id: <20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com>
> prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
> prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
> prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
> prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
> prerequisite-message-id: <20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com>
> prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
> prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
> prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
> prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
> prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
> prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
> prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
> prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
> prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
> prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
> prerequisite-message-id: <20241105032107.9552-4-quic_qqzhou@quicinc.com>
> prerequisite-patch-id: aaa7214fe86fade46ae5c245e0a44625fae1bad3
> prerequisite-patch-id: 4db9f55207af45c6b64fff4f8929648a7fb44669
> prerequisite-patch-id: 89ce719a863bf5e909989877f15f82b51552e449
> prerequisite-message-id: <20241111084331.2564643-1-quic_vdadhani@quicinc.com>
> prerequisite-patch-id: 3f9489c89f3e632abfc5c3ca2e8eca2ce23093b0
> prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
> prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
> prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
> prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
> prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
> prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
> prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
> prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
> prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
> prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
> prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
> prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
> prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
> prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
> prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
>
> Best regards,
> --
> fangez <quic_fangez@quicinc.com>
>


-- 
With best wishes
Dmitry
