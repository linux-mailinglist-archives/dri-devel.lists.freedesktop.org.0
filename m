Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHUeBEMjd2mZcgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:18:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719CB8563A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC51110E0EE;
	Mon, 26 Jan 2026 08:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117C310E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:17:59 +0000 (UTC)
X-UUID: 82a4e0a8fa8f11f0b0f03b4cfa9209d1-20260126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:0fc6e020-5c27-4c21-9c7e-d2adb7a656ec, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:54299885b1c0cba1e5f1244a431e6257,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
 ,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
 SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 82a4e0a8fa8f11f0b0f03b4cfa9209d1-20260126
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 199018728; Mon, 26 Jan 2026 16:17:52 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 pengfuyuan <pengfuyuan@kylinos.cn>
Subject: [PATCH v1 v1 4/4] rust: fb: add simplefb test driver
Date: Mon, 26 Jan 2026 16:17:44 +0800
Message-Id: <20260126081744.781392-5-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DMARC_NA(0.00)[kylinos.cn];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:tzimmermann@suse.de,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:pengfuyuan@kylinos.cn,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pengfuyuan@kylinos.cn,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,suse.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org,kylinos.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengfuyuan@kylinos.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.759];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,self.green:url,self.red:url]
X-Rspamd-Queue-Id: 719CB8563A
X-Rspamd-Action: no action

Add a test driver for the Rust framebuffer framework abstraction. This
driver is a Rust port of the C simplefb driver (`drivers/video/fbdev/simplefb.c`)
and serves as a validation and testing tool for the Rust framebuffer API
implementation.

The driver implements a minimal framebuffer driver that assumes the display
hardware has been initialized before the kernel boots, and the kernel simply
renders to the pre-allocated framebuffer surface. Configuration regarding
surface address, size, and format must be provided through device tree or
platform data.

Key features:
- Supports 11 pixel formats (RGB565, RGBA5551, XRGB1555, ARGB1555, RGB888,
  XRGB8888, ARGB8888, XBGR8888, ABGR8888, XRGB2101010, ARGB2101010)
- Implements all required framebuffer operations via the `fb::Operations` trait:
  - I/O operations (`read`, `write`) using generic helpers
  - Color register management (`setcolreg`) with pseudo-palette support
  - Blitting operations (`fillrect`, `copyarea`, `imageblit`) using software
    implementations
  - Memory mapping (`mmap`) using generic helpers
- Supports both device tree and platform data configuration
- Uses RAII for resource management (memory regions, I/O mappings)
- Integrates with devres for automatic resource cleanup

**WARNING**: This driver is for testing purposes only and should not be used
in production systems. It has incomplete functionality compared to the C
simplefb driver (no clock management, power management, regulator management,
kernel parameter parsing, or aperture acquisition support). For production
use, please use FB_SIMPLE instead.

The driver demonstrates the usage of the Rust framebuffer framework:
- `fb::Device` for framebuffer device lifecycle management
- `fb::Driver` and `fb::Operations` traits for driver implementation
- `fb::Registration` for device registration with devres integration
- `fb::FixScreenInfo` and `fb::VarScreenInfo` for screen configuration
- `fb::Bitfield` for color component bitfield manipulation
- Generic I/O helpers (`fb_io_read`, `fb_io_write`, `fb_io_mmap`)
- Software blitting functions (`cfb_fillrect`, `cfb_copyarea`, `cfb_imageblit`)

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/video/fbdev/Kconfig          |  21 +
 drivers/video/fbdev/Makefile         |   1 +
 drivers/video/fbdev/simplefb_rust.rs | 653 +++++++++++++++++++++++++++
 rust/bindings/bindings_helper.h      |   1 +
 4 files changed, 676 insertions(+)
 create mode 100644 drivers/video/fbdev/simplefb_rust.rs

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index a733f90eca55..0b615c85ef6c 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1797,6 +1797,27 @@ config FB_SIMPLE
 	  Configuration re: surface address, size, and format must be provided
 	  through device tree, or plain old platform data.
 
