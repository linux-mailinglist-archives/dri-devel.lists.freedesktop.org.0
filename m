Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C87A456EE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 08:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDC510E146;
	Wed, 26 Feb 2025 07:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QgqyvX99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6110E146
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 07:46:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 515975C3740;
 Wed, 26 Feb 2025 07:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DD5C4CED6;
 Wed, 26 Feb 2025 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740556013;
 bh=JoAj9xLaECtQl+Lj5BZuQBxUIeb2+n1Z1pxP79r2H3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgqyvX991q884nQHjvQHuZwzm9PwsbnVmBzYqk3CBYUFaJ+IehlBR3Uc/dYSSApK8
 Ers6An5ej3cLmBul0T3wXnqmqZVpjcp8B+G1zE6YzWwkEvSMY1oLRUQagoKt14v7SK
 qksaH7l01YxnXAm+jKHOuNdqwauJdD8dc6yqrUrnN3NMKL7pCHetBWb1b2hfpgWWJH
 Hc01Ac9dcH4cvsYcyoL0GaXqoJZ2s+NEq8nYuzV+M+RGs9iib1uuuMO8suO2kVTOVk
 gXK/8oQVI9uLrC+De8O5bk7aP3pEQ1j+7QFaYzsPOc7d6VbrxB//6T6tgwF4IlKn2m
 GmBiGYyfnN1lg==
Date: Wed, 26 Feb 2025 08:46:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <20250226-speedy-dark-mushroom-5d7c4b@krzk-bin>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-2-0b1f05915fae@lucaweiss.eu>
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

On Tue, Feb 25, 2025 at 10:14:30PM +0100, Luca Weiss wrote:
> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> Describe it and the Fairphone 3 panel (98-03057-6598B-I) from DJN using
> it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 

Discussion is still going. Sending v2 after two days is hiding that
previous talk, so that makes me sad.

I am still at v1 and I am not going to review this one here.

Best regards,
Krzysztof

