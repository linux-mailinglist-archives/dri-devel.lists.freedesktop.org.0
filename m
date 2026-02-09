Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOJ/JfLUiWklCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E510EC33
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3287D10E3CC;
	Mon,  9 Feb 2026 12:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EzCafwnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB6410E3CC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 12:28:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4362d4050c1so2853609f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 04:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770640112; cv=none;
 d=google.com; s=arc-20240605;
 b=UIvsG0NMoGcQu74sm1Ew2RDLWEwVwQClooYyI2PuZVOQPXo5cGA2/BFgnhaLJlkuYb
 ReiQUpQy9x7z8nHtMDAHvfF/oL4s8GI5pDWVu0HcN9Sg6+jtrOXtaWoMPQ5Rah/FI0ro
 bfsKxYezHYmXkYHStmyqV545m+X0vlgemVYKaIpiGNSj0Dcwo0y0KcBqvw8WK3dLcC3Q
 Esv/vvbbSvoe521OmJIJPtmaidRxj3GwrMZt0yqw6DkjumfmNJ2yeBLk5C64InCUhGDc
 lDVZn5X0sR0AiWxAw/l4Qr79Fkj84nuidWIUA3IxeganYFIZihTYXhYeLQu5j9tn5fD5
 LNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8rqLaylJQoEadFpFQ9cVP7gyL0VWhbwU4Jf8Ealm+9Y=;
 fh=4gb//cc1iOksrE/EQCYj+wsqCcw7ePJBQgqtwr9CLsI=;
 b=RU+aXHSTNlE6EVjdVB+FoeB2/WrFyEzdDz6s8B+hgHEXOoOAOwakTKTCXFkwX2g0ia
 xXojzKLo4KZb+OHsirKhsrFQkJeBZZYCaqLb51UL7HkuE3Pt2At7ez05LN/XZcwkLg0G
 SUc2sXqNuDezcTurEBpBlOmmN0uTQVOWVXsr5BSj2887IV5IocWT7RbovpcyzFLprAm3
 OjC1F5MMxq2MGkGEPAfWFTqaA1/vyYx1dgNlvJFT9AaxPzNJ93yJk5PB32xtEzvKeosc
 Pl25AHWehXq6TnOsEly0Ayvv3P9PCEzkiNkllwd41S0VWSKznx7vfb6QUo6D0VvrLvrG
 Zq1A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770640112; x=1771244912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rqLaylJQoEadFpFQ9cVP7gyL0VWhbwU4Jf8Ealm+9Y=;
 b=EzCafwnjwM7qRZunD8kL+jADiocKKn2PeFtA7gKLioJIawOuIwpKsSFG67YIRIzNrY
 lZrkyc6wS80XjP9XMXAV/3RkNZMHMHyLSxAilCYzl4e4CgNMK++tXU+dqmFuaUZbwr0C
 PWYXjFjqIwl0lEsUJBh4/cU4T7+1Kxtx4XIgqX2Me6v63p6J+jq5Zp3FQycRoJLjcSEY
 Yicmr5EvDUDMrrwpWZB1wwnYM+t8gyzFBj0844EG5Jzcj22JDONajPnMSo8/vmBgyJ1+
 9f7UxyAe69Ui2DsTHrZf1glRNxFebJrqjAR4lf9Ky7/2fqiCYR8z4FVzrAPZvXznLHhZ
 l60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770640112; x=1771244912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8rqLaylJQoEadFpFQ9cVP7gyL0VWhbwU4Jf8Ealm+9Y=;
 b=Or4pjLtZEL+5bm1P6xKAE25kh0DbDUPvW9UVpEwr9JWp9uONP6TcVrYRc26HDF2b6A
 wWf0sHK/nqrZS0c5pKFH025r0e4O2psT2+CgV5VcFpRM1mgLW0UOx2vJkXKvtejYqXiV
 yNXcL9c6TkW4XQg4AwyJSvgp5KxulxsSqC+rgDKFMrkCA5SlrBrKx9PG17GjAvyrYN6C
 1jfklt+cZFV571osojIXTbUlLiFTx9lLp83h+SO7kCg9YPmNd9T9hsPj/l/NoENOWZt7
 5Hn0bDP76YDz2qn3NhoxtfuBno/wzocZNRW5IQPnzqPDVE7snPydpqm4JOwDSwKMjIco
 dbJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcIy5grrKCIS4AgzJqgcTGlVFzwosAnt1bFwfiMT/BnjSrHeEznKMwdBjZM6rmQ+9QENak5K4c21Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrMLixyPoV8Fnsr5cvRQP6t6LCVd1CYLhf7bRnw3aAma8HHBzV
 BrQVinbpV8mO54IuDG/NlEn7Mw+x4su4noh9Cn+DjwfYcQFdm2sFjVY64MSfKAPnnJAuA9LpRKm
 aECcJ76x1VbAv5YY9j8I9koDPInCrN8g=
