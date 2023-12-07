Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C568087A3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 13:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B3D10E8A2;
	Thu,  7 Dec 2023 12:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22DA10E885
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 12:24:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AE635CE234D;
 Thu,  7 Dec 2023 12:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13C2C433C7;
 Thu,  7 Dec 2023 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701951892;
 bh=yJxfIT+Nxuqc3QVwZWIRrZI3Neyx/FsoqS5nH9VST1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iCtkIn757N75YaqjvPZAWkoYzEJjyMndLZVTPhbzfpa5ombNppPIW89jdqL4PY8wJ
 9JD1hYkTKFW6tdqEswFpJTAMcoJ5ubaXsqvgs7zKAIlPQ9SZtUPr5ZCpdDrPx5poTt
 cvTGzAw+BmKE1ierffB7FEh54qnDjPWopp8n//DGEBPcVT7xRCUfyk8kroAxrldm8Y
 GIr2Bz+pKtTWnvzkEc2AtR7B11hngM0kNxlgfI4UgOY47rcQpehoXx3dSxLI+uOfAp
 4lOtDjDQMccPKnjLybJZnQ3pFSR9dgAU6ZpZrlaosMClsre6N72t+ltQPyDbcAjE6z
 bW3Szwc/CJgew==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] accel/habanalabs: update debugfs-driver-habanalabs with
 the device-name directory
Date: Thu,  7 Dec 2023 14:24:42 +0200
Message-Id: <20231207122444.50512-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207122444.50512-1-ogabbay@kernel.org>
References: <20231207122444.50512-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The device debugfs directory was modified to be named as the
parent device name.
Update the paths accordingly.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../ABI/testing/debugfs-driver-habanalabs     | 72 +++++++++----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/Documentation/ABI/testing/debugfs-driver-habanalabs b/Documentation/ABI/testing/debugfs-driver-habanalabs
index 042fd125fbc9..a7a432dc4015 100644
--- a/Documentation/ABI/testing/debugfs-driver-habanalabs
+++ b/Documentation/ABI/testing/debugfs-driver-habanalabs
@@ -1,4 +1,4 @@
-What:           /sys/kernel/debug/accel/<n>/addr
+What:           /sys/kernel/debug/accel/<parent_device>/addr
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -8,34 +8,34 @@ Description:    Sets the device address to be used for read or write through
                 only when the IOMMU is disabled.
                 The acceptable value is a string that starts with "0x"
 
-What:           /sys/kernel/debug/accel/<n>/clk_gate
+What:           /sys/kernel/debug/accel/<parent_device>/clk_gate
 Date:           May 2020
 KernelVersion:  5.8
 Contact:        ogabbay@kernel.org
 Description:    This setting is now deprecated as clock gating is handled solely by the f/w
 
-What:           /sys/kernel/debug/accel/<n>/command_buffers
+What:           /sys/kernel/debug/accel/<parent_device>/command_buffers
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Displays a list with information about the currently allocated
                 command buffers
 
-What:           /sys/kernel/debug/accel/<n>/command_submission
+What:           /sys/kernel/debug/accel/<parent_device>/command_submission
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Displays a list with information about the currently active
                 command submissions
 
-What:           /sys/kernel/debug/accel/<n>/command_submission_jobs
+What:           /sys/kernel/debug/accel/<parent_device>/command_submission_jobs
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Displays a list with detailed information about each JOB (CB) of
                 each active command submission
 
-What:           /sys/kernel/debug/accel/<n>/data32
+What:           /sys/kernel/debug/accel/<parent_device>/data32
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -50,7 +50,7 @@ Description:    Allows the root user to read or write directly through the
                 If the IOMMU is disabled, it also allows the root user to read
                 or write from the host a device VA of a host mapped memory
 
-What:           /sys/kernel/debug/accel/<n>/data64
+What:           /sys/kernel/debug/accel/<parent_device>/data64
 Date:           Jan 2020
 KernelVersion:  5.6
 Contact:        ogabbay@kernel.org
@@ -65,7 +65,7 @@ Description:    Allows the root user to read or write 64 bit data directly
                 If the IOMMU is disabled, it also allows the root user to read
                 or write from the host a device VA of a host mapped memory
 
-What:           /sys/kernel/debug/accel/<n>/data_dma
+What:           /sys/kernel/debug/accel/<parent_device>/data_dma
 Date:           Apr 2021
 KernelVersion:  5.13
 Contact:        ogabbay@kernel.org
@@ -83,7 +83,7 @@ Description:    Allows the root user to read from the device's internal
                 workloads.
                 Only supported on GAUDI at this stage.
 
-What:           /sys/kernel/debug/accel/<n>/device
+What:           /sys/kernel/debug/accel/<parent_device>/device
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -91,14 +91,14 @@ Description:    Enables the root user to set the device to specific state.
                 Valid values are "disable", "enable", "suspend", "resume".
                 User can read this property to see the valid values
 
