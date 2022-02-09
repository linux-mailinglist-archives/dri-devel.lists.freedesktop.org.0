Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6714AEF60
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 11:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9FA10E15A;
	Wed,  9 Feb 2022 10:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B4310E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644403054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6mTLE0lAzl4hXrXua1HUTk0EkIcOHrO4D+8EMJvhsI=;
 b=VP+fmw7a0bH8qSWFEnIpDIHynlKIQi+focVd2ClwkYL+v1zVs3PTNNAnw1NQdSSxN/aOP2
 djIYQJ0hVs/Q7Brdof5xLjSBdKQOXVDNAkIZv09vp3nFmQoV0Re6FeyHdYEbgZiJ6unZE5
 UvJTq63c1F4ET4s498uMBOpb4FCzuaU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-QVxBtAmePM2585V0nSYLoQ-1; Wed, 09 Feb 2022 05:37:32 -0500
X-MC-Unique: QVxBtAmePM2585V0nSYLoQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h29-20020adfa4dd000000b001e498f51244so848857wrb.14
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 02:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/6mTLE0lAzl4hXrXua1HUTk0EkIcOHrO4D+8EMJvhsI=;
 b=xLpDukEIB2my6FmyIlJHcM/hfPGCX2rXmxT7pNR2lv0G8yq/OlyGvYxyHCBAJl7YLT
 hobohqFgSRNcKi8XRG3bDFJWcjblogLg15HjnyOz+BazjpM6gBLogp+jgObaAsPebNfM
 CjmwIaLqY4bIjdB1ci+aWiwK5oDQBOPgUmPlGLptGpFsC0h6Ls72iW5LCULBvx7WBj7N
 PGHNimsnBB3/XlgSgTedpOR5KquxPqYZQrgrC8wqWygKkpbq4X3tNhK//i0WuBeeSfjD
 aOnoG8kH7sFTM1thUIRIF5Jv6ziFuYUU+RnKC0pBnKjNfQGF88hSNjep9PM5JPw/vQlI
 chCw==
X-Gm-Message-State: AOAM532OMH3P7Uyzhsq8VBqSoKg+lCjhx3Zgp+fZA31f3d0Ylw4M7GHX
 NlbmBNQaqSkik+47055N8+jEOxYY3IWKRfJKZ2TnQMzqg7DmvoFnYMpLCFmUlYSM1G41nY28Fgx
 ma61mZ2LFKznLHRMvjLsn4dpwHNad
X-Received: by 2002:adf:dd50:: with SMTP id u16mr1544554wrm.696.1644403051528; 
 Wed, 09 Feb 2022 02:37:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbZZ4XjvTRl5IZk/7M89/Ey3CMZkM3vOVulKQRdylhDek1AIJqtdYpK3h0mZSbQ/QKDQe9Ag==
X-Received: by 2002:adf:dd50:: with SMTP id u16mr1544540wrm.696.1644403051351; 
 Wed, 09 Feb 2022 02:37:31 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id x7sm7980726wro.21.2022.02.09.02.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 02:37:30 -0800 (PST)
Message-ID: <de70b472-e8d5-6f03-bdf9-dc1057888f87@redhat.com>
Date: Wed, 9 Feb 2022 11:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] drm/fb-helper: Fix clip rectangle height
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220206192935.24645-2-tzimmermann@suse.de>
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

Hello Thomas,

On 2/6/22 20:29, Thomas Zimmermann wrote:
> Computing the clip rectangle is prone to off-by-one errors when writes
> happen near the end of a memory page. Point the end of the memory area
> to the first trailing byte, so that (end - start) returns the area's
> length.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

