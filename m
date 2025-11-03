Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BEFC2D587
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E5410E163;
	Mon,  3 Nov 2025 17:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EaY6Tv7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7A10E163
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:05:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2DBF6013D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E9BC4AF0B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762189548;
 bh=R8/epIwjK6bK49ZWSDEUOL8uhBPyT7+iUssIctqWPwM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=EaY6Tv7cHr4o4Vfi3GSo8Tkg1iZPjIh2CtCdICyPQfWzhfho3O8ACsyEJNXCcU1f3
 D0LWz0bttvecSDQLjs1boz1AEPsi98IlZT/T6MOs97sSv2Lf4zuv3p9LD7jpM/N89E
 o4Xbilz+6y7+bCiNnviZq2GSlOI904Ai1Ea9/gOJgpw0Ht19WCfrD+i3pFUeZusmEJ
 ZnjlKzoIjaezB8RYWF0m9qincwp49CKthFdx41zFzi3kR/Z7H9xhltClZkWSzYMv5C
 D9zU0PTPDK21/3gwmirE7CXW9svxQo/d+TviHxm2ryicvJ0TWXZsdTCtpIa4jrRiYF
 NF0ZcMjCfN/GQ==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-37a38e56dd5so8298141fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:05:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVA2j3LsnMRmPiM/JXkYW9bu63xkAxzf9oOdsnSEllsfvGezNaQ7HOfuWTG4PQkVXWxoEZD9+LcJQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWgJJp/Nux5nXp7Rxq26SSY5Yb2LmxmeCeMVVniC2T+xcOLHwq
 JaLW/Mn2LR7iP9w6Jpi/dLFA2FDWoCWn9ZT5FDM306d/weK69yl+dAHVQOIKx8eL2uIiOx3xoir
 q7X+uj46ku2sIyofleOY5hNB7pzyyzhA=
X-Google-Smtp-Source: AGHT+IFFN6zMGk4DLXEheEbfJ2wV+RhlYINJykEwMAz/aoaR1rEWNKZw5HxZGXozvXgetNVLf4i7Wb4fjcgrBvfmKaU=
X-Received: by 2002:a2e:7c1a:0:b0:350:adaa:6b93 with SMTP id
 38308e7fff4ca-37a18da8ba6mr26603351fa.6.1762189547139; Mon, 03 Nov 2025
 09:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-26-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-26-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:05:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v67=Qd1G8JyR=5TABHf0uzoiJAw2-TkG_zMKyB0UEnOevw@mail.gmail.com>
X-Gm-Features: AWmQ_bn81nvhbH0jeJNTVxHpTlgEQh8OpKt7eJ5AA-3FjjmbBjHnZ0HpUXyPv1g
Message-ID: <CAGb2v67=Qd1G8JyR=5TABHf0uzoiJAw2-TkG_zMKyB0UEnOevw@mail.gmail.com>
Subject: Re: [PATCH 25/30] drm/sun4i: ui_scaler: drop sanity checks
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> They can't be triggered if mixer configuration is properly specified in
> quirks. Additionally, number of VI channels won't be available in future
> due to rework for DE33 support.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
