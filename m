Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09B3A4AFB
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 00:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8CA6F3D8;
	Fri, 11 Jun 2021 22:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747C76F3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 22:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623451394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kExiGBvv5A+EuIhUUUKhMtGa8QCR+dulX5Xs6Adf1xQ=;
 b=FcjUjIr/w2qFrOt+Fy+w4LdteQFLO0hSKFGCDANwRsI5dlUnXNEd60nHA4Hv3aVdtr1+fi
 9UlhlGSAQob0k5ex6P/KfnjXItwaTxcWuSGYZ8gIXpbeLiYw9p3J5Tf9n1E+C9OJKksSfL
 ap/Oyzsy9kPiFIOwabfY3sttiqfcfZs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-RHtNR40FPiuurlWDHEM-DA-1; Fri, 11 Jun 2021 18:43:13 -0400
X-MC-Unique: RHtNR40FPiuurlWDHEM-DA-1
Received: by mail-qk1-f200.google.com with SMTP id
 a193-20020a3766ca0000b02903a9be00d619so22328320qkc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 15:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kExiGBvv5A+EuIhUUUKhMtGa8QCR+dulX5Xs6Adf1xQ=;
 b=dhqC/EbhoPrThZQRkdn3iiSW7gQ9OGhvS46LVp+7UVgD9VXhpclfC8XXWVkDqtj4u9
 3GfqtVOX1ZmE3wTyFHuydanuhMC9CRVhVgZEGEdshyC389RF6pe/DNV3ydk9YmBBDvND
 Kdznyuzk6A9aiMTAJmPNtJoxwioXhUZKE+xjNi2fLNhXPBsevCuL9S3AhfXsuowhKUu4
 S3Ax2KI/uuNsIe2/N154l2MeJeuxq7vkpOeLlstASr/xb/B9oGUgtxQsDklO97cOQF02
 Lvv1hKLUYmHrlwQQfWCrnDKA2oRO9hK9F1MNFFK46FJLYklQEvcyIZutiQlaOwe1TmuD
 utuQ==
X-Gm-Message-State: AOAM533nJNBn1JvTDhOn9A8vkV4SRwbACSlcor9rVAntBguRopAhyNxe
 eHapntvXkecWLt2RxlAM4TKVMMGGLq5BZFRf/6T/YHJ3pae+yrwvq4+WrpsH2aFi3j0SFfji2ih
 GrHm9Kkir5HbPI5KXDLy0WYulm04v
X-Received: by 2002:ac8:7f8a:: with SMTP id z10mr1069260qtj.199.1623451392744; 
 Fri, 11 Jun 2021 15:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNu9flBD/PqvuEJgUS/2gULKsxmQIdiVfihiCEB1tktW0j7DFPU7oU5ieoBJMaR7VsCBSVZA==
X-Received: by 2002:ac8:7f8a:: with SMTP id z10mr1069246qtj.199.1623451392552; 
 Fri, 11 Jun 2021 15:43:12 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e24sm4871493qtp.97.2021.06.11.15.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 15:43:12 -0700 (PDT)
Message-ID: <3889e7b888241e9acf1893235f49585ae34175ba.camel@redhat.com>
Subject: Re: [PATCH 0/2] Fix observed mst problems with StarTech hub
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Date: Fri, 11 Jun 2021 18:43:11 -0400
In-Reply-To: <20210528135557.23248-1-Wayne.Lin@amd.com>
References: <20210528135557.23248-1-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: jerry.zuo@amd.com, aurabindo.pillai@amd.com, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

haha. turns out it actually was a good thing I was busy with work today,
because I ended up testing some backports and running into the exact same MST
bug these patches appear to fix. How convienent :)

anyway-I looked over this and this looks good to me (and IMO, I like these
fixes more then the workarounds they replace!). The one thing we do need to
fix here though is this appears to definitely fix a regression, so we need to
make sure we actually bisect the issue that this patch is fixing so we can add
the appropriate Fixes: and Cc: tags so that these fixes get backported to
earlier stable kernel versions.

I definitely need this fix in asap though for my own work, so I am going to
see if I can start bisecting this. If I manage to figure out what's breaking
it before my workday ends today I'll just add my R-b and push this upstream,
otherwise I'll probably just push this first thing on monday. If you see this
message beforethen and know what kernel version introduced this issue, feel
free to respond ;)

On Fri, 2021-05-28 at 21:55 +0800, Wayne Lin wrote:
> Use Startech 1to3 DP hub to do some mst hotplug tests and find some
> light up issues.
> 
> 1. ACT polling timeout:
>    Which is due to we didn't update DPCD payload table but still try
>    to send ACT and polling for "ACT Handled" bit
> 2. Not all monitors light up:
>    Due to we wrongly set unavailable VCP ID for new streams
> 
> Wayne Lin (2):
>   drm/dp_mst: Do not set proposed vcpi directly
>   drm/dp_mst: Avoid to mess up payload table by ports in stale topology
> 
>  drivers/gpu/drm/drm_dp_mst_topology.c | 65 ++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 26 deletions(-)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

