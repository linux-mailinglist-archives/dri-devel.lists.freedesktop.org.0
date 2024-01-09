Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B882826D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216B10E3B2;
	Tue,  9 Jan 2024 08:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F92410E3B2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:47:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8AC75B819F9;
 Tue,  9 Jan 2024 08:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97294C433C7;
 Tue,  9 Jan 2024 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704790045;
 bh=232TwjJF1Ui9G01uyqDCIoqp2EAkeZW9NrKM8Q/mDxw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BrqdkFJ8xBDM4yyc7Ibmg5zTYv+Nc3fu0HyRIE95AhwN7WYBJktMV+DDImb/KqAFk
 zEHn1rmxXgInltwcjglTsbPRV3v/ONuvRPp4UgRp8uBsSqwU1a3+9AUZ6A0WEF+HSI
 n1IpogbCc3d09kc0a04secaTxunmIWbKVOqZD4GT3vbUCjw9nNDW5YMKZ+mkExaLM3
 2b/mKoVSr3nJZxwW8uIsJw6uCekrfNi44tNBcVnZtI30hZKa1rCw38JFsDlPf197WB
 HQGr/i+ZwFl5f5pm8F8FyrCiJNTBFIun6vLCG7xRED08ng2+lCaPwT3i0WY916mWwH
 aYK/n9teq0D4A==
MIME-Version: 1.0
Date: Tue, 09 Jan 2024 09:47:20 +0100
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
In-Reply-To: <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
Message-ID: <2400535875c353ff7208be2d86d4556f@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <daeinki@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

>> Inki, are you picking this up? Or if not, who will?
> 
> I can pick it up but it would be better to go to the drm-misc tree. If
> nobody cares about it then I will pick it up. :)
> 
> acked-by : Inki Dae <inki.dae@samsung.com>

Who is going to pick this up? Who has access to the drm-misc tree?

-michael
