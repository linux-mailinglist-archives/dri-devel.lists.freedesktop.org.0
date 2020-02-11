Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A484158B59
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 09:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC9A6EDF7;
	Tue, 11 Feb 2020 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050A6EDF7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 08:37:37 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w12so11152046wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Na2M+tRUw3DCFcB3ipBiFwcqwV93zaQwJq0JYti7BI0=;
 b=BFychGtdnTwxp2Sf7F4Rt8RgZ+OfTEpB7vJbBKJf451dCNA20TixK8NKfT3xl0SXrc
 H2G5M+6IOPLvgRX/HF5rHWytHUKqhpIFHW/ZaxK097KnSLpQStH/GJQvOEgrmWpaKk2b
 fQC+tl7jPlikLcNQRjCqh3V66K2hCMi6YgcHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Na2M+tRUw3DCFcB3ipBiFwcqwV93zaQwJq0JYti7BI0=;
 b=lkLB07lJJ5S/g6QPHZGPyTsAwdEcDVlZcVYWwkqPCQ1zE2dhV55LUYLXE8hUBaFX1c
 T0+mPaLjSIESBjiqzERRJKXjrH21eZz3NTM7B42VBPQb9dArLLkAzcchXhPrgFoXOYXE
 aTP+en357947RF6HPV6q02DKKFHUGxN4b7TJGLTy5ZVRjkXMDD8Qcd+5nVf5N4TBFLQ6
 T08mAqZUB6I2MrxsZ0AUP18toGTyDq6jbKVhUasMP9W49oGtbJ8QAHS9WBFW8c5g5Tan
 41ny31c0w4jKoBnlQDh6vmCQnXrIf2qODgfTyk8szEW1UJWNsHWNJlWdW6+fY2j+yRT5
 qHqg==
X-Gm-Message-State: APjAAAWB20jowD3k3ph1BWqUIRV2VRwylBGzUR78svSkWKy+YGuau0EU
 kMlYyRkmnG3tOhd/rC/RaT4/pA==
X-Google-Smtp-Source: APXvYqzvfJ8Za8TOVTfKZnBJ5oGi6BI/nCHpXb2BYNzjcWyMJFelUivBF/3aW3AvdilEpFm07Ix0SA==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr7171037wrs.395.1581410256522; 
 Tue, 11 Feb 2020 00:37:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b10sm4432682wrt.90.2020.02.11.00.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 00:37:35 -0800 (PST)
Date: Tue, 11 Feb 2020 09:37:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emmanuel Vadot <manu@FreeBSD.org>
Subject: Re: [PATCH 0/2] Dual licence some files in GPL-2.0 and MIT
Message-ID: <20200211083733.GV43062@phenom.ffwll.local>
Mail-Followup-To: Emmanuel Vadot <manu@FreeBSD.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, tzimmermann@suse.de, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200210153544.24750-1-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210153544.24750-1-manu@FreeBSD.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, tzimmermann@suse.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 04:35:42PM +0100, Emmanuel Vadot wrote:
> Hello all,
> =

> We had a discussion a while back with Noralf where he said that he wouldn=
't
> mind dual licence his work under GPL-2 and MIT.
> Those files are a problem with BSDs as we cannot include them.
> For drm_client.c the main contributors are Noralf Tr=F8nnes and Thomas
> Zimmermann, the other commits are just catch ups from changes elsewhere
> (return values, struct member names, function renames etc ...).
> For drm_format_helper the main contributors are Noralf Tr=F8nnes and
> Gerd Hoffmann. Same comment as for drm_client.c for the other commits.

Can you pls list all contributors for each file in the commit message, so
we can make sure we're collecting all the required acks?

Afaiui for official relicensing, we need everyone.
-Daniel

> =

> Emmanuel Vadot (2):
>   drm/client: Dual licence the file in GPL-2 and MIT
>   drm/format_helper: Dual licence the file in GPL 2 and MIT
> =

>  drivers/gpu/drm/drm_client.c        | 2 +-
>  drivers/gpu/drm/drm_format_helper.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> =

> -- =

> 2.25.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
