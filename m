Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F245624767
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E64A10E152;
	Thu, 10 Nov 2022 16:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313F710E152
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:48:19 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d20so1834202plr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LDJ5GbeH4x/1yjxtjF2BP9FcVDh9qhDYbgp39xw30DM=;
 b=Fe2LrkP4LSaAmzpNbzUlL4Sz8W/ckj87PLB0s4ExV2y1hr/SBDx2aHXMGIHH4Q1HZp
 SlVXRYyU/kLp+VT2nJhpvSEpLp5Gw306usHXiFoSvkdLXpFh1XiL/tfTwivIahCI7ZWT
 lxhf3NYj8/XNq2LoDLiXIqTqCb4OIr0rR5gOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDJ5GbeH4x/1yjxtjF2BP9FcVDh9qhDYbgp39xw30DM=;
 b=HW6ERsAprehtRU2h29+aqiQDG3z0TmxtDGjGPSfm94XRMjloMr9+kVnrZrK5euVbH0
 n+dTuZlhsL4ZioeL1xQzwSz+RSEothKy+JARp1XaV+qS6maBXQgORyu7J7rqE/iwKL6+
 ep1PMrS4MgcMIzKG5uRritTGLd6uJSoNuvK0GeQR2FYJa2RfCQi94CRaP+XsXHcB2aG7
 Lh2uZ7iSSNAhMPAowkQ82Zw4gN1+0iZtX0sAQmPqz9j1uyfCsQp7YdTTY0uFFSOOdKIG
 x88yBDoi6D3oQBqOGly7IjTDRLLQIxP0pxettzzPVDciIaYH9oNJ5fkSKkUpSJsnu6nr
 zENQ==
X-Gm-Message-State: ACrzQf0IhE7kJxYA58FxRU6xF+k/vFQm4ovQkFAjItihG01IpOFS7qec
 /2hthdG0THCgv+TKnnHZiUvlpQ==
X-Google-Smtp-Source: AMsMyM5L7JASpAto4IfQ834QGHOPC/E4fFSGlP1B6IiNOx5M0h4LxXrBlQ6jL1GcB0G62qrRYLVm/w==
X-Received: by 2002:a17:902:d503:b0:187:19c4:f9db with SMTP id
 b3-20020a170902d50300b0018719c4f9dbmr58312424plg.82.1668098898782; 
 Thu, 10 Nov 2022 08:48:18 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 om15-20020a17090b3a8f00b00213c7cf21c0sm50871pjb.5.2022.11.10.08.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:48:18 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 10 Nov 2022 08:48:17 -0800
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Coverity: nv50_sor_atomic_enable(): Memory - corruptions
Message-ID: <202211100848.FFBA2432@keescook>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 9 08:22:02 2022 +1000
    813443721331 ("drm/nouveau/disp: move DP link config into acquire")

Coverity reported the following:

*** CID 1527269:  Memory - corruptions  (OVERRUN)
drivers/gpu/drm/nouveau/dispnv50/disp.c:1619 in nv50_sor_atomic_enable()
1613     				lvds_8bpc = true;
1614     		}
1615
1616     		nvif_outp_acquire_lvds(&nv_encoder->outp, lvds_dual, lvds_8bpc);
1617     		break;
1618     	case DCB_OUTPUT_DP:
vvv     CID 1527269:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "(*nv_encoder).dp.dpcd" of 15 bytes by passing it to a function which accesses it at byte offset 15.
1619     		nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, hda, false);
1620     		depth = nv50_dp_bpc_to_depth(asyh->or.bpc);
1621
1622     		if (nv_encoder->outp.or.link & 1)
1623     			proto = NV887D_SOR_SET_CONTROL_PROTOCOL_DP_A;
1624     		else

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527269 ("Memory - corruptions")
Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")

Thanks for your attention!

-- 
Coverity-bot
