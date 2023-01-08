Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F6661857
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 19:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F9F10E052;
	Sun,  8 Jan 2023 18:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0AD10E052;
 Sun,  8 Jan 2023 18:49:52 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id i1so393526ilu.8;
 Sun, 08 Jan 2023 10:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QBfc6frQTYTBFojIsbaKyBhhX3b6E0jigcJZMgl0JrQ=;
 b=sfSechtZYHdoy4XUkTqLdI/ty0SqbftnZBerwj1a4+Z/boUe2AcusDcLsqLdcHKki3
 bUV95JE7+CCBg0d8K6S+iiNMUg2YUv6uD7uAu6Nn57GgHoRgnBWs575tiIEyr8AOk0Mu
 id9MFhziEyfk5cZxKJIrIOpSLf8zwwL8/By6eMUQgso2jot4146Lj0UpX/tWBWZq7mHh
 M2aYBVO5vSGXDV+O4taBOYxahXIv+D9tZg4x1HFMPZHP6E6trMAukYw0WUpqUr9Bx+0o
 Ena7RLUSfoGXKH//QT622MZromh5j7CiuuSZSg5vHhXJPct7xtw2+cpMz4WcQEhhiYwa
 BRGA==
X-Gm-Message-State: AFqh2kr0TZUuWA0vi+a3JzLf2dQ1QzDsd2xaAf+AOl6kE7FKXChD1id/
 vWzYA1zZavDpg6Vl9aLgmQ==
X-Google-Smtp-Source: AMrXdXvo7DMW/eAXa4+8ljdaOX7G+IzIj8Y/rjrLDEP2koe94ISfRyigR9jNMkceX3Z/Wfm9LeXAZQ==
X-Received: by 2002:a05:6e02:112:b0:30c:3204:5fbd with SMTP id
 t18-20020a056e02011200b0030c32045fbdmr22652957ilm.31.1673203791274; 
 Sun, 08 Jan 2023 10:49:51 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm2160636jaf.68.2023.01.08.10.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:49:50 -0800 (PST)
Received: (nullmailer pid 198525 invoked by uid 1000);
 Sun, 08 Jan 2023 18:49:47 -0000
Date: Sun, 8 Jan 2023 12:49:47 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/1] dt-bindings: msm: dsi-phy-28nm: Add missing
 qcom,dsi-phy-regulator-ldo-mode
Message-ID: <167320378648.198458.147612299624075109.robh@kernel.org>
References: <20221229124438.504770-1-bryan.odonoghue@linaro.org>
 <20221229124438.504770-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229124438.504770-2-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 29 Dec 2022 12:44:38 +0000, Bryan O'Donoghue wrote:
> Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
> When converting from .txt to .yaml we missed this one.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
