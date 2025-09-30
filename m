Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A170BAB78F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6569D10E4CB;
	Tue, 30 Sep 2025 05:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="QRU19ADn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03FA10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:12 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035522epoutp03dd0439ef57220e02f62766eb2de35e3c~p8zE1QP2k3111931119epoutp03K
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:55:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035522epoutp03dd0439ef57220e02f62766eb2de35e3c~p8zE1QP2k3111931119epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204522;
 bh=QECUfZbqQMlZRsjBXhrpes/0FC7+ibWW3C5tH5S5p7k=;
 h=From:To:Cc:Subject:Date:References:From;
 b=QRU19ADng5zDrnPr23QwppGPQIPJ291f0mjzTdEtf1O/qAYHGEtK+FhyqdULiiz+i
 G5PHtCADV5bCMlnxgZHFLg5t1YCNki0PDV0Tfye7ROcX9bJCtzZfJci+i6OhmbXWLQ
 yu6FmZ6TpJ33uz35AFo8ZgdPMnUiOQnYf+ZuX118=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250930035520epcas5p4841bbe85fa7f5a7749405a45691a12b6~p8zDunfnh2319723197epcas5p4f;
 Tue, 30 Sep 2025 03:55:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPN748LQz2SSKZ; Tue, 30 Sep
 2025 03:55:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250930035518epcas5p2395afdb6f22d2a6b42f9daaec6bc3c1f~p8zBiHt5M2195921959epcas5p24;
 Tue, 30 Sep 2025 03:55:18 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035516epsmtip16ed3b2e0736c21a6e0b7cb21079089aa~p8y-KY6bu2882428824epsmtip1J;
 Tue, 30 Sep 2025 03:55:15 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 00/29] media: codec: add new Samsung Exynos-MFC driver
Date: Tue, 30 Sep 2025 09:33:19 +0530
Message-Id: <20250930040348.3702923-1-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035518epcas5p2395afdb6f22d2a6b42f9daaec6bc3c1f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035518epcas5p2395afdb6f22d2a6b42f9daaec6bc3c1f
References: <CGME20250930035518epcas5p2395afdb6f22d2a6b42f9daaec6bc3c1f@epcas5p2.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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

Exynos MFC new driver upstream proposal
+++++++++++++++++++++++++++++++++++++++

The s5p-mfc driver in the kernel is quite outdated and has not kept up with the hardware advances of the MFC IP. 
Going forward, we want to provide support for all the later versions of MFC in open source (both mobile and
ExynosAuto would be supported by Samsung)

We (Samsung) would like to propose a new driver for the latest generation of Samsung MFC (Multi-Format Codec) hardware. 
Although the kernel already contains a Samsung MFC driver (drivers/media/platform/s5p-mfc/), the newer hardware 
diverges significantly from the previous generations, in features supported, register interface and in system integration. 
This has necessitated a new driver, rather than updating the existing one. 


Current driver vs targetted driver comparison
+++++++++++++++++++++++++++++++++++++++++++++

Target Feature 
Current mainline : Simple V4L2/ VB2 interface based encoder/ decoder
New proposed driver: Dual core support, NAL-q support, LLC, Coredump, performance
measurement, plugin driver architecture, hardware manager(meerkat), DRM/OTF,
Resource manager, bandwidth compression, New Pixel formats (NV12N,  YV12, P010,
SBWC,  RGB family), 10 bit support, HDR support, Prio and RR Process Scheduler support, 

Register map	
Current mainline : Fixed register layout, compatible across s5p variants
New proposed driver: Completely redesigned register set, incompatible with old layout

Command model
Current mainline : Mailbox-style command queue
New proposed driver: Ring-buffer command queue with different signaling

Memory management
Current mainline : CMA-backed contiguous buffers, ION legacy
New proposed driver: dma-heap / scatter-gather buffers with strict alignment rules

Firmware
Current mainline : Supports up to Firmware v12, Legacy binary format, loaded via shared mechanism	
New proposed driver: New firmware format, different protocol for control messages. Support Firmware v13 onwards

DT bindings	
Current mainline : Single clock + reset, simple PM	
New proposed driver: Multiple clocks, reset domains, runtime PM dependencies

Error handling	
Current mainline : Simple IRQ error flags
New proposed driver: Detailed error codes, recovery sequences required

