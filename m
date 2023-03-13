Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCCE6B7B96
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565910E57A;
	Mon, 13 Mar 2023 15:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A82410E574
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:10:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q16so11654966wrw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678720214;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XUCpRORXYheczJ2BQGJRtZxa6Mp6r71UmdeitjQxYvs=;
 b=vEISzWGhiiacHYL0o52p3JLVWsJJAPdmabMYBnS2nesKpktQWvCXn2KMfv0IXkNpWq
 +Q3LbHC+GTrzs7kM6THam9xBzj6gGzfuse00gsCVO3rOHQpZqvnF27fQyhW1NiaBQXdG
 ZZiIDvWA6G1Uqyg7hIzn7SXIeUKX1ICx8E6UUNZ+cRljV/bWrg93/Ito1H0ULCzG8gY3
 s+8kBhgFqskd+ByOqmJcOlfK7Rreon1MUmlE0sGZa+l2OT00cMo49N7bqkaEXyuO2jR7
 2t24HoUXpolSg5FlaplkfthhfAf9vp3b+vimF4sMu1kCVbWA1+VoF7XmEGzUkX2Bb48j
 AVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678720214;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XUCpRORXYheczJ2BQGJRtZxa6Mp6r71UmdeitjQxYvs=;
 b=xy2+8urQSjVHM7eDbll5Q2dSRKlppZUZmtDaVHJ9dD3b+S+ab+NjP58uRtCWQt/2fe
 VLZO2MyRUyA+V6S+fMJropSqNnxpdZTPWL4GotuFpDESKjSn4Y5RgSdj62qeDYKSbdBm
 r32E0dZss0ShQY03V/PyPRlpON9o0lowBHXKWhpVzS+T5TIeczhwTq4JQrHKT2pUNbaE
 8HrzryBmmP+gqLcQ+ckTQtQswuOl5KfXWixnVLeGA7wVYTMXz0ggV0qazLQhm07jwN2t
 pfH8YWeFQAqBF1kdKugxVBGNzCWfKClLps6puQ86UZLmSbie9EHJbgplh/yX6GkMnzzY
 L8pg==
X-Gm-Message-State: AO0yUKUWdj6GUofyNjfZgxHhmm+IsXQ1n0HXlqtXBxvV4um0qPohDUR/
 xBdgGA/WA6cnIsf4tyK9inRf3A==
X-Google-Smtp-Source: AK7set/+LGifNvhK/I/kv9BBxsO4hCHbe7swNwWhTfx8XTxPTiY1Ws2H0VTcFWYtxno3NiyHa1z1yA==
X-Received: by 2002:a5d:69c7:0:b0:2ce:ac62:65ef with SMTP id
 s7-20020a5d69c7000000b002ceac6265efmr3809937wrw.31.1678720213839; 
 Mon, 13 Mar 2023 08:10:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a056000100900b002cfe466e894sm1713054wrx.38.2023.03.13.08.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 08:10:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>
In-Reply-To: <20230313101858.14611-1-lujianhua000@gmail.com>
References: <20230313101858.14611-1-lujianhua000@gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: display: panel: Add Novatek
 NT36523 bindings
Message-Id: <167872021291.3272635.16381286857035586957.b4-ty@linaro.org>
Date: Mon, 13 Mar 2023 16:10:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 13 Mar 2023 18:18:57 +0800, Jianhua Lu wrote:
> Novatek NT36523 is a display driver IC used to drive DSI panels.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/2] dt-bindings: display: panel: Add Novatek NT36523 bindings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c61093b56a2ff15e449e8af56e96dc5a312baf25
[2/2] drm/panel: Add driver for Novatek NT36523
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0993234a00451e0a5c3e47d8b0f2e01dac6cedbf

-- 
Neil

