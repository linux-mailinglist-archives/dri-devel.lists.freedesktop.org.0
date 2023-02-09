Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DD2690234
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B6A10E954;
	Thu,  9 Feb 2023 08:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C725610E954
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:34:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n13so871774wmr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 00:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6Gx4R8kVvNzk+VzWyuBo9M3Fq9oEvOv8oe6nnaK0aE=;
 b=F5oFQl7L2U3DDpre1RpSxGfinwhte/Lr3+J9RJP+F0nyRYTA3yyTobPu9I/iIBdE0H
 NWsQ3vdQjVhLRz8rgmq4ga2k10GQH/6vlsekQaMoL96KHz/ltojSGXepRtbbRawLuvie
 V4uU1PNzqut9r5BBRLq/S/PDyEd9rX23vOyXoYA6pIlvzmGxa/GuaKyq+nqKnoVtfstK
 mDpQNnmZ01AWSXQ+F0rO9NhIe+OUTpMkixkeuFKiPDZ++vdJlruiYlRvoT4iormZPLkR
 oJnIOeb+oFIPAosJ6yXwNN3+zSJcpGEz/kkrsNZAPs7tA5DUw4pF5eVXGNL91mbOzcbJ
 D/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6Gx4R8kVvNzk+VzWyuBo9M3Fq9oEvOv8oe6nnaK0aE=;
 b=6hSgfD+ZJEC4B13sKcH5hEG4W/jhqhGP/GrRQ6qECSlp/6fqkoPSJAPINpVOIWHF9U
 SkHP8IWVw5oUr9qpKucH0bTnwT7I1hJGHdmDAb55jLboOALUOIKgpFeto5Oauyzq5I4g
 xRG6v8LBianttbXbmOOX3olLa0k74xBIR0QbCqwFOtBWeKEF7ePUimfkPGViTFEf2rSc
 InfDS6bO0lHyat1S7VrpqmOmPtOHXLonHyMpNvFb8SESbGYPkEsUZTdIwyIOb/yHPYZK
 i78mA/Eor0P6H3jfsWCEYe2C7GW72NX2whpR/pWgTaFT+KM4ctcCycsOLahla3bfwLiW
 J7kg==
X-Gm-Message-State: AO0yUKV+zFOiL/if/VRyHTNJ57elZ65EokJqoPjwdp/PM81q/+osiZ8s
 cKP0jZPohdJipb+iMcJb/CGJZw==
X-Google-Smtp-Source: AK7set/b0vsPagbekwWZBq/6HeoQJIXxxSx+zZ79h0wufDlPa4ndoZBBEuQP0/KgmaK9SX0yl31wwg==
X-Received: by 2002:a05:600c:3510:b0:3dc:42d2:aeee with SMTP id
 h16-20020a05600c351000b003dc42d2aeeemr9147288wmq.25.1675931652307; 
 Thu, 09 Feb 2023 00:34:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003c6bbe910fdsm4214648wmi.9.2023.02.09.00.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:34:11 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
References: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: visionox,vtdr6130: add
 missing reg property
Message-Id: <167593165135.1280212.15464621663027280533.b4-ty@linaro.org>
Date: Thu, 09 Feb 2023 09:34:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 07 Feb 2023 11:04:36 +0100, Neil Armstrong wrote:
> Add missing reg property and update example to add dsi top node.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] dt-bindings: display: panel: visionox,vtdr6130: add missing reg property
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=467fbc77f673ecc9dcf4e58ffc1fa426a22df7fd

-- 
Neil

