Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406D6DD811
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E79810E214;
	Tue, 11 Apr 2023 10:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE9F10E214
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:40:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 357D45C01F9;
 Tue, 11 Apr 2023 06:40:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 11 Apr 2023 06:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1681209632; x=1681296032; bh=Ms
 EI+x69YXCw0ooJR22nn3ErQAanNdLJnpx13limS+Q=; b=A+ID4QNwtfWNNROvkB
 yhp0o0ESxTE518eiNDIvEAa4mOhu+PW1PzhkhJEVRzIJgK4/Hg5FRFO772zZTN3e
 ovsDkzbTJBZyz2wTMi39Lv8khz2XMF+7CAxfQz0icUSguqJ6O2+RoZFgYCLW3Mdv
 YrQmmtiFxNIjvSwODhD6mRiX5P1kOINYjJX/EJqvUCGp9bU/u0sJDL9GuLkTNWQ+
 07yGbmygBUR2CpwlPIrPDzUGG1EQz289tbozeKFIri/vZM/QHy2vV2nAkgsYOUXH
 nYCrVrvoyFNfY+Hv6Bgr9HMO4wSw5bUYtxzVaQNycJv1MJ3WdkWlxmF4Gs9SjQuI
 hbGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681209632; x=1681296032; bh=MsEI+x69YXCw0
 ooJR22nn3ErQAanNdLJnpx13limS+Q=; b=Sm19++nhZnveLgmFXmjMDj0Jm8sQ2
 LxIkib31MY9tItjy/y+cWHVKDbkPzjTY8FiqoAZZQ+HQJ75KYflxtL55ONezZINc
 KaFU8kICsMgMr7XYoAVrQl2DVGn5un2HZ8qvf/GeQnQqfoSXaIQDxwFRGbAlMLSt
 /IPsFHJTMKckBSOrlN5t5p+Y9YbNBAY0t0x/LJ3xGOwgwz4X9geG+UkxGSsP+rsg
 e1DD2ToCQR/v1LJlsyXr5gHq0XBe5MIa7ZbvweM+LMhswbmhSXQ/9g96xsv3aqck
 jR8M6FHKiiztn0lnUiju6TPRlsY1FJika2dLMRlT6bd64yGwz7M8sMuuw==
X-ME-Sender: <xms:Hzk1ZGYhJ5gjc62-C2BPnGTVud2x6lpSqYjGwty7dRL6uzmJXBrtKQ>
 <xme:Hzk1ZJb4qHZcbHzbERjWHXKfMi8igKz8ltwW47geDuBe8QHeMbm38rx9FNkq6V80V
 X75lVz5bDniWQ>
X-ME-Received: <xmr:Hzk1ZA_08IpCAznj0hV78g3xO8Ssr5aoDSR49n_j_RoHnnJ1Voo-YOyYlHM5aYIMI11NHmNa-UQ7GxiGeEDNWC6lPW_IZCZNtFE_uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
 drtghomh
X-ME-Proxy: <xmx:Hzk1ZIrQlOgwk3vHQ54knEryWPRNw3o-Sps37DN_lA7lFObsFtNHYw>
 <xmx:Hzk1ZBqLNOIgkciKwoCvPltbjRRkSNEFaEy15g_K16QpkNfJ4lqkoA>
 <xmx:Hzk1ZGQyN84BGaqtF1fuPSDTX2a1gUVtbuLlZbpg7cOvMnwF4Mw59Q>
 <xmx:IDk1ZMBRT_VhDWlW9Rgjayq7uhi891B3-cSUAoEZBDo1Sw-1SO4tvA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 06:40:31 -0400 (EDT)
Date: Tue, 11 Apr 2023 12:40:28 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <2023041123-tractor-quake-c44d@gregkh>
References: <20230411143812.11a4b00d@canb.auug.org.au>
 <ZDUuiB+E1tIJ95LY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDUuiB+E1tIJ95LY@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 11:55:20AM +0200, Daniel Vetter wrote:
> On Tue, Apr 11, 2023 at 02:38:12PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the driver-core tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > In file included from include/linux/linkage.h:7,
> >                  from include/linux/kernel.h:17,
> >                  from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
> > drivers/accel/qaic/mhi_qaic_ctrl.c: In function 'mhi_qaic_ctrl_init':
> > include/linux/export.h:27:22: error: passing argument 1 of 'class_create' from incompatible pointer type [-Werror=incompatible-pointer-types]
> >    27 | #define THIS_MODULE (&__this_module)
> >       |                     ~^~~~~~~~~~~~~~~
> >       |                      |
> >       |                      struct module *
> > drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note: in expansion of macro 'THIS_MODULE'
> >   544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
> >       |                                      ^~~~~~~~~~~
> > In file included from include/linux/device.h:31,
> >                  from include/linux/mhi.h:9,
> >                  from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
> > include/linux/device/class.h:229:54: note: expected 'const char *' but argument is of type 'struct module *'
> >   229 | struct class * __must_check class_create(const char *name);
> >       |                                          ~~~~~~~~~~~~^~~~
> > drivers/accel/qaic/mhi_qaic_ctrl.c:544:25: error: too many arguments to function 'class_create'
> >   544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
> >       |                         ^~~~~~~~~~~~
> > include/linux/device/class.h:229:29: note: declared here
> >   229 | struct class * __must_check class_create(const char *name);
> >       |                             ^~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   1aaba11da9aa ("driver core: class: remove module * from class_create()")
> > 
> > interacting with commit
> > 
> >   566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")
> > 
> > from the drm tree.
> > 
> > I have applied the following merge fix patch for today.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 11 Apr 2023 14:16:57 +1000
> > Subject: [PATCH] fixup for "driver core: class: remove module * from class_create()"
> > 
> > interacting with "accel/qaic: Add mhi_qaic_cntl"
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Thanks for the fixup. Since Dave is out I've made a note about this in my
> handover mail so it won't get lost in the drm-next merge window pull. I
> don't think we need any other coordination than mention it in each pull to
> Linus, topic tree seems overkill for this. Plus there's no way I can
> untangle the drm tree anyway :-).

Want me to submit a patch for the drm tree that moves this to use
class_register() instead, which will make the merge/build issue go away
for you?  That's my long-term goal here anyway, so converting this new
code to this api today would be something I have to do eventually :)

thanks,

greg k-h
