Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DF2FB439
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1049E6E845;
	Tue, 19 Jan 2021 08:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016686E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 10:39:17 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B600565550000>; Mon, 18 Jan 2021 02:39:17 -0800
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 18 Jan 2021 10:39:12 +0000
Date: Mon, 18 Jan 2021 12:39:09 +0200
From: Eli Cohen <elic@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Change eats memory on my server
Message-ID: <20210118103909.GA45040@mtl-vdi-166.wap.labs.mlnx>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
 <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
 <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
 <2ea2630b-8782-c662-91fe-683d8b5d6c99@suse.de>
 <20210118091302.GB40909@mtl-vdi-166.wap.labs.mlnx>
 <052812fd-10ce-abf4-d12a-91d4fd66ed54@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <052812fd-10ce-abf4-d12a-91d4fd66ed54@suse.de>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610966357; bh=hBDtQFyBlKJXIsW/egiLl0IA6V2Hx4RRaCTuyKQG5o8=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding:
 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=UGpuMd4GMtUQMeptbVKeyZy+ylDCkUFgkGvl0O+QmFLFHvQKIMwBJkg9lI7/7p+r1
 rBISSDlJ+SW6+C9Lj1lB2iFGsBpsmc/gux8FUIlo9kof6wHXFMABHhDQ7cb92tMkcl
 Clispq+IEL00sZN4oQvcSzq+AbE2LEZAoDoNGX5vC8iv99gpH8kJ7BFWKWwKxc2h9Y
 P9Tg2L3Ut4G/l+97j/jINCZhyHkXse7DdbyAJY+Pud7uTF1YY3C5tuflryGAGyOnQP
 eW/JwgIk1BmkCd2xzNFwkC371sNjK3FbEl7o7YmptgEahdiougFzkq7Y2GpbM+mm7L
 zxkAMDZE7aOUg==
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, sam@ravnborg.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 10:30:56AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 18.01.21 um 10:13 schrieb Eli Cohen:
> > On Mon, Jan 18, 2021 at 08:54:07AM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > =

> > > Am 18.01.21 um 08:43 schrieb Christian K=F6nig:
> > > > Hi Eli,
> > > > =

> > > > have you already tried using kmemleak?
> > > > =

> > > > This sounds like a leak of memory allocated using kmalloc(), so kme=
mleak
> > > > should be able to catch it.
> > > =

> > > I have an idea what happens here. When the refcount is 0 in kmap, a n=
ew page
> > > mapping for the BO is being established. But VRAM helpers unmap the p=
revious
> > > pages only on BO moves or frees; not in kunmap. So the old mapping mi=
ght
> > > still be around. I'll send out a test patch later today.
> > > =

> > =

> > Great! Looking forward to test it.
> =

> Here's the patch against the latest DRM tree. v5.11-rc3 should work as we=
ll.
> =

> I was able to reproduce the memory leak locally and found that the patch
> fixes it. Please give it a try.
> =


Thomas, thanks for looking into it. My first impression is that the
patch indeed fixes the leak.

I will report again later today.

> Best regards
> Thomas
> =

> > =

> > > Best regards
> > > Thomas
> > > =

> > > > =

> > > > Regards,
> > > > Christian.
> > > > =

> > > > Am 17.01.21 um 06:08 schrieb Eli Cohen:
> > > > > On Fri, Jan 15, 2021 at 10:03:50AM +0100, Thomas Zimmermann wrote:
> > > > > > Could you please double-check that 3fb91f56aea4 ("drm/udl: Retr=
ieve USB
> > > > > > device from struct drm_device.dev") works correctly
> > > > > Checked again, it does not seem to leak.
> > > > > =

> > > > > > and that 823efa922102
> > > > > > ("drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()") is =
broken?
> > > > > > =

> > > > > Yes, this one leaks, as does the one preceding it:
> > > > > =

> > > > > 1086db71a1db ("drm/vram-helper: Remove invariant parameters from
> > > > > internal kmap function")
> > > > > > For one of the broken commits, could you please send us the out=
put of
> > > > > > =

> > > > > >  =A0=A0 dmesg | grep -i drm
> > > > > > =

> > > > > > after most of the memory got leaked?
> > > > > > =

> > > > > I ran the following script in the shell:
> > > > > =

> > > > > while true; do cat /proc/meminfo | grep MemFree:; sleep 5; done
> > > > > =

> > > > > and this is what I saw before I got disconnected from the shell:
> > > > > =

> > > > > MemFree:=A0=A0=A0=A0=A0=A0=A0=A0=A0 148208 kB
> > > > > MemFree:=A0=A0=A0=A0=A0=A0=A0=A0=A0 148304 kB
> > > > > MemFree:=A0=A0=A0=A0=A0=A0=A0=A0=A0 146660 kB
> > > > > Connection to nps-server-24 closed by remote host.
> > > > > Connection to nps-server-24 closed.
> > > > > =

> > > > > =

> > > > > I also mointored the output of dmesg | grep -i drm
> > > > > The last output I was able to save on disk is this:
> > > > > =

> > > > > [=A0=A0 46.140720] ast 0000:03:00.0: [drm] Using P2A bridge for c=
onfiguration
> > > > > [=A0=A0 46.140737] ast 0000:03:00.0: [drm] AST 2500 detected
> > > > > [=A0=A0 46.140754] ast 0000:03:00.0: [drm] Analog VGA only
> > > > > [=A0=A0 46.140772] ast 0000:03:00.0: [drm] dram MCLK=3D800 Mhz ty=
pe=3D7
> > > > > bus_width=3D16
> > > > > [=A0=A0 46.153553] [drm] Initialized ast 0.1.0 20120228 for 0000:=
03:00.0
> > > > > on minor 0
> > > > > [=A0=A0 46.165097] fbcon: astdrmfb (fb0) is primary device
> > > > > [=A0=A0 46.391381] ast 0000:03:00.0: [drm] fb0: astdrmfb frame bu=
ffer device
> > > > > [=A0=A0 56.097697] systemd[1]: Starting Load Kernel Module drm...
> > > > > [=A0=A0 56.343556] systemd[1]: modprobe@drm.service: Succeeded.
> > > > > [=A0=A0 56.350382] systemd[1]: Finished Load Kernel Module drm.
> > > > > [13319.469462] [=A0=A0 2683] 70889=A0 2683=A0=A0=A0 55586=A0=A0=
=A0=A0=A0=A0=A0 0=A0=A0=A0 73728
> > > > > 138=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0 tdrm
> > > > > [13320.658386] [=A0=A0 2683] 70889=A0 2683=A0=A0=A0 55586=A0=A0=
=A0=A0=A0=A0=A0 0=A0=A0=A0 73728
> > > > > 138=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0 tdrm
> > > > > [13321.800970] [=A0=A0 2683] 70889=A0 2683=A0=A0=A0 55586=A0=A0=
=A0=A0=A0=A0=A0 0=A0=A0=A0 73728
> > > > > 138=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0 tdrm
> > > > =

> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > =

> > > -- =

> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > > (HRB 36809, AG N=FCrnberg)
> > > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > > =

> > =

> > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer

> sh: colordiff: command not found
> cat: write error: Broken pipe




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
