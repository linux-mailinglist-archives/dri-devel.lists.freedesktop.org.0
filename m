Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956286DDF49
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6D710E593;
	Tue, 11 Apr 2023 15:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D6010E279
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 15:13:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EDFCC320029B;
 Tue, 11 Apr 2023 11:13:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Apr 2023 11:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1681226030; x=1681312430; bh=AA
 0MaJimcwNeJcPgKAoWqZxmdOXtBaxs17Z5PKlfdXE=; b=Rk+OHcMZD68dIIgyXJ
 b6/Fzs8Ppkw/v+ybMtbRyx/5c8gfReul4kc5Xtebcuj3U8i9GUNTlcWCWV+0HkF2
 TFV9FybmFLht3VUfVqz3ahJzbfg0MePD0SR1MCeNGrf3h3jlctpIArs0mjQehplJ
 IHjw7Ox8s1phQIxfWrlifzG4v6qdzUUJL9/Lx+T+079w7enUTbKCPKSksy4HLa6m
 m27HHaB5OI7HRPZxLbFOCPPsa8zaSNI1hU6aQUiikI38M5cDbZWSDovzE6BIU09A
 xUJCY4hEmOpwAi3UGbAxMArL4P5Kkki+//X2YVUonAUYQ0XoS99U0WvrJQJWq/pI
 H8aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681226030; x=1681312430; bh=AA0MaJimcwNeJ
 cPgKAoWqZxmdOXtBaxs17Z5PKlfdXE=; b=daUmgFHp4e2eXr+3Z5LL9eTfPocST
 Q1Js6Xd5gwv1y/6H75G37B3oPXW15sSe96hzusFEr9fYqUrlVNEC9bxOEj+I7H7x
 GaI5Pw7DAsdG66HdwwPO/Fhmt1/frLGzQX8gMzE3SVVvS8fGiiUdksY28sWmOxe5
 csjnk5RdI1J9a0Ci0rCFZXS9OPpjwnHfie7GQaatEW9Mhh+RGC8FYhIGh/bzrlEO
 ZemEmTtuawjB8+8gVfT0nHAvGPnmVKEB1N3yf9qUr0sZ6WTqE3lqqsYqZ3DvGt4V
 trAOOrMV+zhVWEbsN2SMNsH17Lcr7gT2STdByvYI22feRlN32Wb/Cqvvw==
X-ME-Sender: <xms:Lnk1ZMZxWECqOmvxTQnljXsbqCxz0sCoopaRDj-QEkSCTVqKA4FIZA>
 <xme:Lnk1ZHZxXrr2SMiNZbEecqENMMhlVW1d0dLVcTqT6yL0jUttR_rGgGGyEGOpOJd_a
 qG-O7vwTU1Nnw>
X-ME-Received: <xmr:Lnk1ZG-rThg_vgMCOVtefWOdXeZHP5bhzEX8VDYNcHcTJI5G4KoGBhJNkpBAOixKNgBuYkz2EfkK6HxOKvQ2ZsQipvNE0lMGi_PaXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:Lnk1ZGokvJjOSygsYDhIvsujfRasqXPnKnVj7mGZ5qNkLDWDjEMDoA>
 <xmx:Lnk1ZHqBzsrOb0YqwMZjldIxnaJZJg7-vBMF-5_06XP18QENXMZsFA>
 <xmx:Lnk1ZERZn4tfWKLznfq0ZOlRK88upnBMDuyvbH9W6xmVMrNPR5vx9A>
 <xmx:Lnk1ZNYXE0RSB8xyd4DNoRlhVbViyj_4_yAWPzoRPq3NhLkaMEA6FA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 11:13:49 -0400 (EDT)
Date: Tue, 11 Apr 2023 17:13:47 +0200
From: Greg KH <greg@kroah.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <2023041131-boxy-excavator-1183@gregkh>
References: <20230411143812.11a4b00d@canb.auug.org.au>
 <ZDUuiB+E1tIJ95LY@phenom.ffwll.local>
 <2023041123-tractor-quake-c44d@gregkh>
 <ZDV2Nvs57Orx47tj@phenom.ffwll.local>
 <1094266f-d845-9fa4-9f44-85de8352c04f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1094266f-d845-9fa4-9f44-85de8352c04f@quicinc.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 09:08:39AM -0600, Jeffrey Hugo wrote:
