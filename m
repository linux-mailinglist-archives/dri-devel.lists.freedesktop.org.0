Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B08009DC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 12:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F5F10E0F5;
	Fri,  1 Dec 2023 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303EC10E0F5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 11:24:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C55562126;
 Fri,  1 Dec 2023 11:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B97C433C7;
 Fri,  1 Dec 2023 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701429890;
 bh=rYqBSjamQXtlSslFcg8gvLvU5PS9WpJZS4rNYHLG+H8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YmIm5RK3ckUH4e9RsSXlclJRgNNR9mlCL9AKQLWj9hZf4oLIQenz7MCKvfqLFX3Sj
 N2DBN1jm7uEugLNJ9FQ+AYwDG5kLS+s60SrO5hlE2r1C8ECpoaP6S4f05RysULzBS+
 DU1YciJ+coOKpPHlVZbn5ym2UigN41+EWF31uGX/Yl1pVWpk3iyGUJBcbv/LY6960v
 DbTff0rpJ4PIeaH5Gg7q6oHYgEVjnht9IF9J1KOkNtlg1uIml63qY6mVo4+l335UJt
 TieIg18K1mCrrlwPYr1kIvME+Kg60VRlZYSRIUViVde97kwNHLybC/8iloKqfi0/tm
 Z6dZ/19r9yApw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Flavio Suligoi <f.suligoi@asem.it>
In-Reply-To: <20231129164514.2772719-1-f.suligoi@asem.it>
References: <20231129164514.2772719-1-f.suligoi@asem.it>
Subject: Re: (subset) [PATCH v2] backlight: mp3309c: fix uninitialized
 local variable
Message-Id: <170142988824.3370898.14636793712947246293.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 11:24:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023 17:45:14 +0100, Flavio Suligoi wrote:
> In the function "pm3309c_parse_dt_node", when the dimming analog control
> mode (by I2C messages) is enabled, the local variable "prop_levels" is
> tested without any initialization, as indicated by the following smatch
> warning:
> 
> drivers/video/backlight/mp3309c.c:279 pm3309c_parse_dt_node() error: uninitialized symbol 'prop_levels'.
> 
> [...]

Applied, thanks!

[1/1] backlight: mp3309c: fix uninitialized local variable
      commit: ab47505ce45b869ab649024dc932e981fcdd6e5f

--
Lee Jones [李琼斯]

