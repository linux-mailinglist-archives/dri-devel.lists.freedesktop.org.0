Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CFB4AEF88
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 11:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3204010E159;
	Wed,  9 Feb 2022 10:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64E710E159
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644403907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYFy7BMiWbtWBf8GaXfPbPwH1OfRn9IqKlMqs/8Tk+U=;
 b=ehmEAbzjiVypG1BL7/0Yej+jz0gtn4cgwVSXnb8zgaW65lQsXeOFdmFG2jFSSfBudGH2hX
 rr3twTNruZ/USDfXZKiUF4iD1CoUGG5cezZqsV/J85TR9tW9NQxdxh0hoP/EXXxnBSVwaU
 SOmSBcB6OIW6N0RDwPAywMRMQipoBrg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-mhAGjj1zOxinjsm8SowksQ-1; Wed, 09 Feb 2022 05:51:45 -0500
X-MC-Unique: mhAGjj1zOxinjsm8SowksQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso2474918wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 02:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EYFy7BMiWbtWBf8GaXfPbPwH1OfRn9IqKlMqs/8Tk+U=;
 b=yibdqEx0Gy7FQd8tomBsN7BmznLP67P+PJvrSaURw6N/lCKLoXmSveajeSTrNRTZRk
 glrNMxVxLVnt+nOGnk1Ye0moAruwsMZV9PHT2EGBay+9LkWLfHPYibbH+l4KDr8uQk3T
 i4XESJMTl6xv45I3CVdmbLRPlp+0+mvHBbC2KG+QGMiSxeoU2GfR4mdVRSH8d7HvXMqx
 VXIljN5BhpXKrKBkUb5IsxPddP3kqdSM51O+Dw3qtQPZ3q2aT7NG9ESUHTiLwxbOQ+3K
 QHWLcu1vr/d45zQx9yUsd5bjVtS4tGaDmVHZ++LmfKbCyGiN8eOQsReoDialQiiwnr8r
 E+OQ==
X-Gm-Message-State: AOAM532hIFE8x49zPp2Lj5b6xoz9UZM7f2cOkf00QJ9LIeJMSs3CXBgW
 AZgCxRBsiAm6RZkjuxOIB5kIDQSDGXo9MhyXZ8SV/WN1j2wYOIUtTNwaxSoZzEoAgXr+YfI8INP
 9Qm+BN3eQs33K8EpMRv5k4MC3YNqE
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr1599800wrz.512.1644403903511; 
 Wed, 09 Feb 2022 02:51:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgYybjUJxOSAgPruNUSwAdNJR1Q/vs8i9KEstYXtz0J/diEZUxlxM8Cm7ary/2ksQmUYLUFQ==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr1599787wrz.512.1644403903310; 
 Wed, 09 Feb 2022 02:51:43 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id be11sm4521499wmb.19.2022.02.09.02.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 02:51:42 -0800 (PST)
Message-ID: <298626d6-c2b2-0f12-9700-249d03c19c18@redhat.com>
Date: Wed, 9 Feb 2022 11:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] drm/fb-helper: Fix vertical damage clipping
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220206192935.24645-3-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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

On 2/6/22 20:29, Thomas Zimmermann wrote:
> Don't clip the damage rectangle against the viewport. This only
> works if the viewport is located at the beginning of the video
> memory and the video memory doesn't extend the screen (i.e., if
> there's no overallocation).
> 
> Fbdev emulation transfers data from write operations into a
> possible shadow buffer, then into a GEM buffer object, and finally
> via graphics driver onto the screen.
> 
> If callers write outside the currently visible area, clipping the
> damage rectangle against the viewport will loose these updates in
> the shadow buffer and the fbdev's buffer object will contain stale
> data. Panning the viewport to the stale area of the buffer will
> display obsolete data.
> 
> Instead, mark all written areas as damaged, so that the damage
> handler updates the buffer object from the shadow buffer for all
> such areas. The graphics driver's later has the option of clipping
> the damaged area against the viewport when updating the screen
> from the buffer object.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

