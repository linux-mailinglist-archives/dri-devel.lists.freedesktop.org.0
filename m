Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2959059B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 19:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE7E112FF6;
	Thu, 11 Aug 2022 17:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179DF11ACE6;
 Thu, 11 Aug 2022 17:16:26 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id l188so21974829oia.4;
 Thu, 11 Aug 2022 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=KfbvK1kB8bEVX+Bg3v0uAmAH4X0cmlYYTnpUW0qFVPQ=;
 b=TnkO0E874E+5j6klJFh8ek6SsnENd71jthFGsFpua2yYT5NQw0Pv81Jxt31gT4bW9s
 LGjKTwHL4DnMsXhZGXPm7oRcS1kxvSfp9nPTnkDeRFvTFAEvAEL91hOJjq1rtDMOIFfb
 s0fRKqkufOEOskCOyspzuYGiEfIItVxs2JEQUq/WJcHWwk+196JVL/HUR2MwC4pMNx+j
 Msb5XcCNOW/JcgNCVUdQpR8GgZWFNKvkmC42KDjfxols2OkYZTqs+8xeN8BtGI+8+Ic9
 EStOeW5RQE2g8nWdb71bmJELef5l4vE55QoC9yf4CSX2xmLd81W6QP/uq10mflmWZMfH
 zHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=KfbvK1kB8bEVX+Bg3v0uAmAH4X0cmlYYTnpUW0qFVPQ=;
 b=sWfpTory6pRnT/uY8nbyoqJ4RiY/OAq1Gli06FXDZA5M3dud3Lcq+MeJdnxkJIBqjq
 +nGmVzAIYI8ZYcNZ/jNlWx6xBbVTdKbydCy+nMFKzAaz2BjUXoq4B5V42IqW6Fri+RfY
 n4lYW2c0U2d1FtfQatp5bmSs+8z8Doiz5/Wj215Vp692Ri5N7ItQDbhvX2rliGz8eek5
 pPgttB5IKUrv5lukfuraStJ4HZQ/3CykSQjc0LPMDO3yRGscJlS/Kvy2vmo8ogs03f3Z
 fX/jXsmm9zGMoiFy0ODkcLdxy0QkdvH+/Dan5MdA2/DZ5wfMoRj56xEqFOgyYjC9+e7H
 BmUg==
X-Gm-Message-State: ACgBeo14upo4uBjWTKFiEdMDHjx/gD7af9FzcTgIhV3F5/gPqRJjVtgG
 zBmLTf2gTV1s9xYPeERXK4Iyt5DaaJcrWd23Of0=
X-Google-Smtp-Source: AA6agR4Bzynj5rmJ8wCQm3W9k/cxzVFKyJgGxa2jF7SPAmi/iTivBeW/gA2Idukm9kGS55zj0zOhNVtOD/B82NJlMXc=
X-Received: by 2002:a05:6808:19a3:b0:33e:1525:3fb4 with SMTP id
 bj35-20020a05680819a300b0033e15253fb4mr106057oib.106.1660238185376; Thu, 11
 Aug 2022 10:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <YvU4GD8HtZ1A4dhI@debian>
In-Reply-To: <YvU4GD8HtZ1A4dhI@debian>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Aug 2022 13:16:14 -0400
Message-ID: <CADnq5_PwbwjmvvKedpZeeQHk7N+kawKpXywjNGqa=1jSKRcw0A@mail.gmail.com>
Subject: Re: build failure of next-20220811 due to b1a63a0b48ad
 ("drm/amd/display: consider DSC pass-through during mode validation")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 linux-next@vger.kernel.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 1:11 PM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> Not sure if it has been reported, builds of riscv, alpha, s390, arm,
> arm64, xtensa, mips, csky allmodconfig have failed to build next-20220811
> with the error:
>
> ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> git bisect pointed to b1a63a0b48ad ("drm/amd/display: consider DSC pass-through during mode validation")
> And, reverting that commit has fixed the build failure.
>
> I will be happy to test any patch or provide any extra log if needed.

https://patchwork.freedesktop.org/patch/497116/

Alex

>
>
> --
> Regards
> Sudip
