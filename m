Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E160565F20
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 23:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3435810FA32;
	Mon,  4 Jul 2022 21:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0FA10FAFE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656970353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CZe8Sqi7DtJlbJu8xa2TOlRoA4m6XJLDJlm9ljsZMU=;
 b=eoEQH1QW+GLlBWMmSlKVhJoSFBY3kaDBzBl0JzmQqXVQlxjgQJXLe7LG9yvFjS2d5rKGwu
 k2bx1qxV6rMgUSHKLa6e58ZugXXz3rsIu2psNECOS/ExCE1EkvxBYfubPhGZz+7RnlD2j1
 W+Q2nJYOR7P4MWh3d2OZPI/SDR3HosE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-FfDCy-ZIPay9WvYTFxaH2A-1; Mon, 04 Jul 2022 17:32:32 -0400
X-MC-Unique: FfDCy-ZIPay9WvYTFxaH2A-1
Received: by mail-qt1-f197.google.com with SMTP id
 u2-20020ac80502000000b002f94701339eso7699240qtg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 14:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=+CZe8Sqi7DtJlbJu8xa2TOlRoA4m6XJLDJlm9ljsZMU=;
 b=mhLQdE6caiij3gLnw7UudWd4+1BlfmqCKTYoCykyOWnl2uBuZDuM6L7Ulz5FjAShBx
 0FXueqUhEtmFCWvq00P7MPeR3yPWki5GK/h8mm/RMGjrgJQC52ZYJNcY+0IEork6LOiE
 0Mw8vPycWOelWHg/Rec7hiEKpMdydq+UR1gulWtcD3hqD5pWujwcTj1QERgQzfGynDCi
 0AFQYlHVI6gfOaTTnCPjGACWTJKTFthbpsrmJQa1cQ2XZkAlVHLjfOmA0v/+s2D5QbOw
 W2IiJ0VNOTG7Co/nPxzd1V+KjpU5rUxDkcd7Y/4jMquWrY7fuU4q0SVzpPj0yQ+qmnri
 ujDQ==
X-Gm-Message-State: AJIora8nbC6LEbJb3ZqWN6aKrnyaMn4XjAgaX9kXV3oGNyg3FmPW/JpM
 WKKc3awRyVFlDST6FRl3StLtukwubSBipl5y/ys3aa0ypBiXblS2hl0uLBbJHfNA7ubL0xITY8T
 V4aIVv8cVIBeh7w7IVLYdw9pG7RvO
X-Received: by 2002:a05:6214:2a8e:b0:470:911e:9565 with SMTP id
 jr14-20020a0562142a8e00b00470911e9565mr29602439qvb.37.1656970351716; 
 Mon, 04 Jul 2022 14:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYMDnzTOdu6YjQ9ZTKxQBwIiV3zh8YsFLMwenBFFfbrSK9BSxwAVULZ9blVHT+e6pMwUZk9Q==
X-Received: by 2002:a05:6214:2a8e:b0:470:911e:9565 with SMTP id
 jr14-20020a0562142a8e00b00470911e9565mr29602418qvb.37.1656970351439; 
 Mon, 04 Jul 2022 14:32:31 -0700 (PDT)
Received: from [192.168.57.2] ([172.58.188.184])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006afd667535asm16029818qkp.83.2022.07.04.14.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 14:32:30 -0700 (PDT)
Message-ID: <91194b7190081545a8eeb10d20e24de864dfe259.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios: set info only when the return is not 0
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com
Date: Mon, 04 Jul 2022 17:32:18 -0400
In-Reply-To: <20220702153904.1696595-1-trix@redhat.com>
References: <20220702153904.1696595-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Currently on flakey internet in the back of a car, so I probably won't be able
to push this until I get back tonight or early tomorrow

On Sat, 2022-07-02 at 11:39 -0400, Tom Rix wrote:
> clang static analysis reports
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c:68:17: warning: The right
> operand of '*' is a garbage value [core.UndefinedBinaryOperatorResult]
>         switch (!!data * *ver) {
>                        ^ ~~~~
> A switch statement with only a default should be reduced to an if.
> 
> If nvbios_pmuEp() returns 0, via the data variable, the output info
> parameter
> is not used.  So set info only when data is not 0.
> 
> The struct nvbios_pmuE only has the type and data elements.  Since both of
> these
> are explicitly set, memset is not needed.  So remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> index b4a308f3cf7b..49e2664a734c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> @@ -64,12 +64,9 @@ nvbios_pmuEp(struct nvkm_bios *bios, int idx, u8 *ver, u8
> *hdr,
>              struct nvbios_pmuE *info)
>  {
>         u32 data = nvbios_pmuEe(bios, idx, ver, hdr);
> -       memset(info, 0x00, sizeof(*info));
> -       switch (!!data * *ver) {
> -       default:
> +       if (data) {
>                 info->type = nvbios_rd08(bios, data + 0x00);
>                 info->data = nvbios_rd32(bios, data + 0x02);
> -               break;
>         }
>         return data;
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

