Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1587EB04F9C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 05:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5C210E500;
	Tue, 15 Jul 2025 03:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nCwqJ8Ry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF15010E500
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 03:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 92C9444EE0;
 Tue, 15 Jul 2025 03:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A22C4CEE3;
 Tue, 15 Jul 2025 03:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752551926;
 bh=E1bP2qyrdHOflkUNF5HIzZ1cwKCdQr2yzEaRreh3xcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nCwqJ8RyiHOZpyii7xllAANTbVcSC47F0pmFvRK+AK2LUU/o24PyFHn03RqffxClA
 jJYlGYh0vlU8CBMSR74UZs+CxAhZb3SL5l6+FhXqDwjYt9a0kzM6HH6+SYh8L5e9nN
 6+feukmQHpnCic44wuNHjRY0WSmu0LhakmtKYhUbeZnCavbCAI4BHZqIaupVn28QCC
 vnGqb2ozc1dvBqEyWktYUjPy/g0KxBig6qUa3KcVOkJ4SqGui31Ovs4BrbEYJprnjY
 i1DAb9BoJ7EYqDALGC7elsaJTnpf7T36DUkDzG+M5Rq/dIWLJ9mayNzh4NQGz750Uo
 ErvL5OcBLjE5A==
Date: Mon, 14 Jul 2025 22:58:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dale Whinham <daleyo@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?iso-8859-1?B?Suly9G1l?= de Bretagne <jerome.debretagne@gmail.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: panel: samsung,atna30dw01:
 document ATNA30DW01
Message-ID: <175255192501.20738.16784196888105498389.robh@kernel.org>
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-3-daleyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714173554.14223-3-daleyo@gmail.com>
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


On Mon, 14 Jul 2025 18:35:38 +0100, Dale Whinham wrote:
> The Samsung ATNA30DW01 panel is a 13" AMOLED eDP panel. It is similar to
> the ATNA33XC20 except that it is smaller and has a higher resolution.
> 
> Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

