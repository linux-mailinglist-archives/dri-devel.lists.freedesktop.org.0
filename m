Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFFB9ADC18
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 08:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2BD10E8B5;
	Thu, 24 Oct 2024 06:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sTpE2JuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814B10E8B6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 06:22:45 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71e49ef3bb9so370518b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729750965; x=1730355765;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uhdy0crX7jd32UBgalA4Mp+yqTEKMoy5/aHTmMprIHY=;
 b=sTpE2JuDgEjW+Hzg/Cg5ck0+21vWj3W+SxgakDe3ho5KJxRERQ22B+n+0JcWsaDuWi
 qtvR3rPVWPedmy4zoEINTkoaue9MX/d8Xr7P061CjZJKHbop/DoLw+3sioXapsawdsFV
 Q/WawThkTd9hy+YvBbV9APkYrBNy4Zg0oW/zPg956mW3ou9H4nVG42UYWiJQJvbtKLw3
 FkHpOYsmhJgvRMi6hixih/9PQKgb0iw3CJkKS9cRN6gy/K+brU/n5NR2uH9fpH+iwq9f
 vuoZguIEvyY9E0ZEseTZqpeXPbQzaSdwL8mjeT0iX6e8qlyKYiMrXwkXLwGUF+cv1lx6
 fxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729750965; x=1730355765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uhdy0crX7jd32UBgalA4Mp+yqTEKMoy5/aHTmMprIHY=;
 b=T8mIKFr1djRNYOB7B8mmR8+H6yNzqnYNl8BVQPhCHtRY0oSA1DiMcrvFKLhVUPfpiV
 2xeQ5npSC0I9IaRZd0nPIIzK+cMfEjeAQRKiFeBKEhSvmetUMAFhZft9FLq5E/I67KBc
 NKW76sYmHQCGmAoGT+KmSc+bg9lTr9t0tfPLtiXTe1b5LTy37ZOQCKGn8kqSktDECFRz
 25cqq0X/wpKsoRIfReq+fdyrw6Fb1SzLTjLibWuuw14EOiv5iOs/eWVpbHZVetZaSIv9
 qwgVaDDmm5zYhbRfxBqrZAY/nLXrutBGiUp0o+a8daVz4dH8+CjUs6WOJ+QwaVVZ6vrD
 L/Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6dvos6gS4xoPX7AQC1Jyhkx/J5wsCq51D0PyhXXtfCDoSEKAxk3j1ii+Tv5gU0ewaKfOl3ya7bfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGRWxlhnQh5qIjNAZQ+rTrJOOLJphrht09aE3GSkCvrBMt7Fdh
 kqtG0Sgkvg4F1/0oWLwpSn+oQeIwpysPSHHP6DozO9Da2FA85yG1pF1Csi47R4kRW83Z1jvK9gq
 EPJS9dlHoi3H++3NOnh7Ai6XmtgNk0q/e7vKh
X-Google-Smtp-Source: AGHT+IHER6S+oXayYMJOfU1uT2MMGdiQY9D03ESwl9edjBhrQ1nxNVeRSlMwT7VT0vKe79wJ+iS8Umue/ckpKLjd6Zk=
X-Received: by 2002:a05:6a00:888:b0:71e:6a99:4732 with SMTP id
 d2e1a72fcca58-720452dc06emr1742555b3a.11.1729750964614; Wed, 23 Oct 2024
 23:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241023191339.1491282-1-saravanak@google.com>
 <7a8dede1-ef29-4553-9412-de8e2f45b860@notapiano>
In-Reply-To: <7a8dede1-ef29-4553-9412-de8e2f45b860@notapiano>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 23 Oct 2024 23:22:04 -0700
Message-ID: <CAGETcx_nSoVy-C-pt0Q3e-4wsU--9MJKoxr2ZSUfVq1UBxMjow@mail.gmail.com>
Subject: Re: [PATCH] drm: display: Set fwnode for aux bus devices
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jon Hunter <jonathanh@nvidia.com>, 
 kernel-team@android.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

On Wed, Oct 23, 2024 at 12:56=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Wed, Oct 23, 2024 at 12:13:36PM -0700, Saravana Kannan wrote:
> > fwnode needs to be set for a device for fw_devlink to be able to
> > track/enforce its dependencies correctly. Without this, you'll see erro=
r
> > messages like this when the supplier has probed and tries to make sure
> > all its fwnode consumers are linked to it using device links:
> >
> > mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) w=
ith backlight-lcd0
> > tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) =
with 1-0008
> >
> > Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> > Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca459=
8@notapiano/
> > Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nv=
idia.com/
>
> Hi Saravana,
>
> the issue faced by Jon needs the exact same change but in a different pla=
ce,
> drivers/phy/tegra/xusb.c, which I posted at:
> https://lore.kernel.org/all/f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapian=
o/

Ah sorry, I was in a hurry and missed the fact it was a different file.

>
> So we need two separate patches, one for each issue. Feel free to add tha=
t to
> this series. (I could send it myself, but I think it makes more sense to =
keep
> them together)

Sent a new series. Thanks for the heads up and the fix for Jon's issue.

-Saravana
