Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160A9A3AE4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 12:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E57210E352;
	Fri, 18 Oct 2024 10:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tHjDpLHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EDD10E352
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:08:13 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e8586b53so2516300e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729246091; x=1729850891; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EWO5SIPIA+/rWAYr4Euwe43sU4NAtmP9U+0QgyOHFx8=;
 b=tHjDpLHrhYYLnn1ajhAVeNw4zfhfA5BDbn12dR9Ix136Vt1yxxPXusB12ECPMMGRCO
 rZftwDI/XIn0Am7nia2kQdzMvC8lmCWFjiuqnP4WWn2Y7gZtxAWfKwYwsxgnsK2bhVBc
 2VMJONtj/a4ANrqgwuXJ32lX5IdoFgxsP7vYKWnAumoCxGmgGlWqw72ubGGLSbXn32MG
 gwbkbyMfu5y18yHzsbT1vPyqsVPzDwtLDg+oKZBxQGGpGYHH07n31dHj6oTLn4A+jLX9
 JBSUsc31D/MiMY9uu8kGob278JdHBjLYb6BvXn6vTJuCRWy+PLEwBcd2f9zTFK+NXtJ3
 HHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729246091; x=1729850891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWO5SIPIA+/rWAYr4Euwe43sU4NAtmP9U+0QgyOHFx8=;
 b=rBbDOBfbVE5TPn1TBeOiWX6NJGHXdmtwSnyngBfDF0Hl9sZ6wS/4/1totCHTlK/qTr
 pRa5YV/aBZw15JhLE82gmZPDakiw9okhI/MHeqz+vkN/eL51VQtk9MuZhiPxM1/bd2uO
 USS4+0LXzhp/2mQZ8dovVrKQfOiYwVenG2cKiT1LNd59cZtDtuzvCvVg/tyvnZkrQRN8
 7jvnjJ2UtPmALyCblt9SpqiNTHIxx3mdh8igjK6cYAM5LO5rNiy6kNdZqTeZ2AuNI+cE
 iuxVntBGP/O4pLG6F4htze1dkNh8/XZzeZmJR0BJ3/PjikuS4rjFsbJ9JsduKzREsnDS
 FKmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN102tEG/zYQ+FHLm2cFmn2BKxJhs/cN5RYOc+ilTQBF1QH2dKGC8hN1XhLcrDxsLXBsb4NEkecew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6wpKy0v7xIRx9M38oRLHizqsNOPDxCFNI3s52L4INUWZqlqRe
 2h0oQTmXuUxLnrvh6QM+VGzApxJnIerhCLKGo0sYkFNiI/wfRW5GuMlY3mW0v5Y=
X-Google-Smtp-Source: AGHT+IG2fzF1NEqkVxyx3ltslEHQ5ZS8VwVmoBLD0KSZElJbLsKJHZFOX9qwuUQyNzdp9PiQBHBbNw==
X-Received: by 2002:a05:6512:e9b:b0:539:ebc7:97a2 with SMTP id
 2adb3069b0e04-53a0c73434dmr2093811e87.19.1729246091341; 
 Fri, 18 Oct 2024 03:08:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0db9sm175433e87.151.2024.10.18.03.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 03:08:10 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:08:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org,
 robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v5 0/5] Add support for DisplayPort on SA8775P platform
Message-ID: <vtfz5vteaedwrqw5cpggmd3esi2rky3f2axubxukh74wdux4uy@zdac7miws5lu>
References: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
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

On Fri, Oct 18, 2024 at 12:37:01PM +0530, Soutrik Mukhopadhyay wrote:
> This series adds support for the DisplayPort controller
> and eDP PHY v5 found on the Qualcomm SA8775P platform.
> 
> ---
> v2: Fixed review comments from Dmitry and Bjorn
> 	- Made aux_cfg array as const.
> 	- Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
> 
> v3: Fixed review comments from Dmitry, Konrad and Bjorn
> 	- Used a for loop to write the dp_phy_aux_cfg registers.
> 	- Pre-defined the aux_cfg size to prevent any magic numbers.
> 	- Added all the necessary DPTX controllers for this platform.
> 
> v4: Fixed review comments from Dmitry and Krzysztof
> 	- Removed the "reviewed by" and kept only the "acked by" for 
> 	  patch 1.
> 	- Updated the commit message of patch 5 to mention specifically
> 	  about the validation of "only" MDSS0 DPTX0 and DPTX1.
> 
> v5: Fixed review comment from Dmitry in patch 5
> 	- Aligned the register starting address for display port as part 
> 	  of device description with respect to other targets.
> 
> Below patches are applied:
> 
> [1/5] dt-bindings: phy: Add eDP PHY compatible for sa8775p
>       commit: 7adb3d221a4d6a4f5e0793c3bd35f1168934035c
> [2/5] phy: qcom: edp: Introduce aux_cfg array for version specific aux settings
>       commit: 913463587d528d766a8e12c7790995e273ec84fb
> [3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
>       commit: 3f12bf16213c30d8e645027efd94a19c13ee0253

Please in future skip applied patches instead of including them into the
series.  No need to resend the series just for this issue though.

> 
> ---
> 
> Soutrik Mukhopadhyay (5):
>   dt-bindings: phy: Add eDP PHY compatible for sa8775p
>   phy: qcom: edp: Introduce aux_cfg array for version specific aux
>     settings
>   phy: qcom: edp: Add support for eDP PHY on SA8775P
>   dt-bindings: display: msm: dp-controller: document SA8775P compatible
>   drm/msm/dp: Add DisplayPort controller for SA8775P
> 
>  .../bindings/display/msm/dp-controller.yaml   |  1 +
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c           |  9 +++
>  drivers/phy/qualcomm/phy-qcom-edp.c           | 74 +++++++++++++------
>  4 files changed, 61 insertions(+), 24 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
