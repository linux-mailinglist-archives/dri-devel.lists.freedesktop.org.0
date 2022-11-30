Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AD863D7F2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3924710E46A;
	Wed, 30 Nov 2022 14:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D167910E46A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:18:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so1518276wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eefXDHmz+6kEeGKXpUSHSYyK+auyGhHW5mDbXIM4nhQ=;
 b=hKDofZJC9C9WVdNn6Rik98r4Pzlgfj8CDgJ+QmRQAsmaiJmkx3i3aZwQcCzTS1hMdK
 OQMU6cp81NEFrtZxadEtQ6SQnICl0eVD0mrLa9mPbZSBzniXebwE6HSXbFDO9yAABFN0
 XZnpngnWjdADKttTsuGKsnMc4UIvUgNNKctIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eefXDHmz+6kEeGKXpUSHSYyK+auyGhHW5mDbXIM4nhQ=;
 b=35Gh3lV0Z7UNiRT3rfQCJ7MxZZSMnartAl9b4m99VYFbzgFH2E0iw90ndYK+T1vvop
 xy5mKO29sIKs6hW0f8CW08yWNauCccOmFx5nhT7erD+OCcJSSfTfDCWeRCwNJs+tQDR+
 LCZEkPMqU0MeG58gkj1AftmDJkt00vFejHgVlOdfHy//iPbcjMpRXpVRAgaIBKnttdYK
 uKTqzPe1CSOeAf/udCVZIlnR9Fg34JfjFTXCEjvcMRT58sCnA8wuyp2eEyrrCDok5YhP
 Vu4MVkCgBE6CtRAI2VWcBExX0xbTMQzcYrVPVDxBBTN497IZYqvQK57xGoBZcUOoLJFW
 IJwg==
X-Gm-Message-State: ANoB5pl0HlkgB9M0ULAmWzSYIFhOWqBdXl+MklWhxC8PGDVWIWmZAqye
 17q72p8BPhP6xFabSfETGDxgsA==
X-Google-Smtp-Source: AA0mqf6BgOTejiSndmn3fye6sZhKxf8ugVs5tQRA6aK1i9zrTPHf28bIAvNBfCfqP7jyrquk1pM6MQ==
X-Received: by 2002:a05:600c:3acd:b0:3cf:550e:d7a2 with SMTP id
 d13-20020a05600c3acd00b003cf550ed7a2mr37036850wms.97.1669817901213; 
 Wed, 30 Nov 2022 06:18:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 hg6-20020a05600c538600b003a6125562e1sm2040014wmb.46.2022.11.30.06.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 06:18:20 -0800 (PST)
Date: Wed, 30 Nov 2022 15:18:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 3/3] drm: Update file owner during use
Message-ID: <Y4dmKgn8X4yPUnqk@phenom.ffwll.local>
References: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
 <20221130133407.2689864-4-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130133407.2689864-4-tvrtko.ursulin@linux.intel.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 01:34:07PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> With the typical model where the display server opends the file descriptor
