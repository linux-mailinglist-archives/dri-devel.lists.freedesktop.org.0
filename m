Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE349BBD9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 20:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9D010E41A;
	Tue, 25 Jan 2022 19:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DD710E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643137915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6O4DkR4pkiSXBoigUMOsmjUeRpgHJTXKdhZ+nj+Qmo=;
 b=UgGPjdl5i9cbLUq/NMmeIF+YodUpZDJgSC9pQbZqnMGSr0wLjexYsoqfGctViu7zA2fXop
 az7+TyXDh3O1vj4CQeir0rUN7pZBNHbWAVtaMG2wffTz3QYrHc1ASsJ+zsG1KlISoqhyYj
 6JHM2Ak+OSRowOFfO8Z7AGEsJh8o7ww=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-wIn22plEMxS0lr9d92T7eQ-1; Tue, 25 Jan 2022 14:11:54 -0500
X-MC-Unique: wIn22plEMxS0lr9d92T7eQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 j30-20020ac84c9e000000b002cf986622d1so4747519qtv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 11:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=L6O4DkR4pkiSXBoigUMOsmjUeRpgHJTXKdhZ+nj+Qmo=;
 b=mDNC0YCRgHdkV+4FMiL+k7CImMql213JkMclilyL0kDG7Ulwo13jeIwxgH7Uid8/Aj
 93ccjGo8zS1ffdX9yEa9RO6d7pe0vwXbuZlO3QvgMdzy/plvE3+XoqfjY/WcvvdBTQmY
 70PhToIQbX/ldjfTi3SqgjDn7MF7L1YQUZi+m6ji5O7gaxENOlTMSxlToHQcMiDPE/yT
 wh7vaXSF+oOm+lLAmUjObOIryZuSEj9FQv4Fi+E6AESp8V4MgKPJwvMMvsEuwiuAxbxv
 VZQdYYnCMpA0/68TAWYHYoluAinnJ4Ts3VYQr2nM28m9kLpTzTx4z3XW59lLZTPhjLWW
 UBBA==
X-Gm-Message-State: AOAM530erxiYGhMXvC2yhw3h463fDNN2yoviZKj8Xu4oAo/kw/IscvQ9
 HbxCctfOxY1C6GCgJEhGV1XX96VLqI6c693Gv5Oe/fDoIjcD8yeA7bOvM2KXsLXi/2DcNHPIHTp
 ZCnz4fGSTCU4PmYVEBZP0sfo/A7iT
X-Received: by 2002:a05:6214:629:: with SMTP id
 a9mr20865487qvx.110.1643137913962; 
 Tue, 25 Jan 2022 11:11:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTyeEPxlKSHce5gJ4OzKH9x9AC06WyRvPSC70RRpnsuw3uVK9P/wNr8ukPE4ZiYev98vFTRA==
X-Received: by 2002:a05:6214:629:: with SMTP id
 a9mr20865470qvx.110.1643137913719; 
 Tue, 25 Jan 2022 11:11:53 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id d6sm775112qtb.55.2022.01.25.11.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 11:11:53 -0800 (PST)
Message-ID: <7f6be58affaeac27bd3799134abe16ceba38c9a8.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
From: Lyude Paul <lyude@redhat.com>
To: Zhou Qingyang <zhou1615@umn.edu>
Date: Tue, 25 Jan 2022 14:11:51 -0500
In-Reply-To: <20220124165856.57022-1-zhou1615@umn.edu>
References: <20220124165856.57022-1-zhou1615@umn.edu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2022-01-25 at 00:58 +0800, Zhou Qingyang wrote:
> In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> passed to memcpy(), which could lead to undefined behavior on failure
> of kmalloc().
> 
> Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> 
> This bug was found by a static analyzer.
> 
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> "secure boot"")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent 
> security operations (e.g., checks or kfrees) between two code paths 
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs. 
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> index 667fa016496e..a6ea89a5d51a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char
> *name, int ver,
>  
>         hsfw->imem_size = desc->code_size;
>         hsfw->imem_tag = desc->start_tag;
> -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> -
> +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> GFP_KERNEL);
>         nvkm_firmware_put(fw);
> -       return 0;
> +       if (!hsfw->imem)
> +               return -ENOMEM;
> +       else
> +               return 0;
>  }
>  
>  int

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

