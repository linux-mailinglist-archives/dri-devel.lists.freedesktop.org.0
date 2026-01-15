Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D6D27CF0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 19:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C0610E225;
	Thu, 15 Jan 2026 18:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AUCiggqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CC110E225
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:53:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 80C3943748;
 Thu, 15 Jan 2026 18:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E54C16AAE;
 Thu, 15 Jan 2026 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768503232;
 bh=+yRgRWrxixszXJdLBEgxSxkhwkZTH7s4cXfyBhhd6zY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AUCiggqZpfdI1tudPHsbFKr6s686vUb/DOUAVuO08NxXYlA4lO5ha1c5Ih0Nkd5L0
 qeyF1GYAs71hBcNBw34SXu9ACVi/671Uy7D1Tpd7CPpislVN6wCq4/EDGvQyu59dk2
 UGMCjT/ad2mN49ixcwFD4ujyD2H8wYSN1SgBIISG9nPbcNWlemr8BTw9Js22rrINcT
 iniQqZYV3ffnL+KAyaiTghLs3E/c2fEZOJdUN62/iKv1ms6XPscdbUJEbgpAOPPV4A
 nGUPKKL4AqeGo8Rv6ZpvASqe1IPRdOT/DD0+aDXx3ZOYiSI0UD2xuNQYhqxzuWFB9n
 putFSQG6ZAsjw==
Date: Thu, 15 Jan 2026 12:53:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 conor+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 jagan@edgeble.ai, krzk+dt@kernel.org, aweinzerl13@yahoo.com,
 heiko@sntech.de, simona@ffwll.ch, jesszhan0024@gmail.com,
 dmitry.torokhov@gmail.com
Subject: Re: [PATCH 2/6] dt-bindings: display: panel: Add compatible for
 Anbernic RG-DS
Message-ID: <176850323085.1003166.1760055043978437225.robh@kernel.org>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
 <20260113195721.151205-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113195721.151205-3-macroalpha82@gmail.com>
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


On Tue, 13 Jan 2026 13:57:17 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG-DS uses two (mostly) identical panels as a top
> and bottom panel which appear to use the same controller as the
> Jadard JD9365DA-H3. The panels differ with a parameter defined
> differently in the init sequence.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

