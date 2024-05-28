Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F98D26A6
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A691127C3;
	Tue, 28 May 2024 21:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dJOEqD6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77D71127C6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 21:01:21 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-43fe0f361b5so772211cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716930080; x=1717534880;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAiZLH4SqBbY1UwV3SCGGHNBB/wuO7Z17nSxSfKqNPs=;
 b=dJOEqD6SJvsadgUnrUDHMUFqW3qC/It0Fiqio09N58J6KV9h4SHx1yeuS+Dum2BP+P
 8qbJ8/BJ/CEvhfArsRdgTpRyecWbXvvMveiyd03crmaqQ+ZJyGOSksiCTieMtiEh9uds
 ci86OShT+/+3NNq0TWK0BRmCA6qCZSHLpbj6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716930080; x=1717534880;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAiZLH4SqBbY1UwV3SCGGHNBB/wuO7Z17nSxSfKqNPs=;
 b=TD/aICl/XLWh4LmRAF7boIiVaRjcKOHTplttqAY/4uHIedj7yS53iU89upz752H0rm
 3FDTIUglJ/G4qJq2UEsPtN+CQjiE9whabrWRcpDgzfush4SDeaICnW/av3xc1Bjkot5H
 oQJ3NBqylOFksNBXuJdfv1//aHGAbzlO1WCWgeQsJrixOjpN/IdLldi6Aux8qgJYmkRH
 O2Nyh11RVLfCFg6PbNtlkTYpmkvdFB+jaXZIWmAY51Gafmk1lgi7TGmAWOqTUATcm+a2
 YtbYptYCpBFOwAVYZrbT47QT0gg9kin0JmnzAonntgwSXbYQTsIFVg19bkwrFaNGdffu
 UWKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6k7hpd06bDKKddIjJi61YGZ7RcLN/5yysa3d97NLSW9EcmA0zmLGbQPwVtKjKMlsgg36ISewI7ggVjco3Eb5gP153iv9YWLOEgxPYWB8E
X-Gm-Message-State: AOJu0Yzc5IRKZ4vzJ/hP7cUgrWM3EVp10X8p0kWQbYgx2EZp9fq5AvpI
 pvrjDjKmr+gzb5ECAGEttMKVPOJPSbUJwC3qLjAgrX83tFfBH4gHhBhjV/ckKS7NUXkegT3Q61Q
 =
X-Google-Smtp-Source: AGHT+IH/aDj7bMiV8Xi1QJ5PpPajJikjpnmE57h81Rji/nYDnPgdWuQBBcciFZ3lYiefzUkzn7W3Ig==
X-Received: by 2002:a05:622a:199c:b0:43c:5d51:9e88 with SMTP id
 d75a77b69052e-43fb0e41208mr122945341cf.16.1716930080198; 
 Tue, 28 May 2024 14:01:20 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fe20ea4acsm85531cf.80.2024.05.28.14.01.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 14:01:19 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-43dfe020675so156931cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:01:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUb8nHkmHFQM1cjSdq+tTd7uKSJyOZnDJnRZ/Pawrtj8kpwnfE6bFmKdpKqGLC+WdMwfS5H+ZceWCdy2b9oiOY/kb82eojw4LKG/7zwy8iV
X-Received: by 2002:a05:622a:4d91:b0:43f:b182:df58 with SMTP id
 d75a77b69052e-43fe0f4cf97mr504881cf.4.1716930074114; Tue, 28 May 2024
 14:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240527095511.719825-1-treapking@chromium.org>
 <20240527095511.719825-3-treapking@chromium.org>
In-Reply-To: <20240527095511.719825-3-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 May 2024 14:01:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WS+3V0EfXnS2b_t+CFZqea5OM=fs9NMRKapLiQ9qB12Q@mail.gmail.com>
Message-ID: <CAD=FV=WS+3V0EfXnS2b_t+CFZqea5OM=fs9NMRKapLiQ9qB12Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel-edp: Add more panels with conservative
 timings
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Mon, May 27, 2024 at 2:56=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Same as commit 7c8690d8fc80 ("drm/panel-edp: Add some panels with
> conservative timings"), the 3 panels added in this patch are used by
> Mediatek MT8173 Chromebooks and they used to work with the downstream
> v4.19 kernel without any specified delay.
>
> These panel IDs were found from in-field reports, but their datahseets
> are not available. For BOE 0x0623 and SHP 0x153a, their product names
> are retrieved from the EDIDs. The EDID of AUO 0x1999 does not contain
> such information, so list as "Unknown" in this patch.
>
> Update these entries with less-conservative timings from other panels of
> the same vendor.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and as usual with small updates to this table I've pushed it to
drm-misc-next without a big wait.
