Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6DA5F4C06
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706110E1FE;
	Tue,  4 Oct 2022 22:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007BD10E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664923197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpKzsVemo7v88CyKFfEgf2E7Bj+IhyUjNGP8q+QfnuY=;
 b=VziMfxQZAYWKTLoX+SPTi47DyXAaLULq+uELyP78EpMCgvYCFwQI7QVO8H6e34otyxwZJ2
 vqva/kCaxTR/fU+Y6wvZduKtv43gTBz+GVCuZjZx+ZvZaEkyuWSNfUf4HuQ5UNDZoShuX+
 PKoCpZiDA51LNM8O2LUg4X6StatNrCI=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-RKJGVBVgNgKZDH799Knf2Q-1; Tue, 04 Oct 2022 18:39:56 -0400
X-MC-Unique: RKJGVBVgNgKZDH799Knf2Q-1
Received: by mail-io1-f72.google.com with SMTP id
 d24-20020a05660225d800b006a466ec7746so9965769iop.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cpKzsVemo7v88CyKFfEgf2E7Bj+IhyUjNGP8q+QfnuY=;
 b=zT96PsKOlShtSMFlvtgTsV05CaTD3n1We4sKTxfohcwi2Qu4rZlF7Fbty6NZTfWUwf
 hoieG99P1I8s8FuveZczyefJpnopMIufRDiRgMeaN0kgXNS8rnLylu2EwdC0YmxApiHJ
 2UTH/2b/bXJkkl+LDEG7at/N2LHf6jtqTRuCmFOQP9Rg26wIbqPO+VLqSV2Nb+vODIKQ
 GgPEwBO3G4uRIECPjNkxgOlHHHitxWVQ+5rmo+SzWjVxhUH40EVK8TILKsOQ3YYPUU6D
 N0rsotW3vZy91jCZ5JQ8aURPlqfPy7l1Ti64iXw2MqXZxaeiKiNZ9Wd9z6jiSAOFIlL2
 ydyA==
X-Gm-Message-State: ACrzQf3kDGZSvR4iZxtnFxCCT+7/CXGNDUEW6zP2pLUuoF/L9yLL+ZgS
 V3/pjjq8JqR22bKFZ7T7j/XSXJKdQLKwDmZw9Ykq2PK+I9WcYGFN4qKCkNqVCWiM4+Ew23jO1zZ
 /uDRIqesH7pXk7jWUQv+gEaNLQwzh
X-Received: by 2002:a05:6638:dd6:b0:35a:a74e:4475 with SMTP id
 m22-20020a0566380dd600b0035aa74e4475mr13127283jaj.55.1664923194389; 
 Tue, 04 Oct 2022 15:39:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bWx3My5e7yHOWt5ghL7gOeP8iuVBvh1V3udcEzrsLcurXZ++CYiWNCKNgOh5OEQMmY3xjiw==
X-Received: by 2002:a05:6638:dd6:b0:35a:a74e:4475 with SMTP id
 m22-20020a0566380dd600b0035aa74e4475mr13127271jaj.55.1664923194150; 
 Tue, 04 Oct 2022 15:39:54 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 f2-20020a022402000000b00356738a2aa0sm5736194jaa.63.2022.10.04.15.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:39:53 -0700 (PDT)
Message-ID: <c50d4906-3f0e-0cd7-02d7-cc7f40cf181b@redhat.com>
Date: Wed, 5 Oct 2022 00:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 11/16] drm/udl: Move register constants to udl_proto.h
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-12-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-12-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Move the existing register constants to a new file in preparation of
> adding more of them. Renaming is intentional. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

