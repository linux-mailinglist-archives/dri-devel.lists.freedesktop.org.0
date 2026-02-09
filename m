Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL1dESBRimmmJQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:26:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F8114CBD
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75AB10E483;
	Mon,  9 Feb 2026 21:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="hR4qco4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7372D10E483
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 21:26:52 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c6788f3db37so65599a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 13:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770672412; cv=none;
 d=google.com; s=arc-20240605;
 b=PIKbUnWz/k4XMIvyIBy2xRvUMvFRX36Svp/UsXHYoclgzcwsR7/CGLzn0nGWehN6Oe
 nxSOxHjmkKkZrAsHrumUdFSHMrClD8zrdacRqPfhBteow+hRo6adQqYDSCplSDJvft/F
 M2hM50Py/eq7ITaSdSIqk+pfKOH17zmxEJffEQvqvRRkccqiagZscaNNpG7KCY7/hyFf
 E3fn6Pyu+u0Z8cBhMVBStq7VQPRvLXdQ6XB9QRxTC0MJaq7waNL+RHrNwHpp7K9T2VlC
 5fuK//rIN3NZt2amkBZP3xUq/sfHYFYlDdoEF4prFOAtBdtel4Le4VGEzTinH6/o9kLq
 e5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vgtbeCi2pw6A5kW9LhY7XlTk4VpebFVbTB3poJyaYkE=;
 fh=HkARFGGsT5NTXcSlGiOd7zwih1jukzevfCueLT+D9S8=;
 b=VPiK2vDpNd4+BKYlNViSWSj6IzF1eUhy8FFKCZ+LYA3fc5AXS2LdFBAbIAYXA0G2gJ
 HQGRWgCiDKdRneQzMLyCgVvYNW8WBEGX/voCB6SggYlcRheudUqiqO/SIEpIGeo/mVlE
 1BkAnn6dMqv5K0piYqqANHXyVP6znlNYnWiZz9ZHIkyOtpAnP6SVM/XXKC0EvSaovMna
 UvLu/k49UFW/u7u4DWCZdMwM5ej//Go6uVGC4jOdD+g+r66twaNzU8ojxg6BNoWz1Z3g
 cw7GtCLLr+YXKwtnhf2YuzUsC3aoV6SlNxN7oSRD5Y3XLV+ArnJ8m30rGeeABDPLXYsr
 xLRg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1770672412; x=1771277212;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgtbeCi2pw6A5kW9LhY7XlTk4VpebFVbTB3poJyaYkE=;
 b=hR4qco4yv0UXTkUoitwHI8EGl/8bbJ7ZYV6us6/QBjBoGRzX2GH6l33hMGhx7fN7US
 jo/0xYMfiG06f7t1AHEkLA0c7Lyic0DOxQfK7MedrD855oeCnq9UnQ2S38FYIfcs+O6S
 yPDaTaAoXR6Tmkzveb0rfkkNkvkJTolqeGtgPQVEZ8u7egMxwBJSMe79N17NiB+eFEGv
 HSYsoagb+3ZrcxKG1CptPQdOEU90rrb3WqKa831l9ZeCFOdTHRfETu63fVi4OQ9j24VD
 sm9RgZDIC64zT1A/nCJQzSMPXCB+NDOzcdxA6YKAz3/v6IC1ikcUpLMKXyF8Cbb1b32V
 h9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770672412; x=1771277212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vgtbeCi2pw6A5kW9LhY7XlTk4VpebFVbTB3poJyaYkE=;
 b=B8TY15Ls6OVQLSQFnoGbxJ5b3e2SkxmY86SJvda/pOBM9YR8BQB+ySmwm8A74wr5yG
 hUSYmAGBNGj0Cx/UQwtO52sHqVjbOEcbnPv1HCaifkJse/GzpKZ3Hc70kVbWOQYCtqDh
 sQLTjTFxy/Uz7x8BJyxWywCBgyd6IS4G4AN/S/d1DLb1HLlmgNWyh+6d/Ok9UkBHZ+wl
 qy1NqxlhInGL/7Dz0eiU1zrFA+CF2gb/JOMiMhburcwXRNvpZdafu46hAdgo57SuVMCh
 BlP5zOI9hU8scsIKETRX1SEJzECaTOeF2ZILH25JjtT6oKSoWV8nD6zy/qlY9/IgS8pj
 4vog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVihG817V0l7UUhQSQ3fA3j2apPfNfInR0UIrknLHZgD5nZ4xEKzGgdaQYgI1AQbSLmzkZY1V0zawQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWMO/Hp85IIyss5zr5XpL8MSjvFNwEznkai9Lkxf0gtfWVi9/E
 9mtLNQjE5d+uWbCDu/S14GUU93Ao+hgvNI/BNxZwaheGs+9q0Gx8VPJ4C4g69ZxHUVK9idl/hvF
 mSw1NdVQohzYYcpMQIsCxqfG1clmQYjQ=
