Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D+wFGTFoGnImQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:12:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C770F1B0398
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAE010E9F0;
	Thu, 26 Feb 2026 22:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="hz35ucwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277CE10E9F0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 22:12:48 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2aaf43014d0so10945015ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772143967; cv=none;
 d=google.com; s=arc-20240605;
 b=MUi63hgfLs5GT+zh20SFgT+/21DmrGR5c0Qh2wAlnqQqy8uBR+72XPm8plr0I2Zywy
 /OExfK35ao0YXhtDNdpjbPSr94AlqZVt1fCm9nYEy/fI2kjFePoVL4YlYJ3PNOUyhzfk
 sek+OwpLkJ4rDU5H22nSJMK84RMmdqEunlxgFqfWNWr2Wf0DXMBzUOLELJEsee+feaB5
 gDmCNlqO1K/KTaSeBWnNSQ+C+w0f7rW6Q/yrzM5EuZgZA+mdMYQ20cxId6qmc5s666Lu
 qIMWP7KLOoh1zXsdd6rz+D13h6trTWNhx1f78EvMuC8uruC4Qr0nFcVvFLnwzFi8mXJs
 vUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5vj4oi7FzrupQugqc1/eniZpEwrbi4HSzFek+AnHkbg=;
 fh=DxRgY72X1HhALliLKVqSJpLOpBcCgbQidnXausQS4Qc=;
 b=VBlocLmrOh5Wtm4DVByfMeL3/+LLj3dY0BXKJUo5/IDXRYJJGqdzpqxcG3Q/5cWU5q
 a4N8fdq54JouQFrUJOGn/ya9y6rDQqOGVjwt4Euq2J9ae4xwbdHgJrMjVoC+2nFBk8H4
 4B28LEoYr1S78o8Sm52mu36aPUL7QmQFPevwpG85sognTSdDOuJxb1qE+lKe3HhE78HE
 7nXIP647YvKak8dVbbOZc//8bxo3onICBKW5fIGjKK9HGwLDFU8QcA+bi0dHnYsWhYVi
 h6vwW8m9KPGF3/u3F7cA1xvsesaezcYy8B82ReFk8jPmvRaCt8lDyUOLJFKBispoe7cx
 RO5w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1772143967; x=1772748767;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vj4oi7FzrupQugqc1/eniZpEwrbi4HSzFek+AnHkbg=;
 b=hz35ucwKJBYDQMN/73VDEkWBKLU1plwfyVgPoJnkddxzzymT9VUUfEQWrVDrfXe3rC
 7URC5eBtc4CMFX2PG5zPpCbza+hg/5Vg8QTgmNhyk/mjrwZrWqsWC0PXzZgYX/UILYX6
 BaUu6X6y6Lelq+YBrm7xsas4t4cKh6YrMxWm1dmSXer318gurLnLEoIa9OKLbVgEjFmi
 k/zjHiThspfgj4t27lEtfMpaQUWKNrKWbeKMC57o8XTuTpfoDxZ/uQdz0TMxXvS4hfsC
 D3ZJzLr/2GRhVlwWMgTxUFUSVPQ0vFFLrMn1Un4F0m0EmYb+/q+5qSsQ746T3jldz3gY
 +XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772143967; x=1772748767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5vj4oi7FzrupQugqc1/eniZpEwrbi4HSzFek+AnHkbg=;
 b=MBm99lLHpAySBp/quCMLr7TZq0PkrUDGfpA532iu7GRX1PTI9lUKc+vxXprpiQMLng
 FiUSKv3wgD2nuWG/OtRkHqmkG8l6AiCrXJG4TCBc7hDXzJGd0YZeoQTbCk1jJiRLpQwo
 197HfJwKhWsFU4JfOWDw4hFje1wWYt2tWPNQoHasQoIaFg65o1vW4L5YL83QiocJ8S/z
 RDCkfU7i5xyNHA5BdPA/emrd8ml5zk6DOD7EuCELqY9cX9OK0LTujxkLJukw1M4kQhuB
 oKePybil028LHg03o1aMi1wXmDn5ZbApxdnN0CxgbbMT0WIoAQ/agNr8iIFOP4eWL3R+
 5+Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw6mquOxeDFpDPSCU1SOZdVBuwtJpDxRqgPgc3VCZ/HRixYmhPUN9+59J7X4z/jycN3TRDkpetscg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKJ8P+1a3Gn506bQikAS8GOhoLqQ8F/OqAWOWUvDIpgtl8wZ2G
 iR19ZLzzrvUeU7Vs8h+r+ZXtXSgHQwoCDQPvZbw9DGnL4V+LIbi2nBNLiklzkKlFI5llTyydVPg
 zcw5holEmohcQoMA0FtS/B3/qc4tqdZg=
X-Gm-Gg: ATEYQzyV3Lo9vDFiIsGgYk/Kw8bg1wGDuxSIKrFLyKbchpmnzZvS60esi9rLqV24c+X
 n0RanUI9eGVZEnmUQXAP1GbcaeukD+N1sMdB7JF87iZs+XL/BABfZ+034zw5CCAXO2T4Nlj0rCJ
 Ry71tMLsaxtNImuilnBTcByXH/AofR1T3omPcK+Hx1wCCTMFRSEEwY302Dz/g8Pu5ufTl+SscI8
 5QSrtya3G4KBlhSph5+Y+PQQQa6wxuQ837wQjh6y8UITQfLxcXv8Jt6lupRBycouoTsU7WV3PB8
 hNJud7F10ODuzOGnByY9Yn7Mm0SBpfQ9w+9P5X78
