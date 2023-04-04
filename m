Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B86D5FF9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F6E10E218;
	Tue,  4 Apr 2023 12:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981A310E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:15:23 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id er13so88725394edb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680610521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNeLO/yfrx5qZBUcRPTS1m46W0sJKNmgtcjlVQfqLK0=;
 b=MX1GkM/k7Wvv4kVwPD5iJTZypvDu1JvY7Br3/Lx9HxZylVr1cdixaKy7MpHGbtJl68
 oueFBklE/kvlMwon1iZdQBFezLnc0xc4gZ8cPRAH2FY+HertVLVg4N8mj4RDL09bDWwo
 JNAeA74R31LQ1hcpJRbFW6cI/rHB6EswvmmJhJKO+59GHnDVuZhzMy1j5lWDv4wpAlhy
 bjqnGqkVFwRV+pEPjBVhE1x+0AO5SiSo/p68IHQRs6fkqElP6NBBrhdIF19tOkiqzyT8
 WXUsInRs3BZ42NgZOz05MV3EfMBEXGdF8C4ewdjsJixVJztB5ePxwUCjgXzU+9L87gtS
 D4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680610521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNeLO/yfrx5qZBUcRPTS1m46W0sJKNmgtcjlVQfqLK0=;
 b=ZKzfwmb/vqkXefqalZ5BRI5WA97/dcpsWabTOj007QpF0PQXox2GfunP3h74apz9nb
 uJT1TBd7+uPeFCeGPc9afFQJU5kaAVMWuytO2u8HP61cxw81b2ci+Ji+1zT3vMFNpH4C
 pyIZCoewqMUaNDh07R9RjhDaD7yb/Nz7q4MPTxGakwubjjUGQig5H1gHTLlMxlv4zvmY
 N5XB24Gy6gxpFnk1PS/0QZtuybP9WeZ1L2iChztseHRy0SEZFoSUaZ5rQvlcq1noNfuS
 jYiN0jSS+ZqXkfiXcRLc1G8aOdFKWRxj8T5Hek7Mn1d6ovIpozxW0TeDSITkOqhxtzI9
 L3WQ==
X-Gm-Message-State: AAQBX9dRed5HWXfmgFK8MWbG2dKEBy7eBEwfRrIcLNRCRD6O9cCPVGKi
 8mKhQmmJSamUAxOAMdJUmso=
X-Google-Smtp-Source: AKy350bQ71nVxPcoRSh43ab4cRnZtZe6Ur+WJgNdzEfCmeG2QbKWF6iZ7ySINe5NarE8PgKOKCIgVQ==
X-Received: by 2002:a05:6402:1204:b0:4ac:b528:5727 with SMTP id
 c4-20020a056402120400b004acb5285727mr2477500edw.1.1680610521704; 
 Tue, 04 Apr 2023 05:15:21 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a508718000000b005024aff3bb5sm5809772edb.80.2023.04.04.05.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:15:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: (subset) [PATCH v2 RESEND 2/4] drm/tegra: dsi: Clear enable
 register if powered by bootloader
Date: Tue,  4 Apr 2023 14:15:20 +0200
Message-Id: <168061050774.2055282.2696750809957075732.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20221128162851.110611-2-diogo.ivo@tecnico.ulisboa.pt>
References: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
 <20221128162851.110611-2-diogo.ivo@tecnico.ulisboa.pt>
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Mon, 28 Nov 2022 16:28:49 +0000, Diogo Ivo wrote:
> In cases where the DSI module is left on by the bootloader
> some panels may fail to initialize if the enable register is not cleared
> before the panel's initialization sequence is sent, so clear it if that
> is the case.
> 
> 

Applied, thanks!

[2/4] drm/tegra: dsi: Clear enable register if powered by bootloader
      commit: 588ed52d31ab37c5ac86816911f6428d2de265a6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
