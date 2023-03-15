Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F56BABB5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C704610E97A;
	Wed, 15 Mar 2023 09:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A963410E97A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:10:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r29so8577229wra.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871401;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBmfz8ovanyIVIYdHPwziNnz8QLSmhn3k+ay+5kytgo=;
 b=Ogv63tytyeBFg2caWmlFUYENNZkh1Pyw7KgrbujTVT1//FkNF6O9NofVjqtkBNbV2C
 RzykahIf0CvAsZjpcn/lMPRC30gwd12CfdEWjuHRCU46vQ/Dz8HWUteYJ4E5yX1i3e4s
 6EKhj25rhjNKjR+1udJXnGBrPrX+vCjF0v6UjDAIDA0umrfRm6lSbbBxiF6ArZdiOGCL
 YBuEpqxmi72Aq3q6hiV+XuEpqIcGa22gnp6m23gJ8r8mQ+ZKJQCysXNxQkabx7R606/6
 WRItJDzE3Sf/cVU+AWomYAq72buDZv8+5gr6jU8vCHV+FJlIwyXYeXlYCt1iRVGlTvL4
 iBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871401;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBmfz8ovanyIVIYdHPwziNnz8QLSmhn3k+ay+5kytgo=;
 b=FbgN37nSdn5o4SKdRcJgIO3eK4cXl1PPlz61HWXEFcHcFa4VfyiuLyXQVwOxr9WCp8
 Gq3I6NTQocOeUE1mnf//msYEJBi+TraT3Mf5m/Hicda+u1yTYTxux7+BOMybpzHV+rfi
 En0ZW+LatDOA3KjvcJjtQUkBNJyiRJMOId2+8eLI92mbut499rir59bguAg9JJF9AQxQ
 eTQO/Dh88uW6JAOniYTKfWlfSnI7Opg82cgYDZ3SZoBEuC1+gR+gP4dMVKlt4+BPw/Pr
 0zUfZnYS6QiKGyGZX54mW8VztdYqO3s7LjZAMBFrTOvoIt0MvDeRqpy42tNnirLymlsA
 Up0g==
X-Gm-Message-State: AO0yUKUTuobwXtsUtcVfT/T+XZoKfbdBw3U/xrqSGO7KjNzTH6nRvgjR
 GDzWJSeXBF8KfPOD41+EnW6CNu2inYOx97LcMWgPWA==
X-Google-Smtp-Source: AK7set9qQbibv7zwLo/hgnIaDBHgZu9KKXJvCIUi3L2pKqB4+3HJgGX3iQGcHmt7lz76sdI1Q7ek6g==
X-Received: by 2002:adf:e784:0:b0:2c3:e7d8:245c with SMTP id
 n4-20020adfe784000000b002c3e7d8245cmr1402721wrm.13.1678871401181; 
 Wed, 15 Mar 2023 02:10:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5d55c2000000b002c53f6c7599sm4017953wrw.29.2023.03.15.02.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:10:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20230314055035.3731179-1-victor.liu@nxp.com>
References: <20230314055035.3731179-1-victor.liu@nxp.com>
Subject: Re: [PATCH v2] drm/bridge: Fix returned array size name for
 atomic_get_input_bus_fmts kdoc
Message-Id: <167887140039.2153628.4993637739081112083.b4-ty@linaro.org>
Date: Wed, 15 Mar 2023 10:10:00 +0100
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
Cc: rfoss@kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, boris.brezillon@collabora.com,
 Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 14 Mar 2023 13:50:35 +0800, Liu Ying wrote:
> The returned array size for input formats is set through
> atomic_get_input_bus_fmts()'s 'num_input_fmts' argument, so use
> 'num_input_fmts' to represent the array size in the function's kdoc,
> not 'num_output_fmts'.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/bridge: Fix returned array size name for atomic_get_input_bus_fmts kdoc
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0d3c9333d976af41d7dbc6bf4d9d2e95fbdf9c89

-- 
Neil

