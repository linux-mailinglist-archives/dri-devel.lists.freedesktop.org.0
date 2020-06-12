Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19101F7432
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 08:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FF66E25E;
	Fri, 12 Jun 2020 06:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A62C6E25E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 06:57:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p5so8540121wrw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UCgd6cNg2sv8Sbaq6wiVoPz7Oes2ZTSG56tFLXmfIRo=;
 b=TP+w6U3FE9yQzP+hZPrldMN9csILZFGWy2iZkrmzPt2zTf5KF8h8bQIWC9z4gYQc8M
 2noGo8zVLwtXsXwJNgGybTlLN+E/Qn3s2rHP8BoAFjGmoEGRvK0h7fcGwn9ZdpUYz3Mp
 W6xcutjuuoooayDYMGco/Bj9SwKw1v/SfJvN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UCgd6cNg2sv8Sbaq6wiVoPz7Oes2ZTSG56tFLXmfIRo=;
 b=OmEdW5Ek4bLhslFXJZk/OC0AHYWVAHwXSLBs7UmhOqMtuLBapiNtVRoQDRKq4I5qJf
 AQxOMU5nA2iruOWrPqLr3zBpUAF4DRvXXKBcHQ/H25u4DsVFF1rZY0abx5jbrcUIwYUl
 ZJoK8SE6Pw0aj+xhLCC0V7T3gfvqCHfIxtK6V7UJ8rRUEzmFv0vHurg214yPpYA2YN/N
 4O2y16yyeIYJ9nCU/LC2K5ulYMY4NY1i/rGI+Th/UnfxEK3qWB5+1J8AcNdH5re0tbit
 ctWcKMM86hUdNTJGpmlN2f5NW13wXJUeCl1vjE6xao2oi8WPzuI5XvFltFs/z9d8z3Ll
 C5mg==
X-Gm-Message-State: AOAM532fIj0mj/qpqskXn/TqR0NIvMjbNFsC5blu/rec4/Ukxu7KFaa+
 zN9pJ2kYwygi83nDPg6ufpeC7g==
X-Google-Smtp-Source: ABdhPJyjDMgqJ7Fx5G+Jx8+is6FGXng3+IFaA7UEC2lCnkgX3dzeNxRLPRTHYGM+eNf/cza5M2QyZw==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr12887403wrq.140.1591945055740; 
 Thu, 11 Jun 2020 23:57:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q13sm8549870wrn.84.2020.06.11.23.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 23:57:35 -0700 (PDT)
Date: Fri, 12 Jun 2020 08:57:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/ast: Upcast from DRM device to ast structure via
 to_ast_private()
Message-ID: <20200612065733.GJ20149@phenom.ffwll.local>
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-3-tzimmermann@suse.de>
 <20200611192310.GA160102@ravnborg.org>
 <2d96eb86-0430-7b1e-0881-66a37451d983@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d96eb86-0430-7b1e-0881-66a37451d983@suse.de>
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
Cc: chen@aspeedtech.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, Sam Ravnborg <sam@ravnborg.org>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 08:30:40AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 11.06.20 um 21:23 schrieb Sam Ravnborg:
> > Hi Thomas.
> > =

> > On Thu, Jun 11, 2020 at 10:28:08AM +0200, Thomas Zimmermann wrote:
> >> All upcasting from struct drm_device to struct ast_private is now
> >> performed via to_ast_private(). Using struct drm_device.dev_private is
> >> deprecated.
> > =

> > This is a simple 1:1 conversion.
> > But some cases - I checked ast_set_dp501_video_output() =3D>
> > ast_write_cmd(), ast_write_data()
> > =

> > could have been fixed by passing ast_private * rather than drm_device *.
> > And then no upcasting was needed.
> > =

> > That a more involved approach - but wanted to point it out.
> > Maybe for another day..
> =

> Good idea. I'll consider it, depending on whether it makes the overall
> patchset easier or harder to read.

tbh since the goal is to embed the structures (I assume) I wouldn't
bother. As soon as it's embedded it's the same for the compiler. If you
flip some of the parameters I'd wait until the embedding is completely,
otherwise you have a pile of churn again because of the switch from
pointer to embedded structure.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > 	Sam
> > =

> > =

> > The ast variable in ast_crtc_helperatomic_check() is unused,
> > s/ast_crtc_helperatomic_check/ast_crtc_helper_atomic_check/
> >> so removed it.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > =

