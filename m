Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585456732B8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611B610E8C5;
	Thu, 19 Jan 2023 07:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BE310E8C5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:43:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i4so321721wrs.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzIFayZdKgwILp1ZYTzrWElZ1uCaarMdYuteDsUrkaQ=;
 b=WwzxuBNopPjSbSEOAnXK6Rr2qGMz7LPpnCOUjPlQKRuQbTt6uF2tdor1tCSDuZFZLm
 SD48cXbRtDf8OxpLlx2DxcAQHlCwRoAbDkQZZP5Fy3MntXTQuyu8w4C+J0U/JCuWst75
 Dd9AuoV7r2WcZ3OLaqnsasAJWKgSMHiZotfi1ULs6q143ggD1r5+x3b1DunxBnxpbfy9
 2ULzRQ6dlrQzW4ZRn79BGmwMLz3sqbyQ4GvAkLC6RyjA3WVNL6JRjjvoZqJHpIkGT9rp
 FgM3Lah9wMRXPB4Bv8eEY27JpXDUtFoTuJCmJkoVaBYroVPES8FSuslO+rkmEsppW0Kl
 3CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BzIFayZdKgwILp1ZYTzrWElZ1uCaarMdYuteDsUrkaQ=;
 b=8O/Bbr4Rn55OfpRUeEdqWjAGgx5hiHydx9+1WaORMrKsSRtA9/TBV1CxJdZAgJHGTF
 ZT2FrbKUJw0HRGwKmTcddom3n01uqsHedlK92QPjncVZ6VWL9Ox4hbdK/m6HwbWUj8/e
 XT0YapoGx8dRoQJmCWnNFwLeEKuzOM3uZW7XURpRo9vPofrvotXQ2Y+IQ8n+WlNGcNAU
 h6HKe9xPXJhNbxw5pIWIkpWMn+LUD/9osCjYAJAAQuLyh4D4OiuEKj3BhuGKDQTyyfut
 JnYWUgW2u32KAGHO8jUnTV6WpDUhNJhzYpdmW84RUXq2bfcGwU/gl8d+deXl8F2pXsvi
 n8sQ==
X-Gm-Message-State: AFqh2koukkxOpMVIcq1D/9xQdJjlza6WsTkYGMIBa2VMwHZNlvwWtaV8
 JwYxNvwJ1ALfjZBTYnjVgeV2iYrYDKQwW63Bzjs=
X-Google-Smtp-Source: AMrXdXugN1rrDJNF2VXEcvfKomNAat4tMmCttxsvf+eGzK47n1/gmvazrbtvwgQbPPJC6ypFI7hooQ==
X-Received: by 2002:a05:6000:236:b0:2be:4349:2847 with SMTP id
 l22-20020a056000023600b002be43492847mr839482wrz.47.1674114193446; 
 Wed, 18 Jan 2023 23:43:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 r10-20020adfda4a000000b0029a06f11022sm33214890wrl.112.2023.01.18.23.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:43:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230117105903.2068235-1-alexander.stein@ew.tq-group.com>
References: <20230117105903.2068235-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/bridge: sii902x: Use dev_err_probe
Message-Id: <167411419269.266995.14466684446235662445.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 08:43:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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

Hi,

On Tue, 17 Jan 2023 11:59:03 +0100, Alexander Stein wrote:
> This helps figuring out why the device probe is deferred.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: sii902x: Use dev_err_probe
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f8593120e321f8b21766db13c7333e9ae0740b65

-- 
Neil
