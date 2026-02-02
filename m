Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLEIAe20gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:30:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5785CCD5DE
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7719210E3DF;
	Mon,  2 Feb 2026 14:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Csq8q+mu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16F10E3DF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 14:30:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E160043F77;
 Mon,  2 Feb 2026 14:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80121C2BC9E;
 Mon,  2 Feb 2026 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770042599;
 bh=jck2a35rH44Ec7cxfa7Y2xQGNeiOO0ZAj1HORneLmO0=;
 h=Date:From:To:Cc:Subject:From;
 b=Csq8q+mugnalzEqKqFs6kZyiHZXgqiXHc9dVagaWin5vEBxihXBTcoHdECBuUd0vJ
 z7o9mvRi9rd9hx3xF5NQWmSQ9BcbQhtEwdXlL7zAkR+JiQ6wENPs6kNDJuw62I6t7P
 t4lUOGwfTYFAVMFcpFHVJf64wiv/WC7idd6SlHrhPwp7oi0Go4Y70KgMjvfbw1AJyR
 lBJ8qxlQsrD5dm2pkkNibESeHFPuFAJgrWfRBfNRoyNjICnW2JwTsNivHNG65vPkvh
 vakkeQCNbv/VMAwvNxnLg4cKYQmMqeagDYWXqSu92LJ/u5g/ex0XXhM2eUrJK2Az8w
 iZj5X7coHWKeQ==
Date: Mon, 2 Feb 2026 14:29:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aYC0403AEWZMbHaY@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8v59VJ8uYhvNlyh4"
Content-Disposition: inline
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
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:alexander.deucher@amd.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 5785CCD5DE
X-Rspamd-Action: no action


--8v59VJ8uYhvNlyh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c

between commits:

  3eb46fbb601f9 ("drm/amdgpu/gfx11: adjust KGQ reset sequence")
  dfd64f6e8cd7b ("drm/amdgpu/gfx12: adjust KGQ reset sequence")

=66rom the origin tree and commits:

  b340ff216fdab ("drm/amdgpu/gfx11: adjust KGQ reset sequence")
  0a6d6ed694d72 ("drm/amdgpu/gfx12: adjust KGQ reset sequence")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.
