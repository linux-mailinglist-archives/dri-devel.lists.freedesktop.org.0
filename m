Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B4817A71
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C389A10E3E0;
	Mon, 18 Dec 2023 18:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEBF10E2A6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:51:56 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a1ca24776c3so893268166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702925515; x=1703530315; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0eNl2vsDtnWZ+IAcuQvLIHQD/Xi40xLCKLfqrufOQbE=;
 b=Wgfm1/rOs+4dN97ZR2Ym2oECsgfl9jJDLsm9UvDtv5xA5VTeLSokHLCg2dIjxN9eDq
 LT0iXGbcf8uNBEDeEenwyvaPeb30t+jB2XJsH0b/1dmalb+lTM3+/EabQB1WPlq9DyQl
 0ZM75WFlkWTfIAuQRSuT87m+U2F0cJCDmSLV2jlVq3k/14/TOT9aidGdbXIifjZPk37X
 j8v1Z8ANbiWvYHTq5hVlJwZzSpOSBjcH8aqxvWUcVqhJpqYGiMv8VRPl3zVYUH7/rdbB
 SolPwNCViXL6295B+Pz11x53cZYaDqwfuKksu64C4X6VeZ4/KxEL2By2XkjbttX1/lLs
 +zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925515; x=1703530315;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0eNl2vsDtnWZ+IAcuQvLIHQD/Xi40xLCKLfqrufOQbE=;
 b=sehEk5on3C/2NVrzCEh36AiJUzBJpMwSPMN0CrLW42mR7sxYHT2OoCJ2mH9oj5WleK
 uN4N2lkQtt6GnZqNbspqKzxgzvTTIN95C2Ts7AWI3/qVF1fncEK+Vui0ZZWXvLpuPoLi
 3h+L9mYXQxLujuLLtHBTujASQZrwzQrOdhHlMRTVy7LLcg44ECMhgekMNBBMozNAyam+
 fuCDyGk+i0jTToL67jHwWWYO8IRXC1+4f7PDaAK3i6UdwO4PO2N1ft1fZNdmQVV5rf1y
 87G33dj58y+maS0D7nXVVd8dWqtEXbpgyQID9wmffmOGkb8rRqz0/erGW+Ztfb69dalU
 ZmEw==
X-Gm-Message-State: AOJu0Yw/V2rfAa/fWcASYCQjdtXyz8sM4ekl3usaZe26yyMTbNrSuTMx
 MZ7lND/HhQLeWNNV+o/ax3OhM108rM8=
X-Google-Smtp-Source: AGHT+IHC5qktQQ4b2sM7UtIt484SaKUejdtlj+rponp9uZJ7sZ97THniapcreVMbePgmnF2+r8RohA==
X-Received: by 2002:a50:d6d7:0:b0:553:2f15:6245 with SMTP id
 l23-20020a50d6d7000000b005532f156245mr2498083edj.26.1702914452056; 
 Mon, 18 Dec 2023 07:47:32 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b005537b9f7ce7sm216914edv.68.2023.12.18.07.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 07:47:31 -0800 (PST)
Message-ID: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
Date: Mon, 18 Dec 2023 16:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 0/2] Rockchip rk3066_hdmi update
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the Rockchip rk3066_hdmi driver in a somewhat similar way
to what is proposed for the inno_hdmi driver.

Changed V2:
  Drop already applied patches
  Remove "Remove useless output format" patch for now
  Add fill_modes hook removal patch

Johan Jonker (2):
  drm/rockchip: rk3066_hdmi: remove unused drm device pointer
  drm/rockchip: rk3066_hdmi: drop custom fill_modes hook

 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

--
2.39.2