-What:           /sys/kernel/debug/accel/<n>/device_release_watchdog_timeout
+What:           /sys/kernel/debug/accel/<parent_device>/device_release_watchdog_timeout
 Date:           Oct 2022
 KernelVersion:  6.2
 Contact:        ttayar@habana.ai
 Description:    The watchdog timeout value in seconds for a device release upon
                 certain error cases, after which the device is reset.
 
-What:           /sys/kernel/debug/accel/<n>/dma_size
+What:           /sys/kernel/debug/accel/<parent_device>/dma_size
 Date:           Apr 2021
 KernelVersion:  5.13
 Contact:        ogabbay@kernel.org
@@ -108,7 +108,7 @@ Description:    Specify the size of the DMA transaction when using DMA to read
                 When the write is finished, the user can read the "data_dma"
                 blob
 
-What:           /sys/kernel/debug/accel/<n>/dump_razwi_events
+What:           /sys/kernel/debug/accel/<parent_device>/dump_razwi_events
 Date:           Aug 2022
 KernelVersion:  5.20
 Contact:        fkassabri@habana.ai
@@ -117,7 +117,7 @@ Description:    Dumps all razwi events to dmesg if exist.
                 the routine will clear the status register.
                 Usage: cat dump_razwi_events
 
-What:           /sys/kernel/debug/accel/<n>/dump_security_violations
+What:           /sys/kernel/debug/accel/<parent_device>/dump_security_violations
 Date:           Jan 2021
 KernelVersion:  5.12
 Contact:        ogabbay@kernel.org
@@ -125,14 +125,14 @@ Description:    Dumps all security violations to dmesg. This will also ack
                 all security violations meanings those violations will not be
                 dumped next time user calls this API
 
-What:           /sys/kernel/debug/accel/<n>/engines
+What:           /sys/kernel/debug/accel/<parent_device>/engines
 Date:           Jul 2019
 KernelVersion:  5.3
 Contact:        ogabbay@kernel.org
 Description:    Displays the status registers values of the device engines and
                 their derived idle status
 
-What:           /sys/kernel/debug/accel/<n>/i2c_addr
+What:           /sys/kernel/debug/accel/<parent_device>/i2c_addr
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -140,7 +140,7 @@ Description:    Sets I2C device address for I2C transaction that is generated
                 by the device's CPU, Not available when device is loaded with secured
                 firmware
 
-What:           /sys/kernel/debug/accel/<n>/i2c_bus
+What:           /sys/kernel/debug/accel/<parent_device>/i2c_bus
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -148,7 +148,7 @@ Description:    Sets I2C bus address for I2C transaction that is generated by
                 the device's CPU, Not available when device is loaded with secured
                 firmware
 
-What:           /sys/kernel/debug/accel/<n>/i2c_data
+What:           /sys/kernel/debug/accel/<parent_device>/i2c_data
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -157,7 +157,7 @@ Description:    Triggers an I2C transaction that is generated by the device's
                 reading from the file generates a read transaction, Not available
                 when device is loaded with secured firmware
 
-What:           /sys/kernel/debug/accel/<n>/i2c_len
+What:           /sys/kernel/debug/accel/<parent_device>/i2c_len
 Date:           Dec 2021
 KernelVersion:  5.17
 Contact:        obitton@habana.ai
@@ -165,7 +165,7 @@ Description:    Sets I2C length in bytes for I2C transaction that is generated b
                 the device's CPU, Not available when device is loaded with secured
                 firmware
 
-What:           /sys/kernel/debug/accel/<n>/i2c_reg
+What:           /sys/kernel/debug/accel/<parent_device>/i2c_reg
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -173,35 +173,35 @@ Description:    Sets I2C register id for I2C transaction that is generated by
                 the device's CPU, Not available when device is loaded with secured
                 firmware
 
-What:           /sys/kernel/debug/accel/<n>/led0
+What:           /sys/kernel/debug/accel/<parent_device>/led0
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Sets the state of the first S/W led on the device, Not available
                 when device is loaded with secured firmware
 
-What:           /sys/kernel/debug/accel/<n>/led1
+What:           /sys/kernel/debug/accel/<parent_device>/led1
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Sets the state of the second S/W led on the device, Not available
                 when device is loaded with secured firmware
 
-What:           /sys/kernel/debug/accel/<n>/led2
+What:           /sys/kernel/debug/accel/<parent_device>/led2
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Sets the state of the third S/W led on the device, Not available
                 when device is loaded with secured firmware
 
-What:           /sys/kernel/debug/accel/<n>/memory_scrub
+What:           /sys/kernel/debug/accel/<parent_device>/memory_scrub
 Date:           May 2022
 KernelVersion:  5.19
 Contact:        dhirschfeld@habana.ai
 Description:    Allows the root user to scrub the dram memory. The scrubbing
                 value can be set using the debugfs file memory_scrub_val.
 
-What:           /sys/kernel/debug/accel/<n>/memory_scrub_val
+What:           /sys/kernel/debug/accel/<parent_device>/memory_scrub_val
 Date:           May 2022
 KernelVersion:  5.19
 Contact:        dhirschfeld@habana.ai
