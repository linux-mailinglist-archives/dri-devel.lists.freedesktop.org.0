Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CE27B21C0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984D110E044;
	Thu, 28 Sep 2023 15:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A6E10E044;
 Thu, 28 Sep 2023 15:50:04 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1e106eb414cso441448fac.0; 
 Thu, 28 Sep 2023 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695916204; x=1696521004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+oaP8TaORSoGDFnn0D8hLzy1EvVNodSU/WczEXtpZ8=;
 b=WLUqqRcm5GcEcu4r5gyu7lf1DWZb30vy1UnsO3WT+vagjnHULKcPLLsHGKlp6vI6fB
 Tb3Jiuj8UnoiU3tVCoKyyzii3fh4+5UnvC53I+e1aluCtiELqFUJQLXRNkiACu3MbNiL
 u3QmDsW4wTAM7h8OCIffv0SSHZ7vuzoNspeyyG9RXKsKnRKkDxHqU6ySVyXD/Gv7j8k2
 BFTPzXirzdeFAUVDKK7fj+7wLO/dJ8Du/48JLngBQAmYRKrwFj9cMivpGXTecTq8Wz54
 TJlBuYyz8iQT5TZh5wtkYZWIZIEwowc1uOMhIls5xaqIW+KBvWdA+nVpz1K1j3pYuNIB
 c8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695916204; x=1696521004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+oaP8TaORSoGDFnn0D8hLzy1EvVNodSU/WczEXtpZ8=;
 b=JhGtXg+6KNl5NxQoarYHghygk+e7/WS7zKaR/Z0cWmtbeIRN4Pqm5r/tVgXqM4+K2V
 WvbbMUXxgMxDnrtijQbe5DIOziBYWCAyNMRDmJJyT2sgC/OWklmCEbwG5BvbboISn0Qm
 m61AuLpdxJyUni4E+cybNx8BVtbYKlxD9gSBPAXQHrylSCSpkCDMdWDkV1OkqYKd3RJn
 bkK+UJ+u2BYbGMTnkUnEPfZMvD+/ICA1HhX9Jgou56aVEeHTecfV/axbVNEdmTGRx+3g
 G3eExbP6e0vKbQY75jWZU2ASedXhL3s5IjSqPun8uHbK0olug9tLn1J1rYluexnuGcPv
 KlZQ==
X-Gm-Message-State: AOJu0YzylrHfmS8qnkMb65Y3OQp8Qhqh4oOU1cJoZ0baHVAWLkIbCBLU
 A5iiCO9II6xX2eEpeK1n9dOI3J5iHDRH7iczIfk=
X-Google-Smtp-Source: AGHT+IGeeO+LcOhSuz08bKSo/PewfWqhVFf6DwTscdRmWW1cU90Hw5dD4NipqycysMadRmYWLbIIjW5nT6YKnfh/05U=
X-Received: by 2002:a05:6870:468c:b0:1d6:3b5f:3211 with SMTP id
 a12-20020a056870468c00b001d63b5f3211mr1638616oap.31.1695916204052; Thu, 28
 Sep 2023 08:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230928094540.37437-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230928094540.37437-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 28 Sep 2023 11:49:52 -0400
Message-ID: <CADnq5_Pusu-BPRxZnn7YkykbEskL1EUmyJvJbad4AmU+SJjG0w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/kms/atom: Remove redundant code
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 5:46=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> drivers/gpu/drm/radeon/atom.c:396 atom_skip_src_int() warn: ignoring unre=
achable code.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6713
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/radeon/atom.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/atom.c b/drivers/gpu/drm/radeon/atom.=
c
> index ceb6d772ef94..3082d08a06c2 100644
> --- a/drivers/gpu/drm/radeon/atom.c
> +++ b/drivers/gpu/drm/radeon/atom.c
> @@ -393,7 +393,6 @@ static void atom_skip_src_int(atom_exec_context *ctx,=
 uint8_t attr, int *ptr)
>                         (*ptr)++;
>                         return;
>                 }
> -               return;

I think this should be a break.

Alex

>         }
>  }
>
> --
> 2.20.1.7.g153144c
>
