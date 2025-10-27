Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497F7C0D62F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCC010E442;
	Mon, 27 Oct 2025 12:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Rnr0qRPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C9F10E442
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:05:26 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cwBz65PF9z9tQP;
 Mon, 27 Oct 2025 13:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761566722; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hELDqZNmRZsZuMPzJyFRpEOKzSYCREr4DQLVDho0FM=;
 b=Rnr0qRPlnN2ReBgIDbERgp4eJXq5xGOmVZzIKA4KpaX0Rji2VOdEl5LczBAv6vDANQEUce
 YHUOgcXKi/Z017Q+hadLUa/FEuo0grQknm3v9w00oBwaUvkJaS9gwQtaxti7qgUfeOPfic
 RG/vcYXdnt3wiu7HNDCc3XZKeJLT3M3hsIhycSDGWxMns4AJgaER2Vee+NtUJ5XwFPPgVK
 55uLcLmUdko5D/3GUsVWsM+W3n1LsmvXRdMNbkmH/73uOrwKOkIoSCXc29VpgyYVKfMclg
 xTd9C2UybQhgi2c1H7e+vcXuxM89xP8Z9crgFz6b4cOo+nGxB08wk8WAVdbxOQ==
Message-ID: <48644db5444c493aa0ec022b9708d3c71cd9f038.camel@mailbox.org>
Subject: Re: Patch "drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies" has been added to the 6.1-stable tree
From: Philipp Stanner <phasta@mailbox.org>
To: gregkh@linuxfoundation.org, christian.koenig@amd.com, 
 ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 dan.carpenter@linaro.org,  daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com, 
 phasta@kernel.org, robdclark@chromium.org, sashal@kernel.org, 
 tvrtko.ursulin@igalia.com
