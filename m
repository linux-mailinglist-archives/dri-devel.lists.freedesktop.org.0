Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIExKM/HnGkwKQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:34:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5217D9CB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387EE10E298;
	Mon, 23 Feb 2026 21:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BpoSrLwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F86210E298
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 21:34:03 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-65c01595082so7038134a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 13:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1771882437; x=1772487237;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wU3UIzxZdzF7zX04wG+VrV4aHKY5dGaBjo+5yeeUJU=;
 b=BpoSrLwM7vQXBHVvZqKAyGTiRaS96LVhU8J2ghQSleYpnTh1tk2mazo5O3250QktoW
 qRbHSd6wF5XOGAw0V6JtgAXDlywdvt++5OptfakR3/YMJAA3V3gvsqJjI4INl506VM1c
 ALUQ5MVdM/ZxeHT2f6AKS+9W5pR6HFX7kP5SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771882437; x=1772487237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6wU3UIzxZdzF7zX04wG+VrV4aHKY5dGaBjo+5yeeUJU=;
 b=Ig/WxH1f8yqIqSscyNo8kdKHGNe1Bn8D2cJCEh8hWArKDQGVBeD8ygZLxr4AMeHeBj
 Z8Z+PflG3c/tiCCXY/XRyM9fmI0L+z32dmlLmu1J1VCTRa/gKJdiUNpcnKZklz6SsXLq
 pZ2qPNKFIpjwVHzKDBR3ukfnrHy4E1cow3+Vfxo8aQpK32xi6Z9+4y/QBJqZxAagLfHc
 IkjVapqfFcj9GxrgYnT9cS0ocZ/LmhBTXQ24KfqlMbWkP5txpxDz4WXkZ6JN8F+CqpmX
 t7ZNJJ6QD7SgbXw8iTKeQgyUMj21/c+2AsqlMRIWEBK8QV+033DVQfOkEvHD1trw4x7j
 /m+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+GHSXwVoYhPmJp6VoiefNKbrcDtgvwfXbddl5be0wVounwUoADKrNpQWP2ZpSTFVuvO3LtTgLnXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+N5wA10Ghx70lCOF6OmQFc4B7Dx2Z1KUKySYOgBjWAIq2n6gd
 pv1EWimj+4ZsbsMGMAkUnKgIntcoZ1Jx8q26R40O6ljsGcpynKBVSvsZ66hyk5/jDGe6TP4ZVeb
 uKc47Dg==
X-Gm-Gg: ATEYQzxeii4iVJmQ37hwzBazQOhVh0oDpqF95qVOyRlhwIF3lqfuuaFVvIoRfyYqhBR
 C7vdNM9P9wAX0102+RpaSjKuTRiL1Qqhx8KHCoEmDiMAizhsxuDxC1gbkCo4dpG1uaoDzkm3hRm
 xEwdwpJfzfyr0Wyz5eL7Feb7ad2vpdVwb22YnIb/Vq1qNpyaDEsWCfmwOpqeesjoSuouxrhKQb+
 68l1xxO7GGYoyk3PPFnQGz9dHLLfKTmecQHF/uq24d7WAFlVd636+3h9eyVfzmwcVdV2hntIfVU
 0P8Gx9naaxx9uVZ67NyII6hONWBMe514NNhG3+UDUezE8mgumqmJhotFeEFQ360gDLmAuxaiLkn
 xm//62zyoGF7YES2b5OcnnnFb4mVi/YtXErOBeQVl2j35YHAZnW8LexCdVbiLVWAA/RWxU+wpNL
 7wobry9V70Xaa8+xeOKL3KJn6yVZJyWLEUSa8iLvqI8OeZF0i237Lp2zajD7DlGde1Nm+gSN0O
X-Received: by 2002:a05:6402:f0d:b0:65c:62b6:4bf1 with SMTP id
 4fb4d7f45d1cf-65ea4ee07a4mr3859051a12.7.1771882436869; 
 Mon, 23 Feb 2026 13:33:56 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eab9b5a2bsm2987632a12.15.2026.02.23.13.33.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 13:33:56 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-436263e31abso4373704f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 13:33:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgACbvPS6BXw7200Cu+unIFHGXhvFIoXwNnxaGmeKVq9+FBoiUHBrupFEmORmuG5b5AVtGI9H64+E=@lists.freedesktop.org
X-Received: by 2002:a05:6000:1883:b0:436:3267:3edd with SMTP id
 ffacd0b85a97d-4396f15c33cmr17025598f8f.22.1771882433567; Mon, 23 Feb 2026
 13:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20260223043441.5295-1-chintanlike@gmail.com>
In-Reply-To: <20260223043441.5295-1-chintanlike@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Feb 2026 13:33:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WtjW5WWmjeb2zwF2PjiJeZv1jZS_UKZ0bT1658=CkwVA@mail.gmail.com>
X-Gm-Features: AaiRm51Y3pve0k6HksqHd4s03yMqMU8lVjU7vbIaw2BjTwYWL9VfEr03wQjuS9c
Message-ID: <CAD=FV=WtjW5WWmjeb2zwF2PjiJeZv1jZS_UKZ0bT1658=CkwVA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt36672a: Convert to
 mipi_dsi_*_multi() helpers
