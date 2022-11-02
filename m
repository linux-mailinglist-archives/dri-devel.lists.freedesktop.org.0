Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA9616344
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 14:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DF510E48D;
	Wed,  2 Nov 2022 13:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7B510E494;
 Wed,  2 Nov 2022 13:01:51 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id s206so19136503oie.3;
 Wed, 02 Nov 2022 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yggPcK5TIy9S6ZT52DUYZYz36AXCmMT/bN7wqCeS1aw=;
 b=GGoxflpeBD4PlWvUvbzWx/ExOWXpLVPaGPWsA5VJ7zBECqzFfKTDyYrSvR9QX44E4Z
 0L830fD72/n3XPMb//OpKzXSwLW7xNUJsHBkCLwIv6jFEFrgwTds5T1+dNAw7nyXDDHm
 k9mxk85yYzWyn6/Rd23eT+G76vju+rvKmlLwP/KuJcMXJbojryZ92nsxTrvF79wZK+Zg
 Speo3j7nNv7IaR4Ome2EJZ5jibL+lr5cXatvdXglwK/ALECdVLnwwsfaAegHCppkCo35
 QPVVxDDOGjd3sb5iBw7cm0t9NtocEy4lGYfBuFEE94H/CLMO0la4smU+p2seJ4nwiY9O
 Ty7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yggPcK5TIy9S6ZT52DUYZYz36AXCmMT/bN7wqCeS1aw=;
 b=d97ikuEk0yLsRTHQzQnncTh9N/EVzpo35KrWQ85MX/OZhB+zz/RuUtlw2ufMcFsVZN
 Dx8cO0Q54z/Wmf7zx+g+gFnjhcCPGAkmhgBAJz3hTw3NljCfao7AhaEVKRHFw4GCQ1fj
 bpGTtxq/F1BffWIBCoaMMAgi31DsHexVXIgoBgBb+m5gtlg73ZzifmEVZNq8s0J1do2l
 gWe1OVbxRXaLvELN/1N/PVCVtzDwrpR5hFPbwqD/SEDf6KEwv+UmMCqoxAjeCsrD//Sb
 nNfoAammtCcmgX/N1gJ7DmgK1Q0TsVNXVDLTeYu5qZ0z9M7aJSYnNifKfT9e3Lv59MvN
 4RCA==
X-Gm-Message-State: ACrzQf1kfEnKGffR1JmFHuf6zZr3mjwwb7mAm5ZJqkJjbiJh7MOKX8v/
 9jWXzieqFtN2roGZbAKpyO28JRVC/jbKqj0K0i4=
X-Google-Smtp-Source: AMsMyM6qZQxXTSO2TswGy9TB1D8Odto/9aPMXtUQBP2MbhygDgD/F+xKh7vTLDPRvs/CUg5hTSU2HPJ9sIao/ppsy6k=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr13266615oiw.96.1667394110491; Wed, 02
 Nov 2022 06:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221016174158.16638-1-fmdefrancesco@gmail.com>
 <CADnq5_MDp6WUYTUO+Lo=XMSLdaYcwu5i2MWid9u1U2hKiyqoYg@mail.gmail.com>
 <1753145.VLH7GnMWUR@suse>
In-Reply-To: <1753145.VLH7GnMWUR@suse>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Nov 2022 09:01:38 -0400
Message-ID: <CADnq5_MfEGsxKxh459DZsHUjUspQLd7zagtrEeFMC4Upk-zTEw@mail.gmail.com>
Subject: Re: [RESEND PATCH] drm/amd/amdgpu: Replace kmap() with
 kmap_local_page()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Ira Weiny <ira.weiny@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 7:21 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On luned=C3=AC 17 ottobre 2022 18:53:24 CET Alex Deucher wrote:
> > Applied.  Thanks!
> >
>
> The same report about which I just wrote in my previous email to you is a=
lso
> referring to this patch which later changed status to "Not Applicable".
>
> It points to https://patchwork.linuxtv.org/project/linux-media/patch/
> 20220812175753.22926-1-fmdefrancesco@gmail.com/
>
> Can you please let me understand why?

I'm not sure I understand what you are asking.  The patch is applied:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/a2c554262d39f81be7422fd=
8bee2f2fe3779f7f5

Alex

>
> Thanks,
>
> Fabio
>
>
>
