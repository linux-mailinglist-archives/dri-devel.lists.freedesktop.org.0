Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458D9708938
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 22:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2060410E54D;
	Thu, 18 May 2023 20:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F1A10E54B;
 Thu, 18 May 2023 20:12:19 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ab113d8589so2145754a34.3; 
 Thu, 18 May 2023 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684440738; x=1687032738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Saf0zfqm07ePmwqK9Uni3ddlqu/Ais3Oc8azNzsCmaU=;
 b=NuTPx45raB9XoRXKchJ0d6OY/wNzW8Cqnv82qSfn3TnsUYuRWkpoELQOjLVIvgErso
 pMbU4AOOXdCupKcNQm5HNHXqKyfx6i1nNhgNIeTcQ9czZes9f8NMvaq0xr9KaUgziC4I
 YCBt0ED6uw1wmusVVtMAmaF61rd6CnYtrDvinrurN8QRixN51qqgv/s955fhdzMR+F+8
 kNTo73hMITJWI1UtdHsifXw/3Ns5U97hY1o9SgymvdT66tH12LZl1dHJxhnJDh3dF4pI
 kpu/hi7NnsU3y9hcUbb2EiBnTX689XdttOa1h8ugR8JjH5IMOaNuAuZSO1lqHOwg1NKB
 KuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684440738; x=1687032738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Saf0zfqm07ePmwqK9Uni3ddlqu/Ais3Oc8azNzsCmaU=;
 b=Lsiq+KjiZS8+q+rPbVhOPf6lq1Hyw6uh7Ozwf91V1Qh77zAtyfGXJtx1Bc0oqVfhl4
 YG+Nm4ir9VmI/ZEjQa8etey/iUerSNZfgTbBMyCtO+Uqdts03B9882bFpfKTL0JyA2GF
 0iY2oc/ecqqlpqRxNq8XjaYasDRuT8XEiPzlGwv+QtUjCTWBFvAdfWmF3WoA6jqu/X1l
 /7cLZU3MyEKD6TOPxDhFGWFp1jSEGfCh4H+e/dws9F86/xTjqisG/LEkHiO3uWQe/986
 6mxugLmTqfmB7wEc1ZvLIyKve9/MkTWZG9ETHG2WrQvMWAOsD2OkHc78c7UVJmCoHCPh
 XSgg==
X-Gm-Message-State: AC+VfDxgcoG8Bn/ri8Y/cY7T1tN1lxH78n5wc9/CLZvJqj1rz8W3/txH
 yA1m88mA4qyC6c8NKQlvMhgGSwx4ARJdq8aq1bQ=
X-Google-Smtp-Source: ACHHUZ6jAdZQT7MaeZBAPc1hOum2bkrZ9ZOaKkrXqG4BvsAtpzj+6/tE1JzA6oJxJWJqayseYKopP/RNfDTGCIBRyDY=
X-Received: by 2002:a9d:638a:0:b0:6ad:ed25:3caf with SMTP id
 w10-20020a9d638a000000b006aded253cafmr1940815otk.9.1684440737969; Thu, 18 May
 2023 13:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230509183301.1745462-1-olvaffe@gmail.com>
 <CAPaKu7TqUt1L-5RUuwEagr2UUs8maOO+FSoS2PEoP9eO1-JJSw@mail.gmail.com>
In-Reply-To: <CAPaKu7TqUt1L-5RUuwEagr2UUs8maOO+FSoS2PEoP9eO1-JJSw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 May 2023 16:12:06 -0400
Message-ID: <CADnq5_OsGqg7CoNVgtgr91a+pyBtJzoUOBXHKmGMcOM9hLFkwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] amdgpu: validate drm_amdgpu_gem_va addrs for all ops
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Mukul Joshi <mukul.joshi@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 5:27=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote=
:
>
> On Tue, May 9, 2023 at 11:33=E2=80=AFAM Chia-I Wu <olvaffe@gmail.com> wro=
te:
> >
> > Extend the address and size validations to AMDGPU_VA_OP_UNMAP and
> > AMDGPU_VA_OP_CLEAR by moving the validations to amdgpu_gem_va_ioctl.
> >
> > Internal users of amdgpu_vm_bo_map are no longer validated but they
> > should be fine.
> >
> > Userspace (radeonsi and radv) seems fine as well.
> Does this series make sense?

I think so, I haven't had a chance to go through this too closely yet,
but amdgpu_vm_bo_map() is used by ROCm as well so we'd need to make
sure that removing the checks in patch 1 wouldn't affect that path as
well.  The changes in patch 2 look good.  Also, these patches are
missing your SOB.

Thanks,

Alex


Alex
