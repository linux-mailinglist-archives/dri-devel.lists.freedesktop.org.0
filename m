Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D252D4132C8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1826E92E;
	Tue, 21 Sep 2021 11:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BFE6E92E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 11:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632224678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=smuNaEnJ+NDnQZ5k5SUUUDPcDxuq5FWWzOX8OWaixkw=;
 b=GGan6Bz7YdGqwps9RsFzS7Xv38b8v95Mq298RV022rCp9/MZRvH0HPhCBbhmXYTCY1k11L
 g38w4WsdgifpfCDAAGOtMoV0oZZwfgJZ3l0zjJhzrtkZj+2weAW4/yqcDPS2ZeLcj6gZOV
 MBmeX4Y5y6nZkw9BTOuJC77orL3BrKM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-dPt8-p4eOV6cbi4iRgCtyA-1; Tue, 21 Sep 2021 07:44:37 -0400
X-MC-Unique: dPt8-p4eOV6cbi4iRgCtyA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso7236529wrb.20
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 04:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=smuNaEnJ+NDnQZ5k5SUUUDPcDxuq5FWWzOX8OWaixkw=;
 b=wVkIguYBSOioijUaW0wYfbiVsS3jS3arlhlZL41OojSx3MyMBPo3gEbQi9wdbWunpi
 LHbDnLPJFE0LTwSxsOfynuFR/54o0k7x/OscCqaHRs/yBhnREMc0lSc9nM3nR5uuBgEN
 HLLvFgaw7VnHzVBaC3DWctwlH6qiSAOueMGTHNGNdALtQJh8l6Wf4kR2GHIuM+Y0m08S
 vSuoxUkTGRR8ijC9Aum7K0ROR77CgA2/CgbWWr8Nm/ChSAqILYpvQOb06zOyzI0yY1F3
 EVr3YtQTXGr03viVS8l5sBFWTqvQQUGpe42iC9gT8WNNPPBPJGBh7rnFvtt3h+MOkU3X
 7lAQ==
X-Gm-Message-State: AOAM533ifXss8qD0IWWzffwZAzKymn3wE38C33aOpwJDf6xSPMZPQOen
 fwv7Udo7BHr9aoDYdHNi0ZguoT54m0bwzPbwlf6QjQj5vnCLTIIrdnfHuLydTiFyf/N7wJTSWhV
 PDxVN09H9JXzwFLnnvI7z/q41csLxCevBCGSs1yrJgKnb
X-Received: by 2002:adf:b19e:: with SMTP id q30mr33543768wra.116.1632224676619; 
 Tue, 21 Sep 2021 04:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw79Q/HX66PnkVBC+4du0pbX/DSMG8T5FG4oIKqFPYl3crG59oN2xulNeq7zKh8hkqIJe4GQxQnR2Vk/9qyT4I=
X-Received: by 2002:adf:b19e:: with SMTP id q30mr33543756wra.116.1632224676472; 
 Tue, 21 Sep 2021 04:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210921090735.247236-1-skeggsb@gmail.com>
In-Reply-To: <20210921090735.247236-1-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 21 Sep 2021 13:44:25 +0200
Message-ID: <CACO55tthR2__qP11xdRz=GwxyPUeO2jUP7F-qm9h+aWS5w-aWg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo/ga102: initialise chid on return from
 channel creation
To: Ben Skeggs <skeggsb@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Tue, Sep 21, 2021 at 11:07 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> Turns out caller isn't zero-initialised after-all.
>
> Fixes: 6b457230bfa1 ("drm/nouveau/ga102-: support ttm buffer moves via copy engine")
> Reported-by: Karol Herbst <kherbst@redhat.com>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> index f897bef13acf..c630dbd2911a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> @@ -179,6 +179,9 @@ ga102_chan_new(struct nvkm_device *device,
>                 return -ENODEV;
>
>         chan->ctrl.chan = nvkm_rd32(device, chan->ctrl.runl + 0x004) & 0xfffffff0;
> +
> +       args->chid = 0;
> +       args->inst = 0;
>         args->token = nvkm_rd32(device, chan->ctrl.runl + 0x008) & 0xffff0000;
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->mthd);
> --
> 2.31.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

