Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1F6A7FF4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 11:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE57D10E443;
	Thu,  2 Mar 2023 10:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0880910E443
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 10:29:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l25so16028661wrb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677752975;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aG0uzlam+VIYSFcSVrtgNaOvUeUxZNJ+qAZWm8ja/DY=;
 b=qiEuzk581mlkYapti1YIm/V0XjlG20KCHFn4YAGJTpbZyclABGs8iQcEU5h1RsXS+v
 ML9MQ9w5SS2nvl1b7/Nd5/hexpweNNUi6QRW0pWlOLEQZCi/nNf9jcL5VsONz7DyOp45
 yIYUSE3vJ+etNZH3HoS98x2JN0Lw9QdLpkdX4TYPwHnN6XZ8e/G9XhSLVx7q7Yzk82LA
 AvAiZRA+FMy20PQwO5QgXWobPHpmexmqiJn54YeshKpniMfrY1UuEF23rwo0SOTmQSVV
 ZMVI/omRyWUAGyUq+cArdaMAtM81zuKUZ570O5+bSmz+Q54/l5sTw1GiryHNKOce5Q7X
 56zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677752975;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aG0uzlam+VIYSFcSVrtgNaOvUeUxZNJ+qAZWm8ja/DY=;
 b=kstt7HM+AqZcg65d9toCkTPIUgMG5t+C/5qkEhtjw3u6/3q9VJzjIgLyssu1mgLbPx
 O9xuhpCqFU0eoSwqP/eHcVPB1YW6Id5Y543C1bXNWtSzyOkfE+da/OX4zerNAwG7rC+E
 wGRC9S1c4nVYSr03kZNzH62C/SZbndIUogNRmvPNwCP5XO20WZQvDJjXnmzpgDH9neTY
 orG19AHZD7QayFpAWQ1lNNg1X1S8sJ+mEqv3erYraO4WNWHvO9vkBtz4oisLCtnnzW8q
 JWjjO/2391OvUKVu/V/YH2OpAjbnV29Sic7ebkomHhkJzkTp8U7Itbb4Lr7L22bt0jcr
 sJ6A==
X-Gm-Message-State: AO0yUKVcf1dE22s3AOohMrnvP75i1HiuYgQtGspqdV9y6Jf5W5Yit0Tu
 DE7T1sTOzMoNbXoN05bHqCAjTA==
X-Google-Smtp-Source: AK7set9vEdzBVf4lPIVfbQuTGQ+LT+gsnEcEJwXGUvFZFRmt6hqek/sgmyehiQPAW/KVqZHNXngUpA==
X-Received: by 2002:a5d:4586:0:b0:2c7:1d71:e672 with SMTP id
 p6-20020a5d4586000000b002c71d71e672mr6879122wrq.7.1677752975373; 
 Thu, 02 Mar 2023 02:29:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d464e000000b002c558869934sm15069137wrs.81.2023.03.02.02.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 02:29:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
References: <20230216-topic-drm-panel-upstream-maintainance-v2-1-ffd262b72f16@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as maintainer for DRM
 Panels drivers
Message-Id: <167775297427.128880.7902941265688645008.b4-ty@linaro.org>
Date: Thu, 02 Mar 2023 11:29:34 +0100
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 01 Mar 2023 10:47:35 +0100, Neil Armstrong wrote:
> Add myself as co-maintainer for DRM Panel Drivers in order to help
> reviewing and getting new panels drivers merged, and Remove Thierry
> as he suggested since he wasn't active for a while.
> 
> Thanks Thierry for all your work!
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] MAINTAINERS: Add myself as maintainer for DRM Panels drivers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4ddeb90d602ac58bcf99924eb34d8b2f820ce11d

-- 
Neil

