Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88D4D0390
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD110E047;
	Mon,  7 Mar 2022 15:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 434 seconds by postgrey-1.36 at gabe;
 Mon, 07 Mar 2022 15:58:10 UTC
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com
 [203.205.221.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1164610E047
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646668687;
 bh=G82lazBOx7DFY/zMCCyXrCilpaNxKFxTYmuMePU5tEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=a0v48sRwwA4+od6BaTpU9woS0/hNvNj9izOwCLlk571Z+Z/QfD5RWZ3hfOyS6cyzy
 7TwWQQ/FbMDLGt4nv+J2599agLjJ8znpUCNMhYNr8rvdevfZVKjeBsAq0H50bAUpPK
 iiFsCHcs3NyqT0N3/AbYYu7xvk5io3g/VlBV60bY=
Received: from localhost.localdomain ([111.193.130.237])
 by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
 id CAC2A825; Mon, 07 Mar 2022 23:50:44 +0800
X-QQ-mid: xmsmtpt1646668244t9rz4uo6a
Message-ID: <tencent_8D468E4512625A79304E1722C87490BFED09@qq.com>
X-QQ-XMAILINFO: NfMab3Cum/2cda1K3R/kl8BWW20+Yor0jHlUrAchyQQav/PBUPafDIROa8k1hl
 sNTtpSIThcoIuFuU619zGZ7DwSlX7XH2GUWyCjE4S9CBRil1NtTgwFAiejs6lFrAbcRC5+zG28+N
 hgPnltyz7ihySv4qgQYgZkRmyhuaNVUYhg6ryUfB4NrLwmklRVkNlCvE9imO0HCTA/o3QGMWDc4I
 pmjpTrGWJjzkrLLp3aEYIn66y2rb9qchlgDA40ZdzDdsPgsgAH7ZejqSKM+prJNT25qbVDQXCOKS
 YqSppvOHTg88yVU0RjQ4wyamt6vC8+MGaCh8pWxwcH49ZiD6S82uUVL8C2dQAL8ivgI8ZObyEJPS
 zI5ymaOlueVdpvSHgXXun1QGUJxZwNZC+5oWNMKQyQY2Q+crYyU0nhfMItkZAa2QxvxOzOj0p3Ym
 eCGnQLGTuJNbyJ5okvdmBMXw7RH+QCgJmZVZVQYa1jG5QZoIX1zRdoHHFeni9rQHMUfrShGpaOMJ
 zghXpc5zpCoLNJ/lRfeKEumpJtHr1ECPYQMrItfYS73uTStdk6xkn9IpxrxOuvwm3Jv7xniMTliL
 gCBf6rHXypNgnYS/krLq1La7fiOkLWXb3w1FrTkmKphpkoPsu4cFGNiNsltz0GRbZ3/PJ6DooG6d
 3JNZ6UK4cTcHfmwH9KETMFqR9M/06SMxWxREDbALcdAtyXxHxPG4KK6v06Ub9Fja8nxnFpoNTW5g
 +LZJ1vvs+vB6dkeYI7Pm+799yzLI9iYM2gDWwwcjLuK+329yuSjI2DB3/BoufNrAWt8GQjq0Z0qy
 KLyO2hGS9MFZb9EDtNgwNI/FwpgAkxK0JkDCizaub/FWpLwE94aO0vLByXcqkrVQtHb4Wa5C2/Ci
 2vL5UOPQ/3DqTy+Lv9D6WOp2WlFahTcE2wjUKkRlvdyFQc1U3C4io2HpPScRCBh+hp2StYOcCHKy
 narm8+tDo=
From: Weiguo Li <liwg06@foxmail.com>
To: bparrot@ti.com,
	narmstrong@baylibre.com
Subject: RE: a null derefrence at [v7,
 9/9] drm/omap: Add a 'right overlay' to plane state
Date: Mon,  7 Mar 2022 23:50:43 +0800
X-OQ-MSGID: <20220307155043.134698-1-liwg06@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <https://patchwork.freedesktop.org/patch/msgid/20211117141928.771082-10-narmstrong@baylibre.com>
References: <https://patchwork.freedesktop.org/patch/msgid/20211117141928.771082-10-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> 
> From: Benoit Parrot <bparrot@ti.com>
> 
> If the drm_plane has a source width that's greater than the max width
> supported by a single hw overlay, then we assign a 'r_overlay' to it in
> omap_plane_atomic_check().
> 
> Both overlays should have the capabilities required to handle the source
> framebuffer. The only parameters that vary between the left and right
> hwoverlays are the src_w, crtc_w, src_x and crtc_x as we just even chop
> the fb into left and right halves.
> 
> We also take care of not creating odd width size when dealing with YUV
> formats.
> 
> Since both halves need to be 'appear' side by side the zpos is
> recalculated when dealing with dual overlay cases so that the other
> planes zpos is consistent.
> 
> Depending on user space usage it is possible that on occasion the number
> of requested planes exceeds the numbers of overlays required to display
> them. In that case a failure would be returned for the plane that cannot
> be handled at that time. It is up to user space to make sure the H/W
> resource are not over-subscribed.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c     |  98 ++++++++++++++++++++-
>  drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++++++-
>  drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
>  drivers/gpu/drm/omapdrm/omap_overlay.c |  23 ++++-
>  drivers/gpu/drm/omapdrm/omap_overlay.h |   3 +-
>  drivers/gpu/drm/omapdrm/omap_plane.c   | 117 +++++++++++++++++++++++--
>  drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
>  7 files changed, 267 insertions(+), 12 deletions(-)
> 
> ...
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
> index afb2b44fdf86..10730c9b2752 100644
> --- a/drivers/gpu/drm/omapdrm/omap_overlay.c
> +++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
> @@ -67,12 +67,13 @@  omap_plane_find_free_overlay(struct drm_device *dev, struct drm_plane *hwoverlay
>   * next global overlay_map to be enabled when atomic transaction is valid.
>   */
>  int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
> -			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay)
> +			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay,
> +			struct omap_hw_overlay **r_overlay)
>  {
>  	/* Get the global state of the current atomic transaction */
>  	struct omap_global_state *state = omap_get_global_state(s);
>  	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
> -	struct omap_hw_overlay *ovl;
> +	struct omap_hw_overlay *ovl, *r_ovl;
>  
>  	ovl = omap_plane_find_free_overlay(s->dev, overlay_map, caps, fourcc);
>  	if (!ovl)
> @@ -81,8 +82,26 @@  int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>  	overlay_map[ovl->idx] = plane;
>  	*overlay = ovl;
>  
> +	if (r_overlay) {
> +		r_ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
> +						     caps, fourcc);
> +		if (!r_ovl) {
> +			overlay_map[r_ovl->idx] = NULL;

Hi,

  a null derefrence "r_ovl->idx" when "r_ovl" is null, in inner if clause.


