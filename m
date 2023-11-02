Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B577DF404
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45E710E8B0;
	Thu,  2 Nov 2023 13:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CC410E8B0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 13:40:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54366784377so1495143a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698932416; x=1699537216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=faV8A47tvgpZ5h+iJVem6LTeAncvTfPtpMsFTDEMTl8=;
 b=Fi0/fpheRqGr8nA1q2PM+8pmyUyYreh3oDjZNufdFdyesaA64D5UIAVj9I87rzUpiO
 Up3gCcSfuLmnuI4AOEXOAYXDwVh5lj35PIf+9g6gRgzAVYkcnynCMh33pOj32/kiBde6
 Jv7+YAz7EFE43RN62Zm9uR8uS1YflpIk1O5LnkMGhabWCbnyqv9SpoTrxS6OEsP4X6DZ
 wYrwJXgTP0SmdyMdrE7lvOFAOTa3kXJJqxbfV5g8ZXH/oo6RhFSKnYloOdVrjb/8ZMcC
 G3TbFZSiHvtoTaNh7MP/g9yt5AvybULHYfgggWkL7oF3X/vVhfBAOsO64pfw5CEpVDvf
 VYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698932416; x=1699537216;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=faV8A47tvgpZ5h+iJVem6LTeAncvTfPtpMsFTDEMTl8=;
 b=V7B+Hr0yYVo+hzxeuxY+DrIVLKFNbDdRO4nwJvpteKXtFnmCIeOq6/kjv55NX0IpJI
 l6SMr9Mxxv4HcFBeXGSHBktoeaujfJr3N1Wh52UEZMlF7Q4Wlt5e+ADc6GtCiO5e48j0
 NPKpmII7IN7yacxsEtqWKqdK21mNMB7hf/VK53tJOSn9+Ruy4P4CQg8HuFdKlWdOs/yA
 wlDXXrw2c9DR4l7CH9WYfmldOZf9w9Q8dLYGeOMA3DPX3msmYGHmzsTkGbgOejn/s4+r
 ksw61TB7XQ17KyFB0upWdV8O+HfFQpfwYC75q/wbgbPSPiDTr0tHpBlmrVcAGVaFmipc
 SKfA==
X-Gm-Message-State: AOJu0YzxMAP0F2A6Ndt3C8k9208vL+niO7SkVd8jY2gJoyjh6CGFh+VQ
 YTrceoAmnSJdWgKclvNTBKo=
X-Google-Smtp-Source: AGHT+IFA82hBDVCIm4Aa4h6VWAi5ZV1plROwqOjG/ow5zKHaqtmNWt9drLjQQDuwmHB8X+Kcs1OKAw==
X-Received: by 2002:a05:6402:28b3:b0:540:118:e8f with SMTP id
 eg51-20020a05640228b300b0054001180e8fmr15039013edb.24.1698932415678; 
 Thu, 02 Nov 2023 06:40:15 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 u1-20020aa7db81000000b0054366251e04sm2287357edt.94.2023.11.02.06.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 06:40:14 -0700 (PDT)
Message-ID: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
Date: Thu, 2 Nov 2023 14:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 0/4] Rockchip rk3066_hdmi update
To: hjc@rock-chips.com, heiko@sntech.de
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the Rockchip rk3066_hdmi driver in a somewhat similar way
to what is proposed for the inno_hdmi driver.

Johan Jonker (4):
  drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
  drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic
  drm/rockchip: rk3066_hdmi: Remove useless output format
  drm/rockchip: rk3066_hdmi: Remove unused drm device pointer

 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 66 +++++++-------------------
 1 file changed, 18 insertions(+), 48 deletions(-)

--
2.39.2

