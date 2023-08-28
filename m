Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216AE78B8D0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 21:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5A910E0D9;
	Mon, 28 Aug 2023 19:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66EE10E0B8;
 Mon, 28 Aug 2023 19:58:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4bdso227465a12.3; 
 Mon, 28 Aug 2023 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693252695; x=1693857495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4I/5rlOV0NCpOMnT1Z1j3vGVur6FeLd5vpS7S1OKgc=;
 b=hlTv1mgzQZzjuFPfcQLMo27XlpbijJxxabSYP3p14lpnL1eNwv0B9/V0uTG6CNncI7
 bXqodaRGC2oZkv1SOgeA7ZCuy6OrpB4qqQIEzuNBeb1zDhl9rwZPWS3yXbYqPQin7JkJ
 wMuvEghE3rrNXOoEG3Tv2bqwIi0RRI+/jHbw8cyh0f6eZro6d81ILSjrNrtH79cgmaAi
 Cjv+ENfZISrgbFOPTne3/UzPtLo73x6E+JBNmBhEcyRuSq4UHonhfSRHAws3Y1bOqXbg
 kpoO+hPZKRopxZwh+0L3TIoHimzKmrj39wZWfdRcvXJeTppsJYyatFqpk/FiYx1TWTIG
 U6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693252695; x=1693857495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4I/5rlOV0NCpOMnT1Z1j3vGVur6FeLd5vpS7S1OKgc=;
 b=i8un2vbSOOtfJ+eawSC3va936adj6G4V08a+AzSWaZRY+ME3cXDGKBzt5ZBrpcZT6o
 /bkgRCIIcHJ0azV7EJQxFmQ8nC6GCOmzAOXqs1lysHQfrNXkrPUFivlFGAmzLSZs4gYV
 SV9b8foVKkI3Go35Od5wgdVgQxhY78+yo0xMvlJ1blNK98wQL7z7cpqucAJxsxZfu4lo
 f04jDzWo/IFjxmcvA1hoc5VVbADsEXRPlwiOb5toRMVLrhBomeVpkni464Tu1Xwm/bHm
 o4wWntn0zqi9+03RsAbXjrkKYzj3Byo2pZy/Am8TXFEbtJAWDWDZsiWlkiASDNlUYFaV
 Iz8w==
X-Gm-Message-State: AOJu0Yy5h8xLQDbkhZXgXPSqMfWQxOKOhdReRbbWDb4gEMPLkqy5tGjM
 p41yVG2KZKiCYW54uVe41ICtK05W+b2loocfdsE=
X-Google-Smtp-Source: AGHT+IGZFbfeK7T34TCy+cmwDrwNqxs9IbN1ainieCsHoXzxwBeFsr9gWcFbuo0YUnWxocfCVx8w0SOWvFvOrHsFdhg=
X-Received: by 2002:a05:6402:34b:b0:525:69ec:e1c8 with SMTP id
 r11-20020a056402034b00b0052569ece1c8mr16600451edw.40.1693252694977; Mon, 28
 Aug 2023 12:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230621094824.2348732-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230621094824.2348732-1-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Aug 2023 12:58:02 -0700
