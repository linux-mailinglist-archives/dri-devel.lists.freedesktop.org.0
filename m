Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F72A207D
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FC66EB43;
	Sun,  1 Nov 2020 17:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6616E9A3;
 Fri, 30 Oct 2020 12:55:53 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f38so5139567pgm.2;
 Fri, 30 Oct 2020 05:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EY5jmWEppGIZD3OkVY+PrUIlVBuLQJBSLFzS0cv2zkM=;
 b=WgQp7Qjiipq8bte2F1/XmxDPy678VMaI9Ka5i4CJlLM1plIBKrrKgJM3nLT34PINBr
 WQqbuvEeg3MK45EaLtALAiEFpwYzprg/RILN3PrXmHXJw+muwSjEQb96/fU5VB4f2aIx
 F5Dc0u6qNHTOwdeyVq4EuGaO311NqjR1yN4CzUH9vwhcJ1i8BWtCyMTDFAAku5fV0+AR
 ohvpHctMTeVrBOpe6ZOnao1AWQCz9Wxl64XuYx1ivWMi6e/weY8eQ38/voa3ATTB7w5v
 i4RqN64uuTgCOCNOQYLDNr6/g4Tz8x6axhvES1vtSHJfiabDIELHfktcq8S/dEad9nlV
 rY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EY5jmWEppGIZD3OkVY+PrUIlVBuLQJBSLFzS0cv2zkM=;
 b=Sgqwn8n/FlyRMMbKApdlOQN+oZV9ZDmvzcaL0GQrs5MtakMuIzmXOUP7/cf35/D2xV
 054G6xy4LhX8w88JOU6Btfi2as9QwVCedYPiTcUGhYOo3+DVIFsjWpbyNzIVxvfPE7xL
 +dsuuB74aTOITfl0URAYPK76Ux294ABDo8mf8QiCm38dhMDKheRemTnc46G7AvwRhrDQ
 LX3PzE1McG4TlTfwS1bqbJw7rq6lVujnnqVfE/Q60jLudzyxsTozvGlIZmV8aoEtyj/w
 MFIhfiWBNokCum7GC+C7PAG+8abu4RJJBlAcoS5fBFxN2DCFxXH41ezGB+Zu/hlaLQtR
 wzFg==
X-Gm-Message-State: AOAM532V3oNZNqlBawBKtZIyYoDsoOz/M++el2OMTi6GOhAMdvLtubOy
 p4JZfdkCgIz6thjM0+bkGMU=
X-Google-Smtp-Source: ABdhPJzoSJ653ZkGK6/QfvAF19ZEAnwk6sJbWIaUpunnUSpAkaJGC9hruc/dZwTt/I6cHpg1CdQcOA==
X-Received: by 2002:a17:90a:fa09:: with SMTP id
 cm9mr2840218pjb.162.1604062552599; 
 Fri, 30 Oct 2020 05:55:52 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id w19sm6220886pff.6.2020.10.30.05.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 05:55:52 -0700 (PDT)
Date: Fri, 30 Oct 2020 18:25:45 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 outreachy-kernel@googlegroups.com,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 melissa.srw@gmail.com
Subject: Re: [Outreachy kernel] [PATCH] drm/amdgpu: use
 DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
Message-ID: <20201030125545.GA12671@my--box>
References: <20201030032245.GA274478@my--box>
 <20201030071120.GA1493629@kroah.com>
 <20201030075716.GA6976@my--box>
 <5a7d8e8d-8db5-ff56-6448-3f1cefc11ef8@amd.com>
 <20201030082518.GB1619669@kroah.com>
 <20201030091521.GH401619@phenom.ffwll.local>
 <20201030092457.GI401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030092457.GI401619@phenom.ffwll.local>
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 10:24:57AM +0100, Daniel Vetter wrote:
> On Fri, Oct 30, 2020 at 10:15:21AM +0100, Daniel Vetter wrote:
> > On Fri, Oct 30, 2020 at 09:25:18AM +0100, Greg KH wrote:
> > > On Fri, Oct 30, 2020 at 09:00:04AM +0100, Christian K=F6nig wrote:
> > > > Am 30.10.20 um 08:57 schrieb Deepak R Varma:
> > > > > On Fri, Oct 30, 2020 at 08:11:20AM +0100, Greg KH wrote:
> > > > > > On Fri, Oct 30, 2020 at 08:52:45AM +0530, Deepak R Varma wrote:
> > > > > > > Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file=
_unsafe()
> > > > > > > function in place of the debugfs_create_file() function will =
make the
> > > > > > > file operation struct "reset" aware of the file's lifetime. A=
dditional
> > > > > > > details here: https://nam11.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Flists.archive.carbon60.com%2Flinux%2Fkernel%2F2369498&=
amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cddd7a6ac8164415a639708d87=
ca97004%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637396414464384011%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;sdata=3Do6GOHvMxNMuOPlC4nhDyURCHBLqfQZhYQq%2BiIMt3D=
3s%3D&amp;reserved=3D0
> > > > > > > =

