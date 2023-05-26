Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD41712193
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D296010E7B8;
	Fri, 26 May 2023 07:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE3B10E7B8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:55:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6e4554453so2935755e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685087748; x=1687679748;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpL3uEFDFKjWPCzPHepbX3dXRR3FC7vQMJr4NbW5aP0=;
 b=ZsmckDA7LsnkaxJrVK3tmKlQynqgJmjjQExD9NUJJQWMHTIEwcW7losOa7i2BN0h5I
 MEZcxabmfA9WXWfq8eiIf3i8TL1R64xlt80d+FDLftZwo9jhgZBNHFHObX/A7IF//BZa
 riuWVfy40aXz5gv+TbtkHR2uHquyS/5Y3+BVFhqYXN5gR0AR3tGoxA1Kv7i2wHfaOrpc
 +fCC5wU5n6Lu8YhZZbMTRFaQkxHpQpahFj/TDlZddjgCRznjBebeDAa1l0xXBReAofdA
 Yfv69f24tLTyzQHNVeRQUPEYB1Bam7qfEm+9L4GJkwMpH/O/LQV/17HO3n218QgkTFzF
 wruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685087748; x=1687679748;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpL3uEFDFKjWPCzPHepbX3dXRR3FC7vQMJr4NbW5aP0=;
 b=BuzJXutF4FyRH5hbSGUg1SqoosWksAXuo4hOcN6AutCT0Ar4JaxBwdFwC/PARymDsK
 QklzDVtF7AcV1Ilwy+vp9l/JrUDLJZDVv4BwYVEfowR2dxXRgJQGfGT6+efA2boCiwLN
 GJ8hvSYfIAts7eXjYxt5U4tJ4jhdgJtojK5FNkJkHWVN3kYhOq65rMHkLoPOoyB+6EWv
 9+IcV7sufoM1QEGRwRu0oOUjbWBm0cW3WCA6cDwfrXdQgPeBgXoU0ZgKBPX6WNmF8YD2
 gy8LfaL2nLHcugOIHOpBj1wxCUqJik0sT9LIrPBstdLErbJc2U52TJw2FyAggswBG/kP
 TFDA==
X-Gm-Message-State: AC+VfDwPA54BuooVI9E5bIxxEbpEYM671VpdeHzcu7N7zEJpUhcv3GeP
 2kBJIJBiN9Uw8aYkk8Bhp0mUVZFTte+g0IiUPV/Afw==
X-Google-Smtp-Source: ACHHUZ6z8AFtLFz0PBmEeCqM+0XShGQbQjRhgt9gvT+iqFu5g6ijXhOgbPWqkWX/pxyhC6PMZxcd7w==
X-Received: by 2002:a05:600c:283:b0:3f4:2897:4eb7 with SMTP id
 3-20020a05600c028300b003f428974eb7mr901242wmk.38.1685087748449; 
 Fri, 26 May 2023 00:55:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a1c720e000000b003f4b6bcbd8bsm4390597wmc.31.2023.05.26.00.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 00:55:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230516085039.3797303-1-dario.binacchi@amarulasolutions.com>
References: <20230516085039.3797303-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH] drm/panel: simple: fix active size for Ampire
 AM-480272H3TMQW-T01H
Message-Id: <168508774745.1495117.6907071154193975716.b4-ty@linaro.org>
Date: Fri, 26 May 2023 09:55:47 +0200
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
Cc: dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 16 May 2023 10:50:39 +0200, Dario Binacchi wrote:
> The previous setting was related to the overall dimension and not to the
> active display area.
> In the "PHYSICAL SPECIFICATIONS" section, the datasheet shows the
> following parameters:
> 
>  ----------------------------------------------------------
> |       Item        |         Specifications        | unit |
>  ----------------------------------------------------------
> | Display area      | 98.7 (W) x 57.5 (H)           |  mm  |
>  ----------------------------------------------------------
> | Overall dimension | 105.5(W) x 67.2(H) x 4.96(D)  |  mm  |
>  ----------------------------------------------------------
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f24b49550814fdee4a98b9552e35e243ccafd4a8

-- 
Neil

