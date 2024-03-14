Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C787BDA0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 14:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8B610E233;
	Thu, 14 Mar 2024 13:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U71CJYJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1910E233;
 Thu, 14 Mar 2024 13:27:47 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1dddbeac9f9so6825465ad.3; 
 Thu, 14 Mar 2024 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710422867; x=1711027667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2yg1661moNiZAX3iAHBWmn64EJAcdHlAdwOsZY2kac=;
 b=U71CJYJRPy6L3ikY5JNuscQ09ky1ssLGLVxBJmqO8cQKENmO5wQKlXEpr49wfHqlid
 fgMJg/uZg8lcDcTyoYBxIH0nawwtUKFwtIS9/XtNjHCbxjyxlFroM1SqVOugqexUwib/
 OIKrI9FYg+HeaoNYboBWTBknA0zkk7N/UzL6Zf13cqn+dWSzQ2Yr95hZ+GPD7HHyGJbp
 4pLmPD8jjv1eQSfK7JcxMdJtjOSd1Xu8zXyMN5y5+lvDw1K8nM5F9B4JaKPDeiqe7//y
 u2t6et0Va8CX0LKr5gutqJ0j20eW7lp7heA/5AjBkn5OAG5h1uXnI9Nn5h8U1tzh9d2i
 hepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710422867; x=1711027667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t2yg1661moNiZAX3iAHBWmn64EJAcdHlAdwOsZY2kac=;
 b=B4017cacI8iLPP1elHCJGaYHOxnssyPh7DYqAi2TZLG9v9M4o9mwwG4QPbKY+Q56Jo
 UNRyjrFGG+MvS9Wl0afKAf05RoFTPwuTPggKM/PHMfTw3a++kVBpO/fCTdSFzpNfwW4a
 WxycsRX/lI2mrvNCF4jB2Au2P0WAkeVFHKSld1bibZquPOvdHe2Pgxwqmcde6uTMlgpK
 e2tXx6ncj/eN8WOfd1OkW8VJk4yqkN2GXOmw4DZO2KsTbcVMRaZzWplQZ/vXoIjI87gh
 m6xFERZxi2pAG3tAojxpYZB3KEZiALt1jURAetYNs9b1aoI0d4O+9llhTWny978byCgB
 L9bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUar240G8nMtdaolkkqxF/qfSy4UpYrsoNP0TX/TpVrCTbZ2ugkxRnQvXsxtcWhpS5PlnlIdvzqkGDGFDC4zk+pvMY9wMkwQ2nLiYUU/oz/D/BSQq2GFbb2nMEJWqfwmD1NwO2yDVj06Su3MnWKEA==
X-Gm-Message-State: AOJu0Yw2Ly1hbKzmv21GwAMJv40IaJtNkh+hjhqK9MswY00Q4qhm7LWu
 ELtMWtG1KIj73ckuX0i5bJAwCr/4X215Y1QlH+ZY+svIaBMeek4uja2atIRmcek8rO0tn6LSuBE
 3gPmuHTkflRvyL6IelOxi0p7gEFLBZf5F
X-Google-Smtp-Source: AGHT+IGp4g1q2p2tX2Sg+2gMda75WGf0sHyJApwNets2saxCzKetZdsNeI7wYsoIWADxDks2FEegJj82DeVPiFree7Q=
X-Received: by 2002:a17:902:e5d1:b0:1dd:d412:2c8a with SMTP id
 u17-20020a170902e5d100b001ddd4122c8amr1914849plf.10.1710422867147; Thu, 14
 Mar 2024 06:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <20240312124148.257067-2-sunil.khatri@amd.com>
 <CADnq5_ON0NfcpmnHKjNYWgxfvfz-J3tgjX92DaaN63iKb+FOZg@mail.gmail.com>
 <498b87fb-727c-4ea2-9633-6ecbff436eba@amd.com>
 <0ee30d3b-0dbc-3eb6-a19c-abeb85cbc883@amd.com>
