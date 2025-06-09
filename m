Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38AAD2101
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04A010E3FB;
	Mon,  9 Jun 2025 14:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HLHQZj60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6248A10E3F4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:36:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 66B3E4A721;
 Mon,  9 Jun 2025 14:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B05C4CEED;
 Mon,  9 Jun 2025 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749479774;
 bh=Z/gbxRh7TtF3hWyIUnvehVYQEUvT10IpNv9VZ/0R8sY=;
 h=From:To:Cc:Subject:Date:From;
 b=HLHQZj60CAAKylorQphygH0ZdrpToKSfjaDedS6aYZcyrjn7gVhdTUwFsa/Dp2XQ6
 mI0s86oEbhV9UWrYtq3IYMnKLIKH6n5EvjkRsAkVPumwaVcthVLtC2TTJIvvO+kp/f
 Mkpur0gROeAJ2/AWARLHC+4q0CB7dmohGYzGrfjOtvT1FHz8vxnyxx69In+ObPI0WV
 rL3wX0fZfr8iy5FBYnAOLb92U1UQhuLOYehiZs89zVq6opaxryfVJfE5/E7wSrJhpJ
 2E96xIsGHuNVgWPDRGnMyTpAJht7PwryOeMr/ZfvPcPGJKpPg3Te/DlFW3ZNBCp5uc
 kfSM3Gi9K0FGQ==
From: Hans de Goede <hansg@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Hans de Goede <hansg@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-ide@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/1] MAINTAINERS: .mailmap: Update Hans de Goede's email
 address
Date: Mon,  9 Jun 2025 16:35:56 +0200
Message-ID: <20250609143558.42941-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

Hi All,

I'm moving all my kernel work over to using my kernel.org email address.

The single patch in this series updates .mailmap and all MAINTAINERS
entries still using hdegoede@redhat.com.

Since most of my work is pdx86 related I believe it would be best for Ilpo
to merge this through the pdx86 tree (preferable through the fixes branch).

Other subsystem MAINTAINERS are Cc-ed FYI and can otherwise ignore this.

Changes in v2:
- For v1 I only included pdx86 drivers in the MAINTAINERS file, thinking
  that I would split out the rest and send it as separate patches to
  various subsystem maintainers. But when I tried to implement that it
  became a bit messy. So now this is just one patch updating all entries
  in one go.

Regards,

Hans


Hans de Goede (1):
  MAINTAINERS: .mailmap: Update Hans de Goede's email address

 .mailmap    |  1 +
 MAINTAINERS | 72 ++++++++++++++++++++++++++---------------------------
 2 files changed, 37 insertions(+), 36 deletions(-)

-- 
2.49.0