X-Gm-Gg: AZuq6aLhXp7nI1nehxFOQAktO6Iau9e4O9woCeNAiNkS+Bu37xygW6+7mzUcESTlsDW
 gpUjsRqaoljqsnR6+dsqjfEEdFXRd0ejSeYWWWbJBAJNDDuUrNxXLO8lWNPaXcvh7l7pL+M70Et
 8amtdsXwgoP6hjwmVR5HwMaybiCQ4hsspZtl4T8KjEU0GaD9IBP4RYa4WbRr3FKGAD1K+HqXF07
 VyHgHNeQKMf7GzrVvklN4513oLyR0y4OJwnXJVt2kumzXA8sn3uxHfDmdidQ/r5Ft9FWfRSaY8C
 vt0+Q5g+FBHQ+4cDn2ae6l5HqM3X
X-Received: by 2002:a17:90b:2e51:b0:343:684c:f8ad with SMTP id
 98e67ed59e1d1-354b3ba3294mr10262394a91.4.1770672411768; Mon, 09 Feb 2026
 13:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org>
 <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
In-Reply-To: <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 22:26:40 +0100
X-Gm-Features: AZwV_Qio8NRyquzlrCte6-5wu8k1L4ys4q4LdVkXlHVSOU_2HdQLmEswu1-xiH8
Message-ID: <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: Ao Xu <ao.xu@amlogic.com>
Cc: neil.armstrong@linaro.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[googlemail.com:s=20230601];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ao.xu@amlogic.com,m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:linux-amlogic@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[martinblumenstingl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,lists.freedesktop.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinblumenstingl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[googlemail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,googlemail.com:dkim,amlogic.com:email]
X-Rspamd-Queue-Id: 840F8114CBD
X-Rspamd-Action: no action

Hi Ao Xu,

On Thu, Feb 5, 2026 at 12:56=E2=80=AFPM Ao Xu <ao.xu@amlogic.com> wrote:
>
> Hi neil, martin, jerome
>
> This email proposes a refactoring of the Meson DRM driver to adopt a
> component-based pipeline management model, inspired by the ARM Komeda DRM
> driver.
First of all: thanks for working on a plan on how to move things forward!

> The current Meson DRM implementation tightly couples drm_plane and
> drm_crtc logic with specific hardware blocks (OSD MIF, AFBC, scaler,
> blend, postblend), which makes it increasingly difficult to scale to
> newer SoCs.
I have to admit that I'm new to this part of the DRM driver /
subsystem - so I will probably ask some novice questions.

> The attached /vpu-block/ file describes the proposed VPU block pipeline.
>
> This implement introduces a generic pipeline framework where:
>
> - Hardware blocks (MIF, AFBC, SCALER, BLEND, POSTBLEND) are modeled as
>    independent components with well-defined capabilities.
>
> - drm_plane and drm_crtc are responsible only for building and validating
>    a pipeline, not for directly programming hardware registers.
> - Per-block atomic state is separated from SoC-specific register layouts,
>    similar to Komeda's component_state and pipeline_state model.
I have two questions here:
- How is per-SoC register access managed?
- How are "common" (shared across multiple - or even all SoCs)
registers managed?

It seems that the komeda driver uses komeda_dev_funcs for the
per-variant access.
However, it's not clear how this scales as only two mostly identical
display controllers (D32 and D71) ever made it into the driver.

> This is achieved by introducing four core objects, as shown in the
> attached class-diagram document.
>
> - meson_vpu_block
> - meson_vpu_block_state
> - meson_pipeline
> - meson_pipeline_state
>
>
> The atomic flow is structured as shown in the attached commit-flow docume=
nt.
The public A311D datasheet page 304 [0] shows that CVBS, HDMITX and
MIPI_DSI are part of the VPU block.
Those aren't mentioned in your flows. Is that because they are "after"
POSTBLEND and would therefore be part of a future refactoring
approach?

Also RMDA is shown in the same diagram as part of VPU. Neil had to
work hard to implement it back then for AFBC.
You haven't listed it in your diagrams but I assume it is going to be
part of the implementation as it is/was mandatory for AFBC.
Can you confirm my understanding here (or clear up my confusion)?

> The intention of this proposal is not to change hardware behavior, but to
> gradually restructure the driver to improve maintainability, scalability,
> and correctness of atomic state handling across different Meson SoCs.
>
> This is an initial proposal intended to gather feedback on the overall
> architecture before converting existing code paths incrementally.
Making incremental changes sounds great! The meson DRM driver is too
big to "just" copy it and make modifications (or even modifying it
directly with one huge patch).


Best regards,
Martin


[0] https://dl.khadas.com/products/vim3/datasheet/a311d-datasheet.pdf
