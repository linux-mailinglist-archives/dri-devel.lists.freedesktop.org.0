Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D257E212BD4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 20:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9C86E1BD;
	Thu,  2 Jul 2020 18:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281C26E1BD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 18:01:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 17so29285913wmo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 11:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=RIjG+5LQGQcFu7D8oJZkGzjEa2b+1Xzo/wrcAYIaaNI=;
 b=TMxpbhwRAD021zYAeZBmqvbgMXODG0FL6IZtqeh6OmJ1/swzjI3ChqrpWCBB/QvNby
 b24noOkeI4xKpUyClciITGg4A/mkuavsvxcmsyGTLU34jm26y7EHCP36v9la1IJv7OqP
 aWtHhvrlVgDuHd3At7wrU/xn73Sk6v0YsUdPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=RIjG+5LQGQcFu7D8oJZkGzjEa2b+1Xzo/wrcAYIaaNI=;
 b=OB3zQSpOtDoPWpfQAwitCdkIyWFU4JKa2gJ4c2bbXUMMrLrLXSJwvWwLbDOPaY3eYP
 LeQ1gu44y/0yI30Kauq929W31I0SwY0pF0NkhhfaaVr9oKXVypFcpRgUAto1wVFFjTV5
 QMAI9uV+ti3mOc/RfuJRrRKMw5MSxYK2YQy693IgcjN1xT1HNJPegfHpErIGcaRCHPdd
 WyLZBRfTNYlFWLvGcfQlApCXo941hPwPC0Vf7KhYcKjceFRdmqMT/X76RCEJus08kMW3
 dsm6ALX2T537y2UcERfo89yuC6DHfCVuKtZhrXdRC+/bgcGjmUkuLroc02L6OznOSee2
 AeYA==
X-Gm-Message-State: AOAM53232VNNsPSfLX+ng8N6BF8/ssF171K89lH6TCK0wDgWzkUJPyB8
 D4h8wRVGkQki0CBtgs+5QyLHyA==
X-Google-Smtp-Source: ABdhPJzece0LCUc5F/hZdM/7kgNjxvWmh4GLShjhi83t4YnYUJx5Eg1HMVsNgU/qfk3jOdaWQyDnMg==
X-Received: by 2002:a7b:c116:: with SMTP id w22mr31555076wmi.97.1593712911471; 
 Thu, 02 Jul 2020 11:01:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f16sm11052885wmf.17.2020.07.02.11.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:01:50 -0700 (PDT)
Date: Thu, 2 Jul 2020 20:01:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [PATCH] drm : Insert blank lines after declarations.
Message-ID: <20200702180148.GA3278063@phenom.ffwll.local>
Mail-Followup-To: Suraj Upadhyay <usuraj35@gmail.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200702131749.GA25710@blackclown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702131749.GA25710@blackclown>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 06:53:32PM +0530, Suraj Upadhyay wrote:
> Resolve checkpatch issues for missing blank lines after declarations.
> Issues found in multiple files with checkpatch.pl.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
> Contributor comments : Hii developers, I am a new contributor to linux
> kernel. This email is over 600 lines however the changes are very small.
> Please, tell me if I should send the changes in a patchset.

Generally it's better to split up patches a bit, this way if there's a
conflict due to ongoing other work all the other pieces can be merged
already.

Anyway it looks like you're extremely lucky, no conflicts even for such a
big patch that applies to tons of files. So I went ahead and applied it to
drm-misc-next.

Cheers, Daniel

