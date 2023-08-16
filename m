Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E5277E70A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691B910E3AB;
	Wed, 16 Aug 2023 16:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BF110E38F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:56:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22e36so63495025e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692204978; x=1692809778;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YJ/7Ue64ruuo8T+szNkGJZsk2gUYlOBeVjiXucVPa+Q=;
 b=VMTtyyFLbaM8ukHAPJMeiQFvUX98mL+upTHrbM2TGki1GaW8qNRkiEvW6Mz6tM4x16
 KNGQzUCE+1lW9g3rI45gGogF8Jz87QpuIqQt5NT1jFrQtkifHhfC1v5Cg+E6URHXRDuI
 6Pl1JJRtBTKvL3+JeVrUPAMN7sdCxFzkty/eu6L6ouZL1UZzTEaLdrkERPQjPsafFs/L
 /7TKs/0gz8pqc963c9uCF07LluiafM68H8Elie42pa+gSt0siq/p89ATD0I1X4sZbPM7
 h56uUpoLbJd0dK0K4RvGxA2K/Ret12VRy9KY96d2GLg+/qVzE+sn22x42VgqOaWfSFZy
 7khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692204978; x=1692809778;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJ/7Ue64ruuo8T+szNkGJZsk2gUYlOBeVjiXucVPa+Q=;
 b=GktNLY2ekJ+hps+o/l8VKSTIevG3pJBEAO4Aq8fkw4JApK3xdQn+RdeyYCyzU1TpQM
 hdiasi2h1ATNrjftMj0/1VptJ9e1topYlDKpGqFGtBUItKccdJpwLoQ+jssnK5ar9nu5
 iGWaTYIqHPxr8pHhmmENszm5mTTdyuR+GOQwC1FJ8J/2O1ocytygzmKROnv1CDfLgsBg
 zHbQKYzt38BDk9iTruv2wj6/EheIiS1XJusS9E2kxI6eOFtDy+xL+v7e6AGzlZSjOAJr
 Od5KYSz87IJGFSvFkQdqGXilJbgKq1Y86JeysbohoT69V5pA3U0yxvvF2KcQD9Oy7JV9
 Mrow==
X-Gm-Message-State: AOJu0YxaqqASRFZpUMC/5som9RqnrKOK1BG7PNFTCuMcI5ZUpmzzMPwW
 1c/XFjkFRUdbnjqvDyDeH9SMHQ==
X-Google-Smtp-Source: AGHT+IGRD2GPdHF+WwbQeFKbhUDof/P08J1k3Vva93Q9LEWKai3kN+RBUYPs+ZycDdnTV78cytNS8g==
X-Received: by 2002:a1c:4b08:0:b0:3fb:e206:ca5f with SMTP id
 y8-20020a1c4b08000000b003fbe206ca5fmr1891670wma.31.1692204978103; 
 Wed, 16 Aug 2023 09:56:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 k7-20020adfe3c7000000b003176c6e87b1sm21935525wrm.81.2023.08.16.09.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 09:56:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: (subset) [PATCH v3 0/5] Add JDI LPM102A188A display panel support
Message-Id: <169220497726.2977065.3236775969816366659.b4-ty@linaro.org>
Date: Wed, 16 Aug 2023 18:56:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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

Hi,

On Mon, 07 Aug 2023 14:33:00 +0100, Diogo Ivo wrote:
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
> 
> Patch 1 adds the DT bindings for the panel.
> 
> Patch 2 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/5] dt-bindings: display: Add bindings for JDI LPM102A188A
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a913a739ab6e6ef10c0c47cb85dd4a105b3d9df7
[2/5] drm/panel: Add driver for JDI LPM102A188A
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=25205087df1ffe06ccea9302944ed1f77dc68c6f

-- 
Neil

