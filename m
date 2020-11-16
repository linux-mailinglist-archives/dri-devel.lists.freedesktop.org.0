Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82952B42F6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 12:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D92889C19;
	Mon, 16 Nov 2020 11:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3515B89C0D;
 Mon, 16 Nov 2020 11:37:25 +0000 (UTC)
IronPort-SDR: FEvrBV5PMuHVXWYLI5/rbMwSTs5WQNs+YcKIfDXDlqylI76pA0n4I/79/bhcCWZGlv+5Lgjzr+
 sY2iijJiHaCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="167221840"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="167221840"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 03:37:24 -0800
IronPort-SDR: lLMHN6GNjn4zRt2FxKbUlgk/sq8Gl1rKoqrqo5STFxSDUCsh/sUCtiWtFMtKHbUoaE1N0+D6h6
 g+d6cMIQWyZQ==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="543571927"
Received: from mfinegan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.82.228])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 03:37:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 05/27] drm: fix some kernel-doc markups
In-Reply-To: <12d4ca26f6843618200529ce5445063734d38c04.1605521731.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
 <12d4ca26f6843618200529ce5445063734d38c04.1605521731.git.mchehab+huawei@kernel.org>
Date: Mon, 16 Nov 2020 13:37:11 +0200
Message-ID: <87eektr0rc.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, changzhu <Changfeng.Zhu@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yintian Tao <yttao@amd.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Nov 2020, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Some identifiers have different names between their prototypes
> and the kernel-doc markup.
>
> Others need to be fixed, as kernel-doc markups should use this format:
>         identifier - description
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c     | 2 +-
>  drivers/gpu/drm/drm_connector.c               | 3 ++-
>  drivers/gpu/drm/drm_dp_helper.c               | 2 +-
>  drivers/gpu/drm/drm_framebuffer.c             | 2 +-
>  drivers/gpu/drm/drm_gem.c                     | 4 ++--
>  drivers/gpu/drm/drm_gem_vram_helper.c         | 2 +-
>  drivers/gpu/drm/drm_mode_object.c             | 2 +-
>  drivers/gpu/drm/drm_modes.c                   | 4 ++--
>  drivers/gpu/drm/drm_scdc_helper.c             | 2 +-
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
>  drivers/gpu/drm/i915/i915_gem_evict.c         | 2 +-
>  drivers/gpu/drm/i915/i915_perf.c              | 8 +++++---

For the i915 parts,

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree.