> 
>  drivers/gpu/drm/drm_atomic.c          |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c     |  7 +++++++
>  drivers/gpu/drm/drm_bufs.c            |  6 ++++++
>  drivers/gpu/drm/drm_connector.c       |  2 ++
>  drivers/gpu/drm/drm_crtc.c            |  1 +
>  drivers/gpu/drm/drm_crtc_helper.c     |  3 +++
>  drivers/gpu/drm/drm_dp_helper.c       |  1 +
>  drivers/gpu/drm/drm_dp_mst_topology.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c            | 17 +++++++++++++++++
>  drivers/gpu/drm/drm_file.c            |  2 ++
>  drivers/gpu/drm/drm_framebuffer.c     |  1 +
>  drivers/gpu/drm/drm_ioc32.c           |  2 ++
>  drivers/gpu/drm/drm_lease.c           |  4 ++++
>  drivers/gpu/drm/drm_lock.c            |  1 +
>  drivers/gpu/drm/drm_mode_config.c     |  1 +
>  drivers/gpu/drm/drm_pci.c             |  1 +
>  drivers/gpu/drm/drm_plane.c           |  1 +
>  drivers/gpu/drm/drm_prime.c           |  1 +
>  drivers/gpu/drm/drm_syncobj.c         |  1 +
>  drivers/gpu/drm/drm_vblank.c          |  1 +
>  20 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 965173fd0ac2..58527f151984 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -575,6 +575,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  					   fb->modifier);
>  	if (ret) {
>  		struct drm_format_name_buf format_name;
> +
>  		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] invalid pixel format %s, modifier 0x%llx\n",
>  				 plane->base.id, plane->name,
>  				 drm_get_format_name(fb->format->format,
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index a1e5e262bae2..25c269bc4681 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -522,6 +522,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  
>  	if (property == config->prop_fb_id) {
>  		struct drm_framebuffer *fb;
> +
>  		fb = drm_framebuffer_lookup(dev, file_priv, val);
>  		drm_atomic_set_fb_for_plane(state, fb);
>  		if (fb)
> @@ -539,6 +540,7 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  
>  	} else if (property == config->prop_crtc_id) {
>  		struct drm_crtc *crtc = drm_crtc_find(dev, file_priv, val);
> +
>  		if (val && !crtc)
>  			return -EACCES;
>  		return drm_atomic_set_crtc_for_plane(state, crtc);
> @@ -681,6 +683,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  
>  	if (property == config->prop_crtc_id) {
>  		struct drm_crtc *crtc = drm_crtc_find(dev, file_priv, val);
> +
>  		if (val && !crtc)
>  			return -EACCES;
>  		return drm_atomic_set_crtc_for_connector(state, crtc);
> @@ -754,6 +757,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  	} else if (property == config->writeback_fb_id_property) {
>  		struct drm_framebuffer *fb;
>  		int ret;
> +
>  		fb = drm_framebuffer_lookup(dev, file_priv, val);
>  		ret = drm_atomic_set_writeback_fb_for_connector(state, fb);
>  		if (fb)
> @@ -861,6 +865,7 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>  	switch (obj->type) {
>  	case DRM_MODE_OBJECT_CONNECTOR: {
>  		struct drm_connector *connector = obj_to_connector(obj);
> +
>  		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
>  		ret = drm_atomic_connector_get_property(connector,
>  				connector->state, property, val);
> @@ -868,6 +873,7 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>  	}
>  	case DRM_MODE_OBJECT_CRTC: {
>  		struct drm_crtc *crtc = obj_to_crtc(obj);
> +
>  		WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
>  		ret = drm_atomic_crtc_get_property(crtc,
>  				crtc->state, property, val);
> @@ -875,6 +881,7 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
>  	}
>  	case DRM_MODE_OBJECT_PLANE: {
>  		struct drm_plane *plane = obj_to_plane(obj);
> +
>  		WARN_ON(!drm_modeset_is_locked(&plane->mutex));
>  		ret = drm_atomic_plane_get_property(plane,
>  				plane->state, property, val);
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index ef26ac57f039..a0735fbc144b 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -53,6 +53,7 @@ static struct drm_map_list *drm_find_matching_map(struct drm_device *dev,
>  						  struct drm_local_map *map)
>  {
>  	struct drm_map_list *entry;
> +
>  	list_for_each_entry(entry, &dev->maplist, head) {
>  		/*
>  		 * Because the kernel-userspace ABI is fixed at a 32-bit offset
> @@ -102,6 +103,7 @@ static int drm_map_handle(struct drm_device *dev, struct drm_hash_item *hash,
>  
>  	if (!use_hashed_handle) {
>  		int ret;
> +
>  		hash->key = user_token >> PAGE_SHIFT;
>  		ret = drm_ht_insert_item(&dev->map_hash, hash);
>  		if (ret != -EINVAL)
> @@ -391,6 +393,7 @@ struct drm_local_map *drm_legacy_findmap(struct drm_device *dev,
>  					 unsigned int token)
>  {
>  	struct drm_map_list *_entry;
> +
>  	list_for_each_entry(_entry, &dev->maplist, head)
>  		if (_entry->user_token == token)
>  			return _entry->map;
> @@ -1323,6 +1326,7 @@ int __drm_legacy_infobufs(struct drm_device *dev,
>  	if (*p >= count) {
>  		for (i = 0, count = 0; i < DRM_MAX_ORDER + 1; i++) {
>  			struct drm_buf_entry *from = &dma->bufs[i];
> +
>  			if (from->buf_count) {
>  				if (f(data, count, from) < 0)
>  					return -EFAULT;
> @@ -1359,6 +1363,7 @@ int drm_legacy_infobufs(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv)
>  {
>  	struct drm_buf_info *request = data;
> +
>  	return __drm_legacy_infobufs(dev, data, &request->count, copy_one_buf);
>  }
>  
> @@ -1570,6 +1575,7 @@ int drm_legacy_mapbufs(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv)
>  {
>  	struct drm_buf_map *request = data;
> +
>  	return __drm_legacy_mapbufs(dev, data, &request->count,
>  				    &request->virtual, map_one_buf,
>  				    file_priv);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d877ddc6dc57..678733305aca 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2368,6 +2368,7 @@ static void drm_tile_group_free(struct kref *kref)
>  {
>  	struct drm_tile_group *tg = container_of(kref, struct drm_tile_group, refcount);
>  	struct drm_device *dev = tg->dev;
> +
>  	mutex_lock(&dev->mode_config.idr_mutex);
>  	idr_remove(&dev->mode_config.tile_idr, tg->id);
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> @@ -2403,6 +2404,7 @@ struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *dev,
>  {
>  	struct drm_tile_group *tg;
>  	int id;
> +
>  	mutex_lock(&dev->mode_config.idr_mutex);
>  	idr_for_each_entry(&dev->mode_config.tile_idr, tg, id) {
>  		if (!memcmp(tg->group_data, topology, 8)) {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 4936e1080e41..3451dd016713 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -629,6 +629,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  							   fb->modifier);
>  			if (ret) {
>  				struct drm_format_name_buf format_name;
> +
>  				DRM_DEBUG_KMS("Invalid pixel format %s, modifier 0x%llx\n",
>  					      drm_get_format_name(fb->format->format,
>  								  &format_name),
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index a4d36aca45ea..bff917531f33 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -185,6 +185,7 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
>  
>  	drm_for_each_crtc(crtc, dev) {
>  		const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
> +
>  		crtc->enabled = drm_helper_crtc_in_use(crtc);
>  		if (!crtc->enabled) {
>  			if (crtc_funcs->disable)
> @@ -884,6 +885,7 @@ int drm_helper_connector_dpms(struct drm_connector *connector, int mode)
>  	if (mode < old_dpms) {
>  		if (crtc) {
>  			const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
> +
>  			if (crtc_funcs->dpms)
>  				(*crtc_funcs->dpms) (crtc,
>  						     drm_helper_choose_crtc_dpms(crtc));
> @@ -898,6 +900,7 @@ int drm_helper_connector_dpms(struct drm_connector *connector, int mode)
>  			drm_helper_encoder_dpms(encoder, encoder_dpms);
>  		if (crtc) {
>  			const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
> +
>  			if (crtc_funcs->dpms)
>  				(*crtc_funcs->dpms) (crtc,
>  						     drm_helper_choose_crtc_dpms(crtc));
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 19c99dddcb99..6aea968aad44 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -57,6 +57,7 @@ static u8 dp_get_lane_status(const u8 link_status[DP_LINK_STATUS_SIZE],
>  	int i = DP_LANE0_1_STATUS + (lane >> 1);
>  	int s = (lane & 1) * 4;
>  	u8 l = dp_link_status(link_status, i);
> +
>  	return (l >> s) & 0xf;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1e26b89628f9..c9b99e0fd12a 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -259,6 +259,7 @@ static u8 drm_dp_msg_data_crc4(const uint8_t *data, u8 number_of_bytes)
>  static inline u8 drm_dp_calc_sb_hdr_size(struct drm_dp_sideband_msg_hdr *hdr)
>  {
>  	u8 size = 3;
> +
>  	size += (hdr->lct / 2);
>  	return size;
>  }
> @@ -269,6 +270,7 @@ static void drm_dp_encode_sideband_msg_hdr(struct drm_dp_sideband_msg_hdr *hdr,
>  	int idx = 0;
>  	int i;
>  	u8 crc4;
> +
>  	buf[idx++] = ((hdr->lct & 0xf) << 4) | (hdr->lcr & 0xf);
>  	for (i = 0; i < (hdr->lct / 2); i++)
>  		buf[idx++] = hdr->rad[i];
> @@ -289,6 +291,7 @@ static bool drm_dp_decode_sideband_msg_hdr(struct drm_dp_sideband_msg_hdr *hdr,
>  	u8 len;
>  	int i;
>  	u8 idx;
> +
>  	if (buf[0] == 0)
>  		return false;
>  	len = 3;
> @@ -326,6 +329,7 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
>  	int idx = 0;
>  	int i;
>  	u8 *buf = raw->msg;
> +
>  	buf[idx++] = req->req_type & 0x7f;
>  
>  	switch (req->req_type) {
> @@ -673,6 +677,7 @@ drm_dp_mst_dump_sideband_msg_tx(struct drm_printer *p,
>  static void drm_dp_crc_sideband_chunk_req(u8 *msg, u8 len)
>  {
>  	u8 crc4;
> +
>  	crc4 = drm_dp_msg_data_crc4(msg, len);
>  	msg[len] = crc4;
>  }
> @@ -747,6 +752,7 @@ static bool drm_dp_sideband_parse_link_address(struct drm_dp_sideband_msg_rx *ra
>  {
>  	int idx = 1;
>  	int i;
> +
>  	memcpy(repmsg->u.link_addr.guid, &raw->msg[idx], 16);
>  	idx += 16;
>  	repmsg->u.link_addr.nports = raw->msg[idx] & 0xf;
> @@ -798,6 +804,7 @@ static bool drm_dp_sideband_parse_remote_dpcd_read(struct drm_dp_sideband_msg_rx
>  						   struct drm_dp_sideband_msg_reply_body *repmsg)
>  {
>  	int idx = 1;
> +
>  	repmsg->u.remote_dpcd_read_ack.port_number = raw->msg[idx] & 0xf;
>  	idx++;
>  	if (idx > raw->curlen)
> @@ -818,6 +825,7 @@ static bool drm_dp_sideband_parse_remote_dpcd_write(struct drm_dp_sideband_msg_r
>  						      struct drm_dp_sideband_msg_reply_body *repmsg)
>  {
>  	int idx = 1;
> +
>  	repmsg->u.remote_dpcd_write_ack.port_number = raw->msg[idx] & 0xf;
>  	idx++;
>  	if (idx > raw->curlen)
> @@ -851,6 +859,7 @@ static bool drm_dp_sideband_parse_enum_path_resources_ack(struct drm_dp_sideband
>  							  struct drm_dp_sideband_msg_reply_body *repmsg)
>  {
>  	int idx = 1;
> +
>  	repmsg->u.path_resources.port_number = (raw->msg[idx] >> 4) & 0xf;
>  	repmsg->u.path_resources.fec_capable = raw->msg[idx] & 0x1;
>  	idx++;
> @@ -874,6 +883,7 @@ static bool drm_dp_sideband_parse_allocate_payload_ack(struct drm_dp_sideband_ms
>  							  struct drm_dp_sideband_msg_reply_body *repmsg)
>  {
>  	int idx = 1;
> +
>  	repmsg->u.allocate_payload.port_number = (raw->msg[idx] >> 4) & 0xf;
>  	idx++;
>  	if (idx > raw->curlen)
> @@ -896,6 +906,7 @@ static bool drm_dp_sideband_parse_query_payload_ack(struct drm_dp_sideband_msg_r
>  						    struct drm_dp_sideband_msg_reply_body *repmsg)
>  {
>  	int idx = 1;
> +
>  	repmsg->u.query_payload.port_number = (raw->msg[idx] >> 4) & 0xf;
>  	idx++;
>  	if (idx > raw->curlen)
> @@ -1082,6 +1093,7 @@ static void build_allocate_payload(struct drm_dp_sideband_msg_tx *msg,
>  				   u8 *sdp_stream_sink)
>  {
>  	struct drm_dp_sideband_msg_req_body req;
> +
>  	memset(&req, 0, sizeof(req));
>  	req.req_type = DP_ALLOCATE_PAYLOAD;
>  	req.u.allocate_payload.port_number = port_num;
> @@ -1142,6 +1154,7 @@ static void drm_dp_mst_put_payload_id(struct drm_dp_mst_topology_mgr *mgr,
>  				      int vcpi)
>  {
>  	int i;
> +
>  	if (vcpi == 0)
>  		return;
>  
> @@ -1913,6 +1926,7 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_port *port,
>  	int parent_lct = port->parent->lct;
>  	int shift = 4;
>  	int idx = (parent_lct - 1) / 2;
> +
>  	if (parent_lct > 1) {
>  		memcpy(rad, port->parent->rad, idx + 1);
>  		shift = (parent_lct % 2) ? 4 : 0;
> @@ -2091,10 +2105,12 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
>  {
>  	int i;
>  	char temp[8];
> +
>  	snprintf(proppath, proppath_size, "mst:%d", mstb->mgr->conn_base_id);
>  	for (i = 0; i < (mstb->lct - 1); i++) {
>  		int shift = (i % 2) ? 0 : 4;
>  		int port_num = (mstb->rad[i / 2] >> shift) & 0xf;
> +
>  		snprintf(temp, sizeof(temp), "-%d", port_num);
>  		strlcat(proppath, temp, proppath_size);
>  	}
> @@ -3130,6 +3146,7 @@ static int drm_dp_create_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
>  				       struct drm_dp_payload *payload)
>  {
>  	int ret;
> +
>  	ret = drm_dp_payload_send_msg(mgr, port, id, port->vcpi.pbn);
>  	if (ret < 0)
>  		return ret;
> @@ -3286,6 +3303,7 @@ int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
>  	struct drm_dp_mst_port *port;
>  	int i;
>  	int ret = 0;
> +
>  	mutex_lock(&mgr->payload_lock);
>  	for (i = 0; i < mgr->max_payloads; i++) {
>  
> @@ -3751,6 +3769,7 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
>  	/* Were we actually expecting a response, and from this mstb? */
>  	if (!txmsg || txmsg->dst != mstb) {
>  		struct drm_dp_sideband_msg_hdr *hdr;
> +
>  		hdr = &msg->initial_hdr;
>  		DRM_DEBUG_KMS("Got MST reply with no msg %p %d %d %02x %02x\n",
>  			      mstb, hdr->seqno, hdr->lct, hdr->rad[0],
> @@ -4298,6 +4317,7 @@ EXPORT_SYMBOL(drm_dp_mst_allocate_vcpi);
>  int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port)
>  {
>  	int slots = 0;
> +
>  	port = drm_dp_mst_topology_get_port_validated(mgr, port);
>  	if (!port)
>  		return slots;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index fed653f13c26..d2f36a1fcb95 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1641,6 +1641,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
>  
>  	if (block == 0) {
>  		int score = drm_edid_header_is_valid(raw_edid);
> +
>  		if (score == 8) {
>  			if (edid_corrupt)
>  				*edid_corrupt = false;
> @@ -2190,6 +2191,7 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>  
>  	for (i = 0; i < ARRAY_SIZE(drm_dmt_modes); i++) {
>  		const struct drm_display_mode *ptr = &drm_dmt_modes[i];
> +
>  		if (hsize != ptr->hdisplay)
>  			continue;
>  		if (vsize != ptr->vdisplay)
> @@ -2261,6 +2263,7 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
>  
>  	for (i = 1; i <= raw_edid[0x7e]; i++) {
>  		u8 *ext = raw_edid + (i * EDID_LENGTH);
> +
>  		switch (*ext) {
>  		case CEA_EXT:
>  			cea_for_each_detailed_block(ext, cb, closure);
> @@ -2292,6 +2295,7 @@ drm_monitor_supports_rb(struct edid *edid)
>  {
>  	if (edid->revision >= 4) {
>  		bool ret = false;
> +
>  		drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
>  		return ret;
>  	}
> @@ -2316,6 +2320,7 @@ static int
>  drm_gtf2_hbreak(struct edid *edid)
>  {
>  	u8 *r = NULL;
> +
>  	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
>  	return r ? (r[12] * 2) : 0;
>  }
> @@ -2324,6 +2329,7 @@ static int
>  drm_gtf2_2c(struct edid *edid)
>  {
>  	u8 *r = NULL;
> +
>  	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
>  	return r ? r[13] : 0;
>  }
> @@ -2332,6 +2338,7 @@ static int
>  drm_gtf2_m(struct edid *edid)
>  {
>  	u8 *r = NULL;
> +
>  	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
>  	return r ? (r[15] << 8) + r[14] : 0;
>  }
> @@ -2340,6 +2347,7 @@ static int
>  drm_gtf2_k(struct edid *edid)
>  {
>  	u8 *r = NULL;
> +
>  	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
>  	return r ? r[16] : 0;
>  }
> @@ -2348,6 +2356,7 @@ static int
>  drm_gtf2_2j(struct edid *edid)
>  {
>  	u8 *r = NULL;
> +
>  	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
>  	return r ? r[17] : 0;
>  }
> @@ -2800,6 +2809,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, struct edid *edid,
>  
>  	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
>  		const struct minimode *m = &extra_modes[i];
> +
>  		newmode = drm_gtf_mode(dev, m->w, m->h, m->r, 0, 0);
>  		if (!newmode)
>  			return modes;
> @@ -2829,6 +2839,7 @@ drm_cvt_modes_for_range(struct drm_connector *connector, struct edid *edid,
>  
>  	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
>  		const struct minimode *m = &extra_modes[i];
> +
>  		newmode = drm_cvt_mode(dev, m->w, m->h, m->r, rb, 0, 0);
>  		if (!newmode)
>  			return modes;
> @@ -2964,6 +2975,7 @@ add_established_modes(struct drm_connector *connector, struct edid *edid)
>  	for (i = 0; i <= EDID_EST_TIMINGS; i++) {
>  		if (est_bits & (1<<i)) {
>  			struct drm_display_mode *newmode;
> +
>  			newmode = drm_mode_duplicate(dev, &edid_est_modes[i]);
>  			if (newmode) {
>  				drm_mode_probed_add(connector, newmode);
> @@ -3052,6 +3064,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
>  
>  	for (i = 0; i < 4; i++) {
>  		int uninitialized_var(width), height;
> +
>  		cvt = &(timing->data.other_data.data.cvt[i]);
>  
>  		if (!memcmp(cvt->code, empty, 3))
> @@ -3696,6 +3709,7 @@ do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  
>  	for (i = 0; i < len; i++) {
>  		struct drm_display_mode *mode;
> +
>  		mode = drm_display_mode_from_vic_index(connector, db, len, i);
>  		if (mode) {
>  			/*
> @@ -4537,6 +4551,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
>  
>  		if (cea_db_tag(db) == AUDIO_BLOCK) {
>  			int j;
> +
>  			dbl = cea_db_payload_len(db);
>  
>  			count = dbl / 3; /* SAD is 3B */
> @@ -5140,6 +5155,7 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
>  	unsigned vsync_width = (timings->vsw[0] | timings->vsw[1] << 8) + 1;
>  	bool hsync_positive = (timings->hsync[1] >> 7) & 0x1;
>  	bool vsync_positive = (timings->vsync[1] >> 7) & 0x1;
> +
>  	mode = drm_mode_create(dev);
>  	if (!mode)
>  		return NULL;
> @@ -5322,6 +5338,7 @@ int drm_add_modes_noedid(struct drm_connector *connector,
>  
>  	for (i = 0; i < count; i++) {
>  		const struct drm_display_mode *ptr = &drm_dmt_modes[i];
> +
>  		if (hdisplay && vdisplay) {
>  			/*
>  			 * Only when two are valid, they will be used to check
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 2f12b8c1d01c..f40b83a95eab 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -373,6 +373,7 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
>  	 */
>  	if (!dev->hose) {
>  		struct pci_dev *pci_dev;
> +
>  		pci_dev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
>  		if (pci_dev) {
>  			dev->hose = pci_dev->sysdata;
> @@ -756,6 +757,7 @@ void drm_event_cancel_free(struct drm_device *dev,
>  			   struct drm_pending_event *p)
>  {
>  	unsigned long flags;
> +
>  	spin_lock_irqsave(&dev->event_lock, flags);
>  	if (p->file_priv) {
>  		p->file_priv->event_space += p->event->length;
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 0375b3d7f8d0..df656366a530 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -1110,6 +1110,7 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
>  	if (drm_framebuffer_read_refcount(fb) > 1) {
>  		if (drm_drv_uses_atomic_modeset(dev)) {
>  			int ret = atomic_remove_fb(fb);
> +
>  			WARN(ret, "atomic remove_fb failed with %i\n", ret);
>  		} else
>  			legacy_remove_fb(fb);
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index 22c7fd7196c8..09791f782f03 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -388,6 +388,7 @@ static int drm_legacy_infobufs32(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv)
>  {
>  	drm_buf_info32_t *request = data;
> +
>  	return __drm_legacy_infobufs(dev, data, &request->count, copy_one_buf32);
>  }
>  
> @@ -813,6 +814,7 @@ static int compat_drm_update_draw(struct file *file, unsigned int cmd,
>  				  unsigned long arg)
>  {
>  	drm_update_draw32_t update32;
> +
>  	if (copy_from_user(&update32, (void __user *)arg, sizeof(update32)))
>  		return -EFAULT;
>  
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 825abe38201a..da4f085fc09e 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -166,8 +166,10 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  		if (_drm_lease_held_master(master, crtc->base.id)) {
>  			uint32_t mask_in = 1ul << count_in;
> +
>  			if ((crtcs_in & mask_in) != 0) {
>  				uint32_t mask_out = 1ul << count_out;
> +
>  				crtcs_out |= mask_out;
>  			}
>  			count_out++;
> @@ -423,6 +425,7 @@ static int fill_object_idr(struct drm_device *dev,
>  	for (o = 0; o < object_count; o++) {
>  		struct drm_mode_object *obj = objects[o];
>  		u32 object_id = objects[o]->id;
> +
>  		DRM_DEBUG_LEASE("Adding object %d to lease\n", object_id);
>  
>  		/*
> @@ -441,6 +444,7 @@ static int fill_object_idr(struct drm_device *dev,
>  		}
>  		if (obj->type == DRM_MODE_OBJECT_CRTC && !universal_planes) {
>  			struct drm_crtc *crtc = obj_to_crtc(obj);
> +
>  			ret = idr_alloc(leases, &drm_lease_idr_object, crtc->primary->base.id, crtc->primary->base.id + 1, GFP_KERNEL);
>  			if (ret < 0) {
>  				DRM_DEBUG_LEASE("Object primary plane %d cannot be inserted into leases (%d)\n",
> diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
> index f16eefbf2829..1efbd5389d89 100644
> --- a/drivers/gpu/drm/drm_lock.c
> +++ b/drivers/gpu/drm/drm_lock.c
> @@ -330,6 +330,7 @@ static int drm_legacy_i_have_hw_lock(struct drm_device *dev,
>  				     struct drm_file *file_priv)
>  {
>  	struct drm_master *master = file_priv->master;
> +
>  	return (file_priv->lock_count && master->lock.hw_lock &&
>  		_DRM_LOCK_IS_HELD(master->lock.hw_lock->lock) &&
>  		master->lock.file_priv == file_priv);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 5761f838a057..f1affc1bb679 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -538,6 +538,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  	WARN_ON(!list_empty(&dev->mode_config.fb_list));
>  	list_for_each_entry_safe(fb, fbt, &dev->mode_config.fb_list, head) {
>  		struct drm_printer p = drm_debug_printer("[leaked fb]");
> +
>  		drm_printf(&p, "framebuffer[%u]:\n", fb->base.id);
>  		drm_framebuffer_print_info(&p, 1, fb);
>  		drm_framebuffer_free(&fb->base.refcount);
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 75e2b7053f35..c250fb5a88ca 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -298,6 +298,7 @@ EXPORT_SYMBOL(drm_legacy_pci_init);
>  void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
>  {
>  	struct drm_device *dev, *tmp;
> +
>  	DRM_DEBUG("\n");
>  
>  	if (!(driver->driver_features & DRIVER_LEGACY)) {
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 4af173ced327..b7b90b3a2e38 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -216,6 +216,7 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
>  
>  	if (format_modifiers) {
>  		const uint64_t *temp_modifiers = format_modifiers;
> +
>  		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
>  			format_modifier_count++;
>  	}
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 282774e469ac..d66edc53f1ac 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -1014,6 +1014,7 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>  {
>  	struct dma_buf_attachment *attach;
>  	struct dma_buf *dma_buf;
> +
>  	attach = obj->import_attach;
>  	if (sg)
>  		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 42d46414f767..3bf73971daf3 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1188,6 +1188,7 @@ static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
>  				   uint32_t count)
>  {
>  	uint32_t i;
> +
>  	for (i = 0; i < count; i++)
>  		drm_syncobj_put(syncobjs[i]);
>  	kfree(syncobjs);
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 2d5ce690d214..aef3fcb0f12c 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1614,6 +1614,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>  	e->event.vbl.crtc_id = 0;
>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>  		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
> +
>  		if (crtc)
>  			e->event.vbl.crtc_id = crtc->base.id;
>  	}
> -- 
> 2.17.1
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
