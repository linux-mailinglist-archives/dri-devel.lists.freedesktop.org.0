Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021414353C2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6686D89C86;
	Wed, 20 Oct 2021 19:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648BF89C98
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634757874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9uSSB9q2/D0g0m9nNMQcDLuIXxHDB6JblWrJEAdFgk=;
 b=gKHYbiLu8hIGkiox8vN40XzTjizF1+VWTyDNkqccvL9G+FjMeRxUMLebp2G2UgU5rQ3JvY
 Gs7yN3TARofGKBX3a4CpD0x5cveNv32al44y4J0zVETK+wgeg3hgURABFTxRaA242K09Gw
 b7+5GT51M2NOxJZdaD/o9q2ME+lMtjA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-pQ2vP6iSN46En1wwTygNHA-1; Wed, 20 Oct 2021 15:23:29 -0400
X-MC-Unique: pQ2vP6iSN46En1wwTygNHA-1
Received: by mail-qt1-f199.google.com with SMTP id
 c19-20020ac81e93000000b002a71180fd3dso2870326qtm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 12:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=F9uSSB9q2/D0g0m9nNMQcDLuIXxHDB6JblWrJEAdFgk=;
 b=B6EWcnJ6WSHFG41J3XseGdeqKooKlTp9pw3ojdW0kxeKBjmhdwzi+XanQeaPrOUNeT
 VJSG5lqePujynkb0CdPePigHNWsDnXX07zeWsgqBitzJC5RofRhPIWPpUGGMP5QfTvYX
 1KHu8LwsxToEMH2wjoekyGGk0Y3kwReCtWBGJeHvUYF4jW0/1TbJCxVcpp6P05eSX1nV
 ysBp/izEzM/QT09Ob/fJxdubwGOVrg+HxOFiCXTr9Js8bqm5IGzeO60YJS/gfG3zCkwq
 NOTWQY+i8J6gofj9dlky7R4F3IwkhVkT17sBgPDekZeA0yOS4iO1FOpQtepkUggF8eDW
 R+sw==
X-Gm-Message-State: AOAM531coiw5D/IGhXSgCb8w+KLN/axnliVeF2VuykKDCctqEYpKguCL
 ABz74J+2uZ1RXBApxEy/Teuy3E7Otv2ao741ZX3ER1Z53rC9exf+xWxI851WxXFXjyo6ULJJQ8E
 CU8Sm2kCI/hI9JPdj4XZEyGhpYT5/
X-Received: by 2002:a05:6214:154d:: with SMTP id
 t13mr612300qvw.40.1634757809446; 
 Wed, 20 Oct 2021 12:23:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi/WpfzZroD4l2O2TiTUJFwUzG99fDvBlsFUQ0eyaoeaNvenzUPS3I4Kc3HT3gxaqg8DBRsg==
X-Received: by 2002:a05:6214:154d:: with SMTP id
 t13mr612279qvw.40.1634757809230; 
 Wed, 20 Oct 2021 12:23:29 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id i85sm1440530qke.61.2021.10.20.12.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:23:28 -0700 (PDT)
Message-ID: <db4376f7b61cdf6c3534f29a35ab84ff90ad9dc7.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm: Remove slot checks in dp mst topology during
 commit
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jerry.Zuo@amd.com, 
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com, 
 Mikita.Lipski@amd.com, intel-gfx@lists.freedesktop.org
Date: Wed, 20 Oct 2021 15:23:27 -0400
In-Reply-To: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
References: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-10-20 at 10:16 -0400, Bhawanpreet Lakha wrote:
> This code path is used during commit, and we dont expect things to fail
> during the commit stage, so remove this.
> 
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ad0795afc21c..5ab3b3a46e89 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4332,10 +4332,6 @@ static int drm_dp_init_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>  {
>         int ret;
>  
> -       /* max. time slots - one slot for MTP header */
> -       if (slots > 63)
> -               return -ENOSPC;
> -
>         vcpi->pbn = pbn;
>         vcpi->aligned_pbn = slots * mgr->pbn_div;
>         vcpi->num_slots = slots;
> @@ -4538,7 +4534,7 @@ bool drm_dp_mst_allocate_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>  
>         ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>         if (ret) {
> -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63
> ret=%d\n",
> +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> ret=%d\n",
>                             DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
>                 drm_dp_mst_topology_put_port(port);
>                 goto out;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