X-Gm-Gg: AZuq6aKp2viagbrpmRtaDV3tkLF/KFsDyGjqw2Cxcohbcw6izibC+ydRRW9guQeYbyb
 onucVdmWz3uazghRuHWb4ZEyVWcSs3E403z5kft2zA7o7dNhuN3ieYX0at6z1bUvUTBGysQTRT4
 01MR6KTGgE2m+sTCVvGuQ1/yrgBrdT2yxHm3slwAfo2H6+Luor0V5xIfeJE0T8hQN0c86BcG7vU
 N9zQCofMatWm+vuhspuWShoOUXVFlzgMxxARdt/roHX7+1C7YQ+SOdRzM7BNq8qWgrTmKXdwov6
 LH908S074rWeI4zGHJUx5uJUwpFuBQjRlp5LEC3nVxjH5Xc6dzhH6UgMNLmMRAmOn8/8w/ft8Md
 nP1M9rEZFK873
X-Received: by 2002:a05:6000:2209:b0:435:9241:37b4 with SMTP id
 ffacd0b85a97d-4362938ffe3mr19624465f8f.53.1770640112091; Mon, 09 Feb 2026
 04:28:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
 <dc9b5f379bcec34a7276d5d769828fde4231595e.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <dc9b5f379bcec34a7276d5d769828fde4231595e.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Feb 2026 12:28:06 +0000
X-Gm-Features: AZwV_QhWE3m-0Cf9oFsMG8j9Et_-hSHC_oSoZvKiTZg5SGLg2ociSjZxhHZs0jg
Message-ID: <CA+V-a8smn9bRGeTaYv4WUEXSPuu1CBgzqainupBc-h6kpUWJbA@mail.gmail.com>
Subject: Re: [PATCH v4 14/20] drm: renesas: rz-du: Add RZ/G3E support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org, 
 laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 000E510EC33
X-Rspamd-Action: no action

Hi Tommaso,

Thank you for the patch.


