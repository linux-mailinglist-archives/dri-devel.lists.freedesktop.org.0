Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FF508923
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C901810E804;
	Wed, 20 Apr 2022 13:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5166C10E804
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650460959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCgoZ3WbzAgiz4CUjLfsHx6KYp5+ZFNd7PN49ptiWj8=;
 b=XZ5Ie7cuFfoiJxDMTKQWWAoIk5NOwMx3hTJWmaAfvSGt9KqurrAjzbwChxb4OsrA/0Qqd+
 VQN/IB31E+9cI1YxZUhHlZzAyrIgC825VGSnUPahcCWQY7YCbfAJAqcxdwG1UU/Xg5rleN
 a9abEKkp7vVhYKDqFE1K650O4EQcRxE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-vBF1sO-xOY-kXD7iLfA98A-1; Wed, 20 Apr 2022 09:22:38 -0400
X-MC-Unique: vBF1sO-xOY-kXD7iLfA98A-1
Received: by mail-wm1-f70.google.com with SMTP id
 c125-20020a1c3583000000b0038e3f6e871aso905602wma.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 06:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UCgoZ3WbzAgiz4CUjLfsHx6KYp5+ZFNd7PN49ptiWj8=;
 b=eSr2Wz90rJCfhu3FCsmZc+ORSNIwncYCWgxV0Fx3K/cv4mNUXmJiK/Rj1wzLAq8WCx
 NcOgADJvnOmqQW4SdESJ3eQsAnej0QzeMi2rUg7kMyUy2XxA4+jkFVtXNGJsTgLcQ69E
 1JeHExWDZuquRUUHWCY9xq3o8n7as9RVPko6XQcsNnrXSMjrW7wbfxzhlx867FnzflOs
 Eb5pHIy8X35UQCGmwLgEhGzHFsDtxeRFr0p3DwMgKkzLCGHh6PSvhALJ4UOomijlS0nF
 rstCqHHURMBXvqgIus29j98FEFmtoUDw1svTRRdikzr0XKRvXfp3xb/Bg7Whs9iDJdJp
 ETnA==
X-Gm-Message-State: AOAM530NZkQRXz+qRGqpkCuO7owtwIc32Tm+bB9Y+Gzbi8NoQkRraWpJ
 8bbFFIZwy4Jf/LculHNMpoyy7u9MJ4qcaTjarn/aU7JzFqVYDNmIfzM+g+2pJxclbJbV9d1aNKN
 SM7nAquQ+qHSQ0LyfH+u9HSZoumou
X-Received: by 2002:adf:f781:0:b0:207:9c12:5bee with SMTP id
 q1-20020adff781000000b002079c125beemr15382617wrp.122.1650460956786; 
 Wed, 20 Apr 2022 06:22:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwou5kPmOKzvI01nRG8wgJTSgmi9kBKv74JxrV0vvFbcXtZAXOoYVLWrzPPLDESrMzw6v7gJw==
X-Received: by 2002:adf:f781:0:b0:207:9c12:5bee with SMTP id
 q1-20020adff781000000b002079c125beemr15382602wrp.122.1650460956590; 
 Wed, 20 Apr 2022 06:22:36 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0020a8781be70sm10363496wrr.12.2022.04.20.06.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 06:22:36 -0700 (PDT)
Message-ID: <64f2d0a3-e427-444e-ebcb-7dda5dbc5a57@redhat.com>
Date: Wed, 20 Apr 2022 15:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 7/8] drm/display: Move HDMI helpers into display-helper
 module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220420110900.8707-1-tzimmermann@suse.de>
 <20220420110900.8707-8-tzimmermann@suse.de>
 <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>
 <3e380d00-f3b3-8c24-e0d8-cb1935278aa4@suse.de>
 <958ddd41-06eb-40b4-a88b-1ac712345fbf@redhat.com>
 <e0b7e721-9798-b9e6-d5f4-7fd0164a4e8f@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e0b7e721-9798-b9e6-d5f4-7fd0164a4e8f@suse.de>
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

On 4/20/22 15:12, Thomas Zimmermann wrote:

[snip]

>>>
>> Right, but that wasn't my question. I wondered why for example DRM_DW_HDMI
>> Kconfig needs to select both DRM_DISPLAY_HDMI_HELPER and DRM_DISPLAY_HELPER
>> since DRM_DISPLAY_HDMI_HELPER already selects DRM_DISPLAY_HELPER.
>>
> 
> Oh, well. You found a bug. It should be 'depends on' instead of 'select'.
>

Ah, I see. Yeah, that makes more sense.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

