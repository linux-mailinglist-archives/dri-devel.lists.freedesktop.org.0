Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D55F3B5F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 04:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B645F10E582;
	Tue,  4 Oct 2022 02:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C1810E571
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 02:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664850293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fVkcg9C8JIxqxOQDwg0gOT0h8GaFXdcY7F7efzgxrAg=;
 b=OuFFRwtpRRAuBQs4Cnmkt1FZVXvbhup/cKwvzvEt/ILLzOjTBnEEdHt+FA16U1V1IAmgKu
 LXxiC8WxE6o1W4w914G3FlIvoN3UW8reIyDD7gugBP/6aYNJZJNQpIT2RJ9Ig5cRowTC1U
 VaTK2oLrHEJ6T8tEq2mx9ZQ8mc1YJAY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-LLT9Mvs4N6eOzksWIer7_g-1; Mon, 03 Oct 2022 22:24:50 -0400
X-MC-Unique: LLT9Mvs4N6eOzksWIer7_g-1
Received: by mail-lj1-f200.google.com with SMTP id
 z34-20020a2ebe22000000b0026c18a910fcso3581727ljq.23
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 19:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fVkcg9C8JIxqxOQDwg0gOT0h8GaFXdcY7F7efzgxrAg=;
 b=SetH9/d+KYaAJwQgct7KmW3gJwHO7xjAnIflViYTanpON+tVAodT1alURjGcT6444v
 B31vmgCCLU11WpQABzpwlHUR4d2h6MRfB7Qroklu5ZcgZpd4VOLQoXsXNkgvYhYj0iuf
 mEiYPeTl7lQDKa7thQbA3bBgPyUT4MwFuysswX3b300MFkx03ZLxun8ZwMYXQNOH+2QY
 E1JUuQuwQTsICPk8TLeaIYiGsahG6g7gvAJOHa6Wu/WDt9/4WDboIoe93qO4JY69w7os
 lc0dGul4GOudzDtwNsY/i08KtumMWZ5JzZUvEwBLNhOmC+CFA0PQjyzZUjx59wQv2X2M
 nA8Q==
X-Gm-Message-State: ACrzQf2bjyv7qdlGdHCMfU6nGAt5Ck79xSwHN6F3DfMxr83TSwp9P4M8
 p2ZR+ocu6sqcSCCbJS/1PbWXrayv92ChO/UOG7aVsYc9Uyd4V2vHMlx2wNll/nIgnxRJoF2ScDr
 Vl5/eyV9ASrn8tBKBgkPGdPd+0i+HE+xc6zZXHoJwXuxF
X-Received: by 2002:a05:6512:3d9f:b0:4a2:4986:281 with SMTP id
 k31-20020a0565123d9f00b004a249860281mr1516698lfv.123.1664850289181; 
 Mon, 03 Oct 2022 19:24:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43JpG4+HkP34BMh00KTDXXzJi6U2FMyVKrOOV9rwvThgPq3E1KX8F6iiYpkGCS/29GDwP66I2XdKeeelgNxP8=
X-Received: by 2002:a05:6512:3d9f:b0:4a2:4986:281 with SMTP id
 k31-20020a0565123d9f00b004a249860281mr1516681lfv.123.1664850288711; Mon, 03
 Oct 2022 19:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
In-Reply-To: <20221004132047.435d42db@canb.auug.org.au>
From: David Airlie <airlied@redhat.com>
Date: Tue, 4 Oct 2022 12:24:37 +1000
Message-ID: <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, broonie@kernel.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 4, 2022 at 12:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi broonie@kernel.org,
>
> On Fri, 30 Sep 2022 11:54:34 +0100 broonie@kernel.org wrote:
> >
> > After merging the drm tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> > /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
> >   527 |     stream->writeback_info[j] = stream->writeback_info[i];
> >       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> > cc1: all warnings being treated as errors
> >
> > Caused by
> >
> >     5d8c3e836fc224 ("drm/amd/display: fix array-bounds error in dc_stream_remove_writeback()")
> >
> > I have reverted that commit for today.
>
> I am still getting this failure.  The full error is:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
>       |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing 'writeback_info'
>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>       |                                  ^~~~~~~~~~~~~~

I'm not seeing it here, what gcc is this with?

Dave.

