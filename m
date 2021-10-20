Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AF435066
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 18:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79AA6E054;
	Wed, 20 Oct 2021 16:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4617C6E054
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634748023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StojfAqyeQHDkij+8rTrbPKJcvcUj0fGJk9VVUumXz4=;
 b=JkXIOxG1z9oWSVMdPNeaMNea53pee/j1zzCWo6H8uJ4tFO54PLpRYfwukP8eEjveXiJYwK
 KLtt3tysmP/Xh5mFk48MF7WsvGAGbhrDaQZpyMK8wJXz2JkZHxFI7fWbtXvnhnJtEV5WHq
 WHV4pjrCTAhFOnrFyFMCIxFruP7YmZs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-IVpP7ueqOrG5sCBtpINv0Q-1; Wed, 20 Oct 2021 12:40:19 -0400
X-MC-Unique: IVpP7ueqOrG5sCBtpINv0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 d143-20020a1c1d95000000b0030dc197412aso760862wmd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 09:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=StojfAqyeQHDkij+8rTrbPKJcvcUj0fGJk9VVUumXz4=;
 b=j1h+wA4m+zrSkYlOcmTcm9cOjtpviR8U2BxW207qCZ+LYgMpodaCchZkqal4G320rS
 kFixfoQ6GucUrruS7qQTuGLiUZmZyfUxfJzqTxrgJiHbU30uMvCPBA+S3g64FfopOLXa
 p5A1U9z0R162yelLbRk642VcDAtOdLVQZurlk8GZcjKr97xk1v7TtTOJmpc0pWcFsJtR
 qmEyYtuPO6yMkAHXWhskAqc1mlM8NaGpljF/q/2YjK9T+h/Mq09rWNXgaSKYbUpHfcPF
 7cmNjtf4i10ZEIoH1i4ckPv76Y4rS7JSv3jY7TSY8muYgQNczDcVPeIFckBjRsQ4+JOh
 7R+A==
X-Gm-Message-State: AOAM532vfTidPp/4WCq17oy8A/9Xnw5KBDfLggNLtT/052343W7cjxIQ
 cu673zek4RrWBUAS68AP+bwWDny4tsOEx7pAgVcaMCZZ6pv5WQhLVn0VCwcYY9QGzAjZfCy4V7E
 G7QKTL8er/Hs77c9XC4nkZx1C8gDr
X-Received: by 2002:adf:e382:: with SMTP id e2mr421199wrm.90.1634748018372;
 Wed, 20 Oct 2021 09:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4j+FN8dHBAspNShPIfXEQEdqjV+D4OWwFaz88jZoJj1s/iEEzhN8nZO5xV9XP0HqGJTMqgA==
X-Received: by 2002:adf:e382:: with SMTP id e2mr421162wrm.90.1634748018118;
 Wed, 20 Oct 2021 09:40:18 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id g2sm2413587wrq.62.2021.10.20.09.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 09:40:17 -0700 (PDT)
Message-ID: <9989e16f-38a0-c76b-0408-d47f120eec7f@redhat.com>
Date: Wed, 20 Oct 2021 18:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] Revert "drm/fb-helper: improve DRM fbdev emulation device
 names"
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-kernel@vger.kernel.org, Johannes Stezenbach <js@sig21.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
References: <20211008071708.1954041-1-javierm@redhat.com>
 <YWAlUBoMlerOGJEV@intel.com> <YWbQrP9blDndQV2F@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YWbQrP9blDndQV2F@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 10/13/21 14:27, Daniel Vetter wrote:
>>>  
>>>  	info->par = fb_helper;
>>> -	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
> 
> Please add a comment here that drmfb is uapi because pm-utils matches
> against it ...
> 

Sure, I'll do that and send a v2.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

