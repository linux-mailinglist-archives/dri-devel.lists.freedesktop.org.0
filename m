Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFD543D9E2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 05:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3F66E5A5;
	Thu, 28 Oct 2021 03:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454FB6E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 03:22:27 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 107-20020a9d0a74000000b00553bfb53348so6745282otg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5s4StmHI8iYxy7i8cyeJSVr9mk1BwTCxomSITB1pSno=;
 b=j0xgAgrjHYQ5lLxNU677Dz084gx6BKYrnofb/lNen5QG6+ndlB5fsn2SMU+RCx28la
 IoK6SGz+3hm5CiJOC+qWFV2os2R1nXML4yjdaZlGem5/YIknGHavWRZNNJYPHNWGAtzC
 +Wtldac1BYGHu2mg6ykF0sHoZMXflgRQyspWNFpkFzQgdy8/4QgLEzo+HhnNfVt7/1By
 TEQziQJfOPVz1YEgmpXxji/ZRxgJUEmFIk11MURALQkrzmSztqdDzuKjjf4DQGehy6o1
 D8qpJf4MeNEfxMEMuyKWDuCXmN/G68ypsKwpFYiZsN9DS7DO6B0QAdg7IfszdjIBrsoJ
 yjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5s4StmHI8iYxy7i8cyeJSVr9mk1BwTCxomSITB1pSno=;
 b=T2JUbH29i7Qsd+ok9qcm/hqLqr3A9XMzGcYy6ditf634ysN02F5gp+T5j5vUSfCT6R
 vSNZkG0X4soFfght+CETkjuJ1P9gY5qZ4OEFXTFD/GSWgUTlhcXDRZycSU5Q7Y6NrNax
 QaTQ/UWd15WBdrIko7l7pofk0G8vHouizhK6K/4OcCQglPqL5OBmrnyZPiDLybVCMEFO
 LlO4Yv58ki5YOGr96W+ZvLiAc3+hPN0XHTeLaQ74V30aSjlBI4JtcOgrRv/Fi2BmNB74
 2gVlVieZmhpBmmrHuG4rwarGv7v4lR61gLAuxkv6ndeFq0xi/HeOBjGOkq3ygk9DGkYv
 jp5w==
X-Gm-Message-State: AOAM533FjPBVm9eDJYUDhMBuxpzcMahxxYtBX96ZsybdAC1w8S/9yEnu
 d03X/eIqFoPsoTJhkDjQJDVLE66BXZ3TLlFokuY=
X-Google-Smtp-Source: ABdhPJzQpleeZm2BZiizYujx18/yGLF9n7JjAxk+5zP6ToHPqMkuMlrjUuS7lUkavWlq8YA5IzY9ZBfIyhOmP9rDNIk=
X-Received: by 2002:a9d:1b4f:: with SMTP id l73mr1425647otl.200.1635391346481; 
 Wed, 27 Oct 2021 20:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211028140644.7c1a7244@canb.auug.org.au>
In-Reply-To: <20211028140644.7c1a7244@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Oct 2021 23:22:15 -0400
Message-ID: <CADnq5_PLXWpPK=BV6AS8QaPcnAr8JELF8u2Cvn_FCqJwB33AMg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, 
 Fangzhi Zuo <Jerry.Zuo@amd.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>
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

On Wed, Oct 27, 2021 at 11:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the amdgpu tree got conflicts in:
>
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c
>   drivers/gpu/drm/drm_dp_mst_topology.c
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>
> between commits:
>
>   d740e0bf8ed4 ("drm/amd/display: Add DP 2.0 MST DC Support")
>   41724ea273cd ("drm/amd/display: Add DP 2.0 MST DM Support")
>   00f965e700ef ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not set")
>
> from the drm tree and commits:
>
>   6d23be5bc661 ("drm/amd/display: Add DP 2.0 MST DC Support")
>   39b3c728e5ca ("drm/amd/display: Add DP 2.0 MST DM Support")
>   8bc3824f0ee2 ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not set")
>
> from the amdgpu tree.
>
> The conflicts between these different versions of the same patches,
> and some other changes in the amdgpu tree are just a mess today, do I
> have just dropped the amdgpu tree completely for today.

Those patches were just in my tree while I was waiting for the topic
branch to land in drm-next.  I'll drop them from my tree tomorrow.

Alex

>
> --
> Cheers,
> Stephen Rothwell
