Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3338376B5C
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 22:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3F56EE78;
	Fri,  7 May 2021 20:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F5C6EDFF;
 Fri,  7 May 2021 20:59:17 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 197so9893477qkl.12;
 Fri, 07 May 2021 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WM3qTdeeeQvN9wqJqOAh1ks+lZ+P1gcdIZXNpOTonrc=;
 b=r+Rn1FuazZF3GatZUdqZ9l+FO+YTxA1D3YJlPcigoUO/F7/3KKxnkKe8ET7nEtAaih
 h6fBoqyszKYVFnDS+WIP+vKhSBconGErn5q6t57LNyLRSMcUsTeSRHebj6zjsqnU8x91
 x0LcaPNDgX8NgwJDE+oQh/NazmWbYdiuBHCUfHS5bzAcrnOI8eVAd750FcUke5aERvyk
 RyJfEPfKen91mYgLYXsAZnWv3MdAYzlzFwN7wIWnOJ841tOYm5RbkLFP9VKshPpvdoKI
 PnUzOkCTWO4flAD3dS69vOC0XZLegxH4D7oQ0YhZ3bJhNRecuxNpozapdS0JCFX0VV/K
 EdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=WM3qTdeeeQvN9wqJqOAh1ks+lZ+P1gcdIZXNpOTonrc=;
 b=CIK9W3hTfX/zHoaxlfcxAlVrGekMP/GkAKg32s237ToL5MacaV0Ld0FKMIR/PKNanF
 Tly+Hdc+UZkhJY4KTbgEfiZb185lMBC6fjOWRvsL4a7YJsbPLHCL/apYJ1cjZm1V4z3Q
 QcMl21MYZQnfVydHa1Zmw3aotCTYkBwPpRMJSSU/bf/A7NQm52KTy4yeBJzyhQQagJgQ
 xzoPKdgBwcSoyAnt21NHUifTpodfTGRxLf5dZVD4FNvI2sP3RhQqgcmmKtybutN4CAxv
 PK6/pRmlf4YU9LE5vbhV7OwvRTxUkOw4lNrpee8lvbcIaW7NGKQX1e9iFR9G1JbO8fmx
 Xa2A==
X-Gm-Message-State: AOAM530OQRPjUaUYG6XCBJ4GirEIeacIxBV31D5teziiWmT4zB0IdC+h
 LgPTyD1i3+2sC3hoqk/K+Y4=
X-Google-Smtp-Source: ABdhPJxyjJaPUgZZ5DfuESF5Im6k2ukuj2Fa/7dXtcMZSkR/HegPBCpoXKWS0kZr+E66ksFX99ZGJQ==
X-Received: by 2002:a37:8c1:: with SMTP id 184mr11654363qki.345.1620421155940; 
 Fri, 07 May 2021 13:59:15 -0700 (PDT)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net.
 [199.96.183.179])
 by smtp.gmail.com with ESMTPSA id e13sm5982704qtm.35.2021.05.07.13.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 13:59:14 -0700 (PDT)
Date: Fri, 7 May 2021 16:59:13 -0400
From: Tejun Heo <tj@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
Message-ID: <YJWqIVnX9giaKMTG@slm.duckdns.org>
References: <YJUBer3wWKSAeXe7@phenom.ffwll.local>
 <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
 <YJVnO+TCRW83S6w4@phenom.ffwll.local>
 <CADnq5_Pvtj1vb0bak_gUkv9J3+vfsMZxVKTKYeUvwQCajAWoVQ@mail.gmail.com>
 <YJVqL4c6SJc8wdkK@phenom.ffwll.local>
 <CADnq5_PHjiHy=Su_1VKr5ycdnXN-OuSXw0X_TeNqSj+TJs2MGA@mail.gmail.com>
 <CADnq5_OjaPw5iF_82bjNPt6v-7OcRmXmXECcN+Gdg1NcucJiHA@mail.gmail.com>
 <YJVwtS9XJlogZRqv@phenom.ffwll.local>
 <YJWWByISHSPqF+aN@slm.duckdns.org>
 <CADnq5_Mwd-xHZQ4pt34=FPk2Gq3ij1FNHWsEz1LdS7_Dyo00iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_Mwd-xHZQ4pt34=FPk2Gq3ij1FNHWsEz1LdS7_Dyo00iQ@mail.gmail.com>
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Brian Welty <brian.welty@intel.com>,
 John Fastabend <john.fastabend@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, Kenny Ho <y2kenny@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, KP Singh <kpsingh@chromium.org>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Kenny Ho <Kenny.Ho@amd.com>, Network Development <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, May 07, 2021 at 03:55:39PM -0400, Alex Deucher wrote:
> The problem is temporal partitioning on GPUs is much harder to enforce
> unless you have a special case like SR-IOV.  Spatial partitioning, on
> AMD GPUs at least, is widely available and easily enforced.  What is
> the point of implementing temporal style cgroups if no one can enforce
> it effectively?

So, if generic fine-grained partitioning can't be implemented, the right
thing to do is stopping pushing for full-blown cgroup interface for it. The
hardware simply isn't capable of being managed in a way which allows generic
fine-grained hierarchical scheduling and there's no point in bloating the
interface with half baked hardware dependent features.

This isn't to say that there's no way to support them, but what have been
being proposed is way too generic and ambitious in terms of interface while
being poorly developed on the internal abstraction and mechanism front. If
the hardware can't do generic, either implement the barest minimum interface
(e.g. be a part of misc controller) or go driver-specific - the feature is
hardware specific anyway. I've repeated this multiple times in these
discussions now but it'd be really helpful to try to minimize the interace
while concentrating more on internal abstractions and actual control
mechanisms.

Thanks.

-- 
tejun
