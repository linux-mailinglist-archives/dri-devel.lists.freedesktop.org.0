Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B699C498198
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 15:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5199E10E252;
	Mon, 24 Jan 2022 14:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7A710E252
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643032827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rktM0S0usSPLY5LvkfsWofVmD3HAzupt/hqZRguzdL4=;
 b=iy/BX0DpHGjIV+KYKoNYkyhXD8z2nYN4ZsY+V8LuG13AVPMQcXd1XcDHrSdP185nlT+/E4
 /QI973OcxNHcHi8RsU1ucwuFdehvxSIgLfgUKlmLFYeRbrGt5yOjigWM1h3mfodLOzWZKD
 KLjWE+U4z7bfg/91XOvQ3jV0YQnXwSE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-mHh6VBVrNRe21HFsp9dB5Q-1; Mon, 24 Jan 2022 09:00:25 -0500
X-MC-Unique: mHh6VBVrNRe21HFsp9dB5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so10788275wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 06:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rktM0S0usSPLY5LvkfsWofVmD3HAzupt/hqZRguzdL4=;
 b=sOC1Q64ZD1APBzz5nBR6b+NUzICu6E3H9GEvDeuJ5l2oy7xuexZLBqYeHBrHTjxW8a
 xtquRpumTDtSlo3NvkAqC9ycwVOM2hujuSLd5ru+hswW/JLUnhhyKFTlah4sSm4H5iR9
 pIrcaNO9Tl/Z4EkE5GcpoSx5YN9taz4mzacjG9E5GJ+IkDEct/rb0SA+vnOOFjvAuHA6
 fyAeiNfgoWwDHJwnEP6CR258ImxGGBLjPJOTF26Wp2aXs7vi7DJJ4wreEZ1KqSg58acr
 bsgs7dYtuUOo3Nabf97hLYSW+Kt6UTetV0gheYC5zXtpazhg1NOXDqhwny5EGh9HsDwd
 3ndw==
X-Gm-Message-State: AOAM5308WdXQh0lr/rvlgmRJeO6Z/wnnT1higxV1IEPjeQWujRuLZ8Tz
 JS/XYhEJXf1KKWcWmiADL77rjBtJI60BAmsBZf5n5bqG0PpJpTPIiEoKlClIctWch3vspFc5i+c
 CjZc6jOQLP6n7IbNjIUzQzltVGpSg
X-Received: by 2002:a5d:457b:: with SMTP id a27mr9200348wrc.86.1643032820867; 
 Mon, 24 Jan 2022 06:00:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytZhOKI7fYVQiuKsKaaK1W6CiHUlA4X/OwcDEUpQv/bAfKFUv01YVhuawIMIM4PyYrfjRyjg==
X-Received: by 2002:a5d:457b:: with SMTP id a27mr9200329wrc.86.1643032820652; 
 Mon, 24 Jan 2022 06:00:20 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p26sm5181839wms.2.2022.01.24.06.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:00:20 -0800 (PST)
Message-ID: <91872b43-042e-3b8a-0dbb-f9ddebfadea0@redhat.com>
Date: Mon, 24 Jan 2022 15:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/5] drm/simpledrm: Request memory region in driver
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220124123659.4692-4-tzimmermann@suse.de>
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

On 1/24/22 13:36, Thomas Zimmermann wrote:
> Requesting the framebuffer memory in simpledrm marks the memory
> range as busy. This used to be done by the firmware sysfb code,
> but the driver is the correct place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

