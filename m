Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E4B6BE8CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D519510E0FD;
	Fri, 17 Mar 2023 12:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6599910E0FD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eo1WKLp2v0l3dRuC92rwAg+2aExdvyKS3ECtlqOamrY=;
 b=HY0vZ7mnNBicAkjPSgKNFXSfVGLlASglJxKkysPCfeHOxx1lJMHayeNpVsincynhvrDlUa
 koQtoibihOHfmAe16C2Pv3yBO5dZJCe6pD0Pa5olk0ZbWUojZAQTqoo2WfAWM23N0dMOTi
 WpIs1CP9bfgAbYs5eGn03PqGF1ED3sw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-Zk8M3CmnN0apLn1LGQh6Dg-1; Fri, 17 Mar 2023 08:07:33 -0400
X-MC-Unique: Zk8M3CmnN0apLn1LGQh6Dg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bd27-20020a05600c1f1b00b003ed5cf99f0cso2037872wmb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054852;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eo1WKLp2v0l3dRuC92rwAg+2aExdvyKS3ECtlqOamrY=;
 b=b17CR79zKshOvs+DwDmtzhltos4jnFMW/znIP+DwAwcRBXqvywnMCQQQ/OY01FXBrz
 LUzkQLgfmcXfSzKe7UPWKX45EPCWfU5PPhHh6V058jtIfnuu5EAk153U+hJlOgNh86vU
 o8BkmRnaUiNvDZIzFpJsBH6vcv19lyWARbOA+oI7xSNUzYSmIgQcrMCpq8UX/hpEhJ83
 N8KmCCE2AF2wyXXuhSCWBMxFkOe5dcavuiNiwpulC/7qW2JM6wnnTchQiKqa0wStOdCa
 zrpK1Rfp3weJdNq5qnbxsIPqCce8BVlyGb5wx37aEAPZk5MtKc6FhXXciHIciWg4mBtl
 beww==
X-Gm-Message-State: AO0yUKVE+CKd+vSywSM8HnjWNx2Trce7o59al2BCG4GUbSO1Ii0R6syC
 IgH0GKYvZD4ScmxdNw5DdNZ0cCzrG3/G88ap42dVsTrFPHBfa/Pc6T2orABYkkPBB5QOPPkQuO9
 9ilX3qcbBE13rr6z4nj8zOJRPbY8K
X-Received: by 2002:a05:600c:35cd:b0:3e9:f4c2:b604 with SMTP id
 r13-20020a05600c35cd00b003e9f4c2b604mr26248200wmq.24.1679054852189; 
 Fri, 17 Mar 2023 05:07:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set9JIs+ZFlKMVVJLVuQfgvks/rlZQd890aiBHWnlwHnMqRlr0MShx0FN0qKjJg7W32AYlyfAWw==
X-Received: by 2002:a05:600c:35cd:b0:3e9:f4c2:b604 with SMTP id
 r13-20020a05600c35cd00b003e9f4c2b604mr26248179wmq.24.1679054851917; 
 Fri, 17 Mar 2023 05:07:31 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003ed2987690dsm1827307wmr.26.2023.03.17.05.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 05:07:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH 3/6] drm/fb-helper: Export drm_fb_helper_release_info()
In-Reply-To: <20230315161442.27318-4-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-4-tzimmermann@suse.de>
Date: Fri, 17 Mar 2023 13:07:30 +0100
Message-ID: <87v8izpon1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Export the fb_info release code as drm_fb_helper_release_info(). Will
> help with cleaning up failed fbdev probing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

