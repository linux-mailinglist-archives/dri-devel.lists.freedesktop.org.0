Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79524B00F0C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 00:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F43410E239;
	Thu, 10 Jul 2025 22:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tb0T4GSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB3D10E239
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 22:52:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0253BA5492B;
 Thu, 10 Jul 2025 22:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666B2C4CEE3;
 Thu, 10 Jul 2025 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752187918;
 bh=2SoiiN2aedDZElWi2ybg611D5EPVq8dWYtje3WeylSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tb0T4GSGSk2PVpFX76AUKoU5AkIXLgUY/8xfWehxCxDO2W3bLd34bWLd2GtzixqJV
 3ikAfExXXNFJOs/jaZE6nmIM0hdUp483rdBOwxE2FpOgJHinQoFFmVQQZ+9ad9aze3
 yxCHxMtJxZ/iw+/gRVzLza6U13NX65AlY3g3MF8ykcbT1gQ8bn1/3eUJC1oVZ0F+RK
 f0YAcLUc7DQafhS2KkFRygS8v1QQy+bZp+uGXg+3KJO+AK5AtN8fBZHe5TUJ5L/TQJ
 aZ5EPq677D4qsi9nI8JsBaeI1k30J7pt6Qr8+4in+Zq65CSVXmnsrVLaBs65hVXhoC
 ZM8n8yfmTUUyA==
Date: Thu, 10 Jul 2025 17:51:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ipedrosa@redhat.com, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: Add Sitronix ST7567 LCD
 Controller
Message-ID: <175218791703.25569.4586034427262518390.robh@kernel.org>
References: <20250710102453.101078-1-javierm@redhat.com>
 <20250710102453.101078-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710102453.101078-2-javierm@redhat.com>
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


On Thu, 10 Jul 2025 12:24:33 +0200, Javier Martinez Canillas wrote:
> Sitronix ST7567 is a monochrome Dot Matrix LCD Controller.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../bindings/display/sitronix,st7567.yaml     | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7567.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

