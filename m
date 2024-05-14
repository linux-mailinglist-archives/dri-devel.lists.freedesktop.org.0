Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87CA8C5B7C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 21:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB18510E136;
	Tue, 14 May 2024 19:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kR9+6zMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BD110E136
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 19:08:05 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2b37bc39decso4067667a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715713685; x=1716318485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l7gJ1jGOfc0uuKsE3YPwqokUa9StmsGv9lzNrtz5bw8=;
 b=kR9+6zMdO0L+CdE23N3fMfMN22VYxHuezTsc4lepxf5JLu+x0LtrcDygsa6D68IBYK
 NNkRFV0maTo7I7LBP3DUItO9pNcduGoqP69DA1be6G5AhSpoemzfC1SIaYeZcfuMMqxQ
 Zp34EJ9dvtbkXlYKfuIcrMfJ7K1JKnE0hFB256bMsxquRsz6YEd0teg2PhEncNHiGMbl
 qid0CG9tSoKl0L7I9x2KCz+bCt5nxTk/52kxrMW1EiBo+hSdf/mxpQ7YKHUb2Pg5cFz9
 +InD4dQS7RIssFoVLbIdWx1rFAAIYTCq20eoGYzwYFFGUQkzqYtedqNmrFB+gcqc4HDl
 g8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715713685; x=1716318485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l7gJ1jGOfc0uuKsE3YPwqokUa9StmsGv9lzNrtz5bw8=;
 b=d1nP+VlQFhC5aW1T0OKvEyUWoBRS89dOS3tonNiOLFe55yJas8eCF+al872yTpEhkD
 zyxd2g8stD2CTy9RHjcpPHG5KU5fHTxs4uiV3Stcp9N04/XwL7YelmaDxFuTLeMG8Edl
 RPNhfAGTcyIWWfx+Deph+CVQWcRcMSVCBNaG8c+IX27sCThXSwwKRtKfgi5C0wah76eQ
 CPrTqdu5O6xZt8CJKWg2pVCJiQCQ9HDC24EYkI44v1rkKbLxLWOurR9Gx5cEgB5di1WH
 KWlSYtfCiQXBiApHATNncCmRn4xhn0mIlrGssUXY9q3RYohbkQpKMCtzcLvVZy7TrJcJ
 6PzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqmrxK63oWcFqLEBLfXzibG+lK9Q04AFV6RL8Uub/O+wqeCqUEz5x0MCF1xL0GzcXodd4t4i64U2ITY/9ZH3eG8Z7aHxsBx67XzBykI5y0
X-Gm-Message-State: AOJu0Ywj+V4S+Ra1ynpjEda67Rtdw2P3Zofo1m87GdNwJhyY5f0qgMtR
 wUK39GzpszcFc5Zbl3toYhWVB/hXdWKyobeAkpMSudFRLUhZZqWx3zLBP0k2wVIn2SgnuZiygrh
 PftDfiq1X1I772oVMm+x9GAeiqgM=
X-Google-Smtp-Source: AGHT+IHCCEoKj19UznkogC+zYoUc7bQR4OFX0YiHMuxVUCgZ6i1gyjrpfzvT6eBTiL6WIXw1/13vW0/aDeCk+Z3YrfY=
X-Received: by 2002:a17:90a:ff91:b0:2b6:ab87:5e5b with SMTP id
 98e67ed59e1d1-2b6cc140159mr11949740a91.9.1715713685105; Tue, 14 May 2024
 12:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240514171417.492a1301@canb.auug.org.au>
 <CY5PR12MB642964F3A1D72F422DCB814BFEE32@CY5PR12MB6429.namprd12.prod.outlook.com>
In-Reply-To: <CY5PR12MB642964F3A1D72F422DCB814BFEE32@CY5PR12MB6429.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 May 2024 15:07:53 -0400
Message-ID: <CADnq5_Mf5zUJGajNnrhJB4qAAe_H--Xd=+ABUS6JHL=vvbdVXQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>, 
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>
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

On Tue, May 14, 2024 at 2:20=E2=80=AFPM Nirujogi, Pratap
<Pratap.Nirujogi@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Stephen,
>
> Thank you for reporting this warning, I will address this in the next amd=
gpu patchset I will be submitting in this week.

Should be fixed with this patch:
https://patchwork.freedesktop.org/patch/593995/
Sorry, I forgot to CC you.

Alex

>
> Thanks,
> Pratap
>
> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Tuesday, May 14, 2024 3:14 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Nirujogi, Pratap <Pra=
tap.Nirujogi@amd.com>; Dave Airlie <airlied@redhat.com>; DRI <dri-devel@lis=
ts.freedesktop.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.or=
g>; Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: linux-next: build warning after merge of the amdgpu tree
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (htmldocs) produc=
ed this warning:
>
> drivers/gpu/drm/amd/include/amd_shared.h:110: warning: Enum value 'AMD_IP=
_BLOCK_TYPE_ISP' not described in enum 'amd_ip_block_type'
>
> Introduced by commit
>
>   a83048bfa402 ("drm/amd/amdgpu: Add ISP support to amdgpu_discovery")
>
> --
> Cheers,
> Stephen Rothwell