Code impact
Current mainline :~8k LOC, minimal conditionals
New proposed driver: ~65KLOC with full features


Plan for supporting latest MFC (Best balance between code clarity and long-term kernel health, while still respecting ABI and legacy users.)
1	We propose a new driver (exynos-mfc) for the latest generation of Samsung MFC (Multi-Format Codec) hardware. 
2	MFC FW V6 to V12 will be supported by existing mainline (s5p-mfc) and later versions by Exynos-mfc driver
3	The existing MFC driver will remain available for older SoC’s and will not be broken. The new driver will only bind
	to new compatible strings in DT, avoiding regressions for legacy hardware. Samsung will take responsibility for 
	maintaining both drivers until the old one can be formally marked as “legacy.”
4	Keep it buildable for old SoCs but clearly say new SoCs should use the new driver.
5	VIDEO_SAMSUNG_S5P_MFC and VIDEO_EXYNOS_MFC will both be supported for an agreed time
6	Long term Support for new driver  - commitment from Samsung
7	The hardware has diverged to the point where conditionally supporting both in one codebase is worse for long-term kernel health
8	Splitting keeps the code clean, testable, and reviewable, while ensuring legacy users aren’t broken due to user space ABI  guarantees.
	This seems more clean and easier approach Both can coexist without code spaghetti.

Features and description supported
++++++++++++++++++++++++++++++++++

1	MFC driver registration	Probe functionality and video nodes registration
2	MFC driver open & close support	MFC firmware loading,  "ls" & "cat" on the video nodes  and udev rules on the video nodes
3	H264 decoding	H264 decoding support - HW supported profiles & levels (YUV420 Semi-Planar, 8-bit, min/max resolution)
4	HEVC decoding	HEVC decoding support - HW supported profiles & levels (YUV420 Semi-Planar, 8-bit, min/max resolution)
5	VP8 decoding	VP8 decoding support - HW supported profiles & levels (YUV420 Semi-Planar, 8-bit, min/max resolution)
6	VP9 decoding	VP9 decoding support - HW supported profiles & levels (YUV420 Semi-Planar, 8-bit, min/max resolution)
7	AV1 decoding	AV1 decoding support - HW supported profiles & levels (YUV420 Semi-Planar, 8-bit, min/max resolution)
8	H264 encoding	H264 encoding support - Basic encoding (YUV420 Semi-Planar, 8-bit, min/max resolution)
9	HEVC encoding	HEVC encoding support - Basic encoding (YUV420 Semi-Planar, 8-bit, min/max resolution)
10	VP8 encoding	VP8 encoding support - Basic encoding (YUV420 Semi-Planar, 8-bit, min/max resolution)
11	VP9 encoding	VP9 encoding support - Basic encoding (YUV420 Semi-Planar, 8-bit, min/max resolution)
12	Debug fs support		Debug fs to control the MFC functionalities
13	Debug log support		Debug logs to get on the dmesg prompt for debug purpose
14	Debug SFR dump support		MFC SFR dumps during failures
15	NAL Queue mode control		NAL Queue mode support
16	Batch mode control		Batch mode support
17	HW supported YUV formats	YUV 420, 422, 444 (planar, semi-planar) formats support as per MFC HW specification
18	HW supported RGB formats	RGB format support as per MFC HW specification
19	Multi instance decoding/encoding	Multi instance decoding/encoding
20	Suspend and resume		Suspend and resume support
21	Runtime suspend and resume	Runtime suspend and resume support
22	Priority decoding (decoders)	Priority decoding support
23	Frame delay configuration (decoders)	Frame delay configuration support
24	Error handling and conceal control (decoders)	HW/Platform limitations should be gracefully exited and,
							bit stream errors should be reported or concealed with warning indication
25	Reference frame control (encoders)	Reference frame control support
26	SPS/PPS control (encoders)	SPS/PPS control support
27	Loop filter control (encoders)	Loop filter control support
28	B frame support (encoders)	B frame support
29	GOP control (encoders)		GOP control support
30	Frame rate control (encoders)	Frame rate control support

Features to be  supported in 2026
+++++++++++++++++++++++++++++++++

