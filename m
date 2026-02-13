Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zRttL3qFjmlBCwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 02:59:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1950132562
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 02:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965E910E0ED;
	Fri, 13 Feb 2026 01:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="aBpLo5RY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8515C10E0ED;
 Fri, 13 Feb 2026 01:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770947951; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LDN+WNAUdz0SWY52JwzhhhDQRNguvsp/kUWE223sjb0r4BaXIrkMWeZ8SIsVqvgOOzfuCf6pH5npUkDBjZD6ZyaG01hHTRajKZI7Kl5LLyAfJYn15kA1IMCpbLwB+zO1Ds7yvJj9UwEhfpp7Ro3E26RkdO1AoC4qVpEz0G2TnQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770947951;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=C8g2vpgn9loO8Qzjl4rLA0gGBK3eJ5QEP0ztitLu7uc=; 
 b=OVtuGyrRC+YNC4o6x4DMekKoBbweRISRzTAUVR0LuF0p9BLVCJ18HuYB/Bgu+svpruAwe9XNswF30LfDFfCTid4ppHs3RC3dROWUz3gkCbjXP902VN5Mz4kqLe1dLp5aL0FnzNKXsRgCJjdLekEHbr4oyr6BdKzcVxBDXE4aEg8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770947951; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=C8g2vpgn9loO8Qzjl4rLA0gGBK3eJ5QEP0ztitLu7uc=;
 b=aBpLo5RYGAkKFZRMDKOHrGB+wC/x7OwFWnUd3JhZ1pAUH/Hv5LIxHkgxL6rS87HG
 WnhextBe14iyKxZbV901wKW6j4GUDgW11NaMHh2rLo6WjMmU47QTHaKvDou/LXRONKn
 P1pVT0ezVb90bKRi/vdhN2mD7iPYBTE+m3d+6qzU=
Received: by mx.zohomail.com with SMTPS id 1770947950819885.6940747393908;
 Thu, 12 Feb 2026 17:59:10 -0800 (PST)
Date: Thu, 12 Feb 2026 17:59:09 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v7 6/7] rust: Introduce iosys_map bindings
Message-ID: <aY6FbSjQpGFk8oWK@um790>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-7-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260206223431.693765-7-lyude@redhat.com>
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: D1950132562
X-Rspamd-Action: no action

Hi Lyude,

