Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFCD7DF7F7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023788921E;
	Thu,  2 Nov 2023 16:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DDE8921E;
 Thu,  2 Nov 2023 16:52:42 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso601646fac.1; 
 Thu, 02 Nov 2023 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698943961; x=1699548761; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ui4RfJzpp8oZSTAGwUEFNZzYkRDHy/N87GoVOtgxAXQ=;
 b=J1W3DjWVKPdYoay9ew8MqmipiCxdATXzHWXoV/4Ix3C7UH4ZIDQITyS6h5yMZAjQ2m
 /52jP2c5/DofXIQph9BSRW5lrA6xlQSs+ZE0zWO5znPVUx6sFzrMwy2/MtDDS+CEQedH
 zp/QDYRmemRm21a0LzicrqxJsc/fgvqJ3QZiM2qjxNVc2yWoSy9JZwKlx9lmc80/gqDT
 vfX52msOMsZ4Uh7xsDsMrf6V7akZmOx9H7XduGARORyPcxBYWnKdII1qp7TO4UdJDgOc
 VPS/AZ3/jkVSBcvtstnuyNbKsbE1p4pUuh3L++Bipy/gBsEM2Cy++f+rckLlXbZ9iK8z
 mC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698943961; x=1699548761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ui4RfJzpp8oZSTAGwUEFNZzYkRDHy/N87GoVOtgxAXQ=;
 b=a44WkH0fvCrh28r8/TMibSnjsLEKoBAf6HR1r2WetB1eQ1egPtWvDSiJzjtyBS0WlL
 fW8cW1ZFBIpqLpMN9McGuqfXz3hULWwvPGjkUr+DDTJhFcC0RAfKydfpIyHIhwFf8cVy
 DoeJUCJVS8H0PrbbyYPhax/2T7FjyI4hV8CNbUwTgxoJyBXScsjgk+rwodWEhd/HOJX6
 9pi/YizYStu5scqZwhbrpqlfDShNqdxr+SQy18CGPXB3JMA5Te1Ybyr+YT6adtqrVKUC
 cTvBURqXqOGa2lujoLbxAJgAyBq68yYuhC++tRWqKAnTxUuzYFsVqGfix1fjD/eVt9mB
 05QQ==
X-Gm-Message-State: AOJu0Yy7Od33zX3PUqqO6sa2A2+UTkjmAxeGRqmPnO14zzp43Y1GlKJX
 N9uw1G2MHBfq6pCRLJfZ7QxKNRVetmJ1K8zJ7qc=
X-Google-Smtp-Source: AGHT+IEsdW4B2/8cahRRswQBtqGr+aRM+u2mFgCDk0qJ+y9EqqQ0+4bkkNKQxCWr5LP+k+NDi9OYk6xVSSk0kFnmAhI=
X-Received: by 2002:a05:6870:1281:b0:1f0:36ab:2886 with SMTP id
 1-20020a056870128100b001f036ab2886mr4655407oal.41.1698943961740; Thu, 02 Nov
 2023 09:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian>
In-Reply-To: <ZUNsmJGbYwgPaUpY@debian>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Nov 2023 12:52:30 -0400
Message-ID: <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
Subject: Re: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
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
Cc: regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "linux-kernel@vger.kernel.orgLinus Torvalds" <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The latest mainline kernel branch fails to build x86_64 allmodconfig
> with the error:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In fun=
ction 'dml_prefetch_check':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:1:=
 error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=3Df=
rame-larger-than=3D]
>  6707 | }
>       | ^
>
> git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2")
>
> I will be happy to test any patch or provide any extra log if needed.

This was reported earlier and fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Db141fa036c901303ca5659cc22e9c08f8b097892
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
but I guess maybe different compiler versions are still hitting this.

Alex

>
> #regzbot introduced: 7966f319c66d9468623c6a6a017ecbc0dd79be75
>
> --
> Regards
> Sudip
