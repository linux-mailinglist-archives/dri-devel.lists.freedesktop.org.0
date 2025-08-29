Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C75B3C0FE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 18:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994AE10E1AE;
	Fri, 29 Aug 2025 16:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CjWS7FkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B47710E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 16:40:48 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-327b3e24637so1388791a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756485647; x=1757090447;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1fz4tksacw/4xBuqyAP2+l68JOuUmAfZLQKxwsqSVUE=;
 b=CjWS7FkVwPrd/SVn4x3/SC7xI8vMaGVUYYpgWDRA86VLrGrPTTKzjRcGn8nssJLDKQ
 HTKCrLHwk2YlxYK6WKwy5zhgtQGBC4ewyM8RRMOoin5B88orvBwr0Tl0y8hesZ8Ydcew
 oabL/D6xc7xzWFaVkfSDqlqdqnfMs2Z18TmOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756485647; x=1757090447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fz4tksacw/4xBuqyAP2+l68JOuUmAfZLQKxwsqSVUE=;
 b=d2tC6k7KCFNe52dfq3599h5CMIxMkg9X5m/Xrwva+COofknA2aTSwU4O/xeq/E0upe
 H6wGtGOSYTBAbYUW/0Z2cdzuOhZ0N/xn1Rqq4L1FDH488XbJm9BaPYsi9e2BIiGcUU14
 xpmc3CnURvtzYoD5XNvi3rowOsMnZAGJEYlD2eokqYUiMioavD/u0Vpfnj4mCzYoPnOi
 jU/nsTTpFfHAucqFeSta+Vo8/ZZeIIuTtS67+mhY/PF92LllZGDRR5yr27kB+lWcEK2p
 Dy7l1v+Cg72IsXM/a7VBc47D/CAMbrMksWZwTgcYwLVhgcYva9GxEdM47HKdX2ZW0T7o
 KhZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfsN6AnpkVSg5l0GjsSE7fKN41WpPYR/YeXKZ26/8US/0UyBKBt5WcOSxeg9t18lUwYUsD5vzJkoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSn3PWYwkhMtDt8eg/sCDO5lbG2MtP4vXjc9kA4sgkVcujU3OY
 alxY2NTxyVA91PErj9srqINbFL/I5p7bJ1a7Zb6BB8t/uRFGen9H1Kju7ADxscF2WILcpy/ywZ4
 WVJY=
X-Gm-Gg: ASbGncvfBd5gd7HhiaKAdMxLVOw6PwtKBMMe+jOaIq+eiLvDtg89sVmy22HdwF4ic+Y
 Jb0vbfX2BPH0QlFaQlvHHpdI0pmgQxGImd1mBnIh6cfiSB5G2mgjV2G0Wf20Jv5A47CmniJ2ZJn
 lDfbu2R2EcqnVXUcQXHBAO4WdxTNMa6Bx4gDEqNlx6h2lISCcxywqUn0O9SHMat62Mrgmah5OYM
 ynPGG/7WSB9wvFopTuUna56vIF2eC6fU0oLD0rV/FPnid/XPwTp8PsIsEW9PKlYZXPtNicp45vT
 9kWxvaz8ow8xgqYfpaCAHzycGOcsZZVw5bRW9DoqtbaUK2t3VctAO/7IkjO9+oe/voN8Iqy26RF
 RdVU7c+bi+/VCApqcQcWOhMClLLG/igH8iVokSWcnIj8q4/8bprqrpBZpFtjgo/MvVg==
X-Google-Smtp-Source: AGHT+IHOa7Brtzt6rVRzJBzd4d8unZqaGriR1glbMUuYlgd925Q8Y29rvGxGOKums3UGf4SWRkcpHQ==
X-Received: by 2002:a17:90b:3ec9:b0:327:5360:5b11 with SMTP id
 98e67ed59e1d1-327536061fdmr17378595a91.27.1756485647219; 
 Fri, 29 Aug 2025 09:40:47 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com.
 [209.85.214.182]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276f5961e4sm8758157a91.11.2025.08.29.09.40.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 09:40:43 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24664469fd9so21497145ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:40:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX8HWCq1Q/rw++N2UvO23AVh5qtab4nqidpkbvi2oJiz5Bq9TU7KsRfCi8dhklHr5Z9GAr6EkdjdD4=@lists.freedesktop.org
X-Received: by 2002:a17:902:d2d0:b0:249:3027:bdbb with SMTP id
 d9443c01a7336-249302838c0mr15491195ad.0.1756485642821; Fri, 29 Aug 2025
 09:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250820152407.2788495-1-john.ripple@keysight.com>
 <20250820152407.2788495-2-john.ripple@keysight.com>
In-Reply-To: <20250820152407.2788495-2-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Aug 2025 09:40:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VfCWFViDE1a5-_KtH0Pfo2EnCJeo2k8MaWuRHhmMPMMA@mail.gmail.com>
X-Gm-Features: Ac12FXzH9d02U9lFxI5VRyuDKW_pjuvPCwYTO6NavU-RzNP2_mnL2seCn59eOxw
Message-ID: <CAD=FV=VfCWFViDE1a5-_KtH0Pfo2EnCJeo2k8MaWuRHhmMPMMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: break probe dependency loop
To: John Ripple <john.ripple@keysight.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, Laurent.pinchart@ideasonboard.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org, 
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

Hi,

On Wed, Aug 20, 2025 at 8:24=E2=80=AFAM John Ripple <john.ripple@keysight.c=
om> wrote:
>
> The commit c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our
> DSI device at probe") was intended to prevent probe ordering issues and
> created the ti_sn_attach_host function.
>
> In practice, I found the following when using the nwl-dsi driver:
>  - ti_sn_bridge_probe happens and it adds the i2c bridge. Then
>    ti_sn_attach_host runs (in the ti_sn_bridge_probe function) and fails =
to
>    find the dsi host which then returns to ti_sn_bridge_probe and removes
>    the i2c bridge because of the failure.
>  - The nwl_dsi_probe then runs and adds dsi host to the host list and the=
n
>    looks for the i2c bridge, which is now gone, so it fails. This loop
>    continues for the entire boot sequence.

Which i2c bridge are you talking about? You mean the one created by
i2c_add_adapter() in drm_dp_aux_register()? I guess I'm confused about
why the DSI probe routine would even be looking for that adapter.

In any case, I don't _think_ your patch is valid. Specifically, if you
notice ti_sn_attach_host() can return "-EPROBE_DEFER". That's a valid
error code to return from a probe routine but I don't think it's a
valid error code to return from a bridge attach function, is it?
