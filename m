Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3158FF412
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 19:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CEE10EA58;
	Thu,  6 Jun 2024 17:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DF510EA50;
 Thu,  6 Jun 2024 17:50:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9177261E46;
 Thu,  6 Jun 2024 17:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0639C2BD10;
 Thu,  6 Jun 2024 17:50:49 +0000 (UTC)
Date: Thu, 6 Jun 2024 13:51:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
Message-ID: <20240606135101.30b0701a@rorschach.local.home>
In-Reply-To: <202406070106.im4Z1j0V-lkp@intel.com>
References: <202406070106.im4Z1j0V-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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


Is there something new since the last report?

 https://lore.kernel.org/all/202406060125.8GGeEpJs-lkp@intel.com/

If not, can we please not keep spamming, as it makes it harder to know
what to fix and what has been fixed.

-- Steve


On Fri, 07 Jun 2024 01:15:11 +0800
kernel test robot <lkp@intel.com> wrote:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f  Add linux-next specific files for 20240606
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/oe-kbuild-all/202406061744.rZDXfRrG-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> kernel/trace/trace_selftest.c:761: warning: "BYTE_NUMBER" redefined
> 
> Unverified Error/Warning (likely false positive, please contact us if interested):
> 
> arch/microblaze/boot/dts/system.dts:20.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
> arch/microblaze/boot/dts/system.dts:272.4-19: Warning (clocks_property): /amba_pl/dma@41e00000:clocks: cell 0 is not a phandle reference
> arch/microblaze/boot/dts/system.dts:284.4-19: Warning (clocks_property): /amba_pl/timer@41c00000:clocks: cell 0 is not a phandle reference
> arch/microblaze/boot/dts/system.dts:339.4-19: Warning (clocks_property): /amba_pl/i2c@40800000:clocks: cell 0 is not a phandle reference
> arch/microblaze/boot/dts/system.dts:483.25-486.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00000000: unit name should not have leading "0x"
> arch/microblaze/boot/dts/system.dts:483.25-486.6: Warning (unit_address_format): /amba_pl/flash@60000000/partition@0x00000000: unit name should not have leading 0s
> arch/microblaze/boot/dts/system.dts:50.4-19: Warning (clocks_property): /cpus/cpu@0:clocks: cell 0 is not a phandle reference
> arch/microblaze/boot/dts/system.dts:560.4-19: Warning (clocks_property): /amba_pl/serial@44a00000:clocks: cell 0 is not a phandle reference
> arch/microblaze/boot/dts/system.dts:579.15-588.4: Warning (simple_bus_reg): /amba_pl/gpio-restart: missing or empty reg/ranges property
> 
> Error/Warning ids grouped by kconfigs:
> 
> gcc_recent_errors
> |-- alpha-randconfig-r123-20240606
> |   `-- drivers-hwmon-cros_ec_hwmon.c:sparse:sparse:cast-to-restricted-__le16
> |-- loongarch-defconfig
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-hubbub-dcn401-dcn401_hubbub.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
> |   `-- drivers-thermal-thermal_trip.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
> |-- microblaze-buildonly-randconfig-r001-20230308
> |   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
> |   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
> |   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
> |   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
> |   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
> |   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
> |   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
> |   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
> |   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
> |-- openrisc-randconfig-r121-20240606
> |   `-- drivers-clk-qcom-camcc-sm7150.c:sparse:sparse:symbol-camcc_sm7150_hws-was-not-declared.-Should-it-be-static
> |-- sh-randconfig-c004-20211223
> |   `-- kernel-trace-trace_selftest.c:warning:BYTE_NUMBER-redefined
> |-- sh-randconfig-r111-20240606
> |   |-- include-linux-container_of.h:error:struct-ftrace_ops-has-no-member-named-list
> |   |-- include-linux-list.h:error:struct-ftrace_ops-has-no-member-named-list
> |   |-- include-linux-stddef.h:error:struct-ftrace_ops-has-no-member-named-list
> |   |-- kernel-trace-fgraph.c:error:implicit-declaration-of-function-ftrace_shutdown_subops
> |   |-- kernel-trace-fgraph.c:error:implicit-declaration-of-function-ftrace_startup_subops
> |   `-- kernel-trace-fgraph.c:error:struct-ftrace_ops-has-no-member-named-subop_list
> |-- um-allyesconfig
> |   `-- kernel-bpf-verifier.c:error:pcpu_hot-undeclared-(first-use-in-this-function)
> `-- x86_64-randconfig-161-20240606
>     |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c-amdgpu_vm_bo_update()-error:we-previously-assumed-bo-could-be-null-(see-line-)
>     |-- drivers-gpu-drm-i915-display-intel_dpt.c-intel_dpt_pin_to_ggtt()-error:uninitialized-symbol-vma-.
>     |-- drivers-gpu-drm-i915-display-intel_fb_pin.c-intel_fb_pin_to_dpt()-error:uninitialized-symbol-vma-.
>     `-- drivers-gpu-drm-i915-display-intel_fb_pin.c-intel_fb_pin_to_dpt()-error:vma-dereferencing-possible-ERR_PTR()
> clang_recent_errors
> |-- arm-randconfig-r133-20240606
> |   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
> |   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
> |-- arm64-allmodconfig
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_cursor.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-phy-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_dpll_mgr.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-intel_dpll_id-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_hotplug.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_pipe_crc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_tc.c:error:arithmetic-between-different-enumeration-types-(-enum-intel_display_power_domain-and-enum-tc_port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_vdsc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-skl_universal_plane.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-skl_watermark.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   `-- drivers-gpu-drm-renesas-rcar-du-rcar_cmm.c:error:unused-function-rcar_cmm_read-Werror-Wunused-function
> |-- arm64-randconfig-r113-20240606
> |   |-- kernel-trace-fgraph.c:sparse:sparse:symbol-fgraph_do_direct-was-not-declared.-Should-it-be-static
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
> |   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
> |   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
> |-- i386-buildonly-randconfig-001-20240606
> |   `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
> |-- i386-buildonly-randconfig-005-20240606
> |   `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
> |-- i386-randconfig-006-20240606
> |   `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
> |-- i386-randconfig-062-20240606
> |   `-- drivers-hwmon-cros_ec_hwmon.c:sparse:sparse:cast-to-restricted-__le16
> |-- riscv-allmodconfig
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_cursor.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-phy-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_dpll_mgr.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-intel_dpll_id-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_hotplug.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_pipe_crc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_tc.c:error:arithmetic-between-different-enumeration-types-(-enum-intel_display_power_domain-and-enum-tc_port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_vdsc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-skl_universal_plane.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   `-- drivers-gpu-drm-i915-display-skl_watermark.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |-- riscv-allyesconfig
> |   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
> |   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
> |-- s390-allmodconfig
> |   |-- drivers-gpu-drm-i915-display-intel_cursor.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-phy-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_dpll_mgr.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-intel_dpll_id-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_hotplug.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_pipe_crc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_tc.c:error:arithmetic-between-different-enumeration-types-(-enum-intel_display_power_domain-and-enum-tc_port-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-intel_vdsc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   |-- drivers-gpu-drm-i915-display-skl_universal_plane.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |   `-- drivers-gpu-drm-i915-display-skl_watermark.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
> |-- x86_64-randconfig-014-20240606
> |   `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
> |-- x86_64-randconfig-076-20240606
> |   `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
> `-- x86_64-randconfig-r112-20240606
>     `-- drivers-hwmon-cros_ec_hwmon.c:sparse:sparse:cast-to-restricted-__le16
> 
> elapsed time: 742m
> 
> configs tested: 179
> configs skipped: 3
> 
> tested configs:
> alpha                             allnoconfig   gcc  
> alpha                            allyesconfig   gcc  
> alpha                               defconfig   gcc  
> arc                              allmodconfig   gcc  
> arc                               allnoconfig   gcc  
> arc                              allyesconfig   gcc  
> arc                                 defconfig   gcc  
> arc                   randconfig-001-20240606   gcc  
> arc                   randconfig-002-20240606   gcc  
> arm                              allmodconfig   gcc  
> arm                               allnoconfig   clang
> arm                              allyesconfig   gcc  
> arm                     davinci_all_defconfig   clang
> arm                                 defconfig   clang
> arm                           omap1_defconfig   gcc  
> arm                   randconfig-001-20240606   clang
> arm                   randconfig-002-20240606   clang
> arm                   randconfig-003-20240606   clang
> arm                   randconfig-004-20240606   clang
> arm                           tegra_defconfig   gcc  
> arm64                            allmodconfig   clang
> arm64                             allnoconfig   gcc  
> arm64                               defconfig   gcc  
> arm64                 randconfig-001-20240606   clang
> arm64                 randconfig-002-20240606   gcc  
> arm64                 randconfig-003-20240606   clang
> arm64                 randconfig-004-20240606   clang
> csky                             alldefconfig   gcc  
> csky                             allmodconfig   gcc  
> csky                              allnoconfig   gcc  
> csky                             allyesconfig   gcc  
> csky                                defconfig   gcc  
> csky                  randconfig-001-20240606   gcc  
> csky                  randconfig-002-20240606   gcc  
> hexagon                          allmodconfig   clang
> hexagon                           allnoconfig   clang
> hexagon                          allyesconfig   clang
> hexagon                             defconfig   clang
> hexagon               randconfig-001-20240606   clang
> hexagon               randconfig-002-20240606   clang
> i386                             allmodconfig   gcc  
> i386                              allnoconfig   gcc  
> i386                             allyesconfig   gcc  
> i386         buildonly-randconfig-001-20240606   clang
> i386         buildonly-randconfig-002-20240606   clang
> i386         buildonly-randconfig-003-20240606   clang
> i386         buildonly-randconfig-004-20240606   gcc  
> i386         buildonly-randconfig-005-20240606   clang
> i386         buildonly-randconfig-006-20240606   gcc  
> i386                                defconfig   clang
> i386                  randconfig-001-20240606   clang
> i386                  randconfig-002-20240606   clang
> i386                  randconfig-003-20240606   clang
> i386                  randconfig-004-20240606   clang
> i386                  randconfig-005-20240606   clang
> i386                  randconfig-006-20240606   clang
> i386                  randconfig-011-20240606   clang
> i386                  randconfig-012-20240606   gcc  
> i386                  randconfig-013-20240606   gcc  
> i386                  randconfig-014-20240606   gcc  
> i386                  randconfig-015-20240606   gcc  
> i386                  randconfig-016-20240606   gcc  
> loongarch                        allmodconfig   gcc  
> loongarch                         allnoconfig   gcc  
> loongarch                           defconfig   gcc  
> loongarch             randconfig-001-20240606   gcc  
> loongarch             randconfig-002-20240606   gcc  
> m68k                             allmodconfig   gcc  
> m68k                              allnoconfig   gcc  
> m68k                             allyesconfig   gcc  
> m68k                                defconfig   gcc  
> m68k                          hp300_defconfig   gcc  
> microblaze                       allmodconfig   gcc  
> microblaze                        allnoconfig   gcc  
> microblaze                       allyesconfig   gcc  
> microblaze                          defconfig   gcc  
> mips                              allnoconfig   gcc  
> mips                             allyesconfig   gcc  
> mips                      maltasmvp_defconfig   gcc  
> nios2                            allmodconfig   gcc  
> nios2                             allnoconfig   gcc  
> nios2                            allyesconfig   gcc  
> nios2                               defconfig   gcc  
> nios2                 randconfig-001-20240606   gcc  
> nios2                 randconfig-002-20240606   gcc  
> openrisc                          allnoconfig   gcc  
> openrisc                         allyesconfig   gcc  
> openrisc                            defconfig   gcc  
> parisc                           allmodconfig   gcc  
> parisc                            allnoconfig   gcc  
> parisc                           allyesconfig   gcc  
> parisc                              defconfig   gcc  
> parisc                randconfig-001-20240606   gcc  
> parisc                randconfig-002-20240606   gcc  
> parisc64                            defconfig   gcc  
> powerpc                          allmodconfig   gcc  
> powerpc                           allnoconfig   gcc  
> powerpc                          allyesconfig   clang
> powerpc                    gamecube_defconfig   clang
> powerpc                       holly_defconfig   clang
> powerpc                        icon_defconfig   gcc  
> powerpc                 linkstation_defconfig   clang
> powerpc                      obs600_defconfig   clang
> powerpc                      ppc44x_defconfig   clang
> powerpc               randconfig-001-20240606   gcc  
> powerpc               randconfig-002-20240606   gcc  
> powerpc               randconfig-003-20240606   gcc  
> powerpc64             randconfig-001-20240606   clang
> powerpc64             randconfig-002-20240606   clang
> powerpc64             randconfig-003-20240606   gcc  
> riscv                            allmodconfig   clang
> riscv                             allnoconfig   gcc  
> riscv                            allyesconfig   clang
> riscv                               defconfig   clang
> riscv                 randconfig-001-20240606   gcc  
> riscv                 randconfig-002-20240606   clang
> s390                             allmodconfig   clang
> s390                              allnoconfig   clang
> s390                             allyesconfig   gcc  
> s390                                defconfig   clang
> s390                  randconfig-001-20240606   gcc  
> s390                  randconfig-002-20240606   gcc  
> sh                               allmodconfig   gcc  
> sh                                allnoconfig   gcc  
> sh                               allyesconfig   gcc  
> sh                                  defconfig   gcc  
> sh                          r7785rp_defconfig   gcc  
> sh                    randconfig-001-20240606   gcc  
> sh                    randconfig-002-20240606   gcc  
> sh                      rts7751r2d1_defconfig   gcc  
> sh                  sh7785lcr_32bit_defconfig   gcc  
> sparc                            allmodconfig   gcc  
> sparc                             allnoconfig   gcc  
> sparc                               defconfig   gcc  
> sparc64                          allmodconfig   gcc  
> sparc64                          allyesconfig   gcc  
> sparc64                             defconfig   gcc  
> sparc64               randconfig-001-20240606   gcc  
> sparc64               randconfig-002-20240606   gcc  
> um                               allmodconfig   clang
> um                                allnoconfig   clang
> um                               allyesconfig   gcc  
> um                                  defconfig   clang
> um                             i386_defconfig   gcc  
> um                    randconfig-001-20240606   clang
> um                    randconfig-002-20240606   gcc  
> um                           x86_64_defconfig   clang
> x86_64                            allnoconfig   clang
> x86_64                           allyesconfig   clang
> x86_64       buildonly-randconfig-001-20240606   gcc  
> x86_64       buildonly-randconfig-002-20240606   clang
> x86_64       buildonly-randconfig-003-20240606   gcc  
> x86_64       buildonly-randconfig-004-20240606   gcc  
> x86_64       buildonly-randconfig-005-20240606   gcc  
> x86_64       buildonly-randconfig-006-20240606   clang
> x86_64                              defconfig   gcc  
> x86_64                randconfig-001-20240606   gcc  
> x86_64                randconfig-002-20240606   gcc  
> x86_64                randconfig-003-20240606   gcc  
> x86_64                randconfig-004-20240606   clang
> x86_64                randconfig-005-20240606   gcc  
> x86_64                randconfig-006-20240606   gcc  
> x86_64                randconfig-011-20240606   clang
> x86_64                randconfig-012-20240606   gcc  
> x86_64                randconfig-013-20240606   clang
> x86_64                randconfig-014-20240606   clang
> x86_64                randconfig-015-20240606   clang
> x86_64                randconfig-016-20240606   clang
> x86_64                randconfig-071-20240606   clang
> x86_64                randconfig-072-20240606   gcc  
> x86_64                randconfig-073-20240606   clang
> x86_64                randconfig-074-20240606   clang
> x86_64                randconfig-075-20240606   gcc  
> x86_64                randconfig-076-20240606   clang
> x86_64                          rhel-8.3-rust   clang
> xtensa                            allnoconfig   gcc  
> xtensa                  nommu_kc705_defconfig   gcc  
> xtensa                randconfig-001-20240606   gcc  
> xtensa                randconfig-002-20240606   gcc  
> 

