Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6D27FB59
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287F6E888;
	Thu,  1 Oct 2020 08:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ECA89DB8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 13:47:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so1777758wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atcomputing.nl; s=atcomputing-nl;
 h=message-id:subject:from:to:date:organization:user-agent
 :mime-version:content-transfer-encoding;
 bh=DYqXNtnLEfZnCBFKtbviH+9NWjsKFBRmS/kwN3GTpa0=;
 b=HIYLfPKnGM8o5bdjc50HwUlCMAP3utMxQMs1kopwBfUxU4mwMV3d5yijzGxs5ccaEE
 Mb2jzlTBU7zoV8gjbps5lidJzdaB/la8hU43FSjJ5BkSOE3M7bzi3TILrnUv26JyDgyn
 pRPTdYNWmAHIHyIyFHpO8vwRmXbxbQSgRfsmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=DYqXNtnLEfZnCBFKtbviH+9NWjsKFBRmS/kwN3GTpa0=;
 b=h8FyMXVol5JUEXSQbAFTlT9Ibat80YUcI/D2Bwa7EsQggzHJ9sLLY9kdbNfcLmNcBM
 GBoL0jat5GsP9iC0JYrZ2Cn3yrhrRIKHeslR3ixmQhRRYB8kVIFPbuAy30u+sEfn862Q
 hMjHKKXXYvFXm5B+OeQ0seA2SvVgtyIh4vqjBs1q0q2pkp9whDrp8w15YFSUj7trOQjx
 f+tPdUNx7j4lypolt77iu1ljVSZrm6oA4hf9rCdlsfuMkP+a5u4UaVq2/aWt9P1Py/IB
 YiR6tvEDPDwEVhfWLeIjSYlUJqPWSPq3pAiJ6OdGp33RacYzZCwYdaOVnPPVw6Rc26JJ
 FV5A==
X-Gm-Message-State: AOAM5313OUeoUIMNSjOQtAr5aqgrlZjztn5YWJJSEFg6iWfTDb3ySaY/
 nIcavstLE3aJBdn6ObSt/nx8EQ==
X-Google-Smtp-Source: ABdhPJzN/PZ6aGuW3RXOEPyUnQQ8HCa2Nbz6+quQg/MxuSdPTN35SEMoxvzwBkcsYYv5VfQ8XG4bUQ==
X-Received: by 2002:a05:600c:283:: with SMTP id
 3mr3273113wmk.110.1601473627953; 
 Wed, 30 Sep 2020 06:47:07 -0700 (PDT)
Received: from nyx ([2001:980:74ee:1:1ec4:4a28:e4c9:705c])
 by smtp.gmail.com with ESMTPSA id v128sm2797486wme.2.2020.09.30.06.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 06:47:07 -0700 (PDT)
Message-ID: <60a804aa6357eb17daa1729f4bce25e762344e9f.camel@atcomputing.nl>
Subject: [PATCH] Revert "drm/i915: Force state->modeset=true when
 distrust_bios_wm==true"
From: Stefan Joosten <stefan@atcomputing.nl>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2020 15:47:06 +0200
Organization: AT Computing
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fix of flagging state->modeset whenever distrust_bios_wm is set
causes a regression when initializing display(s) attached to a Lenovo
USB-C docking station. The display remains blank until the dock is
reattached. Revert to bring the behavior of the functional v5.6 stable.

This reverts commit 0f8839f5f323da04a800e6ced1136e4b1e1689a9.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1879442
Signed-off-by: Stefan Joosten <stefan@atcomputing.nl>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b18c5ac2934d..ece1c28278f7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14942,20 +14942,6 @@ static int intel_atomic_check(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
-	/*
-	 * distrust_bios_wm will force a full dbuf recomputation
-	 * but the hardware state will only get updated accordingly
-	 * if state->modeset==true. Hence distrust_bios_wm==true &&
-	 * state->modeset==false is an invalid combination which
-	 * would cause the hardware and software dbuf state to get
-	 * out of sync. We must prevent that.
-	 *
-	 * FIXME clean up this mess and introduce better
-	 * state tracking for dbuf.
-	 */
-	if (dev_priv->wm.distrust_bios_wm)
-		any_ms = true;
-
 	intel_fbc_choose_crtc(dev_priv, state);
 	ret = calc_watermark_data(state);
 	if (ret)
-- 
2.25.4


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
