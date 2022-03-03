Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2CB4CBC41
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 12:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12C110EA57;
	Thu,  3 Mar 2022 11:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C0E10EA6D;
 Thu,  3 Mar 2022 11:16:13 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id jv12so3793103qvb.10;
 Thu, 03 Mar 2022 03:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y9DlD3oCdFvs1u/R5SJKhZ/VIJ18Ddk/lN0S1Fli8aw=;
 b=l2GX1pEkiLp3APYwLaIixZZOxYJXvSsBgETozQrWrh+aIVn80upugXc9s0JothnyAU
 OslmBvRX/yuGseFw+hIxK69Mdj1Qao/eNmhHYiv9T+ruAgizL0arsPdUHk34h/0iwBP/
 ARBaKFAzBI37Crmz0EGauZ6da5movIlm967E/bzDQC0GXBLdOj0ATLQzmhJnB8bYSWIn
 I0x16pQ1uezsigGsyJY4cINKTFXYV0NJ68IrwK9byqqQIVtdPp5/6qhQOPGllsrFrZ2p
 9QgVte58ZeMaoEgSO1ckO8hsF24txWhMVoAfzbPtmIAiJmQ/DV1PMMHT8eNr/AiwgJnQ
 M+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y9DlD3oCdFvs1u/R5SJKhZ/VIJ18Ddk/lN0S1Fli8aw=;
 b=rOy7+o5HNaRrYUH5e84naSOFSKmgLPzQl8wDQKyknZE/EtnH4ecSEPKeEJAELOvHdT
 V7guP09JsegxC3a30imtkvCD6ckXFKzJynNNXAeIQQyElB/aInQE9Rv6vk5nRTU1+zl8
 eEtGXuePSqyW0KkDgVXvVrx9yiiKET0CAX0rtXA5cKnNkJd2tvnVB0luzP2hLavZXB7d
 N0Fa83N9qCDD9/3qw16qZi+wDPSz2MAJh1RlGifXp+PczxYaMNCaN9i6S1XDLsGiGz0P
 45N9Nd7oqwmr4J6RhphHbWhw2QbpXAgqXkr6MpaSpRqB1n0Z5VEo/1/bkEPVcOHGzPrm
 93QQ==
X-Gm-Message-State: AOAM530cmfCAApV1lc3pqiGTqCL+It+8Na12xSitQShDtMJzcATVA008
 X0XISr1oVPQJ6t3UlLLhKOk/abKPpeJ5VB/ZNcc=
X-Google-Smtp-Source: ABdhPJy2PhWLWch8BJkzIgQi78ExoTPK/IMtiwfcnaZ2bYp2/EEV9L8nUiJ2A9XjIWOPZ9qJgA9wrwB9mzRfqmt13Co=
X-Received: by 2002:a05:6214:cc3:b0:432:56c0:688b with SMTP id
 3-20020a0562140cc300b0043256c0688bmr23746146qvx.21.1646306172547; Thu, 03 Mar
 2022 03:16:12 -0800 (PST)
MIME-Version: 1.0
References: <tencent_7E4716854F78B812C4FF16C83573486E1806@qq.com>
 <CAM0jSHO=yudjZeWbVCwdVnaJ1kJ7k34unQVvyCBxTji=u3WnWQ@mail.gmail.com>
In-Reply-To: <CAM0jSHO=yudjZeWbVCwdVnaJ1kJ7k34unQVvyCBxTji=u3WnWQ@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 3 Mar 2022 11:15:45 +0000
Message-ID: <CAM0jSHMkSNuyjEKGtDBdmpLcQS8-r_ZevR0d2iVTGEVvUmKV3g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: check the return value of
 kstrdup()
To: xkernel.wang@foxmail.com
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Mar 2022 at 10:53, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Tue, 22 Feb 2022 at 13:32, <xkernel.wang@foxmail.com> wrote:
> >
> > From: Xiaoke Wang <xkernel.wang@foxmail.com>
> >
> > kstrdup() is a memory allocation function which can return NULL when
> > some internaly memory errors happen. It is better to check the return
> > value of it to prevent further wrong memory access.
> >
> > Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Scratch that. it looks like the for() already accounts for this, as
pointed out by Chris.
