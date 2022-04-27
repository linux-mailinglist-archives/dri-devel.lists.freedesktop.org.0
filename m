Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C251167D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 13:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2BB10E086;
	Wed, 27 Apr 2022 11:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8634410E346
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 11:55:31 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso4818891pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 04:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XBfYKgyvKuh7NYO35F2lopTiElAeAwWqKXu995VG6ks=;
 b=c3STxWdlX83L33uy28WQFadwyaHWa2fehuwmqjshJCoCeeOZyvT5CxFuKdFsW3VEGg
 ffuxqmn2cPlBjBWAuStUHEmYHbnyWy3yBrkkHpX67KybBXKv2ffyUR5fwLulyeCyRTdP
 Z4BZE3Y/yOTTB3CwYNoTvPgwjlb3w5u0Pvux12HWho3PD86ZupboSBhYlx9ak7fqMDzX
 cXYAOHcuOJr3Pp9HQnwg8diDivRS8xh0WPiBebi4wWXH9denxqhBgGdD7PL+bSWBAYPv
 CCxZ7oZ1fDU0+568hOPwKDkG+CmnoMSqHQgM/hpz7fe/tMywyx/TGB2yUsn6/z3B+XHS
 oCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XBfYKgyvKuh7NYO35F2lopTiElAeAwWqKXu995VG6ks=;
 b=WHWGC57Wh9LzyXnvR15fydirdNrYcxxU8ol9bVCt7ihAv20GUTzxW+kioRj40dVFa2
 Xiv1dWTrz3qwDiiIwAfnzEZsTvsxmlqNRO5cGdfJt+WXU2QW2JexdWuWUvSMk5Q27MWJ
 Nxw4l40gw1cV2TouZZ9ub69/m//M0IKp1qXBQXTUkqCI74DR8d8IXELxWGdGG0+LZw1J
 qf0F3QwxKwicZbaxn/RwmXCYsm2URtPOR+GCSnaD36dLsgEgSaRnUA3tXeXKmrDHrDKV
 ueSZ8p4sitjj5n6A2vfEUD3T0GNLD6VVql4RS7Ntfb47ftSiNSM7wJvRVS4usFLxl8tp
 PqzQ==
X-Gm-Message-State: AOAM533L6AIvpXb4V62lUYUUB5b7TUegjNDbBYyl7DSvvzQ0U7Rq93wI
 0ThFKnUGjNn4WVCHDMR2CkNeaj6Xc/W1OFRHuwSxMxFLkwStxA==
X-Google-Smtp-Source: ABdhPJw8CrMPYh7Hj0TvqgDAmyTAHMro5hMBI1YiAfxE4sJ8Dfmdih8Crhpjae+e9JnAwGMKx1ooBj8qvIz43d397Uc=
X-Received: by 2002:a17:903:31d1:b0:159:804:e852 with SMTP id
 v17-20020a17090331d100b001590804e852mr27999972ple.19.1651060531108; Wed, 27
 Apr 2022 04:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
In-Reply-To: <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 27 Apr 2022 12:55:19 +0100
Message-ID: <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Apr 2022 at 17:36, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Hi Mike,
>
> sounds like somehow stitching together the SG table for PRIME doesn't
> work any more with this patch.
>
> Can you try with P2P DMA disabled?

-CONFIG_PCI_P2PDMA=3Dy
+# CONFIG_PCI_P2PDMA is not set

If that's what you're meaning, then there's no difference, I'll upload
my dmesg to the gitlab issue

>
> Apart from that can you take a look Arun?
>
> Thanks,
> Christian.
