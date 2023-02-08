Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95268F793
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACCB10E025;
	Wed,  8 Feb 2023 18:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D5210E025
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:58:54 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id u21so21823771edv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 10:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xcWq7Nqf0kjl0QrVlNjNnou7DKcbH3VuTnK1gZzDN0Y=;
 b=CvacsNvbSD4kD7OuYzjrUG2/SQjrToznEQnkS8FbF2aThu4pCCECNgws2gld8XLPce
 f/dqxoOazJopmFYJGrpQx4SzWZvr3gXwr9/VyITCBqBmf1HAv4S21oS9YMLRT9cy2Jwz
 WGSvDH/4rirmqlk+iZ7c1hVz6aH+ylFiQDRj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xcWq7Nqf0kjl0QrVlNjNnou7DKcbH3VuTnK1gZzDN0Y=;
 b=s3UczhtVxYsvBQeqBnwnY1Q128V0QdQ2Ji9avphdfMyUcNU2jOQw9o/9XKKyRe1UXr
 a7BiWiPHMg4NvcWUgo1/7bC8nxi73bKjydPSuOlrrF8KGJGSHrtBnRnM4gBlHa+0+sEk
 F7EOesHy1WoufHEhJmrOAYUfhGr5Rw6pBmvhQ9ApLrSjZCIQQ+vCuf0iB1x3jU/9rGhA
 yjbUVCTti8jaJHrpxjGFnyT5d+e0fhl2VNroJ6YiPt7InyCXCY+MYeZPDm3oyxSlbJQT
 c/a0EHPFYwqeMbik4CaBlK1OdwPI5B2vP13ueEr+EKH8HPNfCdZp8XaY9tyQI6lmr7/o
 zGEQ==
X-Gm-Message-State: AO0yUKU5p8cSmwaDriZPXK9PIa52eNtWXAQW30IGhTJTl5MOM8ARW3NW
 sTzI5VQfUynspiV3ol7+s5GDQg==
X-Google-Smtp-Source: AK7set8oUhihU6jiEvd662cuQz3ctdlSuid8UP4CJf7/iKocIIu88fIpFYtpp3bqchlrNWsRqmtQwA==
X-Received: by 2002:a05:6402:5205:b0:4aa:a248:a15c with SMTP id
 s5-20020a056402520500b004aaa248a15cmr10559157edd.1.1675882733221; 
 Wed, 08 Feb 2023 10:58:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h23-20020aa7c957000000b00487fc51c532sm8263022edt.33.2023.02.08.10.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:58:52 -0800 (PST)
