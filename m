Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67EB786AEB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB36F10E108;
	Thu, 24 Aug 2023 09:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7DE10E108
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 09:00:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FEFD60C57;
 Thu, 24 Aug 2023 09:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8330C433C8;
 Thu, 24 Aug 2023 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692867645;
 bh=2cwavp21DLeJaqoDt5IpKVGXDxRDNMOuJaOPQUqBBk0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mDW0sEKmulEIIl0GHit8PAiJLckNsPDWQeXyvZn4kMRAM+833ReYvfkGYZd46HNdq
 PEWXRi9GOXT1YNqBN9xrcylOuDPBP2VbHuolxyzhfpIO289c/3SYh0957WdG62BDtK
 L1QKdiRClcv85ArFQJTpaqyqc+PT1J+1lvVhvFC/JE5kT49Xa26HDZtksTqW3RWHyQ
 pPUwt3e8uQaaKFkRHDC9NmMihh6cTaOy50XjhzuwpbAGh9ct8MJJVU/lkUz/hYAxtz
 CLmns62ALQFmDhQYeo3C41ifDqjaJxso1nu9Dt91+5Q11hiGzw0XNL6xhbeDpwB5T1
 LCpV0dDns383A==
From: Maxime Ripard <mripard@kernel.org>
To: Lee Jones <lee@kernel.org>
In-Reply-To: <20230824073710.2677348-17-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-17-lee@kernel.org>
Subject: Re: (subset) [PATCH 16/20] drm/drm_connector: Provide short
 description of param 'supported_colorspaces'
Message-Id: <169286764260.453632.11434597812331392419.b4-ty@kernel.org>
Date: Thu, 24 Aug 2023 11:00:42 +0200
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023 08:37:01 +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/drm_connector.c:2215: warning: Function parameter or member 'supported_colorspaces' not described in 'drm_mode_create_hdmi_colorspace_property'
>  drivers/gpu/drm/drm_connector.c:2239: warning: Function parameter or member 'supported_colorspaces' not described in 'drm_mode_create_dp_colorspace_property'
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

