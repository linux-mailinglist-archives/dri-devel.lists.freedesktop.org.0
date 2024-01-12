Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCA82BD4D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A8910EAC3;
	Fri, 12 Jan 2024 09:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404B910EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:33:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5336986cso79761745e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 01:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705051985; x=1705656785; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIRVsOrNS9u8UIkgZdycNtHP1B/M8TKEmYcprHzxnoU=;
 b=hFV6UXUJDLwEHrYWWEPUjMaECg4yCPB+QTYL45L3M0hQVDJ48VaZPajJzBwpK/K1Zq
 wcMoDC5iInVpVxGgzjGqYfpxRbConHbj0ODT95nGdiUXf5G1f/6PV3lnPLHkd3AZMJi6
 PJyKzCSEa4qBSz6x24G9HnZU9VpGLQwo+j6784QxvyfQ42DM4a5NqdEXlWZrcADH58n5
 QFc2mCHDDTXcRAcZMRKsSzPBgzZQBlHiNJQn6sJfLCQQQjyIwMIGJ0VqflF9GBjsFjUM
 /8KqbX4qmhwJgkiT58qugxD8F+TKtuvc2kWoT4IPfwyOt3y29m5v/tvlxobrIuGKd4qX
 HHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705051985; x=1705656785;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QIRVsOrNS9u8UIkgZdycNtHP1B/M8TKEmYcprHzxnoU=;
 b=ZMiDI9pJXb4HAII4/hu75Lwp4yIIopapL6lOizYTV7us/Pg2lriZqG1P0CDgx5opQ8
 bMWbCjYbj2C8G9jWe/0DOWha2/a62JLDMvSw7ebZ2VBbxbMH0rVekflaDCqJKTZdYGMm
 EYM98Me1ACf8jzWRE990b0O8nRQFX5zSUzzilop2KgFvm5trb7sYzn0aIHeSq+s5DUbg
 sHfkKraVM5rf3WAShdvtXR9lEHXamDKKURJqho7dlO7BylSmO7r4tGGhPYd2cQ3AWFMh
 LmAyt4DkmfEI91MhAXibnWtmTxjipdDAQnrnd0PoOqh3I232BXlSivL7dHAY+NkSiCG6
 JbJA==
X-Gm-Message-State: AOJu0YzHE3YiQ5HN1b0gFkTReceTZ0awVZzO8rSibbvVgRQZGvtbH/zW
 ixqEFrGtMH5uHcFCKhq4jYw5e+PH7Sop3Q==
X-Google-Smtp-Source: AGHT+IEVgOqtLXgDaHDFy3y6Fh8P5cABV4kWuOysnkelqrrbtl4SbnJ7XwvgAhROpYf3af4AGuTxLA==
X-Received: by 2002:a05:600c:4e41:b0:40e:52e9:5681 with SMTP id
 e1-20020a05600c4e4100b0040e52e95681mr567614wmq.10.1705051985621; 
 Fri, 12 Jan 2024 01:33:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a5d63d1000000b003365fcc1846sm3312055wrw.52.2024.01.12.01.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 01:33:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <20240108095902.22725-1-quic_riteshk@quicinc.com>
References: <20240108095902.22725-1-quic_riteshk@quicinc.com>
Subject: Re: [v2 0/2] Add support for Novatek NT36672E LCD DSI panel
Message-Id: <170505198451.981833.5364543733746481600.b4-ty@linaro.org>
Date: Fri, 12 Jan 2024 10:33:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 quic_vproddut@quicinc.com, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 mripard@kernel.org, robh+dt@kernel.org, tzimmermann@suse.de,
 quic_rajeevny@quicinc.com, quic_jesszhan@quicinc.com, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 08 Jan 2024 15:29:00 +0530, Ritesh Kumar wrote:
> Add support for the 1080x2408 Novatek NT36672E LCD DSI mode panel
> found on the Qualcomm QCM6490 MTP board.
> 
> The driver will come with the uncompressed video mode support.
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Novatek NT36672E LCD DSI
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=30cc664f0962ed1e62d9009a34bf04b48e1a5a4a
[2/2] drm/panel: Add support for Novatek NT36672E panel driver
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ea4f9975625af861c2795c557b8fab2b492ff749

-- 
Neil

