Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53F517F6D
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 10:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA7710E644;
	Tue,  3 May 2022 08:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73D410E644
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651565206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XSZBK4U4dXUInCLeD2kd4HWgJ0oE5SvbyrL/0Z9tv4=;
 b=diJbGUTGMbPUgO17bPuPaOhQXZqGp1TXhW0bRpgxbna2+yhwgR8kvZ++QFdgMZEkRVvfyc
 6rcoABL8LnoC1JCdlMtch/Wf4idgZUbjdpUWgRWs12hSIscWI8puNzChVVP9YcQjRT0Zgc
 YCVW8GEXoamW4w5hahOFPAJ8BpQujNQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-ZnOHEA1JPVqf8TCd1VbgxA-1; Tue, 03 May 2022 04:06:45 -0400
X-MC-Unique: ZnOHEA1JPVqf8TCd1VbgxA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o24-20020a05600c379800b003943412e81dso441808wmr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 01:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5XSZBK4U4dXUInCLeD2kd4HWgJ0oE5SvbyrL/0Z9tv4=;
 b=2ncIaH28AyqeUpufYm+ssmtW9feW8l31c+DNC9AZ0lucMJfLlgmOkK9D82KK/vuBPz
 HS8Eb5sXOT56VWLeMrOozj7JRSPCIiDtoI7rH9SqUR62PV3d9SseD3mswcQWHweNFXcG
 G6+MDWweMQMvw5IeVbK+bdT6+KgBCaxlEGlZiwwQOZmO066d4P/L8N24kNIy0C2rig7C
 ZXzt77g/FF71wxzEvLJa9H5UURtckiKXmJDaVuGXPla9VugNR5uHZkLke+flutzjBI3f
 chui5eMq5yVPAsgLLbwBQqEvclj1h8A8I51UgDHYdj6V/wf7JzeUmK0et2Rq6maHRsPu
 frfA==
X-Gm-Message-State: AOAM533DLUxlvc3/cYBd8w6JdYyQTiuKSgYWf2j0PkCZ8xP1DO0LlKjw
 lY02AWLSsBf69fx+BpCuWq9khID0defmR3BvZNH+Gv1BTsDuBYu44D3/CNHnbyF8vP1xgshnqmH
 gzf47mdazZTYvumLPDP6Kzzv3lYwm
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr6816992wrx.479.1651565203992; 
 Tue, 03 May 2022 01:06:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCKcp8WS6X48akJfh/Y2Bxy9RYoucTra9KIiZHrFEg/FoRM+NumAhq6Ewhl9n+t0MqEcgFIw==
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr6816980wrx.479.1651565203793; 
 Tue, 03 May 2022 01:06:43 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003942a244ed3sm1062224wmi.24.2022.05.03.01.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 01:06:43 -0700 (PDT)
Message-ID: <20e505e8-3a52-4d1b-3f9f-d9130719e1e2@redhat.com>
Date: Tue, 3 May 2022 10:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] drm/format-helper: Unify the parameters of all
 per-line conversion helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220427141409.22842-1-tzimmermann@suse.de>
 <20220427141409.22842-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220427141409.22842-4-tzimmermann@suse.de>
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

On 4/27/22 16:14, Thomas Zimmermann wrote:
> Give each per-line conversion helper pointers of type void and the
> number of pixels in the line. Remove the unused swab parameters.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

