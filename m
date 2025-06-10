Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF799AD2F2F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5601510E488;
	Tue, 10 Jun 2025 07:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBDV8dSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AA710E486
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749541783; x=1781077783;
 h=from:to:cc:in-reply-to:references:subject:message-id:
 date:mime-version:content-transfer-encoding;
 bh=Zf8zlM1ikY+x+Aj1YRBI4DnaZ4NqNZdfWKGRPGe8aOI=;
 b=SBDV8dSpy/uelBAXXyidtn4uxn/3K7dOwyVpmCtQTkbTRSSlzCx5erpJ
 IdTbvso60oVn9CxcQX2orfLjftnShR+bfiDNcoD8Ksi5g815o4TGSqONl
 4R3ZLz8sSIXgjYOzYgaTWfyAwvtQftCIEnK6byALpgBX7eGgUND5KkPQM
 gDucWZyZipaPansw01lQmvHi7Nx5ZlCeJNfZS4TR6V/Rf6mlUAyCA/Vqv
 cCYt9iPTejo3FCfzbg5IP8c5U4O1td0ewLSKp5VF+OOR29rJFk1VcNRNY
 7uzL5D2nbcODlUEKxZSJ4GgDhIU4Hj6VeN9ZQmcQT2eW3CdJWnLBzI2aH w==;
X-CSE-ConnectionGUID: 0e2I9hhGTZGho6ZQaVC0QQ==
X-CSE-MsgGUID: ltrznWz9QIWEw1fAtYLzgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77039696"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="77039696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 00:49:39 -0700
X-CSE-ConnectionGUID: ufZhjqNVQGCbIO00v9qvhw==
X-CSE-MsgGUID: R8sZ0L7BSHmP28FclTzhsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="146682211"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 00:49:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Hans de Goede <hansg@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-ide@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
In-Reply-To: <20250609143558.42941-1-hansg@kernel.org>
References: <20250609143558.42941-1-hansg@kernel.org>
Subject: Re: [PATCH v2 0/1] MAINTAINERS: .mailmap: Update Hans de Goede's
 email address
Message-Id: <174954176287.5583.6841576782802896940.b4-ty@linux.intel.com>
Date: Tue, 10 Jun 2025 10:49:22 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Mon, 09 Jun 2025 16:35:56 +0200, Hans de Goede wrote:

> I'm moving all my kernel work over to using my kernel.org email address.
> 
> The single patch in this series updates .mailmap and all MAINTAINERS
> entries still using hdegoede@redhat.com.
> 
> Since most of my work is pdx86 related I believe it would be best for Ilpo
> to merge this through the pdx86 tree (preferable through the fixes branch).
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: .mailmap: Update Hans de Goede's email address
      commit: 3fbf25ecf8b7b524b4774b427657d30a24e696ef

--
 i.

