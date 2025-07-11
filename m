Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E764B01B89
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8BF10E9AB;
	Fri, 11 Jul 2025 12:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NcCPBxmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F25110E9AB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752235814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iAhm/aMBumVaXjLJ1ai/jRSp9zSCXQWpCQQZD8LzbeE=;
 b=NcCPBxmjU40fOEpZKd6F6iPPmljNX0Yp2NKEkYou9sUHFycYai3XULq/oQiReho+/rQca4
 CKG8F0JIuKLBagbEkbSwGui4YZxZnwTs4JLVUxqXxfIc6XsSWEXfU3JmPclKg5yE6rCURc
 7IuK3zboellRXTtEaTGXgjiBI0nP3GY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-uRMaTwGqPeKJpUUvM4sS-w-1; Fri, 11 Jul 2025 08:10:12 -0400
X-MC-Unique: uRMaTwGqPeKJpUUvM4sS-w-1
X-Mimecast-MFC-AGG-ID: uRMaTwGqPeKJpUUvM4sS-w_1752235811
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4eee2398bso1059647f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235811; x=1752840611;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAhm/aMBumVaXjLJ1ai/jRSp9zSCXQWpCQQZD8LzbeE=;
 b=ArcPSGL/8rJz7cnCeusfoPi0vIcnUhcpscSOh41YDBneeh7exJgKbNZwM7dBMEJ9dl
 78OlPNWFbWQguRkEPIq5t//ih19FUOJ/g5SRljfPVEcz/gv4m3gm2b7j4zXfE2fPLOkP
 sqUSGYlHcqlYv4frYiR7c5NgdhiodfY4Z8JWGa2eFqdkYDb2u9+eahW0TS3l09DMX46u
 LPlVhTECExRRubhDoxJcVsk0cfGxubOhnhZY/u9FeYkaYmDObRV5GCIf/hG8liUm2+wM
 viu62KwYupkIAE7/P3eUi6qXfuLKQoE9s048ZngEcS+VdpfOYClZGWAVRaLLyV5FriZp
 q7ag==
X-Gm-Message-State: AOJu0YxJM4AUGVb6EL5pU9iTAAguDQlWlgRa2YwaGAdNQ2o6F2tzWOjc
 ri180XpNExSpvJM6T0yodShKfKY1iM7usD3G9bLGqTtaNc1hlfMgX/4toB+uH2wIFXEWyFrA2Bv
 cMcuCj+hxGDEyyp1hzWYshVIzttay177+bacoq5dnIP0IxvCAvQYG1hAjdYgX/arjSzAXP5rIGR
 /smg==
X-Gm-Gg: ASbGncv+AovldCV2qHPrLUsJyL9S4GLLouDF8ihcHuuN6YnIckjGgQBHw8drlI6pHUe
 RU7ZC01LD6qsHzw+thJdF9L2swp2P24VtdEgnNC2MJb7JpMirAJ3ulfE/02jKjj5Jmt+l1qKNod
 4aqETfRoUEjM5T8al6Jk7zTAoS3A8BWoe4m5AI3AllTtHbHiDTefvgvYwXeRgGNDue62brlzlap
 lVafiuXMzF78pbULRMy614qG8CMbwZwyDO3fD1q9YxrkZaLqPA0Z4p9Ra7rySJhh+/HTknFRrbI
 s5oo1/IOciNOnpWd6DLGnKVdE8MJ2sRCKvJAlXR7JWQZFe+04J8XavLwUiF8rC9OKutM6wEo4S9
 01bNy6EoctMXUmv55zQB4nA==
X-Received: by 2002:a05:6000:4310:b0:3b3:a6c2:1a10 with SMTP id
 ffacd0b85a97d-3b5f351eb04mr2071275f8f.12.1752235811051; 
 Fri, 11 Jul 2025 05:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuQgs4WlBDRvhL45tof8d82uXxaHc7iaFy2nmnLNIN0t7Jwpf+bkF1D/m2nBciaUbi7bMWow==
X-Received: by 2002:a05:6000:4310:b0:3b3:a6c2:1a10 with SMTP id
 ffacd0b85a97d-3b5f351eb04mr2071228f8f.12.1752235810448; 
 Fri, 11 Jul 2025 05:10:10 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e2cfsm4228705f8f.75.2025.07.11.05.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:10:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/9] drm/sysfb: Blit to CRTC destination format
In-Reply-To: <20250617143649.143967-5-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-5-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 14:10:08 +0200
Message-ID: <87sej3dj33.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5T-XbxCYjxAkoEqmzv2ikkvDjVhxwl8z2_fmNEVbVAM_1752235811
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the color format stored in struct drm_sysfb_crtc_state for
> color-format conversion instead of the scanout-buffer format
> announced by firmware. Currently, both values are identical.
>
> This will allow drivers to modify the CRTC's output format to a
> certain extend. Specifically, vesadrm will be able to display RGB
> framebuffers when the scanout buffer is of C8 format. With color-
> format conversion to RGB332 and correct setup of the C8 palette,
> output of XRGB8888-based buffers can be achieved.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

