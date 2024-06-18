Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F2E90E010
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8BC10E819;
	Tue, 18 Jun 2024 23:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gvjKHKgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD0610E80F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718754174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3Z2evdNPMBXT7admKZAc1Ne4tYdRPgWACHYuEqy2nE=;
 b=gvjKHKgHstZD0iCmQNPg5uoOQkdmvUiXaL80tR0FPVBTDVj2lk5Y3/TpNOcxt7uyGo9X1V
 V7sk7k+bosHbujhlsRTeXG89fVbJ9vwlsXnFU9+zm01OYIDEcQ4pactUCVJIoU6C8JGekV
 bf6NladAa5ykz5caBADZh6hhXfFzg1g=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-Nm_0fftsNYiS6mibT5sO5g-1; Tue, 18 Jun 2024 19:42:52 -0400
X-MC-Unique: Nm_0fftsNYiS6mibT5sO5g-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ebeef33f21so50384211fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718754171; x=1719358971;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3Z2evdNPMBXT7admKZAc1Ne4tYdRPgWACHYuEqy2nE=;
 b=fw+IypBlxNROzi/yOEwIcyY5jHYmsSFEWMAgRyPK2LCUitKFvZAIqZT2Rk4cREDiZB
 0QRCHVniBl5REhoGljZsxG1byDSwgGtFOsnvaFgsum+vwF5t2qq4OIovjGtja4028025
 txvRq23kNUhjzH6NIGmpOmAFRAH9veaiucogftcditmYMfa7YphoUXxtqdCl3OCqOkCl
 1YMUstbDwP1vIVIQBkbYz9+OzmZrnKjkjW+Cid0fbQjVGyYfSMRk3b+9hPV4vCnhq0oH
 eVOKGuPv3tIUPeKWjJN9Qe69RF8nMYRz+UzYxeDT625lXg9yhjiioAsOua3wQRpUgehJ
 /K1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf+/iDFUt8lqqUZpBVj1A3656Fiif5bMacptBMjgsklZCBToQcHnv352poifzdL2kB3McD9diSszgHqFAEWqPF7U1Yq9XS4mOz6+AZGeMX
X-Gm-Message-State: AOJu0YztdBNpVrsrTOPPfevhqYa5o3Bll2XzkGmzmQA2j/ENdin4GTTV
 dtA486kMPfEvjL5+OmjggR2oNG2AlHFPS2BTH6q5/2qxmCKqX0Uzz60egexbPtyEOZb3mM9ehn5
 S7CHmRZZCi/Kg9HOP8suZ/N5IzQnrrJ3qx8c91y/HVFLGWI/cvqXHJijZrOaHjt1Bjg==
X-Received: by 2002:a2e:2c1a:0:b0:2ea:edac:4886 with SMTP id
 38308e7fff4ca-2ec3cffc4e1mr7588491fa.45.1718754171320; 
 Tue, 18 Jun 2024 16:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXxWA0oSKg9/uHRxkYZqgQapFgTGUJtV9NxLiRf53cMqUzSCZPEdoUfvLiePJ4nZRU6sP21w==
X-Received: by 2002:a2e:2c1a:0:b0:2ea:edac:4886 with SMTP id
 38308e7fff4ca-2ec3cffc4e1mr7588381fa.45.1718754170863; 
 Tue, 18 Jun 2024 16:42:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f8be0c69sm208261285e9.33.2024.06.18.16.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 16:42:50 -0700 (PDT)
Message-ID: <c67afe11-82b4-4ef5-8ef1-cfed502b545f@redhat.com>
Date: Wed, 19 Jun 2024 01:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Device / Driver and PCI Rust abstractions
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240618233324.14217-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

https://lore.kernel.org/lkml/20240618234025.15036-1-dakr@redhat.com/

