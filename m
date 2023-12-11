Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA2F80C433
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AE110E088;
	Mon, 11 Dec 2023 09:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1910E088
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:16:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c0fc1cf3dso44726095e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702286175; x=1702890975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W68af/91Atj1zDTUN4IE+pQHHryD09cfa+2lKqJ1RE0=;
 b=D7MIrxOwz+8Y21vh4o36Xt7dEtpwAy/xA803GdIzrN8pnLExhjCMabsCHb7BR+zTRU
 TbNeZnGTREvrAezKBq9ZgAkrJw1BFj4fEDe7tAYGzfMTb+pu/VBOk++pmOup5Vt1nHMk
 Sf1hQxcqmAvVo6EYy0omk/oX+MpFZSuELypT6E1QEiR3TuUHzd0hC5NDme4DEROyLJbs
 Afc0CVfFsKaNdpdzpsEN/CK7vSfFrw/K84fiqgJXv8h11eof8dTTlhKgnGRxZCArefbt
 u6uJihyNZGktUsFUt4BOe+1NHSJvb7NKfqesZhJ31ALUXoVWnjRcDcTLSsZQhZranOHC
 0oLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702286175; x=1702890975;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W68af/91Atj1zDTUN4IE+pQHHryD09cfa+2lKqJ1RE0=;
 b=hMCGAyfuMabzy/HfnDan27cLmvZlNn97/S7Yi8LLYbTRB4gfJTYnlrt8xFe+ygVNhz
 wmk8/Cp5HhlPHUJGkY+4kg2cqanG1TPBLlXHZSzTD6b+G6a5PEYCjx8z0bPSU8+2Chu4
 Npjg89im62MCs87rCHy8u5g/C4Y6n78Ux2VGG+5YxgFjTtJKzx+ET/Dsc9bBpULl5C7I
 dTjr2mmBtxJ7nz4nZgxwp6rHc7Og/WXF+UePtFvbNyh3cXBpIUuTsPpmj/uPRDz68Wc7
 0UNa8A4dIJZ/M9/U+LdGQ+ODBr1K7s/qKD07PVs1eksENx5TKpEC+eNKCQU1PTPNsMP2
 TpAQ==
X-Gm-Message-State: AOJu0Yx6r1J+wOo2Xi7Hy83jFvGzd5YBUKRlPWVG87eUFZpGDaYIfuCv
 Cl/iL4lpJyZhSM0VgcAq35NfSg==
X-Google-Smtp-Source: AGHT+IGc7ZBXK1VFhnwmlIkMnqFbV5XQIhopbQq2WBKyxWy0zx/bRn3t4fW3cKNsLP/owsKA6iuFHA==
X-Received: by 2002:a05:600c:492f:b0:40c:3464:f816 with SMTP id
 f47-20020a05600c492f00b0040c3464f816mr1942464wmp.51.1702286175116; 
 Mon, 11 Dec 2023 01:16:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 bd19-20020a05600c1f1300b0040839fcb217sm12398470wmb.8.2023.12.11.01.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 01:16:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, John Watts <contact@jookia.org>
In-Reply-To: <20231210-fs035vg158-v5-0-d75adc75571f@jookia.org>
References: <20231210-fs035vg158-v5-0-d75adc75571f@jookia.org>
Subject: Re: [PATCH RFC v5 0/7] Add FS035VG158 panel
Message-Id: <170228617410.2409693.12184151943497966820.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 10:16:14 +0100
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 10 Dec 2023 17:55:48 +1100, John Watts wrote:
> This RFC introduces support for the FS035VG158 LCD panel, cleaning up
> the nv3052c driver on the way and documentating existing panel code.
> 
> This revision is mostly a resend and ask for more feedback.
> I have tested that it works on next-20231208.
> 
> John.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/7] drm/panel: nv3052c: Document known register names
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f48dee9ed7c992eaf6a3635db304a61ed82827b3
[2/7] drm/panel: nv3052c: Add SPI device IDs
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=095e3a99e793767ca6c0483d31fb5d4087966d51
[3/7] drm/panel: nv3052c: Allow specifying registers per panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2e6b7be84d88c0af927967418a56e22d372ce98c
[4/7] drm/panel: nv3052c: Add Fascontek FS035VG158 LCD display
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bf92f9163097dc717518d598116c1e385004b5ce
[5/7] dt-bindings: display: panel: Clean up leadtek,ltk035c5444t properties
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=43cc1ce456b57ad48220393bbb7fac6e32369233
[6/7] dt-bindings: vendor-prefixes: Add fascontek
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8fcb387a210cfc30a3b61abae21d5c8c4a55e470
[7/7] dt-bindings: display: panel: add Fascontek FS035VG158 panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=267624378ed6bebd733b4917452d78780db032dc

-- 
Neil

