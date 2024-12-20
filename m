Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFA9F89CC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E7610EE38;
	Fri, 20 Dec 2024 01:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FKR7crbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A2710EE38
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:57:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so1434144e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734659828; x=1735264628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKF97CWKYEirFy+7zjYnwy4f4hYpMuqFypz0Sr+KGDw=;
 b=FKR7crbD8KmnDN/4zD699R4KdikNx00Q121qOGt2hQrl9RMZ8pDcpLwwBA5rx6q41A
 M+l7KMQrwf+HDLXAebfIaAX1nhqc4Zx2soqJxZf1PmyxSY0ohPxApsbf6up2SQsFVT70
 LQCBuqzCTEjgzvHFZwpz5TdqN8jfc4yoFVq5plfnxE8QBC4Bgn2UgZniCrfajRR6x8ND
 9YxR/xlcyfIRkGvhQFiHk/X51spzQai1oh1piQNuTunO0nx3Je6/0SpkuHNB0iGwSzy8
 D7ZwXZub9O0WzrLBN58mwQluknQr7DDyRg1J4FVIRyBpdHo21f/S+cQJqCwcvdTNHJYE
 CKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734659828; x=1735264628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKF97CWKYEirFy+7zjYnwy4f4hYpMuqFypz0Sr+KGDw=;
 b=crVpQThK7NnKJCjj7BB9qDC7bNNfuZ7i2Wo/puNj0FpqWYdPCgTmVFTx2xrD6BhiQT
 NjeaqSnfytAIcRD+J0N0wURZTL0S/BnaORwgeAQ271g31bU15YI4aiUUZGE1wQEJIv0B
 tyLnwrtxbT9X1TSdNQdjPL4WgkNymzMznUzqQPGe4AMWo/hi7Kup4ukQyzopLkayAfSz
 +NYd1HeU0jHt0mu9TuVXD/m4xHtV4BydhTW4lOZuybz06/vPBfMERIRior56D7VUf8jN
 upZsr2S+NDQO9frU9ahyrPsX0VJ0wW6Ue2qIU/z6DmwhSSO6M38K0vQqUujcePYEi3kH
 m/8w==
X-Gm-Message-State: AOJu0Yzwh2HB/u6wPUEDQjdkmf3Ve5SzDoImX7kTsJmRBVoVZFs4KCCl
 +OMJAliaq+SV7j+iFtF9rRfGW9k473J8OtH8KMJUZr6SZ8ZYOkFHl6OZFRULd20=
X-Gm-Gg: ASbGnctfLTTdbcuU5JnIswPLSKpN59GH2bzFaiSjwYmhHOfqSN80QTMRXWGN5XeCdp+
 /QP3ufT/zItZLt1bSavcQSFvARVC/qyZisupbHMbNMi9zXzvbB20GvwXseod9NIAJ9FWn3XW145
 d8XdsnA5Z+QM2+KlbTemV5qeZ2LY9TU1jAWo3UedzGQH/60VFPvC0x2eWbr1+d2f7JfTz4/97YP
 H/BDU13RH5bIGe54LWLGpmuhf9XhDUN8eDr+7awPdMAho1ULxACQ22MRJfba2mDXk51/muYANCw
 mfk7KL9rzYsK3vFCCzMiNOXB
X-Google-Smtp-Source: AGHT+IFgzJnloFc1dTerOitd4Z9GiIwN4ImecpWH4CnEsJDKgPfGIYikaFitcqfhmcqY2lD1SVH3lw==
X-Received: by 2002:a05:6512:3d0e:b0:540:2188:763c with SMTP id
 2adb3069b0e04-54229582f81mr209132e87.37.1734659827907; 
 Thu, 19 Dec 2024 17:57:07 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238214eesm328324e87.190.2024.12.19.17.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:57:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Stefan Ekenberg <stefan.ekenberg@axis.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@axis.com, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4] drm/bridge: adv7511_audio: Update Audio InfoFrame
 properly
Date: Fri, 20 Dec 2024 03:57:03 +0200
Message-ID: <173465975413.3473111.3743905564277028513.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119-adv7511-audio-info-frame-v4-1-4ae68e76c89c@axis.com>
References: <20241119-adv7511-audio-info-frame-v4-1-4ae68e76c89c@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Nov 2024 08:40:29 +0100, Stefan Ekenberg wrote:
> AUDIO_UPDATE bit (Bit 5 of MAIN register 0x4A) needs to be set to 1
> while updating Audio InfoFrame information and then set to 0 when done.
> Otherwise partially updated Audio InfoFrames could be sent out. Two
> cases where this rule were not followed are fixed:
>  - In adv7511_hdmi_hw_params() make sure AUDIO_UPDATE bit is updated
>    before/after setting ADV7511_REG_AUDIO_INFOFRAME.
>  - In audio_startup() use the correct register for clearing
>    AUDIO_UPDATE bit.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/1] drm/bridge: adv7511_audio: Update Audio InfoFrame properly
      commit: 902806baf3c1e8383c1fe3ff0b6042b8cb5c2707

Best regards,
-- 
With best wishes
Dmitry

