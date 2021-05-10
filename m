Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5F737990E
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543E86E8EF;
	Mon, 10 May 2021 21:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEF06E8EF;
 Mon, 10 May 2021 21:19:33 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 t4-20020a05683014c4b02902ed26dd7a60so5592518otq.7; 
 Mon, 10 May 2021 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgiRVUXCXPHXBKz166iI6xl5AvVf4h0tb4nrwPEB7L8=;
 b=G6dZE6/mDmSzdZTpjv1mFodYMGNWn9inz4O3v29i1zBf8GFoHDLcV9bNy4UjpWGDYT
 2tI+ZLORnzAFLTvyq65tnfYyI8GgGuHm5dkZFrw9yK/hHGdVrXGuPi4YvDCdRsZNMOaI
 tjts+aG+/2PM+csyojIPoNlt5awKwqCX/kB0xSOigmNa4hNj+Vv9dNnWJlLuadbHoa9e
 j5vE3YnBbC0UMXyAd8JKrI/32yPjysH9SBih5jOrU4XCKsyrckkTqBXhekWy5qgSTFar
 BWh3m21Lfp9AIi8WM0Ui8O0o+t2sg/IsLKEhLxa7/dkRTGf5PrU/bTCY3veeerr2CDtG
 ylBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgiRVUXCXPHXBKz166iI6xl5AvVf4h0tb4nrwPEB7L8=;
 b=dGKb3oLq4vp8TxLcKzYisO5yZ8WR0IA5sLLfl6u8exvFvA9ASSLVWt6SZnR2yjsw/c
 RthCPfBETMDFo3Q8zB70H55H8/Fnlkvu0SG2VAZ1SVEAwpGfY+CzlvtSXRmyznZhVNFz
 jF6fBGW0WFliS5vgASgzxvJHoZWPt4OweRcvSpkcx1Do+7eLM6rBJ0JknJG7CEhJldL7
 GmkDN34STbAcJSYODtDXhpXo2HobvMC3jzKNYB6FydTOGHuoVIdLDnCo48kqNS4obIyc
 6wM9ffQDgZVZ3HZOOSqK0o9bO4oBsJzCLl54215HJknr6ormBn3DwLG+vY2Ua4dZzhoG
 OzgQ==
X-Gm-Message-State: AOAM5336lNZzIuSe3ePn+fZvIelDKYGOWjsN4ETUSbfznANYmtqivRd9
 d6o871fmJdHrHVR+3t5zw7DXS/kC4lJA4VtS8VA=
X-Google-Smtp-Source: ABdhPJxdSSxkEaG5dqFZllkN4APrrX+4kYXaMcoSgVp/RxoIOerWkOUDnHct8AfvfWuZbDIz5bslRr6GASkftVnRX20=
X-Received: by 2002:a9d:51c6:: with SMTP id d6mr16692880oth.311.1620681572267; 
 Mon, 10 May 2021 14:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210509225525.GA32045@embeddedor>
 <CAAd53p6uVMVAS97Zj4GWeq79Gw-ow4rZd9wqj=wbfi3V=u4ipQ@mail.gmail.com>
