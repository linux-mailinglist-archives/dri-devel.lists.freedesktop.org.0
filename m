Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF670EFFD
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB88E10E588;
	Wed, 24 May 2023 07:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDFF10E588
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:55:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1A16639C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5CDC433D2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684914935;
 bh=Fmp4C46RnoFnzsysyTmcORroUtVwz2rT+uk98HiKthk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WClREo/dBoEMcVFof87Xw2pKvmuvURkyexcrQ9p6Emn/4w9yK36KuI6kRQxQ11s7f
 EPoULckUNdMsQIOzo9gIPa0wVpToqlULFMafGiMFF1xvoUnmmBAU3Zicr+Nzr3Cmf4
 KReKJs3x+oo1v2laz4SBlPG1ZDEv/6ED30MW/0FyY/Exwi5mEISD2JwRA83zbqd8ii
 f55SZRNbqw5pfo8s7XvoEuOVE5bs5/QxaYifmvx3PU3jRQ+TBLzF9GYHYa8PfOi+n9
 M4AT8GFG5jIAWkBzhODSvunbLZJqV2XcBBchgRGDKZFvi98qb/RsM07fdbitcs/WKw
 s9NeIjaEjpvyg==
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-ba81f71dfefso1009579276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 00:55:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDwpF1NMwudKrrSeMFh6ahOGMyasH5ZdPUF8X8VUCJgw4NV4Z476
 IWcA2qP0URAN8JVgAlNP+H7+jteeFzmDTc4syfA=
X-Google-Smtp-Source: ACHHUZ5Y/YCGnMhF1lseullBPZCkdu8TYqbyB3GII2bx5eiis46HFlv03jO/witTYORXqy2qvej8anVQD8HxMlPIfaI=
X-Received: by 2002:a0d:d74a:0:b0:55a:14df:5c10 with SMTP id
 z71-20020a0dd74a000000b0055a14df5c10mr19987889ywd.18.1684914934228; Wed, 24
 May 2023 00:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
In-Reply-To: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 24 May 2023 10:55:08 +0300
X-Gmail-Original-Message-ID: <CAFCwf11x5xJmCsX_hXeHC3Vhjd2-JMRJJWNbdO4_p_3CsUbSmQ@mail.gmail.com>
Message-ID: <CAFCwf11x5xJmCsX_hXeHC3Vhjd2-JMRJJWNbdO4_p_3CsUbSmQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] accel/ivpu: Add debugfs support
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 10:49=E2=80=AFAM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> Add debugfs support for ivpu driver, most importantly firmware loging
> and tracing.
Hi,
Without looking at the code I have 2 comments/questions:

1. Please add an ABI documentation in Documentation/ABI/testing/ or
Documentation/ABI/stable (if you are feeling courageous). You can see
for example habana's file at
Documentation/ABI/testing/debugfs-driver-habanalabs

2. Is this synced with Christian's upcoming changes to the debugfs
infra in drm ? If not, I might suggest to sync with that and wait
until those patches are merged because they change the layout of
debugfs nodes.

Oded

>
> Andrzej Kacprowski (1):
>   accel/ivpu: Print firmware name and version
>
> Krystian Pradzynski (1):
>   accel/ivpu: Add fw_name file to debugfs
>
> Stanislaw Gruszka (3):
>   accel/ivpu: Initial debugfs support
>   accel/ivpu: Add firmware tracing support
>   accel/ivpu: Add debugfs files for testing device reset
>
>  drivers/accel/ivpu/Makefile       |   4 +-
>  drivers/accel/ivpu/ivpu_debugfs.c | 294 ++++++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_debugfs.h |  13 ++
>  drivers/accel/ivpu/ivpu_drv.c     |   5 +
>  drivers/accel/ivpu/ivpu_fw.c      |  68 ++++++-
>  drivers/accel/ivpu/ivpu_fw.h      |   4 +
>  drivers/accel/ivpu/ivpu_fw_log.c  | 142 +++++++++++++++
>  drivers/accel/ivpu/ivpu_fw_log.h  |  38 ++++
>  drivers/accel/ivpu/ivpu_pm.c      |   1 +
>  drivers/accel/ivpu/ivpu_pm.h      |   1 +
>  10 files changed, 563 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.c
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.h
>  create mode 100644 drivers/accel/ivpu/ivpu_fw_log.c
>  create mode 100644 drivers/accel/ivpu/ivpu_fw_log.h
>
> --
> 2.25.1
>
