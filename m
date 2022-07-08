Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50DA56B883
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 13:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11D510F4D8;
	Fri,  8 Jul 2022 11:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC1110F4DE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657279713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wv13NujG3+dVwkih/Xqwv3AU9lfrcuYQf1ebjgUaVVk=;
 b=Iczp9EkZHsxaQVzWfufbTPb/vdDcV1rfzBnQaBl/XJ9xiBrl9eCEmY+3w3aMuH9JrTeGCL
 YyN3K14yB/yzRCBYpxOri9WMn9V7DhE/vismxDRqh6rAo/18u8es4gmwdtmZNLq27Qt06U
 f3pA8u3z1AQpsDU3gT0SZqZXSl7sUds=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-lcvjE4HPOtmrraYQcfTU8A-1; Fri, 08 Jul 2022 07:28:32 -0400
X-MC-Unique: lcvjE4HPOtmrraYQcfTU8A-1
Received: by mail-wr1-f69.google.com with SMTP id
 g9-20020adfa489000000b0021d6e786099so2478578wrb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 04:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Wv13NujG3+dVwkih/Xqwv3AU9lfrcuYQf1ebjgUaVVk=;
 b=ZXCZbyYnsinsyqosTdbQu/1jaMy+Ugl5/bEB+Wz1HqzEXMlCuU2xNAq8P8yYKDcn5e
 PGsCq1YQVRxeIwmTKYVhPapcq8KfFM8vgf1HmRgdyj4hWTSdvPYotgjqYSyJSBUkO0Su
 Yoop7uCiMXo24KSLnHF/GwtZz9yVCqw9wNNAAyXFQjfs3XAfV5WqtomStz7dP9z6qQAR
 SF+IbaIg/8aL0s/AFaOrhyovU/tk2HvH4EnrG4EPjiUGO89kvTYOe1SK8IZRQdCHcPps
 L/b4xgWFjCNvlHnUt52a11E9rdQeRjIK4RXI/0K9yVT49wn2wvOdeINZN90vkMS5gy1m
 f9kQ==
X-Gm-Message-State: AJIora+qaQKY8MDSNIbbJebOr8MppOVnMQ88CB7yZMrCa+xy/jUDRg30
 WviOWVgrO2+uX+1aoclP+qK/6XZH1Tzy0s5rGIpNhDM77l7u8Wr5wzDEGcUyUgAa8bPlybVxW54
 GwWq3pqc8MUEpSsjcFxY4HiEA26ke
X-Received: by 2002:a05:600c:2d45:b0:3a0:46e9:7bde with SMTP id
 a5-20020a05600c2d4500b003a046e97bdemr9948582wmg.49.1657279711726; 
 Fri, 08 Jul 2022 04:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vwGt5CrdxA6TaalbRjXWp7cv9FLQs1vbEX6yKshjXEbNsz1xjWIT4O4gDvAQM4X6U54AxsXw==
X-Received: by 2002:a05:600c:2d45:b0:3a0:46e9:7bde with SMTP id
 a5-20020a05600c2d4500b003a046e97bdemr9948543wmg.49.1657279711385; 
 Fri, 08 Jul 2022 04:28:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:6300:c44f:789a:59b5:91e9?
 (p200300cbc7026300c44f789a59b591e9.dip0.t-ipconnect.de.
 [2003:cb:c702:6300:c44f:789a:59b5:91e9])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056000108500b002167efdd549sm12911271wrw.38.2022.07.08.04.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 04:28:30 -0700 (PDT)
Message-ID: <97816c26-d2dd-1102-4a13-fafb0b1a4bc3@redhat.com>
Date: Fri, 8 Jul 2022 13:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 02/15] mm: move page zone helpers into new
 header-specific file
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-3-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220707190349.9778-3-alex.sierra@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.07.22 21:03, Alex Sierra wrote:
> [WHY]
> Have a cleaner way to expose all page zone helpers in one header

What exactly is a "page zone"? Do you mean a buddy zone as in
include/linux/mmzone.h ?


-- 
Thanks,

David / dhildenb

