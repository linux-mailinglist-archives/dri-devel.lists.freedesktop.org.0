Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIpNKzkjd2mZcgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:18:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9968561E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1049810E08B;
	Mon, 26 Jan 2026 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4196C10E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:17:56 +0000 (UTC)
X-UUID: 807a68f2fa8f11f0b0f03b4cfa9209d1-20260126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:8a3c612f-7ffb-4c5a-951e-85a6fec6eb78, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:183c2674dc5f80bf5febbde31a2928b0,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
 3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
 V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 807a68f2fa8f11f0b0f03b4cfa9209d1-20260126
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 603079910; Mon, 26 Jan 2026 16:17:49 +0800
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
Subject: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
Date: Mon, 26 Jan 2026 16:17:40 +0800
Message-Id: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
	NEURAL_HAM(-0.00)[-0.649];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0B9968561E
X-Rspamd-Action: no action

This patch series adds Rust bindings and safe abstractions for the Linux
framebuffer subsystem, enabling framebuffer drivers to be implemented in Rust.

The series consists of 4 patches:

1. rust: io: mem: add ioremap_wc support
   Adds write-combining memory mapping support to the Rust iomem abstraction,
   which is essential for framebuffer memory regions that benefit from
   write-combining semantics.

2. rust: device: add platdata accessors
   Implements generic accessors for platform data, enabling drivers to access
   platform-provided configuration. This is needed for framebuffer drivers
   that use platform data for configuration.

3. rust: fb: add framebuffer driver support
   Adds the core framebuffer framework abstraction, including:
   - Device abstraction (`fb::Device`) with reference counting via `AlwaysRefCounted`
   - Driver and Operations traits (`fb::Driver`, `fb::Operations`)
   - Screen information wrappers (`fb::FixScreenInfo`, `fb::VarScreenInfo`)
   - I/O operation helpers (`fb_io_read`, `fb_io_write`, `fb_io_mmap`)
   - Blit operation helpers (`cfb_fillrect`, `cfb_copyarea`, `cfb_imageblit`)

4. rust: fb: add simplefb test driver
   Adds a test driver that validates the framebuffer framework by porting
   the C simplefb driver to Rust. This driver serves as both a validation
   tool and a reference implementation for future Rust framebuffer drivers.

The implementation follows the same patterns established in the DRM subsystem
and maintains full compatibility with the existing C framebuffer subsystem.
All C callbacks are properly bridged to Rust trait methods via the `Operations`
trait, memory safety is ensured through proper use of `Opaque<fb_info>`, `ARef`,
and `AlwaysRefCounted` for reference counting, type invariants are documented
and enforced through the type system, and resource cleanup is handled via RAII
with proper cleanup order.

Testing:
--------
This series has been tested on:
- ARM64 platforms with various display configurations
- AMD RX550 graphics card
- Moore Threads S30 graphics card
- Multiple other graphics cards

All tested configurations show normal display functionality with proper
framebuffer initialization, rendering operations (including I/O, color register
management, and blitting), memory mapping, and resource cleanup. The simplefb
test driver successfully demonstrates the usage of all framebuffer framework
APIs and validates the abstraction's correctness.

The simplefb test driver serves as both a validation tool and a reference
implementation for future Rust framebuffer drivers.


pengfuyuan (4):
  rust: io: mem: add ioremap_wc support
  rust: device: add platdata accessors
  rust: fb: add framebuffer driver support
  rust: fb: add simplefb test driver

 drivers/video/fbdev/Kconfig          |  21 +
 drivers/video/fbdev/Makefile         |   1 +
 drivers/video/fbdev/simplefb_rust.rs | 653 +++++++++++++++++++++++++++
 rust/bindings/bindings_helper.h      |   2 +
 rust/helpers/device.c                |   5 +
 rust/helpers/io.c                    |   5 +
 rust/kernel/device.rs                |  31 ++
 rust/kernel/fb/blit.rs               | 106 +++++
 rust/kernel/fb/device.rs             | 463 +++++++++++++++++++
 rust/kernel/fb/driver.rs             | 169 +++++++
 rust/kernel/fb/io.rs                 |  76 ++++
 rust/kernel/fb/mod.rs                |  23 +
 rust/kernel/fb/screeninfo.rs         | 318 +++++++++++++
 rust/kernel/io/mem.rs                |  71 +++
 rust/kernel/lib.rs                   |   2 +
 15 files changed, 1946 insertions(+)
 create mode 100644 drivers/video/fbdev/simplefb_rust.rs
 create mode 100644 rust/kernel/fb/blit.rs
 create mode 100644 rust/kernel/fb/device.rs
 create mode 100644 rust/kernel/fb/driver.rs
 create mode 100644 rust/kernel/fb/io.rs
 create mode 100644 rust/kernel/fb/mod.rs
 create mode 100644 rust/kernel/fb/screeninfo.rs

-- 
2.25.1

