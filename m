Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81699D27D05
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 19:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BCC10E12D;
	Thu, 15 Jan 2026 18:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EGk1+rC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676A010E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:54:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E48544383;
 Thu, 15 Jan 2026 18:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB394C116D0;
 Thu, 15 Jan 2026 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768503272;
 bh=98e4lR5ellL77qMHm5OIbYjTWV660uTxn/sNbZ2b52Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EGk1+rC2qRpdcWgov11G4chGSoaTnaT3BIpo5z9ahfNMVGujIk2F7pRSorjzdkq76
 deXlsZp+422uJOOrISTDod6mvnKkO7cpFinQGB4jyW/TSP9IY9B9hFrKrbIV+0qaQC
 J/FfLTauqBq4HpE///s6e6VWzOQUAAMrj9gOG3RFET+Q6RlIEKYvfaQphrn8BUxn/R
 35jguhVdQoG8JPKyfP9v0ltLsjBBker5IT2RFgVlcdcWik+QwSIElPTXr+FdFA/ZBQ
 Q1QG6PiTPEuCs22vWtwTiyKGYvQao9Fh7fhl+/7iHJPGbrktRTL7Y+ltjooBxbijs5
 6Jw43PLqKHwRg==
Date: Thu, 15 Jan 2026 12:54:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 dmitry.torokhov@gmail.com, jesszhan0024@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, simona@ffwll.ch,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, heiko@sntech.de,
 neil.armstrong@linaro.org, aweinzerl13@yahoo.com, jagan@edgeble.ai,
 conor+dt@kernel.org, mripard@kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/6] dt-bindings: arm: rockchip: Add Anbernic RG-DS
Message-ID: <176850327047.1003915.10842845210082585223.robh@kernel.org>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
 <20260113195721.151205-5-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113195721.151205-5-macroalpha82@gmail.com>
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


On Tue, 13 Jan 2026 13:57:19 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add compatible string for the Anbernic RG-DS.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

