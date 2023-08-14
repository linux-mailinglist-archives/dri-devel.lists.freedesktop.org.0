Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4130677B906
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBCC10E1F5;
	Mon, 14 Aug 2023 12:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CAA10E1E1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 12:50:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe4b95c371so24769305e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692017409; x=1692622209;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64XOobM12qUFrM2PGUblEKGDaFnRYmV14FiLNgEhwBY=;
 b=rqdlXFOUGvs1lY5LrK7gqX3vDlA8JIzbWrWp/HafRbXaOVo0saPl+r1pytUC9KThed
 UokJ5Sxz5eIrj8uvsLYsLusYEfeL8Iu/ZRjdA6jjG2fDU9cSIWYMDqhrepF9TQy+VEhe
 J4zWUgVriKWMeV3YgRDRfMePNtLDkYJuqcPLJW/K8tqC9ic8Z4Ljf8Od0xLrJO9peUFN
 gFTe9AH9sShKirce0MrRZAysJ3WtnzaX7SUCxhsKlrSrhOcaokadVV0Bp7GeaKC99GSO
 /5OUEMBqRChgU3vn1N6IxpDez7CJ00SdvjvdkTS84uc3RCJ0LyaC0BuJA6LyUXiw3/By
 /oQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692017409; x=1692622209;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64XOobM12qUFrM2PGUblEKGDaFnRYmV14FiLNgEhwBY=;
 b=Ac+N9JZLf9/dY2ZxcSWJ5X3apJiyW6C9JHUFilulm7CbH8bQXODhTKmTDfVliOMMYX
 AFc5UZRtrIgocCtXQ9QmLJI1vP922+044FmQlblyAG4DdGB1wMC466KJFLNEnpD5kjVS
 Vigs6cS+RNXjRhUYrjvey4gBeQRzCSHPW9v8U4SYb9Xb5q9HKAkwxC4187kaQ3bDIBDj
 mXWq0ucC1GJhmGjyRgOvmeQvrZG6s4lC2wRUfu46BrUikBPQX9D9h50oz/xw4BVbA9Ow
 lnvGEw1A/6hXuGyfjVi/tETOWDfc5hGpRkGTfoSx8B6LtY4ngTt04lzAGjnjOCCOkuFl
 ki3A==
X-Gm-Message-State: AOJu0YxGk/33gkwbifCktReUwSyaBJ4p5FS2eM5UhbyuqrNhOA9ygxdf
 SEkNhQJRPjM+L2xSWrbn+k3FZA==
X-Google-Smtp-Source: AGHT+IF4Y4fV2ioh2t22KoSy4G3HWMdFuiqgxjY+jZ6GbDr4OhJ2bG8ZjW18r9eQGVCZhHN9kuLDMw==
X-Received: by 2002:a05:600c:3b03:b0:3fb:c257:9f48 with SMTP id
 m3-20020a05600c3b0300b003fbc2579f48mr10413863wms.16.1692017408939; 
 Mon, 14 Aug 2023 05:50:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c378d00b003fe2de3f94fsm14183872wmr.12.2023.08.14.05.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 05:50:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Heidelberg <david@ixit.cz>
In-Reply-To: <20230812185239.378582-1-david@ixit.cz>
References: <20230812185239.378582-1-david@ixit.cz>
Subject: Re: [RESEND PATCH v2] drm/panel: JDI LT070ME05000 simplify with
 dev_err_probe()
Message-Id: <169201740818.1405695.2158426262781517183.b4-ty@linaro.org>
Date: Mon, 14 Aug 2023 14:50:08 +0200
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 12 Aug 2023 20:52:39 +0200, David Heidelberg wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.
> This also handle scenario, when EDEFER is returned and useless error is printed.
> 
> Fixes error:
> panel-jdi-lt070me05000 4700000.dsi.0: cannot get enable-gpio -517
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: JDI LT070ME05000 simplify with dev_err_probe()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ae6546835efaa7195aaaa10e5ff4e695cd82a816

-- 
Neil

