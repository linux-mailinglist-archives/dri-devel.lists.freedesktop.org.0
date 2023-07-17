Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8137567D8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 17:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C293410E27A;
	Mon, 17 Jul 2023 15:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C8110E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IJcqcl6YEATV0uM7dxR1yHiimSywkAB+NQBBC5aE6+U=;
 b=InhAakGoJC6TOowEjtt+No6UauAzL4N3ZPqmJQe8HlxHNJBGJc3T+Z9IF8GCFjgWZ9AF7M8j2CVqW
 noKX6PAdSZrl5oCtQztP7hn0ti0TvO9+4j7j4GzhsZGfRhg4tATuESUV7Icdj5UNdSA+2Lr15V6HMo
 yjKkpKvB6+HCFsbSyRRKOatZyODe8Y8ajMemLzDoE6g/BVt7wKPdPn931q0mWlQCaL4HAZ9DmWE7i8
 QFIPB8MrIQKTCc/d56ISpEAnEB5R1EuHn16gUJ0wWcOcky8aZVkKKksd7+Vt/HqRICnaYSU3Q63/SG
 i2dGNSFziaQWEm3CaQI3mdb0Zsx5zrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=IJcqcl6YEATV0uM7dxR1yHiimSywkAB+NQBBC5aE6+U=;
 b=QUQREvwKt81IQjYRveEITn5JFi+JnH9YZ5vjRSweTgZl1GiUe37MMw22NG6k8mjxuTgW7n2YLqn31
 bGYSuQhCA==
X-HalOne-ID: 0480e098-24b6-11ee-94b9-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 0480e098-24b6-11ee-94b9-592bb1efe9dc;
 Mon, 17 Jul 2023 15:24:28 +0000 (UTC)
Date: Mon, 17 Jul 2023 17:24:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH resend] drm/panel: simple: Simplify matching using
 of_device_get_match_data()
Message-ID: <20230717152427.GA559179@ravnborg.org>
References: <bca1d6f6a0582988accbb48d709aa9de7ad49ed7.1689600771.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bca1d6f6a0582988accbb48d709aa9de7ad49ed7.1689600771.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 03:34:13PM +0200, Geert Uytterhoeven wrote:
> Both the patform_driver and mipi_dsi_driver structures contain pointers
> to the match table used, so the custom code to obtain match and match
> data can be replaced by calls to of_device_get_match_data().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Simpler - nice.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect someone else to pick it up.

	Sam
