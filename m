Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C077EE77A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EEA10E687;
	Thu, 16 Nov 2023 19:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC7E10E687
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 19:27:38 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-58786e23d38so663638eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162857; x=1700767657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UdXxO76TxrHNOJ1hG2GWZ3FtG3o6//qcCrBEV7e6JF0=;
 b=HCZkWJXyxBl0ck6cOtTBetpu1QMF6hN5uVKl8B+rOljUsVtC/hBE/cDABoU+DnYOK/
 dwgE3d1jD5wKkhA6hEdA0yjxE4RAeDbs5atmZ9s9XincmyZBDwS/3zEID9myKAcyCAhF
 QhSDTGMUA5pOSHI7ocBTjlR9ZXzYnpzvuamLGe2Il3UQES7IF039CpbJSsiEKgjxJUyr
 +hWBKheoAeqgLioweQZNszrMvaMC+qCHd7DjoHqdC4fNba2NBQF4daOgUQJRvSevIg9g
 SoTTfCOpvkn9p3wfWczjGco0VzxXc+EHueHYGNkTy8eXpGRJIVDcMOcEBFE4wQ6Bnp+V
 BIaw==
X-Gm-Message-State: AOJu0YyXS+FWyI16Jj4q5rMB47RuCbyl4Bci0e4DFlsBkilQ3pF6Mzuz
 krs6+ZEJ4PpKpj7y4fQWiA==
X-Google-Smtp-Source: AGHT+IFX+Vh0cRgukREyljR+kjDwhtv9/esCRp99bcIH9IEMsr6X4lDgVj1LBbJa0EfNgm8RoL05IA==
X-Received: by 2002:a4a:9187:0:b0:586:b062:f3d0 with SMTP id
 d7-20020a4a9187000000b00586b062f3d0mr15603964ooh.7.1700162857520; 
 Thu, 16 Nov 2023 11:27:37 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w18-20020a4ae4d2000000b00581fc1af0a7sm11965oov.28.2023.11.16.11.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 11:27:36 -0800 (PST)
Received: (nullmailer pid 3065895 invoked by uid 1000);
 Thu, 16 Nov 2023 19:27:34 -0000
Date: Thu, 16 Nov 2023 13:27:34 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH 09/11] drm/rockchip: vop2: Add support for rk3588
Message-ID: <20231116192734.GA3050632-robh@kernel.org>
References: <20231114112534.1770731-1-andyshrk@163.com>
 <20231114112855.1771372-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114112855.1771372-1-andyshrk@163.com>
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, chris.obbard@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 07:28:55PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> VOP2 on rk3588:
> 
> Four video ports:
> VP0 Max 4096x2160
> VP1 Max 4096x2160
> VP2 Max 4096x2160
> VP3 Max 2048x1080
> 
> 4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
> 4 4K Esmart windows with line RGB/YUV support
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 324 ++++++++++++++++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  57 ++++
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 215 ++++++++++++
>  include/dt-bindings/soc/rockchip,vop2.h      |   4 +

This is part of the binding and belongs in the binding patch.