> >> ---
> >>  drivers/gpu/drm/ast/ast_dp501.c | 24 +++++++++----------
> >>  drivers/gpu/drm/ast/ast_drv.h   |  5 ++++
> >>  drivers/gpu/drm/ast/ast_main.c  | 10 ++++----
> >>  drivers/gpu/drm/ast/ast_mode.c  | 41 ++++++++++++++++-----------------
> >>  drivers/gpu/drm/ast/ast_post.c  | 16 ++++++-------
> >>  5 files changed, 50 insertions(+), 46 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast=
_dp501.c
> >> index 98cd69269263f..4b85a504825a2 100644
> >> --- a/drivers/gpu/drm/ast/ast_dp501.c
> >> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> >> @@ -10,7 +10,7 @@ MODULE_FIRMWARE("ast_dp501_fw.bin");
> >>  =

> >>  static int ast_load_dp501_microcode(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  =

> >>  	return request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev=
);
> >>  }
> >> @@ -93,7 +93,7 @@ static bool wait_fw_ready(struct ast_private *ast)
> >>  =

> >>  static bool ast_write_cmd(struct drm_device *dev, u8 data)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	int retry =3D 0;
> >>  	if (wait_nack(ast)) {
> >>  		send_nack(ast);
> >> @@ -115,7 +115,7 @@ static bool ast_write_cmd(struct drm_device *dev, =
u8 data)
> >>  =

> >>  static bool ast_write_data(struct drm_device *dev, u8 data)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  =

> >>  	if (wait_nack(ast)) {
> >>  		send_nack(ast);
> >> @@ -133,7 +133,7 @@ static bool ast_write_data(struct drm_device *dev,=
 u8 data)
> >>  #if 0
> >>  static bool ast_read_data(struct drm_device *dev, u8 *data)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u8 tmp;
> >>  =

> >>  	*data =3D 0;
> >> @@ -172,7 +172,7 @@ static u32 get_fw_base(struct ast_private *ast)
> >>  =

> >>  bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u32 i, data;
> >>  	u32 boot_address;
> >>  =

> >> @@ -188,7 +188,7 @@ bool ast_backup_fw(struct drm_device *dev, u8 *add=
r, u32 size)
> >>  =

> >>  static bool ast_launch_m68k(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u32 i, data, len =3D 0;
> >>  	u32 boot_address;
> >>  	u8 *fw_addr =3D NULL;
> >> @@ -255,7 +255,7 @@ static bool ast_launch_m68k(struct drm_device *dev)
> >>  =

> >>  u8 ast_get_dp501_max_clk(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u32 boot_address, offset, data;
> >>  	u8 linkcap[4], linkrate, linklanes, maxclk =3D 0xff;
> >>  =

> >> @@ -283,7 +283,7 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev)
> >>  =

> >>  bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u32 i, boot_address, offset, data;
> >>  =

> >>  	boot_address =3D get_fw_base(ast);
> >> @@ -312,7 +312,7 @@ bool ast_dp501_read_edid(struct drm_device *dev, u=
8 *ediddata)
> >>  =

> >>  static bool ast_init_dvo(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u8 jreg;
> >>  	u32 data;
> >>  	ast_write32(ast, 0xf004, 0x1e6e0000);
> >> @@ -385,7 +385,7 @@ static bool ast_init_dvo(struct drm_device *dev)
> >>  =

> >>  static void ast_init_analog(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u32 data;
> >>  =

> >>  	/*
> >> @@ -412,7 +412,7 @@ static void ast_init_analog(struct drm_device *dev)
> >>  =

> >>  void ast_init_3rdtx(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u8 jreg;
> >>  =

> >>  	if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400) {
> >> @@ -438,7 +438,7 @@ void ast_init_3rdtx(struct drm_device *dev)
> >>  =

> >>  void ast_release_firmware(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  =

> >>  	release_firmware(ast->dp501_fw);
> >>  	ast->dp501_fw =3D NULL;
> >> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_d=
rv.h
> >> index 09f2659e29118..c44c1376c6977 100644
> >> --- a/drivers/gpu/drm/ast/ast_drv.h
> >> +++ b/drivers/gpu/drm/ast/ast_drv.h
> >> @@ -136,6 +136,11 @@ struct ast_private {
> >>  	const struct firmware *dp501_fw;	/* dp501 fw */
> >>  };
> >>  =

> >> +static inline struct ast_private *to_ast_private(struct drm_device *d=
ev)
> >> +{
> >> +	return dev->dev_private;
> >> +}
> >> +
> >>  int ast_driver_load(struct drm_device *dev, unsigned long flags);
> >>  void ast_driver_unload(struct drm_device *dev);
> >>  =

> >> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_=
main.c
> >> index f48a9f62368c0..a2ef3d9077671 100644
> >> --- a/drivers/gpu/drm/ast/ast_main.c
> >> +++ b/drivers/gpu/drm/ast/ast_main.c
> >> @@ -67,7 +67,7 @@ uint8_t ast_get_index_reg_mask(struct ast_private *a=
st,
> >>  static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_r=
ev)
> >>  {
> >>  	struct device_node *np =3D dev->pdev->dev.of_node;
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	uint32_t data, jregd0, jregd1;
> >>  =

> >>  	/* Defaults */
> >> @@ -117,7 +117,7 @@ static void ast_detect_config_mode(struct drm_devi=
ce *dev, u32 *scu_rev)
> >>  =

> >>  static int ast_detect_chip(struct drm_device *dev, bool *need_post)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	uint32_t jreg, scu_rev;
> >>  =

> >>  	/*
> >> @@ -262,7 +262,7 @@ static int ast_detect_chip(struct drm_device *dev,=
 bool *need_post)
> >>  static int ast_get_dram_info(struct drm_device *dev)
> >>  {
> >>  	struct device_node *np =3D dev->pdev->dev.of_node;
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
> >>  	uint32_t denum, num, div, ref_pll, dsel;
> >>  =

> >> @@ -388,7 +388,7 @@ static const struct drm_mode_config_funcs ast_mode=
_funcs =3D {
> >>  =

> >>  static u32 ast_get_vram_info(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u8 jreg;
> >>  	u32 vram_size;
> >>  	ast_open_key(ast);
> >> @@ -509,7 +509,7 @@ int ast_driver_load(struct drm_device *dev, unsign=
ed long flags)
> >>  =

> >>  void ast_driver_unload(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  =

> >>  	/* enable standard VGA decode */
> >>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
> >> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
> >> index be0e2250708fa..10211751182da 100644
> >> --- a/drivers/gpu/drm/ast/ast_mode.c
> >> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >> @@ -565,7 +565,7 @@ static void
> >>  ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
> >>  				       struct drm_plane_state *old_state)
> >>  {
> >> -	struct ast_private *ast =3D plane->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(plane->dev);
> >>  	struct drm_plane_state *state =3D plane->state;
> >>  	struct drm_gem_vram_object *gbo;
> >>  	s64 gpu_addr;
> >> @@ -585,7 +585,7 @@ static void
> >>  ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
> >>  					struct drm_plane_state *old_state)
> >>  {
> >> -	struct ast_private *ast =3D plane->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(plane->dev);
> >>  =

> >>  	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x20);
> >>  }
> >> @@ -633,7 +633,7 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plan=
e *plane,
> >>  	    WARN_ON_ONCE(fb->height > AST_MAX_HWC_HEIGHT))
> >>  		return -EINVAL; /* BUG: didn't test in atomic_check() */
> >>  =

> >> -	ast =3D crtc->dev->dev_private;
> >> +	ast =3D to_ast_private(crtc->dev);
> >>  =

> >>  	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> >>  	src =3D drm_gem_vram_vmap(gbo);
> >> @@ -705,7 +705,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_p=
lane *plane,
> >>  	struct drm_plane_state *state =3D plane->state;
> >>  	struct drm_crtc *crtc =3D state->crtc;
> >>  	struct drm_framebuffer *fb =3D state->fb;
> >> -	struct ast_private *ast =3D plane->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(plane->dev);
> >>  	struct ast_crtc *ast_crtc =3D to_ast_crtc(crtc);
> >>  	struct drm_gem_vram_object *gbo;
> >>  	s64 off;
> >> @@ -738,7 +738,7 @@ static void
> >>  ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
> >>  				       struct drm_plane_state *old_state)
> >>  {
> >> -	struct ast_private *ast =3D plane->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(plane->dev);
> >>  =

> >>  	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
> >>  }
> >> @@ -766,7 +766,7 @@ static const struct drm_plane_funcs ast_cursor_pla=
ne_funcs =3D {
> >>  =

> >>  static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
> >>  {
> >> -	struct ast_private *ast =3D crtc->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(crtc->dev);
> >>  =

> >>  	/* TODO: Maybe control display signal generation with
> >>  	 *       Sync Enable (bit CR17.7).
> >> @@ -789,7 +789,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, i=
nt mode)
> >>  static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
> >>  					struct drm_crtc_state *state)
> >>  {
> >> -	struct ast_private *ast =3D crtc->dev->dev_private;
> >>  	struct ast_crtc_state *ast_state;
> >>  	const struct drm_format_info *format;
> >>  	bool succ;
> >> @@ -815,7 +814,7 @@ static int ast_crtc_helper_atomic_check(struct drm=
_crtc *crtc,
> >>  static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc,
> >>  					 struct drm_crtc_state *old_crtc_state)
> >>  {
> >> -	struct ast_private *ast =3D crtc->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(crtc->dev);
> >>  =

> >>  	ast_open_key(ast);
> >>  }
> >> @@ -824,7 +823,7 @@ static void ast_crtc_helper_atomic_flush(struct dr=
m_crtc *crtc,
> >>  					 struct drm_crtc_state *old_crtc_state)
> >>  {
> >>  	struct drm_device *dev =3D crtc->dev;
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	struct ast_crtc_state *ast_state;
> >>  	const struct drm_format_info *format;
> >>  	struct ast_vbios_mode_info *vbios_mode_info;
> >> @@ -937,7 +936,7 @@ static const struct drm_crtc_funcs ast_crtc_funcs =
=3D {
> >>  =

> >>  static int ast_crtc_init(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	struct ast_crtc *crtc;
> >>  	int ret;
> >>  =

> >> @@ -966,7 +965,7 @@ static int ast_crtc_init(struct drm_device *dev)
> >>  =

> >>  static int ast_encoder_init(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	struct drm_encoder *encoder =3D &ast->encoder;
> >>  	int ret;
> >>  =

> >> @@ -986,7 +985,7 @@ static int ast_encoder_init(struct drm_device *dev)
> >>  static int ast_get_modes(struct drm_connector *connector)
> >>  {
> >>  	struct ast_connector *ast_connector =3D to_ast_connector(connector);
> >> -	struct ast_private *ast =3D connector->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(connector->dev);
> >>  	struct edid *edid;
> >>  	int ret;
> >>  	bool flags =3D false;
> >> @@ -1017,7 +1016,7 @@ static int ast_get_modes(struct drm_connector *c=
onnector)
> >>  static enum drm_mode_status ast_mode_valid(struct drm_connector *conn=
ector,
> >>  			  struct drm_display_mode *mode)
> >>  {
> >> -	struct ast_private *ast =3D connector->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(connector->dev);
> >>  	int flags =3D MODE_NOMODE;
> >>  	uint32_t jtemp;
> >>  =

> >> @@ -1128,7 +1127,7 @@ static int ast_connector_init(struct drm_device =
*dev)
> >>  /* allocate cursor cache and pin at start of VRAM */
> >>  static int ast_cursor_init(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	size_t size, i;
> >>  	struct drm_gem_vram_object *gbo;
> >>  	int ret;
> >> @@ -1166,7 +1165,7 @@ static int ast_cursor_init(struct drm_device *de=
v)
> >>  =

> >>  static void ast_cursor_fini(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	size_t i;
> >>  	struct drm_gem_vram_object *gbo;
> >>  =

> >> @@ -1179,7 +1178,7 @@ static void ast_cursor_fini(struct drm_device *d=
ev)
> >>  =

> >>  int ast_mode_init(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	int ret;
> >>  =

> >>  	memset(&ast->primary_plane, 0, sizeof(ast->primary_plane));
> >> @@ -1223,7 +1222,7 @@ void ast_mode_fini(struct drm_device *dev)
> >>  static int get_clock(void *i2c_priv)
> >>  {
> >>  	struct ast_i2c_chan *i2c =3D i2c_priv;
> >> -	struct ast_private *ast =3D i2c->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
> >>  	uint32_t val, val2, count, pass;
> >>  =

> >>  	count =3D 0;
> >> @@ -1245,7 +1244,7 @@ static int get_clock(void *i2c_priv)
> >>  static int get_data(void *i2c_priv)
> >>  {
> >>  	struct ast_i2c_chan *i2c =3D i2c_priv;
> >> -	struct ast_private *ast =3D i2c->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
> >>  	uint32_t val, val2, count, pass;
> >>  =

> >>  	count =3D 0;
> >> @@ -1267,7 +1266,7 @@ static int get_data(void *i2c_priv)
> >>  static void set_clock(void *i2c_priv, int clock)
> >>  {
> >>  	struct ast_i2c_chan *i2c =3D i2c_priv;
> >> -	struct ast_private *ast =3D i2c->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
> >>  	int i;
> >>  	u8 ujcrb7, jtemp;
> >>  =

> >> @@ -1283,7 +1282,7 @@ static void set_clock(void *i2c_priv, int clock)
> >>  static void set_data(void *i2c_priv, int data)
> >>  {
> >>  	struct ast_i2c_chan *i2c =3D i2c_priv;
> >> -	struct ast_private *ast =3D i2c->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
> >>  	int i;
> >>  	u8 ujcrb7, jtemp;
> >>  =

> >> @@ -1431,7 +1430,7 @@ static int ast_cursor_move(struct drm_crtc *crtc,
> >>  			   int x, int y)
> >>  {
> >>  	struct ast_crtc *ast_crtc =3D to_ast_crtc(crtc);
> >> -	struct ast_private *ast =3D crtc->dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(crtc->dev);
> >>  	struct drm_gem_vram_object *gbo;
> >>  	int x_offset, y_offset;
> >>  	u8 *dst, *sig;
> >> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_=
post.c
> >> index af0c8ebb009a1..226e1290227ad 100644
> >> --- a/drivers/gpu/drm/ast/ast_post.c
> >> +++ b/drivers/gpu/drm/ast/ast_post.c
> >> @@ -39,7 +39,7 @@ static void ast_post_chip_2500(struct drm_device *de=
v);
> >>  =

> >>  void ast_enable_vga(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  =

> >>  	ast_io_write8(ast, AST_IO_VGA_ENABLE_PORT, 0x01);
> >>  	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
> >> @@ -47,7 +47,7 @@ void ast_enable_vga(struct drm_device *dev)
> >>  =

> >>  void ast_enable_mmio(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  =

> >>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
> >>  }
> >> @@ -55,7 +55,7 @@ void ast_enable_mmio(struct drm_device *dev)
> >>  =

> >>  bool ast_is_vga_enabled(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u8 ch;
> >>  =

> >>  	ch =3D ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
> >> @@ -70,7 +70,7 @@ static const u8 extreginfo_ast2300[] =3D { 0x0f, 0x0=
4, 0x1f, 0xff };
> >>  static void
> >>  ast_set_def_ext_reg(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u8 i, index, reg;
> >>  	const u8 *ext_reg_info;
> >>  =

> >> @@ -272,7 +272,7 @@ static void cbrdlli_ast2150(struct ast_private *as=
t, int busw)
> >>  =

> >>  static void ast_init_dram_reg(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u8 j;
> >>  	u32 data, temp, i;
> >>  	const struct ast_dramstruct *dram_reg_info;
> >> @@ -366,7 +366,7 @@ static void ast_init_dram_reg(struct drm_device *d=
ev)
> >>  void ast_post_gpu(struct drm_device *dev)
> >>  {
> >>  	u32 reg;
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  =

> >>  	pci_read_config_dword(ast->dev->pdev, 0x04, &reg);
> >>  	reg |=3D 0x3;
> >> @@ -1596,7 +1596,7 @@ static void ddr2_init(struct ast_private *ast, s=
truct ast2300_dram_param *param)
> >>  =

> >>  static void ast_post_chip_2300(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	struct ast2300_dram_param param;
> >>  	u32 temp;
> >>  	u8 reg;
> >> @@ -2028,7 +2028,7 @@ static bool ast_dram_init_2500(struct ast_privat=
e *ast)
> >>  =

> >>  void ast_post_chip_2500(struct drm_device *dev)
> >>  {
> >> -	struct ast_private *ast =3D dev->dev_private;
> >> +	struct ast_private *ast =3D to_ast_private(dev);
> >>  	u32 temp;
> >>  	u8 reg;
> >>  =

> >> -- =

> >> 2.26.2
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
