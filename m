Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC84ABECE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108310EC49;
	Mon,  7 Feb 2022 13:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3DF10EC49
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644239782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbsWQ5Zlcx68wgKcm1GK+e1NILHFov+pyPSI/YLHC2Q=;
 b=RXG5DRuki9IxvmsQMHhzx8lqVeDZXlkqkDgA2QAWWjLbDtzpQ56aGsFDHYw8JKzPSMNQwb
 6rxlL7ZtT/bWS81afna9X8mZ8g9z2QmeYAsrsGUZrl7crPe26FmYqoj3magT4txrbkfMyf
 ngUHkt664vjGvrbKwEat0JeNfXd52CQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-UNsLNQMcPKeQU_NglraJ8w-1; Mon, 07 Feb 2022 08:16:21 -0500
X-MC-Unique: UNsLNQMcPKeQU_NglraJ8w-1
Received: by mail-ed1-f72.google.com with SMTP id
 cr7-20020a056402222700b0040f59dae606so2622731edb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 05:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nbsWQ5Zlcx68wgKcm1GK+e1NILHFov+pyPSI/YLHC2Q=;
 b=skpUpCDpMq1ZKA0+eci4mhuE2anD1fwFAuJeyICK2xmLFPN5dtl5pCRQ0r7U33zRVL
 wvO1t/nzfygM39uLu3Hb6evlbxKzkoDZxFCIjcNBOoT/eeU686wgq2G4TpYnZgqOSyPp
 NCy+zDQd7877HIblZhwjOKU/FjeUXMEMWLAmsH1T2OCfsNGnjdi8Rr3gMwiAB2iE84xz
 yAjMl4o8ZDDWSCcnS7ewOyYDoPxWmcTsSw3CYc6Zhm+zBrPzfOwRGTtQL6hj7OSkZBw+
 LutqUoLCftTDw1NUK25R+jREj9PETiV7YohYYKB7YUKg20AgDi8i9Si8BBWDBHZ1dQOI
 dJfA==
X-Gm-Message-State: AOAM530WBZHLnB5gBqFYx9TwXX3ljqbZplocEI3a9fojDFlCgCxs6z5h
 DTw6GxWo2yCSena0yikZByxniJCvsxbhD55ANWOU4evAbdo3WoKUquDgMK6DoFqT7tqb5byhtmS
 qZpamOofdsfYWGxkEboa1sEX2vEAW
X-Received: by 2002:a05:6402:448c:: with SMTP id
 er12mr14155485edb.137.1644239779988; 
 Mon, 07 Feb 2022 05:16:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVYuYyFOGrdkKBjGXvTlgEJGrOvO3i1zu6H5mLTvWt57ryXHl7ZQz+CE1p5iLRMgsZv6Jw/w==
X-Received: by 2002:a05:6402:448c:: with SMTP id
 er12mr14155466edb.137.1644239779857; 
 Mon, 07 Feb 2022 05:16:19 -0800 (PST)
Received: from [10.40.98.98] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id v5sm693769ejr.107.2022.02.07.05.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 05:16:19 -0800 (PST)
Message-ID: <6b9d7ae1-0ee9-75ac-b84f-2c8fb477740d@redhat.com>
Date: Mon, 7 Feb 2022 14:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] drm/privacy-screen: Fix sphinx warning
To: Simon Ser <contact@emersion.fr>
References: <20220207130407.389585-1-hdegoede@redhat.com>
 <l1SggV8Hq2ZSwYWLWSAAoS_xnJgRQY7FD6kkVLnd4aRDQuEcVHVNy8PGYupu4pf29tfapKZT1TSTg2wQS5XCJGoE0MzX8_fvlUYDQmCLP1c=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <l1SggV8Hq2ZSwYWLWSAAoS_xnJgRQY7FD6kkVLnd4aRDQuEcVHVNy8PGYupu4pf29tfapKZT1TSTg2wQS5XCJGoE0MzX8_fvlUYDQmCLP1c=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/7/22 14:05, Simon Ser wrote:
> Reviewed-by: Simon Ser <contact@emersion.fr>

Thank I've pushed this one to drm-misc-fixes now; and the other one you reviewed
to drm-misc-next.

Regards,

Hans