diff --combined drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index e642236ea2c51,427975b5a1d97..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@@ -120,6 -120,10 +120,10 @@@ MODULE_FIRMWARE("amdgpu/gc_11_5_3_pfp.b
  MODULE_FIRMWARE("amdgpu/gc_11_5_3_me.bin");
  MODULE_FIRMWARE("amdgpu/gc_11_5_3_mec.bin");
  MODULE_FIRMWARE("amdgpu/gc_11_5_3_rlc.bin");
+ MODULE_FIRMWARE("amdgpu/gc_11_5_4_pfp.bin");
+ MODULE_FIRMWARE("amdgpu/gc_11_5_4_me.bin");
+ MODULE_FIRMWARE("amdgpu/gc_11_5_4_mec.bin");
+ MODULE_FIRMWARE("amdgpu/gc_11_5_4_rlc.bin");
 =20
  static const struct amdgpu_hwip_reg_entry gc_reg_list_11_0[] =3D {
  	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS),
@@@ -416,7 -420,8 +420,8 @@@ static void gfx11_kiq_unmap_queues(stru
  	uint32_t eng_sel =3D ring->funcs->type =3D=3D AMDGPU_RING_TYPE_GFX ? 4 :=
 0;
 =20
  	if (adev->enable_mes && !adev->gfx.kiq[0].ring.sched.ready) {
- 		amdgpu_mes_unmap_legacy_queue(adev, ring, action, gpu_addr, seq);
+ 		amdgpu_mes_unmap_legacy_queue(adev, ring, action,
+ 					      gpu_addr, seq, 0);
  		return;
  	}
 =20
@@@ -566,8 -571,8 +571,8 @@@ static int gfx_v11_0_ring_test_ring(str
  	WREG32(scratch, 0xCAFEDEAD);
  	r =3D amdgpu_ring_alloc(ring, 5);
  	if (r) {
- 		DRM_ERROR("amdgpu: cp failed to lock ring %d (%d).\n",
- 			  ring->idx, r);
+ 		drm_err(adev_to_drm(adev), "cp failed to lock ring %d (%d).\n",
+ 			ring->idx, r);
  		return r;
  	}
 =20
@@@ -623,7 -628,7 +628,7 @@@ static int gfx_v11_0_ring_test_ib(struc
 =20
  	r =3D amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, &ib);
  	if (r) {
- 		DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
+ 		drm_err(adev_to_drm(adev), "failed to get ib (%ld).\n", r);
  		goto err1;
  	}
 =20
@@@ -917,7 -922,7 +922,7 @@@ static int gfx_v11_0_rlc_init(struct am
 =20
  	/* init spm vmid with 0xf */
  	if (adev->gfx.rlc.funcs->update_spm_vmid)
- 		adev->gfx.rlc.funcs->update_spm_vmid(adev, NULL, 0xf);
+ 		adev->gfx.rlc.funcs->update_spm_vmid(adev, 0, NULL, 0xf);
 =20
  	return 0;
  }
@@@ -1052,10 -1057,14 +1057,14 @@@ static void gfx_v11_0_select_me_pipe_q(
  static void gfx_v11_0_get_gfx_shadow_info_nocheck(struct amdgpu_device *a=
dev,
  					 struct amdgpu_gfx_shadow_info *shadow_info)
  {
+ 	/* for gfx */
  	shadow_info->shadow_size =3D MQD_SHADOW_BASE_SIZE;
  	shadow_info->shadow_alignment =3D MQD_SHADOW_BASE_ALIGNMENT;
  	shadow_info->csa_size =3D MQD_FWWORKAREA_SIZE;
  	shadow_info->csa_alignment =3D MQD_FWWORKAREA_ALIGNMENT;
+ 	/* for compute */
+ 	shadow_info->eop_size =3D GFX11_MEC_HPD_SIZE;
+ 	shadow_info->eop_alignment =3D 256;
  }
 =20
  static int gfx_v11_0_get_gfx_shadow_info(struct amdgpu_device *adev,
@@@ -1080,6 -1089,7 +1089,7 @@@ static const struct amdgpu_gfx_funcs gf
  	.select_me_pipe_q =3D &gfx_v11_0_select_me_pipe_q,
  	.update_perfmon_mgcg =3D &gfx_v11_0_update_perf_clk,
  	.get_gfx_shadow_info =3D &gfx_v11_0_get_gfx_shadow_info,
+ 	.get_hdp_flush_mask =3D &amdgpu_gfx_get_hdp_flush_mask,
  };
 =20
  static int gfx_v11_0_gpu_early_init(struct amdgpu_device *adev)
@@@ -1107,6 -1117,7 +1117,7 @@@
  	case IP_VERSION(11, 5, 1):
  	case IP_VERSION(11, 5, 2):
  	case IP_VERSION(11, 5, 3):
+ 	case IP_VERSION(11, 5, 4):
  		adev->gfx.config.max_hw_contexts =3D 8;
  		adev->gfx.config.sc_prim_fifo_size_frontend =3D 0x20;
  		adev->gfx.config.sc_prim_fifo_size_backend =3D 0x100;
@@@ -1589,6 -1600,7 +1600,7 @@@ static int gfx_v11_0_sw_init(struct amd
  	case IP_VERSION(11, 5, 1):
  	case IP_VERSION(11, 5, 2):
  	case IP_VERSION(11, 5, 3):
+ 	case IP_VERSION(11, 5, 4):
  		adev->gfx.me.num_me =3D 1;
  		adev->gfx.me.num_pipe_per_me =3D 1;
  		adev->gfx.me.num_queue_per_pipe =3D 2;
@@@ -3046,7 -3058,8 +3058,8 @@@ static int gfx_v11_0_wait_for_rlc_autol
  		    amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(11, 5, 0) ||
  		    amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(11, 5, 1) ||
  		    amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(11, 5, 2) ||
- 		    amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(11, 5, 3))
+ 		    amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(11, 5, 3) ||
+ 		    amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(11, 5, 4))
  			bootload_status =3D RREG32_SOC15(GC, 0,
  					regRLC_RLCS_BOOTLOAD_STATUS_gc_11_0_1);
  		else
@@@ -3617,7 -3630,7 +3630,7 @@@ static int gfx_v11_0_cp_gfx_start(struc
  	ring =3D &adev->gfx.gfx_ring[0];
  	r =3D amdgpu_ring_alloc(ring, gfx_v11_0_get_csb_size(adev));
  	if (r) {
- 		DRM_ERROR("amdgpu: cp failed to lock ring (%d).\n", r);
+ 		drm_err(&adev->ddev, "cp failed to lock ring (%d).\n", r);
  		return r;
  	}
 =20
@@@ -3662,7 -3675,7 +3675,7 @@@
  		ring =3D &adev->gfx.gfx_ring[1];
  		r =3D amdgpu_ring_alloc(ring, 2);
  		if (r) {
- 			DRM_ERROR("amdgpu: cp failed to lock ring (%d).\n", r);
+ 			drm_err(adev_to_drm(adev), "cp failed to lock ring (%d).\n", r);
  			return r;
  		}
 =20
@@@ -4593,7 -4606,7 +4606,7 @@@ static int gfx_v11_0_cp_resume(struct a
  	}
 =20
  	if (adev->enable_mes_kiq && adev->mes.kiq_hw_init)
- 		r =3D amdgpu_mes_kiq_hw_init(adev);
+ 		r =3D amdgpu_mes_kiq_hw_init(adev, 0);
  	else
  		r =3D gfx_v11_0_kiq_resume(adev);
  	if (r)
@@@ -4783,7 -4796,7 +4796,7 @@@ static int gfx_v11_0_hw_init(struct amd
  	adev->gfx.is_poweron =3D true;
 =20
  	if(get_gb_addr_config(adev))
- 		DRM_WARN("Invalid gb_addr_config !\n");
+ 		drm_warn(adev_to_drm(adev), "Invalid gb_addr_config !\n");
 =20
  	if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP &&
  	    adev->gfx.rs64_enable)
@@@ -4901,7 -4914,7 +4914,7 @@@ static int gfx_v11_0_hw_fini(struct amd
  		if (amdgpu_gfx_disable_kcq(adev, 0))
  			DRM_ERROR("KCQ disable failed\n");
 =20
- 		amdgpu_mes_kiq_hw_fini(adev);
+ 		amdgpu_mes_kiq_hw_fini(adev, 0);
  	}
 =20
  	if (amdgpu_sriov_vf(adev))
@@@ -5568,7 -5581,8 +5581,8 @@@ static int gfx_v11_0_update_gfx_clock_g
  	return 0;
  }
 =20
- static void gfx_v11_0_update_spm_vmid(struct amdgpu_device *adev, struct =
amdgpu_ring *ring, unsigned vmid)
+ static void gfx_v11_0_update_spm_vmid(struct amdgpu_device *adev, int xcc=
_id,
+ 		struct amdgpu_ring *ring, unsigned vmid)
  {
  	u32 reg, pre_data, data;
 =20
@@@ -5633,6 -5647,7 +5647,7 @@@ static void gfx_v11_cntl_power_gating(s
  		case IP_VERSION(11, 5, 1):
  		case IP_VERSION(11, 5, 2):
  		case IP_VERSION(11, 5, 3):
+ 	        case IP_VERSION(11, 5, 4):
  			WREG32_SOC15(GC, 0, regRLC_PG_DELAY_3, RLC_PG_DELAY_3_DEFAULT_GC_11_0_=
1);
  			break;
  		default:
@@@ -5671,6 -5686,7 +5686,7 @@@ static int gfx_v11_0_set_powergating_st
  	case IP_VERSION(11, 5, 1):
  	case IP_VERSION(11, 5, 2):
  	case IP_VERSION(11, 5, 3):
+ 	case IP_VERSION(11, 5, 4):
  		if (!enable)
  			amdgpu_gfx_off_ctrl(adev, false);
 =20
@@@ -5705,6 -5721,7 +5721,7 @@@ static int gfx_v11_0_set_clockgating_st
  	case IP_VERSION(11, 5, 1):
  	case IP_VERSION(11, 5, 2):
  	case IP_VERSION(11, 5, 3):
+ 	case IP_VERSION(11, 5, 4):
  	        gfx_v11_0_update_gfx_clock_gating(adev,
  	                        state =3D=3D  AMD_CG_STATE_GATE);
  	        break;
@@@ -5831,25 -5848,13 +5848,13 @@@ static void gfx_v11_0_ring_emit_hdp_flu
  {
  	struct amdgpu_device *adev =3D ring->adev;
  	u32 ref_and_mask, reg_mem_engine;
- 	const struct nbio_hdp_flush_reg *nbio_hf_reg =3D adev->nbio.hdp_flush_re=
g;
 =20
- 	if (ring->funcs->type =3D=3D AMDGPU_RING_TYPE_COMPUTE) {
- 		switch (ring->me) {
- 		case 1:
- 			ref_and_mask =3D nbio_hf_reg->ref_and_mask_cp2 << ring->pipe;
- 			break;
- 		case 2:
- 			ref_and_mask =3D nbio_hf_reg->ref_and_mask_cp6 << ring->pipe;
- 			break;
- 		default:
- 			return;
- 		}
- 		reg_mem_engine =3D 0;
- 	} else {
- 		ref_and_mask =3D nbio_hf_reg->ref_and_mask_cp0 << ring->pipe;
- 		reg_mem_engine =3D 1; /* pfp */
+ 	if (!adev->gfx.funcs->get_hdp_flush_mask) {
+ 		dev_err(adev->dev, "%s: gfx hdp flush is not supported.\n", __func__);
+ 		return;
  	}
 =20
+ 	adev->gfx.funcs->get_hdp_flush_mask(ring, &ref_and_mask, &reg_mem_engine=
);
  	gfx_v11_0_wait_reg_mem(ring, reg_mem_engine, 0, 1,
  			       adev->nbio.funcs->get_hdp_flush_req_offset(adev),
  			       adev->nbio.funcs->get_hdp_flush_done_offset(adev),
@@@ -6664,7 -6669,7 +6669,7 @@@ static int gfx_v11_0_bad_op_irq(struct=20
  				struct amdgpu_irq_src *source,
  				struct amdgpu_iv_entry *entry)
  {
- 	DRM_ERROR("Illegal opcode in command stream \n");
+ 	DRM_ERROR("Illegal opcode in command stream\n");
  	gfx_v11_0_handle_priv_fault(adev, entry);
  	return 0;
  }
@@@ -6828,7 -6833,7 +6833,7 @@@ static int gfx_v11_0_reset_kgq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio);
+ 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio, 0);
  	if (r) {
 =20
  		dev_warn(adev->dev, "reset via MES failed and try pipe reset %d\n", r);
@@@ -6844,7 -6849,7 +6849,7 @@@
  			return r;
  		}
 =20
- 		r =3D amdgpu_mes_map_legacy_queue(adev, ring);
+ 		r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
  		if (r) {
  			dev_err(adev->dev, "failed to remap kgq\n");
  			return r;
@@@ -6993,7 -6998,7 +6998,7 @@@ static int gfx_v11_0_reset_kcq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, true);
+ 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, true, 0);
  	if (r) {
  		dev_warn(adev->dev, "fail(%d) to reset kcq and try pipe reset\n", r);
  		r =3D gfx_v11_0_reset_compute_pipe(ring);
@@@ -7006,7 -7011,7 +7011,7 @@@
  		dev_err(adev->dev, "fail to init kcq\n");
  		return r;
  	}
- 	r =3D amdgpu_mes_map_legacy_queue(adev, ring);
+ 	r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
  	if (r) {
  		dev_err(adev->dev, "failed to remap kcq\n");
  		return r;
@@@ -7480,7 -7485,7 +7485,7 @@@ static int gfx_v11_0_get_cu_info(struc
  	if (!adev || !cu_info)
  		return -EINVAL;
 =20
- 	amdgpu_gfx_parse_disable_cu(disable_masks, 8, 2);
+ 	amdgpu_gfx_parse_disable_cu(adev, disable_masks, 8, 2);
 =20
  	mutex_lock(&adev->grbm_idx_mutex);
  	for (i =3D 0; i < adev->gfx.config.max_shader_engines; i++) {
diff --combined drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 4aab89a9ab401,79ea1af363a53..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@@ -355,7 -355,8 +355,8 @@@ static void gfx_v12_0_kiq_unmap_queues(
  	uint32_t eng_sel =3D ring->funcs->type =3D=3D AMDGPU_RING_TYPE_GFX ? 4 :=
 0;
 =20
  	if (adev->enable_mes && !adev->gfx.kiq[0].ring.sched.ready) {
- 		amdgpu_mes_unmap_legacy_queue(adev, ring, action, gpu_addr, seq);
+ 		amdgpu_mes_unmap_legacy_queue(adev, ring, action,
+ 					      gpu_addr, seq, 0);
  		return;
  	}
 =20
@@@ -458,8 -459,8 +459,8 @@@ static int gfx_v12_0_ring_test_ring(str
  	WREG32(scratch, 0xCAFEDEAD);
  	r =3D amdgpu_ring_alloc(ring, 5);
  	if (r) {
- 		dev_err(adev->dev,
- 			"amdgpu: cp failed to lock ring %d (%d).\n",
+ 		drm_err(adev_to_drm(adev),
+ 			"cp failed to lock ring %d (%d).\n",
  			ring->idx, r);
  		return r;
  	}
@@@ -516,7 -517,7 +517,7 @@@ static int gfx_v12_0_ring_test_ib(struc
 =20
  	r =3D amdgpu_ib_get(adev, NULL, 16, AMDGPU_IB_POOL_DIRECT, &ib);
  	if (r) {
- 		dev_err(adev->dev, "amdgpu: failed to get ib (%ld).\n", r);
+ 		drm_err(adev_to_drm(adev), "failed to get ib (%ld).\n", r);
  		goto err1;
  	}
 =20
@@@ -760,7 -761,7 +761,7 @@@ static int gfx_v12_0_rlc_init(struct am
 =20
  	/* init spm vmid with 0xf */
  	if (adev->gfx.rlc.funcs->update_spm_vmid)
- 		adev->gfx.rlc.funcs->update_spm_vmid(adev, NULL, 0xf);
+ 		adev->gfx.rlc.funcs->update_spm_vmid(adev, 0, NULL, 0xf);
 =20
  	return 0;
  }
@@@ -908,10 -909,14 +909,14 @@@ static void gfx_v12_0_select_me_pipe_q(
  static void gfx_v12_0_get_gfx_shadow_info_nocheck(struct amdgpu_device *a=
dev,
  						  struct amdgpu_gfx_shadow_info *shadow_info)
  {
+ 	/* for gfx */
  	shadow_info->shadow_size =3D MQD_SHADOW_BASE_SIZE;
  	shadow_info->shadow_alignment =3D MQD_SHADOW_BASE_ALIGNMENT;
  	shadow_info->csa_size =3D MQD_FWWORKAREA_SIZE;
  	shadow_info->csa_alignment =3D MQD_FWWORKAREA_ALIGNMENT;
+ 	/* for compute */
+ 	shadow_info->eop_size =3D GFX12_MEC_HPD_SIZE;
+ 	shadow_info->eop_alignment =3D 256;
  }
 =20
  static int gfx_v12_0_get_gfx_shadow_info(struct amdgpu_device *adev,
@@@ -936,6 -941,7 +941,7 @@@ static const struct amdgpu_gfx_funcs gf
  	.select_me_pipe_q =3D &gfx_v12_0_select_me_pipe_q,
  	.update_perfmon_mgcg =3D &gfx_v12_0_update_perf_clk,
  	.get_gfx_shadow_info =3D &gfx_v12_0_get_gfx_shadow_info,
+ 	.get_hdp_flush_mask =3D &amdgpu_gfx_get_hdp_flush_mask,
  };
 =20
  static int gfx_v12_0_gpu_early_init(struct amdgpu_device *adev)
@@@ -3469,7 -3475,7 +3475,7 @@@ static int gfx_v12_0_cp_resume(struct a
  	}
 =20
  	if (adev->enable_mes_kiq && adev->mes.kiq_hw_init)
- 		r =3D amdgpu_mes_kiq_hw_init(adev);
+ 		r =3D amdgpu_mes_kiq_hw_init(adev, 0);
  	else
  		r =3D gfx_v12_0_kiq_resume(adev);
  	if (r)
@@@ -3650,7 -3656,7 +3656,7 @@@ static int gfx_v12_0_hw_init(struct amd
  	adev->gfx.is_poweron =3D true;
 =20
  	if (get_gb_addr_config(adev))
- 		DRM_WARN("Invalid gb_addr_config !\n");
+ 		drm_warn(adev_to_drm(adev), "Invalid gb_addr_config !\n");
 =20
  	if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP)
  		gfx_v12_0_config_gfx_rs64(adev);
@@@ -3758,7 -3764,7 +3764,7 @@@ static int gfx_v12_0_hw_fini(struct amd
  		if (amdgpu_gfx_disable_kcq(adev, 0))
  			DRM_ERROR("KCQ disable failed\n");
 =20
- 		amdgpu_mes_kiq_hw_fini(adev);
+ 		amdgpu_mes_kiq_hw_fini(adev, 0);
  	}
 =20
  	if (amdgpu_sriov_vf(adev)) {
@@@ -3955,6 -3961,7 +3961,7 @@@ static void gfx_v12_0_update_perf_clk(s
  }
 =20
  static void gfx_v12_0_update_spm_vmid(struct amdgpu_device *adev,
+ 				      int xcc_id,
  				      struct amdgpu_ring *ring,
  				      unsigned vmid)
  {
@@@ -4386,25 -4393,13 +4393,13 @@@ static void gfx_v12_0_ring_emit_hdp_flu
  {
  	struct amdgpu_device *adev =3D ring->adev;
  	u32 ref_and_mask, reg_mem_engine;
- 	const struct nbio_hdp_flush_reg *nbio_hf_reg =3D adev->nbio.hdp_flush_re=
g;
 =20
- 	if (ring->funcs->type =3D=3D AMDGPU_RING_TYPE_COMPUTE) {
- 		switch (ring->me) {
- 		case 1:
- 			ref_and_mask =3D nbio_hf_reg->ref_and_mask_cp2 << ring->pipe;
- 			break;
- 		case 2:
- 			ref_and_mask =3D nbio_hf_reg->ref_and_mask_cp6 << ring->pipe;
- 			break;
- 		default:
- 			return;
- 		}
- 		reg_mem_engine =3D 0;
- 	} else {
- 		ref_and_mask =3D nbio_hf_reg->ref_and_mask_cp0;
- 		reg_mem_engine =3D 1; /* pfp */
+ 	if (!adev->gfx.funcs->get_hdp_flush_mask) {
+ 		dev_err(adev->dev, "%s: gfx hdp flush is not supported.\n", __func__);
+ 		return;
  	}
 =20
+ 	adev->gfx.funcs->get_hdp_flush_mask(ring, &ref_and_mask, &reg_mem_engine=
);
  	gfx_v12_0_wait_reg_mem(ring, reg_mem_engine, 0, 1,
  			       adev->nbio.funcs->get_hdp_flush_req_offset(adev),
  			       adev->nbio.funcs->get_hdp_flush_done_offset(adev),
@@@ -5040,7 -5035,7 +5035,7 @@@ static int gfx_v12_0_bad_op_irq(struct=20
  				struct amdgpu_irq_src *source,
  				struct amdgpu_iv_entry *entry)
  {
- 	DRM_ERROR("Illegal opcode in command stream \n");
+ 	DRM_ERROR("Illegal opcode in command stream\n");
  	gfx_v12_0_handle_priv_fault(adev, entry);
  	return 0;
  }
@@@ -5302,7 -5297,7 +5297,7 @@@ static int gfx_v12_0_reset_kgq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio);
+ 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio, 0);
  	if (r) {
  		dev_warn(adev->dev, "reset via MES failed and try pipe reset %d\n", r);
  		r =3D gfx_v12_reset_gfx_pipe(ring);
@@@ -5317,7 -5312,7 +5312,7 @@@
  			return r;
  		}
 =20
- 		r =3D amdgpu_mes_map_legacy_queue(adev, ring);
+ 		r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
  		if (r) {
  			dev_err(adev->dev, "failed to remap kgq\n");
  			return r;
@@@ -5419,7 -5414,7 +5414,7 @@@ static int gfx_v12_0_reset_kcq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, true);
+ 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, true, 0);
  	if (r) {
  		dev_warn(adev->dev, "fail(%d) to reset kcq  and try pipe reset\n", r);
  		r =3D gfx_v12_0_reset_compute_pipe(ring);
@@@ -5432,7 -5427,7 +5427,7 @@@
  		dev_err(adev->dev, "failed to init kcq\n");
  		return r;
  	}
- 	r =3D amdgpu_mes_map_legacy_queue(adev, ring);
+ 	r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
  	if (r) {
  		dev_err(adev->dev, "failed to remap kcq\n");
  		return r;
@@@ -5724,7 -5719,7 +5719,7 @@@ static int gfx_v12_0_get_cu_info(struc
  	if (!adev || !cu_info)
  		return -EINVAL;
 =20
- 	amdgpu_gfx_parse_disable_cu(disable_masks, 8, 2);
+ 	amdgpu_gfx_parse_disable_cu(adev, disable_masks, 8, 2);
 =20
  	mutex_lock(&adev->grbm_idx_mutex);
  	for (i =3D 0; i < adev->gfx.config.max_shader_engines; i++) {

--8v59VJ8uYhvNlyh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAtOIACgkQJNaLcl1U
h9APXgf+LA+Dte69OMKZ3icUUfgH0B7nn8pUMZMeT79chQhNcCruWj8s2PHlKYpU
VCzY1rAShCSq3uPldSX+2k4ikGX0hlX3UJmDcFU3emtwUYc/EU3TyBCiKLXZhU21
Gkra1qe95NQXOTSdiOmqLBwRMUBrdz2Bx+zQ7cMFjratWDpLHxDMoe6YwO0qVwkv
Tw3t2FzkY5YlVQCFTFIR1yfDT75X/+UNbLs4JxbHWJGLM1nrLZ5oT5MYQ0I+LWfi
hVdamnZXpg/MLdtqPo5j+Ybyay4t0Lsm3/4jJcL5wSmpO22JRTCoe81p95ZMello
3wySToZ/3jJOX2SRaVFInQiBICJRqw==
=iP/o
-----END PGP SIGNATURE-----

--8v59VJ8uYhvNlyh4--
