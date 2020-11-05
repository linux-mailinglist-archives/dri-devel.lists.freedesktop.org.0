Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AAB2A82F7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6987889E63;
	Thu,  5 Nov 2020 16:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377D89E63
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 16:04:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b8so2395650wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 08:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VcuY/RzcpJ0olMhxSXtpGPMG2H908/GLW/LWmg7t6b0=;
 b=lfuPJZBbMyVK0CcJ6ftD+6GrbhTuzwodsmeaGTgRwLYLZz37EM5CiL81EgMqpzDRcv
 d5XgYbj/VNCivQyA85JwsWxVWl+Yu0lZ5/syWxjoCPS76IaeaVoDJARViNIVBk+Ud9QV
 CrO4jQPvklso02k0vOPOs9UOsCM6/uEUdq9W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VcuY/RzcpJ0olMhxSXtpGPMG2H908/GLW/LWmg7t6b0=;
 b=ZPU2KIuUfaP0Un27sQ3alV+UBnE0p/q45xchpBLZtGjLr5ik2onL+TFXOf2cmnxeb+
 I1JOlTR9iq83hHR+gNk4JQYhLwZvB5HBZfYCq3+HTBwqJ9ObdVGh3d/EJC2iXVajZLXc
 jWXhSPy6bEIib7wfpPEfp7TZO/uJn8i5f29gJmMQURyma/fK9/qnET1d7JCvGMGiLEEx
 SdBXX+9NUaoK1jCXX79XzQDyxcG0mMotaL1iSxHFtHCxxPaWrDmOXTwtOppWid9iNf5s
 ELk096aPs1jLwX6uTK1clhlCvEMR9CAQwNgzbbjJM0PnYrwxAzmyU2Ani5qZg2xn4MQp
 Ziiw==
X-Gm-Message-State: AOAM531vjGhqIi9+WAM8UPJP4cM8MNIzYVPOCSqOs6tKmT4dR8w/Ri9R
 jj48l9bVnbzZaMqy/UrrGOMbbg==
X-Google-Smtp-Source: ABdhPJzGN/s+l3O6WHRRWBSR27GN7tCBjHW7w1EMDBB9tGzvBkOEvzcVRi54II1Z7R6A6ac1qRfSkw==
X-Received: by 2002:adf:e551:: with SMTP id z17mr1052075wrm.374.1604592262454; 
 Thu, 05 Nov 2020 08:04:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g23sm2991409wmh.21.2020.11.05.08.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 08:04:21 -0800 (PST)
