Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35899B1F6
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 10:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54B10E30C;
	Sat, 12 Oct 2024 08:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ddbHR0pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9EE10E30C
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 08:07:28 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fadc95ccfcso28924521fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728720447; x=1729325247; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HxxIMIxHhIuN3Y4k3DLau9HTuUBGd+U2wnXX9xJ8EMM=;
 b=ddbHR0pZ38zJTSb9G9ycRbmLe0kMc1Ug9CWRr7JsNbJa3MDA3iNAH4hdr+qTm5Gfxq
 p0Jd5HmjkbZ0m1ATBYyxlEHmcG8cPgqezjgvoQppZXceFvGQl8iaRCJ0AfHkRo8gBDUb
 makq1JlfwTjd8hcoQC44zT/E0QKqQ+A3dscNpQcsp+fdCozzKu+JeQn1l1ZNaLIXAiLt
 rl5JHbg4m7ckJaEQ5viu/3McdQ7KEt9jax5vNNAaw3NO+3snOx3iM2WIYv8UGAO2gZ6F
 20Hqkyzz3hAOiX+ZJRR0qE9yegWwvIe3sQssHCOozj9f5BXRoYXXScz6XB+JdrxQo+bb
 VD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728720447; x=1729325247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HxxIMIxHhIuN3Y4k3DLau9HTuUBGd+U2wnXX9xJ8EMM=;
 b=quBehvVnK1gYrLAB4CYwBGiqKc7/IF3zs3p/AjQ52lZvotjYmUzOjE0rzVQWGxUkVh
 iztrKoenB7IKkOOM4r1L86OkYVfYBDrHS99080taR0UimwidgnJprd1dqH7+5Nmn/Iv/
 ZpbV1BKbx4O7qtSaNzRxXSJgayBa4VTAbv/1MT5F+2GFM6XebJKdVnKI8K9g1CYVMw2p
 tuKrDRFylbJi8/DZwYqoDNxN4mgRL6cbkeCpCkNdYxfoKZP4rtXHRyNsxKz6tp5MTx55
 vmg3DQxEc0KHQcfS7qLMhd7TeQmIwq3NIvxRlnaRcrSiH9AfMRHgvQ5zvymSZIQTeB8x
 JwvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqBRvcaC8s3ECNr885W0kRFrgzUJHBWbPnfzxOU8EAwp+0bAZyViILKGP+ZRDPJz2LRNJD0KkzitE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGaY1dg2Us+QANT5bCD0E4plVOmHF32WglnPenPomJoPAr3S2V
 70T5HlgbyB36dMCjCZdHJDWaYw8VzonCEga5LQzeRZ8/ti3SChpMuNjvPjwfDsU=
X-Google-Smtp-Source: AGHT+IFPL2CtCEwCTz92r494aEdLKqkcoe2mNIoQB4/KO8yuI/vw8UKQ8ZaDNAPm0kR4gfHNNuXaaA==
X-Received: by 2002:a2e:be9e:0:b0:2f5:806:5cee with SMTP id
 38308e7fff4ca-2fb32727e37mr23391671fa.11.1728720446499; 
 Sat, 12 Oct 2024 01:07:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb2474d255sm7461541fa.119.2024.10.12.01.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Oct 2024 01:07:24 -0700 (PDT)
Date: Sat, 12 Oct 2024 11:07:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Message-ID: <oxij35feivahxndatf5jpkgdfghk5e7gu3pi7zzf36xcjmoz3o@lwhwln5t2wcy>
References: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
 <st6vgd2k6dxo4vd3pmqmqlc5haofhbym2jeb2eeh2pa2n6zcca@tradpzxrzexl>
 <2469374.jE0xQCEvom@steina-w>
 <CAA8EJpraKjBZRLL5U+BVQRf98_EBa5b=nSPxZATU+yvvq9Kfmw@mail.gmail.com>
 <4133a684-61a1-4d18-bb25-212d5fdc5620@siemens.com>
 <5bb0459a-ec3a-487f-a9b5-28ee643a1215@ideasonboard.com>
 <9b0e99f5-554b-428f-856c-cc32f4520c73@siemens.com>
 <lxcxo3y7z6emrpvisibj6ccr6qx5nozchuyy5aizfvkvvlp44m@jecj6k5y6z2t>
 <1ea19ca9-25fd-42c3-b495-5df0ab6c3ea3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ea19ca9-25fd-42c3-b495-5df0ab6c3ea3@ideasonboard.com>
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

On Fri, Oct 11, 2024 at 03:02:56PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 23/09/2024 15:25, Dmitry Baryshkov wrote:
> 
> > > As Dmitry asked me during Plumbers to revalidate if our setup still
> > > needs patch 2, I just did that over 6.11.0-next-20240923 (where patch 1
> > > is now included). No surprise, it is still needed for our iot2050 device
> > > series, otherwise the display remains black.
> > 
> > Granted that nobody with the DRM_BRIDGE_ATTACH_NO_CONNECTOR + DSI-DP
> > spoke in the last several months, I think we'd better merge the patch as
> > it is now. If noone objects (last call), I'll do that in one or two
> > days.
> 
> No one has objected, are we ready to merge?

Applied

-- 
With best wishes
Dmitry
