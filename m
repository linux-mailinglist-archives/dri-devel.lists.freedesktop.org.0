Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB8A1ABE1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 22:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5021210E0DB;
	Thu, 23 Jan 2025 21:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ma4Qyk7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B9310E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 21:30:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7BA33A4141E;
 Thu, 23 Jan 2025 21:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D00C4CED3;
 Thu, 23 Jan 2025 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737667846;
 bh=929SbkPZ1rHZGzLzkzfyL8bQgeP/Kh91Wpz1dFourKM=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=ma4Qyk7mEhcwihmS3b+DFhOCXJEno6SD0X4g8jNX14SQHHum/jftVXnUCHAxXyJtj
 9SCAboLAP8ky3xalfX1MbyKuArL+iM3esKuGwRSrPAj1qCmgkCadWn5cTMndCiG/N1
 RomQpgO5gpQOVLLUNtM5AIFSKhHWhrOUwVYrG4aVlhwu4lRAOVQDuNhTw84HqZTrQS
 s68Ut3F0dPYC5upgmdHekKp+ta38/e+bzO7J+CV3WCyD1RlM1k21fS5czBOV6e3IEu
 UdqLHrUXpiwCWTFe33OduOL4KpBZ9aBUrqPmvzthFGqUnxzooQoE8UIgTWiFdIHwf0
 lRL//4PJcktsA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 23:30:40 +0200
Message-Id: <D79RU9MHGKJ8.1HG89ZJS4Q5FC@kernel.org>
Cc: <linuxtv-ci@linuxtv.org>, <dave.pigott@collabora.com>,
 <mripard@kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <gustavo.padovan@collabora.com>, <pawiecz@collabora.com>,
 <spbnick@gmail.com>, <tales.aparecida@gmail.com>,
 <workflows@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <kunit-dev@googlegroups.com>, <nfraprado@collabora.com>,
 <davidgow@google.com>, <cocci@inria.fr>, <Julia.Lawall@inria.fr>,
 <laura.nao@collabora.com>, <kernel@collabora.com>,
 <torvalds@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
 <daniels@collabora.com>, <helen.koike@collabora.com>,
 <shreeya.patel@collabora.com>, <denys.f@collabora.com>,
 <nicolas.dufresne@collabora.com>, <louis.chauvet@bootlin.com>,
 <hamohammed.sa@gmail.com>, <melissa.srw@gmail.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <Tim.Bird@sony.com>,
 <laurent.pinchart@ideasonboard.com>, <broonie@kernel.org>,
 <leobras.c@gmail.com>, <groeck@google.com>, <rdunlap@infradead.org>,
 <geert@linux-m68k.org>, <michel.daenzer@mailbox.org>, <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>, <kernelci@lists.linux.dev>
X-Mailer: aerc 0.18.2
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
In-Reply-To: <20250123135342.1468787-1-vignesh.raman@collabora.com>
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

On Thu Jan 23, 2025 at 3:53 PM EET, Vignesh Raman wrote:
> We are working towards creating a generic, upstream GitLab-CI pipeline
> (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipelin=
e
> is designed with a distributed infrastructure model, making it possible
> to run on any gitLab instance. We plan to leverage KernelCI [2] as the
> backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
> integration.

Why can't you keep the next version of your great pipeline outside the
kernel tree?

If there is a legit motivation for doing that, why it needs to be bound
to Gitlab? Why can't you make script callable from any CI?

BR, Jarkko
