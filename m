Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5683D0C3C3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 22:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577E310E067;
	Fri,  9 Jan 2026 21:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6A7+O9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BBB10E344
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 21:03:31 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-34eeffdb197so701407a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 13:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767992611; x=1768597411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyOVDUF74gAYTbKoqj0ae3EHZS9go1yG7YgI85ErsM0=;
 b=b6A7+O9YPvYS20NX6iSvPcHqfrysLSpN3mBNeDvX/BPQyyg2G+BFiY0jjpI4U3IrQz
 u3jJmMC0J0tWEM5Mb/uhEakl230xebhCQ8tE4JkSOdCMZCebjI+daX6dQbNyXa846NYp
 SFr90/Y6nkjeOF4Die4N7oZtPgs6elCG6+3/tlaiWb3LmlfrnpWU+TKgTxUhQKoUElvn
 S52rLZRv8/X31dJrw69eZJp1CpkdD594veMd89NQw4aHHQ57a1kOhbznnqxm92bg+V0M
 hCRRDn3wGqR5o2U+tW1ZUoHKpj0VFgqieIBu6Aq8ox3MyJt3n6SpBD7rpuMay/oRJvUj
 3yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767992611; x=1768597411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RyOVDUF74gAYTbKoqj0ae3EHZS9go1yG7YgI85ErsM0=;
 b=TI2CLvj0awxpgaKY0jDcc0P4UZwKazqwkFX7YQgSEMGO2XqMOsWQwsHwmUoU+7d3Js
 K5scfJrq0eCwHj4rUvzY0x7oMzzHSN9EScfxYYknc3IxtJk2gVBAIqO+EwQ9fxGFpfaw
 xLeag0rgJLMzjjwdw8DnUQGQwgFTF8TeMUb/fdIRfI7CtJIguZOsThxkHbL2wKIOnfND
 fInZN57F0CTpoX/TZc1O5rzSx8D00tQ3C27vH8Sl0FM/jBSnehasQQXz9NJVONE75o0L
 bUOssDaVOXKCh0BgOgRsyPko34Lk7pwlPn8W+vdEzj17YSTv+Gckd5XgtrOtEqitg3xv
 iBdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ52OckfvWRzciHV6Zlt+NPQ8E00g2l4FYRYVDWloRt/meFHkOXMzYlhqZ6NSyAiu+zpqm/+Q9rLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkfj3x42C+eapJaG3P0CQWM6NkDitb5DUDwDCC2xbvMd/TpC/k
 U+RFCbPQ10cpct9F5skhp/2qYmp8Y9GHCn3j+jqmfzz19LjVjum0i763KcNiJnNP/NAuFlfFaku
 qXa4S7kiGHtqZBjZm4B6Tr+Mn5crnJag=
X-Gm-Gg: AY/fxX6PZPa5KpU1SvONJTZH/LdBjiHWFvCP+CO42fsvHvzEnrLw+VjDysJbEZT8T4+
 uhJJKt+OszQOqjZWiytvrhhZ/nSI/0VwSN5vrpxkMDuNqxRulectz9ABqEREZWCL/F0m8hJmcLr
 ntxTQ+cg1JvQaRMdjLEys4xGpkmCO/FWmckusFOexJVxxOVQ+Ip6DVL32GAJRbQqB1eAB8j6XPB
 0kemiTeTbi+v8jUrL3n3fH9GuBLwnZaqxIxDeOWDA723cO7sPl+0+gLrqzxYgi549jYz8A=
X-Google-Smtp-Source: AGHT+IE05GJLOX7J9o3rv9JKWTOoOlTvZY9nZW90P03JGgrN2QFWyiHlqKTLk+SGCgsCEZfgIesafoFepLnyHuO2ttQ=
X-Received: by 2002:a17:90b:4f88:b0:340:aa74:c2a6 with SMTP id
 98e67ed59e1d1-34f68cbe5ecmr7454279a91.6.1767992606559; Fri, 09 Jan 2026
 13:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
