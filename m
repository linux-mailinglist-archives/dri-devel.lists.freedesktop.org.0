Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E790A9222E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 18:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556610EB60;
	Thu, 17 Apr 2025 16:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RnjmoZ1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33E10EB60
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 16:05:04 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfe808908so81245e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744905903; x=1745510703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8qDOiyv1h4pWlH3g88O7C4xDqIzRDAqgGgkiAByMFA=;
 b=RnjmoZ1NGDiAnC0OMzq2OiiXmjj8zmYa2xBmcQFA/9K0hRmTNFKKUSkE8ocfaSGTZL
 KsjIj83xC9tktpASxAgMeBi6wChUrW71aEH/0z3ErprjkPFqlO3FgPO4s/HJ6hAgnv8A
 xb23TB8SCAsLj8RgHfACMdQQ8a7dhKyuMAroYYXRe3JmhMJA9OPyobbCNbOWv2NmuNLe
 vZ0J7DU9469M/ekAm8+FeUEFKDGLgQqiXFJMKlag6cLg/m2tPF1k/UVL/nhDs810xOH/
 bMwVR1hWwc7jg/3hC0CCIxl30CLsIhMuiF3WCQ6pMoL2u3Y39j7a39f7/5DHG0vYhqqv
 GMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744905903; x=1745510703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W8qDOiyv1h4pWlH3g88O7C4xDqIzRDAqgGgkiAByMFA=;
 b=fsZKlmuX+Xttta3zw855FB3D3oxCwif+ZeFx9yyH4G+25SBOYXKHPb5107onrJigD8
 Uj5tCRIWwK0heR22brnIFWSG7yOSzr4UFu8JCXrni6VqlXaI6Rh0sBtZce3JJauwUtLM
 oTQl74FS8LgCpm/Wmz/zd8gcfmvWZlYVPoDYso2dr6Anzp7ziN2DT+FM8/aegV2NGMwa
 NkaYCwaE8SESUzzLEGiCVJr71BUP/LDEq+UqkzfH+VcXqOkMwIt5ZcylHcW3DRWM2HZk
 2etBfyhuG0bDnM2BnjZ9r5iROUtS6QxZEt4XDysQv1m6cGdba+xB9EvaigoSRMPweC/f
 HtCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcSEbvaPKyCPXgf7G6yD3U4xwwfusK4DMn3hGHWP8lXU5cQsfUss4uyXDrWV1FFakXg2WCgcWGcL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9pDQOSx+a3wDUiMMDyvRutKcGMaTl8150meV3ryXGZ+RdV0gt
 fEV4o347HVdowPEIioNSGAiNbNDZFTvKHFROcxEn0wZ7U3dOqPUULTbE6BK5OOj11UsrcRpzrgB
 jRpByZ0ML1mHdqDAzDvznbBBn2ZZM5ASFG3RR
X-Gm-Gg: ASbGnct40gzzJ3NJktTZGphZ4xCJL24OTGP/lJAVKf3sm1f2/9FFQP57J/3p49snefq
 AXpzyL3ZDtTVNfDJSVuydIWy4+krcZO8k90rY9S7OZYFW14AtSe9LobKlLsZtWu9vVPJHAe2jAY
 yPiCCcvmDsW50RjaATKb6iZQbFPALsuUIAutld9N0+YZOSS4O8juU=
X-Google-Smtp-Source: AGHT+IHPxO/HoUoGfRA0x5PPvATzdMA6UAFEJv1oRfObulb1rUcdqwGzvQUiketg6T4NXeqjA4RD4Ot7mU9EPOGp8HE=
X-Received: by 2002:a05:600c:1c1e:b0:439:7fc2:c7ad with SMTP id
 5b1f17b1804b1-44063d6fe78mr983735e9.7.1744905902735; Thu, 17 Apr 2025
 09:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com>
 <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
 <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
 <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
 <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com>
 <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
In-Reply-To: <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 17 Apr 2025 09:04:48 -0700
X-Gm-Features: ATxdqUG71xXjeNh_Y--IqcHwHgbok8UYG45JYmWjM55y53LlzggibWtxWiJMWb4
Message-ID: <CABdmKX0P1tpa-jxzN1_TCyk6Cw6drYM+KRZQ5YQcjNOBFtOFJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com
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

On Wed, Apr 16, 2025 at 9:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 7:09=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> [...]
> > >
> > > Here is another rookie question, it appears to me there is a file des=
criptor
> > > associated with each DMA buffer, can we achieve the same goal with
> > > a task-file iterator?
> >
> > That would find almost all of them, but not the kernel-only
> > allocations. (kernel_rss in the dmabuf_dump output I attached earlier.
> > If there's a leak, it's likely to show up in kernel_rss because some
> > driver forgot to release its reference(s).) Also wouldn't that be a
> > ton more iterations since we'd have to visit every FD to find the
> > small portion that are dmabufs? I'm not actually sure if buffers that
> > have been mapped, and then have had their file descriptors closed
> > would show up in task_struct->files; if not I think that would mean
> > scanning both files and vmas for each task.
>
> I don't think scanning all FDs to find a small portion of specific FDs
> is a real issue. We have a tool that scans all FDs in the system and
> only dump data for perf_event FDs. I think it should be easy to
> prototype a tool by scanning all files and all vmas. If that turns out
> to be very slow, which I highly doubt will be, we can try other
> approaches.

But this will not find *all* the buffers, and that defeats the purpose
of having the iterator.

> OTOH, I am wondering whether we can build a more generic iterator
> for a list of objects. Adding a iterator for each important kernel lists
> seems not scalable in the long term.

I think the wide variety of differences in locking for different
objects would make this difficult to do in a generic way.
