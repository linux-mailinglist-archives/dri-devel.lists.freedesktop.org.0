Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7B6819F7B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527610E173;
	Wed, 20 Dec 2023 13:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1010E10E173
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703077595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcDrbjyjMazetuP2IXFq19+KBQ/5Rh6HiivXC6HpT8A=;
 b=QLWp91iev6Qa/la6/Yj6I7bobn1xUV9HSE21UmMuqCby6Qzg/OpCd7GxjlkPUnsiWL+G0i
 i8lrnRrkhm3npTv13sgvw/o7EIhgoPb6btb3Z9EVn94GG2xFikUEzR489nKtTsK8g0Oxyt
 Ciw8EGfdgAcSdT8uZxRMuOSqUJFyTxE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-48qfdNm1NeOiXiD5qFJkWw-1; Wed, 20 Dec 2023 08:06:33 -0500
X-MC-Unique: 48qfdNm1NeOiXiD5qFJkWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40c42205ed0so46327305e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 05:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703077592; x=1703682392;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JcDrbjyjMazetuP2IXFq19+KBQ/5Rh6HiivXC6HpT8A=;
 b=nP5x+TsqK8H/gV3RqS0a0H193D8gU19TQMJngy8zme/Rp2xMBd+nzSU5EnsYOEqEXQ
 MLqIiFOPpTUuyMCIDMpDOaNz+ivvnGIETQ4Lwc3FFQjBE8zibWBOi4wskUJ18ZHwA9G1
 jh+Boa6myIpvjI5xhU4lu9E21i1TkTDS1mqMYVLTfYmZOX+yvc0MG8bUgbn+TRtSN/WF
 3QzB9/VGxkW8Qv5B0wjvQxaoiDthQthz+2NdGuR8x/PLBOnNwQy+FCZ3Mv83zfbPKECP
 3uiOVCvdmDws3C1xMhKwrE0I6Uep9bTFgMcWIr7uFhQaWSU1qtyZG8l48Z+Mv0Pnh194
 FUug==
X-Gm-Message-State: AOJu0YyFSErGg+8C6Lxvdzab/GvDY9RFWk/7F9GL1x4V39FTXTtbi516
 hAG4aOC3tzktfRXmFuoBtTVCNONjST7GAiyfXLX8LtUxv9akIzNlxeIUO7Aj6o71e2NZiIgCgV2
 G9nYD2prys0sErmb65YAN56PW9VXx
X-Received: by 2002:a05:600c:35c5:b0:40d:2399:e8ab with SMTP id
 r5-20020a05600c35c500b0040d2399e8abmr1373984wmq.119.1703077592265; 
 Wed, 20 Dec 2023 05:06:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRoNwYKhAj9t3QDcijJmqblCCgPo565UJi8JqwdyfEV+aS8fatsnVqDe5IgX5UWy1Iu5IsxQ==
X-Received: by 2002:a05:600c:35c5:b0:40d:2399:e8ab with SMTP id
 r5-20020a05600c35c500b0040d2399e8abmr1373972wmq.119.1703077591912; 
 Wed, 20 Dec 2023 05:06:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b0040c03c3289bsm7180907wmq.37.2023.12.20.05.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 05:06:31 -0800 (PST)
Message-ID: <3b2fbb7f-3243-4f98-90bc-edb1b4db2bb4@redhat.com>
Date: Wed, 20 Dec 2023 14:06:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized for G200ER,
 G200EV, G200SE
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch, javierm@redhat.com
References: <20231214163849.359691-1-jfalempe@redhat.com>
 <641bc7e1-5c13-4af1-ae2e-8cdc58ee92a9@suse.de>
 <beec3b5d-689a-4b25-be4b-9ff7532bb2e6@redhat.com>
In-Reply-To: <beec3b5d-689a-4b25-be4b-9ff7532bb2e6@redhat.com>
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
Cc: Roger Sewell <roger.sewell@cantab.net>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I just merged it to drm-misc-fixes:

https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=11f9eb899ecc8c02b769cf8d2532ba12786a7af7

Thanks,

-- 

Jocelyn