X-Received: by 2002:a17:903:320b:b0:2ad:e02b:4611 with SMTP id
 d9443c01a7336-2ae2e3e72d5mr3996095ad.1.1772143967525; Thu, 26 Feb 2026
 14:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org>
 <c94987c4-dd46-4eb5-a56b-8132c0c9a118@amlogic.com>
 <CAFBinCA374KQiKn=_M5JNfY+Re_uw_40A169G=pU2-MghmUV2g@mail.gmail.com>
 <1a93d6ad-7f09-467c-9b2d-9e706f66adaf@amlogic.com>
In-Reply-To: <1a93d6ad-7f09-467c-9b2d-9e706f66adaf@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 23:12:36 +0100
X-Gm-Features: AaiRm514KD-jvhe4Mc00x3-Pl2br1wbWE2jRwOOzJuKIUOLmGlOAejSAJtw8638
Message-ID: <CAFBinCCcHXtXmgd221tpseUtOiPPgD07BbNvgT=9=739y=xzXQ@mail.gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ao.xu@amlogic.com,m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:linux-amlogic@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[martinblumenstingl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[googlemail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinblumenstingl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,lists.freedesktop.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlemail.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C770F1B0398
X-Rspamd-Action: no action

Hi Ao Xu,

On Tue, Feb 10, 2026 at 7:06=E2=80=AFAM Ao Xu <ao.xu@amlogic.com> wrote:
[...]
> > I have two questions here:
> > - How is per-SoC register access managed?
> > - How are "common" (shared across multiple - or even all SoCs)
> > registers managed?
> >
> > It seems that the komeda driver uses komeda_dev_funcs for the
> > per-variant access.
> > However, it's not clear how this scales as only two mostly identical
> > display controllers (D32 and D71) ever made it into the driver.
>
> I would like to first describe the current state.
>
>     In atomic_update and atomic_disable, register values are derived
>     from the property information and stored into the priv->viu and
>     priv->afbc structures.
>     In meson_crtc_irq, the previously saved values are then written into
>     the hardware registers.
>
> In future SoCs, we may encounter the following scenarios:
>
>   * The register addresses of a given block may change. For example, on
>     S905X2, the OSD1 scaler registers are located at 0x1dc0=E2=80=930x1dc=
d,
>     while on A311D2, the same OSD1 scaler registers move to 0x5a00=E2=80=
=930x5a0d.
>   * A block's functionality may be reduced or extended, which can
>     include changes to existing register bits or the introduction of new
>     control registers. For instance, the OSD MIF block previously
>     required canvas configuration, while on T7C the canvas mechanism is
>     completely removed.
>   * An entire block may be removed or newly added. For example, GFCD,
>     which internally integrates AFBC and AFRC hardware modules, is
>     present on A9.
>
> Register programming is performed through RDMA hardware.When RDMA is
> available, the flow is different.
>
>     In atomic_update and atomic_disable, register values are written
>     directly into the RDMA register table, and there is no need to cache
>     the register values in software.
>     Once all register writes are prepared, rdma_config is used to let
>     the hardware flush the RDMA register table into the real registers
>     on the next VSync.
>
> On a given SoC, each internal block contains fields that determine which
> register set it should use.
> This information is SoC-specific and must be provided by the SoC descript=
ion
Thank you for providing more detailed insight into your idea.
Overall the approach makes sense to me. In my own words that is:
separate code that's different per-SoC.

What's important to me is to still reuse/share code where possible.
I'm using meson_overlay.c (even if this is not high on your priority
list) as an example:
- G12A requires special handling in meson_overlay_atomic_disable()
- the rest of the code in this file works for all SoCs
Copying the whole file (800+ lines of code) and then changing 5 lines
in _atomic_disable() (in each copy of the file) will be hard to
understand and maintain.

Or in other words: I like your approach of allowing more flexibility
to handle per-SoC specifics. Please make sure to not duplicate
common/shared code.

> >
> >> This is achieved by introducing four core objects, as shown in the
> >> attached class-diagram document.
> >>
> >> - meson_vpu_block
> >> - meson_vpu_block_state
> >> - meson_pipeline
> >> - meson_pipeline_state
> >>
> >>
> >> The atomic flow is structured as shown in the attached commit-flow doc=
ument.
> > The public A311D datasheet page 304 [0] shows that CVBS, HDMITX and
> > MIPI_DSI are part of the VPU block.
> > Those aren't mentioned in your flows. Is that because they are "after"
> > POSTBLEND and would therefore be part of a future refactoring
> > approach?
> This proposal focuses only on VPU OSD and video-related blocks.
> Encoder and connector handling is a separate and much larger topic.
> I am currently investigating how to reuse existing PHY and clock tree
> interfaces for that part, but it is intentionally kept out of this
> proposal.
Understood. I started looking into managing the PHY clocks a while ago
for Meson8/8b/8m2 (those are 32-bit ARM SoCs) and it's not straight
forward. So let's indeed save them for a later date.

> >
> > Also RMDA is shown in the same diagram as part of VPU. Neil had to
> > work hard to implement it back then for AFBC.
> > You haven't listed it in your diagrams but I assume it is going to be
> > part of the implementation as it is/was mandatory for AFBC.
> > Can you confirm my understanding here (or clear up my confusion)?
> Yes, we will add RDMA function support firstly.
That's great to hear - thank you!


Best regards,
Martin
