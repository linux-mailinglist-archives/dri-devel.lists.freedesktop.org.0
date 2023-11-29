Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FAE7FDBE8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5A310E623;
	Wed, 29 Nov 2023 15:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7010E61D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:47:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9b77be7ceso24022531fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 07:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701272856; x=1701877656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRJn66jmWmp7/ZR7vFS84ebK8490j6jGvEbdIOkMUdw=;
 b=ofe+EEuNJO61Ytg7KMyYfWqEi/SdsZUTuSHyecUhY4NYR9/cozYkNF+3hDWqYuyy2r
 lwxv8BjU/HYTqAAfjqJTjyO6JrMQmSZPsiAmQgiH0IThPscfCRieDcjQLC2dqufUfU63
 iXSALFXPnKFuwOH5omkL6ryskFDCW2eVMJNwd49SazQrrh2gNhyyOoLbiTQd1TjcBepZ
 GIaNtVmM2EiaF709Ez/nAA8j9bahsQSOAQ6Wys9XkLexKNgJEEWDInZhri9fuZ9D/RkL
 lB/JD7DDlMAVTW5Q4wKJB/HKFq9NBucTaz1Oljlc74kMeq3NWYz8kEvoB95resCtBsUK
 j/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701272856; x=1701877656;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hRJn66jmWmp7/ZR7vFS84ebK8490j6jGvEbdIOkMUdw=;
 b=GLb0ZgJaFwTboft9GDeqK9lhUHlu7OXRJC96EXV5M0Zt2p9JmQ6PufI3dk6F02w+FW
 xK9kmxScaereDWg/CbMZ52RVALKZE7y+fwbmm+XibexaQPhheqorRf+FcXXKoNnjGP9O
 jLe8M3wDBtujDODBoatANavEmUuRgfZaeCbNzhQ1jYjomXxIIhQN8UYNwFLRCyDGYQrL
 sluCXYqn8fc7omiXmWaMmuKjWEKrXaPLuuiGWTtrkXQFfgzmm3LTA3vGn/1WoVwzquar
 ICVLo+ZU6ACzQF/94F0yLhYMqvlKDtkFVF/GiBQ3hqtEJfaC74zCE66TepUldZBFi6Pq
 bhGQ==
X-Gm-Message-State: AOJu0YzanS+Z9ePoS8QiEu8dTCInSOmRF3ukehmBkP8Z4XtJsJUvT7uh
 yrEn1in7IU3cHhrVZLgFBznFFA==
X-Google-Smtp-Source: AGHT+IETEW5DdmUBBS65qune7HAaHWNsQy2FXMNw+Ke7eh3cjph9mF3UhiHnJUJcTGvL4QTqjgC0Tg==
X-Received: by 2002:a2e:9ccb:0:b0:2c9:be24:5bcf with SMTP id
 g11-20020a2e9ccb000000b002c9be245bcfmr1641523ljj.14.1701272856198; 
 Wed, 29 Nov 2023 07:47:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b004030e8ff964sm2690644wmq.34.2023.11.29.07.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 07:47:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20231129084115.7918-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231129084115.7918-1-xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v2 RESEND] drm/panel: starry-2081101qfh032011-53g: Fine
 tune the panel power sequence
Message-Id: <170127285546.3101813.16310801657747690818.b4-ty@linaro.org>
Date: Wed, 29 Nov 2023 16:47:35 +0100
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
Cc: quic_jesszhan@quicinc.com, tzimmermann@suse.de, mripard@kernel.org,
 dianders@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 29 Nov 2023 16:41:15 +0800, xiazhengqiao wrote:
> For the "starry, 2081101qfh032011-53g" panel, it is stipulated in the
> panel spec that MIPI needs to keep the LP11 state before the
> lcm_reset pin is pulled high.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: starry-2081101qfh032011-53g: Fine tune the panel power sequence
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fc1ccc16271a0526518f19f460fed63d575a8a42

-- 
Neil

