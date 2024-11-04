Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3209BB3D4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 12:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBECE10E2B6;
	Mon,  4 Nov 2024 11:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Cr+E4Qdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2B10E039
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 11:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730720971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FajwGdAb1Fq2c51xU3s+pLkKIio9AZFquBlJwhWBQaM=;
 b=Cr+E4Qdh3yD3osh+sWMWPnW1IOcDPTzzx70ZBXpHjp94Z8X7rYs+0y15Bd7FU2v0RHq3vi
 JLBsL1kvXTKSas4BvWzANdbDKHV3iCYhO2WC5d2bCynjgKj3WdLaFyieTzPvZaeYKsKlQn
 nKeqz3ve59McWCX0zXMX4lPiP6qDlq8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-OsO9nJZ1PhWYWFhHhemSFw-1; Mon, 04 Nov 2024 06:49:30 -0500
X-MC-Unique: OsO9nJZ1PhWYWFhHhemSFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43154a0886bso27683645e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 03:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730720969; x=1731325769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FajwGdAb1Fq2c51xU3s+pLkKIio9AZFquBlJwhWBQaM=;
 b=KpfgkF+6hdd11qOlxw9vz9/dlEpxJgJ6eVlmbrKMc/waabVbnxUd0KR77peBYO+fpE
 NZBAYFbsFiehPTxnrWxObiAAGr/gk6dUO/ZsiTbYg1LFF7AHoF5eURUS/W7LDhfe/mfK
 DCC6R/jT68KsCJqwFO7WjXbX89VTxeXNPKexQ2Ce96XPMGMpKVjBoXSU6IC7exQgLsOc
 zwRC/jZyuOgNYslkfRvalMJyTn3PS23I3zHH+rIj9PGlrmc4pVELOOs6Ki/IaALt+OxN
 mXZIocnNwTGLoX7QtoVifZA4cGWlpjnWz7kaJoPtV3uf7NgE2GHw3j8wzDmxSYEfZNqd
 zCtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw0w7Yyz2xbcnydWkONUzNDHpTZOfhvfiDkfP6btxzkSTcOLVd8zInkPgGfBwMv9PBSsyfYFLpXkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL2kneRiA1D5v6DTq/HdqRhT0/JO20TDthbfpZAhF9vzF7Opdo
 xIvxi2s1DfDd2j+jhbny8T0p/uCCHDXJebFFrUO07Ea4j1fKpkTpZG7Lg6taM7G+TL3fxPLuI2q
 PQZwx7DRm/bknBoQJcx4CTQ4aA18iyOFz8+EmbtcjSelq/kqhm69Xq1BFJXKVA1Ffkg==
X-Received: by 2002:a05:600c:4e8a:b0:42b:af5a:109 with SMTP id
 5b1f17b1804b1-43283284867mr92634225e9.24.1730720968902; 
 Mon, 04 Nov 2024 03:49:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0mfmkYvn5+DPu5WFAP6Bwmiw9OPX5hMQilF72BbPZbvkwp7CgzH1rQ3k70jUtL6XfPi25oQ==
X-Received: by 2002:a05:600c:4e8a:b0:42b:af5a:109 with SMTP id
 5b1f17b1804b1-43283284867mr92634035e9.24.1730720968533; 
 Mon, 04 Nov 2024 03:49:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7d20sm13165426f8f.7.2024.11.04.03.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 03:49:28 -0800 (PST)
Message-ID: <8b880d48-ee98-42ab-afb9-a203cb27d6e7@redhat.com>
Date: Mon, 4 Nov 2024 12:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/nouveau: Add drm_panic support for nv50+
To: Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20241022185553.1103384-1-jfalempe@redhat.com>
 <5af437fd77cc7f9514817f14299f352cba1c54a7.camel@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5af437fd77cc7f9514817f14299f352cba1c54a7.camel@redhat.com>
X-Mimecast-Spam-Score: 0
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

On 31/10/2024 21:29, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 

I just pushed it to drm-misc-next.

Thanks & Best regards,

-- 

Jocelyn