+config FB_SIMPLE_RUST
+	tristate "Simple framebuffer support (Rust) [TEST ONLY]"
+	depends on FB && RUST
+	depends on !DRM_SIMPLEDRM
+	depends on !FB_SIMPLE
+	select APERTURE_HELPERS
+	select FB_IOMEM_HELPERS
+	help
+	  WARNING: This driver is for testing purposes only and should not be
+	  used in production systems.
+
+	  This is a test driver for the Rust framebuffer framework abstraction.
+	  It is used to validate and test the Rust framebuffer API implementation.
+	  The driver has incomplete functionality and is not suitable for real-world
+	  use. For production use, please use FB_SIMPLE instead.
+
+	  This driver assumes that the display hardware has been initialized before
+	  the kernel boots, and the kernel will simply render to the pre-allocated
+	  frame buffer surface. Configuration re: surface address, size, and format
+	  must be provided through device tree, or plain old platform data.
+
 config FB_SSD1307
 	tristate "Solomon SSD1307 framebuffer support"
 	depends on FB && I2C
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index b3d12f977c06..58dff87966ed 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -123,6 +123,7 @@ obj-$(CONFIG_FB_VGA16)            += vga16fb.o
 obj-$(CONFIG_FB_OF)               += offb.o
 obj-$(CONFIG_FB_SSD1307)	  += ssd1307fb.o
 obj-$(CONFIG_FB_SIMPLE)           += simplefb.o
+obj-$(CONFIG_FB_SIMPLE_RUST)      += simplefb_rust.o
 
 # the test framebuffer is last
 obj-$(CONFIG_FB_VIRTUAL)          += vfb.o