In-Reply-To: <CAAd53p6uVMVAS97Zj4GWeq79Gw-ow4rZd9wqj=wbfi3V=u4ipQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 May 2021 17:19:21 -0400
Message-ID: <CADnq5_NXzYoM+8xu55n+oEKEkx6=HsHbq3-Zxe_QegWd2MDKnA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/si_dpm: Fix SMU power state load
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 10, 2021 at 1:51 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Mon, May 10, 2021 at 6:54 AM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > Create new structure SISLANDS_SMC_SWSTATE_SINGLE, as initialState.levels
> > and ACPIState.levels are never actually used as flexible arrays. Those
> > arrays can be used as simple objects of type
> > SISLANDS_SMC_HW_PERFORMANCE_LEVEL, instead.
> >
> > Currently, the code fails because flexible array _levels_ in
> > struct SISLANDS_SMC_SWSTATE doesn't allow for code that access
> > the first element of initialState.levels and ACPIState.levels
> > arrays:
> >
> > 4353         table->initialState.levels[0].mclk.vDLL_CNTL =
> > 4354                 cpu_to_be32(si_pi->clock_registers.dll_cntl);
> > ...
> > 4555         table->ACPIState.levels[0].mclk.vDLL_CNTL =
> > 4556                 cpu_to_be32(dll_cntl);
> >
> > because such element cannot exist without previously allocating
> > any dynamic memory for it (which never actually happens).
> >
> > That's why struct SISLANDS_SMC_SWSTATE should only be used as type
> > for object driverState and new struct SISLANDS_SMC_SWSTATE_SINGLE is
> > created as type for objects initialState, ACPIState and ULVState.
> >
> > Also, with the change from one-element array to flexible-array member
> > in commit 96e27e8d919e ("drm/radeon/si_dpm: Replace one-element array
> > with flexible-array in struct SISLANDS_SMC_SWSTATE"), the size of
> > dpmLevels in struct SISLANDS_SMC_STATETABLE should be fixed to be
> > SISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE instead of
> > SISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1.
> >
> > Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1583
> > Fixes: 96e27e8d919e ("drm/radeon/si_dpm: Replace one-element array with flexible-array in struct SISLANDS_SMC_SWSTATE")
> > Cc: stable@vger.kernel.org
> > Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> > ---
> >  drivers/gpu/drm/radeon/si_dpm.c       | 174 +++++++++++++-------------
> >  drivers/gpu/drm/radeon/sislands_smc.h |  34 +++--
> >  2 files changed, 109 insertions(+), 99 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
> > index 91bfc4762767..2a8b9680cf6b 100644
> > --- a/drivers/gpu/drm/radeon/si_dpm.c
> > +++ b/drivers/gpu/drm/radeon/si_dpm.c
> > @@ -4350,70 +4350,70 @@ static int si_populate_smc_initial_state(struct radeon_device *rdev,
> >         u32 reg;
> >         int ret;
> >
> > -       table->initialState.levels[0].mclk.vDLL_CNTL =
> > +       table->initialState.level.mclk.vDLL_CNTL =
> >                 cpu_to_be32(si_pi->clock_registers.dll_cntl);
> > -       table->initialState.levels[0].mclk.vMCLK_PWRMGT_CNTL =
> > +       table->initialState.level.mclk.vMCLK_PWRMGT_CNTL =
> >                 cpu_to_be32(si_pi->clock_registers.mclk_pwrmgt_cntl);
> > -       table->initialState.levels[0].mclk.vMPLL_AD_FUNC_CNTL =
> > +       table->initialState.level.mclk.vMPLL_AD_FUNC_CNTL =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_ad_func_cntl);
> > -       table->initialState.levels[0].mclk.vMPLL_DQ_FUNC_CNTL =
> > +       table->initialState.level.mclk.vMPLL_DQ_FUNC_CNTL =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_dq_func_cntl);
> > -       table->initialState.levels[0].mclk.vMPLL_FUNC_CNTL =
> > +       table->initialState.level.mclk.vMPLL_FUNC_CNTL =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_func_cntl);
> > -       table->initialState.levels[0].mclk.vMPLL_FUNC_CNTL_1 =
> > +       table->initialState.level.mclk.vMPLL_FUNC_CNTL_1 =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_func_cntl_1);
> > -       table->initialState.levels[0].mclk.vMPLL_FUNC_CNTL_2 =
> > +       table->initialState.level.mclk.vMPLL_FUNC_CNTL_2 =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_func_cntl_2);
> > -       table->initialState.levels[0].mclk.vMPLL_SS =
> > +       table->initialState.level.mclk.vMPLL_SS =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_ss1);
> > -       table->initialState.levels[0].mclk.vMPLL_SS2 =
> > +       table->initialState.level.mclk.vMPLL_SS2 =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_ss2);
> >
> > -       table->initialState.levels[0].mclk.mclk_value =
> > +       table->initialState.level.mclk.mclk_value =
> >                 cpu_to_be32(initial_state->performance_levels[0].mclk);
> >
> > -       table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL =
> > +       table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL =
> >                 cpu_to_be32(si_pi->clock_registers.cg_spll_func_cntl);
> > -       table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_2 =
> > +       table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL_2 =
> >                 cpu_to_be32(si_pi->clock_registers.cg_spll_func_cntl_2);
> > -       table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_3 =
> > +       table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL_3 =
> >                 cpu_to_be32(si_pi->clock_registers.cg_spll_func_cntl_3);
> > -       table->initialState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_4 =
> > +       table->initialState.level.sclk.vCG_SPLL_FUNC_CNTL_4 =
> >                 cpu_to_be32(si_pi->clock_registers.cg_spll_func_cntl_4);
> > -       table->initialState.levels[0].sclk.vCG_SPLL_SPREAD_SPECTRUM =
> > +       table->initialState.level.sclk.vCG_SPLL_SPREAD_SPECTRUM =
> >                 cpu_to_be32(si_pi->clock_registers.cg_spll_spread_spectrum);
> > -       table->initialState.levels[0].sclk.vCG_SPLL_SPREAD_SPECTRUM_2  =
> > +       table->initialState.level.sclk.vCG_SPLL_SPREAD_SPECTRUM_2  =
> >                 cpu_to_be32(si_pi->clock_registers.cg_spll_spread_spectrum_2);
> >
> > -       table->initialState.levels[0].sclk.sclk_value =
> > +       table->initialState.level.sclk.sclk_value =
> >                 cpu_to_be32(initial_state->performance_levels[0].sclk);
> >
> > -       table->initialState.levels[0].arbRefreshState =
> > +       table->initialState.level.arbRefreshState =
> >                 SISLANDS_INITIAL_STATE_ARB_INDEX;
> >
> > -       table->initialState.levels[0].ACIndex = 0;
> > +       table->initialState.level.ACIndex = 0;
> >
> >         ret = si_populate_voltage_value(rdev, &eg_pi->vddc_voltage_table,
> >                                         initial_state->performance_levels[0].vddc,
> > -                                       &table->initialState.levels[0].vddc);
> > +                                       &table->initialState.level.vddc);
> >
> >         if (!ret) {
> >                 u16 std_vddc;
> >
> >                 ret = si_get_std_voltage_value(rdev,
> > -                                              &table->initialState.levels[0].vddc,
> > +                                              &table->initialState.level.vddc,
> >                                                &std_vddc);
> >                 if (!ret)
> >                         si_populate_std_voltage_value(rdev, std_vddc,
> > -                                                     table->initialState.levels[0].vddc.index,
> > -                                                     &table->initialState.levels[0].std_vddc);
> > +                                                     table->initialState.level.vddc.index,
> > +                                                     &table->initialState.level.std_vddc);
> >         }
> >
> >         if (eg_pi->vddci_control)
> >                 si_populate_voltage_value(rdev,
> >                                           &eg_pi->vddci_voltage_table,
> >                                           initial_state->performance_levels[0].vddci,
> > -                                         &table->initialState.levels[0].vddci);
> > +                                         &table->initialState.level.vddci);
> >
> >         if (si_pi->vddc_phase_shed_control)
> >                 si_populate_phase_shedding_value(rdev,
> > @@ -4421,43 +4421,43 @@ static int si_populate_smc_initial_state(struct radeon_device *rdev,
> >                                                  initial_state->performance_levels[0].vddc,
> >                                                  initial_state->performance_levels[0].sclk,
> >                                                  initial_state->performance_levels[0].mclk,
> > -                                                &table->initialState.levels[0].vddc);
> > +                                                &table->initialState.level.vddc);
> >
> > -       si_populate_initial_mvdd_value(rdev, &table->initialState.levels[0].mvdd);
> > +       si_populate_initial_mvdd_value(rdev, &table->initialState.level.mvdd);
> >
> >         reg = CG_R(0xffff) | CG_L(0);
> > -       table->initialState.levels[0].aT = cpu_to_be32(reg);
> > +       table->initialState.level.aT = cpu_to_be32(reg);
> >
> > -       table->initialState.levels[0].bSP = cpu_to_be32(pi->dsp);
> > +       table->initialState.level.bSP = cpu_to_be32(pi->dsp);
> >
> > -       table->initialState.levels[0].gen2PCIE = (u8)si_pi->boot_pcie_gen;
> > +       table->initialState.level.gen2PCIE = (u8)si_pi->boot_pcie_gen;
> >
> >         if (pi->mem_gddr5) {
> > -               table->initialState.levels[0].strobeMode =
> > +               table->initialState.level.strobeMode =
> >                         si_get_strobe_mode_settings(rdev,
> >                                                     initial_state->performance_levels[0].mclk);
> >
> >                 if (initial_state->performance_levels[0].mclk > pi->mclk_edc_enable_threshold)
> > -                       table->initialState.levels[0].mcFlags = SISLANDS_SMC_MC_EDC_RD_FLAG | SISLANDS_SMC_MC_EDC_WR_FLAG;
> > +                       table->initialState.level.mcFlags = SISLANDS_SMC_MC_EDC_RD_FLAG | SISLANDS_SMC_MC_EDC_WR_FLAG;
> >                 else
> > -                       table->initialState.levels[0].mcFlags =  0;
> > +                       table->initialState.level.mcFlags =  0;
> >         }
> >
> >         table->initialState.levelCount = 1;
> >
> >         table->initialState.flags |= PPSMC_SWSTATE_FLAG_DC;
> >
> > -       table->initialState.levels[0].dpm2.MaxPS = 0;
> > -       table->initialState.levels[0].dpm2.NearTDPDec = 0;
> > -       table->initialState.levels[0].dpm2.AboveSafeInc = 0;
> > -       table->initialState.levels[0].dpm2.BelowSafeInc = 0;
> > -       table->initialState.levels[0].dpm2.PwrEfficiencyRatio = 0;
> > +       table->initialState.level.dpm2.MaxPS = 0;
> > +       table->initialState.level.dpm2.NearTDPDec = 0;
> > +       table->initialState.level.dpm2.AboveSafeInc = 0;
> > +       table->initialState.level.dpm2.BelowSafeInc = 0;
> > +       table->initialState.level.dpm2.PwrEfficiencyRatio = 0;
> >
> >         reg = MIN_POWER_MASK | MAX_POWER_MASK;
> > -       table->initialState.levels[0].SQPowerThrottle = cpu_to_be32(reg);
> > +       table->initialState.level.SQPowerThrottle = cpu_to_be32(reg);
> >
> >         reg = MAX_POWER_DELTA_MASK | STI_SIZE_MASK | LTI_RATIO_MASK;
> > -       table->initialState.levels[0].SQPowerThrottle_2 = cpu_to_be32(reg);
> > +       table->initialState.level.SQPowerThrottle_2 = cpu_to_be32(reg);
> >
> >         return 0;
> >  }
> > @@ -4488,18 +4488,18 @@ static int si_populate_smc_acpi_state(struct radeon_device *rdev,
> >
> >         if (pi->acpi_vddc) {
> >                 ret = si_populate_voltage_value(rdev, &eg_pi->vddc_voltage_table,
> > -                                               pi->acpi_vddc, &table->ACPIState.levels[0].vddc);
> > +                                               pi->acpi_vddc, &table->ACPIState.level.vddc);
> >                 if (!ret) {
> >                         u16 std_vddc;
> >
> >                         ret = si_get_std_voltage_value(rdev,
> > -                                                      &table->ACPIState.levels[0].vddc, &std_vddc);
> > +                                                      &table->ACPIState.level.vddc, &std_vddc);
> >                         if (!ret)
> >                                 si_populate_std_voltage_value(rdev, std_vddc,
> > -                                                             table->ACPIState.levels[0].vddc.index,
> > -                                                             &table->ACPIState.levels[0].std_vddc);
> > +                                                             table->ACPIState.level.vddc.index,
> > +                                                             &table->ACPIState.level.std_vddc);
> >                 }
> > -               table->ACPIState.levels[0].gen2PCIE = si_pi->acpi_pcie_gen;
> > +               table->ACPIState.level.gen2PCIE = si_pi->acpi_pcie_gen;
> >
> >                 if (si_pi->vddc_phase_shed_control) {
> >                         si_populate_phase_shedding_value(rdev,
> > @@ -4507,23 +4507,23 @@ static int si_populate_smc_acpi_state(struct radeon_device *rdev,
> >                                                          pi->acpi_vddc,
> >                                                          0,
> >                                                          0,
> > -                                                        &table->ACPIState.levels[0].vddc);
> > +                                                        &table->ACPIState.level.vddc);
> >                 }
> >         } else {
> >                 ret = si_populate_voltage_value(rdev, &eg_pi->vddc_voltage_table,
> > -                                               pi->min_vddc_in_table, &table->ACPIState.levels[0].vddc);
> > +                                               pi->min_vddc_in_table, &table->ACPIState.level.vddc);
> >                 if (!ret) {
> >                         u16 std_vddc;
> >
> >                         ret = si_get_std_voltage_value(rdev,
> > -                                                      &table->ACPIState.levels[0].vddc, &std_vddc);
> > +                                                      &table->ACPIState.level.vddc, &std_vddc);
> >
> >                         if (!ret)
> >                                 si_populate_std_voltage_value(rdev, std_vddc,
> > -                                                             table->ACPIState.levels[0].vddc.index,
> > -                                                             &table->ACPIState.levels[0].std_vddc);
> > +                                                             table->ACPIState.level.vddc.index,
> > +                                                             &table->ACPIState.level.std_vddc);
> >                 }
> > -               table->ACPIState.levels[0].gen2PCIE = (u8)r600_get_pcie_gen_support(rdev,
> > +               table->ACPIState.level.gen2PCIE = (u8)r600_get_pcie_gen_support(rdev,
> >                                                                                     si_pi->sys_pcie_mask,
> >                                                                                     si_pi->boot_pcie_gen,
> >                                                                                     RADEON_PCIE_GEN1);
> > @@ -4534,14 +4534,14 @@ static int si_populate_smc_acpi_state(struct radeon_device *rdev,
> >                                                          pi->min_vddc_in_table,
> >                                                          0,
> >                                                          0,
> > -                                                        &table->ACPIState.levels[0].vddc);
> > +                                                        &table->ACPIState.level.vddc);
> >         }
> >
> >         if (pi->acpi_vddc) {
> >                 if (eg_pi->acpi_vddci)
> >                         si_populate_voltage_value(rdev, &eg_pi->vddci_voltage_table,
> >                                                   eg_pi->acpi_vddci,
> > -                                                 &table->ACPIState.levels[0].vddci);
> > +                                                 &table->ACPIState.level.vddci);
> >         }
> >
> >         mclk_pwrmgt_cntl |= MRDCK0_RESET | MRDCK1_RESET;
> > @@ -4552,59 +4552,59 @@ static int si_populate_smc_acpi_state(struct radeon_device *rdev,
> >         spll_func_cntl_2 &= ~SCLK_MUX_SEL_MASK;
> >         spll_func_cntl_2 |= SCLK_MUX_SEL(4);
> >
> > -       table->ACPIState.levels[0].mclk.vDLL_CNTL =
> > +       table->ACPIState.level.mclk.vDLL_CNTL =
> >                 cpu_to_be32(dll_cntl);
> > -       table->ACPIState.levels[0].mclk.vMCLK_PWRMGT_CNTL =
> > +       table->ACPIState.level.mclk.vMCLK_PWRMGT_CNTL =
> >                 cpu_to_be32(mclk_pwrmgt_cntl);
> > -       table->ACPIState.levels[0].mclk.vMPLL_AD_FUNC_CNTL =
> > +       table->ACPIState.level.mclk.vMPLL_AD_FUNC_CNTL =
> >                 cpu_to_be32(mpll_ad_func_cntl);
> > -       table->ACPIState.levels[0].mclk.vMPLL_DQ_FUNC_CNTL =
> > +       table->ACPIState.level.mclk.vMPLL_DQ_FUNC_CNTL =
> >                 cpu_to_be32(mpll_dq_func_cntl);
> > -       table->ACPIState.levels[0].mclk.vMPLL_FUNC_CNTL =
> > +       table->ACPIState.level.mclk.vMPLL_FUNC_CNTL =
> >                 cpu_to_be32(mpll_func_cntl);
> > -       table->ACPIState.levels[0].mclk.vMPLL_FUNC_CNTL_1 =
> > +       table->ACPIState.level.mclk.vMPLL_FUNC_CNTL_1 =
> >                 cpu_to_be32(mpll_func_cntl_1);
> > -       table->ACPIState.levels[0].mclk.vMPLL_FUNC_CNTL_2 =
> > +       table->ACPIState.level.mclk.vMPLL_FUNC_CNTL_2 =
> >                 cpu_to_be32(mpll_func_cntl_2);
> > -       table->ACPIState.levels[0].mclk.vMPLL_SS =
> > +       table->ACPIState.level.mclk.vMPLL_SS =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_ss1);
> > -       table->ACPIState.levels[0].mclk.vMPLL_SS2 =
> > +       table->ACPIState.level.mclk.vMPLL_SS2 =
> >                 cpu_to_be32(si_pi->clock_registers.mpll_ss2);
> >
> > -       table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL =
> > +       table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL =
> >                 cpu_to_be32(spll_func_cntl);
> > -       table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_2 =
> > +       table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL_2 =
> >                 cpu_to_be32(spll_func_cntl_2);
> > -       table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_3 =
> > +       table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL_3 =
> >                 cpu_to_be32(spll_func_cntl_3);
> > -       table->ACPIState.levels[0].sclk.vCG_SPLL_FUNC_CNTL_4 =
> > +       table->ACPIState.level.sclk.vCG_SPLL_FUNC_CNTL_4 =
> >                 cpu_to_be32(spll_func_cntl_4);
> >
> > -       table->ACPIState.levels[0].mclk.mclk_value = 0;
> > -       table->ACPIState.levels[0].sclk.sclk_value = 0;
> > +       table->ACPIState.level.mclk.mclk_value = 0;
> > +       table->ACPIState.level.sclk.sclk_value = 0;
> >
> > -       si_populate_mvdd_value(rdev, 0, &table->ACPIState.levels[0].mvdd);
> > +       si_populate_mvdd_value(rdev, 0, &table->ACPIState.level.mvdd);
> >
> >         if (eg_pi->dynamic_ac_timing)
> > -               table->ACPIState.levels[0].ACIndex = 0;
> > +               table->ACPIState.level.ACIndex = 0;
> >
> > -       table->ACPIState.levels[0].dpm2.MaxPS = 0;
> > -       table->ACPIState.levels[0].dpm2.NearTDPDec = 0;
> > -       table->ACPIState.levels[0].dpm2.AboveSafeInc = 0;
> > -       table->ACPIState.levels[0].dpm2.BelowSafeInc = 0;
> > -       table->ACPIState.levels[0].dpm2.PwrEfficiencyRatio = 0;
> > +       table->ACPIState.level.dpm2.MaxPS = 0;
> > +       table->ACPIState.level.dpm2.NearTDPDec = 0;
> > +       table->ACPIState.level.dpm2.AboveSafeInc = 0;
> > +       table->ACPIState.level.dpm2.BelowSafeInc = 0;
> > +       table->ACPIState.level.dpm2.PwrEfficiencyRatio = 0;
> >
> >         reg = MIN_POWER_MASK | MAX_POWER_MASK;
> > -       table->ACPIState.levels[0].SQPowerThrottle = cpu_to_be32(reg);
> > +       table->ACPIState.level.SQPowerThrottle = cpu_to_be32(reg);
> >
> >         reg = MAX_POWER_DELTA_MASK | STI_SIZE_MASK | LTI_RATIO_MASK;
> > -       table->ACPIState.levels[0].SQPowerThrottle_2 = cpu_to_be32(reg);
> > +       table->ACPIState.level.SQPowerThrottle_2 = cpu_to_be32(reg);
> >
> >         return 0;
> >  }
> >
> >  static int si_populate_ulv_state(struct radeon_device *rdev,
> > -                                SISLANDS_SMC_SWSTATE *state)
> > +                                struct SISLANDS_SMC_SWSTATE_SINGLE *state)
> >  {
> >         struct evergreen_power_info *eg_pi = evergreen_get_pi(rdev);
> >         struct si_power_info *si_pi = si_get_pi(rdev);
> > @@ -4613,19 +4613,19 @@ static int si_populate_ulv_state(struct radeon_device *rdev,
> >         int ret;
> >
> >         ret = si_convert_power_level_to_smc(rdev, &ulv->pl,
> > -                                           &state->levels[0]);
> > +                                           &state->level);
> >         if (!ret) {
> >                 if (eg_pi->sclk_deep_sleep) {
> >                         if (sclk_in_sr <= SCLK_MIN_DEEPSLEEP_FREQ)
> > -                               state->levels[0].stateFlags |= PPSMC_STATEFLAG_DEEPSLEEP_BYPASS;
> > +                               state->level.stateFlags |= PPSMC_STATEFLAG_DEEPSLEEP_BYPASS;
> >                         else
> > -                               state->levels[0].stateFlags |= PPSMC_STATEFLAG_DEEPSLEEP_THROTTLE;
> > +                               state->level.stateFlags |= PPSMC_STATEFLAG_DEEPSLEEP_THROTTLE;
> >                 }
> >                 if (ulv->one_pcie_lane_in_ulv)
> >                         state->flags |= PPSMC_SWSTATE_FLAG_PCIE_X1;
> > -               state->levels[0].arbRefreshState = (u8)(SISLANDS_ULV_STATE_ARB_INDEX);
> > -               state->levels[0].ACIndex = 1;
> > -               state->levels[0].std_vddc = state->levels[0].vddc;
> > +               state->level.arbRefreshState = (u8)(SISLANDS_ULV_STATE_ARB_INDEX);
> > +               state->level.ACIndex = 1;
> > +               state->level.std_vddc = state->level.vddc;
> >                 state->levelCount = 1;
> >
> >                 state->flags |= PPSMC_SWSTATE_FLAG_DC;
> > @@ -4725,7 +4725,9 @@ static int si_init_smc_table(struct radeon_device *rdev)
> >         if (ret)
> >                 return ret;
> >
> > -       table->driverState = table->initialState;
> > +       table->driverState.flags = table->initialState.flags;
> > +       table->driverState.levelCount = table->initialState.levelCount;
> > +       table->driverState.levels[0] = table->initialState.level;
> >
> >         ret = si_do_program_memory_timing_parameters(rdev, radeon_boot_state,
> >                                                      SISLANDS_INITIAL_STATE_ARB_INDEX);
> > @@ -5276,8 +5278,8 @@ static int si_upload_ulv_state(struct radeon_device *rdev)
> >         if (ulv->supported && ulv->pl.vddc) {
> >                 u32 address = si_pi->state_table_start +
> >                         offsetof(SISLANDS_SMC_STATETABLE, ULVState);
> > -               SISLANDS_SMC_SWSTATE *smc_state = &si_pi->smc_statetable.ULVState;
> > -               u32 state_size = sizeof(SISLANDS_SMC_SWSTATE);
> > +               struct SISLANDS_SMC_SWSTATE_SINGLE *smc_state = &si_pi->smc_statetable.ULVState;
> > +               u32 state_size = sizeof(struct SISLANDS_SMC_SWSTATE_SINGLE);
> >
> >                 memset(smc_state, 0, state_size);
> >
> > diff --git a/drivers/gpu/drm/radeon/sislands_smc.h b/drivers/gpu/drm/radeon/sislands_smc.h
> > index 966e3a556011..334fef2d9cb8 100644
> > --- a/drivers/gpu/drm/radeon/sislands_smc.h
> > +++ b/drivers/gpu/drm/radeon/sislands_smc.h
> > @@ -191,6 +191,14 @@ struct SISLANDS_SMC_SWSTATE
> >
> >  typedef struct SISLANDS_SMC_SWSTATE SISLANDS_SMC_SWSTATE;
> >
> > +struct SISLANDS_SMC_SWSTATE_SINGLE {
> > +       uint8_t                             flags;
> > +       uint8_t                             levelCount;
> > +       uint8_t                             padding2;
> > +       uint8_t                             padding3;
> > +       SISLANDS_SMC_HW_PERFORMANCE_LEVEL   level;
> > +};
> > +
> >  #define SISLANDS_SMC_VOLTAGEMASK_VDDC  0
> >  #define SISLANDS_SMC_VOLTAGEMASK_MVDD  1
> >  #define SISLANDS_SMC_VOLTAGEMASK_VDDCI 2
> > @@ -208,19 +216,19 @@ typedef struct SISLANDS_SMC_VOLTAGEMASKTABLE SISLANDS_SMC_VOLTAGEMASKTABLE;
> >
> >  struct SISLANDS_SMC_STATETABLE
> >  {
> > -    uint8_t                             thermalProtectType;
> > -    uint8_t                             systemFlags;
> > -    uint8_t                             maxVDDCIndexInPPTable;
> > -    uint8_t                             extraFlags;
> > -    uint32_t                            lowSMIO[SISLANDS_MAX_NO_VREG_STEPS];
> > -    SISLANDS_SMC_VOLTAGEMASKTABLE       voltageMaskTable;
> > -    SISLANDS_SMC_VOLTAGEMASKTABLE       phaseMaskTable;
> > -    PP_SIslands_DPM2Parameters          dpm2Params;
> > -    SISLANDS_SMC_SWSTATE                initialState;
> > -    SISLANDS_SMC_SWSTATE                ACPIState;
> > -    SISLANDS_SMC_SWSTATE                ULVState;
> > -    SISLANDS_SMC_SWSTATE                driverState;
> > -    SISLANDS_SMC_HW_PERFORMANCE_LEVEL   dpmLevels[SISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1];
> > +       uint8_t                                 thermalProtectType;
> > +       uint8_t                                 systemFlags;
> > +       uint8_t                                 maxVDDCIndexInPPTable;
> > +       uint8_t                                 extraFlags;
> > +       uint32_t                                lowSMIO[SISLANDS_MAX_NO_VREG_STEPS];
> > +       SISLANDS_SMC_VOLTAGEMASKTABLE           voltageMaskTable;
> > +       SISLANDS_SMC_VOLTAGEMASKTABLE           phaseMaskTable;
> > +       PP_SIslands_DPM2Parameters              dpm2Params;
> > +       struct SISLANDS_SMC_SWSTATE_SINGLE      initialState;
> > +       struct SISLANDS_SMC_SWSTATE_SINGLE      ACPIState;
> > +       struct SISLANDS_SMC_SWSTATE_SINGLE      ULVState;
> > +       SISLANDS_SMC_SWSTATE                    driverState;
> > +       SISLANDS_SMC_HW_PERFORMANCE_LEVEL       dpmLevels[SISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE];
> >  };
> >
> >  typedef struct SISLANDS_SMC_STATETABLE SISLANDS_SMC_STATETABLE;
> > --
> > 2.27.0
> >
