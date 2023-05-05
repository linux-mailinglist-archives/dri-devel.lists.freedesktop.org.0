Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF216F88C6
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AA210E65C;
	Fri,  5 May 2023 18:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A592510E07F;
 Fri,  5 May 2023 18:43:51 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6a981550a5bso823366a34.3; 
 Fri, 05 May 2023 11:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683312230; x=1685904230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4pdblOCKvKljvd3lXygquACLsd/IRc8PSSb+NugNm4=;
 b=dtGMDmpQZB7SRB5s+WIyYisoEeoycbf5CnNbQJWztU8WhxxcWc5bk7wGfk5KFpnTjw
 lMpJ+FCsFCuLhVFVCAL5rVgzTfNosUyDMKXkA9i3gDCLUwD5n8JfUNKvQQg215KrLZn9
 n92CzLCHf01nnhiT8CwlAv6vHZMO+Deb0FZNCgQO9QdM99e+fKJ4S2ZnTRxPDD+krraO
 LWzjJqjIk7F4xVrDUdhCf5yNlcFTf45Na0B/1xanpvMYXSoU4sGA4bKrejQuSy15eMay
 1OvT8qf2xePKI5h91QEbjhZFMGwbiWVQsus0LVHsl76izfUyrMMIyywbBVf0VcviLVhV
 dxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683312230; x=1685904230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4pdblOCKvKljvd3lXygquACLsd/IRc8PSSb+NugNm4=;
 b=Jhm4jRdiX7YoOaPH6H5OctihgIE6sSyhtBc5hFciu/ahsooeYKH+T7TbgxWpB4GNFm
 lGvBbsg8atBsqvkt6v3h59YiVJ7WOsI49U8g2fNYv4igUPobTCq50VRPHhaE17AahvFC
 m1pHXy4c+p89ijXi4bHg706wdPWoj1OfyFCOY/sioQ3sjJoU0n5TzjSwIN0cYPZFvp54
 006x4dB2B5nDbtS0qE/rlb7l0Hrn7hCLnAyTsy5VP3ZuDpq9WO8cH5Sdt0HCVvVnldeu
 xnzm7/fBu/Yihu1QgOZATVHNH/+cNzgca7L+XiPiZiTfjaPYad4ZrmE30bNPI6uN/6iq
 2VrA==
X-Gm-Message-State: AC+VfDwD2nCpS/6Zq+KzQHzHNI5Jcils/EiS1/zoYiaLHVVSRcIZgVcW
 OpbuFAI+aoMxQ29ut8ujFOji8nE52U3JiuFhPO4=
X-Google-Smtp-Source: ACHHUZ6OEsPLmLXH+0imumMZMd/9cYH7numkoemynqIkDrGNQbO1s4IhcThFhobrH1P+ewfUAEHyKvvD2+O9XQNSrT0=
X-Received: by 2002:a05:6808:150:b0:387:2833:619f with SMTP id
 h16-20020a056808015000b003872833619fmr999985oie.15.1683312230136; Fri, 05 May
 2023 11:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230505113233.3813801-1-chenhuacai@loongson.cn>
 <c4146636-2321-b271-b480-b8693169c119@amd.com>
 <70129238-a589-1d70-a7f2-50a35b4ee897@xen0n.name>
 <CADnq5_N+G5M6OkT-exM_Bot7OXPopVax5hyLERoTRb70ns8v0w@mail.gmail.com>
 <fcdd2774-f8ab-9e5d-6274-d9d326cb6fbb@xen0n.name>
In-Reply-To: <fcdd2774-f8ab-9e5d-6274-d9d326cb6fbb@xen0n.name>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 May 2023 14:43:38 -0400
Message-ID: <CADnq5_Myf7EJrBOswenvEF7ANjj0LP2Yva4ZAGpUyW4GJLE=3w@mail.gmail.com>
Subject: Re: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
To: WANG Xuerui <kernel@xen0n.name>
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
Cc: Pan@freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 5, 2023 at 2:39=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wrot=
e:
>
> On 5/6/23 02:00, Alex Deucher wrote:
> > On Fri, May 5, 2023 at 1:57=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> =
wrote:
> >> <snip>
> >> On a side note, I had to modprobe amdgpu with runpm=3D0, otherwise my
> >> dmesg gets flooded with PSP getting resumed every 8~10 seconds or so. =
I
> >> currently have none of the connectors plugged in. I didn't notice any
> >> similar reports on the Internet so I don't know if it's due to platfor=
m
> >> quirks or not.
> > That might just be part of the normal suspend/resume process.  If it
> > happens at regular intervals, it sounds like something is waking the
> > GPU at a regular interval.  We should probably remove that message to
> > avoid it being too chatty, but you may want to check what is waking it
> > so much as doing so sort of negates the value of runtime power
> > management.
>
> Ah. This is extremely helpful as I'm immediately able to confirm it's
> node_exporter trying to access the hwmon readings (I have a monitoring
> infra for all my devboxes). Every sufficiently spaced read from say
> temp1_input wakes up the GPU. Not many people have their boxes working
> like this I guess... but at least we could probably reduce the log spam
> a bit if it's not feasible to get GPU metrics while avoiding to resume
> it? (Currently it's 25 lines per resume, mostly SMU resume logs and ring

Well, there are no metrics to pull because the GPU is powered down
when in runtime suspend.

Alex

> info.)
>
> And of course this is not a big deal, I can always work around it
> locally. Thanks for the hint again.
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
