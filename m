Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1070CAFBD67
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E85810E565;
	Mon,  7 Jul 2025 21:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="eUopBNLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D767110E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:33:21 +0000 (UTC)
X-UUID: 5aba923e5ad211f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qGhF4xjLVXPOOuOMkbfISUd7i+FvW0Z2/VH51vlf5ds=; 
 b=eUopBNLUbqx+pbrX73SzMeLBSBAVPihHHIsJDQbyS2o3dSb111F3XlgFWeKkmeafw8M6VQo+a6gGvOjAhmvzhZ8Zkm8hocwfiBR2RBAVLbrT2Bys1uV8JpGWiaJTo3QB3zDu6JB3XGFl6eyz0qRqmRhQn28a8HOKRuWRwfh6heA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:f3f54cf3-0406-41e4-9ea1-be3824010f24, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:9eb4ff7, CLOUDID:52def073-15a7-4ae6-ad4b-94c27b45c266,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5aba923e5ad211f0b1510d84776b8c0b-20250707
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shangyao.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1242543706; Mon, 07 Jul 2025 09:33:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:33:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:33:14 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 13/13] media: uapi: mediatek: document ISP7x camera system
 and user controls
Date: Mon, 7 Jul 2025 09:31:54 +0800
Message-ID: <20250707013154.4055874-14-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:55 +0000
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

From: "shangyao.lin" <shangyao.lin@mediatek.com>

This document covers:
- The hardware pipeline and firmware interface
- Integration with the V4L2 CAMSYS/media controller framework
- The list of custom V4L2 controls, their usage, valid ranges, and typical usage flow

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../media/v4l/mtk-isp7x-camsys.rst            |  94 +++++++++
 .../media/v4l/mtk-isp7x-controls.rst          | 199 ++++++++++++++++++
 2 files changed, 293 insertions(+)
 create mode 100755 Documentation/userspace-api/media/v4l/mtk-isp7x-camsys.rst
 create mode 100755 Documentation/userspace-api/media/v4l/mtk-isp7x-controls.rst

