Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B67D66E1C1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 16:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF9310E557;
	Tue, 17 Jan 2023 15:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0A310E557;
 Tue, 17 Jan 2023 15:11:27 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-15ed38a9b04so13601605fac.8; 
 Tue, 17 Jan 2023 07:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nq5M4nU/OCSfpW5cEcLSCt7pqtGGiinBM8ufPAaS/Wg=;
 b=QPMHfY7mqbWrA4NPrp6O88M7b5Uk1wQlnb855lE3U2JUBVTwRMDHKQ+jHYU9b0FxiA
 9IcGUbydeOXIPViuZylO+Rf+bc4iZU5wkUt2RRmmEiNEtKl78OopdhrJAKmT5WmUySY4
 uHirHU0NrTsIFqAM42oj7ey9nl57QicSzc/SOrV5Bn3suo+YpqqiEsLFj5EJ8kNnXdzG
 6FwrQX4HyHwhmoBbjlsnVZge5xDP3qjXHA/cLj90teH5hGpEzBkcBXFbF30VSKqGyKWt
 nXntp6DiHdDT+8EGJyKpUBoC85g/vRj2gUlwpNpN24UyOFv5O1VGXqtScTPlfSZOqBk5
 8pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nq5M4nU/OCSfpW5cEcLSCt7pqtGGiinBM8ufPAaS/Wg=;
 b=gzXAVqCsBOY1NifR6syGubiCM0LhuYOrgU6EC7+EpSfRbtXoH3xvE1m6j9c/rm6TVR
 AOeze9o1e+LojW7Q4UP9bhDPSSmejNTdjIVUFdCpJIts+pWuggWUQ2LAo18DPK+rPT2E
 e36iW+IAcZobqjPgHo/2Ngu3e243rg9RA7Wr7ARhd1tkn/aj7H8hcTKFVuZigPrp1V/b
 AlmRcn6iXhvI2Ch+KfaFJW4jv+QPeidF0tmO9xS7+LEUaog+2oCjQVubXJCUbeIBJcB0
 DVNZGgSzozZyTxpzLVuzWYLX+ZuY8yJvSlykQ9rDszKeIBcoW8PU6AargJ5SleQ4vU3q
 aVCA==
X-Gm-Message-State: AFqh2koXNC+nkpEcjFpsc/AgVmFGgzNWmBMzMSf+8jom6mXgUSRLcqit
 LRam10ZolWHpckg8n+obhUXvqph4MLJOO11YHu4=
X-Google-Smtp-Source: AMrXdXvzrZCFpAae01nQbt0m3dncYv7RM4NYpB7auBjmSL2tSopLmuojx39dkk/7Uu6oa23j7gQqUSQ79Ry1xfL2y5w=
X-Received: by 2002:a05:6870:7a18:b0:15f:5509:9a0d with SMTP id
 hf24-20020a0568707a1800b0015f55099a0dmr324978oab.46.1673968286324; Tue, 17
 Jan 2023 07:11:26 -0800 (PST)
MIME-Version: 1.0
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
 <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
 <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
 <a6680b24-372f-673c-4b3c-1fd3c309f242@igalia.com>
 <968afa8d-d402-311f-cf14-fd2dd27bf385@amd.com>
 <16d17ee0-bda7-af95-b148-df5ce649336f@igalia.com>
In-Reply-To: <16d17ee0-bda7-af95-b148-df5ce649336f@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Jan 2023 10:11:14 -0500
Message-ID: <CADnq5_OzgMy3s_w4Aa-+51PqJHG+iBeaHYu2gv2t3J-5tExGmw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>, "Limonciello, Mario" <mario.limonciello@amd.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 9:33 AM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 16/01/2023 23:33, Limonciello, Mario wrote:
> > [...]
> >
> > For debugging these type of problems, I think an effective debugging
> > tactic would have been to mask the IP block (amdgpu.ip_block_mask).
>
> Thank you, it worked indeed - nice suggestion!
>
> Though I see two problems with that: first, I'm not sure what's the
> impact in the GPU functioning when I disable some IP block.
>
> Second, the parameter is a bit hard to figure - we need to clear a bit
> for the IP block we want to disable, and the doc suggest to read on
> dmesg to get this information (it seems it changes depending on the HW
> model), but I couldn't parse the proper bit from dmesg. Needed to
> instrument the kernel to find the proper bit heh
>
> The second part is easy to improve (we can just show this bit in
> dmesg!), I might do that instead of proposing this parameter, which
> seems didn't raise much excitement after all heheh
>
> Finally, I'm still curious on why Deck was working fine with the
> indirect SRAM mode disabled (by mistake) in many kernels - was it in
> practice the same as disabling the VCN IP block?

IIRC, it depends on the fuse recipe for the particular ASIC.

Alex


>
> Thanks,
>
>
> Guilherme
>
