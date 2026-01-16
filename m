Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B5D3883B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 22:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4587710E0C7;
	Fri, 16 Jan 2026 21:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="E8oBCFmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4185010E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 21:17:58 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b86f69bbe60so372438966b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768598276; x=1769203076;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zh2i9RwRJ6Lxco73X8lyH7Nz37zmZB2KCKN1wlIMXxw=;
 b=E8oBCFmTrbIi1xk0MLQvSNoVJngHOMF+xRuN7TOTX7/n7B3Or0ldxBbdoCX7hJfWq3
 KqU58uQp0xIUHOJ2g43xpMYgXyxhbEJZGXON9sG/ZTQbDB99VIba6fQAr9A3xSgDyXte
 u5Wcy+NWnjT4m+oqWlGJi2ManZjD7lqsWMuhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768598276; x=1769203076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zh2i9RwRJ6Lxco73X8lyH7Nz37zmZB2KCKN1wlIMXxw=;
 b=bcp74m/kxSUN+c4pFHTZHpOVvrRm7FqIhzztqsS8JoUlxhyD8zXALaWQTZPKJGffbE
 CZVh4//9RI89EG1xfzO6AUglKYEVvWIIlyRBOKkS1GJUx1VlQOdv19602NtXAOo+ho03
 wf3pwV71oNn+rZguSCSsCRoU75+dFVePwIa8j6kZGmtP/rXUuSw07kbF4P5fU8VehdOn
 sYrPna1CCDQYJAMcRa6NsErO37EKKY/uUYmaIkbu769CfSa3EuOZOxwDjDOJA6EHqAbU
 KMZt1FELV208xLhEVKOZNRQPxDvB/DvFSnq4z+XZ9aHgeMY5/fj/JJNxaS8yNVIsfSc3
 pNvQ==
X-Gm-Message-State: AOJu0YxoGTYnYfLfYKM1y0p8PHEp+dXr4kuLq8eBpH4MIlj0ZNvJNGXl
 82TYTQIH92xxCI51AlOAyBoPZhPVBa475QEyY8bg43taRuFjh724MLms6Sgxpf0XcHL7o7E2sdp
 hOSs=
X-Gm-Gg: AY/fxX7I4ggPwG1RuqLKKUeZUd9Tfb4eVCwSImPIJ2FiROIlxJPv5+nFttax/2Nth0M
 8tKekpCXB47AmTIemfJVOgKnCZVb97aGsgSA/SQN3dbC57yBZOtVDG8sDYLm5udAVpr1BPzuuTo
 VpQKmvJqj9mBLYEKqmnNjrALY0qbqQ7ZnE43u3V1Wuy4mL60TVcYiaYB3vzpWTTaY7I70qOvoBq
 1M9USW6Z6kt1DfT3Wz4A8LYG9PO3mbqN50dOGAZ01pst+los41ZP3wv0+PITt0EgicujWw8EQoG
 7SblEJPJdpn4CeoUrAA0iyhixCxMHYxmobHrtRnaim/GC9aIOho9rfaKQOJMEKG+IVvKQ4ng/tw
 8ivYcJm+DyXOUmTjlj941xymeuNj0LTK96s42u6I94OJYKqGKGgX9HC6G3/FnRmpv+qDNTE8ITP
 2uJEHWjIYQjTtVP83fJPzYO5rnJFYeSum6mmno/O4QFHD6hPL17Q==
X-Received: by 2002:a17:907:940b:b0:b73:6d56:f3ff with SMTP id
 a640c23a62f3a-b87968f60f9mr320295566b.20.1768598275706; 
 Fri, 16 Jan 2026 13:17:55 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654533cc5d6sm3353512a12.22.2026.01.16.13.17.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 13:17:54 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so2039522f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:17:54 -0800 (PST)
X-Received: by 2002:a05:6000:186b:b0:430:f255:14b3 with SMTP id
 ffacd0b85a97d-4356a082ecamr4625786f8f.43.1768598273880; Fri, 16 Jan 2026
 13:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20260116185936.25283-1-alejandro@quihel.net>
In-Reply-To: <20260116185936.25283-1-alejandro@quihel.net>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Jan 2026 13:17:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xfyzx0-Y3hnxGWE5X0GhKyDdMsCp6T2c=amd3DLRGMHQ@mail.gmail.com>
X-Gm-Features: AZwV_Qi5TtL8DgQ3BMze2tYs5fG9S0waVHY_lHjh1_ffbfEQ9AIlU-j4pCjAYKA
Message-ID: <CAD=FV=Xfyzx0-Y3hnxGWE5X0GhKyDdMsCp6T2c=amd3DLRGMHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-edp: Add Tianma TL160ADMP17
To: Alejandro Quintanar <alejandro@quihel.net>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, 
 jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
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

Hi,

On Fri, Jan 16, 2026 at 11:02=E2=80=AFAM Alejandro Quintanar
<alejandro@quihel.net> wrote:
>
> Add support for the Tianma TL160ADMP17 panel (EDID manufacturer ID 'TMA',
> product ID 0x2033). This is a 16" 2560x1600 panel with 60Hz/120Hz refresh
> rates found in the Lenovo ThinkBook 16 Gen 7 (21NH).
>
> Without this entry, the panel-edp driver prints:
>   "Unknown panel TMA 0x2033, using conservative timings"
>
> Signed-off-by: Alejandro Quintanar <alejandro@quihel.net>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 415b89489..d3dffbfee 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2084,6 +2084,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081=
116HHD028001-51D"),
>
>         EDP_PANEL_ENTRY('T', 'M', 'A', 0x0811, &delay_200_500_e80_d50, "T=
M140VDXP01-04"),
> +       EDP_PANEL_ENTRY('T', 'M', 'A', 0x2033, &delay_200_500_e50, "TL160=
ADMP17"),
>         EDP_PANEL_ENTRY('T', 'M', 'A', 0x2094, &delay_200_500_e50_d100, "=
TL140VDMS03-01"),

Thanks for the patch! A few things:

1. Can you include the EDID in the commit message? We've been trying
to do this to help make sure we know what display was used in case we
need to reference it in the future.

2. Do you actually have a datasheet for the panel, or are you making
guesses about the timings?

3. Given that the panel below has similar timings but also have a
"disable" timing of 100ms, are you certain you don't also need that?

-Doug
