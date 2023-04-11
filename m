Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 191996DE43F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 20:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340F510E60B;
	Tue, 11 Apr 2023 18:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6379710E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 18:47:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f080f4fbe1so3369395e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681238833; x=1683830833;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SHeREDmQpF1mKkKAj+Xbt8r1WK0XBs3O/3ntkX9N1rw=;
 b=kPgmgIXWIZTesK91wTRlpqTe/xQDNTPoo3C7Ch3801m5db0nhWRFUXFY4ACWBP9d7n
 dM1oz22uuXBn47mShrH3CHc8bDCRX+W3bxBMBSi+FMxSvQ38gYQBS51Agcp6gX0VNq0d
 MpkA0a5uZdB28VbymoN2W5oRt4rBeEYKr8OB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238833; x=1683830833;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SHeREDmQpF1mKkKAj+Xbt8r1WK0XBs3O/3ntkX9N1rw=;
 b=aHUC0P/KKpy9OKbsvxjykknc3O7mc4EbviQfWpPkokgvjos9ck7T4aRL5JgsvE7m/a
 oQ01B0eJogNfDfyRWGehvmftg8aE8j33uCaLPpCopnCylWalPBlCvlSMUyOHUciT25T1
 GyYLvKuuAlzr37B2W14nhxs1xVD+J9XEN4IAkckqd4RCECBpjbENLRltgi5LILn3Illt
 JqrTmoRK8mHyjXvQjacyQzMhuDZbijtDW5lYWk7AZWszTIBXY+uLKat1LG3nHLsJan5B
 cW0wB/H5FIw4aTPfsEWF5Pmt6aN9k01yij9ZADsoDgXg5AT7gcNUJ1BZdAq+E5BMANeP
 R0Cw==
X-Gm-Message-State: AAQBX9clBcsEemKy0/JzTqsg/Fc/s0iv9wfVDVGisz4fq1FnM64a3BuV
 7kK8n/t7rba2Q/wGmoND9fAo6COQW7wwVF+FGew=
X-Google-Smtp-Source: AKy350YIJ+wd41FkvyLdeW1IvqtDNkeZwwqaD0Nc7eYH3PgJnve+msZuxlyvl9B9v5feaT1LXXxc/A==
X-Received: by 2002:a5d:6588:0:b0:2e4:aa61:a50 with SMTP id
 q8-20020a5d6588000000b002e4aa610a50mr8066217wru.1.1681238833028; 
 Tue, 11 Apr 2023 11:47:13 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k8-20020adfd848000000b002f0075ccf7bsm7893314wrl.71.2023.04.11.11.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 11:47:12 -0700 (PDT)
Date: Tue, 11 Apr 2023 20:47:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <ZDWrLnWCzIrybHWB@phenom.ffwll.local>
Mail-Followup-To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <2023041123-tractor-quake-c44d@gregkh>
 <ZDV2Nvs57Orx47tj@phenom.ffwll.local>
 <1094266f-d845-9fa4-9f44-85de8352c04f@quicinc.com>
 <2023041131-boxy-excavator-1183@gregkh>
 <04155e87-16f7-9916-6aa8-b4842ef92b83@quicinc.com>
 <3879d287-81e0-5e25-8c58-f9554ce2303b@quicinc.com>
 <ZDWLRxkFjsGZazXD@phenom.ffwll.local>
 <19e3438f-8e85-9da4-cd9d-8fc19559abd7@quicinc.com>
 <ZDWlIuRHYPP1DeYi@phenom.ffwll.local>
 <086e08a2-13b3-870c-4b17-1fdc9d56d551@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <086e08a2-13b3-870c-4b17-1fdc9d56d551@quicinc.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Manivannan Sadhasivam <mani@kernel.org>, Greg KH <greg@kroah.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 12:37:23PM -0600, Jeffrey Hugo wrote:
