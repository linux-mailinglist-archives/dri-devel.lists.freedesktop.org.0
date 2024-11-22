Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79819D6560
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 22:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260DF10E00E;
	Fri, 22 Nov 2024 21:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RuGKbsxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930D310E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 21:28:13 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3823cae4be1so1630003f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 13:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732310892; x=1732915692;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Inu1YrDiEoZiawEHsCIJ2vIR2WeRDwuWrAFeiKfr+Ko=;
 b=RuGKbsxtGRG1wOEBjgdFKeWeol0lKBMZ0HLsNUIo2PZovRNtnLEWvYL57eRMapCBER
 1jhwobqMpyC8XY9F2+Ab5o2W+bm/xYOTg6n1Bs3PJd1gDJOXJtrIb0vN0Y2LqEFQll/T
 LwXQz6QoNBCMpMaJNhMELWW8O5DDrp6OOrEeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732310892; x=1732915692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Inu1YrDiEoZiawEHsCIJ2vIR2WeRDwuWrAFeiKfr+Ko=;
 b=Q2l4I0uPdfME1qoSiQlztDgPC4CkLt2pHH6TPP5OvSw/nG+eF092KJmhAGrs8/Q3V/
 GIrczOLoXgvK5GYeylRDUq5oxx30rP2tJf9T6Ef3pQ6jC1HB7sVGdwiWvAs0lAN3wpD+
 b0SNHFYQlZUrd4eOuGZEhDsavVc+Mv5NGhMFgyPcQsd+TwJA32LII3hoXInAdIW8Bugc
 K6NKbaV5t6f4i18Y82CEW00/Yi5mYUv+UO6fBsQXfMUfbZO7YtNOLHYRR8R2SwpcVB0k
 TNMAxHKmkZAwRn7wlFNx5Fxh7XiGGymwELdjzSKbPHDiomszffb0g6ZEV1jEXxqzHNMc
 NaOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi2EcWAD1efl53Fjf9YtTvjlLqEHkT0Q3PyQO36ERh2Ox9Va7MmtR9DFLXLyR/06GxWQjAt9+J6Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmHWRRrR5nlbQ/b8NkR+KqSo9UV2CNL2bMhPBw9dLLod5Z9ynX
 UrucIfprKr/DsRBY6dFyqEMGaDuh3jIXRfpmbin8zl0s5zxhERZr6s+qU8tPB7n5gHV+Dv08/SG
 i53CrzAMTKyE4nLueS1Cwiou1APXcMkjgJ3F9
X-Gm-Gg: ASbGncuXdVL8t0GbaP6W+6KfexfxofwjNe7JTPon6NaVHUtGYF4GBHtzCNsQf7k6Jty
 TVvTcyY+IthKzZN9Eg1F74GidO61feSxq
X-Google-Smtp-Source: AGHT+IGtMNuDYJLYRRIB6wP42xa6e1P3TgJSXUrfsr4yViA8LmGx95MOGbzji6uGfd8CrYJJGpyvLfDnTzZUTlzDhVA=
X-Received: by 2002:a5d:5f55:0:b0:382:4b80:abdd with SMTP id
 ffacd0b85a97d-38260b73d1fmr3787505f8f.21.1732310891686; Fri, 22 Nov 2024
 13:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
 <20241122-google-remove-crtc-index-from-parameter-v2-17-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-17-81540742535a@bootlin.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Fri, 22 Nov 2024 15:28:00 -0600
Message-ID: <CAO6MGtiYbPZvL=2ycHb50ATaikUg+mR8xRcxGLyme7FcCTkDpg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 17/18] drm/vkms: Introduce config for connector EDID
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

I didn't see a `drm_connector_attach_edid_property` call in this
series. Did you forget this? Virtual connectors don't have this
property by default.

Ian,