@@ -209,7 +209,7 @@ Description:    The value to which the dram will be set to when the user
                 scrubs the dram using 'memory_scrub' debugfs file and
                 the scrubbing value when using module param 'memory_scrub'
 
-What:           /sys/kernel/debug/accel/<n>/mmu
+What:           /sys/kernel/debug/accel/<parent_device>/mmu
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -219,7 +219,7 @@ Description:    Displays the hop values and physical address for a given ASID
                 e.g. to display info about VA 0x1000 for ASID 1 you need to do:
                 echo "1 0x1000" > /sys/kernel/debug/accel/0/mmu
 
-What:           /sys/kernel/debug/accel/<n>/mmu_error
+What:           /sys/kernel/debug/accel/<parent_device>/mmu_error
 Date:           Mar 2021
 KernelVersion:  5.12
 Contact:        fkassabri@habana.ai
@@ -229,7 +229,7 @@ Description:    Check and display page fault or access violation mmu errors for
                 echo "0x200" > /sys/kernel/debug/accel/0/mmu_error
                 cat /sys/kernel/debug/accel/0/mmu_error
 
-What:           /sys/kernel/debug/accel/<n>/monitor_dump
+What:           /sys/kernel/debug/accel/<parent_device>/monitor_dump
 Date:           Mar 2022
 KernelVersion:  5.19
 Contact:        osharabi@habana.ai
@@ -243,7 +243,7 @@ Description:    Allows the root user to dump monitors status from the device's
                 This interface doesn't support concurrency in the same device.
                 Only supported on GAUDI.
 
-What:           /sys/kernel/debug/accel/<n>/monitor_dump_trig
+What:           /sys/kernel/debug/accel/<parent_device>/monitor_dump_trig
 Date:           Mar 2022
 KernelVersion:  5.19
 Contact:        osharabi@habana.ai
@@ -253,14 +253,14 @@ Description:    Triggers dump of monitor data. The value to trigger the operatio
                 When the write is finished, the user can read the "monitor_dump"
                 blob
 
-What:           /sys/kernel/debug/accel/<n>/set_power_state
+What:           /sys/kernel/debug/accel/<parent_device>/set_power_state
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
 Description:    Sets the PCI power state. Valid values are "1" for D0 and "2"
                 for D3Hot
 
-What:           /sys/kernel/debug/accel/<n>/skip_reset_on_timeout
+What:           /sys/kernel/debug/accel/<parent_device>/skip_reset_on_timeout
 Date:           Jun 2021
 KernelVersion:  5.13
 Contact:        ynudelman@habana.ai
@@ -268,7 +268,7 @@ Description:    Sets the skip reset on timeout option for the device. Value of
                 "0" means device will be reset in case some CS has timed out,
                 otherwise it will not be reset.
 
-What:           /sys/kernel/debug/accel/<n>/state_dump
+What:           /sys/kernel/debug/accel/<parent_device>/state_dump
 Date:           Oct 2021
 KernelVersion:  5.15
 Contact:        ynudelman@habana.ai
@@ -279,7 +279,7 @@ Description:    Gets the state dump occurring on a CS timeout or failure.
                 Writing an integer X discards X state dumps, so that the
                 next read would return X+1-st newest state dump.
 
-What:           /sys/kernel/debug/accel/<n>/stop_on_err
+What:           /sys/kernel/debug/accel/<parent_device>/stop_on_err
 Date:           Mar 2020
 KernelVersion:  5.6
 Contact:        ogabbay@kernel.org
@@ -287,13 +287,13 @@ Description:    Sets the stop-on_error option for the device engines. Value of
                 "0" is for disable, otherwise enable.
                 Relevant only for GOYA and GAUDI.
 
-What:           /sys/kernel/debug/accel/<n>/timeout_locked
+What:           /sys/kernel/debug/accel/<parent_device>/timeout_locked
 Date:           Sep 2021
 KernelVersion:  5.16
 Contact:        obitton@habana.ai
 Description:    Sets the command submission timeout value in seconds.
 
-What:           /sys/kernel/debug/accel/<n>/userptr
+What:           /sys/kernel/debug/accel/<parent_device>/userptr
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
@@ -301,7 +301,7 @@ Description:    Displays a list with information about the current user
                 pointers (user virtual addresses) that are pinned and mapped
                 to DMA addresses
 
-What:           /sys/kernel/debug/accel/<n>/userptr_lookup
+What:           /sys/kernel/debug/accel/<parent_device>/userptr_lookup
 Date:           Oct 2021
 KernelVersion:  5.15
 Contact:        ogabbay@kernel.org
@@ -309,7 +309,7 @@ Description:    Allows to search for specific user pointers (user virtual
                 addresses) that are pinned and mapped to DMA addresses, and see
                 their resolution to the specific dma address.
 
-What:           /sys/kernel/debug/accel/<n>/vm
+What:           /sys/kernel/debug/accel/<parent_device>/vm
 Date:           Jan 2019
 KernelVersion:  5.1
 Contact:        ogabbay@kernel.org
-- 
2.34.1

