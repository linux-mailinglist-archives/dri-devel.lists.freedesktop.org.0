Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4DB666652
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CAA10E820;
	Wed, 11 Jan 2023 22:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2062410E820
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:40:48 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qk9so40558081ejc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I6F8lGqMyWQPxHybRXHy/JOYHSNqp8lMgB32SloPQJ0=;
 b=ER+oAfDCq1qBzlUIl/NJrT20HKbTLkrLlj+owS9YulHqJ9D/Hboegp6u8ahlgpykGb
 xH4+ddvc0WR8vvkJbWsWDSDVqjSXKY95R3YLU5AtKC5SpyIThA6rfMP3nKf8vcAQ8Yp8
 nfsY444LvIEylRMyRVAbn+tnVyglGSdsLKeno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I6F8lGqMyWQPxHybRXHy/JOYHSNqp8lMgB32SloPQJ0=;
 b=swJT2G90Lhx8uWi3pYW7oPTMLhSHbYezfRCli4rXtewD22VXpTHE9MCh5KGfb5eoAm
 8nLBJFtvaQMab43XBez5wiPXqGTHZPyNtyLgE7NtTV6XAVOEjEFQM1HCgKeL397oZQAH
 G5kpWuWlyuBv+aUxLz+0IAIxgzHFWp1sMgYpTo2TXygeBwqoVBBX2uWAHHlQ59+uJcVH
 nTr18pre1YOaiIuzLgAFyedlItkMUaBbRmydfMYvYR4PZYRrNa8fVpEyZzkcJHOrTa2P
 NcSuramLS0f1C89zB+oQSfjHOJOt09QGjFsdtpWzJGw701LCaEvBj9P75HJ4KvK1aY0u
 0Q2w==
X-Gm-Message-State: AFqh2koNpAYY1IKBTUoQoqITrUR+NNkBg8u1/ZSNI2x57evIoiUB7JyR
 3I4BnuhguCvMYbZnxLXYTH9HUg==
X-Google-Smtp-Source: AMrXdXv/CiLkKgvceOfzI/Ye6UVdDBrEIwRgyJJs8pPtFNKjKh9THairwpjxkiAiC/VATHFq7siiBQ==
X-Received: by 2002:a17:906:7f99:b0:84d:2f2a:b158 with SMTP id
 f25-20020a1709067f9900b0084d2f2ab158mr15893098ejr.11.1673476846592; 
 Wed, 11 Jan 2023 14:40:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 qu25-20020a170907111900b0084c7574630csm6786372ejb.97.2023.01.11.14.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:40:45 -0800 (PST)
Date: Wed, 11 Jan 2023 23:40:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/2] drm/debugfs: add descriptions to struct parameters
Message-ID: <Y7866924YruF9OrY@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230105193039.287677-1-mcanal@igalia.com>
 <20230105193039.287677-2-mcanal@igalia.com>
 <Y7iCOD1mylBX/VuB@phenom.ffwll.local>
 <c7cbcb01-d0ce-47bd-1d9d-e687ef9e5315@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7cbcb01-d0ce-47bd-1d9d-e687ef9e5315@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 08:28:20AM -0300, Maíra Canal wrote:
> On 1/6/23 17:19, Daniel Vetter wrote:
> > On Thu, Jan 05, 2023 at 04:30:39PM -0300, Maíra Canal wrote:
> > > The structs drm_debugfs_info and drm_debugfs_entry don't have
> > > descriptions for their parameters, which is causing the following warnings:
> > > 
> > > include/drm/drm_debugfs.h:93: warning: Function parameter or member
> > > 'name' not described in 'drm_debugfs_info'
> > > include/drm/drm_debugfs.h:93: warning: Function parameter or member
> > > 'show' not described in 'drm_debugfs_info'
> > > include/drm/drm_debugfs.h:93: warning: Function parameter or member
> > > 'driver_features' not described in 'drm_debugfs_info'
> > > include/drm/drm_debugfs.h:93: warning: Function parameter or member
> > > 'data' not described in 'drm_debugfs_info'
> > > include/drm/drm_debugfs.h:105: warning: Function parameter or member
> > > 'dev' not described in 'drm_debugfs_entry'
> > > include/drm/drm_debugfs.h:105: warning: Function parameter or member
> > > 'file' not described in 'drm_debugfs_entry'
> > > include/drm/drm_debugfs.h:105: warning: Function parameter or member
> > > 'list' not described in 'drm_debugfs_entry'
> > > 
> > > Therefore, fix the warnings by adding descriptions to all struct
> > > parameters.
> > > 
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > > ---
> > >   include/drm/drm_debugfs.h | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> > > index 53b7297260a5..7616f457ce70 100644
> > > --- a/include/drm/drm_debugfs.h
> > > +++ b/include/drm/drm_debugfs.h
> > > @@ -86,9 +86,22 @@ struct drm_info_node {
> > >    * core.
> > >    */
> > >   struct drm_debugfs_info {
> > > +	/** @name: File name */
> > >   	const char *name;
> > > +
> > > +	/**
> > > +	 * @show:
> > > +	 *
> > > +	 * Show callback. &seq_file->private will be set to the &struct
> > > +	 * drm_debugfs_entry corresponding to the instance of this info
> > > +	 * on a given &struct drm_device.
> > 
> > So this is a bit late, but why don't we pass that drm_debugfs_entry as an
> > explicit parameter? Or maybe just the struct drm_device, because that and
> > the void *data is really all there is to pass along. Would give us more
> > type-safety, which really is the main reason for having drm-specific
> > debugfs functions.
> 
> It seems like a better idea to pass the drm_debugfs_entry as an explicit
> parameter. I can work on it, but I guess it is a better idea to finish
> the conversion of all drm_debugfs_create_files() to drm_debugfs_add_files()
> and then perform the change in the show() signature.

So drm_debugfs_entry still feels like a bit too high level, do callers
really need that? They get the void * and I guess need the struct
drm_device *

This really starts to matter more when we also roll this out for
connector/crtc, then you can give them directly a pointer to that. And the
drm_debugfs_entry thing becomes an implementation detail entirely.

Or do I miss something?

Also yes we can do that later on, it shouldn't be too annyoing to roll
out.
-Daniel
> 
> Best Regards,
> - Maíra Canal
> 
> > 
> > Either way, on the series: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > > +	 */
> > >   	int (*show)(struct seq_file*, void*);
> > > +
> > > +	/** @driver_features: Required driver features for this entry. */
> > >   	u32 driver_features;
> > > +
> > > +	/** @data: Driver-private data, should not be device-specific. */
> > >   	void *data;
> > >   };
> > > @@ -99,8 +112,13 @@ struct drm_debugfs_info {
> > >    * drm_debugfs_info on a &struct drm_device.
> > >    */
> > >   struct drm_debugfs_entry {
> > > +	/** @dev: &struct drm_device for this node. */
> > >   	struct drm_device *dev;
> > > +
> > > +	/** @file: Template for this node. */
> > >   	struct drm_debugfs_info file;
> > > +
> > > +	/** @list: Linked list of all device nodes. */
> > >   	struct list_head list;
> > >   };
> > > -- 
> > > 2.39.0
> > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
