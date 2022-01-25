Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FBF49AFDB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8637710E2BA;
	Tue, 25 Jan 2022 09:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DB010E2BA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643103201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEIrERDn4Bih0BsT7Q6ri6so+lgoG4CTnKlVf6K4FYA=;
 b=ihAuRGspVFHVpkiJX21KvVmSpJpWYWDgZNq5yPYsLj1ZqvHltIQuS5NvTIWOMNjogvkTYX
 x31yBgB+L5qhiceUOEk9G703Q+GwK5U0zN74/isXLFOtWeLLG6A71/g4uiXcYkz1qc91/+
 f5UJzZJ9kJZLbeTvXEA7kZjXpxGS3t0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-LZum803dNxGtFYNi9KYg6g-1; Tue, 25 Jan 2022 04:33:15 -0500
X-MC-Unique: LZum803dNxGtFYNi9KYg6g-1
Received: by mail-wr1-f70.google.com with SMTP id
 x4-20020adfbb44000000b001d83e815683so2761139wrg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 01:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KEIrERDn4Bih0BsT7Q6ri6so+lgoG4CTnKlVf6K4FYA=;
 b=KgjvKRGLdjXFBlLnJxWB3xZkGolR6U/x8VpuMXwWUBv9sWwU7kqYPTLdVWX4lBX4Hz
 FpEBaGLCjVtXSQ8DOVPAYZmxQrwtSriLj3JMCXyB/rVoscPQNJktPaaAW+MfJxT5V/jn
 SH0WscVJl6GpWtcnyAtQwmNc3z/Ntk3BGqE7+fHKzt3x5fw9Oytr4YAz6O2SHlYkGA8M
 eedhGsBMjxKXQ5LzzWXQ46l5ueTJk5/EYLOnGlaeiZ34ahOnzcU5CmdFBuxPn0rV55+L
 GwJT+I7j70/d59b7wN5B0gIrZMU128PxCmJGKirAjmHvXm1cVq+sr3ftJTAxzdO9UPxl
 L97w==
X-Gm-Message-State: AOAM530aYFeTC98lFwjymPsdThl0kVOnJs9qUMRvaIRA7H5iWcDq4B9Q
 MOGSKVbcIyP0hjDwbKQcE7v0B/+WkB2R+cMVR2Ufi4lgf4ZiHb1Cx0cetj33DD1jt9a9DK1jift
 fqMgligBUGgtHSdLEGfoHnz2wcFQy
X-Received: by 2002:a05:600c:1f16:: with SMTP id
 bd22mr2126386wmb.91.1643103194371; 
 Tue, 25 Jan 2022 01:33:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+hdEt2uINp6DhGe9P9TDw6/5Wl8ziv2lioaaxK6wjExUJ2fHba9mtfodIfrJx7uO5S7/r6w==
X-Received: by 2002:a05:600c:1f16:: with SMTP id
 bd22mr2126363wmb.91.1643103194184; 
 Tue, 25 Jan 2022 01:33:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i6sm6627wma.22.2022.01.25.01.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 01:33:13 -0800 (PST)
Message-ID: <db92f89b-e266-f87d-d635-4207fd2585c4@redhat.com>
Date: Tue, 25 Jan 2022 10:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] fbdev/simplefb: Request memory region in driver
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220125091222.21457-1-tzimmermann@suse.de>
 <20220125091222.21457-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220125091222.21457-5-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 1/25/22 10:12, Thomas Zimmermann wrote:
> Requesting the framebuffer memory in simpledrm marks the memory
> range as busy. This used to be done by the firmware sysfb code,
> but the driver is the correct place.
> 
> v2:
> 	* store memory region in struct for later cleanup (Javier)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Thanks a lot for updating the patch. Now this logic is also more
similar to the changes done for the simpledrm driver in PATCH 3/5.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

