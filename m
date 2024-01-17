Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382EE8302AD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B67010E673;
	Wed, 17 Jan 2024 09:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BEE10E672;
 Wed, 17 Jan 2024 09:47:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2DFDFCE1B31;
 Wed, 17 Jan 2024 09:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193A3C43399;
 Wed, 17 Jan 2024 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705484834;
 bh=DzKkZ7pwJrE9T6YvgnxaoBeYmKwKiuExIE8dk9CyibA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PCTf7WkKYcQsxfBy5YaMXL+ElkORn7WfuEF8eFRn2qRb61DC+JtbEK8GFyFu8mUlw
 I1cYBv8LyBf8Ikv5AxqVrChMnQ9NKFjO3bIL7p/a3AnL2R4NL+lpb1v8eFLxf1Hb5D
 dkbaKdsyb6t5+8MZMeDJYwgJ5G+H4sRzm3GRGvUoVaAz/wbnobeCpMyTLbSXvpCCOt
 qRUTwHp0Kyurh5QmjUuA1x8xkuIVTvtpsaCpKn7db4IRokIT0svzO9o864B2EcfG5Z
 bjCTb3Pm0Ls+7VxbxW3r7wNLS+HSulQsgard3UH5d5G0nCP/WXhU3ZUU+FfggJtlIi
 GdSqHeYw/uzjw==
From: Maxime Ripard <mripard@kernel.org>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
In-Reply-To: <20240115171351.504264-6-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
 <20240115171351.504264-6-michal.winiarski@intel.com>
Subject: Re: (subset) [PATCH v5 5/5] drm/tests: managed: Add a simple test
 for drmm_managed_release
Message-Id: <170548483207.96553.13751158453989527090.b4-ty@kernel.org>
Date: Wed, 17 Jan 2024 10:47:12 +0100
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Jan 2024 18:13:51 +0100, Michał Winiarski wrote:
> Add a simple test that checks whether the action is called when
> drmm_managed_release is called.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