Date: Wed, 8 Feb 2023 19:58:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 1/6] drm/debugfs: Introduce wrapper for debugfs list
Message-ID: <Y+Pw6UGfvIYkJ4jo@phenom.ffwll.local>
References: <20230131195825.677487-1-mcanal@igalia.com>
 <20230131195825.677487-2-mcanal@igalia.com>
 <Y+Pkm3ORQAipa/iD@phenom.ffwll.local>
 <dc69aab6-2030-4304-ff86-15a9f2871aa2@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc69aab6-2030-4304-ff86-15a9f2871aa2@igalia.com>
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 08, 2023 at 03:39:13PM -0300, Maíra Canal wrote:
> On 2/8/23 15:06, Daniel Vetter wrote:
> > On Tue, Jan 31, 2023 at 04:58:21PM -0300, Maíra Canal wrote:
> > > Introduce a struct wrapper for all the debugfs-related stuff: the list
> > > of debugfs files and the mutex that protects it. This will make it
> > > easier to initialize all the debugfs list in a DRM object and will
> > > create a good abstraction for a possible implementation of the debugfs
> > > infrastructure for KMS objects.
> > > 
> > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > > ---
> > >   drivers/gpu/drm/drm_debugfs.c  | 18 ++++++++++++++++++
> > >   drivers/gpu/drm/drm_internal.h | 12 ++++++++++++
> > >   include/drm/drm_debugfs.h      | 16 ++++++++++++++++
> > >   3 files changed, 46 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > > index 4f643a490dc3..8658d3929ea5 100644
> > > --- a/drivers/gpu/drm/drm_debugfs.c
> > > +++ b/drivers/gpu/drm/drm_debugfs.c
> > > @@ -218,6 +218,24 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
> > >   }
> > >   EXPORT_SYMBOL(drm_debugfs_create_files);
> > > +struct drm_debugfs_files *drm_debugfs_files_init(void)
> > > +{
> > > +	struct drm_debugfs_files *debugfs_files;
> > > +
> > > +	debugfs_files = kzalloc(sizeof(*debugfs_files), GFP_KERNEL);
> > > +
> > > +	INIT_LIST_HEAD(&debugfs_files->list);
> > > +	mutex_init(&debugfs_files->mutex);
> > > +
> > > +	return debugfs_files;
> > > +}
> > > +
> > > +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
> > > +{
> > > +	mutex_destroy(&debugfs_files->mutex);
> > > +	kfree(debugfs_files);
> > > +}
> > > +
> > >   int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> > >   		     struct dentry *root)
> > >   {
> > > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > > index ed2103ee272c..f1c8766ed828 100644
> > > --- a/drivers/gpu/drm/drm_internal.h
> > > +++ b/drivers/gpu/drm/drm_internal.h
> > > @@ -23,6 +23,7 @@
> > >   #include <linux/kthread.h>
> > > +#include <drm/drm_debugfs.h>
> > >   #include <drm/drm_ioctl.h>
> > >   #include <drm/drm_vblank.h>
> > > @@ -183,6 +184,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
> > >   /* drm_debugfs.c drm_debugfs_crc.c */
> > >   #if defined(CONFIG_DEBUG_FS)
> > > +struct drm_debugfs_files *drm_debugfs_files_init(void);
> > > +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files);
> > >   int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> > >   		     struct dentry *root);
> > >   void drm_debugfs_cleanup(struct drm_minor *minor);
> > > @@ -193,6 +196,15 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> > >   void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
> > >   void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
> > >   #else
> > > +static inline struct drm_debugfs_files *drm_debugfs_files_init(void)
> > > +{
> > > +	return NULL;
> > > +}
> > > +
> > > +static inline void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
> > > +{
> > > +}
> > > +
> > >   static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> > >   				   struct dentry *root)
> > >   {
> > > diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> > > index 7616f457ce70..423aa3de506a 100644
> > > --- a/include/drm/drm_debugfs.h
> > > +++ b/include/drm/drm_debugfs.h
> > > @@ -32,6 +32,8 @@
> > >   #ifndef _DRM_DEBUGFS_H_
> > >   #define _DRM_DEBUGFS_H_
> > > +#include <linux/list.h>
> > > +#include <linux/mutex.h>
> > >   #include <linux/types.h>
> > >   #include <linux/seq_file.h>
> > >   /**
> > > @@ -79,6 +81,20 @@ struct drm_info_node {
> > >   	struct dentry *dent;
> > >   };
> > > +/**
> > > + * struct drm_debugfs_files - Encapsulates the debugfs list and its mutex
> > > + *
> > > + * This structure represents the debugfs list of files and is encapsulated
> > > + * with a mutex to protect the access of the list.
> > > + */
> > > +struct drm_debugfs_files {
> > > +	/** @list: List of debugfs files to be created by the DRM object. */
> > > +	struct list_head list;
> > > +
> > > +	/** @mutex: Protects &list access. */
> > > +	struct mutex mutex;
> > 
> > I'm not seeing any use for the mutex here? Also unless you also plan to
> > put like the debugfs directory pointers in this struct, I'm not sure we
> > need this abstraction since it's purely internal to debugfs code (so also
> > should really be in the headers where drivers could perhaps come up with
> > funny ideas).
> 
> Isn't this mutex needed to guarantee race-conditions safety when adding new
> files to the list, as drm_debugfs_add_file() is called by the drivers? [1]
> 
> [1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_debugfs.c#n343

Hm I looked at the wrong place and only spotted the locking for the old
drm_minor debugfs stuff ... it does look a bit funny if we only do this in
add_file(), also usually drivers really don't have anything multi-threaded
in there. If you e.g. look at __drm_universal_plane_init() then the

	list_add_tail(&plane->head, &config->plane_list);

also doesn't have any locks. The assumption that driver load code isn't
multi-threaded is pretty deeply in-grained (note that it's different for
drm_connector because those can be hotplugged at any later point and even
concurrently with driver load finishing). So I don't think we need this in
the debugfs side. But since it's there already definitely a separate patch
to remove that locking.
-Daniel

> 
> Best Regards,
> - Maíra Canal
> 
> > -Daniel
> > 
> > > +};
> > > +
> > >   /**
> > >    * struct drm_debugfs_info - debugfs info list entry
> > >    *
> > > -- 
> > > 2.39.1
> > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
