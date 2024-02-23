Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92353861352
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 14:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4765B10EC17;
	Fri, 23 Feb 2024 13:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nz5W91Ur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3042910EC17
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:51:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63CEE6346C;
 Fri, 23 Feb 2024 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FAFC433C7;
 Fri, 23 Feb 2024 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708696318;
 bh=brFEKOvi0EIScwnYNvoawOX3R+vzeMi5uQ5Wxtmsoqw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nz5W91UruIY79lJSQcEshWCmARAYPf4pjTDyeZwCe6tbPOvy13e0Q90Cipe/h8rL8
 P+rrq5+MraU8z68zbXATnX4CImx9aosh2IWne3beqbdTQsQTm990R9PhUnSuCm+2At
 kKOqZpDH7azDVWQH4DM0KzmFSRxAJuPiRSADrNNY2SX6QO0t9Zw0HwYMY0mAEjAG9Z
 IGqeLEVCEo2hh+Li1He9YydksX0Skieu5wjqlsAXUHdy4HE2Dg+VXQfE+JhuKgPHI1
 URnPDGKuwHR/GiLFoCuYb1MWdbAkdABVoZYlyjvfU9f7n5RTIA9/u+RjDHD33KMWl5
 5d0TRfusjkrbw==
From: Lee Jones <lee@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
In-Reply-To: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-Id: <170869631511.1650917.2831695765682192504.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 13:51:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Thu, 01 Feb 2024 17:14:12 +0200, Andy Shevchenko wrote:
> Allow to use driver on non-OF platforms and other cleanups.
> 
> Changelog v2:
> - rename pm3309c_parse_dt_node() --> mp3309c_parse_fwnode() (Daniel)
> - add tags (Daniel, Flavio)
> - new patch 2
> 
> [...]

Applied, thanks!

[1/3] backlight: mp3309c: Make use of device properties
      commit: b6fc7e62a7afc3709b31f6779665c7fc4a7755d7
[2/3] backlight: mp3309c: use dev_err_probe() instead of dev_err()
      (no commit info)
[3/3] backlight: mp3309c: Utilise temporary variable for struct device
      (no commit info)

--
Lee Jones [李琼斯]

