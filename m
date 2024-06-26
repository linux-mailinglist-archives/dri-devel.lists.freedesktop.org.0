Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C829291863A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EAB10E94E;
	Wed, 26 Jun 2024 15:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BBreXn76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA55910E927
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 15:50:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 09AF4CE2B29;
 Wed, 26 Jun 2024 15:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B98CC116B1;
 Wed, 26 Jun 2024 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719417009;
 bh=MpTrKsJUpc3vIWujjuh/gx4N6wsWK1H9HtIbFojUBqE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BBreXn76aoPBMO8gmGLsb8fv02MT/QD+Lg/K/mQ0q0IG/L1E+S71HO111ec2CEmT2
 OPXYe0sxsNtkfwcwc3YjQ3NVrpCYbYxbRYV1vwAqu/TeqCRLslw1eNATLdr8mT1yoS
 nqsaqspv4mQ0ZMOiFTOzyeQaJhw6RdTmqmVm79f9nu8IEsHtz4B4i/GIY8Ik9HFZ7p
 A9i82eNNgBClHb9unPHpdrJbnAAn6Y6BtOMZ6CX2ni1A4IrIHZmzye4m/xotaOjnhJ
 KmA39VtHg7mdSA75d/wbugzmQfHowwGVQ8biWs64vsb3MlXbN4TGyMNJF/Lpu/uS4B
 iZif98AMGeLzQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Julia Lawall <julia.lawall@inria.fr>
In-Reply-To: <20240624-lm3509_bl_scoped-v1-1-ceba9df38f23@gmail.com>
References: <20240624-lm3509_bl_scoped-v1-1-ceba9df38f23@gmail.com>
Subject: Re: (subset) [PATCH] backlight: lm3509_bl: Fix early returns in
 for_each_child_of_node()
Message-Id: <171941700713.2526873.6218687584902221299.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 16:50:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Mon, 24 Jun 2024 17:30:50 +0200, Javier Carrasco wrote:
> The for_each_child_of_node() macro automatically decrements the child
> refcount at the end of every iteration. On early exits, of_node_put()
> must be used to manually decrement the refcount and avoid memory leaks.
> 
> The scoped version of the macro accounts for such early breaks, fixing
> the early exits without the need for explicit calls to of_node_put().
> 
> [...]

Applied, thanks!

[1/1] backlight: lm3509_bl: Fix early returns in for_each_child_of_node()
      commit: b337cc3ce47549528fc3ee0b8c7ebd33348a3126

--
Lee Jones [李琼斯]

