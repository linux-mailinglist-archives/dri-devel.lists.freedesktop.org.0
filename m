Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8811734DB5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BC910E1B5;
	Mon, 19 Jun 2023 08:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA62E10E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:31:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44DE960EEA;
 Mon, 19 Jun 2023 08:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B53C433C0;
 Mon, 19 Jun 2023 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687163490;
 bh=TSClhyLxMq70prBNpTrAH2YWH7SlNfqgmwDHchD6LfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PY4fO0jI1EenTiaTEn7YbZkXv+X4uOusGhGJSQ5cpbMuzjsq0PtUfJY80qRjxYYP/
 /+4xXEQqyNf8H6T5PG9x2tzr4utR6AhcALc+EMikMR07zuKTQC1UlBNaPqQ8AVJ9/a
 lNaxRd/uB+U6TjPHnmEYp3t0Zk2vmXtqQRFw7bulTxYhq8oa6/hAhJnWQILdWV6Cd8
 Dv8VbjXZ1vim6y5Hwjoqog+/cdfCUG76hwFzqo8CXqnbokFYCaJ91vzOTvyqbtR+1I
 PSmLAzIwJ31DZom3VRvY3Mzis1o2rNS2REyLDDlmrdJBeuaQBX4pIsIgid9xr+Ilrz
 tr72a36h2M3xQ==
Date: Mon, 19 Jun 2023 09:31:24 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Message-ID: <20230619083124.GO3635807@google.com>
References: <20230613110953.24176-1-tzimmermann@suse.de>
 <20230613110953.24176-2-tzimmermann@suse.de>
 <20230614135157.GU3635807@google.com>
 <5720dbc1-a3e4-2b23-28cd-f889d3a5a4fc@suse.de>
 <9f74b8de-9a1b-2547-5eab-d4b4349a6a81@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f74b8de-9a1b-2547-5eab-d4b4349a6a81@suse.de>
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
Cc: daniel.thompson@linaro.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, michael.j.ruhl@intel.com,
 stable@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023, Thomas Zimmermann wrote:

> Hi Lee
> 
> Am 14.06.23 um 16:13 schrieb Thomas Zimmermann:
> [...]
> > > Can the Backlight patches be applied without the others and visa versa?
> > 
> > Unfortunately not. The rest of the series requires the backlight patches.
> 
> Are you OK with the patches going through drm?

Shouldn't be an issue.

Please ensure my Ack is added to each patch, even if you have to RESEND.

-- 
Lee Jones [李琼斯]