31	Bit rate control (encoders)		Bit rate control support
32	QP control (encoders)			QP control support
33	I/IDR control (encoders)		I/IDR control support
34	Scalable control (encoders)		Scalable control support
35	ROI control (encoders)			ROI control support
36	Multi slice control (encoders)		Multi slice control support
37	Profile/Level control (encoders)	Profile/Level control support
38	Padding control (encoders)		Padding control support
39	Aspect ratio control (encoders)		Aspect ratio control support
40	Buffer full handling (encoders)		Buffer full handling support
41	SBWC					SBWC bandwidth compression support
42	10-bit support				10-bit support as per MFC HW specification
43	Secure signed FW support		Security signed FW support
44	Secure playback				DRM content playback for decoders
45	HDR Support (decoders)			HDR metadata support
46	Dynamic resolution change		Dynamic resolution change support

Nagaraju Siddineni (29):
  dt-bindings: media: mfc: Add Exynos MFC devicetree binding
  arm64: dts: mfc: Add MFC device tree for Auto V920 SoC
  media: mfc: Add MFC driver data structures and debugging macros
  media: mfc: Add full register map and bit definitions for MFC hardware
  media: mfc: Add MFC driver header files and core utilities
  media: mfc: Add MFC core hardware register and debugfs APIs
  media: mfc: Add MFC core command, hwlock, ISR and run functionalities
  media: mfc: Add Exynos‑MFC driver probe support
  media: mfc: Add bus‑devfreq, QoS, multi‑view and control
    infrastructure
  media: mfc: Add buffer‑queue and IOVMM support
  media: mfc: Add rate‑calculation framework and memory utilities
  media: mfc: Introduce QoS support and instance context handling
  media: mfc: Add decoder core sync functions
  media: mfc: Add buffer‑control framework
  media: mfc: Add decoder resource‑management (RM) support and
    load‑balancing
  media: mfc: Enhance HW‑lock handling, scheduling and error recovery
  media: mfc: Add VB2 decoder support
  media: mfc: Add V4L2 decoder driver
  media: mfc: Add QoS, Butler workqueue, and priority‑based scheduling
  media: mfc: Add H264 decoder support
  media: mfc: Add multi‑codec support & QoS improvements
  media: mfc: Add H.264 encoder support with buffer and QoS improvements
  media: mfc: Add encoder parameters, ROI & QoS support
  media: mfc: Add encoder VB2 support to driver
  media: mfc: Add encoder v4l2 driver interface
  media: mfc: Add full encoder support
  media: mfc: Add H.264 encoder support
  media: mfc: Add AVC, VP8, VP9, and HEVC encoding support
  media: mfc: Hardware‑accelerated encoding support

 .../bindings/media/samsung,exynos-mfc.yaml    |   77 +
 MAINTAINERS                                   |   10 +
 .../dts/exynos/exynosautov920-evt2-mfc.dtsi   |  630 +++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |    1 +
 drivers/media/platform/samsung/Kconfig        |    7 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../media/platform/samsung/exynos-mfc/Kconfig |   34 +
 .../platform/samsung/exynos-mfc/Makefile      |   26 +
 .../samsung/exynos-mfc/base/mfc_buf.c         |  765 +++
 .../samsung/exynos-mfc/base/mfc_buf.h         |   43 +
 .../samsung/exynos-mfc/base/mfc_common.h      |  444 ++
 .../samsung/exynos-mfc/base/mfc_data_struct.h | 2014 +++++++
 .../samsung/exynos-mfc/base/mfc_debug.h       |  247 +
 .../samsung/exynos-mfc/base/mfc_format.h      |  316 ++
 .../samsung/exynos-mfc/base/mfc_macros.h      |   95 +
 .../samsung/exynos-mfc/base/mfc_media.h       |  554 ++
 .../samsung/exynos-mfc/base/mfc_mem.c         |  995 ++++
 .../samsung/exynos-mfc/base/mfc_mem.h         |  155 +
 .../samsung/exynos-mfc/base/mfc_qos.c         | 1070 ++++
 .../samsung/exynos-mfc/base/mfc_qos.h         |   99 +
 .../samsung/exynos-mfc/base/mfc_queue.c       |  966 ++++
 .../samsung/exynos-mfc/base/mfc_queue.h       |  158 +
 .../exynos-mfc/base/mfc_rate_calculate.c      |  640 +++
 .../exynos-mfc/base/mfc_rate_calculate.h      |  106 +
 .../samsung/exynos-mfc/base/mfc_regs.h        |   58 +
 .../samsung/exynos-mfc/base/mfc_regs_mfc.h    | 1002 ++++
 .../samsung/exynos-mfc/base/mfc_sched.h       |   30 +
 .../samsung/exynos-mfc/base/mfc_utils.c       |  401 ++
 .../samsung/exynos-mfc/base/mfc_utils.h       |  481 ++
 .../media/platform/samsung/exynos-mfc/mfc.c   | 1366 +++++
 .../platform/samsung/exynos-mfc/mfc_core.c    |  703 +++
 .../samsung/exynos-mfc/mfc_core_buf_ctrl.c    |  543 ++
 .../samsung/exynos-mfc/mfc_core_cmd.c         |  576 ++
 .../samsung/exynos-mfc/mfc_core_cmd.h         |   41 +
 .../samsung/exynos-mfc/mfc_core_enc_param.c   | 1463 ++++++
 .../samsung/exynos-mfc/mfc_core_enc_param.h   |   23 +
 .../samsung/exynos-mfc/mfc_core_hw_reg_api.c  |  122 +
 .../samsung/exynos-mfc/mfc_core_hw_reg_api.h  |  144 +
 .../samsung/exynos-mfc/mfc_core_hwlock.c      |  761 +++
 .../samsung/exynos-mfc/mfc_core_hwlock.h      |   80 +
 .../samsung/exynos-mfc/mfc_core_intlock.c     |   98 +
 .../samsung/exynos-mfc/mfc_core_intlock.h     |   20 +
 .../samsung/exynos-mfc/mfc_core_isr.c         | 2104 ++++++++
 .../samsung/exynos-mfc/mfc_core_isr.h         |   25 +
 .../samsung/exynos-mfc/mfc_core_ops.c         |  813 +++
 .../samsung/exynos-mfc/mfc_core_ops.h         |   16 +
 .../platform/samsung/exynos-mfc/mfc_core_pm.c |  209 +
 .../platform/samsung/exynos-mfc/mfc_core_pm.h |   33 +
 .../samsung/exynos-mfc/mfc_core_reg_api.c     |  597 +++
 .../samsung/exynos-mfc/mfc_core_reg_api.h     |  380 ++
 .../samsung/exynos-mfc/mfc_core_run.c         |  541 ++
 .../samsung/exynos-mfc/mfc_core_run.h         |   35 +
 .../samsung/exynos-mfc/mfc_core_sched_prio.c  |  431 ++
 .../samsung/exynos-mfc/mfc_core_sync.c        |  423 ++
 .../samsung/exynos-mfc/mfc_core_sync.h        |   34 +
 .../samsung/exynos-mfc/mfc_ctx_ctrl.c         | 1469 ++++++
 .../platform/samsung/exynos-mfc/mfc_debugfs.c |  248 +
 .../platform/samsung/exynos-mfc/mfc_debugfs.h |   20 +
 .../samsung/exynos-mfc/mfc_dec_v4l2.c         | 1739 +++++++
 .../samsung/exynos-mfc/mfc_dec_v4l2.h         |   20 +
 .../platform/samsung/exynos-mfc/mfc_dec_vb2.c |  394 ++
 .../platform/samsung/exynos-mfc/mfc_dec_vb2.h |   19 +
 .../samsung/exynos-mfc/mfc_enc_v4l2.c         | 4614 +++++++++++++++++
 .../samsung/exynos-mfc/mfc_enc_v4l2.h         |   20 +
 .../platform/samsung/exynos-mfc/mfc_enc_vb2.c |  443 ++
 .../platform/samsung/exynos-mfc/mfc_enc_vb2.h |   19 +
 .../platform/samsung/exynos-mfc/mfc_rm.c      | 2652 ++++++++++
 .../platform/samsung/exynos-mfc/mfc_rm.h      |  110 +
 68 files changed, 34773 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-evt2-mfc.dtsi
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/Kconfig
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/Makefile
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_buf.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_common.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_data_struct.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_debug.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_format.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_macros.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_media.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_qos.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_queue.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_regs.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_regs_mfc.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_sched.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_buf_ctrl.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_cmd.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_enc_param.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hw_reg_api.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_hwlock.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_intlock.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_isr.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_ops.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_pm.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_reg_api.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_run.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_run.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_sched_prio.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_core_sync.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_ctx_ctrl.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_debugfs.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_v4l2.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_dec_vb2.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_v4l2.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_enc_vb2.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_rm.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_rm.h

-- 
2.34.1