> On 4/11/2023 9:01 AM, Daniel Vetter wrote:
> > On Tue, Apr 11, 2023 at 12:40:28PM +0200, Greg KH wrote:
> > > On Tue, Apr 11, 2023 at 11:55:20AM +0200, Daniel Vetter wrote:
> > > > On Tue, Apr 11, 2023 at 02:38:12PM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > > 
> > > > > After merging the driver-core tree, today's linux-next build (x86_64
> > > > > allmodconfig) failed like this:
> > > > > 
> > > > > In file included from include/linux/linkage.h:7,
> > > > >                   from include/linux/kernel.h:17,
> > > > >                   from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
> > > > > drivers/accel/qaic/mhi_qaic_ctrl.c: In function 'mhi_qaic_ctrl_init':
> > > > > include/linux/export.h:27:22: error: passing argument 1 of 'class_create' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > > > >     27 | #define THIS_MODULE (&__this_module)
> > > > >        |                     ~^~~~~~~~~~~~~~~
> > > > >        |                      |
> > > > >        |                      struct module *
> > > > > drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note: in expansion of macro 'THIS_MODULE'
> > > > >    544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
> > > > >        |                                      ^~~~~~~~~~~
> > > > > In file included from include/linux/device.h:31,
> > > > >                   from include/linux/mhi.h:9,
> > > > >                   from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
> > > > > include/linux/device/class.h:229:54: note: expected 'const char *' but argument is of type 'struct module *'
> > > > >    229 | struct class * __must_check class_create(const char *name);
> > > > >        |                                          ~~~~~~~~~~~~^~~~
> > > > > drivers/accel/qaic/mhi_qaic_ctrl.c:544:25: error: too many arguments to function 'class_create'
> > > > >    544 |         mqc_dev_class = class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
> > > > >        |                         ^~~~~~~~~~~~
> > > > > include/linux/device/class.h:229:29: note: declared here
> > > > >    229 | struct class * __must_check class_create(const char *name);
> > > > >        |                             ^~~~~~~~~~~~
> > > > > 
> > > > > Caused by commit
> > > > > 
> > > > >    1aaba11da9aa ("driver core: class: remove module * from class_create()")
> > > > > 
> > > > > interacting with commit
> > > > > 
> > > > >    566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")
> > > > > 
> > > > > from the drm tree.
> > > > > 
> > > > > I have applied the following merge fix patch for today.
> > > > > 
> > > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > Date: Tue, 11 Apr 2023 14:16:57 +1000
> > > > > Subject: [PATCH] fixup for "driver core: class: remove module * from class_create()"
> > > > > 
> > > > > interacting with "accel/qaic: Add mhi_qaic_cntl"
> > > > > 
> > > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > 
> > > > Thanks for the fixup. Since Dave is out I've made a note about this in my
> > > > handover mail so it won't get lost in the drm-next merge window pull. I
> > > > don't think we need any other coordination than mention it in each pull to
> > > > Linus, topic tree seems overkill for this. Plus there's no way I can
> > > > untangle the drm tree anyway :-).
> > > 
> > > Want me to submit a patch for the drm tree that moves this to use
> > > class_register() instead, which will make the merge/build issue go away
> > > for you?  That's my long-term goal here anyway, so converting this new
> > > code to this api today would be something I have to do eventually :)
> > 
> > We kinda closed drm-next for feature work mostly already (just pulling
> > stuff in from subtrees), so won't really help for this merge window.
> > 
> > For everything else I think this is up to Oded, I had no idea qaic needed
> > it's entire own dev class and I don't want to dig into this for the risk I
> > might freak out :-)
> > 
> > Adding Oded.
> > 
> > Cheers, Daniel
> 
> Sorry for the mess.
> 
> I made a note to update to class_register() once my drm-misc access is
> sorted out.  Looks like we'll address the conflict in the merge window, and
> catch the update to the new API in the following release.

Wait, I think the large question is, "why does this need a separate
class"?  Why are you not using the accel char device and class?  That is
what everything under accel/ should be using, otherwise why put it in
there?

And what exactly are you using that class for?  Just device nodes?  If
so, how many?

thanks,

greg k-h
