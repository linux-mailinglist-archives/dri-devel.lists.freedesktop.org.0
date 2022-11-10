Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA23624747
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9A910E14E;
	Thu, 10 Nov 2022 16:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF3210E042
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:42:58 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so2054268pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EfgsLc2+G9HPdaL8aH3Xzd8lv8JeS+eH5Ba4xV4l/yA=;
 b=IruV/cOGCppTZMecE2WVY8zukl+kcYVeoo7vFWW6yGTBj+JNzqw7SwdygU11Ap5tXp
 +IWICnrL7OpPlowtcizxkZ8u7fNIf7VOdlhb+UCVVdiNOgc1eLngTeYpENadc4W7k2ql
 lwVFIi2Zm+49ixbK5qXD6pVFvTfaAaG7iPD9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfgsLc2+G9HPdaL8aH3Xzd8lv8JeS+eH5Ba4xV4l/yA=;
 b=3uhRGTlUDdc0hQ3csGEmwTFjDPeagU4qUg9yziKJYLKymBD5giZuG9/xMb+HXlgeTh
 JMlJIXxW3v8+4A5G4dBYe9lfJDwK+NkVqH9uFf2FRJuPZORKd8uRazsTGWEEUB3S2LVf
 6nuQinKVelM0ybjgAoIPSKVwx7rc8CbGiW7h7ymxMmqRoSQwxIwDCn2a45UWMivO5fLN
 Sl90Qp7Ya8qreP0Tq4pJG70CL2K2PGZGnYAFRxSZE8QwpTcYNLjRiGkIFh3BKP0t01mj
 5EjYzqa4zbV0tQ38OFnEqJU8nRXXI3GLrnC42cFk/WZcslTgEXfhpFz2gTtPBBe4eYjT
 UpKw==
X-Gm-Message-State: ACrzQf0hD9sBKRVQecoNvZf6Go6SsJiZEHsmz88POBoeEhfCO1fsh+Nd
 dQL4RXQDIYsksW4dxFXYUxJMnA==
X-Google-Smtp-Source: AMsMyM4zFp+Wrf9N4R4CuG0pbWGCwDSSClCq2oRdgHwJJKI1w+NXOW7FDTxl0KXE16WpLHC9sb8z8g==
X-Received: by 2002:a17:902:82c2:b0:188:5581:c8de with SMTP id
 u2-20020a17090282c200b001885581c8demr1293917plz.140.1668098578376; 
 Thu, 10 Nov 2022 08:42:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1709027fc400b00186f0f59d1esm11373906plb.192.2022.11.10.08.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:42:58 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 10 Nov 2022 08:42:57 -0800
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Coverity: nv50_hdmi_enable(): OVERRUN
Message-ID: <202211100842.076585A@keescook>
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
    f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")

Coverity reported the following:

*** CID 1527272:    (OVERRUN)
drivers/gpu/drm/nouveau/dispnv50/disp.c:801 in nv50_hdmi_enable()
795
796     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
797     	} else {
798     		size = 0;
799     	}
800
vvv     CID 1527272:    (OVERRUN)
vvv     Overrunning struct type nvif_outp_infoframe_v0 of 8 bytes by passing it to a function which accesses it at byte offset 21 using argument "size" (which evaluates to 14).
801     	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_AVI, &args.infoframe, size);
802
803     	/* Vendor InfoFrame. */
804     	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
805     							 &nv_connector->base, mode))
806     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
drivers/gpu/drm/nouveau/dispnv50/disp.c:810 in nv50_hdmi_enable()
804     	if (!drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
805     							 &nv_connector->base, mode))
806     		size = hdmi_infoframe_pack(&infoframe, args.data, 17);
807     	else
808     		size = 0;
809
vvv     CID 1527272:    (OVERRUN)
vvv     Overrunning struct type nvif_outp_infoframe_v0 of 8 bytes by passing it to a function which accesses it at byte offset 21 using argument "size" (which evaluates to 14).
810     	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
811
812     	nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
813     }
814
815     /******************************************************************************

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527272 ("OVERRUN")
Fixes: f530bc60a30b ("drm/nouveau/disp: move HDMI config into acquire + infoframe methods")

It looks like this should address &args not &args.infoframe, if the
intention is to include the "data" member.

Thanks for your attention!

-- 
Coverity-bot