On Fri, Feb 06, 2026 at 05:34:30PM -0500, Lyude Paul wrote:
> This introduces a set of bindings for working with iosys_map in rust code
> using the new Io traits.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> V5:
> - Fix incorrect field size being passed to iosys_map_memcpy_to()
> - Add an additional unit test, basic_macro(), which can successfully catch
>   the above issue so it doesn't happen again in the future.
> V6:
> - Drop as_slice/as_mut_slice (Alice Rhyl)
> V7:
> - Start using Alexandre Courbot's wonderful Io, IoCapable and IoKnownSize
>   traits instead of trying to roll our own IO accessors. This also changes
>   the following:
>   - We don't have a custom AsBytes/FromBytes type that we carry around any
>     longer with maps
>   - We now have optional compile-time size checking
>   - We don't need our own unit tests anymore
>   - RawIoSysMap can be used for unsafe IO operations, because why not.
>   - IoSysMapRef::new() can fail now since it needs to ensure SIZE is valid.
>   - We don't implement Deref<RawIoSysMap> for IoSysMapRef any longer. The
>     main reason for this is that we want to avoid users having to manually
>     specify if they want the RawIoSysMap or IoSysMapRef variant functions
>     like io_read()/io_write().
>     This is fine IMHO, but to make sure things remain easy for APIs that
>     wrap around iosys map we make IoSysMapRef.raw_map pub(crate).
> 
>  rust/helpers/helpers.c   |   1 +
>  rust/helpers/iosys_map.c |  34 +++++++
>  rust/kernel/iosys_map.rs | 211 +++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs       |   1 +
>  4 files changed, 247 insertions(+)
>  create mode 100644 rust/helpers/iosys_map.c
>  create mode 100644 rust/kernel/iosys_map.rs
> 
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 1d3333cc0d2a8..bd8ad237aa02e 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -31,6 +31,7 @@
>  #include "irq.c"
>  #include "fs.c"
>  #include "io.c"
> +#include "iosys_map.c"
>  #include "jump_label.c"
>  #include "kunit.c"
>  #include "maple_tree.c"
> diff --git a/rust/helpers/iosys_map.c b/rust/helpers/iosys_map.c
> new file mode 100644
> index 0000000000000..6861d4ec48a4b
> --- /dev/null
> +++ b/rust/helpers/iosys_map.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/iosys-map.h>
> +#include <linux/types.h>
> +
> +#define rust_iosys_map_rd(type__)                                                       \
> +	__rust_helper type__                                                            \
> +	rust_helper_iosys_map_rd_ ## type__(const struct iosys_map *map, size_t offset) \
> +	{                                                                               \
> +		return iosys_map_rd(map, offset, type__);                               \
> +	}
> +#define rust_iosys_map_wr(type__)                                                       \
> +	__rust_helper void                                                              \
> +	rust_helper_iosys_map_wr_ ## type__(const struct iosys_map *map, size_t offset, \
> +					    type__ value)                               \
> +	{                                                                               \
> +		iosys_map_wr(map, offset, type__, value);                               \
> +	}
> +
> +rust_iosys_map_rd(u8);
> +rust_iosys_map_rd(u16);
> +rust_iosys_map_rd(u32);
> +
> +rust_iosys_map_wr(u8);
> +rust_iosys_map_wr(u16);
> +rust_iosys_map_wr(u32);
> +
> +#ifdef CONFIG_64BIT
> +rust_iosys_map_rd(u64);
> +rust_iosys_map_wr(u64);
> +#endif
> +
> +#undef rust_iosys_map_rd
> +#undef rust_iosys_map_wr
> diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
> new file mode 100644
> index 0000000000000..2070f0fb42cb8
> --- /dev/null
> +++ b/rust/kernel/iosys_map.rs
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! IO-agnostic memory mapping interfaces.
> +//!
> +//! This crate provides bindings for the `struct iosys_map` type, which provides a common interface
> +//! for memory mappings which can reside within coherent memory, or within IO memory.
> +//!
> +//! C header: [`include/linux/iosys-map.h`](srctree/include/linux/pci.h)
> +
> +use crate::{
> +    error::code::*,
> +    io::{
> +        Io,
> +        IoCapable,
> +        IoKnownSize, //
> +    },
> +    prelude::*, //
> +};
> +use bindings;
> +use core::marker::PhantomData;
> +
> +/// Raw unsized representation of a `struct iosys_map`.
> +///
> +/// This struct is a transparent wrapper around `struct iosys_map`. The C API does not provide the
> +/// size of the mapping by default, and thus this type also does not include the size of the
> +/// mapping. As such, it cannot be used for actually accessing the underlying data pointed to by the
> +/// mapping.
> +///
> +/// With the exception of kernel crates which may provide their own wrappers around `RawIoSysMap`,
> +/// users will typically not interact with this type directly.
> +#[repr(transparent)]
> +pub struct RawIoSysMap<const SIZE: usize = 0>(bindings::iosys_map);
> +
> +impl<const SIZE: usize> RawIoSysMap<SIZE> {
> +    /// Convert from a raw `bindings::iosys_map`.
> +    #[expect(unused)]
> +    #[inline]
> +    pub(crate) fn from_raw(val: bindings::iosys_map) -> Self {
> +        Self(val)
> +    }
> +
> +    /// Returns whether the mapping is within IO memory space or not.
> +    #[inline]
> +    pub fn is_iomem(&self) -> bool {
> +        self.0.is_iomem
> +    }
> +
> +    /// Convert from a `RawIoSysMap<SIZE>` to a raw `bindings::iosys_map` ref.
> +    #[expect(unused)]
> +    #[inline]
> +    pub(crate) fn as_raw(&self) -> &bindings::iosys_map {
> +        &self.0
> +    }
> +
> +    /// Convert from a `RawIoSysMap<SIZE>` to a raw mutable `bindings::iosys_map` ref.
> +    #[allow(unused)]
> +    #[inline]
> +    pub(crate) fn as_raw_mut(&mut self) -> &mut bindings::iosys_map {
> +        &mut self.0
> +    }
> +
> +    /// Returns the address pointed to by this iosys map.
> +    ///
> +    /// Note that this address is not guaranteed to be valid, and may or may not reside in I/O
> +    /// memory.
> +    #[inline]
> +    pub fn addr(&self) -> usize {
> +        (if self.is_iomem() {
> +            // SAFETY: We confirmed above that this iosys map is contained within iomem, so it's
> +            // safe to read vaddr_iomem
> +            unsafe { self.0.__bindgen_anon_1.vaddr_iomem }
> +        } else {
> +            // SAFETY: We confirmed above that this iosys map is not contaned within iomem, so it's
> +            // safe to read vaddr.
> +            unsafe { self.0.__bindgen_anon_1.vaddr }
> +        }) as usize
> +    }
> +}
> +
> +// SAFETY: As we make no guarantees about the validity of the mapping, there's no issue with sending
> +// this type between threads.
> +unsafe impl<const SIZE: usize> Send for RawIoSysMap<SIZE> {}
> +
> +impl<const SIZE: usize> Clone for RawIoSysMap<SIZE> {
> +    fn clone(&self) -> Self {
> +        Self(self.0)
> +    }
> +}
> +
> +macro_rules! impl_raw_iosys_map_io_capable {
> +    ($ty:ty, $read_fn:ident, $write_fn:ident) => {
> +        impl<const SIZE: usize> IoCapable<$ty> for RawIoSysMap<SIZE> {
> +            #[inline(always)]
> +            unsafe fn io_read(&self, address: usize) -> $ty {
> +                // SAFETY: By the trait invariant `address` is a valid address for iosys map
> +                // operations.
> +                unsafe { bindings::$read_fn(&self.0, address) }
> +            }
> +
> +            #[inline(always)]
> +            unsafe fn io_write(&self, value: $ty, address: usize) {
> +                // SAFETY: By the trait invariant `address` is a valid address for iosys map
> +                // operations.
> +                unsafe { bindings::$write_fn(&self.0, address, value) };
> +            }
> +        }
> +    };
> +}
> +

