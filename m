Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2DF663586
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0151F10E0D6;
	Mon,  9 Jan 2023 23:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1910E0CF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bf43so15627713lfb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
 b=mUEInqqmE5Fldni3KiH34BZppU4mDu8PM154qO665GpuW9DJ1ur/7pMXNGOes3kRUS
 h3PYGO3c4F5ygysUMnEgZDYLOiczF75Iu9ZTYjl9VGktg0D3rSoyHLTaKTY80b28KYhT
 C8B4MHA4w5YWGI149aZ+CZVT+X5lK5G/kgpyZ1ZDnGZ3YpzgTCn6qA7EOeAjXhWkcG7Y
 C9APCPRpLNZ8nu1EHqQfstpj1Rmhsttkv7R3prMFaXxAvqK8D9wRAS+xPsOkt2TEWiss
 Fd82u5U+omzmDl8avWr02no8pF2K2id9tLHZt/n0694gANWY4mk6c5/gopHE2Ea0+tlJ
 YW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQwDBfqkurhgjNXU0QKC0PjFG76vM9b8TjKB0PaMvXw=;
 b=uPj1MsC+3iddp3kPAUOHv06kCRB8XVawP+Nb4RfeKpaskZGtmo0oGGTrw4hjJsKTEx
 BCg8OnQNuUfGl5BEPj0ZS7/3qFY/QfmTM7JELgXPpLUIh+DxdWwZCCaS/bUN8KHuwoRO
 BdsjiBuFKFWMuiv+c4MVkzU63XSOcKRcR1I+yfTsyKVNCkanx1bAoHJR4szrA1GuCftd
 RzgcYGbfR3q0e2s9LHSMNDSCfOezp9YnxsbxqwuB0/H09bit5TupBv5lDMNBHCL2RkBU
 H5U2RIxSLu7HuVtyyuOaTX4G4czCk9CawatNJraWYN+KBf6rox63SAfEduZG8UyNZdfK
 3WBg==
X-Gm-Message-State: AFqh2kqbXsLVJ69dFIRyJwf5750CycymgvaDtqVaBwzYH4ozsXnv7+B5
 AjaKIzh4Qo/43yIaE7WCX+eGzg==
X-Google-Smtp-Source: AMrXdXsG6JZKs6w9h/gDGC5MhFo7Dfbs1u2JXcUblsbGBwML27jBekIvWXNSjt2DUKaI9NUC5WgycA==
X-Received: by 2002:a05:6512:3b0c:b0:4b1:4cc1:5ac6 with SMTP id
 f12-20020a0565123b0c00b004b14cc15ac6mr20815598lfv.49.1673307840097; 
 Mon, 09 Jan 2023 15:44:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:43:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
Date: Tue, 10 Jan 2023 01:43:43 +0200
Message-Id: <167330408780.609993.10652879591606544377.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231170532.77000-1-a39.skl@gmail.com>
References: <20221231170532.77000-1-a39.skl@gmail.com>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 31 Dec 2022 18:05:32 +0100, Adam Skladowski wrote:
> Document omitted 28nm compatible which will be used on MSM8976 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/852f489b36aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
