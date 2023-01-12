Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DAA666DBD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADDE10E8A5;
	Thu, 12 Jan 2023 09:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9310E8A5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:12:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ss4so35882244ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EXyGJOjmj7qdAMlAzw/rEBpcAD9h7noX6p84V1bA/Bg=;
 b=VZSRod5RUaWGlgoiLtO4rp7Vv8rPfOlwiIYJA9xf06PM8E7bK15BN2a4ILvK7u56Qb
 +M80ioMOtBjz/m4CC+nO48Jkj/uct55O7SozEmSUI0eXc4z7bdDJcjSVftz5hOFqBHCh
 TNZg4saLmZi8OtMJDD/XN6Mkw74LiVHmhqXGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EXyGJOjmj7qdAMlAzw/rEBpcAD9h7noX6p84V1bA/Bg=;
 b=CcZsW+LmpA9PnfrtLpIJ3Xod+mEXTA6HOb8rHmSnkikM89LW4Wj1oXKzIOqD0+kHgz
 ax47St3z4XJFIKpVRnF5I8GefYy+cNegD9ESoVKBpIl/rcw38D1Tx1ycojIcAWeIujVe
 vgXYTGqvg+cl6DFIK3MG5nZcDtGsrulK2F6CEdLpbwfvxxrlhdAMpw4tMR+xvd6Pp22t
 rFO8uoSkJiSHAaGUskRYpZh39rMRMnMrrPgredQ8bn/qxyZ4LRUjoizy9dvAn8ADkGzX
 cHxd3sFbgy293lWwTmuwKt1BNtGAgOMzINC/oCDXlO49OuFkikzxAtwuHl5WnlLZAPLt
 PFUQ==
X-Gm-Message-State: AFqh2kowLyT7oBfpThmjn4Bw1NBirfF0WYAaQVdAgQjHgUO9UwMyg29n
 Ey767GnP/nRPL4AFbUFuytWPkg==
X-Google-Smtp-Source: AMrXdXt5ItUPsOyPazRTu2n+0KnfB9pEDv7nf2fLQATiZXV0vYxOv0kxrOiKgXjY5aQI23aSgSsBVw==
X-Received: by 2002:a17:907:d50a:b0:864:1902:704c with SMTP id
 wb10-20020a170907d50a00b008641902704cmr2744341ejc.38.1673514722082; 
 Thu, 12 Jan 2023 01:12:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm4051804ejc.67.2023.01.12.01.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:12:01 -0800 (PST)
Date: Thu, 12 Jan 2023 10:11:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 01/13] drm/debugfs: Create helper to add debugfs files to
 device's list
Message-ID: <Y7/O3wqumKf8269i@phenom.ffwll.local>
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-2-mcanal@igalia.com>
 <87k01sgmqn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k01sgmqn.fsf@intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 10:50:40AM +0200, Jani Nikula wrote:
> On Wed, 11 Jan 2023, Maíra Canal <mcanal@igalia.com> wrote:
> > Create a helper to encapsulate the code that adds a new debugfs file to
> > a linked list related to a object. Moreover, the helper also provides
> > more flexibily on the type of the object, allowing to use the helper for
> > other types of drm_debugfs_entry.
> >
> > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > ---
> >  drivers/gpu/drm/drm_debugfs.c | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > index 4f643a490dc3..255d2068ac16 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -316,6 +316,17 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
> >  	minor->debugfs_root = NULL;
> >  }
> >  
> > +#define drm_debugfs_add_file_to_list(component) do {			\
> > +		entry->file.name = name;				\
> > +		entry->file.show = show;				\
> > +		entry->file.data = data;				\
> > +		entry->component = (component);				\
> > +									\
> > +		mutex_lock(&(component)->debugfs_mutex);		\
> > +		list_add(&entry->list, &(component)->debugfs_list);	\
> > +		mutex_unlock(&(component)->debugfs_mutex);		\
> > +	} while (0)
> 
> In general, please don't add macros that implicitly depend on certain
> local variable names. In this case, "entry".
> 
> But I'm also not convinced about the usefulness of adding this kind of
> "generics". Sure, it'll save you a few lines here and there, but I think
> overall it's just confusing more than it's useful.

So the non-generics way I guess would be to
- pass the right pointer to the functions as an explicit parameter (struct
  drm_device|crtc|connector *, )
- make drm_debugfs_entry and implementation detail
- switch the pointer in there to void *, have glue show functions for each
  case which do nothing else than cast from void * to the right type
  (both for the parameter and the function pointer)
- have a single function which takes that void *entry list and a pointer
  to the debugfs director to add them all for code sharing

I think this should work for ->show, but for ->fops it becomes a rather
big mess I fear. Maybe for ->fops (and also for ->show for now) we leave
the explicit parameter out and just rely on seq_file->private or whatever
it was.

Or just copypaste, it's not that much code really :-)
-Daniel

> 
> 
> BR,
> Jani.
> 
> > +
> >  /**
> >   * drm_debugfs_add_file - Add a given file to the DRM device debugfs file list
> >   * @dev: drm device for the ioctl
> > @@ -334,14 +345,7 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> >  	if (!entry)
> >  		return;
> >  
> > -	entry->file.name = name;
> > -	entry->file.show = show;
> > -	entry->file.data = data;
> > -	entry->dev = dev;
> > -
> > -	mutex_lock(&dev->debugfs_mutex);
> > -	list_add(&entry->list, &dev->debugfs_list);
> > -	mutex_unlock(&dev->debugfs_mutex);
> > +	drm_debugfs_add_file_to_list(dev);
> >  }
> >  EXPORT_SYMBOL(drm_debugfs_add_file);
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