In-Reply-To: <0ee30d3b-0dbc-3eb6-a19c-abeb85cbc883@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Mar 2024 09:27:35 -0400
Message-ID: <CADnq5_OBsCtmzzB7yC85OjHfALCjUUPTDgw7C9UsghNfx7hPnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's
To: "Sharma, Shashank" <shashank.sharma@amd.com>
Cc: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 14, 2024 at 2:10=E2=80=AFAM Sharma, Shashank
<shashank.sharma@amd.com> wrote:
>
>
> On 14/03/2024 06:58, Khatri, Sunil wrote:
> >
> > On 3/14/2024 2:06 AM, Alex Deucher wrote:
> >> On Tue, Mar 12, 2024 at 8:42=E2=80=AFAM Sunil Khatri <sunil.khatri@amd=
.com>
> >> wrote:
> >>> Add firmware version information of each
> >>> IP and each instance where applicable.
> >>>
> >> Is there a way we can share some common code with devcoredump,
> >> debugfs, and the info IOCTL?  All three places need to query this
> >> information and the same logic is repeated in each case.
> >
> > Hello Alex,
> >
> > Yes you re absolutely right the same information is being retrieved
> > again as done in debugfs. I can reorganize the code so same function
> > could be used by debugfs and devcoredump but this is exactly what i
> > tried to avoid here. I did try to use minimum functionality in
> > devcoredump without shuffling a lot of code here and there.
> >
> > Also our devcoredump is implemented in amdgpu_reset.c and not all the
> > information is available here and there we might have to include lot
> > of header and cross functions in amdgpu_reset until we want a
> > dedicated file for devcoredump.
>
>
> I think Alex is suggesting to have one common backend to generate all
> the core debug info, and then different wrapper functions which can pack
> this raw info into the packets aligned with respective infra like
> devcore/debugfs/info IOCTL, which seems like a good idea to me.

Right, something like this.  I'm trying to avoid having to touch
several places every time we add a new firmware type or TA, etc.
Maybe something like an array of valid firmwares for each device and
then we can just walk the array and call a helper function to fetch
the firmware versions and name strings for the requested type.  Then
each use case can just call the helpers to get what it needs.

Alex

