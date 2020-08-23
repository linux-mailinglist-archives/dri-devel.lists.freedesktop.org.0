Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6E24F2D4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AB16EC83;
	Mon, 24 Aug 2020 06:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196AF89319;
 Sun, 23 Aug 2020 22:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=xn4BC+pQmW9NzzzhMuyq2NbKnTZIdMXNDhTAAA/sNnc=; b=rgps0+RwIrR1qFQh33q+l1IacG
 8saSJirXqMnVDOqRufaLA0mftIBXJpJd2Vh/SpbubUz6wUeiEUaazPRp0+z+jBTB7gewDoXa17mio
 sYMPVgxWOgVG6DVogpKvk8Z+kMdqgya49ZWwXpSJdqjB31pCR7InrCe3raYd8oNyD+EIcUZpASIoZ
 8rXwWrkgOMFuw+2tOmWzk4WGaPRSPlVjq+TlMWkLpOvPxg8AvS4EoX2iEDnfbTibzfNHFFuebAvev
 iPhydiM3egRy8b6yuRi0OCHwmfoNJ7Ev1+Brlu6dBM+RJDKvVVAttqroCV73oys4ZgW/Kww0bYTyC
 WVt/BO2A==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9yaS-0006kJ-0f; Sun, 23 Aug 2020 22:35:42 +0000
To: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] amdgpu: fix Documentation builds for pm/ file movement
Message-ID: <88d43daf-f29b-0fbe-cf58-930e8caca0e7@infradead.org>
Date: Sun, 23 Aug 2020 15:35:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix Documentation errors for amdgpu.rst due to file rename (moved
to another subdirectory).

Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function hwmon ../drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c' failed with return code 1

Fixes: e098bc9612c2 ("drm/amd/pm: optimize the power related source code layout")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 Documentation/gpu/amdgpu.rst |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

--- linux-next-20200821.orig/Documentation/gpu/amdgpu.rst
+++ linux-next-20200821/Documentation/gpu/amdgpu.rst
@@ -153,7 +153,7 @@ This section covers hwmon and power/ther
 HWMON Interfaces
 ----------------
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: hwmon
 
 GPU sysfs Power State Interfaces
@@ -164,52 +164,52 @@ GPU power controls are exposed via sysfs
 power_dpm_state
 ~~~~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: power_dpm_state
 
 power_dpm_force_performance_level
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: power_dpm_force_performance_level
 
 pp_table
 ~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_table
 
 pp_od_clk_voltage
 ~~~~~~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_od_clk_voltage
 
 pp_dpm_*
 ~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_dpm_sclk pp_dpm_mclk pp_dpm_socclk pp_dpm_fclk pp_dpm_dcefclk pp_dpm_pcie
 
 pp_power_profile_mode
 ~~~~~~~~~~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pp_power_profile_mode
 
 *_busy_percent
 ~~~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: gpu_busy_percent
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: mem_busy_percent
 
 gpu_metrics
 ~~~~~~~~~~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: gpu_metrics
 
 GPU Product Information
@@ -239,7 +239,7 @@ serial_number
 unique_id
 ---------
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: unique_id
 
 GPU Memory Usage Information
@@ -289,7 +289,7 @@ PCIe Accounting Information
 pcie_bw
 -------
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: pcie_bw
 
 pcie_replay_count

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
