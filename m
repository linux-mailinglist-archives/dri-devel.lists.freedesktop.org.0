Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033A7203B6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 15:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7D410E1FF;
	Fri,  2 Jun 2023 13:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4E010E156
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 13:49:20 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so1372275f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685713759; x=1688305759;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Pq/KH2F2S+w1oE3jYRiu2cFEHPIXuQlNq6CCdo5FOk=;
 b=kU6acM8X6Tz+kZf8Z5QBtw7Nd3ZJo2ToZk9x/PnhRsgMiQUMpiVNX2NHtG1Eb2zPm5
 dznqBfagyg34NArpNoM0cIp6xZwWNM9+SDCRozE4oPxjmIWIULzQJfN+uvE+0j9H3Oa5
 dAefSnUlQP/fCUF6/8V4tom9UqjxVNZ3OE1QWvlcJBuACl/acQ9NvTXocu198gyrGGOc
 /hL0Cy9zfxzv+iRMv5TR0qKk82JKxhXmxgM5KC/fpU6kN3+CKo8xKe5RsX3YVwjDbaJw
 2MDbktIQLicvD44aWX2+42ssyP6RwGJfZrKaWL8ZwCJ0LoDFx9nG51dmkUEN8ELNDBYH
 HAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685713759; x=1688305759;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Pq/KH2F2S+w1oE3jYRiu2cFEHPIXuQlNq6CCdo5FOk=;
 b=Md+gshq87Gp+SFtLCahUV8k7DC9Of1sJCDN92jTQpKQsvtUW6mS8z1yKTIy+tiTqf2
 NwkggBNn/OUa8RV2ltld4hdEI0E8fTtHBHT9YS2tP5xdf2YyaaeDydp0hkEcQJmlR050
 LT7/EGWje1QkgIo342MwWAPU7Ct9nSihLHSUd7d6VgO1/7nQZTCG3Zd6jKNb6iaomnPu
 tONP68zjUOTKB4aSNYTnOVLZM5pOativsrp7kf/gINU59Ky1j00LMU2V7mdK49gZFQMk
 MKOPzrW86nAXiPFdYPLGkPxstoD55Gczux7JqzhIaUKhg0Ud1NwIgBmOxa5MVpojG7OU
 RPeQ==
X-Gm-Message-State: AC+VfDwKYzR7Uzkc4eOaNDyC0QdaB9NjXcq3jR7vGTf3fnI6EQf05oRB
 Qb6BhaHLxnrhJnx57sb7QoCckw==
X-Google-Smtp-Source: ACHHUZ6Zq2TOiy6uzLCbEig47MxxY+DF5YJCX+nMxWxA5e73/7Nav1yyhAsRqrimhfGNdxIeIBB1tA==
X-Received: by 2002:adf:f14c:0:b0:30a:eee6:60a5 with SMTP id
 y12-20020adff14c000000b0030aeee660a5mr29306wro.43.1685713758781; 
 Fri, 02 Jun 2023 06:49:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d6786000000b003078cd719ffsm1752941wru.95.2023.06.02.06.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 06:49:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Nicolas Belin <nbelin@baylibre.com>, 
 Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20230602124539.894888-1-arnd@kernel.org>
References: <20230602124539.894888-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/meson: venc: include linux/bitfield.h
Message-Id: <168571375798.833434.11400829507182378408.b4-ty@linaro.org>
Date: Fri, 02 Jun 2023 15:49:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, Carlo Caione <ccaione@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 02 Jun 2023 14:45:24 +0200, Arnd Bergmann wrote:
> Without this header, the use of FIELD_PREP() can cause a build failure:
> 
> drivers/gpu/drm/meson/meson_venc.c: In function 'meson_encl_set_gamma_table':
> drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: venc: include linux/bitfield.h
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=664dba662cb313da9cbb1c944c472638a65c552e

-- 
Neil

