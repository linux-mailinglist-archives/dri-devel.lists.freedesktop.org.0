Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OwjDMJLqWk14AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:24:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7A20E4FB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59B310E232;
	Thu,  5 Mar 2026 09:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxmbQt0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB6A10E232
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 09:24:14 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-439b8a3f2bcso3334669f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 01:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772702653; cv=none;
 d=google.com; s=arc-20240605;
 b=FlC9Kecnd39MjSi5NAn1k1heUPvmLPcmv9ZaheNTGjK4dMhBC+uMpOAZreDG2nN5ji
 EomCmRjfb6fpZsZB6FTUtMh/UvTxCBygvMUdZKVInol072roAQHmsaRKPkuLJ3yjWHDj
 HTJymo9yZ2u9fp2nVetLPNyA490grbDdDC/rbmrZilQEog8oX03Z0ZdffmKhXDgYPdpO
 e5NWPpDe+FqDtlUdSMT8g5IITH6Z7LLF9mfIAqDcXFYAmrIejf3fWg7Zc76Qy87cLRao
 kKr11yo6EbXs3Ifa2Y3bgrSJGv7l5L5QQhjbEO+LsYB2wFPrmvPljIWpRhOC6X4GoTcQ
 b05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
 fh=4Eo0lNTNLYyT8aee10/6GQgjW/VaDlkUHijcxZC3FcU=;
 b=eIg7X/BuJxyDB8YZ9JLGWuTj+Ft2fZZhsi9bgYsAY6UgCKukTzk/lDiUrkqTZQX0v7
 N+ucazlPmqoCc3BEfjLWovM6+8iBC9ygyIDzAgOwadkwXAp7y0b9zeaHmQ4ZXDi0hU6X
 e6566j7qO9dwkZ5Z2gRc89zb20XfRtop/vaQjpP4sZBd54XCapbcx4ItLANauUGG/jfi
 SACmuRXdKv1u5itMwAuJNGJnkHXJbrh6kpxqRgAwuAcDYZSvJfkLTje3qIazrbF0nMV7
 xkOOwnth9J++j4qIgZc2K/fD8zgPx6TVrMbnXV8hwqdNP8gf9atYcG1bPXjGR17COKb2
 lrOg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772702653; x=1773307453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
 b=mxmbQt0vQMJMsnpnZ9etGay+niYuVY8P2568ndXEWMx8whgCIhVemOGGsTqWAnobTX
 /OqV5024EjC7qppJapBBkaM/c+Pxx+i+aIhyLtWLRPOuTz/CwhDYGjckGyhiq34PjSll
 g+YCFcfidWsnHOUHDM/IC0fvq095k467zSUyAXEG9pDCllVPzldJdSgxW2NKrZctDr4S
 +JWUNVBI7BJQZJsNFotl+gw5jG7UXb+iA6ljWBG8KFZEWpmqgqOqrvIshZdDJG6cmBhD
 MWHET3HPH5cjZrriIgKpXNVq/kPdFhPG3lh/rswz0BxtiEO8TbVxMAP11AiSn9W7NRQZ
 UHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772702653; x=1773307453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
 b=rqOcgUsFL77VlNSu4j86e4usOgGRfWKGgovpqBshPx4wmpdZJgiJQZC00eKIkVH3/y
 GU+8jIa4lVTO1FROYQyBPGz31W7gVJ0FySUiM+H7ZftOkDuNFsOnypex+cbztz4Ry5UA
 qfiLz6eBKPU0f9vA6B5aWKtRBAl1zDARIFBvDLPr18jXxRkCYJcUWq3c7uK6yXQ0ifKs
 /Qjp4j5ao8iSPOoBiZ1IJAhScV4we7CsL4CEX0Nuo5mdPraBuN5rDBgR2dCw1jlknSRc
 VhAklVb/3b+lKTg22DwJUs6+k1rHLNkKexlXW6tg+YEvfd5EAZ+svuwk76lh8ml9COxK
 cHmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUayd99CXr6THM+gKq7SOxmqFCeASoEM967ssL8nUwlzGJHJy29Uo8zo90WB876ptrcgNwc4CjxC9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa1UeQIVs9PWtuh+HKBXX4jxS+Lgr+HWPZ7aKgQ9LYmpURA/Q7
 BNa3qeV4BB7HPPt/F7fSDHiJPtGmFoefuaNlVVKxn0RLCf45L8lfsJDVx/85TpleWZYQ9XrPez4
 51wLXM573MfP+0BRgglLba3sGDmlTBtc=
X-Gm-Gg: ATEYQzxxwEy6sGe0BTf2rUEoFTJr+6m2p6jsawfuP7pZodgl3y1hTZFh5kEZl64+wjK
 R+U9heTrJkiYLMhDOq7ruvWErBV0Y66tqci5lfwW/VR+JLYzDm1yG+nVUaChszPXjeq+8YXrRVc
 OHd49jMK+MWTmGyNVWRQ29WbNNES4G5fWbm4P9AzhnUN2fpuij9pe+pHCK4qDfh1RNbU+r4efJj
 oy4pV8t9GF9fA86CapNzIZAPbgRsiQXGC/Qka6Q5rsw+a60DagKRm2SYqga2RJr7PCB2kMfGpgj
 6AxpJWb+
