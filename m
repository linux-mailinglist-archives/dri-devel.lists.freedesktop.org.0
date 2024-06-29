Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8691CFA6
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 01:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0910010E0BF;
	Sat, 29 Jun 2024 23:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OP6wszPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C11910E0BF;
 Sat, 29 Jun 2024 23:19:02 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b546c8b743so2183646d6.3; 
 Sat, 29 Jun 2024 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719703141; x=1720307941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XroRg26Q/56W42BWJJi+I1OGaZL3CPZqLZHzczquNHs=;
 b=OP6wszPKpMyGrzxLCPT1QSyS0XgP2v7leQTaQ/E8CC7OE4a+wrH0LmznSxPVphApuk
 kA3bE/baRZIWeuwQkuMG9WsbD51xqV/kzBvj9FzU69vyddoAyvXbNl2Yro63eDANitrw
 94Cvj2KEGoqNnCf4GZX9HIii/ICvkk24jAfa+f16OPtd5ApUpP+WDz3pSudyCfzSVTXp
 xL43HbWuE/ScNFheMEJ4BBVzZqjFuzDzvys07lWEQSKZVh+rHPHNaeGQQyzDzt/tekgj
 LZZ4dj7FyIzxvEbHiDnZfiFbN2Cndg0L8xbBxKAwQBiD7C1oOcZfSvaBxYovbvWT4GwG
 e51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719703141; x=1720307941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XroRg26Q/56W42BWJJi+I1OGaZL3CPZqLZHzczquNHs=;
 b=d1T8rNgnh3ctFy0n9bsC4TmN25+0y/Dvxdw8KzG0MXjRbvg9afZhEZQc46mtFufBNz
 QygRKlP6H/Y5ZCh6Y28EYFEgU4IpyoVUdJDyR3oNhufOS+aiTUgRZ3j4ewnF4VSAR1cE
 Q7xZyq0R/n7gWxxO1T5UkKKwh9AUAh4bXO8cOig2cycXQvLaLxyObVgqI4PAI4gJepbd
 Zj06EENtu6hkOOQk64XXfclDKzh9Vn6LL6cU7NtOA2d9orOT8KRikEE7rupm4hWHCYfM
 aBAjnvvLDF0rCyaCiwzg+APC/PT1I1WSgC+9i1l/mtpmcBw3bnip9thBD7Upzdp2wKL6
 hKBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkyOQiAuw+wVrMuJSmpXd6FNgt2RSz/l2qECVnQFrHSP7HgoO9OKgkRHOmArXA7lb0vLl3LKIbp7tarY2jWDuLFBEyXsANAzXsayv8b3uFYHALGS+E8WNvI23OZegOBDBBPRjGS37dSxPYaMYUnA==
X-Gm-Message-State: AOJu0YzEgswM8qmPsi+dEv+EOzzbQrR18xoHt0+/DF/Wewx4klhMIMU3
 XyhV5yJdczotT7Ea/wDQtv+6J7TvWPA+ruJ1FLjsMxCWZ/efYu1M7ALa4rITevI9HoZrtSF7NWF
 ToWbZd+pgu4V+qEPBRKNiV/pnaJk=
X-Google-Smtp-Source: AGHT+IGhxpyC1sq9wMq2Q8/QZ9d1fuFaSnh4PKaVqBVKSUiIvqWIae53ZCaOAlyNYIk/opAz33KCSq9czjF9x4ULey4=
X-Received: by 2002:a05:6214:20a3:b0:6a0:cd65:599a with SMTP id
 6a1803df08f44-6b5b70a3951mr22698716d6.2.1719703141242; Sat, 29 Jun 2024
 16:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
In-Reply-To: <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 30 Jun 2024 04:18:50 +0500
Message-ID: <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, 
 Linux regressions mailing list <regressions@lists.linux.dev>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
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

On Sat, Jun 29, 2024 at 9:46=E2=80=AFPM Rodrigo Siqueira Jordao
<Rodrigo.Siqueira@amd.com> wrote:
> Hi Mikhail,
>
> I'm trying to reproduce this issue, but until now, I've been unable to
> reproduce it. I tried some different scenarios with the following
> components:
>
> 1. Displays: I tried with one and two displays
>   - 4k@120 - DP && 4k@60 - HDMI
>   - 4k@244 Oled - DP
> 2. GPU: 7900XTX

The issue only reproduced with RDNA2 (6900XT)
RDNA3 (7900XTX) is not affected.

--=20
Best Regards,
Mike Gavrilov.
