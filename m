Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBFB1B790C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 17:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468BB89CBA;
	Fri, 24 Apr 2020 15:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2057D89C6E;
 Fri, 24 Apr 2020 15:12:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EDDE7804C8;
 Fri, 24 Apr 2020 17:12:56 +0200 (CEST)
Date: Fri, 24 Apr 2020 17:12:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 27/59] drm/qxl: Don't use drm_device->dev_private
Message-ID: <20200424151255.GC20856@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-28-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-28-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=Z4Rwk6OoAAAA:8
 a=e5mUnYsNAAAA:8 a=7gkXJVJtAAAA:8 a=K0AROGcU_1zAwnmKjJgA:9
 a=8YiIes2jcBVFeZ1E:21 a=nfBfXPOhjualJiQB:21 a=CjuIK1q_8ugA:10
 a=HkZW87K1Qel5hWWM3VKY:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:02AM +0200, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/qxl/qxl_debugfs.c |  7 +++----
>  drivers/gpu/drm/qxl/qxl_display.c | 32 +++++++++++++++----------------
>  drivers/gpu/drm/qxl/qxl_drv.c     |  8 ++++----
>  drivers/gpu/drm/qxl/qxl_drv.h     |  4 ++--
>  drivers/gpu/drm/qxl/qxl_dumb.c    |  2 +-
>  drivers/gpu/drm/qxl/qxl_gem.c     |  2 +-
>  drivers/gpu/drm/qxl/qxl_ioctl.c   | 14 +++++++-------
>  drivers/gpu/drm/qxl/qxl_irq.c     |  2 +-
>  drivers/gpu/drm/qxl/qxl_kms.c     |  1 -
>  drivers/gpu/drm/qxl/qxl_object.c  |  2 +-
>  drivers/gpu/drm/qxl/qxl_release.c |  2 +-
>  drivers/gpu/drm/qxl/qxl_ttm.c     |  2 +-
>  12 files changed, 38 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
> index 88123047fdd4..524d35b648d8 100644
> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
> @@ -39,7 +39,7 @@ static int
>  qxl_debugfs_irq_received(struct seq_file *m, void *data)
>  {
>  	struct drm_info_node *node = (struct drm_info_node *) m->private;
> -	struct qxl_device *qdev = node->minor->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(node->minor->dev);
>  
>  	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received));
>  	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received_display));
> @@ -53,7 +53,7 @@ static int
>  qxl_debugfs_buffers_info(struct seq_file *m, void *data)
>  {
>  	struct drm_info_node *node = (struct drm_info_node *) m->private;
> -	struct qxl_device *qdev = node->minor->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(node->minor->dev);
>  	struct qxl_bo *bo;
>  
>  	list_for_each_entry(bo, &qdev->gem.objects, list) {
> @@ -83,8 +83,7 @@ void
>  qxl_debugfs_init(struct drm_minor *minor)
>  {
>  #if defined(CONFIG_DEBUG_FS)
> -	struct qxl_device *dev =
> -		(struct qxl_device *) minor->dev->dev_private;
> +	struct qxl_device *dev = to_qxl(minor->dev);
>  
>  	drm_debugfs_create_files(qxl_debugfs_list, QXL_DEBUGFS_ENTRIES,
>  				 minor->debugfs_root, minor);
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 09583a08e141..1082cd5d2fd4 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -221,7 +221,7 @@ static int qxl_add_mode(struct drm_connector *connector,
>  			bool preferred)
>  {
>  	struct drm_device *dev = connector->dev;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_display_mode *mode = NULL;
>  	int rc;
>  
> @@ -242,7 +242,7 @@ static int qxl_add_mode(struct drm_connector *connector,
>  static int qxl_add_monitors_config_modes(struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct qxl_output *output = drm_connector_to_qxl_output(connector);
>  	int h = output->index;
>  	struct qxl_head *head;
> @@ -310,7 +310,7 @@ static void qxl_crtc_update_monitors_config(struct drm_crtc *crtc,
>  					    const char *reason)
>  {
>  	struct drm_device *dev = crtc->dev;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct qxl_crtc *qcrtc = to_qxl_crtc(crtc);
>  	struct qxl_head head;
>  	int oldcount, i = qcrtc->index;
> @@ -400,7 +400,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
>  					 unsigned int num_clips)
>  {
>  	/* TODO: vmwgfx where this was cribbed from had locking. Why? */
> -	struct qxl_device *qdev = fb->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(fb->dev);
>  	struct drm_clip_rect norect;
>  	struct qxl_bo *qobj;
>  	bool is_primary;
> @@ -462,7 +462,7 @@ static const struct drm_crtc_helper_funcs qxl_crtc_helper_funcs = {
>  static int qxl_primary_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *state)
>  {
> -	struct qxl_device *qdev = plane->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(plane->dev);
>  	struct qxl_bo *bo;
>  
>  	if (!state->crtc || !state->fb)
> @@ -476,7 +476,7 @@ static int qxl_primary_atomic_check(struct drm_plane *plane,
>  static int qxl_primary_apply_cursor(struct drm_plane *plane)
>  {
>  	struct drm_device *dev = plane->dev;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_framebuffer *fb = plane->state->fb;
>  	struct qxl_crtc *qcrtc = to_qxl_crtc(plane->state->crtc);
>  	struct qxl_cursor_cmd *cmd;
> @@ -523,7 +523,7 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
>  static void qxl_primary_atomic_update(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
>  {
> -	struct qxl_device *qdev = plane->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(plane->dev);
>  	struct qxl_bo *bo = gem_to_qxl_bo(plane->state->fb->obj[0]);
>  	struct qxl_bo *primary;
>  	struct drm_clip_rect norect = {
> @@ -554,7 +554,7 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
>  static void qxl_primary_atomic_disable(struct drm_plane *plane,
>  				       struct drm_plane_state *old_state)
>  {
> -	struct qxl_device *qdev = plane->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(plane->dev);
>  
>  	if (old_state->fb) {
>  		struct qxl_bo *bo = gem_to_qxl_bo(old_state->fb->obj[0]);
> @@ -570,7 +570,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
>  				     struct drm_plane_state *old_state)
>  {
>  	struct drm_device *dev = plane->dev;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_framebuffer *fb = plane->state->fb;
>  	struct qxl_crtc *qcrtc = to_qxl_crtc(plane->state->crtc);
>  	struct qxl_release *release;
> @@ -679,7 +679,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
>  static void qxl_cursor_atomic_disable(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
>  {
> -	struct qxl_device *qdev = plane->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(plane->dev);
>  	struct qxl_release *release;
>  	struct qxl_cursor_cmd *cmd;
>  	int ret;
> @@ -762,7 +762,7 @@ static void qxl_calc_dumb_shadow(struct qxl_device *qdev,
>  static int qxl_plane_prepare_fb(struct drm_plane *plane,
>  				struct drm_plane_state *new_state)
>  {
> -	struct qxl_device *qdev = plane->dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(plane->dev);
>  	struct drm_gem_object *obj;
>  	struct qxl_bo *user_bo;
>  	struct qxl_surface surf;
> @@ -923,7 +923,7 @@ static int qdev_crtc_init(struct drm_device *dev, int crtc_id)
>  {
>  	struct qxl_crtc *qxl_crtc;
>  	struct drm_plane *primary, *cursor;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	int r;
>  
>  	qxl_crtc = kzalloc(sizeof(struct qxl_crtc), GFP_KERNEL);
> @@ -965,7 +965,7 @@ static int qdev_crtc_init(struct drm_device *dev, int crtc_id)
>  static int qxl_conn_get_modes(struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct qxl_output *output = drm_connector_to_qxl_output(connector);
>  	unsigned int pwidth = 1024;
>  	unsigned int pheight = 768;
> @@ -991,7 +991,7 @@ static enum drm_mode_status qxl_conn_mode_valid(struct drm_connector *connector,
>  			       struct drm_display_mode *mode)
>  {
>  	struct drm_device *ddev = connector->dev;
> -	struct qxl_device *qdev = ddev->dev_private;
> +	struct qxl_device *qdev = to_qxl(ddev);
>  
>  	if (qxl_check_mode(qdev, mode->hdisplay, mode->vdisplay) != 0)
>  		return MODE_BAD;
> @@ -1021,7 +1021,7 @@ static enum drm_connector_status qxl_conn_detect(
>  	struct qxl_output *output =
>  		drm_connector_to_qxl_output(connector);
>  	struct drm_device *ddev = connector->dev;
> -	struct qxl_device *qdev = ddev->dev_private;
> +	struct qxl_device *qdev = to_qxl(ddev);
>  	bool connected = false;
>  
>  	/* The first monitor is always connected */
> @@ -1071,7 +1071,7 @@ static int qxl_mode_create_hotplug_mode_update_property(struct qxl_device *qdev)
>  
>  static int qdev_output_init(struct drm_device *dev, int num_output)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct qxl_output *qxl_output;
>  	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 6b4ae4c5fb76..13872b882775 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -137,7 +137,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  static void qxl_drm_release(struct drm_device *dev)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  
>  	/*
>  	 * TODO: qxl_device_fini() call should be in qxl_pci_remove(),
> @@ -164,7 +164,7 @@ DEFINE_DRM_GEM_FOPS(qxl_fops);
>  static int qxl_drm_freeze(struct drm_device *dev)
>  {
>  	struct pci_dev *pdev = dev->pdev;
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	int ret;
>  
>  	ret = drm_mode_config_helper_suspend(dev);
> @@ -186,7 +186,7 @@ static int qxl_drm_freeze(struct drm_device *dev)
>  
>  static int qxl_drm_resume(struct drm_device *dev, bool thaw)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  
>  	qdev->ram_header->int_mask = QXL_INTERRUPT_MASK;
>  	if (!thaw) {
> @@ -245,7 +245,7 @@ static int qxl_pm_restore(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct drm_device *drm_dev = pci_get_drvdata(pdev);
> -	struct qxl_device *qdev = drm_dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(drm_dev);
>  
>  	qxl_io_reset(qdev);
>  	return qxl_drm_resume(drm_dev, false);
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> index 86ac191d9205..31e35f787df2 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -192,8 +192,6 @@ struct qxl_debugfs {
>  
>  int qxl_debugfs_fence_init(struct qxl_device *rdev);
>  
> -struct qxl_device;
> -
>  struct qxl_device {
>  	struct drm_device ddev;
>  
> @@ -273,6 +271,8 @@ struct qxl_device {
>  	int monitors_config_height;
>  };
>  
> +#define to_qxl(dev) container_of(dev, struct qxl_device, ddev)
> +
>  extern const struct drm_ioctl_desc qxl_ioctls[];
>  extern int qxl_max_ioctl;
>  
> diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
> index 272d19b677d8..24e903383aa1 100644
> --- a/drivers/gpu/drm/qxl/qxl_dumb.c
> +++ b/drivers/gpu/drm/qxl/qxl_dumb.c
> @@ -32,7 +32,7 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
>  			    struct drm_device *dev,
>  			    struct drm_mode_create_dumb *args)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct qxl_bo *qobj;
>  	uint32_t handle;
>  	int r;
> diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
> index 69f37db1027a..5ff6fa9b799c 100644
> --- a/drivers/gpu/drm/qxl/qxl_gem.c
> +++ b/drivers/gpu/drm/qxl/qxl_gem.c
> @@ -34,7 +34,7 @@ void qxl_gem_object_free(struct drm_gem_object *gobj)
>  	struct qxl_device *qdev;
>  	struct ttm_buffer_object *tbo;
>  
> -	qdev = (struct qxl_device *)gobj->dev->dev_private;
> +	qdev = to_qxl(gobj->dev);
>  
>  	qxl_surface_evict(qdev, qobj, false);
>  
> diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
> index 8117a45b3610..d9a583966949 100644
> --- a/drivers/gpu/drm/qxl/qxl_ioctl.c
> +++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
> @@ -36,7 +36,7 @@
>  static int qxl_alloc_ioctl(struct drm_device *dev, void *data,
>  			   struct drm_file *file_priv)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_qxl_alloc *qxl_alloc = data;
>  	int ret;
>  	struct qxl_bo *qobj;
> @@ -64,7 +64,7 @@ static int qxl_alloc_ioctl(struct drm_device *dev, void *data,
>  static int qxl_map_ioctl(struct drm_device *dev, void *data,
>  			 struct drm_file *file_priv)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_qxl_map *qxl_map = data;
>  
>  	return qxl_mode_dumb_mmap(file_priv, &qdev->ddev, qxl_map->handle,
> @@ -279,7 +279,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
>  static int qxl_execbuffer_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file_priv)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_qxl_execbuffer *execbuffer = data;
>  	struct drm_qxl_command user_cmd;
>  	int cmd_num;
> @@ -304,7 +304,7 @@ static int qxl_execbuffer_ioctl(struct drm_device *dev, void *data,
>  static int qxl_update_area_ioctl(struct drm_device *dev, void *data,
>  				 struct drm_file *file)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_qxl_update_area *update_area = data;
>  	struct qxl_rect area = {.left = update_area->left,
>  				.top = update_area->top,
> @@ -354,7 +354,7 @@ static int qxl_update_area_ioctl(struct drm_device *dev, void *data,
>  static int qxl_getparam_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_qxl_getparam *param = data;
>  
>  	switch (param->param) {
> @@ -373,7 +373,7 @@ static int qxl_getparam_ioctl(struct drm_device *dev, void *data,
>  static int qxl_clientcap_ioctl(struct drm_device *dev, void *data,
>  				  struct drm_file *file_priv)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_qxl_clientcap *param = data;
>  	int byte, idx;
>  
> @@ -394,7 +394,7 @@ static int qxl_clientcap_ioctl(struct drm_device *dev, void *data,
>  static int qxl_alloc_surf_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file)
>  {
> -	struct qxl_device *qdev = dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	struct drm_qxl_alloc_surf *param = data;
>  	struct qxl_bo *qobj;
>  	int handle;
> diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_irq.c
> index 8435af108632..1ba5a702d763 100644
> --- a/drivers/gpu/drm/qxl/qxl_irq.c
> +++ b/drivers/gpu/drm/qxl/qxl_irq.c
> @@ -32,7 +32,7 @@
>  irqreturn_t qxl_irq_handler(int irq, void *arg)
>  {
>  	struct drm_device *dev = (struct drm_device *) arg;
> -	struct qxl_device *qdev = (struct qxl_device *)dev->dev_private;
> +	struct qxl_device *qdev = to_qxl(dev);
>  	uint32_t pending;
>  
>  	pending = xchg(&qdev->ram_header->int_pending, 0);
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
> index 91a34dd835d7..a6d873052cd4 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -114,7 +114,6 @@ int qxl_device_init(struct qxl_device *qdev,
>  
>  	qdev->ddev.pdev = pdev;
>  	pci_set_drvdata(pdev, &qdev->ddev);
> -	qdev->ddev.dev_private = qdev;
>  
>  	mutex_init(&qdev->gem.mutex);
>  	mutex_init(&qdev->update_area_mutex);
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index ab72dc3476e9..edc8a9916872 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -33,7 +33,7 @@ static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
>  	struct qxl_device *qdev;
>  
>  	bo = to_qxl_bo(tbo);
> -	qdev = (struct qxl_device *)bo->tbo.base.dev->dev_private;
> +	qdev = to_qxl(bo->tbo.base.dev);
>  
>  	qxl_surface_evict(qdev, bo, false);
>  	WARN_ON_ONCE(bo->map_count > 0);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 2feca734c7b1..4fae3e393da1 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -243,7 +243,7 @@ static int qxl_release_validate_bo(struct qxl_bo *bo)
>  		return ret;
>  
>  	/* allocate a surface for reserved + validated buffers */
> -	ret = qxl_bo_check_id(bo->tbo.base.dev->dev_private, bo);
> +	ret = qxl_bo_check_id(to_qxl(bo->tbo.base.dev), bo);
>  	if (ret)
>  		return ret;
>  	return 0;
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 93a2eb14844b..f09a712b1ed2 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -243,7 +243,7 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
>  	if (!qxl_ttm_bo_is_qxl_bo(bo))
>  		return;
>  	qbo = to_qxl_bo(bo);
> -	qdev = qbo->tbo.base.dev->dev_private;
> +	qdev = to_qxl(qbo->tbo.base.dev);
>  
>  	if (bo->mem.mem_type == TTM_PL_PRIV && qbo->surface_id)
>  		qxl_surface_evict(qdev, qbo, new_mem ? true : false);
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
