Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C03DB646
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 11:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E856F408;
	Fri, 30 Jul 2021 09:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43B36F408
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 09:48:44 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id y4so8839901ilp.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/dHQgNBIhi4HkTxU3CwTUDPWzDD5PbqhD37IQU0N6H0=;
 b=PCyiKhrtP+4bA2hNBY9xB73NTn4teEkICoCNu5nT/QCwpVOrtM7l1yIlmGKdsrKJt4
 ljr0DJcOINJT+ha+bh4TManrgpsElkrCFaDTxE/JPu3lTQ/ki/aUOz+ZpwSd22qRkyVD
 QoyNfxh4BzyR7whcuWIW20o/iRgMSViXwu0zQO72RmeHqnGU0oD+pvhcxujHjRlo9BW/
 Y4xA5d7YRLcjOftxMgsgQyq1BvYF5rgorcHDH0dIWq/ZApTnaJji6wcAqLKMqZ5tOEsD
 Syb+C+7VXW5GOtz556zV3XXYRXwN+WFn8H82S8PsKLfrAvK/BDxs1chmuNVEcFJ9ZxLY
 NcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/dHQgNBIhi4HkTxU3CwTUDPWzDD5PbqhD37IQU0N6H0=;
 b=gW9MVRg9U0wnYSTdP/VwOYLNiUudjoB8guSalqkb5wwR9ooL81+Ex/vB1uEDk3Pxzn
 PlAWvWMPUE6rXniupSI093mTtMuaKrS6WMepUM4uf4KTeq85WAIHdwBAoeZ4uUEamEfk
 hYcMWkOh9SiVf6f9fENsanVj6SArzEp6hNQa7MtFkq6R1/lGjQwuKEZqKZrE6WoKdBJy
 9AZhdLeshn7MsurQbWv9DcKywbqh6aMwL22ppntbIZVgBx4E85ynbua9HnrYDMXbbZZF
 AyHnhclHQMLG0n2AwnWRMYuDLR3XJs2tiPjoDpTt4yQDdqPlG8xdWUUzb0Vt+YvXuRUh
 S3RQ==
X-Gm-Message-State: AOAM531NgeFT/WeoB28X2Ftu+gw/e/Iw3L+n2Xy1T86Qziw8MtgwWfSm
 sP+LSgIdK+k2Ln9fQYbwxPRd0kzxm1DzSA==
X-Google-Smtp-Source: ABdhPJxgmmMdDZOoGx56IPSJxwzZXhR4Xvhtmib4YqV6Npt1VDzjIiJYxCogffB9awxvQrNQyPGjOQ==
X-Received: by 2002:a92:6d07:: with SMTP id i7mr1304876ilc.104.1627638523996; 
 Fri, 30 Jul 2021 02:48:43 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id h24sm798321ioj.32.2021.07.30.02.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 02:48:43 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailauth.nyi.internal (Postfix) with ESMTP id 97DF027C005B;
 Fri, 30 Jul 2021 05:48:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 30 Jul 2021 05:48:42 -0400
X-ME-Sender: <xms:98oDYfw4AIGZbkS-15cy227JnO3H-m6lbq6sXeZza_9OXFO16dM7Uw>
 <xme:98oDYXTHkHiKDEEwMOxRPwCBZHz2q64175IadKG0h4ZWmgDDo8dS2Br6r9Gbd0zSM
 Hsw70UoclqQaWCm_w>
X-ME-Received: <xmr:98oDYZV8J9c4xAT4ACTVFtzlN9WawQW2kiHbgf_4bt14T7MnMZL8ZBnv7lQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhm
 rghilhdrtghomheqnecuggftrfgrthhtvghrnhepvdelieegudfggeevjefhjeevueevie
 etjeeikedvgfejfeduheefhffggedvgeejnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsoh
 hnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhg
 peepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:98oDYZhV_Wnjolu2Qy95wo79oqSS5lE3XQTM8Ol2m8bMVaqOts9Z8A>
 <xmx:98oDYRDGJ7Cum_44BwPjI6WevrZxs0rqIRNbEkt3BJJZT0leahDYuA>
 <xmx:98oDYSJRiLRSNPa1TkG5WLMkG_GQfkbsW3Sdq89uTtppJ3QC-JqxVg>
 <xmx:-coDYZZHDQ2qHuklUAYcrdl0qGUPXzbafW6xSCHzefYmpGT8u95JXTlgOCQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 05:48:39 -0400 (EDT)
