Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2888CEBF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA3D10F2BB;
	Tue, 26 Mar 2024 20:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bqg2s8gy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7791410F2BB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:30:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E1F76134A;
 Tue, 26 Mar 2024 20:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECAFC433F1;
 Tue, 26 Mar 2024 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711485033;
 bh=6ZwP4niv2dWrwIYTkjQYyJjMfsiweawr0SSySQuA57U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bqg2s8gy9yoN8pVhMs2qyzeRWc+dxwZyppMpb1ZBUSsvrjRwsxNbzqhq4BJi9DilF
 lY92XwV0mIJQb34nbJEMBp3I+dqiw6qUDLADHc08fU9EjekHGB+vk91ZGC+kSnUQ15
 biuc/r0xNAJFQJwI0OEQHGqPQetGJ4E1L6Y0fJadvWQ9mL+F5l3aLbWOKE/LchgaJX
 6es2GlckvwRxU9pJ3/49jeiViGkrMebnwR7WYA2EttpBpH/BmPD9mQsDttYVsIXKNh
 IXtjg8QUbdirFu+KhmQ8OK0hLZccT7QC0umT5Pp7Ut233jEuFWSssZ+fVz19RvLds9
 giXKSEUUzd50w==
Date: Tue, 26 Mar 2024 15:30:30 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, airlied@gmail.com,
 devicetree@vger.kernel.org, sam@ravnborg.org,
 neil.armstrong@linaro.org, agx@sigxcpu.org, megi@xff.cz,
 conor+dt@kernel.org, kernel@puri.sm,
 Chris Morgan <macromorgan@hotmail.com>, heiko@sntech.de,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: display: Add GameForce Chi Panel
Message-ID: <171148502827.3376685.18337024060057169152.robh@kernel.org>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
 <20240325134959.11807-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325134959.11807-3-macroalpha82@gmail.com>
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


On Mon, 25 Mar 2024 08:49:56 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The GameForce Chi panel is a panel specific to the GameForce Chi
> handheld device that measures 3.5" diagonally with a resolution of
> 640x480.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

