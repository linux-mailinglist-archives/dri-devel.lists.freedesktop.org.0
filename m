Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A62F78FB8D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 12:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F6D10E773;
	Fri,  1 Sep 2023 10:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3B310E773
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 10:00:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3EA7B61275;
 Fri,  1 Sep 2023 10:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F05C433C7;
 Fri,  1 Sep 2023 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693562448;
 bh=BTGDfJTyzKP6h40J0iVNdbrEIIzNDkliCuw7WPVkb5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GjYcGy6rAAbtGbUDR7I52WYpGsvlouX3287Du4qRwGUtujJgItXyVUo03LxnQi5Fy
 Hd2Y+78vjEwmV1kfQo4tbP/DEj+oFrfkM9Js/D/TKV/ezUgJt9x1ohGcEapPhhZVp5
 ODKBGcYciLlfghU7NbDW7CAHkYWxuCf3pZNrp/aeuwQoUmcjtjLh8UY6SOhiEl7+ov
 6dNuWjUyIhd2Mcu2Jl7e5We96gXmWiuO0lUKnuO3zoj240I7dAN/Z9WfbRGwrwFIbn
 xgXP4Ga0NTOQtJngynxVK/rne/2C5StagKXXmHDvLURH0oC8VpzLZFi7t1rIfIKOj+
 5/v5jlnl69P5A==
MIME-Version: 1.0
Date: Fri, 01 Sep 2023 12:00:43 +0200
From: Michael Walle <mwalle@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
In-Reply-To: <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
 <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
 <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
 <7a3257dddac78c46408341253a3286f4@kernel.org>
 <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
Message-ID: <d6031e00cda9ea1e30bb75b2ca97300f@kernel.org>
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
Cc: chunkuang.hu@kernel.org,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 amergnat@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

>> I was just curious if you know of any development for that (or 
>> similar)
>> in the kernel.
> 
> This is probably because support for this SoC began with Chromebooks,
> which have fixed and defined uses for the pipelines. I suspect that
> what you are working on is much more flexible.

Yes. that is correct.

> The driver should be made to allow dynamic selection of outputs, as
> is commonly seen with other drivers, but I don't know if that's on
> anyone's TODO list.

Do you have any pointers where to look at?

-michael