Date: Fri, 30 Jul 2021 17:48:14 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 2/2] drm: add lockdep assert to
 drm_is_current_master_locked
Message-ID: <YQPK3jMU69WMsCjT@boqun-archlinux>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
 <20210730041515.1430237-3-desmondcheongzx@gmail.com>
 <YQOXTW8kSHdNjhiY@boqun-archlinux>
 <35518f4b-5e4a-b284-1f86-5cba64941211@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35518f4b-5e4a-b284-1f86-5cba64941211@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org, longman@redhat.com,
 will@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 30, 2021 at 04:06:44PM +0800, Desmond Cheong Zhi Xi wrote:
> On 30/7/21 2:08 pm, Boqun Feng wrote:
> > On Fri, Jul 30, 2021 at 12:15:15PM +0800, Desmond Cheong Zhi Xi wrote:
> > > In drm_is_current_master_locked, accessing drm_file.master should be
> > > protected by either drm_file.master_lookup_lock or
> > > drm_device.master_mutex. This was previously awkward to assert with
> > > lockdep.
> > > 
> > > Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
> > > helpers"), this assertion is now convenient so we add it in.
> > > 
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > > ---
> > >   drivers/gpu/drm/drm_auth.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index 9c24b8cc8e36..6f4d7ff23c80 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -63,9 +63,9 @@
> > >   static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > >   {
> > > -	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > > -	 * should be held here.
> > > -	 */
> > > +	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
> > > +			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
> > > +
> > 
> > I think it's better to also add the lockdep_assert() of & (i.e. both
> > held) in the updater side, and have comments pointing to each other.
> > 
> > Is it convenient to do in this patchset? If the updater side doesn't
> > need to put the lockdep_assert() (maybe the lock acquire code and the
> > update code are in the same function), it's still better to add some
> 
> Thanks for the feedback, Boqun.
> 
> Yeah, I think the updater side maybe doesn't need new lockdep_assert()
> because what currently happens is either
> 
> 	lockdep_assert_held_once(&dev->master_mutex);
> 	/* 6 lines of prep */
> 	spin_lock(&fpriv->master_lookup_lock);
> 	fpriv->master = new_value;
> or
> 	mutex_lock(&dev->master_mutex);
> 	/* 3 lines of checks */
> 		spin_lock(&file_priv->master_lookup_lock);
> 		file_priv->master = new_value;
> 
> > comments like:
> > 
> > 	/*
> > 	 * To update drm_file.master, both drm_file.master_lookup_lock
> > 	 * and drm_device.master_mutex are needed, therefore holding
> > 	 * either of them is safe and enough for the read side.
> > 	 */
> > 
> > Just feel it's better to explain the lock design either in the
> > lockdep_assert() or comments.
> > 
> 
> But clarifying the lock design in the documentation sounds like a really
> good idea.
> 
> Probably a good place for this would be in the kerneldoc where we also
> explain the lifetime rules and usage of the pointer outside drm_auth.c:
> 
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 726cfe0ff5f5..a3acb7ac3550 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -233,6 +233,10 @@ struct drm_file {
>  	 * this only matches &drm_device.master if the master is the currently
>  	 * active one.
>  	 *
> +	 * To update @master, both &drm_device.master_mutex and
> +	 * @master_lookup_lock need to be held, therefore holding either of
> +	 * them is safe and enough for the read side.
> +	 *
>  	 * When dereferencing this pointer, either hold struct
>  	 * &drm_device.master_mutex for the duration of the pointer's use, or
>  	 * use drm_file_get_master() if struct &drm_device.master_mutex is not

Works for me ;-)

For the whole series, feel free to add:

Acked-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> 
> Best wishes,
> Desmond
> 
> > Regards,
> > Boqun
> > 
> > >   	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> 
