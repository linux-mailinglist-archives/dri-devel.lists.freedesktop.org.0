Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A719A04407
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8041810E26C;
	Tue,  7 Jan 2025 15:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nq2h9qF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A298310E1CA;
 Tue,  7 Jan 2025 15:17:25 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3cddfa9a331so14328795ab.3; 
 Tue, 07 Jan 2025 07:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736262985; x=1736867785; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEpmGsnYD20KF98YPxRoScx17fqF75iFjcKl5Un5Rwc=;
 b=Nq2h9qF35RkYfWQSF3PxhsWtp8SuYKSI51HQkj2VbOBPYiCVNKzGZt9AvoLXD/rcpM
 5byfFOII8+2P9Fd6x7iP6aANa+6601pZ7XhH/mFFmZFtiHJ6BRUCScPV2hnnY9F+Wx13
 Ded5pp+LKuzM7LENhAExg5fzsLEe+QJnzfcJypCcRi3uUSdvFjgmSlfAYJdAWcOc1enu
 snjGG3HT30ccZd3yZXA16HhEHxezczSbmv220NHs4qjwapmnq/740PxscbCygZAnNpkd
 TwellglSGhdfRXgFGAMV+BJ0SrYibDsElEoo0FtRytpT21yZgghnScnZ2XX6Fmxdl0tn
 L35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736262985; x=1736867785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEpmGsnYD20KF98YPxRoScx17fqF75iFjcKl5Un5Rwc=;
 b=j8kp1Z1fFqUVyCETmydMYCaoGQQInwtRFeq9L/NwVnRvoTPdoR/5kn//23fQ8MydED
 VpC5xdwr4vF/hzXLBSZXQcW2QblYuWli59zyuao/xSmAT7jjL3Y3UenlEDKeCEeimcQl
 t8OHIBeBmRBTpjNVErNbNwjVk/GjQJmOe1ZwLTw2dn9zG6Z5PKx71Rur+Tch4aWBDm65
 WSdNzXx8hNOGPxWHWb7TIGOtBLoVbViwNH88vrbGmgi7NeJ1spFdiy2/4q3ZDjFzDmv7
 M4yAf6B44RpmVwWeVoXnn/2LzlViGcZJd2Zt5dODfRGRDgOZcQdfj17yaWsAsefkxl0n
 XkHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfkew+WdD5sBI+VYUP2wwfZ+QmHDenXlNW3ItIatFVmAJyPb2+QpkKnXlJxQdY2qfvgu7eSm5Q2dG2@lists.freedesktop.org,
 AJvYcCVMeREA8KLQb2QZrL7QbbQGz7Of5RGqC6WxyjBXdx3PO/ukjqzXxMYvGAIID/boFiZPeMBWIyATGp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9FqjSOwpu7Za7f4VnL0WJrVNT0mnGWMhueeUyLjCP+4MFdxIS
 bvyecK7XMcqwN/dgavhbEyvO19LqVeHZh3XqVFyoZzcdDZlw09CFuZHlMkkz9yZJ3b5m8SfzGJM
 Y9/5CmzhO17IHWVUlxyh/1ecKTgw=
X-Gm-Gg: ASbGncvpTBxc5dnjAXJoOY3b3CfbqAG6JflXvv8iKkdmNqjQUqXTcwNiaX6GKfYBNW+
 xQI190VRR+rJQlaJFSw3rQFibR/lX2y1qTZb+zdJ16N5iWQrFcdWfRcQ+IFqU/BDIzcOq
X-Google-Smtp-Source: AGHT+IHlytIOa8SLJD6ilASbLpCUQevKgStkuVESsGuRpq4383tKFP0QuXLkBBL6bO1X1rxhpJ3kjld29+v9vpnSuz8=
X-Received: by 2002:a05:6e02:2384:b0:3a7:fe8c:b014 with SMTP id
 e9e14a558f8ab-3c2d5917533mr523633585ab.21.1736262984845; Tue, 07 Jan 2025
 07:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20241210165127.600817-1-robdclark@gmail.com>
 <Z30kWxVxwJXO_z2_@google.com>
 <20250107125840.GB6991@willie-the-truck>
In-Reply-To: <20250107125840.GB6991@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jan 2025 07:16:13 -0800
Message-ID: <CAF6AEGuXD6rCx8yABH338XSr0Wq6fyFe9Z6fWCh1KPNMbJgiOg@mail.gmail.com>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Joao Martins <joao.m.martins@oracle.com>, Kevin Tian <kevin.tian@intel.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
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

On Tue, Jan 7, 2025 at 4:58=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Jan 07, 2025 at 12:55:55PM +0000, Mostafa Saleh wrote:
> > On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This series extends io-pgtable-arm with a method to retrieve the page
> > > table entries traversed in the process of address translation, and th=
en
> > > beefs up drm/msm gpu devcore dump to include this (and additional inf=
o)
> > > in the devcore dump.
> > >
> > > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > > (minus a patch that was already merged)
> > >
> > > v2:  Fix an armv7/32b build error in the last patch
> > > v3:  Incorperate Will Deacon's suggestion to make the interface
> > >      callback based.
> > > v4:  Actually wire up the callback
> > > v5:  Drop the callback approach
> > > v6:  Make walk-data struct pgtable specific and rename
> > >      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > > v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirt=
y()
> > > v8:  Pass pte pointer to callback so it can modify the actual pte
> > > v9:  Fix selftests_running case
> > > v10: Call visit cb for all nodes traversed, leave the decision about
> > >      whether to care about non-leaf nodes to the callback
> > > v11: Adjust logic in 3/4 [smostafa@]
> >
> > I see the level initialization was not removed as it was in the diff[1]=
, so it
> > seems to me that=E2=80=99s redundant as the level is set anyway in the =
callback, and
> > actually looking at that I see it=E2=80=99s not used or printed from th=
e driver,
> > so may it can be removed all together, anyway that=E2=80=99s nit that m=
ay be Will can
> > fix it up while merging.
> >
> > Otherwise, For the whole series
> > Reviewed-by: Mostafa Saleh <smostafa@google.com>
>
> I'm happy to drop the 'level' field if it's not used. We can add it back
> if/when it's needed. Rob?

That works for me, thx

BR,
-R
