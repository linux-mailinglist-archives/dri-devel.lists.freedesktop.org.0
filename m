Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E3597819
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 22:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A97A781C;
	Wed, 17 Aug 2022 20:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED23A7809;
 Wed, 17 Aug 2022 20:39:53 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id o123so14342195vsc.3;
 Wed, 17 Aug 2022 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Pby1yMSBPXIRmnbK0mp8JoI7OWrC1joW57AiQcbBP0Q=;
 b=inC+UgcY0EIaKzbjmu9TomN+u6btHsSO05ufbPi8fwp81bBlk7mkWQVr7pqZ9RRqLU
 hvBJbrD1nAXbb0hc5VwXN8Zy0wnZm1nu/acyUVP51b3R3tpQPCOkPmzPFeHbyBLmJyeD
 uUsXNzjU/sI4QGzkncRbj0amd+xLIyLUVu96aUe4zdN5DyQq8bScni4Xe6fhYbd8MlXQ
 fldeeRjYOZMaUDbfhU72Iu9YETXX3PT74/PjlHmCWhL1iSDhIi5IpALmZhk32MpKs2FF
 E8mXcJQcYSqqpqHwX1R1NrAsGeifiFjZgcxsHNJrwzwd55cY55RnJW8VJH40ZxVikK/Z
 43hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Pby1yMSBPXIRmnbK0mp8JoI7OWrC1joW57AiQcbBP0Q=;
 b=bztTUnQlobMZIt6upPRaZAdfeetkJupjFj2htWDz6rl5BZw8+k6NcnRSrIjYDqcouA
 dKOo8RpxCDC6/jZxsNrHeS02c/aAC0mkmHt4lZWR3hcB/HV9LdyeLawFDugACXt3XVUm
 2ydsBFiMPLl3gRz5eeHugtuAnABo8KYC5V2QBsouKz2BJPbCo6MiFiX7vOh9r6rXL0A/
 IrWaQa31TeYB1/LrfTHVUmN//k4SBlgXYM/140bTUX/q9LOwGR5m+dh7ZgAN9Bnb0o39
 IzB/3ilmYtYsADMqmYoruXsrYlwFJ+ntUAfXSN/i8tjYFC6uaI+q37A9jF89wCIxBzf9
 D6UQ==
X-Gm-Message-State: ACgBeo17bC8kXRVZqXLXgTt/V2lBfEk11p/W5raOaEKpTvw94VUKcd9X
 rVd1BtCOVghlPsQr6as/aHtoWSQrx3nGzgdGKdRS6G6Seo6mU1hO
X-Google-Smtp-Source: AA6agR7TXYadG2mmWjKCH/W19SWAIUnwsaui5VCW1HOoHb7uysbbyVqhETXpaRT38pEdo0NpybxBnNWQxdaC+V4gaI0=
X-Received: by 2002:a67:be01:0:b0:388:7361:2eb3 with SMTP id
 x1-20020a67be01000000b0038873612eb3mr11215542vsq.14.1660768792854; Wed, 17
 Aug 2022 13:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <YvU4GD8HtZ1A4dhI@debian>
 <20220812090731.31da7d85@oak.ozlabs.ibm.com>
 <20220817094309.140c346e@canb.auug.org.au>
In-Reply-To: <20220817094309.140c346e@canb.auug.org.au>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 17 Aug 2022 21:39:17 +0100
Message-ID: <CADVatmO-kc93dQc9TPy7ZjGuLUUut7or1VLGYkLWTw803mkWiQ@mail.gmail.com>
Subject: Re: build failure of next-20220811 due to b1a63a0b48ad
 ("drm/amd/display: consider DSC pass-through during mode validation")
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, linux-next <linux-next@vger.kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 12:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Fri, 12 Aug 2022 09:07:31 +1000 Stephen Rothwell <sfr@rothwell.id.au> wrote:
> >
> > On Thu, 11 Aug 2022 18:10:48 +0100 "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > Not sure if it has been reported, builds of riscv, alpha, s390, arm,
> > > arm64, xtensa, mips, csky allmodconfig have failed to build next-20220811
> > > with the error:
> > >
> > > ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > > ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > >
> > > git bisect pointed to b1a63a0b48ad ("drm/amd/display: consider DSC pass-through during mode validation")
> > > And, reverting that commit has fixed the build failure.
> > >
> > > I will be happy to test any patch or provide any extra log if needed.
> >
> > I have reverted that commit in today's linux-next.
>
> I have removed that revert.  Sudip, can you recheck when linux-next is
> released, please?

The build failure is not seen with next-20220817.


-- 
Regards
Sudip
