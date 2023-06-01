Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC971949D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 09:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0697310E52A;
	Thu,  1 Jun 2023 07:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0634810E52A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 07:45:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30ae95c4e75so554091f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685605519; x=1688197519;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=woDAE++Zg73zRjlY+4xP0lpdNhv9eVpF353qfmqW4BU=;
 b=j86Q3LB3vGRcj6dukROKBfX+FILtVy8z/lVwsFHQ44+O8eDJcQHMYXQ90+sf8ZeTy1
 tAx6cdUNfhspUMeyyE8DmXTJvmSadpFdZ1pu821OjFwZi/yT6iGlyl1CvgFHid5GnUTR
 wQOcjMRevPoE334GnZrAeZuEkste9+buDelCzzL9fk+mQD7G4emVEEk6vqkjdJwMvuqn
 XKVQNT1g9/TlEVH+1vZlCmTRqYS+W8Kfw44UfIy5QRL/YhOlYGT1jCo4POBzku3O7dUd
 +YbQ8QIecORY4u7YJjtKnmlW9dMp1cUiBU91+ZUNSDMxaUcmS+dd/vqnRsDAROhlGA1t
 VRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685605519; x=1688197519;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=woDAE++Zg73zRjlY+4xP0lpdNhv9eVpF353qfmqW4BU=;
 b=Up1yIwgm1lavd0gCCNXYRa24CpIkCNFXz4z+rsfGYZ4l8Wvr/aXg8UI6UCHRkk6ypk
 f27SvF0MZnQyOPbsA3yQVO1WjpcyeV73gObDXcMJbe2sEkZGpuKYGSWIK/ZDu3WRYnGb
 Av3BHogCfO0RjPcLpGbnBbhOeiISO0R0OjRP5bEy1MnyAIaItt/71plmtTzPNsRNXH6w
 DPMKzKBeYJlYEesvR2ybqqNRnRcFAprzUXR6oo5MWaFINw6FNLcn6+xWCalw+mJgVGTO
 GFpCoaBHiHad5FmdKBOy8ASw3u+1d+BzKvyaaLEbAEREpRrBMTLn0npYF45YEkIwxDT4
 dBfw==
X-Gm-Message-State: AC+VfDwvsfTYNRgNUyE7RBxxe29uywWdVjYu7EZK4XvTtrBlDm/O+0uJ
 gZ2D0nkAcybIW/Lz+lFOuUQ7Vjg8YCkMMlbzOtrWhA==
X-Google-Smtp-Source: ACHHUZ6vIXoh57PrLpvJ8HKD6eldePJqfKs2hjbSEbNEXkMzSbFwNDg4biqP3bCKvLERofyfJCPqpg==
X-Received: by 2002:a05:6000:ce:b0:30a:ebe2:5e44 with SMTP id
 q14-20020a05600000ce00b0030aebe25e44mr1015635wrx.67.1685605518811; 
 Thu, 01 Jun 2023 00:45:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 g15-20020adff40f000000b00307972e46fasm9240526wro.107.2023.06.01.00.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 00:45:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20230531224407.1611952-1-festevam@gmail.com>
References: <20230531224407.1611952-1-festevam@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: samsung,mipi-dsim: Use port-base reference
Message-Id: <168560551794.3235338.10492329758056860789.b4-ty@linaro.org>
Date: Thu, 01 Jun 2023 09:45:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 31 May 2023 19:44:07 -0300, Fabio Estevam wrote:
> Use port-base reference for port@1.
> 
> This fixes the following schema warning:
> 
> imx8mp-dhcom-pdk3.dtb: dsi@32e60000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> From schema: Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: samsung,mipi-dsim: Use port-base reference
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=54df4868fb728bebbb0fb7c3f187eba383e922b5

-- 
Neil

