Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05008624781
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498AD10E15B;
	Thu, 10 Nov 2022 16:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8A510E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:50:06 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so2056708pjk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZVqd+PvgZXEgpR5oiDP8I3WYALDkF1kwCNnCVwq1mpo=;
 b=KOrM7nTAXpp3ofHwJJRvDPycbrxwy/BUtfmO83XndSZ41PtDxOacBE0DrQFpxytI1Q
 JJCh2k1V7GgfY+6JXBzLBO19fnq0I4c2Jxvx68eO/LtakOsggQNrDZKf2M8qFcI91F9P
 1JIEUsrASBrRow9EergEBIaIRb3VyJeJht5a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVqd+PvgZXEgpR5oiDP8I3WYALDkF1kwCNnCVwq1mpo=;
 b=7fyy/9x/6dccAbYx8/hny7O70bEaHMDd06eYp7pZ5oWzFBhKXWmhj6LUjHlTuxioNI
 dsYWstt/CrZZgoAwdteJ6rjKPNLEqG7H/g4nwrDCKLNXnRThW/AtjcMR3J4VFV2XGES5
 tZznhWFQ7DRgsxX7yHRnEnW2Obz80Kgdl2R38jECU/a8oM0WCcEN9cEk9iEei8iCAgk5
 0mIoFMlDTYAS3JuXcYja8dnuDMGmR1XXdvrWrupltnHOsbBK1Sne+a53oWTE4lOGp+YX
 /Mi2eRchhp4oFAJcp1z72NVUCbrEmOQONgq/TPlEbppFnkZETOrcfFULESFRRvJEwPhy
 J/Dw==
X-Gm-Message-State: ACrzQf3qNHLS37CFRXBTo5Mk6emQgiFMaCzbVQvQm0fipT4XjOyN/P5f
 u4JnnpGVOOrDddhU3CvxyXR72A==
X-Google-Smtp-Source: AMsMyM68qD69p1bOkhPUXlhFPk3ZndMHRyb1mJfNywAclXB2dk8dtu5d1uueCVKTxNOxV0ehqJ3EmA==
X-Received: by 2002:a17:90b:4d91:b0:213:f1b:dab5 with SMTP id
 oj17-20020a17090b4d9100b002130f1bdab5mr65253209pjb.95.1668099005884; 
 Thu, 10 Nov 2022 08:50:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090264d700b0017f92246e4dsm11375728pli.181.2022.11.10.08.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:50:05 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 10 Nov 2022 08:50:04 -0800
To: Lyude Paul <lyude@redhat.com>
Subject: Coverity: nouveau_dp_irq(): Null pointer dereferences
Message-ID: <202211100850.7A8DD75@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: "Nathan E. Egge" <unlord@xiph.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Aug 31 19:10:08 2020 -0400
    a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")

Coverity reported the following:

*** CID 1527266:  Null pointer dereferences  (REVERSE_INULL)
drivers/gpu/drm/nouveau/nouveau_dp.c:237 in nouveau_dp_irq()
231     	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
232     	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
233     	struct nv50_mstm *mstm;
234     	u64 hpd = 0;
235     	int ret;
236
vvv     CID 1527266:  Null pointer dereferences  (REVERSE_INULL)
vvv     Null-checking "outp" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
237     	if (!outp)
238     		return;
239
240     	mstm = outp->dp.mstm;
241     	NV_DEBUG(drm, "service %s\n", connector->name);
242

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527266 ("Null pointer dereferences")
Fixes: a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")

Thanks for your attention!

-- 
Coverity-bot
