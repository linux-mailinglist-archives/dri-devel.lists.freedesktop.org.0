Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E20A6AF1DE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 19:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D8710E53A;
	Tue,  7 Mar 2023 18:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2362410E530;
 Tue,  7 Mar 2023 18:47:58 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so2149778pjb.0; 
 Tue, 07 Mar 2023 10:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678214877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwJJAAvs/O2Ca860Au7W009ZUX+Nz2nCyjxJ9JUiC9c=;
 b=SVrq4PHqefwMBQ12zcN68KF1qUQUGalmroUn03q8CKB5uCanpnIky7V5MDAywkhaQc
 rfWePlJqpiUUwUwthCl/WtukJCqbZ3JuBI6+eknfA2XEIvuYaOuDamtx6Cik85H8b6DU
 Z2/2ZBP/J1Ln5/l0/TyZr1ElRzuXl8bhd+x9ODtYviTiXhes7D43f2o0HtFBVHVzHYxy
 9Ntl3rJ/L3TNCVUMSU5CspoGFDxDe+eIYSvCx028dYAPtCcp3FI8T5MPZOuxNjWDhsqd
 NQC1T5n+foWtRctX8F79tp6bxw3EvDEot4Ud02NZ0L2O5nr3XCwjV+i7mebrg+mo0B+G
 06zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwJJAAvs/O2Ca860Au7W009ZUX+Nz2nCyjxJ9JUiC9c=;
 b=f+2XWVKENXef7AXwBrmaVnrtCCobGvu+d/utXbCNpwUdouucwfSaBGzhSH9WrGrHIs
 2ylB6jAxR0K8V0B4+FpOtTUaNRc60dNx0A4GEGvcVYK9cS1odDnqYqTlOMegImMyCar4
 RFpykQ9aV4nALX5VdFqiMIOEgiFI++qzogY/5D7Wy9VAQbgNCWWbRWRbEcT9e7NmC6QK
 S0WfVIlTfwGzQGKvwvgXuIHgIBHr+uQnHPsgVC+qbriZ0z42EnVhJ4gb5Rssga5uWsoO
 16QAKUngSKFDhhXdD4i2NuXeI/UuA1oN7Etr1arOclBS6bryN6OOMpCOYAxva0oTQveN
 PetA==
X-Gm-Message-State: AO0yUKWY1azPiFjYi4yvdziPYIk8Lv6cfr0XLadRMORaTXFjLcVykq/h
 VIWY2Xj0Uv9VfQUYVlrRUSIJoSwxi9jj+zk3zQ4=
X-Google-Smtp-Source: AK7set+RWbXBtnhVn5pdmO9M9UUd3hPQ/2kW4nJHVBb8wuIz7KYo9ibEge6VEuCkpeefEFX3i8aWJxysRMlUJCdmgf0=
X-Received: by 2002:a17:902:efc3:b0:19a:6b55:a44d with SMTP id
 ja3-20020a170902efc300b0019a6b55a44dmr8397723plb.1.1678214877558; Tue, 07 Mar
 2023 10:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20230307174627.23787-1-rdunlap@infradead.org>
In-Reply-To: <20230307174627.23787-1-rdunlap@infradead.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Mar 2023 15:47:46 -0300
Message-ID: <CAOMZO5DDH=9MMbJX3O8yU7RQjudeC-oXhoT-nu91p1arqHcBGg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix PM_DEVFREQ kconfig dependency warning
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Rob Clark <robdclark@chromium.org>, kernel test robot <lkp@intel.com>,
 Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 2:46=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Since DEVFREQ_GOV_SIMPLE_ONDEMAND depends on PM_DEVFREQ, the latter
> should either be selected or DRM_MSM should depend on PM_DEVFREQ.
> Since most drivers select PM_DEVFREQ instead of depending on it,
> add a select here to satisfy kconfig.
>
> WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMA=
ND
>   Depends on [n]: PM_DEVFREQ [=3Dn]
>   Selected by [y]:
>   - DRM_MSM [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && (ARCH_QCOM || SOC=
_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT [=3Dy] =
&& (QCOM_OCMEM [=3Dn] || QCOM_OCMEM [=3Dn]=3Dn) && (QCOM_LLCC [=3Dn] || QCO=
M_LLCC [=3Dn]=3Dn) && (QCOM_COMMAND_DB [=3Dy] || QCOM_COMMAND_DB [=3Dy]=3Dn=
)
>
> Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: lore.kernel.org/r/202303071922.wJqDWQpe-lkp@intel.com
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Paul Gazzillo <paul@pgazz.com>
> Cc: Necip Fazil Yildiran <fazilyildiran@gmail.com>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org

This fixes the warning after running 'make imx_v6_v7_defconfig', thanks:

Tested-by: Fabio Estevam <festevam@gmail.com>
