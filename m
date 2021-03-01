Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26E5328ADF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 19:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62AB6E880;
	Mon,  1 Mar 2021 18:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026536E874
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 17:41:38 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id c10so3265718ejx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 09:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fmHYggjF6Jt5DNFcsFSXOplHqC900eWwjViJfxnrUOQ=;
 b=Ph1JJjuOqS4RxbqS5YT9VFHcNI4IsMz6yueacxoRJOBEhFCZmrQlo4o8hTpMGQg0g8
 yGfirBtjYWTm3xk6zvuiwfoOQigcl0HGdhkD+nmMAvEfzfgd5dLF83Og2lb1imAVxogv
 y4mNixTDxFJLhVO8tR+3vw0+RzC1RDcW/pYxE4QKHiFdKAyEoWaFxG2NMf+5gnPeuWst
 bHxUSUFHOmTB0v8nmtUQiSZJ4vk9G2nvuKdV54l8KbFHM1iiOABIWrG2cG04IMNDBMvp
 dETm8q8Ir5t+J6IDRu7GCrqLOC+ULWe9Tcxxuw0N9VNu9P2Ma9JZgR2SVhVZJsi3oLWp
 OB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fmHYggjF6Jt5DNFcsFSXOplHqC900eWwjViJfxnrUOQ=;
 b=iX9yn7U4dteFW0eeN71sYXL5E9nqQmzIrS66+AOVEeBH/DH+AmN/k8IaBHXpWEsea1
 Vg/cPt7xrcEp517yjg2xaACoAWfDShRufkKuRVk5UyF0WQCM9MeI/P70ywNAwQ24BxNS
 6VaOBlVSLzyZdi7uuLVS8s3qLBM216oKNO9WfN6NN+HeaN1yvvILw+mH9+ovfVBjohYC
 7InZCJpYLirGT6xaK3kqD+R8Y04f0xW5xQZlObBCav7kFGwI6EbUnXBmcZk52FIn97by
 t4jdjQNTX4M5ZVcIVDWAkhucQanb0MBRfdtD2tuwtq2ZZ/gmsTqqx2EcKWuDy6ZKYr6S
 upUg==
X-Gm-Message-State: AOAM532QVstInK8j7qwldXF8rjQgAvz1olop0NDfdq3AqfoxUCvJZ7MT
 LHxQVXFUFT3XbK6xzLz6PEHhC+A7fAUrOMteiIRCGA==
X-Google-Smtp-Source: ABdhPJxoABcMaR5kEmZSB4acbSvWKHsyI5hA+pRpVuNgxn2ziEZdCLJsXUnLoSJMlehoTnOmuiGIuHuaGsNwmQBFxUQ=
X-Received: by 2002:a17:906:4c85:: with SMTP id
 q5mr16916646eju.375.1614620497482; 
 Mon, 01 Mar 2021 09:41:37 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 1 Mar 2021 23:11:26 +0530
Message-ID: <CA+G9fYvApAT=vx_XxhbMZ=rS8ShhYkSKa0JsHC8k0dFn5xwU=Q@mail.gmail.com>
Subject: rcar_du_kms.c:781:24: error: passing argument 1 of
 '__drmm_add_action' from incompatible pointer type
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
X-Mailman-Approved-At: Mon, 01 Mar 2021 18:24:50 +0000
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, lkft-triage@lists.linaro.org,
 linux-stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On stable rc 5.11 the x86_64 build failed due to below errors/warnings.

drivers/gpu/drm/rcar-du/rcar_du_kms.c: In function 'rcar_du_modeset_cleanup':
drivers/gpu/drm/rcar-du/rcar_du_kms.c:754:32: error: implicit
declaration of function 'to_rcar_du_device'; did you mean
'to_rtc_device'? [-Werror=implicit-function-declaration]
  struct rcar_du_device *rcdu = to_rcar_du_device(dev);
                                ^~~~~~~~~~~~~~~~~
                                to_rtc_device
drivers/gpu/drm/rcar-du/rcar_du_kms.c:754:32: warning: initialization
makes pointer from integer without a cast [-Wint-conversion]
In file included from drivers/gpu/drm/rcar-du/rcar_du_kms.c:17:0:
drivers/gpu/drm/rcar-du/rcar_du_kms.c: In function 'rcar_du_modeset_init':
drivers/gpu/drm/rcar-du/rcar_du_kms.c:781:24: error: passing argument
1 of '__drmm_add_action' from incompatible pointer type
[-Werror=incompatible-pointer-types]
  ret = drmm_add_action(&rcdu->ddev, rcar_du_modeset_cleanup, NULL);
                        ^
include/drm/drm_managed.h:25:20: note: in definition of macro 'drmm_add_action'
  __drmm_add_action(dev, action, data, #action)
                    ^~~
include/drm/drm_managed.h:27:18: note: expected 'struct drm_device *'
but argument is of type 'struct drm_device **'
 int __must_check __drmm_add_action(struct drm_device *dev,
                  ^~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Build link,
https://ci.linaro.org/job/openembedded-lkft-linux-stable-rc-5.11/DISTRO=lkft,MACHINE=ls2088ardb,label=docker-buster-lkft/8/consoleText

-- 
Linaro LKFT
https://lkft.linaro.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
