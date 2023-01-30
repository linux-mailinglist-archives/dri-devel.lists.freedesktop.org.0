Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFBA680FE8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 14:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E5410E24B;
	Mon, 30 Jan 2023 13:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0672C10E24B;
 Mon, 30 Jan 2023 13:57:50 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 004F36008779;
 Mon, 30 Jan 2023 13:57:48 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id N-n1fPRz3P4O; Mon, 30 Jan 2023 13:57:45 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 114AA6008767;
 Mon, 30 Jan 2023 13:57:45 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1675087065;
 bh=JqwGsj0u6Pts7btT5om3dFNEtjS5jBoS5qI53RgpF7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=OinxDCoVd95mvVdNhKnlUhPOCOX68em6JNtmKWJVeeMI/Vz2vMU2WEILEa4YSQRCz
 AWhw1qk/Q+YY0yMC5VyK3gqVHdYrkZl9ovvLCGkulWxRIss9fFjs/82O9J7s8D8SCw
 ZDD/lGwHSFMKy/A61Dq/blY1ZpKULkLKmeVzkXOk=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 4E03A360077;
 Mon, 30 Jan 2023 13:57:44 +0000 (WET)
Date: Mon, 30 Jan 2023 13:54:49 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Message-ID: <20230130135449.va44qpmklob44lwy@wslaptop>
References: <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
 <20230127103959.5nqk57sb7qchtaw6@wslaptop>
 <CACAvsv5sA8pmhYEVhJk9PEAWyKRZYvcsSHa-04CsJxgu7+YEiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACAvsv5sA8pmhYEVhJk9PEAWyKRZYvcsSHa-04CsJxgu7+YEiw@mail.gmail.com>
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
Cc: regressions@lists.linux.dev, kherbst@redhat.com, kwizart@gmail.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 08:36:06AM +1000, Ben Skeggs wrote:
> On Fri, 27 Jan 2023 at 20:42, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> >
> > On Fri, Jan 27, 2023 at 04:00:59PM +1000, Ben Skeggs wrote:
> > > On Fri, 20 Jan 2023 at 21:37, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > > >
> > > > On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> > > > > On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > > > > > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > > > > > As a quick check can you try changing
> > > > > > >
> > > > > > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> > > > > > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
> > > >
> > > > > In addition to Dave's change, can you try changing the
> > > > > nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> > > > >
> > > > > nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> > > > > sizeof(args), 0, false);
> > > >
> > > > Chiming in just to say that with this change I see the same as Nicolas
> > > > except that the init message size is 255 instead of 0:
> > > >
> > > > [    2.196934] nouveau 57000000.gpu: pmu: unexpected init message size 255 vs 42
> > > I've attached an entirely untested patch (to go on top of the other
> > > hacks/fixes so far), that will hopefully get us a little further.
> >
> > Hello,
> >
> > Thank you for the patch! I can confirm that it fixes the problem
> > on the Pixel C, and everything works as before the regression.
> > With this, for the combination of patches
> >
> > Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> >
> > which I can resend after testing the final patch version.
> Thank you (both!) for testing!
> 
> I've attached a "final" version of a patch that I'll send (assuming it
> still works ;)) after re-testing.  There's only a minor change to
> avoid breaking the non-Tegra path, so I expect it should be fine.

Hello!

I have tested this new version and everything is working as before, so

Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

Thank you,
Diogo
