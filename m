Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2130A005
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 02:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9976E3B7;
	Mon,  1 Feb 2021 01:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CFB6E3B7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 01:30:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DTVkG4qY8z9sWK;
 Mon,  1 Feb 2021 12:30:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1612143015;
 bh=Wd/JJ/E6TrflMwIVwOUxitkADKWzVU0gMA6MHK+LKoI=;
 h=Date:From:To:Cc:Subject:From;
 b=pwXRPWqISOUS3l4PaZ2U4l+9Z5E/zgtZXxoOsDq1prt5fUjdJEyiMduyapjJONl5/
 /JL3evWpY2HRpfiIe1Z8eRDC+7OXYp/al/4URgiB3XWSf4MzbI2W0Qgt/300aotrHa
 dj83ZiFQVsjIyHceKnHNzNNnZflKcSOejH47uqJGIC+Sn9Knzu2+bxZRKJbj8P7WEN
 mXAmMrvUvaIFGF7Mn1bicoewGK5Abie0m606WM2yeL8ulqCCHeBX3q4QpuJ0RKKhPO
 8bGm5w1o/L3LuvH9+I3U6T+pSfyZU51uQ/XDixAhNBvQwHTUMNdYHKDE6DjARCdxK6
 dxYFiqLYCXwXQ==
Date: Mon, 1 Feb 2021 12:30:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210201123012.139b3978@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ryan Taylor <Ryan.Taylor@amd.com>
Content-Type: multipart/mixed; boundary="===============1261254580=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1261254580==
Content-Type: multipart/signed; boundary="Sig_/PENRfj1yECN9OdfCURPFU4w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PENRfj1yECN9OdfCURPFU4w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h

