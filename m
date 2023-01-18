Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A26710B9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C74C10E63C;
	Wed, 18 Jan 2023 02:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D66C10E63B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kt14so20933642ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ccs2uNmfL4XWxTk6Uww2FXDm1/IOKWoamNzZVTFZBqg=;
 b=q0tgw2Z3ChWeUnJns+bg5UgV2wpIPe+4eymySGOiHe2x8bWtkliFGdMYtXQaWkZswx
 S3EMetxLLkpwji26+bXSC2li2MMmLZhSH9wmSbHRXNqEok04ZvgGq+CvARGESzELQUXx
 U3oU4cYAXc3PUHbIMsQJIdkyb2+EkKaBW20XfCBmjJSJUcCqXq3GJl27GlKFBfe7Nte2
 njxKegVK7aDJrdvorZauNZ2IZfj1Om09bcscX3FtlzAoQhsrv7Qm1PR/CEifaH5ytcee
 It51XGWjj2V689CLcxbjyPHfvozsVm0TqPha4rthQO0rrmbiEmxnmt0KR+U/z5DdaryE
 +2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ccs2uNmfL4XWxTk6Uww2FXDm1/IOKWoamNzZVTFZBqg=;
 b=2de80hoCZo2AlOeiYKiVTu+d97Qc2mEu26h/iXIq8UGnjt7lycopQTazgtazO9Tnb0
 4LuVY25TrPOQG+/SvCpvDapHJlStt/dTjWLIOolAKrL1F5po7uB4vKyCHLTMFMBRnimi
 Jt5ZsgWSkZo1X6c16UXbPxXimnIkx8KJy095Vpf3qRIdR+0gAYFTub6xUl9eFmCKUm6O
 hvBRWL8qWgziTLaELp8HK9udrWshv+yRag/04N3AVqwmxS3Zj+XvvO0hWjzxOBX2eOtM
 V/tG7X6fqKWbW2Blhw0axMeRZpyIaeE/6BQlw0RUKXUVvbmNsr+qG4UIV2kqIDsRUFky
 EGnQ==
X-Gm-Message-State: AFqh2kqCQ2ecsTfDOcT/UXtkJnyPke42VGCgaSPKAuW2ebsMMfuZBXFW
 zJEbcF0D8vfgkXEM6EvUT7/V5A==
X-Google-Smtp-Source: AMrXdXsS/dgY9e1GCBLOxP9hWlAxvr+wHa+R2wVZqHJzPgT5Z0EN6+R2fGy0/ziBt9AZuquxi3TPDA==
X-Received: by 2002:a17:907:86a5:b0:870:d4f3:61b3 with SMTP id
 qa37-20020a17090786a500b00870d4f361b3mr6574435ejc.12.1674007594143; 
 Tue, 17 Jan 2023 18:06:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: d-gole@ti.com,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v3] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
Date: Wed, 18 Jan 2023 04:06:15 +0200
Message-Id: <167400670539.1683873.10074210279726951946.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
References: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 10 Jan 2023 10:16:51 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Add missing check for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e5237cd6ad68

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
