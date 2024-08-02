Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7994650E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 23:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C80710E163;
	Fri,  2 Aug 2024 21:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LTvocQTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D3410E163;
 Fri,  2 Aug 2024 21:29:58 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6bb8a12e9e3so2980176d6.0; 
 Fri, 02 Aug 2024 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722634197; x=1723238997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eqd5DSqcYMAnbki6Oa/uDzMz0iJTYPIDWjPGs8KfInk=;
 b=LTvocQTBg4optWmLSg8YDpMx/29DA2EjFGAcvVCQqCLhpwPamKXQd9zlF6oWbRraLM
 XyAlm5SGt+ea4qAl/8hKRUnTVool2BEmgAJagc5w8CTfUcNYlVO6WM2ybORMPDzd8iG3
 NuIIldUm/xe3gGp5Vzp03h8L6zWGnhZcuebtcju/rgnU1JfC/DaO7TKTT0O2ky8zPyIL
 /vFXh455g/vFMj3Kqe/bhH/Eyz0nQyO8u97i76TkXqDQWRQzJxlpB4y8MqLxSVleCCWk
 iimoQcoOoqKcta62RgaCti/d2ZN/3+105IT4e8SxAHygE6kljcw/RANfKK0sq8rpNQLG
 B5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722634197; x=1723238997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eqd5DSqcYMAnbki6Oa/uDzMz0iJTYPIDWjPGs8KfInk=;
 b=ZjYJqpJZmBXeLz2sajzx9+tzKOp1NQAReAbe+QMK0moXUuZwPoCpcX0JydcmEtFOmW
 btTX2aG8JZSBElXzVKx5aW3m9cT4KB2TPVuf5ZKD7/08mZ8AxOM1YUya8rxtpOPSYVGM
 kkp4fdJ7L9zn17yMgxQCBDvXwVHT9cJoyiaFpOR+bHYaONxL2BAX0PzcaCrXwWlxc+Rc
 NHrViqrcaCheJojHtGr/YaNYmI2hFU9bBw24OF5JbxrJS8TvZuGdaCSMihnWKiU35rzU
 i/Ydl9pMTJ7Syio/9QxVPdJkYvWkIcehbQKffIh9PiiGxhGw2XwuwSRYrmqkRcPY9l5j
 I8fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeYWjQwjqAoa3IJ1akHImwwjGrhyjraM/GyulDYZqtsywDruwNNTH5lUZpa5vHD7ukd3zti0Rsltgw@lists.freedesktop.org,
 AJvYcCXFGn/ibzHAY/sxypjF9qpdERxFvvpmCP39Z2tKy0hVgNqor0fTt9zwuChw7InkJPcOVr4YDhWc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrAGObZkkryXH8uE4NNJAc5DfWXwzNEvQNYe7r0MLHwIXcK9FI
 SYn4bREkC3c7Uo3/0C6OoldhNOJViVUPnhri5vxKz6Gh5JJnvsVmZlc77RETLt967oA3VD816Yu
 2jJorpDQQQ5IIVEmMr3nh5W+Hr3o=
X-Google-Smtp-Source: AGHT+IGeyPkk/dWhUIyWDzjMBB8iGs4RL6xounmSFkrEvZlAvm16BiP8UqA0qIQBOFfHGQPdk9Nxri4ADWEeHCXChxk=
X-Received: by 2002:a05:6214:e8c:b0:6bb:3f69:dd0c with SMTP id
 6a1803df08f44-6bb984bab76mr33918776d6.9.1722634197160; Fri, 02 Aug 2024
 14:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com>
 <1266c4af-a000-48c0-bd0d-79c2e918aea9@gmail.com>
 <CADnq5_O-hKQZoMxuX2=HiukiorxE=bFAJownQFkTbzNR2d411g@mail.gmail.com>
 <CABXGCsM=Q-Xp2d0Ht2J78FupEtOtMh1bhVMUZtOqKqSoiZA8cQ@mail.gmail.com>
In-Reply-To: <CABXGCsM=Q-Xp2d0Ht2J78FupEtOtMh1bhVMUZtOqKqSoiZA8cQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 3 Aug 2024 02:29:44 +0500
Message-ID: <CABXGCsPr++1ViN467+uP5G+wdFmZ_Bnjoor9VLndZoAG4qS-dA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - Since commit e356d321d024 in the
 kernel log appears the message "MES failed to respond to msg=MISC
 (WAIT_REG_MEM)" which were never seen before
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>, mukul.joshi@amd.com, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Wed, Jul 24, 2024 at 10:16=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
> > https://patchwork.freedesktop.org/patch/605201/
> For which kernel is this patch intended? The patch is not applied on
> top of d67978318827.

I am able to apply this patch on top of e4fc196f5ba3 and the issue is gone.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
