Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC65780F5A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 17:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BCC10E542;
	Fri, 18 Aug 2023 15:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD7310E542
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 15:38:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6A5665D3C;
 Fri, 18 Aug 2023 15:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5696C433C8;
 Fri, 18 Aug 2023 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692373094;
 bh=0WCy5tN3iMXrAbP8cnUWqtSxEBdiZXqtQG83w2YAGdQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DToQViPWWNU1n2KH92eufMO1C1X5GRpl2uJdQ3JOewhdYsS2AFdTTp2y0O5vuBeMe
 Auu0UMeUopW0hJlTlkArHcBieAtfxVY9TJ8vArIkWlgwdnmTEpzNuK1BloLhcqIrJq
 EreHl3+z3/UIgr9XDuxlw0xzbcMSijWRKIlBuyUlVDGlmCYDAY4eFqIL1cGsejwcpN
 tbd4kyYwtWLdnZYHy/8+TRVsFDLbNbQ7rgvXGranu1f5rPnvSu8gg8uM+BuWPd3gzk
 XMf4SnUu78MtymPJEJAyrxYT002O/0nifL+P4CGUXTd5NWv1UXmLzvjwJD3PQBHi8H
 lcDxhE1kOJr+A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20230809114216.4078-1-aweber.kernel@gmail.com>
References: <20230809114216.4078-1-aweber.kernel@gmail.com>
Subject: Re: (subset) [PATCH] backlight: lp855x: Drop ret variable in
 brightness change function
Message-Id: <169237309246.1277603.10412077461610988447.b4-ty@kernel.org>
Date: Fri, 18 Aug 2023 16:38:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kernel test robot <lkp@intel.com>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Aug 2023 13:42:16 +0200, Artur Weber wrote:
> Fixes the following warning:
> 
> drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used
> uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> 
> 

Applied, thanks!

[1/1] backlight: lp855x: Drop ret variable in brightness change function
      commit: dfd122fe8591d513b5e51313601217b67ae98d13

--
Lee Jones [李琼斯]

