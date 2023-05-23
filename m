Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F384F70E920
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1813D10E53E;
	Tue, 23 May 2023 22:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B2510E53E;
 Tue, 23 May 2023 22:36:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-96f44435d92so5388266b.0; 
 Tue, 23 May 2023 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684881372; x=1687473372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJ7ZmWG4Q4BvrYYLs6pY11g+dx1Cyty+51jRIHXwtBg=;
 b=D2b7e8kyRvS5VH6KgfIZK1RSqHvtDFLEuz+CW4cfB1aQiYg/u2gEt7zA+D7rYtTr3E
 VnKasyXBE2vLe2IWCFJSYYQtH4t126JS2IDgQXVyR6LrFYjx0gKOcY6upEICGbgOI7KC
 zz9otlmEzmyxyU5ldny4dWHCQWDzdvP/Yn39351wqAQ86Y1NiaTgLnWKLQKCDx16RKeL
 6q45GFsTOqIEmyvUlqJ/7vpm+OfJYWcQBwY4KaK4gGXQHYZL542Rj3OUwtT2h4yWb/c4
 JRTn+J3FbcJZtxZOJorpuiwv35U3FwfytTsAWoxCbX1jy2JV/we+mJjTw9iMcDLFHv+B
 RcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684881372; x=1687473372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJ7ZmWG4Q4BvrYYLs6pY11g+dx1Cyty+51jRIHXwtBg=;
 b=LamNMBLgYVTrKA/LhkpNC8OaQOHWvQ2VIWOJVJFg5opxVRVzQd2BE5GYtzgUL0rWP3
 sYcaTCNcdgFDHh7YAAjqpgMVpfl4RCejr8UQhcqlk4JQVEAJADvnvXATtZyAbteNrelS
 YCwqvB2RbqL3Jhn1mV4NscxXfL9AjDtGjSONbGbdE2eUHLWRNww78bN7Rf8739XxPto7
 c+dny5qgW0sfx5lqihfGUO/yom3Hl7b55/nuHGCcYmVP8PqfxEHmJFwoOOOq7QtuGeLG
 yRxlEquDYMM0COiNkhxU7LvNrJqzyTFQR9IqKIZwWdFEQn+9N2BMNmePeoOIxnkZLG0+
 fYvQ==
X-Gm-Message-State: AC+VfDzUnzDJ4c1Xkyk5OoWTArpmkdpq4J9wq+4a1/7H8TqjDOZql/SE
 3urLnsBEh/OlGiTqE5VaVM2Pbz/J8VdyAO92Ueo=
X-Google-Smtp-Source: ACHHUZ5KhfEnz10O6Bbwl+KbaNnAualHSthXv84cMbwoArBDBcwkcKrlgghK3Tw7ROX4+XN8u4bfy72StUi44AJkazQ=
X-Received: by 2002:a17:906:729e:b0:96f:6590:cbdb with SMTP id
 b30-20020a170906729e00b0096f6590cbdbmr14201813ejl.6.1684881371975; Tue, 23
 May 2023 15:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230509183301.1745462-1-olvaffe@gmail.com>
 <CAPaKu7TqUt1L-5RUuwEagr2UUs8maOO+FSoS2PEoP9eO1-JJSw@mail.gmail.com>
 <CADnq5_OsGqg7CoNVgtgr91a+pyBtJzoUOBXHKmGMcOM9hLFkwQ@mail.gmail.com>
 <CAPaKu7SQ0NkDVN3NNRoJxGRQ8x2T2uXcxZJEkt7g2CkEzVU3Sg@mail.gmail.com>
 <07ce00de-c686-05c6-3f27-f8857417ef10@gmail.com>
In-Reply-To: <07ce00de-c686-05c6-3f27-f8857417ef10@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 23 May 2023 15:36:00 -0700
Message-ID: <CAPaKu7Rsn-Uiaf6z4VGbhcwuiKeqX0dK5kJZJgs287XHtQcoig@mail.gmail.com>
Subject: Re: [PATCH 1/2] amdgpu: validate drm_amdgpu_gem_va addrs for all ops
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Yang Li <yang.lee@linux.alibaba.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Danijel Slivka <danijel.slivka@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 12:12=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 21.05.23 um 20:49 schrieb Chia-I Wu:
> > On Thu, May 18, 2023 at 1:12=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> >> On Wed, May 17, 2023 at 5:27=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> =
wrote:
> >>> On Tue, May 9, 2023 at 11:33=E2=80=AFAM Chia-I Wu <olvaffe@gmail.com>=
 wrote:
> >>>> Extend the address and size validations to AMDGPU_VA_OP_UNMAP and
> >>>> AMDGPU_VA_OP_CLEAR by moving the validations to amdgpu_gem_va_ioctl.
> >>>>
> >>>> Internal users of amdgpu_vm_bo_map are no longer validated but they
> >>>> should be fine.
> >>>>
> >>>> Userspace (radeonsi and radv) seems fine as well.
> >>> Does this series make sense?
> >> I think so, I haven't had a chance to go through this too closely yet,
> >> but amdgpu_vm_bo_map() is used by ROCm as well so we'd need to make
> >> sure that removing the checks in patch 1 wouldn't affect that path as
> >> well.  The changes in patch 2 look good.  Also, these patches are
> >> missing your SOB.
> > Indeed.  kfd_ioctl_alloc_memory_of_gpu, for example, does not validate
> > va.  I need to keep the validation in amdgpu_vm_bo_map for it at
> > least.  I guess it is more ideal for kfd_ioctl_alloc_memory_of_gpu to
> > validate, but I am not familiar with amdkfd..
> >
> > I can keep the existing validations, and duplicate them in
> > amdgpu_gem_va_ioctl to cover AMDGPU_VA_OP_UNMAP/AMDGPU_VA_OP_CLEAR.
>
> The key point is that unmap and clear don't need those validations.
>
> It's perfectly valid to request unmap of an unaligned mapping, it will
> just fail because we can't find that mapping.
unmap and clear_mappings convert addresses to gpu pages so unaligned
addresses are treated as if they were aligned.  That's likely fine
except that might be an unintentional inconsistency between va ops?

When args->map_size is 0, eaddr can be smaller than saddr in
clear_mappings.  We are also at the mercy of how interval trees are
implemented.

>
> Regards,
> Christian.
>
> >
> >> Thanks,
> >>
> >> Alex
> >>
> >>
> >> Alex
>