X-Received: by 2002:a5d:5303:0:b0:439:cb5c:b18d with SMTP id
 ffacd0b85a97d-439cb5cb1efmr5687097f8f.38.1772702652808; Thu, 05 Mar 2026
 01:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20260303084239.15007-1-clamor95@gmail.com>
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 11:24:01 +0200
X-Gm-Features: AaiRm52U1-rp7kxII13ghlYufHfzAUdiofPyz6Xw8QG4vZZsa74ZdbNb3EWlC9g
Message-ID: <CAPVz0n0+FDAsRxCaPy65_N5O0KKE0tQ=zQupEM6VAR5LPLuOcg@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] tegra-video: add CSI support for Tegra20 and
 Tegra30
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 9DF7A20E4FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 10:42 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
>
> ---
> Changes in v2:
> - vi_sensor gated through csus
> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> - adjusted commit titles and messages
> - clk_register_clkdev dropped from pad clock registration
> - removed tegra30-vi/vip and used tegra20 fallback
> - added separate csi schema for tegra20-csi and tegra30-csi
> - fixet number of VI channels
> - adjusted tegra_vi_out naming
> - fixed yuv_input_format to main_input_format
> - MIPI calibration refsctored for Tegra114+ and added support for
>   pre-Tegra114 to use CSI as a MIPI calibration device
> - switched ENOMEM to EBUSY
> - added check into tegra_channel_get_remote_csi_subdev
> - moved avdd-dsi-csi-supply into CSI
> - next_fs_sp_idx > next_fs_sp_value
> - removed host1x_syncpt_incr from framecounted syncpoint
> - csi subdev request moved before frame cycle
>
> Changes in v3:
> - tegra20 and tegra30 csi schema merged
> - removed unneeded properties and requirements from schema
> - improved vendor specific properties description
> - added tegra20 csus parent mux
> - improved commit descriptions
> - redesigned MIPI-calibration to expose less SoC related data into header
> - commit "staging: media: tegra-video: csi: add support for SoCs with int=
egrated
>   MIPI calibration" dropped as unneeded
> - improved tegra_channel_get_remote_device_subdev logic
> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> - software syncpoint counters switched to direct reading
> - adjusted planar formats offset calculation
>
> Changes in v4:
> - removed ifdefs from tegra_mipi_driver
> - document Tegra132 MIPI calibration device
> - switched to use BIT macro in tegra114-mipi
> - pinctrl changes moved to a separate patch
> - ERESTARTSYS workaround preserved for now
> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> - reworked bytesperline and sizeimage calculaion
>
> Changes in v5:
> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> - added reasoning for tegra132 comaptible into commit desctiption
> - moved clocks into common section in tegra20-csi schema
> - added note regarding ERESTARTSYS
>
> Changes in v6:
> - dropped patches 1, 2, 3, 4, 10, 13, 21, 22 of v5 since they were picked
> - rebased on top of linux next/master
> - improved description of commit
>   "staging: media: tegra-video: vi: adjust get_selection operation check"
>
> Changes in v7:
> - rebased on top of v7
> - kzalloc > kzalloc_obj in mipi.c
> ---
>
> Svyatoslav Ryhel (15):
>   staging: media: tegra-video: expand VI and VIP support to Tegra30
>   staging: media: tegra-video: vi: adjust get_selection operation check
>   staging: media: tegra-video: vi: add flip controls only if no source
>     controls are provided
>   staging: media: tegra-video: csi: move CSI helpers to header
>   gpu: host1x: convert MIPI to use operation function pointers
>   staging: media: tegra-video: vi: improve logic of source requesting
>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
>     CSI
>   staging: media: tegra-video: tegra20: set correct maximum width and
>     height
>   staging: media: tegra-video: tegra20: add support for second output of
>     VI
>   staging: media: tegra-video: tegra20: adjust format align calculations
>   staging: media: tegra-video: tegra20: set VI HW revision
>   staging: media: tegra-video: tegra20: increase maximum VI clock
>     frequency
>   staging: media: tegra-video: tegra20: expand format support with
>     RAW8/10 and YUV422/YUV420p 1X16
>   staging: media: tegra-video: tegra20: adjust luma buffer stride
>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
>
>  drivers/gpu/drm/tegra/dsi.c                 |   1 +
>  drivers/gpu/host1x/Makefile                 |   1 +
>  drivers/gpu/host1x/mipi.c                   | 592 +++-----------
>  drivers/gpu/host1x/tegra114-mipi.c          | 483 ++++++++++++
>  drivers/staging/media/tegra-video/Makefile  |   1 +
>  drivers/staging/media/tegra-video/csi.c     |  64 +-
>  drivers/staging/media/tegra-video/csi.h     |  22 +
>  drivers/staging/media/tegra-video/tegra20.c | 820 +++++++++++++++++---
>  drivers/staging/media/tegra-video/vi.c      |  58 +-
>  drivers/staging/media/tegra-video/vi.h      |   6 +-
>  drivers/staging/media/tegra-video/video.c   |   8 +-
>  drivers/staging/media/tegra-video/vip.c     |   2 +-
>  drivers/staging/media/tegra-video/vip.h     |   2 +-
>  include/linux/host1x.h                      |  10 -
>  include/linux/tegra-mipi-cal.h              |  57 ++
>  15 files changed, 1482 insertions(+), 645 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
>

Hello there!

May this patchset be picked if everyone is fine with it? v6 iteration
was hanging for a quite some time already without any actions, I have
rebased v7 onto linux-next but no other major changes were applied.

Best regards,
Svyatoslav R.

> --
> 2.51.0
>
