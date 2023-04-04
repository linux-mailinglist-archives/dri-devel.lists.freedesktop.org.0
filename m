Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474E6D62F1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7C210E2D4;
	Tue,  4 Apr 2023 13:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DD610E2D4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:33:22 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cn12so130713134edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680615201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5+woa08wseMH5MjO97pGr3JdhcbzGoi59ia9RFN3Ww=;
 b=FlZuNVXlvaoC5Wv+YnY2RdnLtndu9KzSwF8WyPljhxojtngb7HOXQEcT41x3o5Wiui
 4GcmqNxHMZ8NJ+easmKxOFdeZAy6Eagixzw/BeoDtozWcL2EnTURRezAevbLOsxdq++I
 w0+WXL1Q9Lh3tuMRCA98gyQiBzFPJq8HryHf4AmbJ6gUqr5ZVVtIqRxuNQK/U/s78KFU
 ffm9vrLAHt8oXRYLQNZa2Xi/VlJKlR6mXXN+RrVBRc8EDFFQjIxa5sq4iFqi4coRsbof
 PCeVZJwhZquMM8lKYrJUtUP1u/D4M+dbonlDEFnZH7qcOU0zG9IWntx+4ghzk3uAd+je
 W7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5+woa08wseMH5MjO97pGr3JdhcbzGoi59ia9RFN3Ww=;
 b=tpGecWGXwL5/+EeTY+peX3bYHpAb8gjZX86cpNPMVoTg6+d6ku3xeRrIw1+KEHDIqW
 IVsymBcXTQ/sUaeZi/bpqXojZLLTJb6iiCyFwwh+wmXEYSN+KrJh2+bNcnyK1QCv+CFa
 BcFJLvmmrFdps4oyVdRrpD2dR0XbVy6qiKx8upbBZcuMu/zVemda8nH0G7Ki5DTq4hvh
 jKP1Ya1e41e9LAS0zbcdnrHKeLsY8aCFq8QYZ0KRoDMTbI+5zARHBLNFR5KdJnBX839q
 0Yo4hR6dTpDja5ZzDQu02uSgKbyIZl47/h7M88OregEU2g/Fq6F7KwBRO3mEqWwNDG2P
 /+mw==
X-Gm-Message-State: AAQBX9fwHVGOvks1hSIjwGI2H5eHfIPedbC/zS6GJPIVvalWSiPmznEj
 Qsk+Jq1pP7bNDJoOR61Udxg=
X-Google-Smtp-Source: AKy350ZdIonRRf6XX/HAyEe71VdG9jRXAAxqNYES+G+X07dyc3Y0uCX/rKruNGsa+tDIkjpFj816dg==
X-Received: by 2002:a17:906:1281:b0:947:405a:955f with SMTP id
 k1-20020a170906128100b00947405a955fmr2308182ejb.31.1680615200865; 
 Tue, 04 Apr 2023 06:33:20 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a170906394100b00933356c681esm5979689eje.150.2023.04.04.06.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:33:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: nvidia: Drop unneeded quotes
Date: Tue,  4 Apr 2023 15:33:16 +0200
Message-Id: <168061516878.2141244.14923745008184055839.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331182159.1900674-1-robh@kernel.org>
References: <20230331182159.1900674-1-robh@kernel.org>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Fri, 31 Mar 2023 13:21:59 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: nvidia: Drop unneeded quotes
      commit: c94673e80377d67ba36ee4059d7814b2ab98fa71

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