Cc: stable-commits@vger.kernel.org
Date: Mon, 27 Oct 2025 13:05:17 +0100
In-Reply-To: <2025102700-exception-unearned-a451@gregkh>
References: <2025102700-exception-unearned-a451@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: bb16272cecd6e3c81b0
X-MBO-RS-META: h4grnoh4djim6yn4ee8f3mdw7xbisxiz
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-10-27 at 12:36 +0100, gregkh@linuxfoundation.org wrote:
>=20
> This is a note to let you know that I've just added the patch titled
>=20
> =C2=A0=C2=A0=C2=A0 drm/sched: Fix potential double free in drm_sched_job_=
add_resv_dependencies
>=20
> to the 6.1-stable tree which can be found at:
> =C2=A0=C2=A0=C2=A0 http://www.kernel.org/git/?p=3Dlinux/kernel/git/stable=
/stable-queue.git;a=3Dsummary
>=20
> The filename of the patch is:
> =C2=A0=C2=A0=C2=A0=C2=A0 drm-sched-fix-potential-double-free-in-drm_sched=
_job_add_resv_dependencies.patch
> and it can be found in the queue-6.1 subdirectory.
>=20
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
>=20
>=20
> From stable+bounces-188336-greg=3Dkroah.com@vger.kernel.org=C2=A0Tue Oct =
21 15:13:55 2025
> From: Sasha Levin <sashal@kernel.org>
> Date: Tue, 21 Oct 2025 09:12:50 -0400
> Subject: drm/sched: Fix potential double free in drm_sched_job_add_resv_d=
ependencies
> To: stable@vger.kernel.org
> Cc: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, "Dan Carpenter" <dan.ca=
rpenter@linaro.org>, "Christian K=C3=B6nig" <christian.koenig@amd.com>, "Ro=
b Clark" <robdclark@chromium.org>, "Daniel Vetter" <daniel.vetter@ffwll.ch>=
, "Matthew Brost" <matthew.brost@intel.com>, "Danilo Krummrich" <dakr@kerne=
l.org>, "Philipp Stanner" <phasta@kernel.org>, "Christian K=C3=B6nig" <ckoe=
nig.leichtzumerken@gmail.com>, dri-devel@lists.freedesktop.org, "Sasha Levi=
n" <sashal@kernel.org>
> Message-ID: <20251021131250.2072371-1-sashal@kernel.org>
>=20
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> [ Upstream commit 5801e65206b065b0b2af032f7f1eef222aa2fd83 ]
>=20
> When adding dependencies with drm_sched_job_add_dependency(), that
> function consumes the fence reference both on success and failure, so in
> the latter case the dma_fence_put() on the error path (xarray failed to
> expand) is a double free.
>=20
> Interestingly this bug appears to have been present ever since
> commit ebd5f74255b9 ("drm/sched: Add dependency tracking"), since the cod=
e
> back then looked like this:
>=20
> drm_sched_job_add_implicit_dependencies():
> ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < fence_count; i++) =
{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D drm_sched_job_add_dependency(job, fences[i]);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (; i < fence_count; i++)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dma_fence_put(fences[i]);
>=20
> Which means for the failing 'i' the dma_fence_put was already a double
> free. Possibly there were no users at that time, or the test cases were
> insufficient to hit it.
>=20
> The bug was then only noticed and fixed after
> commit 9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_ad=
d_implicit_dependencies v2")
> landed, with its fixup of
> commit 4eaf02d6076c ("drm/scheduler: fix drm_sched_job_add_implicit_depen=
dencies").
>=20
> At that point it was a slightly different flavour of a double free, which
> commit 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_depen=
dencies harder")
> noticed and attempted to fix.
>=20
> But it only moved the double free from happening inside the
> drm_sched_job_add_dependency(), when releasing the reference not yet
> obtained, to the caller, when releasing the reference already released by
> the former in the failure case.
>=20
> As such it is not easy to identify the right target for the fixes tag so
> lets keep it simple and just continue the chain.
>=20
> While fixing we also improve the comment and explain the reason for takin=
g
> the reference and not dropping it.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_depen=
dencies harder")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/aNFbXq8OeYl3QSdm@stanley.mounta=
in/
> Cc: Christian K=C3=83=C2=B6nig <christian.koenig@amd.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Christian K=C3=83=C2=B6nig <ckoenig.leichtzumerken@gmail.com>

What has happened with the encoding here?

@Christian, your mail was UTF-8, wasn't it?

P.

> Cc: dri-devel@lists.freedesktop.org
> Cc: stable@vger.kernel.org=C2=A0# v5.16+
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Link: https://lore.kernel.org/r/20251015084015.6273-1-tvrtko.ursulin@igal=
ia.com
> [ applied to drm_sched_job_add_implicit_dependencies instead of drm_sched=
_job_add_resv_dependencies ]
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c |=C2=A0=C2=A0 13 +++++++----=
--
> =C2=A01 file changed, 7 insertions(+), 6 deletions(-)
>=20
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -719,13 +719,14 @@ int drm_sched_job_add_implicit_dependenc
> =C2=A0
> =C2=A0	dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(writ=
e),
> =C2=A0				fence) {
> -		/* Make sure to grab an additional ref on the added fence */
> -		dma_fence_get(fence);
> -		ret =3D drm_sched_job_add_dependency(job, fence);
> -		if (ret) {
> -			dma_fence_put(fence);
> +		/*
> +		 * As drm_sched_job_add_dependency always consumes the fence
> +		 * reference (even when it fails), and dma_resv_for_each_fence
> +		 * is not obtaining one, we need to grab one before calling.
> +		 */
> +		ret =3D drm_sched_job_add_dependency(job, dma_fence_get(fence));
> +		if (ret)
> =C2=A0			return ret;
> -		}
> =C2=A0	}
> =C2=A0	return 0;
> =C2=A0}
>=20
>=20
> Patches currently in stable-queue which might be from sashal@kernel.org=
=C2=A0are
>=20
> queue-6.1/pci-j721e-enable-acspcie-refclk-if-ti-syscon-acspcie-proxy-ctrl=
-exists.patch
> queue-6.1/fuse-allocate-ff-release_args-only-if-release-is-needed.patch
> queue-6.1/net-ethernet-enetc-unlock-xdp_redirect-for-xdp-non-l.patch
> queue-6.1/r8169-fix-packet-truncation-after-s4-resume-on-rtl81.patch
> queue-6.1/asoc-nau8821-add-dmi-quirk-to-bypass-jack-debounce-c.patch
> queue-6.1/hfs-make-proper-initalization-of-struct-hfs_find_dat.patch
> queue-6.1/tls-always-set-record_type-in-tls_process_cmsg.patch
> queue-6.1/ixgbevf-add-support-for-intel-r-e610-device.patch
> queue-6.1/alsa-firewire-amdtp-stream-fix-enum-kernel-doc-warni.patch
> queue-6.1/hfsplus-return-eio-when-type-of-hidden-directory-mis.patch
> queue-6.1/iio-imu-inv_icm42600-simplify-pm_runtime-setup.patch
> queue-6.1/tls-don-t-rely-on-tx_work-during-send.patch
> queue-6.1/asoc-nau8821-generalize-helper-to-clear-irq-status.patch
> queue-6.1/f2fs-remove-the-create-argument-to-f2fs_map_blocks.patch
> queue-6.1/net-ip6_tunnel-prevent-perpetual-tunnel-growth.patch
> queue-6.1/xfs-fix-log-crc-mismatches-between-i386-and-other-architectures=
.patch
> queue-6.1/nfsd-minor-cleanup-in-layoutcommit-processing.patch
> queue-6.1/drm-rockchip-vop2-use-correct-destination-rectangle-.patch
> queue-6.1/arm64-mm-avoid-always-making-pte-dirty-in-pte_mkwrit.patch
> queue-6.1/iio-imu-inv_icm42600-avoid-configuring-if-already-pm_runtime-su=
spended.patch
> queue-6.1/net-dlink-handle-dma_map_single-failure-properly.patch
> queue-6.1/arm64-mte-do-not-flag-the-zero-page-as-pg_mte_tagged.patch
> queue-6.1/fuse-fix-livelock-in-synchronous-file-put-from-fuseblk-workers.=
patch
> queue-6.1/cpufreq-cppc-avoid-using-cpufreq_eternal-as-transition-delay.pa=
tch
> queue-6.1/dlm-check-for-defined-force-value-in-dlm_lockspace_r.patch
> queue-6.1/drm-exynos-exynos7_drm_decon-fix-uninitialized-crtc-reference-i=
n-functions.patch
> queue-6.1/hid-hid-input-only-ignore-0-battery-events-for-digit.patch
> queue-6.1/net-tls-wait-for-async-completion-on-last-message.patch
> queue-6.1/hfs-clear-offset-and-space-out-of-valid-records-in-b.patch
> queue-6.1/arch_topology-fix-incorrect-error-check-in-topology_parse_cpu_c=
apacity.patch
> queue-6.1/net-enetc-correct-the-value-of-enetc_rxb_truesize.patch
> queue-6.1/riscv-kprobes-fix-probe-address-validation.patch
> queue-6.1/sctp-avoid-null-dereference-when-chunk-data-buffer-i.patch
> queue-6.1/risc-v-don-t-print-details-of-cpus-disabled-in-dt.patch
> queue-6.1/dax-skip-read-lock-assertion-for-read-only-filesyste.patch
> queue-6.1/usb-gadget-f_acm-refactor-bind-path-to-use-__free.patch
> queue-6.1/drm-sched-fix-potential-double-free-in-drm_sched_job_add_resv_d=
ependencies.patch
> queue-6.1/sched-balancing-rename-newidle_balance-sched_balance.patch
> queue-6.1/padata-reset-next-cpu-when-reorder-sequence-wraps-around.patch
> queue-6.1/io_uring-correct-__must_hold-annotation-in-io_instal.patch
> queue-6.1/net-usb-lan78xx-fix-use-of-improperly-initialized-de.patch
> queue-6.1/drm-exynos-exynos7_drm_decon-remove-ctx-suspended.patch
> queue-6.1/crypto-rockchip-fix-dma_unmap_sg-nents-value.patch
> queue-6.1/tcp-fix-tcp_tso_should_defer-vs-large-rtt.patch
> queue-6.1/hfs-fix-kmsan-uninit-value-issue-in-hfs_find_set_zer.patch
> queue-6.1/tls-wait-for-pending-async-decryptions-if-tls_strp_m.patch
> queue-6.1/smb-server-let-smb_direct_flush_send_list-invalidate.patch
> queue-6.1/hid-multitouch-fix-name-of-stylus-input-devices.patch
> queue-6.1/amd-xgbe-avoid-spurious-link-down-messages-during-in.patch
> queue-6.1/iio-imu-inv_icm42600-use-instead-of-memset.patch
> queue-6.1/pm-runtime-add-new-devm-functions.patch
> queue-6.1/devcoredump-fix-circular-locking-dependency-with-devcd-mutex.pa=
tch
> queue-6.1/pci-j721e-fix-programming-sequence-of-strap-settings.patch
> queue-6.1/drm-rcar-du-dsi-fix-1-2-3-lane-support.patch
> queue-6.1/sched-fair-fix-pelt-lost-idle-time-detection.patch
> queue-6.1/ixgbevf-fix-mailbox-api-compatibility-by-negotiating-supported-=
features.patch
> queue-6.1/can-m_can-m_can_plat_remove-add-missing-pm_runtime_d.patch
> queue-6.1/drm-amd-powerplay-fix-cik-shutdown-temperature.patch
> queue-6.1/usb-gadget-f_rndis-refactor-bind-path-to-use-__free.patch
> queue-6.1/powerpc-32-remove-page_kernel_text-to-fix-startup-fa.patch
> queue-6.1/tg3-prevent-use-of-uninitialized-remote_adv-and-loca.patch
> queue-6.1/nfsd-rework-encoding-and-decoding-of-nfsd4_deviceid.patch
> queue-6.1/drm-exynos-exynos7_drm_decon-properly-clear-channels-during-bin=
d.patch
> queue-6.1/xfs-always-warn-about-deprecated-mount-options.patch
> queue-6.1/hfsplus-fix-kmsan-uninit-value-issue-in-hfsplus_dele.patch
> queue-6.1/usb-gadget-introduce-free_usb_request-helper.patch
> queue-6.1/nfsd-fix-last-write-offset-handling-in-layoutcommit.patch
> queue-6.1/dpaa2-eth-fix-the-pointer-passed-to-ptr_align-on-tx-.patch
> queue-6.1/lkdtm-fortify-fix-potential-null-dereference-on-kmal.patch
> queue-6.1/nfsd-define-a-proc_layoutcommit-for-the-flexfiles-layout-type.p=
atch
> queue-6.1/exec-fix-incorrect-type-for-ret.patch
> queue-6.1/tls-wait-for-async-encrypt-in-case-of-error-during-l.patch
> queue-6.1/f2fs-fix-wrong-block-mapping-for-multi-devices.patch
> queue-6.1/usb-gadget-f_ecm-refactor-bind-path-to-use-__free.patch
> queue-6.1/alsa-usb-audio-fix-null-pointer-deference-in-try_to_.patch
> queue-6.1/ixgbevf-fix-getting-link-speed-data-for-e610-devices.patch
> queue-6.1/pci-tegra194-reset-bars-when-running-in-pcie-endpoint-mode.patc=
h
> queue-6.1/asoc-nau8821-cancel-jdet_work-before-handling-jack-e.patch
> queue-6.1/vfs-don-t-leak-disconnected-dentries-on-umount.patch
> queue-6.1/hfsplus-fix-kmsan-uninit-value-issue-in-__hfsplus_ex.patch
> queue-6.1/usb-gadget-f_ncm-refactor-bind-path-to-use-__free.patch
> queue-6.1/pci-add-pci_vdevice_sub-helper-macro.patch
> queue-6.1/net-fec-add-initial-xdp-support.patch
> queue-6.1/m68k-bitops-fix-find_-_bit-signatures.patch
> queue-6.1/net-usb-lan78xx-add-error-handling-to-lan78xx_init_m.patch
> queue-6.1/doc-fix-seg6_flowlabel-path.patch
> queue-6.1/f2fs-add-a-f2fs_get_block_locked-helper.patch
> queue-6.1/nios2-ensure-that-memblock.current_limit-is-set-when.patch
> queue-6.1/xfs-rename-the-old_crc-variable-in-xlog_recover_process.patch
> queue-6.1/phy-cadence-cdns-dphy-fix-pll-lock-and-o_cmn_ready-polling.patc=
h
> queue-6.1/ksmbd-browse-interfaces-list-on-fsctl_query_interface_info-ioct=
l.patch
> queue-6.1/phy-cadence-cdns-dphy-update-calibration-wait-time-for-startup-=
state-machine.patch
> queue-6.1/f2fs-factor-a-f2fs_map_blocks_cached-helper.patch
> queue-6.1/risc-v-define-pgprot_dmacoherent-for-non-coherent-de.patch
> queue-6.1/hfs-validate-record-offset-in-hfsplus_bmap_alloc.patch
> queue-6.1/net-mlx5e-return-1-instead-of-0-in-invalid-case-in-m.patch
> queue-6.1/rtnetlink-allow-deleting-fdb-entries-in-user-namespa.patch
> queue-6.1/net-enetc-fix-the-deadlock-of-enetc_mdio_lock.patch
> queue-6.1/phy-cdns-dphy-store-hs_clk_rate-and-return-it.patch
> queue-6.1/ext4-avoid-potential-buffer-over-read-in-parse_apply_sb_mount_o=
ptions.patch
> queue-6.1/usb-gadget-store-endpoint-pointer-in-usb_request.patch
> queue-6.1/drm-bridge-lt9211-drop-check-for-last-nibble-of-vers.patch
> queue-6.1/net-tree-wide-replace-xdp_do_flush_map-with-xdp_do_f.patch

