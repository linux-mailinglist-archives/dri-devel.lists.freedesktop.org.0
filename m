Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A675105E3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59C110E6FC;
	Tue, 26 Apr 2022 17:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034E10E03E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650995216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faLawbnhHW02EYrXGuASXIKJnZrxT+4fARzUkA4OZ1c=;
 b=HWiZ5bLqPLZDIkU2Xska28y0s29XViiVXmeFTaSOw3mSI3E7wIgKK6Etbf2KQ2Ierm5XZR
 RyR+ALaqE/QuXQa7uW03sgXBh3g+R9mjKWpmeoIpa97MpYtMxaKjPn43a9wCdTDwIpo+fD
 viKx7hbeeao4sWjgM7H1pd7HQzXwcf8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-sczW8VX9MmSGPHAXnG5dUw-1; Tue, 26 Apr 2022 13:46:55 -0400
X-MC-Unique: sczW8VX9MmSGPHAXnG5dUw-1
Received: by mail-qk1-f198.google.com with SMTP id
 o13-20020a05620a0d4d00b0069f47054e58so4587882qkl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=faLawbnhHW02EYrXGuASXIKJnZrxT+4fARzUkA4OZ1c=;
 b=ke22Oi+SaLB2ZYuyUn5L4bqh/Bf2upv1xS7EGbsF2j5X4gwy/Kg1X4Tvy4TsK3zumm
 CM0RskAAcKDVbVpGiu/oF79Jtqk14L2uTdwALPLr0wLxmjzuLkT+pfXzq6jZ48jAS8p1
 tQJykoTwKpmoH4NComFHG3KQkQEug+XJR/67A2nV2CGa8IKuxeFgWsb35ZfVnCwshEIt
 9w9Zze0vSfRbmFfJNwnN7a3o07H/qKZNTilzwYoH/Met/G9Ew7HSLS3NwbT8krqDG0Qt
 3heX+y8jiq495oOO/Pv/xv/sRvZJEKdwwz5GB8igRaZ7warCA0GLWWeKG6kh3xPvNP8C
 /vdQ==
X-Gm-Message-State: AOAM532bBlWvF4qTb2pLiCN/ZsnSX/8d/K84wWr2b/bQpz+Ou5HEhRuw
 sBUNqtz50z/K/AFHJanpRJEZDaZY+RmuuuMLlwZNXi40DGOK11HmO7XCDzbg8ABmvxDY8HAsYrf
 cFv+VDi7y2DoE6m9YL4+RMPBmcsC6
X-Received: by 2002:a05:620a:108a:b0:69e:7d3c:7230 with SMTP id
 g10-20020a05620a108a00b0069e7d3c7230mr13769275qkk.616.1650995214801; 
 Tue, 26 Apr 2022 10:46:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEOSHVXcCeNEv+IDmrQTu6C7S63JG6GilAnmFbTugdP8U7PQOfDNm67g0JW/sLepxLrIYkOg==
X-Received: by 2002:a05:620a:108a:b0:69e:7d3c:7230 with SMTP id
 g10-20020a05620a108a00b0069e7d3c7230mr13769257qkk.616.1650995214552; 
 Tue, 26 Apr 2022 10:46:54 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 76-20020a370c4f000000b0069f62e55f65sm2895549qkm.107.2022.04.26.10.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:46:53 -0700 (PDT)
Message-ID: <7f2ac9892b93d452a728d07a49a4446b81ce76be.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wndw and
 gv100_disp_wndw_mthd static
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 26 Apr 2022 13:46:52 -0400
In-Reply-To: <20220425131308.158635-1-trix@redhat.com>
References: <20220425131308.158635-1-trix@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Mon, 2022-04-25 at 09:13 -0400, Tom Rix wrote:
> Sparse reports these issues
> wndwgv100.c:120:1: warning: symbol 'gv100_disp_wndw_mthd' was not declared.
> Should it be static?
> wndwgv100.c:140:1: warning: symbol 'gv100_disp_wndw' was not declared.
> Should it be static?
> 
> These variable are only used in wndwgv100.c.  Single file variables should
> be static.
> So use static as their storage-class specifiers.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> index 5d3b641dbb14..e635247d794f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
> @@ -116,7 +116,7 @@ gv100_disp_wndw_mthd_base = {
>         }
>  };
>  
> -const struct nv50_disp_chan_mthd
> +static const struct nv50_disp_chan_mthd
>  gv100_disp_wndw_mthd = {
>         .name = "Window",
>         .addr = 0x001000,
> @@ -136,7 +136,7 @@ gv100_disp_wndw_intr(struct nv50_disp_chan *chan, bool
> en)
>         nvkm_mask(device, 0x611da4, mask, data);
>  }
>  
> -const struct nv50_disp_chan_func
> +static const struct nv50_disp_chan_func
>  gv100_disp_wndw = {
>         .init = gv100_disp_dmac_init,
>         .fini = gv100_disp_dmac_fini,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

