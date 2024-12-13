Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD89F09E5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDA810EFB6;
	Fri, 13 Dec 2024 10:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dKq2nN//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D7210E8F6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:44:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78A1A5C680F;
 Fri, 13 Dec 2024 10:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C659C4CED0;
 Fri, 13 Dec 2024 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734086649;
 bh=CziF+LswqMPGIPOPc6TJWRs75mYixmRsJvDU27/90rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKq2nN//uul4VV3ZE8XRwfemG7sz28GiW2aVoHH5nv2gUfSP6E1mmywqMETewzV8/
 0lAxgajCRBOuY/dj3UUbplY7Hmj9V1yt3cHTKPSjeo2dfIZrCtqB8KRPdEjOpgCw/G
 dap4h9gXuvh3N2FNNOz7iD5v0X0kwUIzJ5/+2DfauiooFO3bcawNlX0X9aZQOJPQYo
 TlBIvrMVDF1X2UzfImeMHGCq1gIRIEISnwVMhlAOFXTMTYdufneyjyybzIDNE3pclt
 D02XBoAblNaqnOoCU4onMls+wIfqus4iSY17ota2W+TdGLc7J1Fs9QWglxQ8ILx/h2
 ibAi+C/1FcKRQ==
Date: Fri, 13 Dec 2024 11:44:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, 
 luca.ceresoli@bootlin.com, mperttunen@nvidia.com,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] dt-bindings: display: tegra: Add actmon information
Message-ID: <34kg2aoaeem3bjqh6vli43hc63tvfx7uumkmkre3wkvek2neyu@jhj5n3om7vzd>
References: <20241210174554.18869-1-johnliu@nvidia.com>
 <20241210174554.18869-2-johnliu@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210174554.18869-2-johnliu@nvidia.com>
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

On Tue, Dec 10, 2024 at 09:45:50AM -0800, Johnny Liu wrote:
> An activity monitor (actmon) is used to measure the device runtime
> utilization to help drive software power management policies.
> 
> Extend the reg space to include actmon aperture for actmon configuration
> through host1x.

We kind of see that from the diff. Say what we do not see, e.g. ABI
impact or why this is flexible/optional for existing devices.

Best regards,
Krzysztof

