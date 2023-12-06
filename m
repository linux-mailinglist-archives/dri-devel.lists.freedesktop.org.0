Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28C806FC3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8B710E0EE;
	Wed,  6 Dec 2023 12:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A4210E0EE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 12:31:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c09d0b045so41102665e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 04:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701865907; x=1702470707; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZxostNpnhnoikPd/ZmMniURAQ+MP+6lW4cLA1j5SE9U=;
 b=wMfmMFC9P5wqlwAEJ5i8vj+j+EZMKjldsL/YfCihZHH4mpXu0vBm1PIVLKEnTseF1p
 x6GQhKw9ht14zhCq9ITF3ZrcrOz+IakQYth9e6kgi+Z5+ppP9bbzx3TgyIQpQB3ShdDA
 MA21IVgqAq+4wgf/aYIHotTzKMgSk/Ope3kWzjAP3Rgu268895RKeLlSANvb7m1HMlYz
 eYQeUmDptUcBwzB1kSl9xov8rRejafscojNPDp8Boq1rlCXo5joT6OS/qFDWcjdeYml2
 q9PdRq/o82uS/RbABezBs0Ow93P9R3RfOp0bS3DlYzBnFfBQA+0rYhLl7ulsTU78eeLQ
 5Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701865907; x=1702470707;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxostNpnhnoikPd/ZmMniURAQ+MP+6lW4cLA1j5SE9U=;
 b=gn95lZZRQeTA5gmEOw+Bq3LVAEfvaxik08UlL++maebxXxzvN0zB3dnyWr8DBE8UkT
 TqGlnlQ0kKAdVKJbogTAMjwa9Vqlrd1iC7SdDDytkmNdD2lu6+Yls9Apuq39Ow7pHash
 xBwsVWIvT4DtqZx9eYZj/WXWVXLNWCLaAQLYEKnkWKzimV2bFKx6e1+saIf3nDLfcTm+
 qkWUdDXkzptJzLvi/fZ1GQV+vSEN81PmBBjAp+QYrP5zKhCCBSCaGBuqvavDtPIWAeMb
 +HWTz0CzWSsHbwul/92X9r8wgRZ4MKecM8b2NzfXI/QTgZjSO8Kgq8cdWAfu+BcyL/RY
 3ZIw==
X-Gm-Message-State: AOJu0YxbyQROuHlpGbqdt2lcYD8u3dhP4btV6C5eOJRwcqSwQllybEZx
 Pp4MffHYVwdo/YRtVbw3WaC3tA==
X-Google-Smtp-Source: AGHT+IFpGSA211S3P2UF/unMD+Ihfl/KD4uH2IPhcpAFB+PIos+7uFviZLx8/jems9H/4757mlL48g==
X-Received: by 2002:a05:600c:ac8:b0:40c:5cf:89e7 with SMTP id
 c8-20020a05600c0ac800b0040c05cf89e7mr407557wmr.261.1701865907052; 
 Wed, 06 Dec 2023 04:31:47 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d5909000000b003333bd63792sm11224744wrd.117.2023.12.06.04.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 04:31:46 -0800 (PST)
Date: Wed, 6 Dec 2023 15:31:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sarah.walker@imgtec.com
Subject: [bug report] drm/imagination: Implement firmware infrastructure and
 META FW support
Message-ID: <4e111296-112e-4b30-8dc5-3c5ddeb5ed36@moroto.mountain>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sarah Walker,

The patch cc1aeedb98ad: "drm/imagination: Implement firmware
infrastructure and META FW support" from Nov 22, 2023 (linux-next),
leads to the following Smatch static checker warning:

drivers/gpu/drm/imagination/pvr_fw_startstop.c:210 pvr_fw_stop() warn: odd mask '0xffff & 0xffff0000'
drivers/gpu/drm/imagination/pvr_fw_startstop.c:213 pvr_fw_stop() warn: odd mask '0xffff & 0xffff0000'
drivers/gpu/drm/imagination/pvr_fw_startstop.c:216 pvr_fw_stop() warn: odd mask '0xffff & 0xffff0000'
drivers/gpu/drm/imagination/pvr_fw_startstop.c:219 pvr_fw_stop() warn: odd mask '0xffff & 0xffff0000'

drivers/gpu/drm/imagination/pvr_fw_startstop.c
    187 int
    188 pvr_fw_stop(struct pvr_device *pvr_dev)
    189 {
    190         const u32 sidekick_idle_mask = ROGUE_CR_SIDEKICK_IDLE_MASKFULL &
    191                                        ~(ROGUE_CR_SIDEKICK_IDLE_GARTEN_EN |
    192                                          ROGUE_CR_SIDEKICK_IDLE_SOCIF_EN |
    193                                          ROGUE_CR_SIDEKICK_IDLE_HOSTIF_EN);
    194         bool skip_garten_idle = false;
    195         u32 reg_value;
    196         int err;
    197 
    198         /*
    199          * Wait for Sidekick/Jones to signal IDLE except for the Garten Wrapper.
    200          * For cores with the LAYOUT_MARS feature, SIDEKICK would have been
    201          * powered down by the FW.
    202          */
    203         err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_SIDEKICK_IDLE, sidekick_idle_mask,
    204                                 sidekick_idle_mask, POLL_TIMEOUT_USEC);
    205         if (err)
    206                 return err;
    207 
    208         /* Unset MTS DM association with threads. */
    209         pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC,
--> 210                        ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC_MASKFULL &
    211                        ROGUE_CR_MTS_INTCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);

What's the point of these masks?  They don't overlap so they just equal
zero.

    212         pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC,
    213                        ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_MASKFULL &
    214                        ROGUE_CR_MTS_BGCTX_THREAD0_DM_ASSOC_DM_ASSOC_CLRMSK);
    215         pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC,
    216                        ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_MASKFULL &
    217                        ROGUE_CR_MTS_INTCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
    218         pvr_cr_write32(pvr_dev, ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC,
    219                        ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_MASKFULL &
    220                        ROGUE_CR_MTS_BGCTX_THREAD1_DM_ASSOC_DM_ASSOC_CLRMSK);
    221 
    222         /* Extra Idle checks. */
    223         err = pvr_cr_poll_reg32(pvr_dev, ROGUE_CR_BIF_STATUS_MMU, 0,

regards,
dan carpenter
