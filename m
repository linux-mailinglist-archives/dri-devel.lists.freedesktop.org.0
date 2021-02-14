Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8AF31B2F3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 23:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D2889BAE;
	Sun, 14 Feb 2021 22:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D350289B95
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 22:07:57 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1ZH3TxNz9sCD;
 Mon, 15 Feb 2021 09:07:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1613340474;
 bh=T6vKJLf8K1ImqLZ0H0gH4EVJO5DREMNbD0S+Klgld0Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=psHJEoeb4dg77+in/XY8RU4x1mgmbmOsaIeIvNF6PHJO/A0xXmbUAiQ73815U8qEu
 nXwKK6039EK061WaHcUb933iexd9OqGNqvRYXOBDrks3v0hkwrdI3y+Cxye6m1DI58
 BGiiZK0x8Espj3gz+cU+LV1ZLDb3ICn53T6YSim1qRop0N/tDIQ4JYSPMlnjb4/S6s
 lP4kcZ70h5C5JyfzNQGPssFzH/wSh/GjSoRcBIfie0EDzxKoa6LxioqH6M2QstNvOL
 LZSSVhRhfOUFBAQnGGx/aurkdW2V9rTrBx2gN4kFIWANbmfZB0+Hj+RP0cyGN5JYV5
 vb2dHABYqsjtw==