>  drivers/gpu/drm/scheduler/sched_main.c        | 2 +-
>  drivers/gpu/drm/v3d/v3d_sched.c               | 2 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                  | 2 +-
>  include/drm/drm_atomic_helper.h               | 4 ++--
>  include/drm/drm_connector.h                   | 2 +-
>  include/drm/drm_device.h                      | 2 +-
>  include/drm/drm_dsc.h                         | 3 ++-
>  include/drm/drm_gem_vram_helper.h             | 8 ++++----
>  20 files changed, 32 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 9ad74045158e..ddcf5c2c8e6a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -526,41 +526,41 @@ __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state)
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_destroy_state);
>  
>  /**
>   * drm_atomic_helper_connector_destroy_state - default state destroy hook
>   * @connector: drm connector
>   * @state: connector state object to release
>   *
>   * Default connector state destroy hook for drivers which don't have their own
>   * subclassed connector state structure.
>   */
>  void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>  					  struct drm_connector_state *state)
>  {
>  	__drm_atomic_helper_connector_destroy_state(state);
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
>  
>  /**
> - * __drm_atomic_helper_private_duplicate_state - copy atomic private state
> + * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
>   * @obj: CRTC object
>   * @state: new private object state
>   *
>   * Copies atomic state from a private objects's current state and resets inferred values.
>   * This is useful for drivers that subclass the private state.
>   */
>  void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
>  						     struct drm_private_state *state)
>  {
>  	memcpy(state, obj->state, sizeof(*state));
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_private_obj_duplicate_state);
>  
>  /**
>   * __drm_atomic_helper_bridge_duplicate_state() - Copy atomic bridge state
>   * @bridge: bridge object
>   * @state: atomic bridge state
>   *
>   * Copies atomic state from a bridge's current state and resets inferred values.
>   * This is useful for drivers that subclass the bridge state.
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 1913d8b4e16a..98b6ec45ef96 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1415,41 +1415,42 @@ void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
>  		break;
>  	case DRM_MODE_CONTENT_TYPE_CINEMA:
>  		frame->content_type = HDMI_CONTENT_TYPE_CINEMA;
>  		break;
>  	case DRM_MODE_CONTENT_TYPE_GAME:
>  		frame->content_type = HDMI_CONTENT_TYPE_GAME;
>  		break;
>  	case DRM_MODE_CONTENT_TYPE_PHOTO:
>  		frame->content_type = HDMI_CONTENT_TYPE_PHOTO;
>  		break;
>  	default:
>  		/* Graphics is the default(0) */
>  		frame->content_type = HDMI_CONTENT_TYPE_GRAPHICS;
>  	}
>  
>  	frame->itc = conn_state->content_type != DRM_MODE_CONTENT_TYPE_NO_DATA;
>  }
>  EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
>  
>  /**
> - * drm_mode_attach_tv_margin_properties - attach TV connector margin properties
> + * drm_connector_attach_tv_margin_properties - attach TV connector margin
> + * 	properties
>   * @connector: DRM connector
>   *
>   * Called by a driver when it needs to attach TV margin props to a connector.
>   * Typically used on SDTV and HDMI connectors.
>   */
>  void drm_connector_attach_tv_margin_properties(struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
>  
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.tv_left_margin_property,
>  				   0);
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.tv_right_margin_property,
>  				   0);
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.tv_top_margin_property,
>  				   0);
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.tv_bottom_margin_property,
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 37ec3b94389c..5bd0934004e3 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1144,41 +1144,41 @@ drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  	switch (type) {
>  	case DP_DS_PORT_TYPE_DP:
>  	case DP_DS_PORT_TYPE_DP_DUALMODE:
>  		return DRM_MODE_SUBCONNECTOR_DisplayPort;
>  	case DP_DS_PORT_TYPE_VGA:
>  		return DRM_MODE_SUBCONNECTOR_VGA;
>  	case DP_DS_PORT_TYPE_DVI:
>  		return DRM_MODE_SUBCONNECTOR_DVID;
>  	case DP_DS_PORT_TYPE_HDMI:
>  		return DRM_MODE_SUBCONNECTOR_HDMIA;
>  	case DP_DS_PORT_TYPE_WIRELESS:
>  		return DRM_MODE_SUBCONNECTOR_Wireless;
>  	case DP_DS_PORT_TYPE_NON_EDID:
>  	default:
>  		return DRM_MODE_SUBCONNECTOR_Unknown;
>  	}
>  }
>  EXPORT_SYMBOL(drm_dp_subconnector_type);
>  
>  /**
> - * drm_mode_set_dp_subconnector_property - set subconnector for DP connector
> + * drm_dp_set_subconnector_property - set subconnector for DP connector
>   * @connector: connector to set property on
>   * @status: connector status
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
>   *
>   * Called by a driver on every detect event.
>   */
>  void drm_dp_set_subconnector_property(struct drm_connector *connector,
>  				      enum drm_connector_status status,
>  				      const u8 *dpcd,
>  				      const u8 port_cap[4])
>  {
>  	enum drm_mode_subconnector subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
>  
>  	if (status == connector_status_connected)
>  		subconnector = drm_dp_subconnector_type(dpcd, port_cap);
>  	drm_object_property_set_value(&connector->base,
>  			connector->dev->mode_config.dp_subconnector_property,
>  			subconnector);
>  }
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 2f5b0c2bb0fe..aca62ed51e82 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -535,41 +535,41 @@ int drm_mode_getfb(struct drm_device *dev,
>  
>  	/* GET_FB() is an unprivileged ioctl so we must not return a
>  	 * buffer-handle to non-master processes! For
>  	 * backwards-compatibility reasons, we cannot make GET_FB() privileged,
>  	 * so just return an invalid handle for non-masters.
>  	 */
>  	if (!drm_is_current_master(file_priv) && !capable(CAP_SYS_ADMIN)) {
>  		r->handle = 0;
>  		ret = 0;
>  		goto out;
>  	}
>  
>  	ret = fb->funcs->create_handle(fb, file_priv, &r->handle);
>  
>  out:
>  	drm_framebuffer_put(fb);
>  	return ret;
>  }
>  
>  /**
> - * drm_mode_getfb2 - get extended FB info
> + * drm_mode_getfb2_ioctl - get extended FB info
>   * @dev: drm device for the ioctl
>   * @data: data pointer for the ioctl
>   * @file_priv: drm file for the ioctl call
>   *
>   * Lookup the FB given its ID and return info about it.
>   *
>   * Called by the user via ioctl.
>   *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
>  int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  			  void *data, struct drm_file *file_priv)
>  {
>  	struct drm_mode_fb_cmd2 *r = data;
>  	struct drm_framebuffer *fb;
>  	unsigned int i;
>  	int ret;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index eb2d23e04be9..92f89cee213e 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -850,41 +850,41 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	if (!obj->name) {
>  		ret = idr_alloc(&dev->object_name_idr, obj, 1, 0, GFP_KERNEL);
>  		if (ret < 0)
>  			goto err;
>  
>  		obj->name = ret;
>  	}
>  
>  	args->name = (uint64_t) obj->name;
>  	ret = 0;
>  
>  err:
>  	mutex_unlock(&dev->object_name_lock);
>  	drm_gem_object_put(obj);
>  	return ret;
>  }
>  
>  /**
> - * drm_gem_open - implementation of the GEM_OPEN ioctl
> + * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
>   * @dev: drm_device
>   * @data: ioctl data
>   * @file_priv: drm file-private structure
>   *
>   * Open an object using the global name, returning a handle and the size.
>   *
>   * This handle (of course) holds a reference to the object, so the object
>   * will not go away until the handle is deleted.
>   */
>  int
>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  		   struct drm_file *file_priv)
>  {
>  	struct drm_gem_open *args = data;
>  	struct drm_gem_object *obj;
>  	int ret;
>  	u32 handle;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_GEM))
>  		return -EOPNOTSUPP;
> @@ -895,41 +895,41 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  		drm_gem_object_get(obj);
>  	} else {
>  		mutex_unlock(&dev->object_name_lock);
>  		return -ENOENT;
>  	}
>  
>  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
>  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
>  	if (ret)
>  		goto err;
>  
>  	args->handle = handle;
>  	args->size = obj->size;
>  
>  err:
>  	drm_gem_object_put(obj);
>  	return ret;
>  }
>  
>  /**
> - * gem_gem_open - initalizes GEM file-private structures at devnode open time
> + * drm_gem_open - initalizes GEM file-private structures at devnode open time
>   * @dev: drm_device which is being opened by userspace
>   * @file_private: drm file-private structure to set up
>   *
>   * Called at device open time, sets up the structure for handling refcounting
>   * of mm objects.
>   */
>  void
>  drm_gem_open(struct drm_device *dev, struct drm_file *file_private)
>  {
>  	idr_init_base(&file_private->object_idr, 1);
>  	spin_lock_init(&file_private->table_lock);
>  }
>  
>  /**
>   * drm_gem_release - release file-private GEM resources
>   * @dev: drm_device which is being closed by userspace
>   * @file_private: drm file-private structure to clean up
>   *
>   * Called at close time when the filp is going away.
>   *
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 889a06696f7e..02ca22e90290 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -600,41 +600,41 @@ static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
>   * Helpers for struct drm_gem_object_funcs
>   */
>  
>  /**
>   * drm_gem_vram_object_free() - \
>  	Implements &struct drm_gem_object_funcs.free
>   * @gem:       GEM object. Refers to &struct drm_gem_vram_object.gem
>   */
>  static void drm_gem_vram_object_free(struct drm_gem_object *gem)
>  {
>  	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
>  
>  	drm_gem_vram_put(gbo);
>  }
>  
>  /*
>   * Helpers for dump buffers
>   */
>  
>  /**
> - * drm_gem_vram_driver_create_dumb() - \
> + * drm_gem_vram_driver_dumb_create() - \
>  	Implements &struct drm_driver.dumb_create
>   * @file:		the DRM file
>   * @dev:		the DRM device
>   * @args:		the arguments as provided to \
>  				&struct drm_driver.dumb_create
>   *
>   * This function requires the driver to use @drm_device.vram_mm for its
>   * instance of VRAM MM.
>   *
>   * Returns:
>   * 0 on success, or
>   * a negative error code otherwise.
>   */
>  int drm_gem_vram_driver_dumb_create(struct drm_file *file,
>  				    struct drm_device *dev,
>  				    struct drm_mode_create_dumb *args)
>  {
>  	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
>  		return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index db05f386a709..b26588b52795 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -98,41 +98,41 @@ void drm_mode_object_register(struct drm_device *dev,
>   * Free @id from @dev's unique identifier pool.
>   * This function can be called multiple times, and guards against
>   * multiple removals.
>   * These modeset identifiers are _not_ reference counted. Hence don't use this
>   * for reference counted modeset objects like framebuffers.
>   */
>  void drm_mode_object_unregister(struct drm_device *dev,
>  				struct drm_mode_object *object)
>  {
>  	WARN_ON(!dev->driver->load && dev->registered && !object->free_cb);
>  
>  	mutex_lock(&dev->mode_config.idr_mutex);
>  	if (object->id) {
>  		idr_remove(&dev->mode_config.object_idr, object->id);
>  		object->id = 0;
>  	}
>  	mutex_unlock(&dev->mode_config.idr_mutex);
>  }
>  
>  /**
> - * drm_lease_required - check types which must be leased to be used
> + * drm_mode_object_lease_required - check types which must be leased to be used
>   * @type: type of object
>   *
>   * Returns whether the provided type of drm_mode_object must
>   * be owned or leased to be used by a process.
>   */
>  bool drm_mode_object_lease_required(uint32_t type)
>  {
>  	switch(type) {
>  	case DRM_MODE_OBJECT_CRTC:
>  	case DRM_MODE_OBJECT_CONNECTOR:
>  	case DRM_MODE_OBJECT_PLANE:
>  		return true;
>  	default:
>  		return false;
>  	}
>  }
>  
>  struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
>  					       struct drm_file *file_priv,
>  					       uint32_t id, uint32_t type)
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 501b4fe55a3d..33fb2f05ce66 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1872,41 +1872,41 @@ drm_mode_create_from_cmdline_mode(struct drm_device *dev,
>  				    cmd->margins);
>  	else
>  		mode = drm_gtf_mode(dev,
>  				    cmd->xres, cmd->yres,
>  				    cmd->refresh_specified ? cmd->refresh : 60,
>  				    cmd->interlace,
>  				    cmd->margins);
>  	if (!mode)
>  		return NULL;
>  
>  	mode->type |= DRM_MODE_TYPE_USERDEF;
>  	/* fix up 1368x768: GFT/CVT can't express 1366 width due to alignment */
>  	if (cmd->xres == 1366)
>  		drm_mode_fixup_1366x768(mode);
>  	drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
>  	return mode;
>  }
>  EXPORT_SYMBOL(drm_mode_create_from_cmdline_mode);
>  
>  /**
> - * drm_crtc_convert_to_umode - convert a drm_display_mode into a modeinfo
> + * drm_mode_convert_to_umode - convert a drm_display_mode into a modeinfo
>   * @out: drm_mode_modeinfo struct to return to the user
>   * @in: drm_display_mode to use
>   *
>   * Convert a drm_display_mode into a drm_mode_modeinfo structure to return to
>   * the user.
>   */
>  void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
>  			       const struct drm_display_mode *in)
>  {
>  	out->clock = in->clock;
>  	out->hdisplay = in->hdisplay;
>  	out->hsync_start = in->hsync_start;
>  	out->hsync_end = in->hsync_end;
>  	out->htotal = in->htotal;
>  	out->hskew = in->hskew;
>  	out->vdisplay = in->vdisplay;
>  	out->vsync_start = in->vsync_start;
>  	out->vsync_end = in->vsync_end;
>  	out->vtotal = in->vtotal;
>  	out->vscan = in->vscan;
> @@ -1924,41 +1924,41 @@ void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
>  	case HDMI_PICTURE_ASPECT_64_27:
>  		out->flags |= DRM_MODE_FLAG_PIC_AR_64_27;
>  		break;
>  	case HDMI_PICTURE_ASPECT_256_135:
>  		out->flags |= DRM_MODE_FLAG_PIC_AR_256_135;
>  		break;
>  	default:
>  		WARN(1, "Invalid aspect ratio (0%x) on mode\n",
>  		     in->picture_aspect_ratio);
>  		fallthrough;
>  	case HDMI_PICTURE_ASPECT_NONE:
>  		out->flags |= DRM_MODE_FLAG_PIC_AR_NONE;
>  		break;
>  	}
>  
>  	strncpy(out->name, in->name, DRM_DISPLAY_MODE_LEN);
>  	out->name[DRM_DISPLAY_MODE_LEN-1] = 0;
>  }
>  
>  /**
> - * drm_crtc_convert_umode - convert a modeinfo into a drm_display_mode
> + * drm_mode_convert_umode - convert a modeinfo into a drm_display_mode
>   * @dev: drm device
>   * @out: drm_display_mode to return to the user
>   * @in: drm_mode_modeinfo to use
>   *
>   * Convert a drm_mode_modeinfo into a drm_display_mode structure to return to
>   * the caller.
>   *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
>  int drm_mode_convert_umode(struct drm_device *dev,
>  			   struct drm_display_mode *out,
>  			   const struct drm_mode_modeinfo *in)
>  {
>  	if (in->clock > INT_MAX || in->vrefresh > INT_MAX)
>  		return -ERANGE;
>  
>  	out->clock = in->clock;
>  	out->hdisplay = in->hdisplay;
>  	out->hsync_start = in->hsync_start;
> diff --git a/drivers/gpu/drm/drm_scdc_helper.c b/drivers/gpu/drm/drm_scdc_helper.c
> index 311e71bbba5b..991b8c86d78d 100644
> --- a/drivers/gpu/drm/drm_scdc_helper.c
> +++ b/drivers/gpu/drm/drm_scdc_helper.c
> @@ -108,41 +108,41 @@ ssize_t drm_scdc_write(struct i2c_adapter *adapter, u8 offset,
>  
>  	msg.buf = data;
>  
>  	memcpy(data, &offset, sizeof(offset));
>  	memcpy(data + 1, buffer, size);
>  
>  	err = i2c_transfer(adapter, &msg, 1);
>  
>  	kfree(data);
>  
>  	if (err < 0)
>  		return err;
>  	if (err != 1)
>  		return -EPROTO;
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_scdc_write);
>  
>  /**
> - * drm_scdc_check_scrambling_status - what is status of scrambling?
> + * drm_scdc_get_scrambling_status - what is status of scrambling?
>   * @adapter: I2C adapter for DDC channel
>   *
>   * Reads the scrambler status over SCDC, and checks the
>   * scrambling status.
>   *
>   * Returns:
>   * True if the scrambling is enabled, false otherwise.
>   */
>  bool drm_scdc_get_scrambling_status(struct i2c_adapter *adapter)
>  {
>  	u8 status;
>  	int ret;
>  
>  	ret = drm_scdc_readb(adapter, SCDC_SCRAMBLER_STATUS, &status);
>  	if (ret < 0) {
>  		DRM_DEBUG_KMS("Failed to read scrambling status: %d\n", ret);
>  		return false;
>  	}
>  
>  	return status & SCDC_SCRAMBLING_STATUS;
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index a95e6a2ac698..8753bab20ce8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -4573,41 +4573,41 @@ static void sanitize_dpll_state(struct drm_i915_private *i915,
>  	if (!pll->on || pll->active_mask)
>  		return;
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "%s enabled but not in use, disabling\n",
>  		    pll->info->name);
>  
>  	pll->info->funcs->disable(i915, pll);
>  	pll->on = false;
>  }
>  
>  void intel_dpll_sanitize_state(struct drm_i915_private *i915)
>  {
>  	int i;
>  
>  	for (i = 0; i < i915->dpll.num_shared_dpll; i++)
>  		sanitize_dpll_state(i915, &i915->dpll.shared_dplls[i]);
>  }
>  
>  /**
> - * intel_shared_dpll_dump_hw_state - write hw_state to dmesg
> + * intel_dpll_dump_hw_state - write hw_state to dmesg
>   * @dev_priv: i915 drm device
>   * @hw_state: hw state to be written to the log
>   *
>   * Write the relevant values in @hw_state to dmesg using drm_dbg_kms.
>   */
>  void intel_dpll_dump_hw_state(struct drm_i915_private *dev_priv,
>  			      const struct intel_dpll_hw_state *hw_state)
>  {
>  	if (dev_priv->dpll.mgr) {
>  		dev_priv->dpll.mgr->dump_hw_state(dev_priv, hw_state);
>  	} else {
>  		/* fallback for platforms that don't use the shared dpll
>  		 * infrastructure
>  		 */
>  		drm_dbg_kms(&dev_priv->drm,
>  			    "dpll_hw_state: dpll: 0x%x, dpll_md: 0x%x, "
>  			    "fp0: 0x%x, fp1: 0x%x\n",
>  			    hw_state->dpll,
>  			    hw_state->dpll_md,
>  			    hw_state->fp0,
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index 6501939929d5..e1a66c8245b8 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -221,41 +221,41 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
>  		__i915_vma_unpin(vma);
>  		if (ret == 0)
>  			ret = __i915_vma_unbind(vma);
>  	}
>  
>  	while (ret == 0 && (node = drm_mm_scan_color_evict(&scan))) {
>  		vma = container_of(node, struct i915_vma, node);
>  
>  		/* If we find any non-objects (!vma), we cannot evict them */
>  		if (vma->node.color != I915_COLOR_UNEVICTABLE)
>  			ret = __i915_vma_unbind(vma);
>  		else
>  			ret = -ENOSPC; /* XXX search failed, try again? */
>  	}
>  
>  	return ret;
>  }
>  
>  /**
> - * i915_gem_evict_for_vma - Evict vmas to make room for binding a new one
> + * i915_gem_evict_for_node - Evict vmas to make room for binding a new one
>   * @vm: address space to evict from
>   * @target: range (and color) to evict for
>   * @flags: additional flags to control the eviction algorithm
>   *
>   * This function will try to evict vmas that overlap the target node.
>   *
>   * To clarify: This is for freeing up virtual address space, not for freeing
>   * memory in e.g. the shrinker.
>   */
>  int i915_gem_evict_for_node(struct i915_address_space *vm,
>  			    struct drm_mm_node *target,
>  			    unsigned int flags)
>  {
>  	LIST_HEAD(eviction_list);
>  	struct drm_mm_node *node;
>  	u64 start = target->start;
>  	u64 end = start + target->size;
>  	struct i915_vma *vma, *next;
>  	int ret = 0;
>  
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index e94976976571..3ced82820483 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -608,41 +608,42 @@ static int append_oa_sample(struct i915_perf_stream *stream,
>  
>  	if ((count - *offset) < header.size)
>  		return -ENOSPC;
>  
>  	buf += *offset;
>  	if (copy_to_user(buf, &header, sizeof(header)))
>  		return -EFAULT;
>  	buf += sizeof(header);
>  
>  	if (sample_flags & SAMPLE_OA_REPORT) {
>  		if (copy_to_user(buf, report, report_size))
>  			return -EFAULT;
>  	}
>  
>  	(*offset) += header.size;
>  
>  	return 0;
>  }
>  
>  /**
> - * Copies all buffered OA reports into userspace read() buffer.
> + * gen8_append_oa_reports - Copies all buffered OA reports into
> + *			    userspace read() buffer.
>   * @stream: An i915-perf stream opened for OA metrics
>   * @buf: destination buffer given by userspace
>   * @count: the number of bytes userspace wants to read
>   * @offset: (inout): the current position for writing into @buf
>   *
>   * Notably any error condition resulting in a short read (-%ENOSPC or
>   * -%EFAULT) will be returned even though one or more records may
>   * have been successfully copied. In this case it's up to the caller
>   * to decide if the error should be squashed before returning to
>   * userspace.
>   *
>   * Note: reports are consumed from the head, and appended to the
>   * tail, so the tail chases the head?... If you think that's mad
>   * and back-to-front you're not alone, but this follows the
>   * Gen PRM naming convention.
>   *
>   * Returns: 0 on success, negative error code on failure.
>   */
>  static int gen8_append_oa_reports(struct i915_perf_stream *stream,
>  				  char __user *buf,
> @@ -900,41 +901,42 @@ static int gen8_oa_read(struct i915_perf_stream *stream,
>  		/*
>  		 * Note: .oa_enable() is expected to re-init the oabuffer and
>  		 * reset GEN8_OASTATUS for us
>  		 */
>  		oastatus = intel_uncore_read(uncore, oastatus_reg);
>  	}
>  
>  	if (oastatus & GEN8_OASTATUS_REPORT_LOST) {
>  		ret = append_oa_status(stream, buf, count, offset,
>  				       DRM_I915_PERF_RECORD_OA_REPORT_LOST);
>  		if (ret)
>  			return ret;
>  		intel_uncore_write(uncore, oastatus_reg,
>  				   oastatus & ~GEN8_OASTATUS_REPORT_LOST);
>  	}
>  
>  	return gen8_append_oa_reports(stream, buf, count, offset);
>  }
>  
>  /**
> - * Copies all buffered OA reports into userspace read() buffer.
> + * gen7_append_oa_reports - Copies all buffered OA reports into
> + *			    userspace read() buffer.
>   * @stream: An i915-perf stream opened for OA metrics
>   * @buf: destination buffer given by userspace
>   * @count: the number of bytes userspace wants to read
>   * @offset: (inout): the current position for writing into @buf
>   *
>   * Notably any error condition resulting in a short read (-%ENOSPC or
>   * -%EFAULT) will be returned even though one or more records may
>   * have been successfully copied. In this case it's up to the caller
>   * to decide if the error should be squashed before returning to
>   * userspace.
>   *
>   * Note: reports are consumed from the head, and appended to the
>   * tail, so the tail chases the head?... If you think that's mad
>   * and back-to-front you're not alone, but this follows the
>   * Gen PRM naming convention.
>   *
>   * Returns: 0 on success, negative error code on failure.
>   */
>  static int gen7_append_oa_reports(struct i915_perf_stream *stream,
>  				  char __user *buf,
> @@ -3210,41 +3212,41 @@ static long i915_perf_config_locked(struct i915_perf_stream *stream,
>  		 * reconfiguration inline from that context. The update
>  		 * will then be ordered with respect to submission on that
>  		 * context.
>  		 *
>  		 * When set globally, we use a low priority kernel context,
>  		 * so it will effectively take effect when idle.
>  		 */
>  		err = emit_oa_config(stream, config, oa_context(stream), NULL);
>  		if (!err)
>  			config = xchg(&stream->oa_config, config);
>  		else
>  			ret = err;
>  	}
>  
>  	i915_oa_config_put(config);
>  
>  	return ret;
>  }
>  
>  /**
> - * i915_perf_ioctl - support ioctl() usage with i915 perf stream FDs
> + * i915_perf_ioctl_locked - support ioctl() usage with i915 perf stream FDs
>   * @stream: An i915 perf stream
>   * @cmd: the ioctl request
>   * @arg: the ioctl data
>   *
>   * Note: The &perf->lock mutex has been taken to serialize
>   * with any non-file-operation driver hooks.
>   *
>   * Returns: zero on success or a negative error code. Returns -EINVAL for
>   * an unknown ioctl request.
>   */
>  static long i915_perf_ioctl_locked(struct i915_perf_stream *stream,
>  				   unsigned int cmd,
>  				   unsigned long arg)
>  {
>  	switch (cmd) {
>  	case I915_PERF_IOCTL_ENABLE:
>  		i915_perf_enable_locked(stream);
>  		return 0;
>  	case I915_PERF_IOCTL_DISABLE:
>  		i915_perf_disable_locked(stream);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index da24c4e8b9fb..b498d474ef9e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -430,41 +430,41 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  			 */
>  			if (bad != s_job)
>  				sched->ops->free_job(s_job);
>  			else
>  				sched->free_guilty = true;
>  		}
>  	}
>  
>  	/*
>  	 * Stop pending timer in flight as we rearm it in  drm_sched_start. This
>  	 * avoids the pending timeout work in progress to fire right away after
>  	 * this TDR finished and before the newly restarted jobs had a
>  	 * chance to complete.
>  	 */
>  	cancel_delayed_work(&sched->work_tdr);
>  }
>  
>  EXPORT_SYMBOL(drm_sched_stop);
>  
>  /**
> - * drm_sched_job_recovery - recover jobs after a reset
> + * drm_sched_start - recover jobs after a reset
>   *
>   * @sched: scheduler instance
>   * @full_recovery: proceed with complete sched restart
>   *
>   */
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  {
>  	struct drm_sched_job *s_job, *tmp;
>  	int r;
>  
>  	/*
>  	 * Locking the list is not required here as the sched thread is parked
>  	 * so no new jobs are being inserted or removed. Also concurrent
>  	 * GPU recovers can't run in parallel.
>  	 */
>  	list_for_each_entry_safe(s_job, tmp, &sched->ring_mirror_list, node) {
>  		struct dma_fence *fence = s_job->s_fence->parent;
>  
>  		atomic_inc(&sched->hw_rq_count);
>  
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 0747614a78f0..f968f389633a 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -47,41 +47,41 @@ to_tfu_job(struct drm_sched_job *sched_job)
>  {
>  	return container_of(sched_job, struct v3d_tfu_job, base.base);
>  }
>  
>  static struct v3d_csd_job *
>  to_csd_job(struct drm_sched_job *sched_job)
>  {
>  	return container_of(sched_job, struct v3d_csd_job, base.base);
>  }
>  
>  static void
>  v3d_job_free(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_job *job = to_v3d_job(sched_job);
>  
>  	drm_sched_job_cleanup(sched_job);
>  	v3d_job_put(job);
>  }
>  
>  /**
> - * Returns the fences that the job depends on, one by one.
> + * v3d_job_dependency - Returns the fences that the job depends on, one by one.
>   *
>   * If placed in the scheduler's .dependency method, the corresponding
>   * .run_job won't be called until all of them have been signaled.
>   */
>  static struct dma_fence *
>  v3d_job_dependency(struct drm_sched_job *sched_job,
>  		   struct drm_sched_entity *s_entity)
>  {
>  	struct v3d_job *job = to_v3d_job(sched_job);
>  
>  	/* XXX: Wait on a fence for switching the GMP if necessary,
>  	 * and then do so.
>  	 */
>  
>  	if (!xa_empty(&job->deps))
>  		return xa_erase(&job->deps, job->last_dep++);
>  
>  	return NULL;
>  }
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index a21a6c53ffcf..469d1b4f2643 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -374,41 +374,41 @@ static struct vc4_bo *vc4_bo_get_from_cache(struct drm_device *dev,
>  		vc4_bo_set_label(&bo->base.base, type);
>  	mutex_unlock(&vc4->bo_lock);
>  	return bo;
>  }
>  
>  static const struct vm_operations_struct vc4_vm_ops = {
>  	.fault = vc4_fault,
>  	.open = drm_gem_vm_open,
>  	.close = drm_gem_vm_close,
>  };
>  
>  static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
>  	.free = vc4_free_object,
>  	.export = vc4_prime_export,
>  	.get_sg_table = drm_gem_cma_prime_get_sg_table,
>  	.vmap = vc4_prime_vmap,
>  	.vm_ops = &vc4_vm_ops,
>  };
>  
>  /**
> - * vc4_gem_create_object - Implementation of driver->gem_create_object.
> + * vc4_create_object - Implementation of driver->gem_create_object.
>   * @dev: DRM device
>   * @size: Size in bytes of the memory the object will reference
>   *
>   * This lets the CMA helpers allocate object structs for us, and keep
>   * our BO stats correct.
>   */
>  struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
>  	struct vc4_bo *bo;
>  
>  	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>  	if (!bo)
>  		return ERR_PTR(-ENOMEM);
>  
>  	bo->madv = VC4_MADV_WILLNEED;
>  	refcount_set(&bo->usecnt, 0);
>  	mutex_init(&bo->madv_lock);
>  	mutex_lock(&vc4->bo_lock);
>  	bo->label = VC4_BO_TYPE_KERNEL;
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 85df04c8e62f..5f47720440fa 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -150,54 +150,54 @@ int drm_atomic_helper_page_flip_target(
>  int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  				       u16 *red, u16 *green, u16 *blue,
>  				       uint32_t size,
>  				       struct drm_modeset_acquire_ctx *ctx);
>  
>  /**
>   * drm_atomic_crtc_for_each_plane - iterate over planes currently attached to CRTC
>   * @plane: the loop cursor
>   * @crtc:  the CRTC whose planes are iterated
>   *
>   * This iterates over the current state, useful (for example) when applying
>   * atomic state after it has been checked and swapped.  To iterate over the
>   * planes which *will* be attached (more useful in code called from
>   * &drm_mode_config_funcs.atomic_check) see
>   * drm_atomic_crtc_state_for_each_plane().
>   */
>  #define drm_atomic_crtc_for_each_plane(plane, crtc) \
>  	drm_for_each_plane_mask(plane, (crtc)->dev, (crtc)->state->plane_mask)
>  
>  /**
> - * drm_crtc_atomic_state_for_each_plane - iterate over attached planes in new state
> + * drm_atomic_crtc_state_for_each_plane - iterate over attached planes in new state
>   * @plane: the loop cursor
>   * @crtc_state: the incoming CRTC state
>   *
>   * Similar to drm_crtc_for_each_plane(), but iterates the planes that will be
>   * attached if the specified state is applied.  Useful during for example
>   * in code called from &drm_mode_config_funcs.atomic_check operations, to
>   * validate the incoming state.
>   */
>  #define drm_atomic_crtc_state_for_each_plane(plane, crtc_state) \
>  	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask)
>  
>  /**
> - * drm_crtc_atomic_state_for_each_plane_state - iterate over attached planes in new state
> + * drm_atomic_crtc_state_for_each_plane_state - iterate over attached planes in new state
>   * @plane: the loop cursor
>   * @plane_state: loop cursor for the plane's state, must be const
>   * @crtc_state: the incoming CRTC state
>   *
>   * Similar to drm_crtc_for_each_plane(), but iterates the planes that will be
>   * attached if the specified state is applied.  Useful during for example
>   * in code called from &drm_mode_config_funcs.atomic_check operations, to
>   * validate the incoming state.
>   *
>   * Compared to just drm_atomic_crtc_state_for_each_plane() this also fills in a
>   * const plane_state. This is useful when a driver just wants to peek at other
>   * active planes on this CRTC, but does not need to change it.
>   */
>  #define drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, crtc_state) \
>  	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)->plane_mask) \
>  		for_each_if ((plane_state = \
>  			      __drm_atomic_get_current_plane_state((crtc_state)->state, \
>  								   plane)))
>  
>  /**
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 928136556174..fcdc58d8b88b 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -67,41 +67,41 @@ enum drm_connector_status {
>  	 * sink device which can be autodetect. For digital outputs like DP or
>  	 * HDMI (which can be realiable probed) this means there's really
>  	 * nothing there. It is driver-dependent whether a connector with this
>  	 * status can be lit up or not.
>  	 */
>  	connector_status_disconnected = 2,
>  	/**
>  	 * @connector_status_unknown: The connector's status could not be
>  	 * reliably detected. This happens when probing would either cause
>  	 * flicker (like load-detection when the connector is in use), or when a
>  	 * hardware resource isn't available (like when load-detection needs a
>  	 * free CRTC). It should be possible to light up the connector with one
>  	 * of the listed fallback modes. For default configuration userspace
>  	 * should only try to light up connectors with unknown status when
>  	 * there's not connector with @connector_status_connected.
>  	 */
>  	connector_status_unknown = 3,
>  };
>  
>  /**
> - * enum drm_connector_registration_status - userspace registration status for
> + * enum drm_connector_registration_state - userspace registration status for
>   * a &drm_connector
>   *
>   * This enum is used to track the status of initializing a connector and
>   * registering it with userspace, so that DRM can prevent bogus modesets on
>   * connectors that no longer exist.
>   */
>  enum drm_connector_registration_state {
>  	/**
>  	 * @DRM_CONNECTOR_INITIALIZING: The connector has just been created,
>  	 * but has yet to be exposed to userspace. There should be no
>  	 * additional restrictions to how the state of this connector may be
>  	 * modified.
>  	 */
>  	DRM_CONNECTOR_INITIALIZING = 0,
>  
>  	/**
>  	 * @DRM_CONNECTOR_REGISTERED: The connector has been fully initialized
>  	 * and registered with sysfs, as such it has been exposed to
>  	 * userspace. There should be no additional restrictions to how the
>  	 * state of this connector may be modified.
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 2c361964aee7..283a93ce4617 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -10,41 +10,41 @@
>  #include <drm/drm_mode_config.h>
>  
>  struct drm_driver;
>  struct drm_minor;
>  struct drm_master;
>  struct drm_device_dma;
>  struct drm_vblank_crtc;
>  struct drm_sg_mem;
>  struct drm_local_map;
>  struct drm_vma_offset_manager;
>  struct drm_vram_mm;
>  struct drm_fb_helper;
>  
>  struct inode;
>  
>  struct pci_dev;
>  struct pci_controller;
>  
>  
>  /**
> - * enum drm_switch_power - power state of drm device
> + * enum switch_power_state - power state of drm device
>   */
>  
>  enum switch_power_state {
>  	/** @DRM_SWITCH_POWER_ON: Power state is ON */
>  	DRM_SWITCH_POWER_ON = 0,
>  
>  	/** @DRM_SWITCH_POWER_OFF: Power state is OFF */
>  	DRM_SWITCH_POWER_OFF = 1,
>  
>  	/** @DRM_SWITCH_POWER_CHANGING: Power state is changing */
>  	DRM_SWITCH_POWER_CHANGING = 2,
>  
>  	/** @DRM_SWITCH_POWER_DYNAMIC_OFF: Suspended */
>  	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
>  };
>  
>  /**
>   * struct drm_device - DRM device structure
>   *
>   * This structure represent a complete card that
> diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
> index 732f32740c86..53c51231b31c 100644
> --- a/include/drm/drm_dsc.h
> +++ b/include/drm/drm_dsc.h
> @@ -256,41 +256,42 @@ struct drm_dsc_config {
>  	bool native_420;
>  	/**
>  	 * @second_line_bpg_offset:
>  	 * Additional bits/grp for seconnd line of slice for native 4:2:0
>  	 */
>  	u8 second_line_bpg_offset;
>  	/**
>  	 * @nsl_bpg_offset:
>  	 * Num of bits deallocated for each grp that is not in second line of
>  	 * slice
>  	 */
>  	u16 nsl_bpg_offset;
>  	/**
>  	 * @second_line_offset_adj:
>  	 * Offset adjustment for second line in Native 4:2:0 mode
>  	 */
>  	u16 second_line_offset_adj;
>  };
>  
>  /**
> - * struct picture_parameter_set - Represents 128 bytes of Picture Parameter Set
> + * struct drm_dsc_picture_parameter_set - Represents 128 bytes of
> + * 	Picture Parameter Set
>   *
>   * The VESA DSC standard defines picture parameter set (PPS) which display
>   * stream compression encoders must communicate to decoders.
>   * The PPS is encapsulated in 128 bytes (PPS 0 through PPS 127). The fields in
>   * this structure are as per Table 4.1 in Vesa DSC specification v1.1/v1.2.
>   * The PPS fields that span over more than a byte should be stored in Big Endian
>   * format.
>   */
>  struct drm_dsc_picture_parameter_set {
>  	/**
>  	 * @dsc_version:
>  	 * PPS0[3:0] - dsc_version_minor: Contains Minor version of DSC
>  	 * PPS0[7:4] - dsc_version_major: Contains major version of DSC
>  	 */
>  	u8 dsc_version;
>  	/**
>  	 * @pps_identifier:
>  	 * PPS1[7:0] - Application specific identifier that can be
>  	 * used to differentiate between different PPS tables.
>  	 */
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index c0d28ba0f5c9..a4bac02249c2 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -49,54 +49,54 @@ struct vm_area_struct;
>   * drm_gem_vram_vmap() and drm_gem_vram_vunmap().
>   */
>  struct drm_gem_vram_object {
>  	struct ttm_buffer_object bo;
>  	struct dma_buf_map map;
>  
>  	/**
>  	 * @vmap_use_count:
>  	 *
>  	 * Reference count on the virtual address.
>  	 * The address are un-mapped when the count reaches zero.
>  	 */
>  	unsigned int vmap_use_count;
>  
>  	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
>  	struct ttm_placement placement;
>  	struct ttm_place placements[2];
>  };
>  
>  /**
> - * Returns the container of type &struct drm_gem_vram_object
> - * for field bo.
> + * drm_gem_vram_of_bo - Returns the container of type
> + * &struct drm_gem_vram_object for field bo.
>   * @bo:		the VRAM buffer object
>   * Returns:	The containing GEM VRAM object
>   */
>  static inline struct drm_gem_vram_object *drm_gem_vram_of_bo(
>  	struct ttm_buffer_object *bo)
>  {
>  	return container_of(bo, struct drm_gem_vram_object, bo);
>  }
>  
>  /**
> - * Returns the container of type &struct drm_gem_vram_object
> - * for field gem.
> + * drm_gem_vram_of_gem - Returns the container of type
> + * &struct drm_gem_vram_object for field gem.
>   * @gem:	the GEM object
>   * Returns:	The containing GEM VRAM object
>   */
>  static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
>  	struct drm_gem_object *gem)
>  {
>  	return container_of(gem, struct drm_gem_vram_object, bo.base);
>  }
>  
>  struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  						size_t size,
>  						unsigned long pg_align);
>  void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
>  u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>  s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
>  int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
>  int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
>  void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
