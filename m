Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C24BF5874
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5184910E2DC;
	Tue, 21 Oct 2025 09:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Dy7KMu5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6E110E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761039305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsfpJjNAphnWLSpR/9hQ9zHV9rrWcLBcQx4ViQ+mRJk=;
 b=Dy7KMu5yEjZQw4h5LnXqsrfU/O7/Nk3NzznZpw6XRTLby5qFqUciQg9UbPhGHgfHOaLRaD
 jGeGMePhH9AkTQA7OLN9qCsMfXJQ67o6fV6c9FWWJ7XA44Ic0pTwGWbfyjyf+tU7AM0HY6
 eXe+J17PzHCBK6OAt/bBOzPtMP2sAHA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-jr8VJSk5Pp2fBvdi_brIFA-1; Tue, 21 Oct 2025 05:35:04 -0400
X-MC-Unique: jr8VJSk5Pp2fBvdi_brIFA-1
X-Mimecast-MFC-AGG-ID: jr8VJSk5Pp2fBvdi_brIFA_1761039303
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4711899ab0aso41310145e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761039303; x=1761644103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DsfpJjNAphnWLSpR/9hQ9zHV9rrWcLBcQx4ViQ+mRJk=;
 b=GcJ6kti8MypfN3AdKsTCZPcfd6dfoRrc1//pE+6PVhdkTdm3+1rQFGSBgvOTUfLe4t
 E4mUGYrc1n5rtpALD4WpDHidQxkKsTxvpKXYrDWcVW0nWkSy7AcQbYDHdFWyF7vY7aC3
 FbbWOHKxxwk9j0dyjqanp0Js2UOAZATOUYkuPvjd5Io8/pWQkjL7C3EMw/phEOhqFrsc
 nsGdkDnuZfwZvhK37CZZQUNQs8/gevRWM32WfpU1X1ndQ3ODByrKVfK67yMbOXFx3vMM
 ybXDOgNWj/WX25ZxSDb1O/Q4SUNg3vkdVrMu4u30Bul8Hkw+QqjrxA856BNGEa6JNFf6
 ujjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeOKI9792MzRS9lxfzrUtbUCYeNPIoLz1mVNtroM6Nw7CrVKJbuwfrwd9bEkcIAtwT4UiyuGG3iWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0WzUJsCZlQ4nB029sDnNXEzMJTKhoj5NUsZAHo8+j0YAWudfz
 u2NiWBy9rr6DsoclFospFPWuBkAdD6KCyhSes47JdTTgWwDkfqmtpRKHnGLjbU6A54G36hghhdU
 VJd+iE41p0D6ZR91ZjB7Cl8PWdDvHYE+UD9+zXYb+sk2JpN9gF+ZeXB7OWCbLhb55m5q83Q==
X-Gm-Gg: ASbGnctqA+rs4lDdzQs3FlYwzrn2k232PnGltxVYbIc53s2uuwbvRVxdvy9SdJg+78Q
 04dCvH/QgGnkMjHR2s/7LwsvhhnxPVL8VdhTDhCTmPX2kUE2DU4X4EZxy5ctCWaw07bikDZJuc/
 j1EHozwF9Sj0gTMb9WVmtowgy1rRyjXRbx1Me1lu7uWJ7jskKMuRaJb9+xUp4GqZRmZUIG14zIg
 IsmeBRZI6WimO48UGt300sJi5zNpvidvXr7JvzVZH4s+FAhMQ0dsMbOhyuj44Don9c1039kEK6E
 M69JQrKRhH7mLFMt5kbabk/xlryNgYH+2Z0E+5wv6CoKpfksiqKeavTF2Gjd62pxKEf33AKDJDp
 TlEy7bGnyBFqLZ6qNyJmOtaqcQtBNxF4at4RTBQw=
X-Received: by 2002:a05:600c:4448:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-47117912b0dmr121009835e9.31.1761039302608; 
 Tue, 21 Oct 2025 02:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt5KLfPmw83SPRT8OisjsvH92UuGC/3O3ChwZqMD9Wd7ly0YlXsAEqC/1kFgopwE5vclnf0g==
X-Received: by 2002:a05:600c:4448:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-47117912b0dmr121009555e9.31.1761039302202; 
 Tue, 21 Oct 2025 02:35:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce678sm19776843f8f.51.2025.10.21.02.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 02:35:01 -0700 (PDT)
Message-ID: <f8f1e0ec-46fe-4d71-94aa-bdd081ec35fb@redhat.com>
Date: Tue, 21 Oct 2025 11:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm/panic: Fixes found with kunit.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20251009122955.562888-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009122955.562888-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ucJklRra3sdRCvyfvTNDWoLfcKNp6VWmCl3Ec9Molt8_1761039303
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 09/10/2025 14:24, Jocelyn Falempe wrote:
> A few fixes for drm panic, that I found when writing unit tests with kunit.

Pushed to drm-misc-fixes.

Thanks Javier for your reviews.

> 
> Jocelyn Falempe (6):
>    drm/panic: Fix drawing the logo on a small narrow screen
>    drm/panic: Fix overlap between qr code and logo
>    drm/panic: Fix qr_code, ensure vmargin is positive
>    drm/panic: Fix kmsg text drawing rectangle
>    drm/panic: Fix divide by 0 if the screen width < font width
>    drm/panic: Fix 24bit pixel crossing page boundaries
> 
>   drivers/gpu/drm/drm_panic.c | 60 +++++++++++++++++++++++++++++++++----
>   1 file changed, 54 insertions(+), 6 deletions(-)
> 
> 
> base-commit: e4bea919584ff292c9156cf7d641a2ab3cbe27b0

