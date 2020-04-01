Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF4219B59D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 20:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A02C6E981;
	Wed,  1 Apr 2020 18:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368DD6E981;
 Wed,  1 Apr 2020 18:32:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 31so1284009wrs.3;
 Wed, 01 Apr 2020 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=746fvQzZ1Umztu28E3KypqCqWdptr1ovc0pRXKqEkK4=;
 b=LIJ+NtgZRdc+ieQEF7kotKoNN2N9x0kajfVWhAc+qJ/EnF/zwGPBGbWpPVUEBUknPZ
 UCzJACzFiPsXHKZXwWP/FQIF0Jopo0D7bxjZsq4iN2ARM45fQL9WGjELO6zVNyTCY3D3
 kL/2hmtWyM0eTbOrKxw3GRvBxBSUOa2FFBGznFkk4Sr7qm8szq4LkrVAoKa7ra1WU69M
 lhzPeaD+1rK9baBsc/kZSv5Ym3kB7/THZ+0I7DKhTPpBUurV01ELSkOiL7TC03i6hNSr
 3GQvpnEB5LWuGjoDXaLKfEo/mkWWFVj3cjBoAN0KEdRaoUARlQL7X7Lg7qj/kgfVVZ+q
 e6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=746fvQzZ1Umztu28E3KypqCqWdptr1ovc0pRXKqEkK4=;
 b=q3e5WU6qNWGkpNoyGH36I2AF3NzxFu8WECe2/2SbR+ElMJ1w2VdJar1zYGVSESilYS
 US+ljcIlkMpsZn9zL7kIHDO4ycN5kSOosv4cwo/xT07nyCiUUBOBI6x0xw0x7IsK92if
 58/bUAFTvGifcziZDHgAbgjKrMx5idbPgHwG8z7F3iYxnu06+aJhsLP3MYOxODTltR8y
 T/eZHFLzTlaNOs9vO8K4HaMyzctzocgFj6Q4UC+r9CVNBaAYe1yPysY/Kg00jvsh8Dsb
 7uC3ro5dMHoai/+bFIRJ8LGyDieRu9IoK/WhBi+o/OHGYANZaVCrudmcg+wdjPuS+Lw+
 JGQQ==
X-Gm-Message-State: ANhLgQ3i/DyU+Rx+ll37gf3mxmILRBUqObt53n1+98tgBfDNtXgSy4N1
 3ZVVT/EDD8UaupQuOBoYtWqSq2tPfDBuaTz30SQ=
X-Google-Smtp-Source: ADFU+vuZux8n5T9HQGOGlYd2w0bcZldegvX/dW3QqzF55YPPLoi2ejE7fh8nksHxBdPBnsxb6W1CtX7Yg9rnv1IO4Ms=
X-Received: by 2002:adf:f50d:: with SMTP id q13mr27924252wro.374.1585765968916; 
 Wed, 01 Apr 2020 11:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200331205740.135525-1-lyude@redhat.com>
In-Reply-To: <20200331205740.135525-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Apr 2020 14:32:38 -0400
Message-ID: <CADnq5_NtTEMGka7vJFZLvOi7UFQkwKex_SL5Hunt61HJW1KFpw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/dp_mst: Remove ->destroy_connector() callback
To: Lyude Paul <lyude@redhat.com>
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Francis <david.francis@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 4:58 PM Lyude Paul <lyude@redhat.com> wrote:
>
> This finishes up the work that Pankaj Bharadiya started in:
>
> https://patchwork.freedesktop.org/series/74412/
>
> And allows us to entirely remove ->destroy_connector()
>
> Lyude Paul (4):
>   drm/amd/amdgpu_dm/mst: Remove unneeded edid assignment when destroying
>     connectors
>   drm/amd/amdgpu_dm/mst: Remove ->destroy_connector() callback
>   drm/amd/amdgpu_dm/mst: Stop printing extra messages in
>     dm_dp_add_mst_connector()
>   drm/dp_mst: Remove drm_dp_mst_topology_cbs.destroy_connector

I noticed this as well when I was sorting out the load and unload
callback removal.  Thanks for finishing this up.  This series looks
good to me, assuming none of the display folks have any concerns:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


>
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 45 +++++--------------
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 16 ++-----
>  include/drm/drm_dp_mst_helper.h               |  2 -
>  3 files changed, 15 insertions(+), 48 deletions(-)
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