Message-ID: <CAF6AEGu+ztCSACr7WjJAcmwObszLNYmysGj_XdnkNiXAqoCiEw@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Update file owner during use
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel-gfx@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 2:48=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> With the typical model where the display server opens the file descriptor
> and then hands it over to the client(*), we were showing stale data in
> debugfs.
>
> Fix it by updating the drm_file->pid on ioctl access from a different
> process.
>
> The field is also made RCU protected to allow for lockless readers. Updat=
e
> side is protected with dev->filelist_mutex.
>
> Before:
>
> $ cat /sys/kernel/debug/dri/0/clients
>              command   pid dev master a   uid      magic
>                 Xorg  2344   0   y    y     0          0
>                 Xorg  2344   0   n    y     0          2
>                 Xorg  2344   0   n    y     0          3
>                 Xorg  2344   0   n    y     0          4
>
> After:
>
> $ cat /sys/kernel/debug/dri/0/clients
>              command  tgid dev master a   uid      magic
>                 Xorg   830   0   y    y     0          0
>        xfce4-session   880   0   n    y     0          1
>                xfwm4   943   0   n    y     0          2
>            neverball  1095   0   n    y     0          3
>
> *)
> More detailed and historically accurate description of various handover
> implementation kindly provided by Emil Velikov:
>
> """
> The traditional model, the server was the orchestrator managing the
> primary device node. From the fd, to the master status and
> authentication. But looking at the fd alone, this has varied across
> the years.
>
> IIRC in the DRI1 days, Xorg (libdrm really) would have a list of open
> fd(s) and reuse those whenever needed, DRI2 the client was responsible
> for open() themselves and with DRI3 the fd was passed to the client.
>
> Around the inception of DRI3 and systemd-logind, the latter became
> another possible orchestrator. Whereby Xorg and Wayland compositors
> could ask it for the fd. For various reasons (hysterical and genuine
> ones) Xorg has a fallback path going the open(), whereas Wayland
> compositors are moving to solely relying on logind... some never had
> fallback even.
>
> Over the past few years, more projects have emerged which provide
> functionality similar (be that on API level, Dbus, or otherwise) to
> systemd-logind.
> """
>
> v2:
>  * Fixed typo in commit text and added a fine historical explanation
>    from Emil.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>
Tested-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  6 ++--
>  drivers/gpu/drm/drm_auth.c              |  3 +-
>  drivers/gpu/drm/drm_debugfs.c           | 10 ++++---
>  drivers/gpu/drm/drm_file.c              | 40 +++++++++++++++++++++++--
>  drivers/gpu/drm/drm_ioctl.c             |  3 ++
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 +++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  6 ++--
>  include/drm/drm_file.h                  | 13 ++++++--
>  8 files changed, 71 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 74055cba3dc9..849097dff02b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -963,6 +963,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_fi=
le *m, void *unused)
>         list_for_each_entry(file, &dev->filelist, lhead) {
>                 struct task_struct *task;
>                 struct drm_gem_object *gobj;
> +               struct pid *pid;
>                 int id;
>
>                 /*
> @@ -972,8 +973,9 @@ static int amdgpu_debugfs_gem_info_show(struct seq_fi=
le *m, void *unused)
>                  * Therefore, we need to protect this ->comm access using=
 RCU.
>                  */
>                 rcu_read_lock();
> -               task =3D pid_task(file->pid, PIDTYPE_TGID);
> -               seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
> +               pid =3D rcu_dereference(file->pid);
> +               task =3D pid_task(pid, PIDTYPE_TGID);
> +               seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>                            task ? task->comm : "<unknown>");
>                 rcu_read_unlock();
>
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index cf92a9ae8034..2ed2585ded37 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -235,7 +235,8 @@ static int drm_new_set_master(struct drm_device *dev,=
 struct drm_file *fpriv)
>  static int
>  drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv=
)
>  {
> -       if (file_priv->pid =3D=3D task_pid(current) && file_priv->was_mas=
ter)
> +       if (file_priv->was_master &&
> +           rcu_access_pointer(file_priv->pid) =3D=3D task_pid(current))
>                 return 0;
>
>         if (!capable(CAP_SYS_ADMIN))
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.=
c
> index 4855230ba2c6..b46f5ceb24c6 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file *m, void =
*data)
>          */
>         mutex_lock(&dev->filelist_mutex);
>         list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
> -               struct task_struct *task;
>                 bool is_current_master =3D drm_is_current_master(priv);
> +               struct task_struct *task;
> +               struct pid *pid;
>
> -               rcu_read_lock(); /* locks pid_task()->comm */
> -               task =3D pid_task(priv->pid, PIDTYPE_TGID);
> +               rcu_read_lock(); /* Locks priv->pid and pid_task()->comm!=
 */
