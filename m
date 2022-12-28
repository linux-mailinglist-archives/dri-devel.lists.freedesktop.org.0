Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E32658148
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 17:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF9D10E3AF;
	Wed, 28 Dec 2022 16:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95D110E3AF;
 Wed, 28 Dec 2022 16:27:37 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1442977d77dso19028296fac.6; 
 Wed, 28 Dec 2022 08:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ZhQClWFIcBl0ygmc/QauHM+cjqjyHocrS0cIBaenjQ=;
 b=mzYFFz+0Tgrs80jQw2Rjkv+2EIcYy3QlRXFCE9OM2cUIQDp3TFJp7/owmXfDLXyRFX
 XUTCK1vVnVO3nN7ZzcD72dGOweUVZg6H72G+IlVryj9fKwkbMJMjOvBWN8g4a78X3MUp
 h25c3OroIVhlqtrP2bAzFleubhJjgFjc+193sAGlHxEkerwsV5CkPz6kmO4+16+9olrZ
 ATituJeh/KX0KQyunioLMN6O3I9JAZTAkdE75lxZ3xmONwatr2lr3xTbyneiwry8D3iX
 +PnPU/TVst0IDgU2eB6O0qujgCObaDUdzNiLLAN7RLP/9PH4kmSW+bOQjrm3RknoaoHk
 JC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ZhQClWFIcBl0ygmc/QauHM+cjqjyHocrS0cIBaenjQ=;
 b=0+X0TmrW9yeKyZdaPBLpK5+TxlLxfkpC5JT945SF391/Pui53t9Om/23F7zYSrbJX9
 z2jlMcyMpiBayGasaQEYtvyCkPTfQ5FYBkCMhBbjwnNTqD2xLWnbLhoPXd1+rIQDUh9V
 SoTHeWNM3Q+m5oAmh2IvvsNyzPmSWCZ5xO5W1QGlL6k19nzE69jThb0kbRxezedi7wOY
 dpCbE3Wa7T0v60CLnGFEEDKquPaEbZFPaAFsWZ11OnLj5/SG2tRyzBi/NlbVJQh35DQ6
 Qajp3BFPe489c038H2wJyZhGTWQkyOd8Q9+EcXi+xEtIhVqlaSRELO3UjP6iwedjB5G/
 Bgmw==
X-Gm-Message-State: AFqh2koGoqzdV/55gaz38YYPbwFTTTTGOI5FJEIdylc7zlZdkFl8LaX/
 Vz3uEd8Svd/yOqy2zBkff7HzPtJ8Jrq72b7K4to=
X-Google-Smtp-Source: AMrXdXvaXmtJs/5ybExFr2Ig26hmNQ0Hlf+GkXaM5ru6XDLWYtd++30HLB7OHeUwSh+Lb1CU7+Cf/apGkAW0y5Vk1qw=
X-Received: by 2002:a05:6870:513:b0:13d:51fe:3404 with SMTP id
 j19-20020a056870051300b0013d51fe3404mr1500722oao.183.1672244857038; Wed, 28
 Dec 2022 08:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
 <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
 <74d74689-9c8e-1691-a232-c18271974f37@collabora.com>
 <126a8c1e-69ec-5068-1aad-30f5e7c3ef21@collabora.com>
 <4f5766ab-d31f-d0c8-6b1e-0c7e0fbabfed@amd.com>
 <50308598-324f-f628-a4f1-55da3935a2f5@collabora.com>
 <067ffcf2-5d46-fd37-3df8-0de1714573e4@amd.com>
 <647e876a-9710-c6bd-9cf3-a513d879c36a@collabora.com>
In-Reply-To: <647e876a-9710-c6bd-9cf3-a513d879c36a@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Dec 2022 08:27:26 -0800
Message-ID: <CAF6AEGtKsN=KX3Y7bBCrKBD_GsTnXMG67CxoS8jbM6pqgmY9CA@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Jonathan <jonathan@marek.ca>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 7:12 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 11/17/22 18:09, Christian K=C3=B6nig wrote:
> > Am 17.11.22 um 15:41 schrieb Dmitry Osipenko:
> >> [SNIP]
> >>> drm_sched_entity_flush() should be called from the flush callback fro=
m
> >>> the file_operations structure of panfrost. See amdgpu_flush() and
> >>> amdgpu_ctx_mgr_entity_flush(). This makes sure that we wait for all
> >>> entities of the process/file descriptor to be flushed out.
> >>>
> >>> drm_sched_entity_fini() must be called before you free the memory the
> >>> entity structure or otherwise we would run into an use after free.
> >> Right, drm_sched_entity_destroy() invokes these two functions and
> >> Panfrost uses drm_sched_entity_destroy().
> >
> > Than I have no idea what's going wrong here.
> >
> > The scheduler should trivially finish with the entity and call
> > complete(&entity->entity_idle) in it's main loop. No idea why this
> > doesn't happen. Can you investigate?
>
> I'll take a closer look. Hoped you may have a quick idea of what's wrong =
:)
>

As Jonathan mentioned, the same thing is happening on msm.  I can
reproduce this by adding an assert in mesa (in this case, triggered
after 100 draws) and running an app under gdb.  After the assert is
hit, if I try to exit mesa, it hangs.

The problem is that we somehow call drm_sched_entity_kill() twice.
The first time completes, but now the entity_idle completion is no
longer done, so the second call hangs forever.

BR,
-R