diff --git a/Documentation/userspace-api/media/v4l/mtk-isp7x-camsys.rst b/Documentation/userspace-api/media/v4l/mtk-isp7x-camsys.rst
new file mode 100755
index 000000000000..04a1fe1c448d
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/mtk-isp7x-camsys.rst
@@ -0,0 +1,94 @@
+==========================
+MediaTek ISP7x Camera System
+==========================
+
+Overview
+========
+
+The MediaTek ISP7x camera system is designed to provide a flexible, high-performance image capture pipeline for SoCs, leveraging the Linux V4L2 framework. The system is composed of multiple hardware modules (Sensor, SENINF, RAW ISP, etc.) and a firmware backend, with a clear separation of control and data flow. This document describes the hardware architecture from the perspective of the interface exposed to the firmware (backend), and how it integrates with the V4L2 CAMSYS framework.
+
+V4L2 CAMSYS Framework Overview
+==============================
+
+The V4L2 CAMSYS framework models the camera pipeline as a set of interconnected devices and subdevices:
+
+- **Video Device**: Exposes buffer queue/dequeue (enque/deque) operations to user space, allowing applications to stream image data.
+- **Subdevice**: Represents a hardware block (e.g., sensor, SENINF, RAW ISP) and handles control/configuration operations.
+- **Pads and Links**: Each subdevice has pads (input/output endpoints). Media links connect pads, representing the physical and logical data flow between hardware blocks.
+
+The topology and link state are established at probe time and can be dynamically enabled/disabled by user space, depending on the desired pipeline configuration.
+
+Hardware Pipeline
+=================
+
+A typical pipeline consists of:
+
+.. code-block::
+
+    Sensor --> SENINF --> RAW ISP --> (optional: YUV ISP) --> Memory
+
+- **Sensor**: Provides MIPI CSI-2 data.
+- **SENINF**: Receives and demultiplexes sensor data, supports virtual channel (VC) and data type (DT) routing.
+- **RAW ISP**: Main image signal processor, handles demosaicing, noise reduction, and other image enhancements.
+- **YUV ISP** (optional): Further processing for YUV output.
+- **CAMSYS**: System controller, manages pipeline state, buffer flow, and synchronization.
+
+Firmware Interface
+==================
+
+The firmware (backend, e.g., CCD/SCP) is responsible for:
+
+- Calculating hardware settings (3A, tuning, DMA, FBC, Twin, etc.) for each frame.
+- Generating command queues (CQ) and descriptors to program the hardware.
+- Abstracting hardware-specific details from the kernel driver.
+
+The kernel driver communicates with the firmware via an inter-processor interface (IPI), typically using RPMSG. The main interactions are:
+
+1. **Session Management**: The kernel establishes a session with the firmware at stream-on, and destroys it at stream-off.
+2. **Per-frame Request Scheduling**: For each user request (frame), the kernel sends a request to the firmware, including sensor settings, buffer addresses, and control parameters.
+3. **CQ Generation**: The firmware generates the necessary command queues and returns them to the kernel.
+4. **Event Notification**: The firmware notifies the kernel of CQ completion, errors, or other events.
+
+Request Scheduling and Buffer Flow
+==================================
+
+The request scheduling flow is as follows:
+
+1. **User space** submits a request (with buffer and control settings) via V4L2.
+2. **PipeMgr** (user space) collects requests, groups them by file descriptor, and sends them to the kernel CAMSYS driver.
+3. **CAMSYS** schedules requests, manages buffer flow, and coordinates with the firmware for hardware programming.
+4. **Firmware** processes each request, generates CQ, and signals completion.
+5. **Kernel** dequeues the buffer and notifies user space.
+
+The system supports per-frame control, allowing sensor settings and ISP parameters to be updated on a frame-by-frame basis.
+
+Media Controller Topology
+=========================
+
+The media controller graph models the hardware pipeline as a set of entities (video devices, subdevices) connected by links. Each entity exposes pads, and links are established at probe time based on the hardware configuration and device tree.
+
+.. code-block::
+
+    +---------+     +--------+     +--------+     +------+
+    | Sensor  | --> | SENINF | --> | RAW ISP| --> | Video|
+    +---------+     +--------+     +--------+     +------+
+
+- Solid lines: active links (enabled)
+- Dashed lines: inactive links (disabled)
+
+User space can query and configure the topology using standard V4L2 and media controller APIs.
+
+Backend Abstraction
+===================
+
+The backend firmware abstracts hardware-specific programming, allowing the kernel driver to remain generic and maintainable. All hardware register programming, tuning, and advanced features are handled in the firmware, with the kernel acting as a control and data flow manager.
+
+This separation ensures that proprietary hardware details remain in the firmware, while the kernel driver exposes a standard V4L2 interface.
+
+Summary
+=======
+
+- The MediaTek ISP7x camera system is built on the V4L2 media controller framework, with a modular pipeline of video devices and subdevices.
+- The kernel driver manages pipeline state, buffer flow, and per-frame control, while delegating hardware programming to the backend firmware via IPI.
+- The firmware interface is session-based, supports per-frame CQ generation, and abstracts all hardware-specific details from the kernel.
+- The media controller graph models the hardware pipeline, allowing flexible configuration and dynamic topology management.
\ No newline at end of file
diff --git a/Documentation/userspace-api/media/v4l/mtk-isp7x-controls.rst b/Documentation/userspace-api/media/v4l/mtk-isp7x-controls.rst
new file mode 100755
index 000000000000..0e8d41d339e7
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/mtk-isp7x-controls.rst
@@ -0,0 +1,199 @@
+==========================================
+MediaTek ISP Camsys User Space Interface
+==========================================
+
+Overview
+--------
+
+The MediaTek ISP camsys driver provides a set of custom V4L2 controls for user space
+applications to configure and query the ISP hardware. These controls allow
+fine-grained management of resource allocation, feature enablement, and
+hardware-specific settings.
+
+Typical Usage Flow
+------------------
+
+1. Open the video device node (e.g., ``/dev/video0``).
+2. Set required V4L2 controls using ``VIDIOC_S_CTRL`` or ``VIDIOC_S_EXT_CTRLS``.
+3. Set up video format and buffers (``VIDIOC_S_FMT``, ``VIDIOC_REQBUFS``, etc.).
+4. Start streaming with ``VIDIOC_STREAMON``.
+5. Queue and dequeue buffers for image processing (``VIDIOC_QBUF``, ``VIDIOC_DQBUF``).
+6. Stop streaming with ``VIDIOC_STREAMOFF``.
+
+Control List and Documentation
+-----------------------------
+
+Below is a list of custom V4L2 controls provided by the camsys driver, with detailed descriptions.
+
+.. list-table::
+   :header-rows: 1
+
+   * - Control Name
+     - Type
+     - Description
+     - Valid Values / Range
+     - When to Set
+
+   * - ``V4L2_CID_MTK_CAM_USED_ENGINE_LIMIT``
+     - Integer
+     - Limits the maximum number of RAW engines (hardware pipelines) that can be used for this stream.
+     - 1 ~ 2 (default: 2)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_BIN_LIMIT``
+     - Integer
+     - Sets the maximum binning ratio allowed for the stream.
+     - 0 ~ 0xFFF (default: 0)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_FRZ_LIMIT``
+     - Integer
+     - Sets the maximum resizer (FRZ) ratio allowed (as a percentage).
+     - 70 ~ 100 (default: 100)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_RESOURCE_PLAN_POLICY``
+     - Integer (Enum)
+     - Selects the resource planning policy for the stream.
+     - 0: Default, 1: Power-saving, 2: Performance, ... (0~10)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_USED_ENGINE``
+     - Integer
+     - Reports or sets the number of RAW engines actually used for this stream after negotiation.
+     - 1 ~ 2 (default: 2)
+     - After resource negotiation
+
+   * - ``V4L2_CID_MTK_CAM_BIN``
+     - Boolean
+     - Enables or disables binning for the stream.
+     - 0 (disable), 1 (enable, default)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_FRZ``
+     - Integer
+     - Sets the resizer (FRZ) ratio (as a percentage) for the stream.
+     - 70 ~ 100 (default: 100)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_USED_ENGINE_TRY``
+     - Integer
+     - Reports the number of RAW engines that would be used for the current "try" format negotiation.
+     - 1 ~ 2 (default: 2)
+     - After VIDIOC_TRY_FMT
+
+   * - ``V4L2_CID_MTK_CAM_BIN_TRY``
+     - Boolean
+     - Reports whether binning would be enabled for the current "try" format negotiation.
+     - 0, 1 (default: 1)
+     - After VIDIOC_TRY_FMT
+
+   * - ``V4L2_CID_MTK_CAM_FRZ_TRY``
+     - Integer
+     - Reports the resizer ratio that would be used for the current "try" format negotiation.
+     - 70 ~ 100 (default: 100)
+     - After VIDIOC_TRY_FMT
+
+   * - ``V4L2_CID_MTK_CAM_PIXEL_RATE``
+     - Integer64
+     - Sets the pixel rate (in pixels per second) of the sensor for resource calculation.
+     - 0 ~ 0xFFFFFFFF
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_FEATURE``
+     - Bitmask (Integer64)
+     - Bitmask of enabled features for the stream (e.g., HDR, 3A, etc.). See driver header for details.
+     - Bitmask (0 ~ RAW_FUNCTION_END)
+     - Before streaming or per-frame
+
+   * - ``V4L2_CID_MTK_CAM_SYNC_ID``
+     - Integer64
+     - Frame synchronization ID for multi-sensor or multi-pipeline synchronization.
+     - -1 ~ 0x7FFFFFFF (default: -1)
+     - Before streaming or per-frame
+
+   * - ``V4L2_CID_MTK_CAM_RAW_PATH_SELECT``
+     - Integer
+     - Selects the RAW path (e.g., main or secondary) for the stream.
+     - 0, 1 (default: 1)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_HSF_EN``
+     - Integer
+     - Enables or disables hardware secure flow (HSF) for the stream.
+     - 0 (disable), 1 (enable)
+     - Before streaming
+
+   * - ``V4L2_CID_MTK_CAM_PDE_INFO``
+     - Integer (struct mtk_cam_pde_info)
+     - Provides or sets phase detection (PDE) information for PDAF/AF features.
+     - See struct definition
+     - Before streaming or per-frame
+
+   * - ``V4L2_CID_MTK_CAM_MSTREAM_EXPOSURE``
+     - Integer/Integer64
+     - Controls multi-stream exposure settings for advanced HDR or multi-exposure modes.
+     - See driver header
+     - Before streaming or per-frame
+
+   * - ``V4L2_CID_MTK_CAM_RAW_RESOURCE_CALC``
+     - Compound (struct mtk_cam_resource)
+     - Triggers resource calculation for the current format and settings.
+     - See struct definition
+     - During format negotiation
+
+   * - ``V4L2_CID_MTK_CAM_TG_FLASH_CFG``
+     - Integer/struct
+     - Configures timing generator (TG) and flash synchronization.
+     - See driver header
+     - Before streaming or per-frame
+
+   * - ``V4L2_CID_MTK_CAM_RAW_RESOURCE_UPDATE``
+     - Integer
+     - Notifies the driver of a sensor mode update (e.g., seamless switch).
+     - 0 ~ 0xF (default: 0)
+     - When sensor mode changes
+
+   * - ``V4L2_CID_MTK_CAM_CAMSYS_HW_MODE``
+     - Integer64
+     - Selects the hardware mode for the CAMSYS pipeline (e.g., normal, secure, etc.).
+     - 0 ~ 0x7FFFFFFF
+     - Before streaming
+
+Control Usage Patterns
+---------------------
+
+- Controls with ``_TRY`` suffix are used to query the result of a "try" format negotiation (``VIDIOC_TRY_FMT``), without committing changes.
+- Controls without ``_TRY`` are used to set or get the actual configuration (``VIDIOC_S_FMT``, ``VIDIOC_G_CTRL``).
+- Use ``V4L2_CID_MTK_CAM_RAW_RESOURCE_CALC`` to check if the requested format and settings are feasible, and to get recommended values.
+- Use ``V4L2_CID_MTK_CAM_RAW_RESOURCE_UPDATE`` to notify the driver of a sensor mode change (e.g., seamless switch).
+- Use ``V4L2_CID_MTK_CAM_SYNC_ID`` to synchronize frames across multiple pipelines.
+- Use ``V4L2_CID_MTK_CAM_FEATURE`` to enable/disable advanced features (bitmask).
+- Use ``V4L2_CID_MTK_CAM_PDE_INFO`` to set/get phase detection information for PDAF/AF.
+- Use ``V4L2_CID_MTK_CAM_PIXEL_RATE`` to inform the driver of the sensor's pixel rate for bandwidth/resource calculation.
+
+Example: Setting a Control
+--------------------------
+
+.. code-block:: c
+
+   int fd = open("/dev/video0", O_RDWR);
+   struct v4l2_control ctrl = {
+       .id = V4L2_CID_MTK_CAM_BIN_LIMIT,
+       .value = 2,
+   };
+   if (ioctl(fd, VIDIOC_S_CTRL, &ctrl) < 0) {
+       perror("Failed to set BIN_LIMIT");
+   }
+
+Notes
+-----
+
+- All controls should be set before starting the video stream unless otherwise specified.
+- Refer to the driver header file for detailed struct definitions and bitmask values.
+- The driver will reject invalid values or unsupported configurations with -EINVAL.
+
+References
+----------
+
+- V4L2 documentation: https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v4l2.html
\ No newline at end of file
-- 
2.18.0

