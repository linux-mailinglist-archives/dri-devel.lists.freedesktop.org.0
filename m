Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A77CA220
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721C710E144;
	Mon, 16 Oct 2023 08:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D62810E144
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:46:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9be02fcf268so354961566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pqrs.dk; s=google; t=1697445964; x=1698050764; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0Ex1fsxDQzYBUpjDdsHCxpyekcqZSNA9OBJDzzDxq80=;
 b=Nm9iGR5QhW+Ctd/RxU/ZWPR2kFn1MZUT7XO4zElAATexRjLVBacp3vfDG+lEwK5vPb
 rU0UOcO6oWyQyyByQP2tWKmacsRKXZa3xZqsbRC32N2O/6e9twf/T2MliFoZQd1Kvg/E
 mad8ds4PvHDetXBUHvryT+mE4wWBcAhZ4Y3bu8Z56hZbJjktt8HnVSx4kSERy/beS4bu
 Lb/DpVFONoIbBZCXYA8z6mFTQpW28C2fbinSUbw560FLs44QJGaEHkOOXl9zXDLQOHBk
 v+8GEfouV8EWy1zL+ZJJ5DgBOUQtY4D2uLROds3sVtovskJUg2l+sDwVfV6+M21h+sd1
 NDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697445964; x=1698050764;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Ex1fsxDQzYBUpjDdsHCxpyekcqZSNA9OBJDzzDxq80=;
 b=erfdLURQrvmgMHgn2Pa+shBZBIaOV1ZJa8XrdbBgWruVooNs1TSWeMxII9Vieym1Y9
 PdBJo+JOLgKeefmfPw5oIGklCNrMWKNdOqpkUU6eq6eUYxhp4ju5tSJC7mZSUYSlVf+z
 s/b5xOvvGt/egA7wkongX1IQaiASI7yrkMA6k3u91Jf4vn5yS0G1M7X2aZOTlkwOv/Ex
 jJVH+ge6nj/276yekyY7MAU+THwcEHgITl8P/5lPst5f/davDMNcQNZqZNMWThpcjOFh
 B6XMYR7FHXLxC+MLz/HnVSScujbw/l3baM0MeVNAs+Xl27vX33xFi/FIjXQ4OuwVG+4F
 RDsA==
X-Gm-Message-State: AOJu0YwUiaWf3ZwBMNhlSGZZK72xmttWa2QEEGCSzPipmml0NQ2sDACa
 LikC4L66r3euB+8OrtwyScHdmA==
X-Google-Smtp-Source: AGHT+IGX9Cu51HiWChDnsIGPbtwsgdrFPajLMbIzizQWD0U+FlFwPNqTC2xGshxfYcKNHIbEG1fenA==
X-Received: by 2002:a17:906:ef04:b0:9be:b12:1423 with SMTP id
 f4-20020a170906ef0400b009be0b121423mr6726851ejs.44.1697445964321; 
 Mon, 16 Oct 2023 01:46:04 -0700 (PDT)
Received: from localhost ([193.89.194.60]) by smtp.gmail.com with ESMTPSA id
 m24-20020a170906235800b009c503bf61c9sm422114eja.165.2023.10.16.01.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 01:46:03 -0700 (PDT)
Date: Mon, 16 Oct 2023 10:46:03 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: bridge: adv7511: get edid in hpd_work to update CEC
 phys address
Message-ID: <7dyh2eggk6ezag4ksmtac7b5gh3vzty3tf5547iyzlugbmwqap@rtssnbq57xuu>
References: <20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk>
 <20231016081749.GE23177@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016081749.GE23177@pendragon.ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Oct 16, 2023 at 11:17:49AM +0300, Laurent Pinchart wrote:
> Hi Alvin,
> 
> Thank you for the patch.
> 
> CC'ing Hans Verkuil, to review the CEC side.
> 
> On Sat, Oct 14, 2023 at 09:43:01PM +0200, Alvin Šipraga wrote:
> > From: Alvin Šipraga <alsi@bang-olufsen.dk>
> > 
> > The adv7511 driver is solely responsible for setting the physical
> > address of its CEC adapter. To do this, it must read the EDID. However,
> > EDID is only read when either the drm_bridge_funcs :: get_edid or
> > drm_connector_helper_funcs :: get_modes ops are called. Without loss of
> > generality, it cannot be assumed that these ops are called when a sink
> > gets attached. Therefore there exist scenarios in which the CEC physical
> > address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.
> > 
> > Address this problem by always fetching the EDID in the HPD work when we
> > detect a connection. The CEC physical address is set in the process.
> > 
> > Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
> > ---
> > Pardon the insertion of the ugly adv7511_get_edid() prototype, but I did
> > not want to clobber git history by rearranging a bunch of functions. If
> > this is the preferred approach I will happily re-spin the patch.
> 
> There's nothing wrong in rearranging functions, it is actually preferred
> to adding forward declarations. You can submit a set of two patches, one
> to reorder the functions, and then a second one to fix the problem. This
> makes review easier by isolating the refactoring with no functional
> change from the functional changes.

Alright, good to know. I will wait a while for Hans to take a look before
sending a v2 series with two patches. Thanks!

Kind regards,
Alvin
