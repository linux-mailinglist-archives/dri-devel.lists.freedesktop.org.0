Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A96744DD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 22:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFC910E26D;
	Thu, 19 Jan 2023 21:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFA110E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 21:41:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 203F1B8274C;
 Thu, 19 Jan 2023 21:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB970C433EF;
 Thu, 19 Jan 2023 21:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674164475;
 bh=VhT//xdaFJPL+dSaI47Z5lILBjkKNuCbZfXeuUicLJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QuXpGV1gFsGP6Vt1PI8UcWgi4x+iHPLQ2GhQyJCPCcS5NtMAJrcoTNG8bKnV+6XA7
 VTY1lhJK5jZt7/WZbL4cgaQi2gxlb9bPcGTRK10xcDcekU+MlG8IBpB5/sscFoOWsC
 h9ga5iUbMBihFJcfj0QjKzIr3HV4GrwseDTJQVgX1DyurpLTL7mjVNVit+V5UW8NVw
 onL3FbbfEJ/tLmpebZGR4PUiwiDf2Er+2wv3LYQIF9wvbaAIkXt0qcGEOI0/aknnYr
 ozmT8Xw9BqNp8GADORcZ29uKlJmHx2Gn04kxdDRhkBdBxh1JGp/SZumQB8p0MdsknL
 FmnMSbBvaBI+Q==
Date: Thu, 19 Jan 2023 21:41:10 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 1/4] backlight: aat2870: Use backlight helper
Message-ID: <Y8m49nsyR0B9vcbX@google.com>
References: <20230106164856.1453819-2-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230106164856.1453819-2-steve@sk2.org>
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
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 Jan 2023, Stephen Kitt wrote:

> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  drivers/video/backlight/aat2870_bl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