Date: Mon, 15 Feb 2021 09:07:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210215090750.47bff3b6@canb.auug.org.au>
In-Reply-To: <20210201123012.139b3978@canb.auug.org.au>
References: <20210201123012.139b3978@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============1726133213=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1726133213==
Content-Type: multipart/signed; boundary="Sig_/SoXVXKz8=V0HvaYI9nRVo/M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SoXVXKz8=V0HvaYI9nRVo/M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Feb 2021 12:30:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
>=20
> between commit:
>=20
>   a119f87b86bc ("Revert "drm/amdgpu/swsmu: drop set_fan_speed_percent (v2=
)"")
>=20
> from Linus' tree and commit:
>=20
>   d8a0b8dd690b ("drm/amd/pm: add pptable_funcs documentation (v3)")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> index 0d797fa9f5cc,a087e00382e6..000000000000
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> @@@ -551,39 -924,199 +924,201 @@@ struct pptable_funcs=20
>   	int (*display_clock_voltage_request)(struct smu_context *smu, struct
>   					     pp_display_clock_request
>   					     *clock_req);
> +=20
> + 	/**
> + 	 * @get_fan_control_mode: Get the current fan control mode.
> + 	 */
>   	uint32_t (*get_fan_control_mode)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @set_fan_control_mode: Set the fan control mode.
> + 	 */
>   	int (*set_fan_control_mode)(struct smu_context *smu, uint32_t mode);
> +=20
>  +	int (*set_fan_speed_percent)(struct smu_context *smu, uint32_t speed);
> ++
> + 	/**
> + 	 * @set_fan_speed_rpm: Set a static fan speed in RPM.
> + 	 */
>   	int (*set_fan_speed_rpm)(struct smu_context *smu, uint32_t speed);
> +=20
> + 	/**
> + 	 * @set_xgmi_pstate: Set inter-chip global memory interconnect pstate.
> + 	 * &pstate: Pstate to set. D0 if Nonzero, D3 otherwise.
> + 	 */
>   	int (*set_xgmi_pstate)(struct smu_context *smu, uint32_t pstate);
> +=20
> + 	/**
> + 	 * @gfx_off_control: Enable/disable graphics engine poweroff.
> + 	 */
>   	int (*gfx_off_control)(struct smu_context *smu, bool enable);
> +=20
> +=20
> + 	/**
> + 	 * @get_gfx_off_status: Get graphics engine poweroff status.
> + 	 *
> + 	 * Return:
> + 	 * 0 - GFXOFF(default).
> + 	 * 1 - Transition out of GFX State.
> + 	 * 2 - Not in GFXOFF.
> + 	 * 3 - Transition into GFXOFF.
> + 	 */
>   	uint32_t (*get_gfx_off_status)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @register_irq_handler: Register interupt request handlers.
> + 	 */
>   	int (*register_irq_handler)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @set_azalia_d3_pme: Wake the audio decode engine from d3 sleep.
> + 	 */
>   	int (*set_azalia_d3_pme)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @get_max_sustainable_clocks_by_dc: Get a copy of the max sustainable
> + 	 *                                    clock speeds table.
> + 	 *
> + 	 * Provides a way for the display component (DC) to get the max
> + 	 * sustainable clocks from the SMU.
> + 	 */
>   	int (*get_max_sustainable_clocks_by_dc)(struct smu_context *smu, struc=
t pp_smu_nv_clock_table *max_clocks);
> +=20
> + 	/**
> + 	 * @baco_is_support: Check if GPU supports BACO (Bus Active, Chip Off).
> + 	 */
>   	bool (*baco_is_support)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @baco_get_state: Get the current BACO state.
> + 	 *
> + 	 * Return: Current BACO state.
> + 	 */
>   	enum smu_baco_state (*baco_get_state)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @baco_set_state: Enter/exit BACO.
> + 	 */
>   	int (*baco_set_state)(struct smu_context *smu, enum smu_baco_state sta=
te);
> +=20
> + 	/**
> + 	 * @baco_enter: Enter BACO.
> + 	 */
>   	int (*baco_enter)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @baco_exit: Exit Baco.
> + 	 */
>   	int (*baco_exit)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @mode1_reset_is_support: Check if GPU supports mode1 reset.
> + 	 */
>   	bool (*mode1_reset_is_support)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @mode1_reset: Perform mode1 reset.
> + 	 *
> + 	 * Complete GPU reset.
> + 	 */
>   	int (*mode1_reset)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @mode2_reset: Perform mode2 reset.
> + 	 *
> + 	 * Mode2 reset generally does not reset as many IPs as mode1 reset. The
> + 	 * IPs reset varies by asic.
> + 	 */
>   	int (*mode2_reset)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @get_dpm_ultimate_freq: Get the hard frequency range of a clock
> + 	 *                         domain in MHz.
> + 	 */
>   	int (*get_dpm_ultimate_freq)(struct smu_context *smu, enum smu_clk_typ=
e clk_type, uint32_t *min, uint32_t *max);
> +=20
> + 	/**
> + 	 * @set_soft_freq_limited_range: Set the soft frequency range of a clo=
ck
> + 	 *                               domain in MHz.
> + 	 */
>   	int (*set_soft_freq_limited_range)(struct smu_context *smu, enum smu_c=
lk_type clk_type, uint32_t min, uint32_t max);
> +=20
> + 	/**
> + 	 * @set_power_source: Notify the SMU of the current power source.
> + 	 */
>   	int (*set_power_source)(struct smu_context *smu, enum smu_power_src_ty=
pe power_src);
> +=20
> + 	/**
> + 	 * @log_thermal_throttling_event: Print a thermal throttling warning to
> + 	 *                                the system's log.
> + 	 */
>   	void (*log_thermal_throttling_event)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @get_pp_feature_mask: Print a human readable table of enabled
> + 	 *                       features to buffer.
> + 	 */
>   	size_t (*get_pp_feature_mask)(struct smu_context *smu, char *buf);
> +=20
> + 	/**
> + 	 * @set_pp_feature_mask: Request the SMU enable/disable features to
> + 	 *                       match those enabled in &new_mask.
> + 	 */
>   	int (*set_pp_feature_mask)(struct smu_context *smu, uint64_t new_mask);
> +=20
> + 	/**
> + 	 * @get_gpu_metrics: Get a copy of the GPU metrics table from the SMU.
> + 	 *
> + 	 * Return: Size of &table
> + 	 */
>   	ssize_t (*get_gpu_metrics)(struct smu_context *smu, void **table);
> +=20
> + 	/**
> + 	 * @enable_mgpu_fan_boost: Enable multi-GPU fan boost.
> + 	 */
>   	int (*enable_mgpu_fan_boost)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @gfx_ulv_control: Enable/disable ultra low voltage.
> + 	 */
>   	int (*gfx_ulv_control)(struct smu_context *smu, bool enablement);
> +=20
> + 	/**
> + 	 * @deep_sleep_control: Enable/disable deep sleep.
> + 	 */
>   	int (*deep_sleep_control)(struct smu_context *smu, bool enablement);
> +=20
> + 	/**
> + 	 * @get_fan_parameters: Get fan parameters.
> + 	 *
> + 	 * Get maximum fan speed from the power play table.
> + 	 */
>   	int (*get_fan_parameters)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @post_init: Helper function for asic specific workarounds.
> + 	 */
>   	int (*post_init)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @interrupt_work: Work task scheduled from SMU interrupt handler.
> + 	 */
>   	void (*interrupt_work)(struct smu_context *smu);
> +=20
> + 	/**
> + 	 * @gpo_control: Enable/disable graphics power optimization if support=
ed.
> + 	 */
>   	int (*gpo_control)(struct smu_context *smu, bool enablement);
> +=20
> + 	/**
> + 	 * @gfx_state_change_set: Send the current graphics state to the SMU.
> + 	 */
>   	int (*gfx_state_change_set)(struct smu_context *smu, uint32_t state);
> +=20
> + 	/**
> + 	 * @set_fine_grain_gfx_freq_parameters: Set fine grain graphics clock
> + 	 *                                      parameters to defaults.
> + 	 */
>   	int (*set_fine_grain_gfx_freq_parameters)(struct smu_context *smu);
>   };
>  =20

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/SoXVXKz8=V0HvaYI9nRVo/M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApnzYACgkQAVBC80lX
0GxIdQf+LfMOX24iNRnSuo6tXsIlTiYnuzr66hyRKjrBDnX9yh1NYX9g3g3WqiVi
kZcXQLg2Zzf0YdIICkAwRnZyYnAPNmad5gxDZQFboUssHmWHDB7NznYeLyfJmvfi
3RKIwxpdqAXAEvmJmHQeZVig3abwaGsvkFWYflzJ7kuuh5RgTZQr8H1YqwLqDlYV
y94YjyOpx3dJE98dO26I7U0nPgqmQBxCSyNZLZ1xQbt8ckTBbC26kX2xk8WoMDVB
v64QGD4pk+VJHVhuAlY1KJplnkvXxDs/q04I3RKveMHpTFo6/bVKq844StdNWPSg
hD2wOZdsqnzBGWIj3jDfR17wD1pogg==
=AXK9
-----END PGP SIGNATURE-----

--Sig_/SoXVXKz8=V0HvaYI9nRVo/M--

--===============1726133213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1726133213==--