To: Chintan Patel <chintanlike@gmail.com>
Cc: sumit.semwal@linaro.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chintanlike@gmail.com,m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: 07E5217D9CB
X-Rspamd-Action: no action

Hi,

On Sun, Feb 22, 2026 at 8:35=E2=80=AFPM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> @@ -79,23 +79,17 @@ static inline struct nt36672a_panel *to_nt36672a_pane=
l(struct drm_panel *panel)
>         return container_of(panel, struct nt36672a_panel, base);
>  }
>
> -static int nt36672a_send_cmds(struct drm_panel *panel, const struct nt36=
672a_panel_cmd *cmds,
> -                             int num)
> +static void nt36672a_send_cmds(struct mipi_dsi_multi_context *dsi_ctx,
> +                               const struct nt36672a_panel_cmd *cmds, in=
t num)

nit: checkpatch --strict yells:

CHECK: Alignment should match open parenthesis
#37: FILE: drivers/gpu/drm/panel/panel-novatek-nt36672a.c:83:
+static void nt36672a_send_cmds(struct mipi_dsi_multi_context *dsi_ctx,
+                               const struct nt36672a_panel_cmd *cmds, int =
num)


Also: FWIW having a function like nt36672a_send_cmds() is discouraged
these days. One of the reasons for creating the "_multi" functions and
making them efficient was that init functions were preferred. For
instance, see the commit d6ddb6624a7f ("drm/panel: boe-tv101wum-nl6:
Don't use a table for initting panels") or commit 6f6fd690de1a
("drm/panel: innolux-p079zca: Don't use a table for initting panels").

I won't insist that you make the conversion here since I think you're
still providing a valuable cleanup with the patch you've already
written, but in case you want to go above-and-beyond you could try it.
You could even try running bloat-o-meter to see how the size changes.


> @@ -115,34 +109,26 @@ static int nt36672a_panel_power_off(struct drm_pane=
l *panel)
>  static int nt36672a_panel_unprepare(struct drm_panel *panel)
>  {
>         struct nt36672a_panel *pinfo =3D to_nt36672a_panel(panel);
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->link =
};
>
>         /* send off cmds */
> -       ret =3D nt36672a_send_cmds(panel, pinfo->desc->off_cmds,
> -                                pinfo->desc->num_off_cmds);
> +       nt36672a_send_cmds(&dsi_ctx, pinfo->desc->off_cmds,
> +                          pinfo->desc->num_off_cmds);
>
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to send DCS off cmds: %d\n", =
ret);
> -
> -       ret =3D mipi_dsi_dcs_set_display_off(pinfo->link);
> -       if (ret < 0)
> -               dev_err(panel->dev, "set_display_off cmd failed ret =3D %=
d\n", ret);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       /* Reset error to continue power-down even if display off failed =
*/
> +       dsi_ctx.accum_err =3D 0;
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>
>         /* 120ms delay required here as per DCS spec */
>         msleep(120);
>
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(pinfo->link);
> -       if (ret < 0)
> -               dev_err(panel->dev, "enter_sleep cmd failed ret =3D %d\n"=
, ret);

You've changed the order. Enter sleep mode used to be after the 120ms
sleep. Now it's before.


> -
>         /* 0x3C =3D 60ms delay */
>         msleep(60);
>
> -       ret =3D nt36672a_panel_power_off(panel);
> -       if (ret < 0)
> -               dev_err(panel->dev, "power_off failed ret =3D %d\n", ret)=
;
> +       nt36672a_panel_power_off(panel);

You got rid of the extra print here, which is fine/right from my
perspective (since nt36672a_panel_power_off() already printed). ...but
nt36672a_panel_power_off()'s return code is never checked now. Just
make nt36672a_panel_power_off() return "void".


> @@ -170,51 +156,34 @@ static int nt36672a_panel_power_on(struct nt36672a_=
panel *pinfo)
>  static int nt36672a_panel_prepare(struct drm_panel *panel)
>  {
>         struct nt36672a_panel *pinfo =3D to_nt36672a_panel(panel);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D pinfo->link =
};
>         int err;
>
>         err =3D nt36672a_panel_power_on(pinfo);
>         if (err < 0)
> -               goto poweroff;
> +               return err;

I won't insist since it's a matter of opinion, but IMO get rid of the
`err` local variable and consistently use `dsi_ctx.accum_err` to store
the error code in this function. Yeah, it's a bit awkward, but having
the separate `err` variable just makes it too easy to mess up and use
it. As one example of where that happened, see commit 61ce50fd8196
("drm/panel: jdi-lpm102a188a: Fix error code in jdi_panel_prepare()").

Also: instead of returning right away, I think you want to make sure
that the GPIO gets set to 0 like the old code did, don't you? I'd be a
little hesitant changing this unless we can truly prove that the GPIO
set is not needed or unless we're certain that the GPIO set was
incorrect (in which case we should fix it in a separate patch).

...nicely, if you use `dsi_ctx.accum_err` you don't even need a
"goto". You can just let the "_multi" functions all run and be
no-ops...

-Doug
