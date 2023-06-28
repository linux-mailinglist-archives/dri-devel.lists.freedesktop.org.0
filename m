Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805867419C9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2A10E390;
	Wed, 28 Jun 2023 20:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F6710E068
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:39:08 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-401d1d967beso100231cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1687984747; x=1690576747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HpPgoFO0pSdncXppmusXrUkfxh4ES6Te3jdG2Cg2eVU=;
 b=2wSG3WNANah+mdgC+nya2O5pWqd4PcmMoSbSQ1RduXR5iKstf64V+594XXv/EMB5YP
 nQZUDgSOkJ0z5K/di8IExvuJiKqTMHF5oTTJM8qQUb16BIBPIAvPPGeN+tKF7mhN58C2
 B3JlHc/+8NsuEwxwLlp7T16pcRQkCIFTJ2x9bh0Y7QnkdO23lwnP8cM9KqI0Ewerz8g7
 cc7wRDDr8l2C1gFvKRvA0q9g+w1dbhRVRlne0ImjC4oDkzpju92K5p0XIaL0Vh2+Uaw1
 7mEveiLJ04k1YYbR2HyGltOXn01eNIbdaOZJAU8cdPmMJAWuk/qDl8Nb9hEOo1qX0Cvn
 FrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984747; x=1690576747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HpPgoFO0pSdncXppmusXrUkfxh4ES6Te3jdG2Cg2eVU=;
 b=AcDE+N8XC0bvflMcHsvAcQ9jf7Td4QeWOZ8zpLB8ZowZWoxszo16+GHnW03tZjEHUq
 1a/+m3gVEzJhRM5dq7s5KC7UylcWa/qNDeccvUFnjZbKEf0EgbfkAisDJzShU2RXbOCr
 IFbajgZNkEqEZSwj6l0N057jhdwNrZzH4/Xhar+ZdNZpvUHDV6BXFyLCe0sl52C0zSUX
 7MUJgWagvRI3YI3GFW4LVhmIw+rq5r/7BHrWfx/lTSx/gUXzESRMkB4WKrTe+glFIiKl
 prcY/P7aspNj+v+vczySCptcH+JUxmCN80YLsJYYsOcYx25muGJQss6xXYYCCcla1FkY
 JOLw==
X-Gm-Message-State: AC+VfDxZDhdvcjBDlY3jGW0Fjm7BClKrCguFEkUQ0wDLqL8yG4K+L8Th
 4Sq6XtEu8dSyCp5d1u9ESxmaMReyn3o4bWdbcrUi
X-Google-Smtp-Source: ACHHUZ4/TbZlYMa41Qfpo1LF3DWnM40YS8CTkj+s37iAs6EIO+6Wa0uTofT6Eaqyh9psw3nW/VBXZb/ILGt5fTgVDk8=
X-Received: by 2002:a05:622a:51:b0:3f8:5b2:aef2 with SMTP id
 y17-20020a05622a005100b003f805b2aef2mr345329qtw.26.1687984746831; Wed, 28 Jun
 2023 13:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230628180534.31819-1-quic_jhugo@quicinc.com>
In-Reply-To: <20230628180534.31819-1-quic_jhugo@quicinc.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 28 Jun 2023 13:38:54 -0700
Message-ID: <CANDhNCqUkhiWgjCuLVX=vpBsHYj9zto95HoBH1f4XqOEkx9Zhw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Liam Mark from DMA-BUF HEAPS FRAMEWORK
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 "T.J. Mercier" <tjmercier@google.com>
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
Cc: linux-media@vger.kernel.or, benjamin.gaignard@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 labbott@redhat.com, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 11:05=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc.c=
om> wrote:
>
> @codeaurora.org email addresses are no longer valid and will bounce.
>
> I reached out to Liam about updating his entry under DMA-BUF HEAPS
> FRAMEWORK with an @codeaurora.org address.  His response:
>
> "I am not a maintainer anymore, that should be removed."
>
> Liam currently does not have an email address that can be used to remove
> this entry, so I offered to submit a cleanup on his behalf with Liam's
> consent.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76b53bafc03c..1781eb0a8dda 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6168,7 +6168,6 @@ F:        kernel/dma/
>  DMA-BUF HEAPS FRAMEWORK
>  M:     Sumit Semwal <sumit.semwal@linaro.org>
>  R:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
> -R:     Liam Mark <lmark@codeaurora.org>
>  R:     Laura Abbott <labbott@redhat.com>
>  R:     Brian Starkey <Brian.Starkey@arm.com>
>  R:     John Stultz <jstultz@google.com>
> --

Acked-by: John Stultz <jstultz@google.com>

Though probably worth adding TJ as a reviewer?
-john