between commit:

  a119f87b86bc ("Revert "drm/amdgpu/swsmu: drop set_fan_speed_percent (v2)"=
")

from Linus' tree and commit:

  d8a0b8dd690b ("drm/amd/pm: add pptable_funcs documentation (v3)")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
index 0d797fa9f5cc,a087e00382e6..000000000000
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
@@@ -551,39 -924,199 +924,201 @@@ struct pptable_funcs=20
  	int (*display_clock_voltage_request)(struct smu_context *smu, struct
  					     pp_display_clock_request
  					     *clock_req);
+=20
+ 	/**
+ 	 * @get_fan_control_mode: Get the current fan control mode.
+ 	 */
  	uint32_t (*get_fan_control_mode)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @set_fan_control_mode: Set the fan control mode.
+ 	 */
  	int (*set_fan_control_mode)(struct smu_context *smu, uint32_t mode);
+=20
 +	int (*set_fan_speed_percent)(struct smu_context *smu, uint32_t speed);
++
+ 	/**
+ 	 * @set_fan_speed_rpm: Set a static fan speed in RPM.
+ 	 */
  	int (*set_fan_speed_rpm)(struct smu_context *smu, uint32_t speed);
+=20
+ 	/**
+ 	 * @set_xgmi_pstate: Set inter-chip global memory interconnect pstate.
+ 	 * &pstate: Pstate to set. D0 if Nonzero, D3 otherwise.
+ 	 */
  	int (*set_xgmi_pstate)(struct smu_context *smu, uint32_t pstate);
+=20
+ 	/**
+ 	 * @gfx_off_control: Enable/disable graphics engine poweroff.
+ 	 */
  	int (*gfx_off_control)(struct smu_context *smu, bool enable);
+=20
+=20
+ 	/**
+ 	 * @get_gfx_off_status: Get graphics engine poweroff status.
+ 	 *
+ 	 * Return:
+ 	 * 0 - GFXOFF(default).
+ 	 * 1 - Transition out of GFX State.
+ 	 * 2 - Not in GFXOFF.
+ 	 * 3 - Transition into GFXOFF.
+ 	 */
  	uint32_t (*get_gfx_off_status)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @register_irq_handler: Register interupt request handlers.
+ 	 */
  	int (*register_irq_handler)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @set_azalia_d3_pme: Wake the audio decode engine from d3 sleep.
+ 	 */
  	int (*set_azalia_d3_pme)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @get_max_sustainable_clocks_by_dc: Get a copy of the max sustainable
+ 	 *                                    clock speeds table.
+ 	 *
+ 	 * Provides a way for the display component (DC) to get the max
+ 	 * sustainable clocks from the SMU.
+ 	 */
  	int (*get_max_sustainable_clocks_by_dc)(struct smu_context *smu, struct =
pp_smu_nv_clock_table *max_clocks);
+=20
+ 	/**
+ 	 * @baco_is_support: Check if GPU supports BACO (Bus Active, Chip Off).
+ 	 */
  	bool (*baco_is_support)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @baco_get_state: Get the current BACO state.
+ 	 *
+ 	 * Return: Current BACO state.
+ 	 */
  	enum smu_baco_state (*baco_get_state)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @baco_set_state: Enter/exit BACO.
+ 	 */
  	int (*baco_set_state)(struct smu_context *smu, enum smu_baco_state state=
);
+=20
+ 	/**
+ 	 * @baco_enter: Enter BACO.
+ 	 */
  	int (*baco_enter)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @baco_exit: Exit Baco.
+ 	 */
  	int (*baco_exit)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @mode1_reset_is_support: Check if GPU supports mode1 reset.
+ 	 */
  	bool (*mode1_reset_is_support)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @mode1_reset: Perform mode1 reset.
+ 	 *
+ 	 * Complete GPU reset.
+ 	 */
  	int (*mode1_reset)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @mode2_reset: Perform mode2 reset.
+ 	 *
+ 	 * Mode2 reset generally does not reset as many IPs as mode1 reset. The
+ 	 * IPs reset varies by asic.
+ 	 */
  	int (*mode2_reset)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @get_dpm_ultimate_freq: Get the hard frequency range of a clock
+ 	 *                         domain in MHz.
+ 	 */
  	int (*get_dpm_ultimate_freq)(struct smu_context *smu, enum smu_clk_type =
clk_type, uint32_t *min, uint32_t *max);
+=20
+ 	/**
+ 	 * @set_soft_freq_limited_range: Set the soft frequency range of a clock
+ 	 *                               domain in MHz.
+ 	 */
  	int (*set_soft_freq_limited_range)(struct smu_context *smu, enum smu_clk=
_type clk_type, uint32_t min, uint32_t max);
+=20
+ 	/**
+ 	 * @set_power_source: Notify the SMU of the current power source.
+ 	 */
  	int (*set_power_source)(struct smu_context *smu, enum smu_power_src_type=
 power_src);
+=20
+ 	/**
+ 	 * @log_thermal_throttling_event: Print a thermal throttling warning to
+ 	 *                                the system's log.
+ 	 */
  	void (*log_thermal_throttling_event)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @get_pp_feature_mask: Print a human readable table of enabled
+ 	 *                       features to buffer.
+ 	 */
  	size_t (*get_pp_feature_mask)(struct smu_context *smu, char *buf);
+=20
+ 	/**
+ 	 * @set_pp_feature_mask: Request the SMU enable/disable features to
+ 	 *                       match those enabled in &new_mask.
+ 	 */
  	int (*set_pp_feature_mask)(struct smu_context *smu, uint64_t new_mask);
+=20
+ 	/**
+ 	 * @get_gpu_metrics: Get a copy of the GPU metrics table from the SMU.
+ 	 *
+ 	 * Return: Size of &table
+ 	 */
  	ssize_t (*get_gpu_metrics)(struct smu_context *smu, void **table);
+=20
+ 	/**
+ 	 * @enable_mgpu_fan_boost: Enable multi-GPU fan boost.
+ 	 */
  	int (*enable_mgpu_fan_boost)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @gfx_ulv_control: Enable/disable ultra low voltage.
+ 	 */
  	int (*gfx_ulv_control)(struct smu_context *smu, bool enablement);
+=20
+ 	/**
+ 	 * @deep_sleep_control: Enable/disable deep sleep.
+ 	 */
  	int (*deep_sleep_control)(struct smu_context *smu, bool enablement);
+=20
+ 	/**
+ 	 * @get_fan_parameters: Get fan parameters.
+ 	 *
+ 	 * Get maximum fan speed from the power play table.
+ 	 */
  	int (*get_fan_parameters)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @post_init: Helper function for asic specific workarounds.
+ 	 */
  	int (*post_init)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @interrupt_work: Work task scheduled from SMU interrupt handler.
+ 	 */
  	void (*interrupt_work)(struct smu_context *smu);
+=20
+ 	/**
+ 	 * @gpo_control: Enable/disable graphics power optimization if supported.
+ 	 */
  	int (*gpo_control)(struct smu_context *smu, bool enablement);
+=20
+ 	/**
+ 	 * @gfx_state_change_set: Send the current graphics state to the SMU.
+ 	 */
  	int (*gfx_state_change_set)(struct smu_context *smu, uint32_t state);
+=20
+ 	/**
+ 	 * @set_fine_grain_gfx_freq_parameters: Set fine grain graphics clock
+ 	 *                                      parameters to defaults.
+ 	 */
  	int (*set_fine_grain_gfx_freq_parameters)(struct smu_context *smu);
  };
 =20

--Sig_/PENRfj1yECN9OdfCURPFU4w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAXWaQACgkQAVBC80lX
0GwkQQf9E7MEupOfkVMchGQAmn6KeyNQdBJsDnRC53GCqQMcDbxPjX0+kLP9Lp36
GBSIcVB5NcUYFFDkLENGjzefe72SvpSbi8i0GqmqCMMAphHA/AsU24ze5xDs0aa/
V+9Abt6wh9vu11RgV6DO9i5NGSDpxoSnMU2LOie2F/R4gDRCd3wo5DTVznRZ53Fk
jZm2FYdlqjmVrILYIr1nkmAF08fgiTFPPOx549tzjZIq7aS+V4cgdHyvPAbAQy9L
OPNXoKwtC7ODXkV1hKzSQQcUN9ZIN9DODprw0j6u2UXrqkP+t+xCJpGMw0/fslg4
hScFkhnHCFzwo4u17SEF1FrTbqT/Jw==
=WLAW
-----END PGP SIGNATURE-----

--Sig_/PENRfj1yECN9OdfCURPFU4w--

--===============1261254580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1261254580==--
