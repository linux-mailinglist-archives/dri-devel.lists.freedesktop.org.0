Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D857ED692
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 23:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409DA10E27B;
	Wed, 15 Nov 2023 22:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769E210E27B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 22:02:17 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc209561c3so48165ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 14:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700085737; x=1700690537;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuZvFHzKeqbg6jXEYOC+etK401rPBU1DU0zLZUwkdow=;
 b=hzPg+y3T1dD5Ir/CizsnBoPG998mogcD4+9+R0Ikt8wcrfzrhCWS//jlhn26XBwxyi
 b80j7bDlct8jCxMoKEgNPGtPavC+7a9Nw/j4/j3Uq3OsH9RVVry2YFjZO6AnSqdaOj9j
 /h/qmY0EWBD+MHwtCUaIaDQIpTq/32n9hnZDnLDv1AYC36BqSaY3hm+ADgfCgwR0KUTx
 bd1FUvJlFZi0xAKYQiA20Sc+9mLk2CdqcpnAp0Vt/6ClKKaR9FUzKMNoN92bsJXBF1rZ
 zB4alAPNVk9KZI2Rb6+gQ9elFluERZZhefQF+H97oAJ6fuFe1TV55CVSLeKIfUGIV4Op
 Rl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700085737; x=1700690537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuZvFHzKeqbg6jXEYOC+etK401rPBU1DU0zLZUwkdow=;
 b=iua+6EIBK54XMvnWGYGttzQRhb1VXEgXi991PDdkFDlyzKEk7J+dIPWZh8vfV4+3c1
 QoArjeiQrMiGdIoI5qMNtMSw3PgedzYNYUEy6gnvlB4SbS1phs3vRXjGXS31CFQtMDTq
 AkGqUz5J0TZaq/huDbzezca1Y5J3vAF3Istu7SUiyQWrQE3l6UlN21iR1YYho9OjvVgC
 2aktJifnKqwPjvC3UmiInHRiWhnQuRRtraYYrx4ADjtDHZD8fZaNOgp9SoJXJvsb/yQh
 8+BW249y/V/K/tXQQ04PQpnm0dJv21T1vDM6OsibJi4LXU87uVVzG/vv5Ye6l3Rmg/nz
 704g==
X-Gm-Message-State: AOJu0Yz95RFb0xmB9NmJ3NckXLct57InyYg1I1dXMtXRyhPTmvWjzqH9
 DieF+p5M/4ZjMbiQBR5hTHXC9A24aqE9RsAxqZu8
X-Google-Smtp-Source: AGHT+IFRrz+wFMxIvQfSahyfIBqJGBGy54Oa9WJpbdDj3Indo4j6kQ+gLppqjmS9wzYszPzrga5jiO2H91ugbxFInwY=
X-Received: by 2002:a17:902:d506:b0:1c7:25e4:a9d5 with SMTP id
 b6-20020a170902d50600b001c725e4a9d5mr45085plg.17.1700085736744; Wed, 15 Nov
 2023 14:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <ZU/V2XX71GbaV6Q8@duo.ucw.cz>
In-Reply-To: <ZU/V2XX71GbaV6Q8@duo.ucw.cz>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 14:02:05 -0800
Message-ID: <CA+ddPcNd20Bg_pYWqty90NafwC54dz0LGEmTMpia5_7e4=N-cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] dma-buf: heaps: Add secure heap
To: Pavel Machek <pavel@ucw.cz>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main goal is for secure video playback, and to also enable other
potential uses of this in the future. The 'secure dma-heap' will be
used to allocate dma_buf objects that reference memory in the secure
world that is inaccessible/unmappable by the non-secure (i.e.
kernel/userspace) world.  That memory will be used by the secure world
to store secure information (i.e. decrypted media content). The
dma_bufs allocated from the kernel will be passed to V4L2 for video
decoding (as input and output). They will also be used by the drm
system for rendering of the content.

Hope that helps.

Cheers,
Jeff

On Mon, Nov 13, 2023 at 3:38=E2=80=AFAM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This patchset adds three secure heaps:
> > 1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Pa=
th).
> >    The buffer is reserved for the secure world after bootup and it is u=
sed
> >    for vcodec's ES/working buffer;
> > 2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
> >    dynamically reserved for the secure world and will be got when we st=
art
> >    playing secure videos, Once the security video playing is complete, =
the
> >    CMA will be released. This heap is used for the vcodec's frame buffe=
r.
> > 3) secure_cma: Use the kerne CMA ops as the allocation ops.
> >    currently it is a draft version for Vijay and Jaskaran.
>
> Is there high-level description of what the security goals here are,
> somewhere?
>
> BR,
>                                                                         P=
avel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.
