Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8676196D0A6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E936910E71D;
	Thu,  5 Sep 2024 07:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MO6og5gZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64B910E71D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:43:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A5515C552B;
 Thu,  5 Sep 2024 07:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489CBC4CEC4;
 Thu,  5 Sep 2024 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725522200;
 bh=2ywi2ABrKwj13e2om25ul5oQoXN4HOJZfN35u/fSyhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MO6og5gZ6EstvJSCXUtF02tNnWU0mFhi4rrSzIyf088/j5GrSEyvjabPytVfJxN6Z
 4MPAmW545PLoz9H0Cub9XW4uRT1WkSJXg/lnNNMBvh6UGFI2fNmmIdwTFb3eOh4TjP
 biAFTRO3ntP/yUun5rMPX6WRzrbk8T9W4QfMduQ1BKz6gI3dv0pPfjl3FtOzVVpnEf
 rIiMXAcTi2bEvtbFd7zNfmGmfHs3+TFhv+jFTTUsEecjzoGoNXsf5XILfPbDR/kh4C
 xkNjM18H4EpBBhLctiLiCWEkDt5q1eclH0NqoATDhgUYUPZ7XN0K8Mn2UIyjpJc041
 HVqezAJLhWLUw==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH v3 2/2] drm: panel: nv3052c: Correct WL-355608-A8
 panel compatible
Date: Thu,  5 Sep 2024 09:43:11 +0200
Message-ID: <172552218878.2901646.2731877216171955845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904012456.35429-3-ryan@testtoast.com>
References: <20240904012456.35429-1-ryan@testtoast.com>
 <20240904012456.35429-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 04 Sep 2024 13:23:22 +1200, Ryan Walklin wrote:
> As per the previous dt-binding commit, update the WL-355608-A8 panel
> compatible to reflect the the integrating device vendor and name as the
> panel OEM is unknown.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> --
> Changelog v2..v3:
> - Use integrating device name with vendor prefix instead of OEM serial.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
