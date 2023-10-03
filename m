Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72617B708F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 20:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9748A10E30B;
	Tue,  3 Oct 2023 18:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5B10E30B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 18:09:13 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c60128d3f6so23465ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696356552; x=1696961352;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Z5ADml8UEYFyYxVl60KXFq6v7496GwJKAXl/Dq0m1dI=;
 b=AQPhWygkUG6YhOzQ3omCMWuo+E9/0hWnDGoguScxKmb9AfTfgbHjn/Y1Lyz6354nTK
 Gf7otsYcaOcoztRWdcziaCvqPa+OxJx1Mtr8DP2hFfLO4aIY8AY1CmwkZmYN8jDCPX7Y
 BzrsL/EDivGs/3zMaD+E8emnwhNLHdu/XNJSbma5fzIbtJ13kojBXbSainrPXzeP6in8
 +YBlH+blxErVeMZjLuw6PIDjz6dhxPB7DwSUuC/SnijZNrEWAjD7uRhXlZ3mKEyeSjRk
 xpvrM8QbVBtREFM+Mjio8ilmaEyIjpVmVWOKF512Q76+sBgESz0ageA9UO3/a9JQZv0o
 4K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696356552; x=1696961352;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z5ADml8UEYFyYxVl60KXFq6v7496GwJKAXl/Dq0m1dI=;
 b=oHt95GhQFuSew6JqU7ihXp5fvmZvURPXjppg/SCiWC0MThWF7bQN1AdfIhbWdWrjqu
 BR3rBHq+q/DlUhe+dPgsuUPx2Ji28TzLZ3A92fdbMy/maOqSvM7MpcYs2LzfHLAmm57t
 i7w6ZdqniCLLPX9c4Fg9sKwqW9s0DcuNrm3p4vnC69I0TjcO4gMWeCaQTMRY/xkRDmCZ
 c4tANTV42fu9kmd5XXwxK5I9rzLVlPmsKzZdsoxXcrJsNsXrjuNhMT3LHsxiE1ZGbll/
 Z7qQooui9/NIE6prfWtkk4hjzyAQiXccTwSOG6Kr2CfUp8c2sfNuD42SYtLAfWWQM8ld
 oXDw==
X-Gm-Message-State: AOJu0YzHff2L9bN98+3KMWGQDmcoldSg+s/2iU6OjkoKTIUMHO4BMxiF
 MsNMWLPgShQtDt7HjHRGWAINsxdEpDMfhD7/LjaL
X-Google-Smtp-Source: AGHT+IEl6IJ3DsIw7oyXRf7R7HS8s4r59Isc2f9JN+K4IY+u/eiaCuHNxh0RznXZ+FmVCsNdWoBLHGhb923Bp4V1USc=
X-Received: by 2002:a17:902:dad1:b0:1c6:1e4e:b770 with SMTP id
 q17-20020a170902dad100b001c61e4eb770mr19311plx.28.1696356552314; Tue, 03 Oct
 2023 11:09:12 -0700 (PDT)
MIME-Version: 1.0
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 3 Oct 2023 11:09:01 -0700
Message-ID: <CA+ddPcPS8oUsMk0ziumwdTTWetekE37cK0Gkt9x5w2ig1m2pXQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] drm/mediatek: Add interface to allocate MediaTek
 GEM buffer.
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 drinkcat@chromium.org, Shawn Sung <shawn.sung@mediatek.com>,
 devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You can remove the DRIVER_RENDER flag from this patchset. That should
not be upstreamed. The IOCTLs are still needed though because of the
flag for allocating a secure surface that is in the next patch. If
that flag wasn't needed, then dumb buffer allocations could be used
instead.

Thanks,
Jeff Kardatzke