> > > > > > > Issue reported by Coccinelle script:
> > > > > > > scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > > > > > =

> > > > > > > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > > > > > > ---
> > > > > > > Please Note: This is a Outreachy project task patch.
> > > > > > > =

> > > > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 20 ++++++++++=
----------
> > > > > > >   1 file changed, 10 insertions(+), 10 deletions(-)
> > > > > > > =

> > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/dr=
ivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > > > index 2d125b8b15ee..f076b1ba7319 100644
> > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > > > @@ -1551,29 +1551,29 @@ static int amdgpu_debugfs_sclk_set(vo=
id *data, u64 val)
> > > > > > >   	return 0;
> > > > > > >   }
> > > > > > > -DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
> > > > > > > -			amdgpu_debugfs_ib_preempt, "%llu\n");
> > > > > > > +DEFINE_DEBUGFS_ATTRIBUTE(fops_ib_preempt, NULL,
> > > > > > > +			 amdgpu_debugfs_ib_preempt, "%llu\n");
> > > > > > Are you sure this is ok?  Do these devices need this additional
> > > > > > "protection"?  Do they have the problem that these macros were =
written
> > > > > > for?
> > > > > > =

> > > > > > Same for the other patches you just submitted here, I think you=
 need to
> > > > > > somehow "prove" that these changes are necessary, checkpatch is=
n't able
> > > > > > to determine this all the time.
> > > > > Hi Greg,
> > > > > Based on my understanding, the current function debugfs_create_fi=
le()
> > > > > adds an overhead of lifetime managing proxy for such fop structs.=
 This
> > > > > should be applicable to these set of drivers as well. Hence I thi=
nk this
> > > > > change will be useful.
> > > > =

> > > > Well since this is only created once per device instance I don't re=
ally care
> > > > about this little overhead.
> > > > =

> > > > But what exactly is debugfs doing or not doing here?
> > > =

> > > It is trying to save drivers from having debugfs files open that point
> > > to memory that can go away at any time.  For graphics devices, I doubt
> > > that is the case.
> > =

> > So for anything we add/remove we have two-stage cleanup
> > =

> > 1. drm_dev_unregister (or drm_connector_unregisters, those are the only
> > two hotunpluggable things we have) unregister all the uapi interfaces.
> > This deletes all the sysfs and debugfs files.
> > =

> > 2. Once all the references to the underlying object disappear from the
> > kernel, we free up the data structure.
> > =

> > Now for chardev and similar uapi, we hold full references for open file=
s.
> > But for sysfs and debugfs we assume that those uapi layers will make su=
re
> > that after we deleted the files in step 1 all access through these
> > functions are guaranteed to have finished. If that's not the case, then=
 we
> > need to rework our refcounting and also refcount the underlying drm
> > structure (drm_device or drm_connector) from sysfs/debugfs files.
> > =

> > Now I tried to look at the patch Deepak references, and I'm not really
> > clear what changes. Or whether we made a wrong assumption previously ab=
out
> > what debugfs/sysfs guarantee when we delete the files.
> =

> I read some more code and kerneldoc, and I still have no idea what this
> new _unsafe variant is used for. Only ones I've found seem to use
> debugfs_file_get/put like the normal variant, to protect against
> concurrently removed files due to hotunplug. Which is kinda what we've
> been expecting debugfs to do for us.
> =

> What's a use-case for _unsafe _without_ debugfs_file_get/put?
> =

> Decently confused me over here doesn't get this.
> -Daniel

Hi All,
Thank you for your comments. I was not anticipating this to be such a
offbeat patch. Pardon my growing understanding.

Please suggest if I can evaluate the change proposed  to confirm if this is
a meaningful change.

Thank you again!
./drv


> =

> > -Daniel
> > =

> > > =

> > > thanks,
> > > =

> > > greg k-h
> > =

> > -- =

> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
