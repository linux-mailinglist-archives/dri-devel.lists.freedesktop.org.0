Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLomN7p1lGlmEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:05:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666A14CF8C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796B010E26F;
	Tue, 17 Feb 2026 14:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xo3OY7VI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53BF10E26F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:05:42 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-6497b819b07so377223d50.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 06:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771337141; cv=none;
 d=google.com; s=arc-20240605;
 b=WBj77WpzFUOHChWf8QI946TwiMWLVaiiSYAYOtslAseE2IxvtsazyF+pzXYIcxRa4s
 wUCE0sSuUAKUJSUzvsxcsWGvW9DDdC7TEEiyPs5ZDeMoU2PjPthozozTu6rQwDatzTen
 rduVuDOUfvxIuODDxKkEVZhtt7h2A5DMS+7GbtSm/+9IrpD8S9aIBaJrn5cXUhi0y+73
 W/rK0JV5hk5db4ksTIgX3QApg0MmCifoCR1ddY2UiLwumOcpNpr5dJb3rtc6JTb80Wis
 /+ghGoWnNRnLZxXtPERAQYVsCjnnaV8d/jQ6i3FYFWkGnN1MTW86lMDq0iei0YJ8jTa2
 TzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
 fh=Pj66xH1xBPKJbi04SVzlJFukQ5f0piaHYf9STE35sEQ=;
 b=ODjYt+ANsY9uLyhLvcElRnkQ/3a72i+6J2eSBnK0jVFgGuRoo+p0rGMEn+8UiAdeM3
 ujMPMdpzkioXg0h8/Z29XT3JAXZflktfx+1idT7H0YQt8fGH7MUfUjtj3QBRHfGiK0fT
 h3j6mcLzcYv4nIAGGA3ZJ81AzGigD6pjmEbMl5V0YveTPgFUS9/M3u2tr5z38L5bWDpi
 +tYMn0hJCRITXZk9Zyy9lUhbXyxKMoP1U+i1pEWAPunX1en7/ES3IRdN++TOo6Y7yh80
 pOCYsbXEQ1dxQVOYwRbMrlqMU7YIeG2R8RzTsbkWdkhzGHpQSRtO9IAq1iTKdXmiSD4I
 78tA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771337141; x=1771941941; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
 b=Xo3OY7VI58Tva3NsQHsQ62s/6zdnAdR8TCdp8NAKonobg18y7oJwc9m6OWJXI+Y/RR
 s/oHnR3P/w6pPASii9rc/2hp43xdGeWPY7zno929zY/JlWjb9mnMmLtGppPF3kZ4do6t
 SuEci9nZ8N9bvH0xfxMkNNO2K5Trz9ONBWeTZcA0wA9+n2fYfdV+tCgc1vmNuwB+TONC
 25+X2S7mEmkzd8OtNL9dDhI6L3R1lg1JNIUhhZOon04zJlDd+Ljc4v/1IqDhscpc8PlZ
 gjfnndM9+UJkPbW3DBHAuOwUPsLIXJMUTEDe32qAt5LbKXgzldLMw6XEyiotVy2/SpWS
 bUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771337141; x=1771941941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7/ZxD0gyzUi+GQ6guwRmxS/saZ8Vlcke1WYSE/BbT8=;
 b=DcMRXO/BseOJ/jSLGo8/tzzmcCpD7E7z6Rs9AHIVQWX/TskwF1h/R+wj5msfZcuYjt
 yzuscI40e7yYOl243Ga6uNAyvdxksWlKtL/PwHitoHw5mdpfjy5k/pKXLHrQrUVPwVS2
 MAwqHQN0COSBVQrlj6RannCS9PiK/bidMTOi5KdjaUjmmrCW6OLp6rgjldcsHFgIP94+
 YItINij2NjnT42PnMjMUcEtHF7xlMIS2uQkATAa9q/5jUdcuUnPZbqy779A/LFqNf3Yo
 EV7UfrZHToWUf8WrDRiy30gPp06cBLsu4lJ6zhNz4dwopyI/CAWeFETmhlrLGp5F0SjT
 632Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG8lJsjUDjpJonKXLE577vnEu+RktPxN33WkA6lRzmNK5T1o2Vnx9Z1qL+Ws7Ivz31jQnlNkZ9PIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK7m8pYWzex0R5S6BjTMzc8T9/qq+ZJyGYBWwQRnzsxShy04uv
 eqLscfX1vUGNjrPM8OReKTpxwQF4d3Bf7T2AOyOJcyPHejlVyvHjS/RhQHvzo1G6u0JRkJ7/6c6
 jg9g1H0NoWRDwaBEF9GXBLnEZYTFNpqI=
X-Gm-Gg: AZuq6aJozJWIIy1itB64xlcrTW/rThGcIO5qTmTsvbyC0q5l6w8IvbArffFvDTDGKDo
 PU/NnjY7UKDR7d0BTdjJKXkIZAqyo6IPlu1z5emMimMAn57QUTuRdMJ04ziUJ9T9ddFm9h/bJJu
 gDUmfs1Mllub2kd0NtvHcEkVLa95+6Q/As4oEqq8VUdujuHcfzZDItd3zzEStnBruFnnIS+8+2l
 zhPOWFBDwzeWe/ESXd84PLNuGKrDVWRurL+pOmi6mKsA3KAMevNlxyJmS3RHX5nV9VatuLtx07V
 cp9E/Q==
X-Received: by 2002:a05:690e:1c1c:b0:649:f09d:a6cc with SMTP id
 956f58d0204a3-64c14b29c19mr10963024d50.1.1771337141377; Tue, 17 Feb 2026
 06:05:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
In-Reply-To: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 17 Feb 2026 16:05:29 +0200
X-Gm-Features: AZwV_QiVnluoIVm_8_wyxtM9osk-BEP_4tSvKqw7PjMg4MAO7-oL-lW1MUMi7lE
Message-ID: <CA+h21hoTJXkJr4_KWtFsxUMeqOXesxk5WKZbr5GWHawAi=idKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:l.scorcia@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[olteanv@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,pengutronix.de,gmail.com,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,collabora.com,baylibre.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4666A14CF8C
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 at 15:58, Vladimir Oltean <olteanv@gmail.com> wrote:
> To help the build test automation select the proper base branch, you can
> use the "phy-next" or "phy-fixes" git subject prefixes when generating
> your patches.

Ah, sorry, I missed the fact that only patch 4/6 touches linux-phy.

What is the merge strategy for this set?