>
> If you think you need a new file for this backend it should be fine.
>
>
> something like:
>
> amdgpu_debug_core.c::
>
> struct amdgpu_core_debug_info {
>
> /* Superset of all the info you are collecting from HW */
>
> };
>
> - amdgpu_debug_generate_core_info
>
> {
>
> /* This function collects the core debug info from HW and saves in
> amdgpu_core_debug_info,
>
>    we can update this periodically regardless of a request */
>
> }
>
> and then:
>
> devcore_info *amdgpu_debug_pack_for_devcore(core_debug_info)
>
> {
>
> /* convert core debug info into devcore aligned format/data */
>
> }
>
> ioctl_info *amdgpu_debug_pack_for_info_ioctl(core_debug_info)
>
> {
>
> /* convert core debug info into info IOCTL aligned format/data */
>
> }
>
> debugfs_info *amdgpu_debug_pack_for_debugfs(core_debug_info)
>
> {
>
> /* convert core debug info into debugfs aligned format/data */
>
> }
>
> - Shashank
>
> >
> >
> >
> > Info IOCTL does have a lot of information which also is in pipeline to
> > be dumped but this if we want to reuse the functionality of IOCTL we
> > need to reorganize a lot of code.
> >
> > If that is the need of the hour i could work on that. Please let me kno=
w.
> >
> > This is my suggestion if it makes sense:
> >
> > 1. If we want to reuse a lot of functionality then we need to
> > modularize some of the functions further so they could be consumed
> > directly by devcoredump.
> > 2. We should also have a dedicated file for devcoredump.c/.h so its
> > easy to include headers of needed functionality cleanly and easy to
> > expand devcoredump.
> > 3. based on the priority and importance of this task we can add
> > information else some repetition is a real possibility.
> >
> >>
> >> Alex
> >>
> >>
> >>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 122
> >>> ++++++++++++++++++++++
> >>>   1 file changed, 122 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >>> index 611fdb90a1fc..78ddc58aef67 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >>> @@ -168,6 +168,123 @@ void amdgpu_coredump(struct amdgpu_device
> >>> *adev, bool vram_lost,
> >>>   {
> >>>   }
> >>>   #else
> >>> +static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
> >>> struct drm_printer *p)
> >>> +{
> >>> +       uint32_t version;
> >>> +       uint32_t feature;
> >>> +       uint8_t smu_program, smu_major, smu_minor, smu_debug;
> >>> +
> >>> +       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  adev->vce.fb_version, adev->vce.fw_version);
> >>> +       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  0, adev->uvd.fw_version);
> >>> +       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  0, adev->gmc.fw_version);
> >>> +       drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
> >>> +                  adev->gfx.me_feature_version,
> >>> adev->gfx.me_fw_version);
> >>> +       drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  adev->gfx.pfp_feature_version,
> >>> adev->gfx.pfp_fw_version);
> >>> +       drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
> >>> +                  adev->gfx.ce_feature_version,
> >>> adev->gfx.ce_fw_version);
> >>> +       drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  adev->gfx.rlc_feature_version,
> >>> adev->gfx.rlc_fw_version);
> >>> +
> >>> +       drm_printf(p, "RLC SRLC feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                  adev->gfx.rlc_srlc_feature_version,
> >>> +                  adev->gfx.rlc_srlc_fw_version);
> >>> +       drm_printf(p, "RLC SRLG feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                  adev->gfx.rlc_srlg_feature_version,
> >>> +                  adev->gfx.rlc_srlg_fw_version);
> >>> +       drm_printf(p, "RLC SRLS feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                  adev->gfx.rlc_srls_feature_version,
> >>> +                  adev->gfx.rlc_srls_fw_version);
> >>> +       drm_printf(p, "RLCP feature version: %u, fw version: 0x%08x\n=
",
> >>> +                  adev->gfx.rlcp_ucode_feature_version,
> >>> +                  adev->gfx.rlcp_ucode_version);
> >>> +       drm_printf(p, "RLCV feature version: %u, fw version: 0x%08x\n=
",
> >>> +                  adev->gfx.rlcv_ucode_feature_version,
> >>> +                  adev->gfx.rlcv_ucode_version);
> >>> +       drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  adev->gfx.mec_feature_version,
> >>> +                  adev->gfx.mec_fw_version);
> >>> +
> >>> +       if (adev->gfx.mec2_fw)
> >>> +               drm_printf(p,
> >>> +                          "MEC2 feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                          adev->gfx.mec2_feature_version,
> >>> +                          adev->gfx.mec2_fw_version);
> >>> +
> >>> +       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  0, adev->gfx.imu_fw_version);
> >>> +       drm_printf(p, "PSP SOS feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                  adev->psp.sos.feature_version,
> >>> +                  adev->psp.sos.fw_version);
> >>> +       drm_printf(p, "PSP ASD feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> + adev->psp.asd_context.bin_desc.feature_version,
> >>> + adev->psp.asd_context.bin_desc.fw_version);
> >>> +
> >>> +       drm_printf(p, "TA XGMI feature version: 0x%08x, fw version:
> >>> 0x%08x\n",
> >>> + adev->psp.xgmi_context.context.bin_desc.feature_version,
> >>> + adev->psp.xgmi_context.context.bin_desc.fw_version);
> >>> +       drm_printf(p, "TA RAS feature version: 0x%08x, fw version:
> >>> 0x%08x\n",
> >>> + adev->psp.ras_context.context.bin_desc.feature_version,
> >>> + adev->psp.ras_context.context.bin_desc.fw_version);
> >>> +       drm_printf(p, "TA HDCP feature version: 0x%08x, fw version:
> >>> 0x%08x\n",
> >>> + adev->psp.hdcp_context.context.bin_desc.feature_version,
> >>> + adev->psp.hdcp_context.context.bin_desc.fw_version);
> >>> +       drm_printf(p, "TA DTM feature version: 0x%08x, fw version:
> >>> 0x%08x\n",
> >>> + adev->psp.dtm_context.context.bin_desc.feature_version,
> >>> + adev->psp.dtm_context.context.bin_desc.fw_version);
> >>> +       drm_printf(p, "TA RAP feature version: 0x%08x, fw version:
> >>> 0x%08x\n",
> >>> + adev->psp.rap_context.context.bin_desc.feature_version,
> >>> + adev->psp.rap_context.context.bin_desc.fw_version);
> >>> +       drm_printf(p, "TA SECURE DISPLAY feature version: 0x%08x, fw
> >>> version: 0x%08x\n",
> >>> + adev->psp.securedisplay_context.context.bin_desc.feature_version,
> >>> + adev->psp.securedisplay_context.context.bin_desc.fw_version);
> >>> +
> >>> +       /* SMC firmware */
> >>> +       version =3D adev->pm.fw_version;
> >>> +
> >>> +       smu_program =3D (version >> 24) & 0xff;
> >>> +       smu_major =3D (version >> 16) & 0xff;
> >>> +       smu_minor =3D (version >> 8) & 0xff;
> >>> +       smu_debug =3D (version >> 0) & 0xff;
> >>> +       drm_printf(p, "SMC feature version: %u, program: %d, fw
> >>> version: 0x%08x (%d.%d.%d)\n",
> >>> +                  0, smu_program, version, smu_major, smu_minor,
> >>> smu_debug);
> >>> +
> >>> +       /* SDMA firmware */
> >>> +       for (int i =3D 0; i < adev->sdma.num_instances; i++) {
> >>> +               drm_printf(p, "SDMA%d feature version: %u, firmware
> >>> version: 0x%08x\n",
> >>> +                          i, adev->sdma.instance[i].feature_version,
> >>> + adev->sdma.instance[i].fw_version);
> >>> +       }
> >>> +
> >>> +       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  0, adev->vcn.fw_version);
> >>> +       drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n=
",
> >>> +                  0, adev->dm.dmcu_fw_version);
> >>> +       drm_printf(p, "DMCUB feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                  0, adev->dm.dmcub_fw_version);
> >>> +       drm_printf(p, "PSP TOC feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                  adev->psp.toc.feature_version,
> >>> adev->psp.toc.fw_version);
> >>> +
> >>> +       version =3D adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
> >>> +       feature =3D (adev->mes.kiq_version &
> >>> AMDGPU_MES_FEAT_VERSION_MASK)
> >>> +                                       >>
> >>> AMDGPU_MES_FEAT_VERSION_SHIFT;
> >>> +       drm_printf(p, "MES_KIQ feature version: %u, fw version:
> >>> 0x%08x\n",
> >>> +                  feature, version);
> >>> +
> >>> +       version =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK=
;
> >>> +       feature =3D (adev->mes.sched_version &
> >>> AMDGPU_MES_FEAT_VERSION_MASK)
> >>> +                                       >>
> >>> AMDGPU_MES_FEAT_VERSION_SHIFT;
> >>> +       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  feature, version);
> >>> +
> >>> +       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n"=
,
> >>> +                  adev->vpe.feature_version, adev->vpe.fw_version);
> >>> +
> >>> +}
> >>> +
> >>>   static ssize_t
> >>>   amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
> >>>                          void *data, size_t datalen)
> >>> @@ -215,6 +332,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t
> >>> offset, size_t count,
> >>>                  }
> >>>          }
> >>>
> >>> +       if (coredump->adev) {
> >>> +               drm_printf(&p, "IP Firmwares\n");
> >>> +               amdgpu_devcoredump_fw_info(coredump->adev, &p);
> >>> +       }
> >>> +
> >>>          if (coredump->ring) {
> >>>                  drm_printf(&p, "\nRing timed out details\n");
> >>>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> >>> --
> >>> 2.34.1
> >>>
