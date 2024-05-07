Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB98BE73B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836B610F637;
	Tue,  7 May 2024 15:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RVX7y4b4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195710F628
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:19:31 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso3312708276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715095170; x=1715699970; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3ysPCrT6aDiInuFk99HtusnAXRwhdESoITC61IbLRas=;
 b=RVX7y4b4evkd0dPWKrPma1pKqUsKY0rpYRTIVbZsqD6iF2a7Ser9E+TskAkEO+ng7O
 JXtKYvneCflDv5a2Yghv2y7fCxlXAH8ATBmtXS0chfVKba4SAo1RB+RtEoLeNVzzg8gw
 yTPyUvDxKBE0ZkmIPb+rPuYRwsX6bHIH8Nug+Yk4MuhZMEphE6cggmmA+xx8otYDK51N
 Q+6crG+Eat3Tk1k6Td6sTxOGNXQAoSEv9PTVdV2b5flFa3P7EaIWiy+r5md9OlGPYjuy
 Gumvj2Kfk6rfDQMzSRaGwyL63ykF8np8FCdOLFNwnq403B4ZxQ27Qd73k+N1bEKnEOr0
 Z/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715095170; x=1715699970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ysPCrT6aDiInuFk99HtusnAXRwhdESoITC61IbLRas=;
 b=sHDDMWj437F6+uA2giWXo5ZZ/15u4LKiV/JRSxjGuQeCm3aF0jGZt1wFxfH9kpF/z3
 f73ZECysqPO2SB6AeVy/nBtghIcy2k4mqwMN7qsMC3QgHB6XBF/N+5vCcOq9KCEKs/E8
 y5US555+3VsWKSsisWLjf0gt4UkK8hnkX3Wg0cf+yzb6P0yYdv2k6T3PcYVy6hRZcT9j
 Lc93Q7KzfR73U82N/Rsv40nefwLB3ODOvfrFlTZtCjqmcb2Ps5yXkDIgOqlnEoaiRiIE
 b38if2WK4bSoDQgnT4fyFS78VHk46QLWhy7Q+qFirDDEqcvV4pzaDf3iWm6NpwkcABB0
 U4Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj4WHSxGm3URm9uDVpC4pyg8Hy+ZTj6xdIFTfFl4Pzga6h4pLpz0XjkdmFmi0cHF1YFFoulN7FrWhoxnMo3FljvFeLdUn57oXmqiIfMU7J
X-Gm-Message-State: AOJu0YwKAv868B1HakpgyqOSXY8VVF+rbBGbm+51xyHfxy6DGMmF8jB7
 XlkiBO3bWlq9IIBTtBA/glAgiVKX3iW2XOHW9ZbJCKrr6Of0JOB3P4ckQ84y+9zKvkuqqwWsEiU
 fWk37kR0unxIWr0y9XeadZCauWQO8xW9lkyqPAw==
X-Google-Smtp-Source: AGHT+IEML+Kw1JVUOv0nN6ekdfHok6Y4DPu4GGX6sExCN5x0nEZTwSwW2OQ/aCjdgj8HeWcGREcPXHHI22erdbPufQA=
X-Received: by 2002:a05:6902:2187:b0:de6:327:fa2 with SMTP id
 dl7-20020a056902218700b00de603270fa2mr15626519ybb.8.1715095170220; Tue, 07
 May 2024 08:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
In-Reply-To: <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 May 2024 18:19:18 +0300
Message-ID: <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > providing data to VPU or DRM, then you should be able to get the buffer
> > from the data-consuming device.
>
> Because we don't necessarily know what the consuming device is, if any.
>
> Could be VPU, could be Zoom/Hangouts via pipewire, could for argument
> sake be GPU or DSP.
>
> Also if we introduce a dependency on another device to allocate the
> output buffers - say always taking the output buffer from the GPU, then
> we've added another dependency which is more difficult to guarantee
> across different arches.

Yes. And it should be expected. It's a consumer who knows the
restrictions on the buffer. As I wrote, Zoom/Hangouts should not
require a DMA buffer at all. Applications should be able to allocate
the buffer out of the generic memory. GPUs might also have different
requirements. Consider GPUs with VRAM. It might be beneficial to
allocate a buffer out of VRAM rather than generic DMA mem.

-- 
With best wishes
Dmitry