> +               pid =3D rcu_dereference(priv->pid);
> +               task =3D pid_task(pid, PIDTYPE_TGID);
>                 uid =3D task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>                 seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>                            task ? task->comm : "<unknown>",
> -                          pid_vnr(priv->pid),
> +                          pid_vnr(pid),
>                            priv->minor->index,
>                            is_current_master ? 'y' : 'n',
>                            priv->authenticated ? 'y' : 'n',
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 883d83bc0e3d..e692770ef6d3 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -160,7 +160,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *min=
or)
>
>         /* Get a unique identifier for fdinfo: */
>         file->client_id =3D atomic64_inc_return(&ident);
> -       file->pid =3D get_pid(task_tgid(current));
> +       rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>         file->minor =3D minor;
>
>         /* for compatibility root is always authenticated */
> @@ -200,7 +200,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *min=
or)
>                 drm_syncobj_release(file);
>         if (drm_core_check_feature(dev, DRIVER_GEM))
>                 drm_gem_release(dev, file);
> -       put_pid(file->pid);
> +       put_pid(rcu_access_pointer(file->pid));
>         kfree(file);
>
>         return ERR_PTR(ret);
> @@ -291,7 +291,7 @@ void drm_file_free(struct drm_file *file)
>
>         WARN_ON(!list_empty(&file->event_list));
>
> -       put_pid(file->pid);
> +       put_pid(rcu_access_pointer(file->pid));
>         kfree(file);
>  }
>
> @@ -505,6 +505,40 @@ int drm_release(struct inode *inode, struct file *fi=
lp)
>  }
>  EXPORT_SYMBOL(drm_release);
>
> +void drm_file_update_pid(struct drm_file *filp)
> +{
> +       struct drm_device *dev;
> +       struct pid *pid, *old;
> +
> +       /*
> +        * Master nodes need to keep the original ownership in order for
> +        * drm_master_check_perm to keep working correctly. (See comment =
in
> +        * drm_auth.c.)
> +        */
> +       if (filp->was_master)
> +               return;
> +
> +       pid =3D task_tgid(current);
> +
> +       /*
> +        * Quick unlocked check since the model is a single handover foll=
owed by
> +        * exclusive repeated use.
> +        */
> +       if (pid =3D=3D rcu_access_pointer(filp->pid))
> +               return;
> +
> +       dev =3D filp->minor->dev;
> +       mutex_lock(&dev->filelist_mutex);
> +       old =3D rcu_replace_pointer(filp->pid, pid, 1);
> +       mutex_unlock(&dev->filelist_mutex);
> +
> +       if (pid !=3D old) {
> +               get_pid(pid);
> +               synchronize_rcu();
> +               put_pid(old);
> +       }
> +}
> +
>  /**
>   * drm_release_noglobal - release method for DRM file
>   * @inode: device inode
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 7c9d66ee917d..305b18d9d7b6 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t =
*func, void *kdata,
>         struct drm_device *dev =3D file_priv->minor->dev;
>         int retcode;
>
> +       /* Update drm_file owner if fd was passed along. */
> +       drm_file_update_pid(file_priv);
> +
>         if (drm_dev_is_unplugged(dev))
>                 return -ENODEV;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 51f1918b44d3..e3cb60eb0bc8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1101,7 +1101,10 @@ nouveau_drm_open(struct drm_device *dev, struct dr=
m_file *fpriv)
>         }
>
>         get_task_comm(tmpname, current);
> -       snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid=
));
> +       rcu_read_lock();
> +       snprintf(name, sizeof(name), "%s[%d]",
> +                tmpname, pid_nr(rcu_dereference(fpriv->pid)));
> +       rcu_read_unlock();
>
>         if (!(cli =3D kzalloc(sizeof(*cli), GFP_KERNEL))) {
>                 ret =3D -ENOMEM;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_gem.c
> index c0da89e16e6f..a07e5b7e2f2f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -232,6 +232,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file =
*m, void *unused)
>         list_for_each_entry(file, &dev->filelist, lhead) {
>                 struct task_struct *task;
>                 struct drm_gem_object *gobj;
> +               struct pid *pid;
>                 int id;
>
>                 /*
> @@ -241,8 +242,9 @@ static int vmw_debugfs_gem_info_show(struct seq_file =
*m, void *unused)
>                  * Therefore, we need to protect this ->comm access using=
 RCU.
>                  */
>                 rcu_read_lock();
> -               task =3D pid_task(file->pid, PIDTYPE_TGID);
> -               seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
> +               pid =3D rcu_dereference(file->pid);
> +               task =3D pid_task(pid, PIDTYPE_TGID);
> +               seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>                            task ? task->comm : "<unknown>");
>                 rcu_read_unlock();
>
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 966912053cb0..c76249d5467e 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -256,8 +256,15 @@ struct drm_file {
>         /** @master_lookup_lock: Serializes @master. */
>         spinlock_t master_lookup_lock;
>
> -       /** @pid: Process that opened this file. */
> -       struct pid *pid;
> +       /**
> +        * @pid: Process that is using this file.
> +        *
> +        * Must only be dereferenced under a rcu_read_lock or equivalent.
> +        *
> +        * Updates are guarded with dev->filelist_mutex and reference mus=
t be
> +        * dropped after a RCU grace period to accommodate lockless reade=
rs.
> +        */
> +       struct pid __rcu *pid;
>
>         /** @client_id: A unique id for fdinfo */
>         u64 client_id;
> @@ -420,6 +427,8 @@ static inline bool drm_is_accel_client(const struct d=
rm_file *file_priv)
>         return file_priv->minor->type =3D=3D DRM_MINOR_ACCEL;
>  }
>
> +void drm_file_update_pid(struct drm_file *);
> +
>  int drm_open(struct inode *inode, struct file *filp);
>  int drm_open_helper(struct file *filp, struct drm_minor *minor);
>  ssize_t drm_read(struct file *filp, char __user *buffer,
> --
> 2.39.2
>
