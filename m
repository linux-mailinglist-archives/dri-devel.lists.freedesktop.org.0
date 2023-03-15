Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324126BAB71
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF3C10E967;
	Wed, 15 Mar 2023 09:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F6310E967
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:02:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j2so16566865wrh.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678870958;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTpZF54k+xhywB6mdq1sWhw9d24/H6HoiMghTWdRi8M=;
 b=b7TMtw6j9VNG4+HGhgrsPVgdvOVXTtN7rwuY8+AwPOrzAA++UurS+LCh4uu14Z5VJP
 Xwo2i7nKfSP0+WS7YYT1Gh/BmlW4osTAU3lNe8u/SU1KMLUYzk9Rv8srKHcglfPSU0B6
 /7sdwLW09wxIb8b7hgp2lkDJnGTxupLHFZUdo7+9qkN4oRD96ACbV+oqqUsi4YMStyzi
 ruptsZ7vobD2jSoaN4FCPyZKhNPZd3JOxkQbUgEFyXXcQSbqvqhDrsIfQg/imEgZ2GmC
 +ER1nclVaC8ZvE1u0DAjkwuccwI0tEV6S03q0q6VPRrz2HQWxq+vJR+qPMk4A2Nobov2
 UOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870958;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTpZF54k+xhywB6mdq1sWhw9d24/H6HoiMghTWdRi8M=;
 b=PV7hMnNwBmGMcivcbWpk2XviizlYMEG423Ou9nZmhsNTTrrYfKmalzGtkf94mNU6IY
 6SkP4YJDPvSGshSAYsK/gr8sbJJ93tT+yzVnwHNVplUQm94teaJO6LG4Vnhammlxsqto
 ViL8wi8CDkLTkFIFLxI25eG6HSj2aigc83iHNvZku/+7Rlf5F7cFPu9D10pu5ztk8Os2
 q2lPsWrV0CdO98ha/kRzmuzrfVPN0CQmA2hN1MTxeaiVDBhPwCAy6m0txSyOLsQdLb1X
 J0WABsr6mnVlIFeigN3rb4bCC0svqruHDqoO15emqnNfyrax/asPLUMRc7vBiHHrIZsP
 IcXg==
X-Gm-Message-State: AO0yUKWchAyFGb1veqmF2RuHXdW5SvU6mQmKWBcYfCDnmKV28YZ9Ly9p
 iu9/PTKYecMJ0aeYX0lgAaav/x6m3cuSucBWmpcRfA==
X-Google-Smtp-Source: AK7set+3V/awLn5LeF8ya6otksI0/6+P1J1OzThA1KAIoKIixtHnkD3dfPQqu7lSmnj98Pv88QlytA==
X-Received: by 2002:adf:dfc6:0:b0:2ce:a8f4:2b01 with SMTP id
 q6-20020adfdfc6000000b002cea8f42b01mr1216119wrn.32.1678870958383; 
 Wed, 15 Mar 2023 02:02:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a0560001b0200b002c57384dfe0sm4113750wrz.113.2023.03.15.02.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:02:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230313055951.2997299-1-victor.liu@nxp.com>
References: <20230313055951.2997299-1-victor.liu@nxp.com>
Subject: Re: [PATCH] MAINTAINERS: Add include/drm/drm_bridge.h to DRM
 DRIVERS FOR BRIDGE CHIPS
Message-Id: <167887095753.2129381.13470724371681580958.b4-ty@linaro.org>
Date: Wed, 15 Mar 2023 10:02:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: jernej.skrabec@gmail.com, rfoss@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 13 Mar 2023 13:59:51 +0800, Liu Ying wrote:
> Appropriate maintainers should be suggested for changes to the
> include/drm/drm_bridge.h header file, so add the header file to the
> 'DRM DRIVERS FOR BRIDGE CHIPS' section.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] MAINTAINERS: Add include/drm/drm_bridge.h to DRM DRIVERS FOR BRIDGE CHIPS
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b28ee4476219b47604b860bd579bd9ce3979a67e

-- 
Neil