On Mon, Feb 2, 2026 at 12:04=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
>
> LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>
> Depending on the selected output, the correct SMUX2 clock parent must be
> chosen based on the requested duty cycle:
>
>  - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=3D4/3, 4/7 duty cycle)
>  - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)
>
> To support this behavior, introduce the `RG2L_DU_FEATURE_SMUX2_DSI_CLK`
> feature flag and extend the `rzg2l_du_device_info` structure to include a
> features field. Also, add a new helper function `rzg2l_du_has()` to check
> for feature flags.
>
> Add support for the RZ/G3E SoC by introducing:
>  - `rzg2l_du_r9a09g047_du_info` structure
>  - The `renesas,r9a09g047-du` compatible string
>
> Additionally, introduce the missing output definitions
> `RZG2L_DU_OUTPUT_LVDS{0,1}`.
>
> Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
> the CRTC output to the DU outputs.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Instead of using clk-provider API to select the right parent clock,
>    based on the outputs. Just set the correct duty cycle based on the
>    output, this reflects at CPG lvl to select the right parent.
>  - Updated commit message accordingly.
>
> v2->v3:
>  - No changes.
>
> v3->v4:
>  - No changes.
>
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 26 ++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 11 +++++
>  3 files changed, 85 insertions(+)
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/=
drm/renesas/rz-du/rzg2l_du_crtc.c
> index 6e7aac6219be..c51ba4b8c383 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> @@ -64,11 +64,32 @@
>  static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc=
)
>  {
>         const struct drm_display_mode *mode =3D &rcrtc->crtc.state->adjus=
ted_mode;
> +       struct rzg2l_du_crtc_state *rstate =3D
> +               to_rzg2l_crtc_state(rcrtc->crtc.state);
>         unsigned long mode_clock =3D mode->clock * 1000;
>         u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
>         struct rzg2l_du_device *rcdu =3D rcrtc->dev;
>
>         clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> +
> +       if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
> +               struct clk *clk_parent;
> +
> +               clk_parent =3D clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> +
> +               /*
> +                * Request appropriate duty cycle to let clock driver sel=
ect
> +                * the correct parent:
> +                * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=3D4/3, 4/7 d=
uty cycle.
> +                * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50%=
 duty cycle.
> +                */
> +               if (rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS0) ||
> +                   rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS1))
> +                       clk_set_duty_cycle(clk_parent, 4, 7);
> +               else
> +                       clk_set_duty_cycle(clk_parent, 1, 2);
> +       }
> +
>         clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
>
>         ditr0 =3D (DU_DITR0_DEMD_HIGH
> @@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc =
*rcrtc)
>   * CRTC Functions
>   */
>
> +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> +                                     struct drm_atomic_state *state)
> +{
> +       struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_sta=
te(state,
> +                                                                        =
 crtc);
> +       struct rzg2l_du_crtc_state *rstate =3D to_rzg2l_crtc_state(crtc_s=
tate);
> +       struct drm_encoder *encoder;
> +
> +       /* Store the routes from the CRTC output to the DU outputs. */
> +       rstate->outputs =3D 0;
> +
> +       drm_for_each_encoder_mask(encoder, crtc->dev,
> +                                 crtc_state->encoder_mask) {
> +               struct rzg2l_du_encoder *renc;
> +
> +               /* Skip the writeback encoder. */
> +               if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_VIRTUAL=
)
> +                       continue;
> +
> +               renc =3D to_rzg2l_encoder(encoder);
> +               rstate->outputs |=3D BIT(renc->output);
> +       }
> +
> +       return 0;
> +}
> +
>  static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
>                                         struct drm_atomic_state *state)
>  {
> @@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crt=
c *crtc,
>  }
>
>  static const struct drm_crtc_helper_funcs crtc_helper_funcs =3D {
> +       .atomic_check =3D rzg2l_du_crtc_atomic_check,
This change and adding rzg2l_du_crtc_atomic_check() can be a separate
patch as the same changes are required for T2H and its not specific to
G3E.

>         .atomic_flush =3D rzg2l_du_crtc_atomic_flush,
>         .atomic_enable =3D rzg2l_du_crtc_atomic_enable,
>         .atomic_disable =3D rzg2l_du_crtc_atomic_disable,
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.c
> index 0fef33a5a089..84e6bf186f5d 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a0=
7g044_info =3D {
>         }
>  };
>
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info =3D =
{
> +       .features =3D RG2L_DU_FEATURE_SMUX2_DSI_CLK,
> +       .channels_mask =3D BIT(0),
> +       .routes =3D {
> +               [RZG2L_DU_OUTPUT_DSI0] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 0,
> +               },
> +               [RZG2L_DU_OUTPUT_LVDS0] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 1,
> +               },
> +               [RZG2L_DU_OUTPUT_LVDS1] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 2,
> +               },
> +               [RZG2L_DU_OUTPUT_DPAD0] =3D {
> +                       .possible_outputs =3D BIT(0),
> +                       .port =3D 3,
> +               },
> +       },
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info =3D {
>         .channels_mask =3D BIT(0),
>         .routes =3D {
> @@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09=
g057_info =3D {
>  static const struct of_device_id rzg2l_du_of_table[] =3D {
>         { .compatible =3D "renesas,r9a07g043u-du", .data =3D &rzg2l_du_r9=
a07g043u_info },
>         { .compatible =3D "renesas,r9a07g044-du", .data =3D &rzg2l_du_r9a=
07g044_info },
> +       { .compatible =3D "renesas,r9a09g047-du", .data =3D &rzg2l_du_r9a=
09g047_du_info },
>         { .compatible =3D "renesas,r9a09g057-du", .data =3D &rzg2l_du_r9a=
09g057_info },
>         { /* sentinel */ }
>  };
> @@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output o=
utput)
>  {
>         static const char * const names[] =3D {
>                 [RZG2L_DU_OUTPUT_DSI0] =3D "DSI0",
> +               [RZG2L_DU_OUTPUT_LVDS0] =3D "LVDS0",
> +               [RZG2L_DU_OUTPUT_LVDS1] =3D "LVDS1",
>                 [RZG2L_DU_OUTPUT_DPAD0] =3D "DPAD0"
>         };
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.h
> index 58806c2a8f2b..c6f9dc46ab31 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -20,8 +20,12 @@
>  struct device;
>  struct drm_property;
>
> +#define RG2L_DU_FEATURE_SMUX2_DSI_CLK  BIT(0)  /* Per output mux */
> +
>  enum rzg2l_du_output {
>         RZG2L_DU_OUTPUT_DSI0,
> +       RZG2L_DU_OUTPUT_LVDS0,
> +       RZG2L_DU_OUTPUT_LVDS1,
>         RZG2L_DU_OUTPUT_DPAD0,
>         RZG2L_DU_OUTPUT_MAX,
>  };
> @@ -46,6 +50,7 @@ struct rzg2l_du_output_routing {
>   * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_=
OUTPUT_*)
>   */
>  struct rzg2l_du_device_info {
> +       unsigned int features;
The member description needs adding.

Cheers,
Prabhakar

>         unsigned int channels_mask;
>         struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
>  };
> @@ -73,6 +78,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_devi=
ce(struct drm_device *dev)
>         return container_of(dev, struct rzg2l_du_device, ddev);
>  }
>
> +static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
> +                               unsigned int feature)
> +{
> +       return rcdu->info->features & feature;
> +}
> +
>  const char *rzg2l_du_output_name(enum rzg2l_du_output output);
>
>  #endif /* __RZG2L_DU_DRV_H__ */
> --
> 2.43.0
>
>
