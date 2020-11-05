Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C942A82EF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099356EB5E;
	Thu,  5 Nov 2020 16:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE276EB5E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 16:02:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c17so2356927wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XCIw0jSDvgKevlz1EdDH+FQ5oNKF2rewLrDxiihbjSA=;
 b=hSwh7+LrDmzDhKXSpoZ0+YCkL503EuGU8Zjk66LN9vk6Id5SA3iaUWeC5SPCQ3Sna2
 ZvGK2rs3bPnezZ72thWekr7JcszwcL2NrzW3azT0Hwj4RfuF/uxnXEGEcknLngVFDhrX
 opLLzkyZQZa8C0jKmInW3dNsZwC/bJYK7RLvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XCIw0jSDvgKevlz1EdDH+FQ5oNKF2rewLrDxiihbjSA=;
 b=LEDQ8UFq8BHYoezkbvnPk/bKoApdUG1QKRrFKkN7i0ZN6vZO0glRMmc4RIEYNusVJU
 S1BzKUedixodK+aVE9Gx59BwP5VRMU/TYzE8OX+KUIY6Hnaj6lEWdUHfAqF8SzfCU6sd
 /AM/FnMMPpy/Z7q280IVfKl9PzzRlbZJBc2sNBo2cRfVzDJIqZm8YAbzdxShw12m4EMu
 oAjA87uGQtDJLv5Ckd2ad58ggBRAaLYithwhY3bhWbiB7+pBz8v/dbn5m5M0baYuxdDi
 rBxhfoq5pbrxrtdN1hUMRSVArcyUteXbs5WdVjTAPAffkW8B2YxCRHvkalv9eLrQ0Wwf
 bKMw==
X-Gm-Message-State: AOAM533wo/IpnBy809bfZtmcaor02imavjz1e5k0ujIIe9kPDP1BQvUh
 wFxYJomM5Q1okEsOgSMOyqr42g==
X-Google-Smtp-Source: ABdhPJypsJYiiH75m6Nd1tZlnQbztoO29B43J9oDL0aah+ZjAtHUlZF9SPTFriFM0gzxIzlshbYvsw==
X-Received: by 2002:adf:9544:: with SMTP id 62mr3747763wrs.223.1604592132177; 
 Thu, 05 Nov 2020 08:02:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y185sm3323305wmb.29.2020.11.05.08.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 08:02:11 -0800 (PST)
Date: Thu, 5 Nov 2020 17:02:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [drm-drm-misc:for-linux-next 2/2]
 drivers/dma-buf/dma-buf.c:1186: undefined reference to `vma_set_file'
Message-ID: <20201105160209.GA401619@phenom.ffwll.local>
References: <202011052343.iOH9oZPH-lkp@intel.com>
 <3687eb25-8c94-4a08-9917-0f12d57ba76c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3687eb25-8c94-4a08-9917-0f12d57ba76c@amd.com>
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

On Thu, Nov 05, 2020 at 04:41:00PM +0100, Christian K=F6nig wrote:
> Guys, can anybody help me out. Why is the kernel test robot complaining
> here?
> =

> Thanks in advance,
> Christian.
> =

> Am 05.11.20 um 16:26 schrieb kernel test robot:
> > tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
> > head:   2b5b95b1ff3d70a95013a45e3b5b90f1daf42348
> > commit: 2b5b95b1ff3d70a95013a45e3b5b90f1daf42348 [2/2] mm: introduce vm=
a_set_file function v4
> > config: h8300-randconfig-r031-20201105 (attached as .config)
> > compiler: h8300-linux-gcc (GCC) 9.3.0

nommu platform?

If you have a hard time finding a cross compiler for this, there's some
nommu arm platforms. I used that for compile teesting nommu support
recently.

If it's not that, then it's something specific with that config for sure.
-Daniel

> > reproduce (this is a W=3D1 build):
> >          wget https://nam11.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2F=
make.cross&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C2c3b39afc65142=
6aa50608d8819f48fc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63740187120=
4724096%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DdK2txO1WerkR7SiB5i9kcXjbJTMlaQ1Q=
6dbK1cb9lnE%3D&amp;reserved=3D0 -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          git remote add drm-drm-misc git://anongit.freedesktop.org/drm/=
drm-misc
> >          git fetch --no-tags drm-drm-misc for-linux-next
> >          git checkout 2b5b95b1ff3d70a95013a45e3b5b90f1daf42348
> >          # save the attached .config to linux build tree
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.c=
ross ARCH=3Dh8300
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>):
> > =

> >     h8300-linux-ld: section .init.text LMA [00000000004da400,0000000000=
51ebcb] overlaps section .text LMA [000000000000025c,0000000001069997]
> >     h8300-linux-ld: section .data VMA [0000000000400000,00000000004da3f=
f] overlaps section .text VMA [000000000000025c,0000000001069997]
> >     h8300-linux-ld: drivers/dma-buf/dma-buf.o: in function `dma_buf_mma=
p':
> > > > drivers/dma-buf/dma-buf.c:1186: undefined reference to `vma_set_fil=
e'
> > vim +1186 drivers/dma-buf/dma-buf.c
> > =

> >    1150	=

> >    1151	=

> >    1152	/**
> >    1153	 * dma_buf_mmap - Setup up a userspace mmap with the given vma
> >    1154	 * @dmabuf:	[in]	buffer that should back the vma
> >    1155	 * @vma:	[in]	vma for the mmap
> >    1156	 * @pgoff:	[in]	offset in pages where this mmap should start wi=
thin the
> >    1157	 *			dma-buf buffer.
> >    1158	 *
> >    1159	 * This function adjusts the passed in vma so that it points at=
 the file of the
> >    1160	 * dma_buf operation. It also adjusts the starting pgoff and do=
es bounds
> >    1161	 * checking on the size of the vma. Then it calls the exporters=
 mmap function to
> >    1162	 * set up the mapping.
> >    1163	 *
> >    1164	 * Can return negative error values, returns 0 on success.
> >    1165	 */
> >    1166	int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct =
*vma,
> >    1167			 unsigned long pgoff)
> >    1168	{
> >    1169		if (WARN_ON(!dmabuf || !vma))
> >    1170			return -EINVAL;
> >    1171	=

> >    1172		/* check if buffer supports mmap */
> >    1173		if (!dmabuf->ops->mmap)
> >    1174			return -EINVAL;
> >    1175	=

> >    1176		/* check for offset overflow */
> >    1177		if (pgoff + vma_pages(vma) < pgoff)
> >    1178			return -EOVERFLOW;
> >    1179	=

> >    1180		/* check for overflowing the buffer's size */
> >    1181		if (pgoff + vma_pages(vma) >
> >    1182		    dmabuf->size >> PAGE_SHIFT)
> >    1183			return -EINVAL;
> >    1184	=

> >    1185		/* readjust the vma */
> > > 1186		vma_set_file(vma, dmabuf->file);
> >    1187		vma->vm_pgoff =3D pgoff;
> >    1188	=

> >    1189		return dmabuf->ops->mmap(dmabuf, vma);
> >    1190	}
> >    1191	EXPORT_SYMBOL_GPL(dma_buf_mmap);
> >    1192	=

> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D04%7C0=
1%7Cchristian.koenig%40amd.com%7C2c3b39afc651426aa50608d8819f48fc%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C637401871204724096%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;sdata=3DYS8NkL2Wf4ysbsibG3a3MAGp8zsEopbazO3ARSAPezc%3D&amp;reserved=
=3D0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
