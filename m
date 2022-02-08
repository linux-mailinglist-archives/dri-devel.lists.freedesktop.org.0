Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECDA4ADA7A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 14:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902DE10E4C6;
	Tue,  8 Feb 2022 13:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B16810E587
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 13:56:34 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eg42so21849696edb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 05:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1KYUsCDR1iSxVxCml/jhw/hl2p2+gvmglE1tOJdZtqM=;
 b=o66uVybAfrBRcV0gBzAqSGyDxUnpGYlHK6KCm3kDwxiHu/vRA1m8J/dYohiL3n9Za5
 MNrgvt72faoBRIFZPnmPPkrpxBvIcVIC0Pe+B/ByL85ExHwZYANJGS49c3khtXizgw1O
 cO5aFXwKsWjEE2MikbNR20nt5n5TT5KYggztdM2PfQ7yVHPg73GnLtGqPjGitNbMV4xJ
 z6k9+ba9gGTqK9cBX6+1qtiuEz4kFSooOoikQFPW5XWikQzezt0GGj3RfhUcAzz+NrMv
 gaiowJoGdJg3jm1tCVIGng+x1X2/JeEmmPvvTqfBESM0r84x7GdJ3rdtt/KeNL+V2IXw
 JhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KYUsCDR1iSxVxCml/jhw/hl2p2+gvmglE1tOJdZtqM=;
 b=UnY5uNYkniahMWrJJvVWfZTp1ifQiXInw4tcujfzlo6dwPhi3yxbhUf6Wxz1yn0ec8
 +UfXeO9AXr1VtNnxmUuyUj8iPmub29ZVNH0OvrliOF1xPFrH4Gj4UgbkLANDbm+SyYTG
 XzBVymD7JPueyzylUB4eKsqxN8cDZ2FaOSCMnsPxVnO/Zytk5y4x5VdN/+D+u8qs1G+J
 sK+ojzv+gV1kIROz4Dl2A3vfRZf9ywbMDGctkG1S+VIlEGMnpOAnteWS8di9/G3sJ4rw
 H5wIaetBdsGoLO0fXzdAYNF2m1kBXM2lz2nKxtVCgIE+rdI5GtzdepfLMUwQaGKYXHFu
 l77A==
X-Gm-Message-State: AOAM530rafaWNadkMyZw7OhwsQU+LJweF7bUlMQ4MRX//KQMMjvk9mkT
 FedNjpB1z3HX2vtCz2R7KAo=
X-Google-Smtp-Source: ABdhPJz3LX7wIZPAbp6gWO8Drhb3MvhaAYJoOWHVG2tsxZV9Z+BCcBLk/+m7XzGikZs67sbnnktU/w==
X-Received: by 2002:aa7:c043:: with SMTP id k3mr4546167edo.184.1644328592616; 
 Tue, 08 Feb 2022 05:56:32 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net.
 [89.212.178.211])
 by smtp.gmail.com with ESMTPSA id t8sm1620679eji.94.2022.02.08.05.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:56:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 18/23] drm/sun4i: layer: Remove redundant zpos
 initialisation
Date: Tue, 08 Feb 2022 14:56:29 +0100
Message-ID: <3469895.R56niFO833@jernej-laptop>
In-Reply-To: <20220207163515.1038648-19-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-19-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Dne ponedeljek, 07. februar 2022 ob 17:35:10 CET je Maxime Ripard napisal(a):
> The sun4i KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in sun4i_backend_layer_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