diff --git a/drivers/video/fbdev/simplefb_rust.rs b/drivers/video/fbdev/simplefb_rust.rs
new file mode 100644
index 000000000000..9806cc2daa3e
--- /dev/null
+++ b/drivers/video/fbdev/simplefb_rust.rs
@@ -0,0 +1,653 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Simple framebuffer driver in Rust (TEST ONLY)
+//!
+//! **WARNING**: This driver is for testing purposes only and should not be used in production systems.
+//!
+//! This is a test driver for the Rust framebuffer framework abstraction. It is used to validate
+//! and test the Rust framebuffer API implementation. The driver has incomplete functionality and
+//! is not suitable for real-world use. For production use, please use FB_SIMPLE instead.
+//!
+//! **Limitations**:
+//! - No clock management support
+//! - No power management support
+//! - No regulator management support
+//! - No kernel parameter parsing support
+//! - No `devm_aperture_acquire_for_platform_device` support
+//!
+//! This driver assumes that the display hardware has been initialized before the kernel boots,
+//! and the kernel will simply render to the pre-allocated frame buffer surface. Configuration
+//! regarding surface address, size, and format must be provided through device tree or platform data.
+
+use kernel::{
+    bindings, c_str,
+    device::Core,
+    devres::Devres,
+    fb,
+    io::{
+        mem::IoMem,
+        resource::{Flags, Region, Resource},
+        PhysAddr, ResourceSize,
+    },
+    macros::vtable,
+    of, platform,
+    prelude::*,
+    str::CStr,
+    sync::aref::ARef,
+};
+
+/// Pseudo palette size for framebuffer
+const PSEUDO_PALETTE_SIZE: usize = 16;
+
+/// Number of supported framebuffer formats
+const SIMPLEFB_FORMAT_COUNT: usize = 11;
+
+/// Initialize fixed screen information template
+fn init_simplefb_fix() -> fb::FixScreenInfo {
+    let mut fix = fb::FixScreenInfo::new_zeroed();
+
+    // Set the initial values
+    fix.set_id(c_str!("simplefb-rust"));
+    fix.set_type(fb::types::FB_TYPE_PACKED_PIXELS);
+    fix.set_visual(fb::visual::FB_VISUAL_TRUECOLOR);
+    fix.set_accel(fb::accel::FB_ACCEL_NONE);
+
+    fix
+}
+
+/// Initialize variable screen information template
+fn init_simplefb_var() -> fb::VarScreenInfo {
+    let mut var = fb::VarScreenInfo::new_zeroed();
+
+    // Set the initial values
+    var.set_height(u32::MAX);
+    var.set_width(u32::MAX);
+    var.set_activate(fb::activate::FB_ACTIVATE_NOW);
+    var.set_vmode(fb::vmode::FB_VMODE_NONINTERLACED);
+
+    var
+}
+
+/// Framebuffer pixel format descriptor.
+struct SimplefbFormat {
+    name: &'static CStr,
+    bits_per_pixel: u32,
+    red: fb::Bitfield,
+    green: fb::Bitfield,
+    blue: fb::Bitfield,
+    transp: fb::Bitfield,
+    fourcc: u32,
+}
+
+impl SimplefbFormat {
+    const fn new(
+        name: &'static CStr,
+        bits_per_pixel: u32,
+        red: fb::Bitfield,
+        green: fb::Bitfield,
+        blue: fb::Bitfield,
+        transp: fb::Bitfield,
+        fourcc: u32,
+    ) -> Self {
+        Self {
+            name,
+            bits_per_pixel,
+            red,
+            green,
+            blue,
+            transp,
+            fourcc,
+        }
+    }
+
+    const fn name(&self) -> &'static CStr {
+        self.name
+    }
+
+    const fn bits_per_pixel(&self) -> u32 {
+        self.bits_per_pixel
+    }
+
+    const fn red(&self) -> fb::Bitfield {
+        self.red
+    }
+
+    const fn green(&self) -> fb::Bitfield {
+        self.green
+    }
+
+    const fn blue(&self) -> fb::Bitfield {
+        self.blue
+    }
+
+    const fn transp(&self) -> fb::Bitfield {
+        self.transp
+    }
+
+    #[allow(dead_code)]
+    const fn fourcc(&self) -> u32 {
+        self.fourcc
+    }
+}
+
+/// Supported framebuffer formats.
+///
+/// This matches the format array from `include/linux/platform_data/simplefb.h`.
+const SIMPLEFB_FORMATS: [SimplefbFormat; SIMPLEFB_FORMAT_COUNT] = [
+    SimplefbFormat::new(
+        c_str!("r5g6b5"),
+        16,
+        fb::Bitfield::new(11, 5, 0),
+        fb::Bitfield::new(5, 6, 0),
+        fb::Bitfield::new(0, 5, 0),
+        fb::Bitfield::new(0, 0, 0),
+        0x36314752, // DRM_FORMAT_RGB565 = fourcc_code('R', 'G', '1', '6')
+    ),
+    SimplefbFormat::new(
+        c_str!("r5g5b5a1"),
+        16,
+        fb::Bitfield::new(11, 5, 0),
+        fb::Bitfield::new(6, 5, 0),
+        fb::Bitfield::new(1, 5, 0),
+        fb::Bitfield::new(0, 1, 0),
+        0x31354152, // DRM_FORMAT_RGBA5551 = fourcc_code('R', 'A', '1', '5')
+    ),
+    SimplefbFormat::new(
+        c_str!("x1r5g5b5"),
+        16,
+        fb::Bitfield::new(10, 5, 0),
+        fb::Bitfield::new(5, 5, 0),
+        fb::Bitfield::new(0, 5, 0),
+        fb::Bitfield::new(0, 0, 0),
+        0x35315258, // DRM_FORMAT_XRGB1555 = fourcc_code('X', 'R', '1', '5')
+    ),
+    SimplefbFormat::new(
+        c_str!("a1r5g5b5"),
+        16,
+        fb::Bitfield::new(10, 5, 0),
+        fb::Bitfield::new(5, 5, 0),
+        fb::Bitfield::new(0, 5, 0),
+        fb::Bitfield::new(15, 1, 0),
+        0x35315241, // DRM_FORMAT_ARGB1555 = fourcc_code('A', 'R', '1', '5')
+    ),
+    SimplefbFormat::new(
+        c_str!("r8g8b8"),
+        24,
+        fb::Bitfield::new(16, 8, 0),
+        fb::Bitfield::new(8, 8, 0),
+        fb::Bitfield::new(0, 8, 0),
+        fb::Bitfield::new(0, 0, 0),
+        0x34324752, // DRM_FORMAT_RGB888 = fourcc_code('R', 'G', '2', '4')
+    ),
+    SimplefbFormat::new(
+        c_str!("x8r8g8b8"),
+        32,
+        fb::Bitfield::new(16, 8, 0),
+        fb::Bitfield::new(8, 8, 0),
+        fb::Bitfield::new(0, 8, 0),
+        fb::Bitfield::new(0, 0, 0),
+        0x34325258, // DRM_FORMAT_XRGB8888 = fourcc_code('X', 'R', '2', '4')
+    ),
+    SimplefbFormat::new(
+        c_str!("a8r8g8b8"),
+        32,
+        fb::Bitfield::new(16, 8, 0),
+        fb::Bitfield::new(8, 8, 0),
+        fb::Bitfield::new(0, 8, 0),
+        fb::Bitfield::new(24, 8, 0),
+        0x34325241, // DRM_FORMAT_ARGB8888 = fourcc_code('A', 'R', '2', '4')
+    ),
+    SimplefbFormat::new(
+        c_str!("x8b8g8r8"),
+        32,
+        fb::Bitfield::new(0, 8, 0),
+        fb::Bitfield::new(8, 8, 0),
+        fb::Bitfield::new(16, 8, 0),
+        fb::Bitfield::new(0, 0, 0),
+        0x34324258, // DRM_FORMAT_XBGR8888 = fourcc_code('X', 'B', '2', '4')
+    ),
+    SimplefbFormat::new(
+        c_str!("a8b8g8r8"),
+        32,
+        fb::Bitfield::new(0, 8, 0),
+        fb::Bitfield::new(8, 8, 0),
+        fb::Bitfield::new(16, 8, 0),
+        fb::Bitfield::new(24, 8, 0),
+        0x34324241, // DRM_FORMAT_ABGR8888 = fourcc_code('A', 'B', '2', '4')
+    ),
+    SimplefbFormat::new(
+        c_str!("x2r10g10b10"),
+        32,
+        fb::Bitfield::new(20, 10, 0),
+        fb::Bitfield::new(10, 10, 0),
+        fb::Bitfield::new(0, 10, 0),
+        fb::Bitfield::new(0, 0, 0),
+        0x30335258, // DRM_FORMAT_XRGB2101010 = fourcc_code('X', 'R', '3', '0')
+    ),
+    SimplefbFormat::new(
+        c_str!("a2r10g10b10"),
+        32,
+        fb::Bitfield::new(20, 10, 0),
+        fb::Bitfield::new(10, 10, 0),
+        fb::Bitfield::new(0, 10, 0),
+        fb::Bitfield::new(30, 2, 0),
+        0x30335241, // DRM_FORMAT_ARGB2101010 = fourcc_code('A', 'R', '3', '0')
+    ),
+];
+
+/// Find a format by name.
+fn find_format(name: &CStr) -> Option<&'static SimplefbFormat> {
+    SIMPLEFB_FORMATS
+        .iter()
+        .find(|format| format.name().to_bytes() == name.to_bytes())
+}
+
+/// Platform data for simple framebuffer devices.
+struct SimplefbPlatformData {
+    width: u32,
+    height: u32,
+    stride: u32,
+    format: &'static CStr,
+}
+
+impl SimplefbPlatformData {
+    /// Extract platform data from a device.
+    ///
+    /// # Safety
+    ///
+    /// * The platform data type must be `simplefb_platform_data`.
+    /// * The platform data structure must be properly initialized.
+    unsafe fn from_device(pdev: &platform::Device<Core>) -> Result<Self> {
+        let dev = pdev.as_ref();
+        // SAFETY: The caller guarantees the platform data type matches.
+        let pd_opaque = unsafe { dev.platdata::<bindings::simplefb_platform_data>()? };
+        // SAFETY: The caller guarantees the platform data structure is properly initialized.
+        let pd_raw = unsafe { &*pd_opaque.get() };
+
+        let format_cstr = if pd_raw.format.is_null() {
+            return Err(ENODEV);
+        } else {
+            // SAFETY: `format` is not null (checked above) and points to a valid C string.
+            unsafe { CStr::from_char_ptr(pd_raw.format) }
+        };
+
+        Ok(Self {
+            width: pd_raw.width,
+            height: pd_raw.height,
+            stride: pd_raw.stride,
+            format: format_cstr,
+        })
+    }
+
+    const fn width(&self) -> u32 {
+        self.width
+    }
+
+    const fn height(&self) -> u32 {
+        self.height
+    }
+
+    const fn stride(&self) -> u32 {
+        self.stride
+    }
+
+    const fn format(&self) -> &'static CStr {
+        self.format
+    }
+}
+
+/// Parsed framebuffer parameters.
+struct SimplefbParams {
+    width: u32,
+    height: u32,
+    stride: u32,
+    format: &'static SimplefbFormat,
+}
+
+/// Driver-specific data for the simple framebuffer.
+#[pin_data]
+struct SimplefbData {
+    palette: [u32; PSEUDO_PALETTE_SIZE],
+    #[allow(dead_code)] // Reserved for future devm_aperture_acquire_for_platform_device support
+    base: PhysAddr,
+    #[allow(dead_code)] // Reserved for future devm_aperture_acquire_for_platform_device support
+    size: ResourceSize,
+    #[allow(dead_code)] // Used via Drop trait for automatic resource cleanup
+    mem: Option<Region>,
+    #[pin]
+    #[allow(dead_code)]
+    // I/O memory mapping; ensures iounmap happens before release_mem_region via drop order
+    _iomem: Pin<KBox<Devres<IoMem<0>>>>,
+}
+
+/// Simple framebuffer operations implementation
+struct SimplefbOps;
+
+#[vtable]
+impl fb::Operations for SimplefbOps {
+    type Data = SimplefbData;
+
+    fn read(
+        device: &fb::Device<impl fb::Driver<Data = Self::Data>>,
+        buf: &mut [u8],
+        ppos: &mut kernel::fs::file::Offset,
+    ) -> Result<usize> {
+        fb::fb_io_read(device, buf, ppos)
+    }
+
+    fn write(
+        device: &fb::Device<impl fb::Driver<Data = Self::Data>>,
+        buf: &[u8],
+        ppos: &mut kernel::fs::file::Offset,
+    ) -> Result<usize> {
+        fb::fb_io_write(device, buf, ppos)
+    }
+
+    fn setcolreg(
+        device: &fb::Device<impl fb::Driver<Data = Self::Data>>,
+        regno: u32,
+        red: u32,
+        green: u32,
+        blue: u32,
+        _transp: u32,
+    ) -> Result {
+        if regno >= PSEUDO_PALETTE_SIZE as u32 {
+            return Err(EINVAL);
+        }
+
+        let var = device.var();
+        let red_len = var.red().length();
+        let green_len = var.green().length();
+        let blue_len = var.blue().length();
+        let red_offset = var.red().offset();
+        let green_offset = var.green().offset();
+        let blue_offset = var.blue().offset();
+
+        let cr = red >> (16 - red_len);
+        let cg = green >> (16 - green_len);
+        let cb = blue >> (16 - blue_len);
+
+        let mut value = (cr << red_offset) | (cg << green_offset) | (cb << blue_offset);
+
+        let transp_len = var.transp().length();
+        if transp_len > 0 {
+            let transp_offset = var.transp().offset();
+            let mask = ((1u32 << transp_len) - 1) << transp_offset;
+            value |= mask;
+        }
+
+        // Access the palette through the driver data
+        // SAFETY: device.pseudo_palette() returns a valid pointer to the palette array
+        unsafe {
+            let palette = device.pseudo_palette() as *mut u32;
+            *palette.add(regno as usize) = value;
+        }
+
+        Ok(())
+    }
+
+    fn fillrect(device: &fb::Device<impl fb::Driver<Data = Self::Data>>, rect: &fb::FillRect) {
+        fb::cfb_fillrect(device, rect);
+    }
+
+    fn copyarea(device: &fb::Device<impl fb::Driver<Data = Self::Data>>, area: &fb::CopyArea) {
+        fb::cfb_copyarea(device, area);
+    }
+
+    fn imageblit(device: &fb::Device<impl fb::Driver<Data = Self::Data>>, image: &fb::Image) {
+        fb::cfb_imageblit(device, image);
+    }
+
+    fn mmap(
+        device: &fb::Device<impl fb::Driver<Data = Self::Data>>,
+        vma: &kernel::mm::virt::VmaNew,
+    ) -> Result {
+        fb::fb_io_mmap(device, vma)
+    }
+}
+
+/// Framebuffer driver type.
+struct SimplefbDriverImpl;
+
+#[vtable]
+impl fb::Driver for SimplefbDriverImpl {
+    type Data = SimplefbData;
+    type Ops = SimplefbOps;
+
+    const INFO: fb::DriverInfo = fb::DriverInfo {
+        name: c_str!("simplefb-rust"),
+        desc: c_str!("Simple framebuffer driver"),
+    };
+}
+
+/// Platform driver data.
+struct SimplefbDriver {
+    _pdev: ARef<platform::Device>,
+}
+
+impl SimplefbDriver {
+    /// Map framebuffer memory with write-combining cache policy.
+    ///
+    /// Returns a tuple of the IoMem handle and the virtual address (screen_base).
+    fn map_framebuffer_memory(
+        pdev: &platform::Device<Core>,
+    ) -> Result<(Pin<KBox<Devres<IoMem<0>>>>, *mut u8)> {
+        let dev = pdev.as_ref();
+
+        let io_request = pdev.io_request_by_index(0).ok_or_else(|| {
+            dev_err!(dev, "[rust] No memory resource for framebuffer\n");
+            ENODEV
+        })?;
+
+        // Map with write-combining. The Devres must remain at a fixed address for the devres
+        // callback to work correctly, so we keep it in KBox.
+        let iomem_init = io_request.iomap_wc();
+        let iomem_kbox = KBox::pin_init(iomem_init, GFP_KERNEL)?;
+
+        let screen_base = {
+            let io = iomem_kbox.access(dev)?;
+            io.addr() as *mut u8
+        };
+
+        Ok((iomem_kbox, screen_base))
+    }
+
+    /// Parse platform data.
+    fn parse_pd(pdev: &platform::Device<Core>) -> Result<SimplefbParams> {
+        let dev = pdev.as_ref();
+
+        // SAFETY: The platform data type matches simplefb_platform_data for this device.
+        let pd = unsafe { SimplefbPlatformData::from_device(pdev)? };
+
+        let width = pd.width();
+        let height = pd.height();
+        let stride = pd.stride();
+        let format_cstr = pd.format();
+
+        let format = find_format(format_cstr).ok_or_else(|| {
+            dev_err!(dev, "[rust] Invalid format value\n");
+            EINVAL
+        })?;
+
+        Ok(SimplefbParams {
+            width,
+            height,
+            stride,
+            format,
+        })
+    }
+
+    /// Parse device tree properties.
+    fn parse_dt(pdev: &platform::Device<Core>) -> Result<SimplefbParams> {
+        let dev = pdev.as_ref();
+        let fwnode = dev.fwnode().ok_or(ENODEV)?;
+
+        let width: u32 = fwnode.property_read(c_str!("width")).required_by(dev)?;
+        let height: u32 = fwnode.property_read(c_str!("height")).required_by(dev)?;
+        let stride: u32 = fwnode.property_read(c_str!("stride")).required_by(dev)?;
+
+        let format_name = fwnode
+            .property_read::<kernel::str::CString>(c_str!("format"))
+            .required_by(dev)?;
+
+        let format = find_format(&format_name).ok_or_else(|| {
+            dev_err!(dev, "[rust] Invalid format value\n");
+            EINVAL
+        })?;
+
+        Ok(SimplefbParams {
+            width,
+            height,
+            stride,
+            format,
+        })
+    }
+
+    /// Probe the framebuffer device.
+    fn probe_internal(pdev: &platform::Device<Core>) -> Result {
+        let dev = pdev.as_ref();
+
+        let params = Self::parse_pd(pdev).or_else(|_| {
+            if dev.fwnode().is_some() {
+                Self::parse_dt(pdev)
+            } else {
+                Err(ENODEV)
+            }
+        })?;
+
+        let resource = pdev.resource_by_index(0).ok_or_else(|| {
+            dev_err!(dev, "[rust] No memory resource\n");
+            EINVAL
+        })?;
+
+        let mem_region = resource.request_region(
+            resource.start(),
+            resource.size(),
+            c_str!("simplefb").to_cstring()?,
+            Flags::IORESOURCE_MEM,
+        );
+
+        let mem: &Resource = match &mem_region {
+            Some(region) => region as &Resource,
+            None => {
+                dev_warn!(
+                    dev,
+                    "[rust] simplefb: cannot reserve video memory at 0x{:x}-0x{:x}\n",
+                    resource.start(),
+                    resource.start() + resource.size() - 1
+                );
+                resource
+            }
+        };
+
+        let memory_start = mem.start();
+        let memory_size = mem.size();
+
+        let (iomem_kbox, screen_base) = Self::map_framebuffer_memory(pdev)?;
+
+        let fb_device = fb::Device::<SimplefbDriverImpl>::new(
+            dev,
+            try_pin_init!(SimplefbData {
+                palette: [0u32; PSEUDO_PALETTE_SIZE],
+                base: memory_start,
+                size: memory_size,
+                mem: mem_region,
+                _iomem: iomem_kbox,
+            }),
+        )?;
+
+        let mut fix_template = init_simplefb_fix();
+        let fmt = params.format;
+        let mut var_template = init_simplefb_var();
+
+        fix_template.set_smem_start(memory_start as usize);
+        fix_template.set_smem_len(memory_size as u32);
+        fix_template.set_line_length(params.stride);
+
+        var_template.set_xres(params.width);
+        var_template.set_yres(params.height);
+        var_template.set_xres_virtual(params.width);
+        var_template.set_yres_virtual(params.height);
+        var_template.set_bits_per_pixel(fmt.bits_per_pixel());
+        var_template.set_red(fmt.red());
+        var_template.set_green(fmt.green());
+        var_template.set_blue(fmt.blue());
+        var_template.set_transp(fmt.transp());
+
+        // SAFETY: We have exclusive access to the fb_device during initialization,
+        // before it is registered with the framebuffer subsystem.
+        unsafe {
+            fb_device.configure_fix(|fix| {
+                *fix = fix_template.into_raw();
+            });
+
+            fb_device.configure_var(|var| {
+                *var = var_template.into_raw();
+            });
+
+            fb_device.set_screen_base(screen_base);
+            fb_device.set_pseudo_palette(fb_device.data().palette.as_ptr() as *mut _);
+        }
+
+        dev_info!(
+            dev,
+            "[rust] framebuffer at 0x{:x}, 0x{:x} bytes\n",
+            fb_device.fix().smem_start(),
+            fb_device.fix().smem_len()
+        );
+
+        dev_info!(
+            dev,
+            "[rust] format={}, mode={}x{}x{}, linelength={}\n",
+            params.format.name(),
+            fb_device.var().xres(),
+            fb_device.var().yres(),
+            fb_device.var().bits_per_pixel(),
+            fb_device.fix().line_length()
+        );
+
+        // TODO: Implement devm_aperture_acquire_for_platform_device to manage framebuffer
+        // memory ownership and prevent conflicts with dedicated drivers (e.g., DRM).
+
+        if let Err(err) = fb::Registration::new_foreign_owned(&fb_device, pdev.as_ref()) {
+            dev_err!(
+                dev,
+                "[rust] Unable to register simplefb: {}\n",
+                err.to_errno()
+            );
+            return Err(err);
+        }
+
+        dev_info!(dev, "[rust] fb{}: simplefb registered!\n", fb_device.node());
+
+        Ok(())
+    }
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SimplefbDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("simple-framebuffer")), ())]
+);
+
+impl platform::Driver for SimplefbDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        Self::probe_internal(pdev)?;
+        Ok(Self { _pdev: pdev.into() })
+    }
+}
+
+kernel::module_platform_driver! {
+    type: SimplefbDriver,
+    name: "simple-framebuffer",
+    authors: ["pengfuyuan <pengfuyuan@kylinos.cn>", "Rust port"],
+    description: "Simple framebuffer driver (Rust)",
+    license: "GPL v2",
+}
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index bc47806eb365..01eda020e7e6 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -70,6 +70,7 @@
 #include <linux/pci.h>
 #include <linux/phy.h>
 #include <linux/pid_namespace.h>
+#include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/poll.h>
-- 
2.25.1

