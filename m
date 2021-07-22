Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE13D272B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 18:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542F36E9D7;
	Thu, 22 Jul 2021 16:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7A96E872;
 Thu, 22 Jul 2021 15:04:58 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id j5so5663818ilk.3;
 Thu, 22 Jul 2021 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pdY6rhVpt2cvtRD9X+6uRamQHWbNgW9tGd+/rf6LByw=;
 b=LfsodAg1o0ijTbK+UfgG4wZc2ri4Sy1nUrT/7gxYKMSxuvQ+PZJee8lZ8iU8iY7YFF
 hYuYP7CWfASDCME7zXCXWrJMHrwbwEOoVAC6enIZFmZGsym+ZslNIazL0Yu3CiGMFDQm
 JLmWMtUrUa4HuratO6FsGooWyNX1Mna9Y0z7CHCNCJTkrW7QD+1CEu5sJMGbVjPKGoks
 JWXLdZ4HwnDvYbBD+1ckhsYvFxWiEFEs3T+198xWlTn0EU+Vrm4lspa2q6TFX+UWSY5+
 0+GQHEm1qB+1uQyzFvO+k3OEIay5gz6KO2ZU7U1MSd44k0v3GKixXoOry47KjWPS3mTC
 i4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pdY6rhVpt2cvtRD9X+6uRamQHWbNgW9tGd+/rf6LByw=;
 b=MCSf+FvIBWwRwgpJ7KInwXTLqCstx+Zrt3vJNDPzwRED9eW+Rw4gOTmAfzL57fjjHK
 XxjHAiiEMWVBvCNTqHKSJjIu+oBkPQv1aBlf3x1/kUKtWn04357zr2392r9nHHQN81Hv
 jgsl/+NvHrnuiJ+ePYn5GyurTLjQGqcn+m/Ck6kgA1Ps75albNl6+rectzVjt6qjRNxf
 sWSh1bTeSTVV4SksWgE3cmP/pM7HDXlxHIXVms+H2Tm3ATvYnG8k4ucr1ZDQOnEdUBV6
 8J8pLlQAmbGm0mb4ZNCkqsygNlJ/vL3Zq32U8WMzpFJ6bgxPEsVlFolkl6dfjbHiUY6B
 Gr/Q==
X-Gm-Message-State: AOAM532xQB9I2XhGFCnoLXc1X55YrXNKoi9JyxTeldCLlx4smcPLsfcM
 0uyB7+S+xbT0w8WgBj/Kbzg=
X-Google-Smtp-Source: ABdhPJx/iCOEfKNx6SSZefLw/rcSZSwYcTvNl8FtSu3/Q1+/ix8XCODVcVTLTL+UhF83S6mF8+E0Ow==
X-Received: by 2002:a92:c8c3:: with SMTP id c3mr193016ilq.153.1626966297417;
 Thu, 22 Jul 2021 08:04:57 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id d9sm7011761ilv.62.2021.07.22.08.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:04:56 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id DE65C27C0054;
 Thu, 22 Jul 2021 11:04:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Jul 2021 11:04:54 -0400
X-ME-Sender: <xms:FYn5YAWD-wPR-RVw-WwgbE4Lz_ycSmb-gkti1iUf_GKPSuyM0GECsg>
 <xme:FYn5YEljXxBbC0VSh0ebQokzBVcIcnrl0abPWqqHKUFaXSoDB_y7md7LMg0moircI
 GhFOubvfNfPTQZQIg>
X-ME-Received: <xmr:FYn5YEY0fXjO9nL8oqKGhmiVbxt2vJDbd4VVLFFaXI-DVT7NzWLz3N0GbW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpeegudegfedtjedtffdvleelteefuddvkefgheejuedujeehfeelkeetjeegtdef
 gfenucffohhmrghinhepfhhffihllhdrtghhnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
 ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
 hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:FYn5YPWRsfO9ylx6MZT3WvV8V59fPf49rtUcHHSIj61yPQL1vpqR9g>
 <xmx:FYn5YKkH3YsWLAzswxzjeD3_KE1Ukrxn1L_fk7uLNJDu7P8Ge3LPSQ>
 <xmx:FYn5YEe1sEA8kHDMSNFZHjhtJ2AG0Ygx4w6cqst97KBNYafBlF2JCw>
 <xmx:Fon5YAl3nQwOwvJ0QPtpedI0pnNG0cRa7eC3mLZlyOQFW5BfYWOtepdQhhk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 11:04:52 -0400 (EDT)
Date: Thu, 22 Jul 2021 23:04:49 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YPmJEYrnB0j17cZV@boqun-archlinux>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPlKkvelm/mcnCj0@phenom.ffwll.local>
X-Mailman-Approved-At: Thu, 22 Jul 2021 16:00:25 +0000
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

On Thu, Jul 22, 2021 at 12:38:10PM +0200, Daniel Vetter wrote:
> On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> > Inside drm_is_current_master, using the outer drm_device.master_mutex
> > to protect reads of drm_file.master makes the function prone to creating
> > lock hierarchy inversions. Instead, we can use the
> > drm_file.master_lookup_lock that sits at the bottom of the lock
> > hierarchy.
> > 
> > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_auth.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > index f00354bec3fb..9c24b8cc8e36 100644
> > --- a/drivers/gpu/drm/drm_auth.c
> > +++ b/drivers/gpu/drm/drm_auth.c
> > @@ -63,8 +63,9 @@
> >  
> >  static bool drm_is_current_master_locked(struct drm_file *fpriv)
> >  {
> > -	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> > -
> > +	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > +	 * should be held here.
> > +	 */
> 
> Disappointing that lockdep can't check or conditions for us, a
> lockdep_assert_held_either would be really neat in some cases.
> 

The implementation is not hard but I don't understand the usage, for
example, if we have a global variable x, and two locks L1 and L2, and
the function

	void do_something_to_x(void)
	{
		lockdep_assert_held_either(L1, L2);
		x++;
	}

and two call sites:

	void f(void)
	{
		lock(L1);
		do_something_to_x();
		unlock(L1);
	}

	void g(void)
	{
		lock(L2);
		do_something_to_x();
		unlock(L2);
	}

, wouldn't it be racy if f() and g() called by two threads at the same
time? Usually I would expect there exists a third synchronazition
mechanism (say M), which synchronizes the calls to f() and g(), and we
put M in the lockdep_assert_held() check inside do_something_to_x()
like:

	void do_something_to_x(void)
	{
		lockdep_assert_held_once(M);
		x++;
	}

But of course, M may not be a lock, so we cannot put the assert there.

My cscope failed to find ->master_lookup_lock in -rc2 and seems it's not
introduced in the patchset either, could you point me the branch this
patchset is based on, so that I could understand this better, and maybe
come up with a solution? Thanks ;-)

Regards,
Boqun

> Adding lockdep folks, maybe they have ideas.
> 
> On the patch:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> >  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> >  }
> >  
> > @@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
> >  {
> >  	bool ret;
> >  
> > -	mutex_lock(&fpriv->minor->dev->master_mutex);
> > +	spin_lock(&fpriv->master_lookup_lock);
> >  	ret = drm_is_current_master_locked(fpriv);
> > -	mutex_unlock(&fpriv->minor->dev->master_mutex);
> > +	spin_unlock(&fpriv->master_lookup_lock);
> >  
> >  	return ret;
> >  }
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
