Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA2D16EDF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 07:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B14210E453;
	Tue, 13 Jan 2026 06:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eAZWB5BW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D84110E453
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:58:42 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a081c163b0so46954835ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 22:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768287522; x=1768892322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=v0wtDg3/NAN9kt8oWyIWMeqCacGDPCLQ5PqTweWycMo=;
 b=eAZWB5BWu8TeAD/i+iMfgUXv7CJycrBQv+9oC0fawMx7Dzy9SRe3qbXq3iofRlGf/8
 5ACy5Zs8hDpjPruzvkmyWkA2OON4Z5GiG42ZgzIuwRQLEIigZN+v9s1LTAt+zWThL5kM
 mEC/hT3b9b9rnavOA7w5thWRn55fhHUjd7BMz1HydMYN2/IEsy4t/cXviqpRdKvt2WuG
 PV+/H5+U5/A6r4yOsywJDOrE5P2OQWTDv7VPqzF+utoiOHmue+RpgFq7M9bAfQuxI7LU
 takxbg+Z8i1zNolWKOKJsZEDyCA/pvBgoXdkElqFNSDV3k95TNh0/c/08oukqQKOv20V
 nkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768287522; x=1768892322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v0wtDg3/NAN9kt8oWyIWMeqCacGDPCLQ5PqTweWycMo=;
 b=ROGg/foFwe5S8EQ5WbqM7dGMp5q95ZbE5WvjRtilAoj/QtBuivrcS2dZQVLvr+JcHt
 QWjKwZQuMcwBnzl+Eidyf1SDXE53HwoSbET+kufvvkUIVh+dMwrq7KVOMp7S6HfUstOa
 4o/riuPEbHpaeAq9z9as0FdLdx32LRDQmLolehXi7Px7qc6kBXHNlGNFBcPd1UR0HgSx
 9Wp3dYDuSg5G8aCu4CTJRO4z3bK/peMyeEWaLN5QzbjesBQiHWA8zX4fSKUN697kHtuE
 5yDHQqlYetrss8vofhc6ynMW6dSjYkZf/x7jlfAInkGix4rN4H2vGFYqAlk2C2cWcbN1
 A5gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoNofWzIP7AMbkcF6fnKTrVFcqgO6ckoVqbNfvHh1FNjzjitAd3uR9bZ4Ymbp0JjHvRqWwB12eByo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSLJ8DGlCDSVMGGpiD+mMfz+HsCloPDHKnGnEA4ZaQjxg8lMB7
 5ogjLhhHVQRJmgDZbRef58gbctZTokR2rMFdVVmFvOLTR6Ej37OmZeeZgW9E8g04deC4AOx4pWb
 H+LTolus9mwQmnCRG2gBhcZRcRD3u4+M=
X-Gm-Gg: AY/fxX54yCvsg1SiXpz4SwM4+tnrnPZSsOWNXqZlUShSSFBL+FM1YxCVnoRL/18KzV5
 nB8rj125jW3AAn1L7mGcT56BiZSNgnf1xanuXo+179bwgEnusZOo+qcdzk6e0LApy7252DPxKzk
 4dpgs6XbM2Fj2DPM3mi6IepcJUeUc6EQYMyFaVyXaD56MSqVO3EYCX6Qf+DsVRZAfunaMLBAt2n
 9l3Regi8OqlfE7dnyBxkZ7rkyFdGFSD78iv+Pk9MSWMgy+wLf5LkVOrWqAkfxC7tOGc
X-Google-Smtp-Source: AGHT+IEDVedBQs5GfreScTfX4yE9cE9dmVGG5ks4O89dQrxXlzHfxJKIw2ZOnH5F/6u5XdQzjdfyn7tUBJ5AnhLzyoM=
X-Received: by 2002:a17:903:1b6b:b0:2a3:c667:e0a0 with SMTP id
 d9443c01a7336-2a3ee47dee7mr224342905ad.29.1768287521679; Mon, 12 Jan 2026
 22:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20260113023839.4037104-1-xjdeng@buaa.edu.cn>
 <20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com>
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 13 Jan 2026 14:58:30 +0800
X-Gm-Features: AZwV_QgAW4BzVTUyGjflZNCkvP8Jwnfwfe8NpKmaCwTyZdbmheLOF9_bQe0CWoM
Message-ID: <CAK+ZN9pFiC5tj_-cEdp_B-BOwBZRat-JxococWd_mWRtEVLDVA@mail.gmail.com>
Subject: Re: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
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
Reply-To: micro6947@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the feedback. I have regenerated and resent the patch as
v3: https://lore.kernel.org/linux-arm-msm/20260113065409.32171-1-xjdeng@bua=
a.edu.cn/T/#u

---------- Forwarded message ---------
=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A Mukesh Ojha <mukesh.ojha@oss.qualcomm.=
com>
Date: 2026=E5=B9=B41=E6=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C 14:36
Subject: Re: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem()
return in rpmsg_probe
To: Xingjing Deng <micro6947@gmail.com>
Cc: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
<gregkh@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
<linux-arm-msm@vger.kernel.org>, Xingjing Deng <xjdeng@buaa.edu.cn>,
<stable@vger.kernel.org>


On Tue, Jan 13, 2026 at 10:38:39AM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not
> checked.
>
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration
>
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to=
 the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

I don't see the lkml mailing list as part of this patch.. please use
./scripts/get_maintainer.pl to collect all the necessary mailing list
and maintainers to be cc'd.

>
> v2 changes:
> Add Fixes: and Cc: stable@vger.kernel.org.

Changelog should go below ---. Also include the link to the v1 in it.

> ---
>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index fb3b54e05928..cbb12db110b3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device=
 *rpdev)
>               if (!err) {
>                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
>
> -                     qcom_scm_assign_mem(res.start, resource_size(&res),=
 &src_perms,
> +                     err =3D qcom_scm_assign_mem(res.start, resource_siz=
e(&res), &src_perms,
>                                   data->vmperms, data->vmcount);
> +                     if (err) {
> +                             dev_err(rdev, "Failed to assign memory phys=
 0x%llx size 0x%llx err %d",
> +                                     res.start, resource_size(&res), err=
);
> +                             goto err_free_data;
> +                     }
>               }
>
>       }
> --
> 2.25.1
>

--
-Mukesh Ojha
