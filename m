Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A93A075F7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F57610EDAA;
	Thu,  9 Jan 2025 12:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lLJILwUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113BB10EDAA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:43:15 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso9473661fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736426533; x=1737031333; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jSa8UzMvzUoVXnoAHj07r7u9fcSmFdWl/qcJ+OAdKWE=;
 b=lLJILwUhk2phg7cMo/zm12xxldWP1VNgdgYdtUj2RzK5OeI+7qFcmDhCGMCxaCesrJ
 oqZGctHtNpZ1lBQwlfRYPdOPh6VNNkIB+DBW8h7QQSDAvXGmZVOuRIKJ+IkyU+qxhcXJ
 mo8ejOS9tIKWyrkblsI4N+g1mptR0o4IcBXw5nlyI6DiZBftRsuPDrhqqNM6qHZG9Byf
 KILPcP4+pOioyQWCoHcNMKRCdH6c3IrD5DEjXrduJ1DhZmMbtbs0VQKL6y39W58haKer
 ayaf6yCnDXF1qmxyjwNosI0douXU2nn0BnUZw4nYx12kiH8xoxcJzXfSOWmoYMPAbxT6
 GDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426533; x=1737031333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSa8UzMvzUoVXnoAHj07r7u9fcSmFdWl/qcJ+OAdKWE=;
 b=VT4GwGGUF85wzvDhRk4QSAj92Ua/M/kxV8qj2bHJzpu7L1CF4PxPmGMSRRDi0MNIhk
 J9iNP2kK0mocFAlxQNkJ/Ln8+18B0Vc9F14/OkRMRiOqGsWRVf5isV8ZMOoY2USS7f/C
 xjoRHW5F4ogeeuaWwITLAC3Q9YPprdKmIA8BZMaHY201v1bWdJGrsmoNt1bFaj5V+EHt
 C+slkWZW6H0O5qK0ldrTqF9I/2TyA3XUcvI0yLWgUij2YraOwfwEK3qEGKISBmmQX3Di
 fTJuHuyt72fBPHnScYFC0m59CB5M4Z8AhgJ+gyzvaJuvk3r+ZgNYigVFS5KYEc8Up1QV
 z+pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGd+YynViIgmhEH8XMP5l4RCBzyw2dyxWDRhAB9r5XqyJ23S33zeS6r5T230aY4vG0kIAVckGZPEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD/cXYKFRIn1Ics+vAnvMGrmkR0MVTTfH2NeazKoCnclnks+uI
 wkv/uUtcOuBA/w7iP7vwHHe0IKWBH31M62HTKM58CNCVy9DAgzWYBsOn2AIDfCk=
X-Gm-Gg: ASbGncs8PEU938HY8bYecmvPbioNkrLPRpwshPiPJnM8YC+MWliTqN/Jm2IRgg7PdjC
 e322PFaT2q+GpBXstOQUBF/fZ1waVEdXTxgkwBIkSr+hElxEea525Lqp0Vja5huzRGhLqFtANiR
 ONT5DoWhiYrA8ARNs2r0yGtyJXADOCBkf2EPoyh3fqJzbsXoqElLJ1X+XhpB7j+PetoHgvZgF5e
 sHOtuWZdmlGC6TLiVDtdGBoVF6ZaP7OaC/CXz0sDyUo6t06hPq0uilDSNEsWjYlbLeBK507UwTn
 89cz/FXKM8mkkc/lMPq2SI2ytteMksGJQnbp
X-Google-Smtp-Source: AGHT+IE1P1UCOivFTvYWWTS/q4LjMLHD5zB9iByIGL1otwhnL6V5dvTRWi82T/q6jI3Oss5lknekTg==
X-Received: by 2002:a05:651c:50a:b0:302:1fce:392e with SMTP id
 38308e7fff4ca-305f45e7f69mr24518741fa.25.1736426533394; 
 Thu, 09 Jan 2025 04:42:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becb309sm185975e87.253.2025.01.09.04.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:42:12 -0800 (PST)
Date: Thu, 9 Jan 2025 14:42:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 10/20] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Message-ID: <woyxxwpwuicp7enqkwbquuwpknftc4exkui3wlmkvjcohb3yhj@iv3adwzot534>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-11-damon.ding@rock-chips.com>
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

On Thu, Jan 09, 2025 at 11:27:15AM +0800, Damon Ding wrote:
> Add two new functions: one to find &analogix_dp_device.plat_data via
> &drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
> serve for the function of getting panel from DP AUX bus, which is why
> they are included in a single commit.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 ++++++++++++++
>  include/drm/bridge/analogix_dp.h                   |  4 ++++
>  2 files changed, 18 insertions(+)
> 

-- 
With best wishes
Dmitry