Date: Thu, 5 Nov 2020 17:04:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [drm-drm-misc:for-linux-next 2/2]
 drivers/dma-buf/dma-buf.c:1186: undefined reference to `vma_set_file'
Message-ID: <20201105160419.GB401619@phenom.ffwll.local>
References: <202011052343.iOH9oZPH-lkp@intel.com>
 <3687eb25-8c94-4a08-9917-0f12d57ba76c@amd.com>
 <20201105160209.GA401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105160209.GA401619@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 05:02:09PM +0100, Daniel Vetter wrote:
> On Thu, Nov 05, 2020 at 04:41:00PM +0100, Christian K=F6nig wrote:
> > Guys, can anybody help me out. Why is the kernel test robot complaining
> > here?
> > =

> > Thanks in advance,
> > Christian.
> > =

> > Am 05.11.20 um 16:26 schrieb kernel test robot:
> > > tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
> > > head:   2b5b95b1ff3d70a95013a45e3b5b90f1daf42348
> > > commit: 2b5b95b1ff3d70a95013a45e3b5b90f1daf42348 [2/2] mm: introduce =
vma_set_file function v4
> > > config: h8300-randconfig-r031-20201105 (attached as .config)
> > > compiler: h8300-linux-gcc (GCC) 9.3.0
> =

> nommu platform?
> =

> If you have a hard time finding a cross compiler for this, there's some
> nommu arm platforms. I used that for compile teesting nommu support
> recently.
> =

> If it's not that, then it's something specific with that config for sure.

Also looking a the tree, there's no ack from Andrew Morton. For merging
stuff that's not maintained in drm-misc (and definitely for stuff outside
of drm maintained tree) we need an ack from the right maintainer.

I'd say make sure he's ok before we dig an even deeper hole here.
-Daniel

> -Daniel
> =

> > > reproduce (this is a W=3D1 build):
> > >          wget https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%=
2Fmake.cross&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C2c3b39afc651=
426aa50608d8819f48fc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637401871=
204724096%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DdK2txO1WerkR7SiB5i9kcXjbJTMlaQ=
1Q6dbK1cb9lnE%3D&amp;reserved=3D0 -O ~/bin/make.cross
> > >          chmod +x ~/bin/make.cross
> > >          git remote add drm-drm-misc git://anongit.freedesktop.org/dr=
m/drm-misc
> > >          git fetch --no-tags drm-drm-misc for-linux-next
> > >          git checkout 2b5b95b1ff3d70a95013a45e3b5b90f1daf42348
> > >          # save the attached .config to linux build tree
> > >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make=
.cross ARCH=3Dh8300
> > > =

> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > =

> > > All errors (new ones prefixed by >>):
> > > =

> > >     h8300-linux-ld: section .init.text LMA [00000000004da400,00000000=
0051ebcb] overlaps section .text LMA [000000000000025c,0000000001069997]
> > >     h8300-linux-ld: section .data VMA [0000000000400000,00000000004da=
3ff] overlaps section .text VMA [000000000000025c,0000000001069997]
> > >     h8300-linux-ld: drivers/dma-buf/dma-buf.o: in function `dma_buf_m=
map':
> > > > > drivers/dma-buf/dma-buf.c:1186: undefined reference to `vma_set_f=
ile'
> > > vim +1186 drivers/dma-buf/dma-buf.c
> > > =

> > >    1150	=

> > >    1151	=

> > >    1152	/**
> > >    1153	 * dma_buf_mmap - Setup up a userspace mmap with the given vma
> > >    1154	 * @dmabuf:	[in]	buffer that should back the vma
> > >    1155	 * @vma:	[in]	vma for the mmap
> > >    1156	 * @pgoff:	[in]	offset in pages where this mmap should start =
within the
> > >    1157	 *			dma-buf buffer.
> > >    1158	 *
> > >    1159	 * This function adjusts the passed in vma so that it points =
at the file of the
> > >    1160	 * dma_buf operation. It also adjusts the starting pgoff and =
does bounds
> > >    1161	 * checking on the size of the vma. Then it calls the exporte=
rs mmap function to
> > >    1162	 * set up the mapping.
> > >    1163	 *
> > >    1164	 * Can return negative error values, returns 0 on success.
> > >    1165	 */
> > >    1166	int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struc=
t *vma,
> > >    1167			 unsigned long pgoff)
> > >    1168	{
> > >    1169		if (WARN_ON(!dmabuf || !vma))
> > >    1170			return -EINVAL;
> > >    1171	=

> > >    1172		/* check if buffer supports mmap */
> > >    1173		if (!dmabuf->ops->mmap)
> > >    1174			return -EINVAL;
> > >    1175	=

> > >    1176		/* check for offset overflow */
> > >    1177		if (pgoff + vma_pages(vma) < pgoff)
> > >    1178			return -EOVERFLOW;
> > >    1179	=

> > >    1180		/* check for overflowing the buffer's size */
> > >    1181		if (pgoff + vma_pages(vma) >
> > >    1182		    dmabuf->size >> PAGE_SHIFT)
> > >    1183			return -EINVAL;
> > >    1184	=

> > >    1185		/* readjust the vma */
> > > > 1186		vma_set_file(vma, dmabuf->file);
> > >    1187		vma->vm_pgoff =3D pgoff;
> > >    1188	=

> > >    1189		return dmabuf->ops->mmap(dmabuf, vma);
> > >    1190	}
> > >    1191	EXPORT_SYMBOL_GPL(dma_buf_mmap);
> > >    1192	=

> > > =

> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D04%7=
C01%7Cchristian.koenig%40amd.com%7C2c3b39afc651426aa50608d8819f48fc%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637401871204724096%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;sdata=3DYS8NkL2Wf4ysbsibG3a3MAGp8zsEopbazO3ARSAPezc%3D&amp;reserve=
d=3D0
> > =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