In-Reply-To: <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 9 Jan 2026 16:03:15 -0500
X-Gm-Features: AQt7F2pM1G3qtIE9uPH0KTNnnwwx0yjLdXW5AgqF5oEPRMWpeFIUrXyH2ORXjfE
Message-ID: <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: rob.clark@oss.qualcomm.com
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Fri, Jan 9, 2026 at 11:11=E2=80=AFAM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Thu, Jan 8, 2026 at 9:22=E2=80=AFAM Konrad Dybcio <konradybcio@kerne=
l.org> wrote:
> > >
> > > SMEM allows the OS to retrieve information about the DDR memory.
> > > Among that information, is a semi-magic value called 'HBB', or Highes=
t
> > > Bank address Bit, which multimedia drivers (for hardware like Adreno
> > > and MDSS) must retrieve in order to program the IP blocks correctly.
> > >
> > > This series introduces an API to retrieve that value, uses it in the
> > > aforementioned programming sequences and exposes available DDR
> > > frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> > > information can be exposed in the future, as needed.
> > >
> > > Patch 3 should really be merged after 1&2
> >
> > No. The HBB value currently returned by the bootloader is *not* always
> > the same as what we use currently, because some SoCs (like SM8250)
> > with the same DT ship with multiple different DRAM configurations and
> > we've been using a sub-optimal value the whole time. After all, that's
> > the whole point of using the bootloader value. But patches 1&2 will
> > only make the DPU use the bootloader value for HBB, not the GPU. So on
> > one of the affected SoCs, it will introduce a mismatch. You can't
> > change anything until the GPU side uses the new ubwc config as its
> > source of truth.
>
> Hmm, how is this even working today if DPU is using HBB from the
> global table but GPU is not?  Are we just getting lucky with
> compositors that don't know about modifiers and end up scanning out
> linear?

It works out as well as it's always worked out, i.e. we try to make
GPU and DPU config match and pray that we didn't mess it up. At least
now we'll get a warning when they don't match.

>
> We do log warnings when the global ubwc config does not match the
> "fixed up" config.. google search for those msgs doesn't seem to turn
> up anything other than the patch which introduced them.  Idk if that
> is conclusive in any way, but I hope that means we could just delete
> the fixup code on the GPU side.  I suppose we could add:
>
>        *cfg =3D *common_cfg;
>
> after the warning as a first step.  That would maybe get some bug
> reports along with enough details in dmesg?

Yes, the plan was always to delete the fixup code in the GPU config.
And even that first step would be enough to prevent regressions when
switching to the bootloader HBB value.

There is a problem in that ubwc_swizzle isn't as well tested. Older
parts supporting UBWC 1.0-3.0 partially or entirely ignore
ubwc_swizzle, because it wasn't configurable back then, but we rely on
it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
textures. So if ubwc_swizzle is incorrect you probably wouldn't
notice, until you hit the HIC codepath in zink or some game using
sparse textures. I think we fixed up all the cases where it was
incorrectly set to 0x1 instead of 0x7, but it would be worth it to
check again.

Connor

>
> BR,
> -R
>
> > Connor
> >
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > ---
> > > Changes in v3:
> > > - Support v6 and v7 DDRInfo (v7 is used on e.g. Hamoa)
> > > - Handle rare cases of DDRInfo v5 with additional trailing data
> > > - Rebase/adjust to SSoT UBWC
> > > - Expose hbb value in debugfs
> > > - cosmetic changes
> > > - Link to v2: https://lore.kernel.org/r/20250410-topic-smem_dramc-v2-=
0-dead15264714@oss.qualcomm.com
> > >
> > > Changes in v2:
> > > - Avoid checking for < 0 on unsigned types
> > > - Overwrite Adreno UBWC data to keep the data shared with userspace
> > >   coherent with what's programmed into the hardware
> > > - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
> > >   branches separately
> > > - Pick up Bjorn's rb on patch 1
> > > - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-=
0-94d505cd5593@oss.qualcomm.com
> > >
> > > ---
> > > Konrad Dybcio (3):
> > >       soc: qcom: smem: Expose DDR data from SMEM
> > >       soc: qcom: ubwc: Get HBB from SMEM
> > >       drm/msm/adreno: Trust the SSoT UBWC config
> > >
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  11 +-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  82 +------
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   5 -
> > >  drivers/soc/qcom/Makefile               |   3 +-
> > >  drivers/soc/qcom/smem.c                 |  14 +-
> > >  drivers/soc/qcom/smem.h                 |   9 +
> > >  drivers/soc/qcom/smem_dramc.c           | 408 ++++++++++++++++++++++=
++++++++++
> > >  drivers/soc/qcom/ubwc_config.c          |  69 ++++--
> > >  include/linux/soc/qcom/smem.h           |   4 +
> > >  9 files changed, 485 insertions(+), 120 deletions(-)
> > > ---
> > > base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> > > change-id: 20250409-topic-smem_dramc-6467187ac865
> > >
> > > Best regards,
> > > --
> > > Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >
