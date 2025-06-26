Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A658AAEAAEE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF5A10E929;
	Thu, 26 Jun 2025 23:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s2on4yBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294610E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:53:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CD7F16111F;
 Thu, 26 Jun 2025 23:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69308C4CEEB;
 Thu, 26 Jun 2025 23:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750982016;
 bh=N5pKkhGR3QP96XtzFcSDhYGgqn/gFEdccQcQ5m8XHK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2on4yBpfJ10nNsGwKhMughoTXH/b3fP3kRkR1wrgAaZgGvhTlKSSrP3f9gnLYgu9
 50iuAWupWw9jlzUew/uwqmlnA6u0nFWIEStRYuJlOTwgOCysIYTiJrCGPEogLHQqnP
 EXmPuT9YtJXqulwi7cp6NfkMFiR7mOhvp9v9+6HnYWa8EgU5IQ6riOGg4fVLxKnKp1
 +ZO6CkUpLDpZkXvHaHiJkC/fsrGv+axhLjDSLhgAbydDsYeDacaIZfkliZOnzj2ssS
 FhygtQA+FkKCOUIUxOM9zo9dbjfgNhlfnGvpIOxsiuhAHT7784IzJ+1bPnOgI6tOyQ
 0ceQLy9fRAzvQ==
Date: Thu, 26 Jun 2025 18:53:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 neil.armstrong@linaro.org, conor+dt@kernel.org,
 sebastian.reichel@collabora.com, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Make reset-gpio as
 optional for Raydium RM67200
Message-ID: <175098201489.1430871.16529661509700275956.robh@kernel.org>
References: <20250616070536.670519-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616070536.670519-1-andyshrk@163.com>
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


On Mon, 16 Jun 2025 15:05:16 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Although the datasheet of the panel module describes that it has a
> reset pin, in the actual hardware design, we often use an RC circuit
> to control the reset, and rarely use GPIO to control the reset. This
> is the way it is done on our numerous development boards (such as RK3568,
> RK3576 EVB).
> So make the reset-gpio optional.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

