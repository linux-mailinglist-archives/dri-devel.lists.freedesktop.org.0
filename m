Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDB29C28D9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 01:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE5710E027;
	Sat,  9 Nov 2024 00:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nqYqgVFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39A010E027
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 00:32:22 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6e2e41bd08bso29851857b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 16:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731112341; x=1731717141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzGBt4boMiiZuZvN2Ls++s1/zYrgRuf8vuf/hILFtVw=;
 b=nqYqgVFiiWLeKhf21mRx1zyng0GoX1MrTbdSOHLe7e/VRzlh6aQB529+XeB60cZcAV
 avIFkDhUIJ94imPirN+m+H2ceJanTBT0/7neLGlQyvqqZ5lzXOOxaOZ4kfs2QJSzwrws
 F1d9BczrezMOZUOmpjfdjXmZWzjF3iAN8U0QA/ZzCXaodankhi1fcPNC7T1Bq6YITEz0
 kX+IRX0iHW8XsdRAJCSKGebXExX+Nqw+kjzbBfjg2oNjqtNNKOr6pVxSz2vK8hDVjZsd
 1LDHZbRKAlqX5tp/pGD4B0OuDbCFTY08Y5lf+d/HFxcrtvxC9fbJ2mvyMNKOyTckV2x7
 kDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731112341; x=1731717141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzGBt4boMiiZuZvN2Ls++s1/zYrgRuf8vuf/hILFtVw=;
 b=tvWiOmQ5hHoFKRyUJgoj/6Diyb+4MqUqk6s+KYYioCOsIBVMBcr7lmE6CtVSiHTQNk
 LylkPR97dyzm/+2PCNt8nPJ7PuRHTw2ryWODGibVKUV8RCFqM8SI7p9KStPgBaLx5MmH
 LzGsbjeUmsg8gAQQm5ItXbDYoTqExtPn1K/p8sboDdGuYxaIl6run3EAFLQLzsO3eUar
 VyNEh6MNijnOm2D0t3822YjLuDcIb2Hpcym+rERI7uA7cejw0gzxwVWZNN899cyJMqlv
 7i1RX5ZOIGo50d2PYAvK5s2/XbFyGcKjlCA/Ema9mfrz26/3jJkXnb9DBHsapeAd8Ua/
 nenA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZOLOxJyb2WP9SdI/jYyPsbOIxpiKatdnJIb5vJBv0DjJa/JkbcVUVNAbeB4l0rLl14TnKlievZwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVL0rJlUkeEMYCtlBROSTkBK+d0XPhBFL4bUWS2AP0zXJ9wjOA
 t9e/kcNLBsEmQNpMs7Ck2EPXF1c6Th/+UHViV3t5tAatJXw3FeO3gRGw4ndUBUoWh2QJSlD9fqT
 lf9y/mWbb7RisnBLDcQhIbsOLcH4=
X-Google-Smtp-Source: AGHT+IE5X9GmM9r39Q6ouoxHeof/A+QtZh1JpRYOBUzTnpcdO2qIod3reDVkqRUpGlvR0N8LHQiAL++dpRk2MvyyiWA=
X-Received: by 2002:a05:690c:350e:b0:6e3:3407:8579 with SMTP id
 00721157ae682-6eaddfbe890mr61355957b3.39.1731112341626; Fri, 08 Nov 2024
 16:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20241108094256.3717-1-christian.koenig@amd.com>
In-Reply-To: <20241108094256.3717-1-christian.koenig@amd.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 8 Nov 2024 16:32:11 -0800
Message-ID: <CAPaKu7SK9X3eDb6EkyXjatFT4YqZUhR949ANuYmOPVnajBU1kQ@mail.gmail.com>
Subject: Re: Ensure progress for dma_fence_array
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, lionel.g.landwerlin@intel.com, 
 dri-devel@lists.freedesktop.org, faith.ekstrand@collabora.com, 
 simona@ffwll.ch
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

On Fri, Nov 8, 2024 at 1:43=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi guys,
>
> as pointed out by Chia-I userspace doesn't see any progress when
> signaling is not enabled and Boris noted that this is because
> dma_fence_array_signaled() never returns true in this case.
>
> Improve this by fixing the dma_fence_array_signaled() implementation to
> also return true even if signaling was never explicitely enabled.
Yeah, this fixes the timeout I was seeing on panvk.

> We should probably adjust the documentation as well that when the
> callback is implemented it should make progess visible even without
> enabling signaling.
That would be really nice.  Both dma_fence_is_signaled and
dma_fence_ops::signaled explicitly state otherwise at the moment.



>
> Please test and review,
> Christian.
>
>
