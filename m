Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BFA54F225
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA0D11A62D;
	Fri, 17 Jun 2022 07:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67FA11A62D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655451892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coda/CWfS7jjnpuHvtDQX0ASaEE3SWk0zKx/CPt1NF8=;
 b=cLouWCvzKAqdezRXggX+P8aCyG64WvmL864GD5PUV/OBrJIqcat5FMsabqQK2RBJ50tLbR
 lmTVnsM+wQ2Q/T9/M77hXFXHablJQNhUPz9nAwiZgg3NxQ2lR68uvJN9uX9mVbhGdvf0nm
 mPWFrz5r22JCMUwdQwB6nHHY3Op36Xg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-M9ilW8r3Ppy-QKNIW2V9og-1; Fri, 17 Jun 2022 03:44:50 -0400
X-MC-Unique: M9ilW8r3Ppy-QKNIW2V9og-1
Received: by mail-wm1-f70.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso2380801wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=coda/CWfS7jjnpuHvtDQX0ASaEE3SWk0zKx/CPt1NF8=;
 b=0VHaS1J7HmNIZPdmeG69ZFJCgTr+zhENuc66ilXDLf7/QOm+47OxnuaX8H1rcvWRan
 EDb7qmqu/ZeS7/i+ri4FnMCByEzEv58dXvfzVpFcDiR2WT03UykRsCsJvZke6t2QZ7kD
 welDoZWvnU7iNh8SOJsQNgA4SaEK5aJcLuzRTDLKN5FkcD46ktbRXOg/z5S13z6On063
 ndPfgY/gvRYijKb97Xp5C76AXWW5EbsgZZ9R1GtV8tcwfk4JvT+KgMELFS6J/76amlhE
 Ws/nQvHgsyk19PyVqmbuvm5940Atk4wvtxEilA9bcB8fqzk/NXPLnynUQ/c/c2HZj6g/
 fXVg==
X-Gm-Message-State: AJIora8ngXrYazJw+dG/+QeOXlXhULEnbT1qOKwupJOrWgBpAVSZj/aK
 B/WSqMH9bmdASH5dIAOBioZ5Thwcet57yQBUuWVReq325EJABjyhcJ9/J2jkrt3LXn18jZ3ETvH
 yOI2hEI5fZA2NSnhdu82xlMfsPeq9
X-Received: by 2002:a5d:5272:0:b0:210:33b8:ac4a with SMTP id
 l18-20020a5d5272000000b0021033b8ac4amr7953178wrc.483.1655451889279; 
 Fri, 17 Jun 2022 00:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sotrEWyKnX0mzmXO2tbcDqW4so5zlYrKlmkTzzX5Yo7fZTIXTe3SZOKyKoq4h2kvU8N2TdcQ==
X-Received: by 2002:a5d:5272:0:b0:210:33b8:ac4a with SMTP id
 l18-20020a5d5272000000b0021033b8ac4amr7953151wrc.483.1655451889025; 
 Fri, 17 Jun 2022 00:44:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7e00:bb5b:b526:5b76:5824?
 (p200300cbc70a7e00bb5bb5265b765824.dip0.t-ipconnect.de.
 [2003:cb:c70a:7e00:bb5b:b526:5b76:5824])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d474b000000b002185631adf0sm3851245wrs.23.2022.06.17.00.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 00:44:48 -0700 (PDT)
Message-ID: <bd8b3eeb-4951-e3e9-8ee5-94f573ec815f@redhat.com>
Date: Fri, 17 Jun 2022 09:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 00/13] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
To: Andrew Morton <akpm@linux-foundation.org>,
 Alex Sierra <alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220616191927.b4500e2f73500b9241009788@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220616191927.b4500e2f73500b9241009788@linux-foundation.org>
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
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.06.22 04:19, Andrew Morton wrote:
> On Tue, 31 May 2022 15:00:28 -0500 Alex Sierra <alex.sierra@amd.com> wrote:
> 
>> This is our MEMORY_DEVICE_COHERENT patch series rebased and updated
>> for current 5.18.0
> 
> I plan to move this series into the non-rebasing mm-stable branch in a
> few days.  Unless sternly told not to do so!
> 

I want to double-check some things regarding PageAnonExclusive
interaction. I'm busy, but I'll try prioritizing it.

-- 
Thanks,

David / dhildenb

