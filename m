Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA762739E10
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69D610E53A;
	Thu, 22 Jun 2023 10:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5C110E553
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:11:09 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b479d53d48so64743421fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687428668; x=1690020668;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97S+NTwimgEvGUhJ6O5phnPpyUEei+BRZkc+BeXQtHA=;
 b=nXT4s9CJAjSVTTwqKkemUlcmpRMEOnLyJrHdlBI8DLExVONrkO949cszb+Cv4oVSq/
 mZXE7oj02OUI1gOdz9yawksKNDe9/H02OwzCTOSeWCU19kr5b+NYS1YJKBWQGZKKHQE+
 01/jrFfE0J8Dw9PjE8L+NmZrQSblRVAmuXal02BpXGOIBV2zN8TjgedlDv9klXew8Dar
 UnX/zQeVo42QHOYx3AAju3RuQd7hfFtfUH0Aek/L795jvyDwgiEaYaFSh+FJp+nlFQOv
 ot7WWTBMUtU4q9zQOpEsIc+19toqMjL1zIj7TyjnMOQyG432rNSjsNs3sWk6saFisj5x
 koaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687428668; x=1690020668;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=97S+NTwimgEvGUhJ6O5phnPpyUEei+BRZkc+BeXQtHA=;
 b=RGP48uZf6/ZJa3vp/6yZCs0fP5+4LAJqzlsVom5E/SMb8EoHgHCThDmp8q6vlhQw+i
 7ebsQ+d6les5VPl7TCbgHMrJRQh0LdOQzawGQ0jkMtRCw2jUayjK6E4cUWETQkNuFGXQ
 zjkoqXZoQXo/MZ0Iixz0oxSqOzUcuAm1pwtJIC83RXv1Fv4zjwe8PQ+ERS6qhCwUWhr9
 +r+Ca65/qg7PlGk92Nib7u74bt2kjR/g/Ze7FzrGZGzGYOfo4bQWvIvPYOnNZP9MtVEe
 Kg9WMHD/bez1ps/cVhzDd4bDvYLnHFVeRRHv7/YCxiY3/NMoyEh6FiCFtl71CrLHXiBO
 38Tg==
X-Gm-Message-State: AC+VfDyBk1RsSB+0OIs3FEWLzQR01kOoqmh2Kg3zIYfMl3mwXY8X/+Je
 rXno25cPSVuG4vlD4r8K3ec8kvLoVj4=
X-Google-Smtp-Source: ACHHUZ6oLiaK6ztZDvKBOxxd3Tp3oTDhzkgMh3kCc/zwAvSyND4XfxTh7iEyIT8kQGdwxAHtZCzbag==
X-Received: by 2002:a2e:3513:0:b0:2b4:83c3:d285 with SMTP id
 z19-20020a2e3513000000b002b483c3d285mr6207420ljz.38.1687428667400; 
 Thu, 22 Jun 2023 03:11:07 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.74.98])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a2e9009000000b002b326e7e76csm1225863ljg.64.2023.06.22.03.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 03:11:06 -0700 (PDT)
Subject: Re: [PATCH 04/39] drm: renesas: shmobile: Fix ARGB32 overlay format
 typo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Magnus Damm <magnus.damm@gmail.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <7cc1dea4833e6fb9b30aa35f801f14338578dfb1.1687423204.git.geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <e13b3952-0446-67fb-e654-9890cc858faa@gmail.com>
Date: Thu, 22 Jun 2023 13:11:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7cc1dea4833e6fb9b30aa35f801f14338578dfb1.1687423204.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 6/22/23 12:21 PM, Geert Uytterhoeven wrote:

> When configurating

   Configuring? My spellchecker trips. :-)

> a CHn Source Image Format Register (LDBBSIFR), one
> should use the corresponding LDBBSIFR_RPKF_* definition for overlay
> planes, not the DDFR_PKF_* definition for the primary plane.
> 
> Fortunately both definitions resolve to the same value, so this bug did
> not cause any harm.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

MBR, Sergey