> On 4/11/2023 12:21 PM, Daniel Vetter wrote:
> > On Tue, Apr 11, 2023 at 11:18:29AM -0600, Jeffrey Hugo wrote:
> > > On 4/11/2023 10:31 AM, Daniel Vetter wrote:
> > > > On Tue, Apr 11, 2023 at 09:29:27AM -0600, Jeffrey Hugo wrote:
> > > > > On 4/11/2023 9:26 AM, Jeffrey Hugo wrote:
> > > > > > On 4/11/2023 9:13 AM, Greg KH wrote:
> > > > > > > On Tue, Apr 11, 2023 at 09:08:39AM -0600, Jeffrey Hugo wrote:
> > > > > > > > On 4/11/2023 9:01 AM, Daniel Vetter wrote:
> > > > > > > > > On Tue, Apr 11, 2023 at 12:40:28PM +0200, Greg KH wrote:
> > > > > > > > > > On Tue, Apr 11, 2023 at 11:55:20AM +0200, Daniel Vetter wrote:
> > > > > > > > > > > On Tue, Apr 11, 2023 at 02:38:12PM +1000, Stephen Rothwell wrote:
> > > > > > > > > > > > Hi all,
> > > > > > > > > > > > 
> > > > > > > > > > > > After merging the driver-core tree, today's linux-next build (x86_64
> > > > > > > > > > > > allmodconfig) failed like this:
> > > > > > > > > > > > 
> > > > > > > > > > > > In file included from include/linux/linkage.h:7,
> > > > > > > > > > > >                      from include/linux/kernel.h:17,
> > > > > > > > > > > >                      from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
> > > > > > > > > > > > drivers/accel/qaic/mhi_qaic_ctrl.c: In function
> > > > > > > > > > > > 'mhi_qaic_ctrl_init':
> > > > > > > > > > > > include/linux/export.h:27:22: error: passing
> > > > > > > > > > > > argument 1 of 'class_create' from incompatible
> > > > > > > > > > > > pointer type
> > > > > > > > > > > > [-Werror=incompatible-pointer-types]
> > > > > > > > > > > >        27 | #define THIS_MODULE (&__this_module)
> > > > > > > > > > > >           |                     ~^~~~~~~~~~~~~~~
> > > > > > > > > > > >           |                      |
> > > > > > > > > > > >           |                      struct module *
> > > > > > > > > > > > drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note:
> > > > > > > > > > > > in expansion of macro 'THIS_MODULE'
> > > > > > > > > > > >       544 |         mqc_dev_class =
> > > > > > > > > > > > class_create(THIS_MODULE,
> > > > > > > > > > > > MHI_QAIC_CTRL_DRIVER_NAME);
> > > > > > > > > > > >           |                                      ^~~~~~~~~~~
> > > > > > > > > > > > In file included from include/linux/device.h:31,
> > > > > > > > > > > >                      from include/linux/mhi.h:9,
> > > > > > > > > > > >                      from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
> > > > > > > > > > > > include/linux/device/class.h:229:54: note:
> > > > > > > > > > > > expected 'const char *' but argument is of type
> > > > > > > > > > > > 'struct module *'
> > > > > > > > > > > >       229 | struct class * __must_check
> > > > > > > > > > > > class_create(const char *name);
> > > > > > > > > > > >           |                                          ~~~~~~~~~~~~^~~~
> > > > > > > > > > > > drivers/accel/qaic/mhi_qaic_ctrl.c:544:25:
> > > > > > > > > > > > error: too many arguments to function
> > > > > > > > > > > > 'class_create'
> > > > > > > > > > > >       544 |         mqc_dev_class =
> > > > > > > > > > > > class_create(THIS_MODULE,
> > > > > > > > > > > > MHI_QAIC_CTRL_DRIVER_NAME);
> > > > > > > > > > > >           |                         ^~~~~~~~~~~~
> > > > > > > > > > > > include/linux/device/class.h:229:29: note: declared here
> > > > > > > > > > > >       229 | struct class * __must_check
> > > > > > > > > > > > class_create(const char *name);
> > > > > > > > > > > >           |                             ^~~~~~~~~~~~
> > > > > > > > > > > > 
> > > > > > > > > > > > Caused by commit
> > > > > > > > > > > > 
> > > > > > > > > > > >       1aaba11da9aa ("driver core: class: remove
> > > > > > > > > > > > module * from class_create()")
> > > > > > > > > > > > 
> > > > > > > > > > > > interacting with commit
> > > > > > > > > > > > 
> > > > > > > > > > > >       566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")
> > > > > > > > > > > > 
> > > > > > > > > > > > from the drm tree.
> > > > > > > > > > > > 
> > > > > > > > > > > > I have applied the following merge fix patch for today.
> > > > > > > > > > > > 
> > > > > > > > > > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > > > > > > > Date: Tue, 11 Apr 2023 14:16:57 +1000
> > > > > > > > > > > > Subject: [PATCH] fixup for "driver core: class:
> > > > > > > > > > > > remove module * from class_create()"
> > > > > > > > > > > > 
> > > > > > > > > > > > interacting with "accel/qaic: Add mhi_qaic_cntl"
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > > > > > > > 
> > > > > > > > > > > Thanks for the fixup. Since Dave is out I've made a
> > > > > > > > > > > note about this in my
> > > > > > > > > > > handover mail so it won't get lost in the drm-next
> > > > > > > > > > > merge window pull. I
> > > > > > > > > > > don't think we need any other coordination than
> > > > > > > > > > > mention it in each pull to
> > > > > > > > > > > Linus, topic tree seems overkill for this. Plus there's no way I can
> > > > > > > > > > > untangle the drm tree anyway :-).
> > > > > > > > > > 
> > > > > > > > > > Want me to submit a patch for the drm tree that moves this to use
> > > > > > > > > > class_register() instead, which will make the
> > > > > > > > > > merge/build issue go away
> > > > > > > > > > for you?  That's my long-term goal here anyway, so converting this new
> > > > > > > > > > code to this api today would be something I have to do eventually :)
> > > > > > > > > 
> > > > > > > > > We kinda closed drm-next for feature work mostly already (just pulling
> > > > > > > > > stuff in from subtrees), so won't really help for this merge window.
> > > > > > > > > 
> > > > > > > > > For everything else I think this is up to Oded, I had no
> > > > > > > > > idea qaic needed
> > > > > > > > > it's entire own dev class and I don't want to dig into this
> > > > > > > > > for the risk I
> > > > > > > > > might freak out :-)
> > > > > > > > > 
> > > > > > > > > Adding Oded.
> > > > > > > > > 
> > > > > > > > > Cheers, Daniel
> > > > > > > > 
> > > > > > > > Sorry for the mess.
> > > > > > > > 
> > > > > > > > I made a note to update to class_register() once my drm-misc access is
> > > > > > > > sorted out.  Looks like we'll address the conflict in the merge
> > > > > > > > window, and
> > > > > > > > catch the update to the new API in the following release.
> > > > > > > 
> > > > > > > Wait, I think the large question is, "why does this need a separate
> > > > > > > class"?  Why are you not using the accel char device and class?  That is
> > > > > > > what everything under accel/ should be using, otherwise why put it in
> > > > > > > there?
> > > > > > > 
> > > > > > > And what exactly are you using that class for?  Just device nodes?  If
> > > > > > > so, how many?
> > > > > > > 
> > > > > > > thanks,
> > > > > > > 
> > > > > > > greg k-h
> > > > > > 
> > > > > > 
> > > > > > Remember MHI_UCI that then evolved into the WWAN subsystem?  I pointed
> > > > > > out at the time that AIC100/QAIC would need the same functionality.
> > > > > > You/Jakub told myself/Mani/Loic that a combined implementation is not
> > > > > > acceptable, and every area needs to implement their own version of
> > > > > > MHI_UCI.
> > > > > > 
> > > > > > We took the WWAN subsystem and simplified it to meet our needs.
> > > > > > 
> > > > > > The functionality is QAIC specific, so wedging it into the Accel node
> > > > > > seems to be a poor fit as it would subject Habana and iVPU to the same.
> > > > > 
> > > > > Also, I forgot to mention.  QAIC is sharing userspace components with WWAN,
> > > > > so we really cannot diverge from what WWAN has done and define a new API
> > > > > through the Accel node.
> > > > 
> > > > So there is an accel/drm_device in the qaic driver, but there's also this
> > > > different class thing, which I don't get.
> > > > 
> > > > And yeah if that's an entirely orthogonal thing then I guess that should
> > > > be in a different driver/subsystem, all supported with the aux bus to
> > > > multiplex the underlying device.
> > > > 
> > > > I haven't found any explanation for what MHI is (or any of the other
> > > > acrynoms), so I'm entirely lost.
> > > 
> > > MHI is documented at Documentation/mhi/
> > > It is also referenced in the QAIC documentation - Documentation/accel/qaic/
> > > 
> > > It stands for "Modem Host Interface" (arguably a bad name now, but you can
> > > guess where it came from).  It is a Qualcomm hardware block and associated
> > > software protocol that provides logical channels over a hardware link.  Most
> > > commonly used for PCIe.
> > > 
> > > Pretty much any modern Qualcomm PCIe device implements it.  4G modems, 5G
> > > modems, Wifi adapters, AIC100, etc.  Instead of talking "PCIe", the host
> > > talks "MHI" to the devices in most cases.
> > > 
> > > The core implementation for MHI exists in drivers/bus/mhi
> > > 
> > > MHI_UCI is the MHI Userspace Character Interface.  It looked like most buses
> > > (eg USB) provide some direct device access to userspace.  MHI_UCI was
> > > formulated along those same lines - provide direct userspace access to a
> > > whitelist of channels.  Qualcomm provides some fairly extensive userspace
> > > utilities, and various communities have developed open source alternatives
> > > using this mechanism.
> > > 
> > > MHI_UCI was proposed to the community as the common driver (misc device) for
> > > all of the MHI devices.  The Net folks came along, saw that it was used for
> > > 4G/5G modems (Wireless Wide Area Network devices or WWAN) and decided that
> > > they would not tolerate a common implementation.  They NACK'd MHI_UCI and
> > > required that a WWAN specific subsystem be developed which would only
> > > service WWAN devices.  The Net folks decreed that other subsystems which
> > > needed the same functionality need to have their own copy of the
> > > implementation.
> > > 
> > > QAIC devices expose Sahara (a boot time protocol) which has an existing
> > > userspace that is also used with Modems, although it looks like WWAN doesn't
> > > currently support those generations of products today.  QAIC devices also
> > > support DIAG, which is currently supported in WWAN.  The intent was to add
> > > the QAIC support for DIAG at a later time since it is not required for the
> > > bare minimum viable driver.
> > > 
> > > So, QAIC devices support the same services, would use the same userspace,
> > > but can't use a common implementation because Jakub(net) doesn't want to
> > > share and convinced Greg to go along.  I'm not interested in pushing a cross
> > > tree fight (arguably already did that with MHI_UCI).  If neither Greg nor
> > > Net will accept a common implementation that accelerators can use (QAIC),
> > > then the only place I can fit this is in the Accel area.
> > > 
> > > Using aux bus seems to make little difference if QAIC is the only consumer
> > > of this.  I'm willing to refactor the implementation with some feedback and
> > > guidence, but the uAPI seems set in stone due to the existing userspace and
> > > WWAN (char devs with open/close/read/write/poll).
> > 
> > Ok, so MHI _is_ the bus. Thanks for the explainer, I should have searched
> > a bit more in Documentation/
> > 
> > > What would make you less unhappy?
> > 
> > The MHI generic userspace driver interface needs to be in drivers/bus/mhi,
> > not in a random driver. I think we should revert 566fc96198b4
> > ("accel/qaic: Add mhi_qaic_cntl") and re-land that through Greg's tree (or
> > wherever mhi patches go to). This of course assuming that the accel
> > userspace on top of the accel/drm_device does work stand-alone, and it's
> > just the tooling and other userspace that needs MHI_UCI. If we end with a
> > non-functional stack due to that, then I guess the entire driver is a bit
> > up for questions, because at least the accel runtime is supposed to just
> > run on top of the accel devnode and nothing else. Otherwise container
> > stuff gets really bad, among a lot of other things.
> > 
> 
> Looping in the MHI maintainer for your proposal.
> 
> The accel userspace can work without MHI_UCI.
> 
> The revert will be non-trivial so I'll look at posting that tomorrow.

Yeah if the full revert is invasive then could we just do a minimal one
that drops the various register_chrdev/class_create/device_create calls?
That avoids the conflict plus makes sure no uabi is registers for the
MHI_UCI. Anything else we can sort out later.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
