Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BB82493E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 20:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B3610E009;
	Thu,  4 Jan 2024 19:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FF210E009
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 19:51:07 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d3fde109f2so27575ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704397866; x=1705002666;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0fBUOM0R/wxHfJNIbk+Hsj3pvgiZjJxtJP8ZKkEMHY=;
 b=mNEf4iJp6L5CZmnasgpbdF1L+UiF90gi8qUEk+K6JXexgAGBS+JWg4wy6HvLssRSML
 cO4nVE59lMdrmnPCd0oRtOHk4sMhEH6aA5p6Xk+6iUwigEWGrYL/LAoAdmxpVk1NSOIJ
 F7zzMvd7G5EmqvpRZjsP6iTU8JjSQMyiQIaTiMHCphHbHqmHsNeoobH2cD7W5iIbj4WS
 eFPm+cGIObf5KZyzwN8NSO4IK2XmnCmuz/cw0pw1ZqA5vpRRE61VOG0Eb7LABIdy0efO
 Q0pBHi+3joZ2/KWbCcOhBgtjmE1JcG/AdbHlse0kN02/xRKvTCaxOVX64Xlp8tkHq5ya
 zxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704397866; x=1705002666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0fBUOM0R/wxHfJNIbk+Hsj3pvgiZjJxtJP8ZKkEMHY=;
 b=Lbl68tHEptVU0CK/gXTRMnn2lIjnvX5pvqIBkrZpb/7omMWdNe6O75KQUNUHigS4oK
 QLColT2/hqrHKxTbSCRMhaDgaI12i3qkzlQRwERYKUeRxAYo1Lb6XDKBsp/YDKqxS0T8
 THPYMdgKOisZAa85pa40zCZE/c//lSdQoLpJ+04HiSKMfdDXdoS09BxSl6Q4LMwZLfNx
 Vc6Dq50PyUjPLwa/kffRHyjNIU9WpYYRxlTwddwnFanQZXtDncYUK2oWSl31xu1j9JpH
 0Aa9o/dCC+86Jd1g3sMDunZCnniMkRY9Q20/axs+Jqd4BC5/xE0WZ96a/6O9WOQEvX3l
 jTJg==
X-Gm-Message-State: AOJu0YyOnYn58IQH5hX8diLRPd/ChWa++yutW88WdjElBz5VLAjK5rF8
 fOj+afNYxCVEL9GDvhQ3HpiXgyjJsjQvD9+ChOGnx3vgPzQ=
X-Google-Smtp-Source: AGHT+IFqzvWpoM2uA+6FBRb2VzfC6a4Pu4eHXCZULmxK95LCj0aqs1mpvIbjznkas7f4lRb0XubNWN1kTL/JdAY9AX8=
X-Received: by 2002:a17:902:6e01:b0:1d4:4482:83c3 with SMTP id
 u1-20020a1709026e0100b001d4448283c3mr39053plk.16.1704397866221; Thu, 04 Jan
 2024 11:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell>
 <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
 <20231213161614.43e5bca8@eldfell>
 <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
In-Reply-To: <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 4 Jan 2024 11:50:54 -0800
Message-ID: <CA+ddPcOew7Wtb1-Cakq_LPN1VwtG+4vpjpLFvXdsjBunpefT1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
To: Simon Ser <contact@emersion.fr>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Any feedback from maintainers on what their preference is?  I'm fine
with 'restricted' as well, but the main reason we chose secure was
because of its use in ARM nomenclature and this is more for ARM usage
than x86.

The main difference with similar buffers on AMD/Intel is that with
AMD/Intel the buffers are mappable and readable by the CPU in the
kernel. The problem is their contents are encrypted so you get junk
back if you do that. On ARM, the buffers are completely inaccessible
by the kernel and the memory controller prevents access to them
completely from the kernel.

There are also other use cases for this where the hypervisor is what
is controlling access (second stage in the MMU is providing
isolation)....and in that case I do agree that 'secure' would not be
the right terminology for those types of buffers.   So I do agree
something other than 'secure' is probably a better option overall.


On Fri, Dec 22, 2023 at 1:40=E2=80=AFAM Simon Ser <contact@emersion.fr> wro=
te:
>
> On Wednesday, December 13th, 2023 at 15:16, Pekka Paalanen <ppaalanen@gma=
il.com> wrote:
>
> > > > It is protected/shielded/fortified from all the kernel and userspac=
e,
> > > > but a more familiar word to describe that is inaccessible.
> > > > "Inaccessible buffer" per se OTOH sounds like a useless concept.
> > > >
> > > > It is not secure, because it does not involve security in any way. =
In
> > > > fact, given it's so fragile, I'd classify it as mildly opposite of
> > > > secure, as e.g. clients of a Wayland compositor can potentially DoS=
 the
> > > > compositor with it by simply sending such a dmabuf. Or DoS the whol=
e
> > > > system.
> > >
> > > I hear what you are saying and DoS is a known problem and attack vect=
or,
> > > but regardless, we have use cases where we don't want to expose
> > > information in the clear and where we also would like to have some
> > > guarantees about correctness. That is where various secure elements a=
nd
> > > more generally security is needed.
> > >
> > > So, it sounds like we have two things here, the first is the naming a=
nd
> > > the meaning behind it. I'm pretty sure the people following and
> > > contributing to this thread can agree on a name that makes sense. Wou=
ld
> > > you personally be OK with "restricted" as the name? It sounds like th=
at.
> >
> > I would. I'm also just a by-stander, not a maintainer of kernel
> > anything. I have no power to accept nor reject anything here.
>
> I'd also personally be OK with "restricted", I think it's a lot better
> than "secure".
>
> In general I agree with everything Pekka said.
