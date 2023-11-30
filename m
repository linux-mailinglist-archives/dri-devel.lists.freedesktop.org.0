Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C27FEBB4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E464910E6CB;
	Thu, 30 Nov 2023 09:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5D10E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:18:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 07A9FB842A8;
 Thu, 30 Nov 2023 09:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F31FC433C7;
 Thu, 30 Nov 2023 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701335928;
 bh=2DEa1oTeYKzcAD8G7sQTs3Ut9U8iyHfVccBu5egHOjI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o8wRZOhEkeRvlklnE4tOYqWrtRs3q162YaAbPlJInXH/gblUtFqSU9ZX4j9Pw5LxC
 r4WdQ8NrZrpFTrypDvOoMHiaaxmbte2641LIsXqylz5noP7Cw7azIWhAOSq+ae49dy
 Lj4PSYlotWGs5klPsoL3LWQJOkDXU90iap26FZiImBB5m2PsF7OM10WrtbBflOPjIV
 Z7LGjjNVJlnWmFrbcjSSHmg0xJOS0hhpfwXPz5oq3plcgySXhk2ytwkID3vtbhc8dp
 JLceUBMAkcgOuT7pnsND6OgXAtxSqrossnpU5qq4v6Ap5AP1AnBR/7CeFxK3QTiIgH
 GbtYIh5g/0xVg==
From: Maxime Ripard <mripard@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
References: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
Subject: Re: (subset) [PATCH 1/2] drm/imagination: Fix error codes in
 pvr_device_clk_init()
Message-Id: <170133592547.3076107.13433304764452948026.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 10:18:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 10:26:29 +0300, Dan Carpenter wrote:
> There is a cut and paste error so this code returns the wrong variable.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

