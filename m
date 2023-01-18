Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A33F6711D1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228CE10E659;
	Wed, 18 Jan 2023 03:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F161310E658
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:35 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id m21so47848950edc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hfByT3XPIIBtEMphICjivjtBS1usb2S8m4PFSVMxjfk=;
 b=PDM4ZC2iRec3CPN1tjGInxDAqgdmGQflGmlfq4HwSs75xGjghkQXnE///SrRlF8hMQ
 Qo3JGMklyjaacq5UrP/4TLhogF+tDswRA+i9jtee5AzsLXZrmgej0d3j/KShszZwYCd7
 C0Bpljm3dAQCxllPIZMIeNGZA7GOPBkzTs491DiJybMiBG6ifPj2GpwkEwQXWiHeYimm
 I9YP278HdGRK+AP9k9kTl21qWRudauU3r3F6fbqfSTxeyidH3dD4jTF3T9/B5cEK3+fD
 QfHxm3P8Ecv+cBl6k8wvbYIt+JUo4Jc3isfBHkFI41Ar3N1v6rPZe8jAhWMeZ1bKsQoT
 Cu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hfByT3XPIIBtEMphICjivjtBS1usb2S8m4PFSVMxjfk=;
 b=UOz78WN3iV94JuOqu2zNhgc/C2Qy0DCjIcIcbPiwM6Fm1MqgSKjvMI+1UBZmZ64YN3
 DlpVJj9ngwtyod695sOmGUyznx1Jg5IAaiDOs00KxF/c55JmRCLgvtvvgW52uO1d6bo2
 TnyhsYULwlCEdNN3ARTm1hUHZtDtyu9Ad2ASMJVGn51eXQvXd3RgLJiRjjwgGTD6Cbpj
 e7tzgqcGoZKFztj6UrVyZClg+febgL3nTzdBrFEt/HaF55u5YOOjl1OKsY0HolQxEaLu
 ES36ZhqvjrQUBGR+/THgKhQZpWrvit/AGe1EcNmrdW2jrNDNylTj2CEIqrHUJYhJZS5K
 8rjg==
X-Gm-Message-State: AFqh2kqtqGrRYOt4YoDvWTn9X4uTy+PeQANWLq4JAyfGpjHBn3bp70IV
 ltyPhUd2ejitMfzSC5QpY7BkHw==
X-Google-Smtp-Source: AMrXdXv5ySMa8omogU2DWfZzBFlpGddX6yt47sQUUg/eO5RJgAycTZNSEcC/IRMs9Fu2HFoh4SpaUA==
X-Received: by 2002:a05:6402:5002:b0:49e:1d53:5e20 with SMTP id
 p2-20020a056402500200b0049e1d535e20mr6130218eda.23.1674012274513; 
 Tue, 17 Jan 2023 19:24:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/4] dt-bindings: display/msm: more dsi-controller fixes
Date: Wed, 18 Jan 2023 05:24:28 +0200
Message-Id: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A small set of patches to go on top of Bryan's changes to fix a small
number of remaining issues.

Dependencies: [1]

[1] https://lore.kernel.org/linux-arm-msm/20230116225217.1056258-1-bryan.odonoghue@linaro.org/

Dmitry Baryshkov (4):
  dt-bindings: display/msm: dsi-controller-main: remove
    #address/#size-cells
  dt-bindings: display/msm: dsi-controller-main: account for apq8064
  dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
  dt-binbings: display/msm: dsi-controller-main: add missing supplies

 .../display/msm/dsi-controller-main.yaml      | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

-- 
2.39.0

