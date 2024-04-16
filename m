Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B98A6A8F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E0610E9B2;
	Tue, 16 Apr 2024 12:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bJYJhJHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561A110E9B2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:17:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 182E56119F;
 Tue, 16 Apr 2024 12:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95982C113CE;
 Tue, 16 Apr 2024 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713269858;
 bh=KUoqvIfp72VSJoG5DlTPcOVEPeLqujFVbiYLFnOG3Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bJYJhJHpWaR9fEXSKGb6ceVdVPpkVkFO5CLpLz1gLwxykLV0VmXc+EJnZjGB7WV9U
 IWLAUVln3CfDRumS9+hBhcGb83plwk9y+WCFN0cBjda1PnQ8PaLPKevZLQsFvAK2aD
 aGQ3kqFNvD3K1zAQkM6swrch7sSUiAg0TUFf6lIA7RtwTtIOE/hideOl8Kot5UnkvY
 6gaBO7clG9PBQVOJXrqAZrlMLA8rCjdR+pXczxYI8ck9OOGn6x3OTp0qBrRdpuEjAp
 33fOLjcCjVm0VJw9m6Ia4zFOKdpLHJTghqGxf/0sXGRQcErJKuGLZUNz4iisWFzgjW
 bmESs2+dcTUOw==
Date: Tue, 16 Apr 2024 13:17:31 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/18] backlight: Constify lcd_ops
Message-ID: <20240416121731.GT2399047@google.com>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <b4cafdd1-c1b0-4abd-a849-8132c19d1525@suse.de>
 <65adee30-fd12-4cc7-a227-9a586bb9e6d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65adee30-fd12-4cc7-a227-9a586bb9e6d5@kernel.org>
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

On Mon, 15 Apr 2024, Krzysztof Kozlowski wrote:

> On 15/04/2024 08:56, Thomas Zimmermann wrote:
> > Hi
> > 
> > for patches 16, 17 and 18:
> > 
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> This does not work like this. Toolset will apply your review tag for
> EVERYTHING. You must provide tag under each individual patch.

And for that to not happen now, you have to resubmit the set. :)

-- 
Lee Jones [李琼斯]