I think there might be a mismatch between the absolute address being
passed to these read and write functions and the bindings helpers
that expect an offset argument.

This crashed Tyr when I tried to write the firmware in u8 chunks at
incremental offsets. But if i just calculated the offset and passed that
instead of the absolute address, this worked fine:

  let offset = address - self.addr();
  unsafe { bindings::$write_fn(&self.0, offset, value) };

Here's some of the call trace:

[   31.553727] tyr fb000000.gpu: supply sram not found, using dummy regulator
[   31.555096] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor 0x0 status 0x5
[   31.555778] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[   31.556521] tyr fb000000.gpu: shader_present=0x0000000000050005 l2_present=0x0000000000000001 tiler_present=0x0000000000000001
[   31.557868] stackdepot: allocating hash table of 524288 entries via kvcalloc
[  OK  ] Started systemd-tmpfiles-clean.tim…y Cleanup of Temporary Directories.
[   31.562424] stackdepot: allocating space for 8192 stack pools via kvcalloc
[  OK  ] Reached target timers.target - Timer Units.
[   31.563676] tyr: Firmware protected mode entry not supported, ignoring
[   31.571391] Unable to handle kernel paging request at virtual address 0000000000800069
[   31.572762] Mem abort info:
[   31.573027]   ESR = 0x0000000096000021
[   31.573402]   EC = 0x25: DABT (current EL), IL = 32 bits
[   31.573878]   SET = 0, FnV = 0
[   31.574157]   EA = 0, S1PTW = 0
[   31.574442]   FSC = 0x21: alignment fault
[  OK  ] Listening on dbus.socket - D-Bus System Message Bus Socket.
[   31.593348] Data abort info:
[   31.593628]   ISV = 0, ISS = 0x00000021, ISS2 = 0x00000000
[   31.594117]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   31.594567]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   31.595042] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000105e50000
[   31.595613] [0000000000800069] pgd=0000000000000000, p4d=0000000000000000
[   31.596434] Internal error: Oops: 0000000096000021 [#1]  SMP
[   31.596936] Modules linked in: snd tyr(+) soundcore sha256 cfg80211 rfkill pci_endpoint_test fuse dm_mod ipv6
[   31.597830] CPU: 3 UID: 0 PID: 241 Comm: (udev-worker) Not tainted 6.19.0-rc5 #282 PREEMPT
[   31.598561] Hardware name: Radxa ROCK 5B (DT)
[   31.598944] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   31.599554] pc : __d_lookup_rcu+0xbc/0x168
[   31.599921] lr : __d_lookup_rcu+0x60/0x168
[   31.600283] sp : ffff800081ebba00
[   31.600574] x29: ffff800081ebba00 x28: 0000000000000049 x27: ffff00010d07002b
[   31.601205] x26: 0000000000000081 x25: 000000000006915e x24: ffff0002f6600000
[   31.601848] x23: ffff00010396a040 x22: ffff000102098460 x21: 000000036915e207
[   31.601859] x20: ffff000101e10af8 x19: ffff800081ebbcac x18: 2f64662f666c6573
[   31.601867] x17: ffffff00666c6573 x16: 00000000fffffffc x15: 0000000000003431
[   31.601875] x14: 000000000000000f x13: 0080205100800107 x12: 0000000000800069
[   31.601882] x11: ffffffffffffffff x10: 0000000000000018 x9 : 0000000000000003
[   31.601890] x8 : 00000000008000a1 x7 : ffffb9d13df173c8 x6 : 0000000000000000
[   31.601897] x5 : 0000000000000000 x4 : 0000000000000010 x3 : ffffffffffff0a00
[   31.601905] x2 : ffff800081ebbcac x1 : ffffb9d1406be718 x0 : 0000000000000001
[   31.601913] Call trace:
[   31.601915]  __d_lookup_rcu+0xbc/0x168 (P)
[   31.601922]  lookup_fast+0x98/0x174
[   31.601929]  link_path_walk+0x280/0x528
[   31.601935]  path_lookupat+0x60/0x1f0
[   31.601941]  do_o_path+0x34/0xb4
[   31.601947]  path_openat+0xccc/0xe34
[   31.601953]  do_filp_open+0xc0/0x170
[   31.601958]  do_sys_openat2+0x88/0x10c
[   31.601963]  __arm64_sys_openat+0x70/0x9c
[   31.601968]  invoke_syscall+0x40/0xcc
[   31.601974]  el0_svc_common+0x80/0xd8
[   31.601979]  do_el0_svc+0x1c/0x28
[   31.601984]  el0_svc+0x54/0x1d4
[   31.601991]  el0t_64_sync_handler+0x84/0x12c
[   31.601997]  el0t_64_sync+0x198/0x19c
[   31.602005] Code: 14000003 f9400108 b4000428 d100e10c (88dffd8c)
[   31.602009] ---[ end trace 0000000000000000 ]---
[  OK  ] Listening on sshd-unix-local.socke…temd-ssh-generator, AF_UNIX Local).
[   31.620067] mc: Linux media interface: v0.10
[   31.623483] [drm] Initialized panthor 1.5.0 for fb000000.gpu on minor 0
[   31.623765] Unable to handle kernel paging request at virtual address 00802a4d0080284d
[   31.624285] tyr fb000000.gpu: Tyr initialized correctly.
[   31.624752] Mem abort info:
[   31.624754]   ESR = 0x0000000096000004
[   31.625847]   EC = 0x25: DABT (current EL), IL = 32 bits
[   31.626310]   SET = 0, FnV = 0
[   31.626578]   EA = 0, S1PTW = 0
[   31.626853]   FSC = 0x04: level 0 translation fault
[   31.627277] Data abort info:
[   31.627529]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   31.628006]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   31.628447]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   31.628910] [00802a4d0080284d] address between user and kernel address ranges
[   31.629535] Internal error: Oops: 0000000096000004 [#2]  SMP
[   31.630030] Modules linked in: mc drm_client_lib snd tyr soundcore sha256 cfg80211 rfkill pci_endpoint_test fuse dm_mod ipv6
[   31.631017] CPU: 4 UID: 0 PID: 225 Comm: systemd-udevd Tainted: G      D             6.19.0-rc5 #282 PREEMPT
[   31.631877] Tainted: [D]=DIE
[   31.632129] Hardware name: Radxa ROCK 5B (DT)
[   31.632506] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   31.633111] pc : ___d_drop+0xd8/0x144
[   31.633433] lr : d_invalidate+0x3c/0x110
[   31.633776] sp : ffff800081d3ba70
[   31.634064] x29: ffff800081d3ba90 x28: 0000000000000001 x27: ffffb9d140bfa000
[   31.634685] x26: ffff0001039b5108 x25: ffff00010396a000 x24: ffffb9d140166275
[   31.635305] x23: ffffb9d140bfa000 x22: ffffb9d140152f3a x21: ffff000104076000
[   31.635925] x20: ffff00010e520098 x19: ffff00010396a000 x18: 0000000000000000
[   31.636545] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   31.637165] x14: 0000000000000000 x13: ffff00010792b8f0 x12: 000000000000017a
[   31.637785] x11: 00000000008000a1 x10: 00802a4d0080284d x9 : ffff0002f6604010
[   31.638405] x8 : ffff000105bfcd40 x7 : 0000000000000000 x6 : ffffb9d13e272c60
[   31.639026] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[   31.639646] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010396a000
[   31.640266] Call trace:
[   31.640479]  ___d_drop+0xd8/0x144 (P)
[   31.640800]  d_invalidate+0x3c/0x110
[   31.641113]  proc_invalidate_siblings_dcache+0x244/0x2b8
[   31.641577]  proc_flush_pid+0x1c/0x28
[   31.641897]  release_task+0x560/0x668
[   31.642218]  wait_consider_task+0x5a0/0xb44
[   31.642582]  __do_wait+0x154/0x1f0
[   31.642879]  do_wait+0x84/0x16c
[   31.643154]  __arm64_sys_waitid+0xac/0x218
[   31.643512]  invoke_syscall+0x40/0xcc
[   31.643833]  el0_svc_common+0x80/0xd8
[   31.644152]  do_el0_svc+0x1c/0x28
[   31.644441]  el0_svc+0x54/0x1d4
[   31.644718]  el0t_64_sync_handler+0x84/0x12c
[   31.645090]  el0t_64_sync+0x198/0x19c
[   31.645412] Code: 5280002a f85f83a0 17fffff1 a944280b (f940014c)
[   31.645941] ---[ end trace 0000000000000000 ]---

thanks,
Deborah