> and then hands it over to the client we were showing stale data in
> debugfs.
> 
> Fix it by updating the drm_file->pid on ioctl access from a different
> process.
> 
> The field is also made RCU protected to allow for lockless readers. Update
> side is protected with dev->filelist_mutex.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  6 +++--
>  drivers/gpu/drm/drm_auth.c              |  3 ++-
>  drivers/gpu/drm/drm_debugfs.c           | 10 ++++----
>  drivers/gpu/drm/drm_file.c              | 32 ++++++++++++++++++++++++-
>  drivers/gpu/drm/drm_ioctl.c             |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 +++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  6 +++--
>  include/drm/drm_file.h                  | 13 ++++++++--
>  8 files changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 30e24da1f398..385deb044058 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -959,6 +959,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>  	list_for_each_entry(file, &dev->filelist, lhead) {
>  		struct task_struct *task;
>  		struct drm_gem_object *gobj;
> +		struct pid *pid;
>  		int id;
>  
>  		/*
> @@ -968,8 +969,9 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>  		 * Therefore, we need to protect this ->comm access using RCU.
>  		 */
>  		rcu_read_lock();
> -		task = pid_task(file->pid, PIDTYPE_TGID);
> -		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
> +		pid = rcu_dereference(file->pid);
> +		task = pid_task(pid, PIDTYPE_TGID);
> +		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>  			   task ? task->comm : "<unknown>");
>  		rcu_read_unlock();
>  
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index cf92a9ae8034..2ed2585ded37 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -235,7 +235,8 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>  static int
>  drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
>  {
> -	if (file_priv->pid == task_pid(current) && file_priv->was_master)
> +	if (file_priv->was_master &&
> +	    rcu_access_pointer(file_priv->pid) == task_pid(current))

This scares me, and also makes me wonder whether we really want to
conflate the original owner with the rendering owner. And also, whether we
really want to keep updating that, because for some of the "bind an fd to
a pid" use-cases like svm we really do not want to ever again allow a
change.

So sligthly different idea:
- we have a separate render pid/drm_file owner frome the open() owner that
  we track in drm_auth.c
- that one is set the first time a driver specific ioctl is called (which
  for the "pass me the fd" dri3 mode should never be the compositor)
- we start out with nothing and only set it once, which further simplifies
  the model (still need the mutex for concurrent first ioctl ofc)

Eventually we could then use that to enforce static binding to a pid,
which is what we want for svm style models, i.e. if the pid changes, the
fd does an -EACCESS or similar.

Thoughts?
-Daniel


>  		return 0;
>  
>  	if (!capable(CAP_SYS_ADMIN))
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 42f657772025..9d4e3146a2b8 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file *m, void *data)
>  	 */
>  	mutex_lock(&dev->filelist_mutex);
>  	list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
> -		struct task_struct *task;
>  		bool is_current_master = drm_is_current_master(priv);
> +		struct task_struct *task;
> +		struct pid *pid;
>  
> -		rcu_read_lock(); /* locks pid_task()->comm */
> -		task = pid_task(priv->pid, PIDTYPE_TGID);
> +		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
> +		pid = rcu_dereference(priv->pid);
> +		task = pid_task(pid, PIDTYPE_TGID);
>  		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>  		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>  			   task ? task->comm : "<unknown>",
> -			   pid_vnr(priv->pid),
> +			   pid_vnr(pid),
>  			   priv->minor->index,
>  			   is_current_master ? 'y' : 'n',
>  			   priv->authenticated ? 'y' : 'n',
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 20a9aef2b398..3433f9610dba 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  	if (!file)
>  		return ERR_PTR(-ENOMEM);
>  
> -	file->pid = get_pid(task_tgid(current));
> +	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>  	file->minor = minor;
>  
>  	/* for compatibility root is always authenticated */
> @@ -502,6 +502,36 @@ int drm_release(struct inode *inode, struct file *filp)
>  }
>  EXPORT_SYMBOL(drm_release);
>  
> +void drm_file_update_pid(struct drm_file *filp)
> +{
> +	struct drm_device *dev;
> +	struct pid *pid, *old;
> +
> +	/* Master nodes are not expected to be passed between processes. */
> +	if (filp->was_master)
> +		return;
> +
> +	pid = task_tgid(current);
> +
> +	/*
> +	 * Quick unlocked check since the model is a single handover followed by
> +	 * exclusive repeated use.
> +	 */
> +	if (pid == rcu_access_pointer(filp->pid))
> +		return;
> +
> +	dev = filp->minor->dev;
> +	mutex_lock(&dev->filelist_mutex);
> +	old = rcu_replace_pointer(filp->pid, pid, 1);
> +	mutex_unlock(&dev->filelist_mutex);
> +
> +	if (pid != old) {
> +		get_pid(pid);
> +		synchronize_rcu();
> +		put_pid(old);
> +	}
> +}
> +
>  /**
>   * drm_release_noglobal - release method for DRM file
>   * @inode: device inode
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 7c9d66ee917d..305b18d9d7b6 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  	struct drm_device *dev = file_priv->minor->dev;
>  	int retcode;
>  
> +	/* Update drm_file owner if fd was passed along. */
> +	drm_file_update_pid(file_priv);
> +
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 80f154b6adab..a763d3ee61fb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1097,7 +1097,10 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
>  	}
>  
>  	get_task_comm(tmpname, current);
> -	snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid));
> +	rcu_read_lock();
> +	snprintf(name, sizeof(name), "%s[%d]",
> +		 tmpname, pid_nr(rcu_dereference(fpriv->pid)));
> +	rcu_read_unlock();
>  
>  	if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
>  		ret = -ENOMEM;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index f2985337aa53..3853d9bb9ab8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -251,6 +251,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
>  	list_for_each_entry(file, &dev->filelist, lhead) {
>  		struct task_struct *task;
>  		struct drm_gem_object *gobj;
> +		struct pid *pid;
>  		int id;
>  
>  		/*
> @@ -260,8 +261,9 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
>  		 * Therefore, we need to protect this ->comm access using RCU.
>  		 */
>  		rcu_read_lock();
> -		task = pid_task(file->pid, PIDTYPE_TGID);
> -		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
> +		pid = rcu_dereference(file->pid);
> +		task = pid_task(pid, PIDTYPE_TGID);
> +		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>  			   task ? task->comm : "<unknown>");
>  		rcu_read_unlock();
>  
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 0d1f853092ab..27d545131d4a 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -255,8 +255,15 @@ struct drm_file {
>  	/** @master_lookup_lock: Serializes @master. */
>  	spinlock_t master_lookup_lock;
>  
> -	/** @pid: Process that opened this file. */
> -	struct pid *pid;
> +	/**
> +	 * @pid: Process that is using this file.
> +	 *
> +	 * Must only be dereferenced under a rcu_read_lock or equivalent.
> +	 *
> +	 * Updates are guarded with dev->filelist_mutex and reference must be
> +	 * dropped after a RCU grace period to accommodate lockless readers.
> +	 */
> +	struct pid __rcu *pid;
>  
>  	/** @magic: Authentication magic, see @authenticated. */
>  	drm_magic_t magic;
> @@ -415,6 +422,8 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>  	return file_priv->minor->type == DRM_MINOR_ACCEL;
>  }
>  
> +void drm_file_update_pid(struct drm_file *);
> +
>  int drm_open(struct inode *inode, struct file *filp);
>  int drm_open_helper(struct file *filp, struct drm_minor *minor);
>  ssize_t drm_read(struct file *filp, char __user *buffer,
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
