Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3598B4B8F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 13:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790E910E856;
	Sun, 28 Apr 2024 11:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NgSMAVXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BDC10E856
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 11:48:59 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1eb24e3a2d9so15975995ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 04:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714304938; x=1714909738; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OnI6cUk44LsQbKr/M0rkgGZtY7M8erbagdEljkfjqQI=;
 b=NgSMAVXPL0SAltjxjf7fsG/3aETKB7Yldt+HeM3ds6KjrCp1DI0uzOCciqELuPjxhB
 F87FMTiwQOuo9sZDhxIaDcwaMyDxoOiPS4vr85SDluYEfmbymq1nYHyptEPUQIH5ItFB
 1dDO6V5k+x7GElfkS9ePxCGR4t2UMy8VLgmgM1awBEmDVnaWImBMgjrLpPEVIsxWPJrt
 z1OzOKdZ5nZdTSX9enCoYTNK0EyHpLr8N9tmsSpm1e/fHkW1npZu47X0+KyWfEKfDnDk
 M/O3VpP1FLtXj999s8IxIrcO4ydyrqWhpHuLpLpnUO/1i8kgtSq8ItoMO91zPvSU4pS1
 3Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714304938; x=1714909738;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OnI6cUk44LsQbKr/M0rkgGZtY7M8erbagdEljkfjqQI=;
 b=FY4I00O5hOWUVJJjgCk9bPCaumn1vIekIgKCRK8SjQSVaAfXt4M3Ww8D5yzH9HGM95
 mVH9plLI1UmFOaWiZwwVLezBdJSeUg9hpjzu4bvk2+BIMdUN/712/7JPzIJXHc2wVvgi
 sMDNfi/6Nf/D9uVS4HIKB3jEmw0cEY7x8L1NVgBxDusMgm2FHtqHXMkbwqAxyg33+73I
 aaT0PP8066Vx5ZShF6rMCf1jv0a8F58R8qKiXy8gF1V7sz9+iUC6yLU3Q27VJGLvwycD
 QrMLGTEDWSG+5eeULTi3q6i0nforvtoC55QP5N8Q4G66rJBiBK5liGbAs8+HSPF7ZShX
 YDRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF8880X2uvaPLm+7+m08N18eccC+jmBwexKxmenB18F/sJgrkP1VxA/Rzcvv94XWR/ZewrNM3HRUJZrDdwvn5JSDRo+yH2vD4Q7Qe8ZXN9
X-Gm-Message-State: AOJu0YzP4S+nGFiCfOgvHnjwbUmac0iMOwkcl3M0rg9BkVWKcuLQPIQw
 bQ0HUUEQIWOAXW/PdqskwxsAE2ERQogRVo200WMfadFjkNIQUb7YsBzqPFdsCUKdq56E4jJulAI
 WKOX70GEdaGhB2rgtylS5BoYcai4=
X-Google-Smtp-Source: AGHT+IHvwz4nmdunBr6J2yHHs8FhQymazg6kf8ScSAEcvNAnXFEsWfAvs5rH77tf3wCOJPv/oQPjDRBhRwGD7Ji4RbI=
X-Received: by 2002:a17:902:f547:b0:1eb:fc2:1eed with SMTP id
 h7-20020a170902f54700b001eb0fc21eedmr8045865plf.41.1714304938213; Sun, 28 Apr
 2024 04:48:58 -0700 (PDT)
MIME-Version: 1.0
From: Shresth Prasad <shresthprasad7@gmail.com>
Date: Sun, 28 Apr 2024 17:18:46 +0530
Message-ID: <CAE8VWiK8sOm6=q4JoTV7kCjQ-b3feO0FYqjQc_TZvLGe6Oi2zw@mail.gmail.com>
Subject: Re: [PATCH v2][next] backlight: sky81452-backlight: Remove
 unnecessary call to of_node_get
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: daniel.thompson@linaro.org, deller@gmx.de, dri-devel@lists.freedesktop.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, jingoohan1@gmail.com,
 lee@kernel.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, any updates on this?
Has this patch been accepted?

Regards,
Shresth
