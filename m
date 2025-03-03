Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E8A4E265
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F37A10E613;
	Tue,  4 Mar 2025 15:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ad9CTKT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D1F10E613
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:08:25 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 001AC40D4DED
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:08:23 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ad9CTKT1
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6f3x6qCczFxqJ
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:59:57 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 6E784400C6; Tue,  4 Mar 2025 17:59:36 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b=Ad9CTKT1
X-Envelope-From: <linux-kernel+bounces-541289-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b=Ad9CTKT1
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id 4685641CDB
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:42:40 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
 by fgw1.itu.edu.tr (Postfix) with SMTP id F00593064C08
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:42:39 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ny.mirrors.kernel.org (Postfix) with ESMTPS id 530B616945B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 09:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 217331F1506;
 Mon,  3 Mar 2025 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Ad9CTKT1"
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B078F49
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740994947; cv=none;
 b=Qakw7QULmsHHoMSJ8XWTMdVLs9V0icX3XKSPzGeLSiinaryFtSv0yjEEtUc0DjaS5rMRUi1KqmNfXQZ0iAldWfdYYlEeqdxBzfXcTkgvZ+YhGb5YHneculemOag2dCMJl2Xb1eeXV5cygHTQxdo6Ev4gzD1s/TEc5noKaLeLW34=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740994947; c=relaxed/simple;
 bh=2KZN3ZbiL+bTV7no7mxRpvMRno5EVSR1v8XD6Lj/EcI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=VHVtaZJghF4L5ntT8QynMJK1w5PqHga+84Rp2ERrpnu/Q8KYrZc7sWfaA11zlF0Pen0ojnJw3YDzmq8kQ9Hy8MF6kq3bCgydBuw7PXk8nqYdVpujw0enVd/qE6pUKr1aEnfezMjU8bx18KoQDnX21mqG+yRHXIwBvLPKLub/9jo=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b=Ad9CTKT1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740994944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBVVdo3tOVYaEl+zgFn8dQqxk+vyBv3FmhJQbHVALgc=;
 b=Ad9CTKT1C5RNt5mN31DOPTZzsar50zRlv0pcZ+VOnvDXxFVSIFfwwLKW856GCSZVRjwq1Q
 GoVnG4LL8xzvN6fCFb89ZHwULgmKLciW8OCCFZc2jyQWxMmVdaWNuLzvAFKj9K0wkcvID6
 By2DgvootjDcTylkagJrPRoYvqQk2zY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-Rg-WXxCIPxCFJvMHVvxjdw-1; Mon, 03 Mar 2025 04:42:13 -0500
X-MC-Unique: Rg-WXxCIPxCFJvMHVvxjdw-1
X-Mimecast-MFC-AGG-ID: Rg-WXxCIPxCFJvMHVvxjdw_1740994932
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4394040fea1so20467965e9.0
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 01:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740994932; x=1741599732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBVVdo3tOVYaEl+zgFn8dQqxk+vyBv3FmhJQbHVALgc=;
 b=P8StJiCU5Op81+luBB++40B8caLL76iuVFMLYhd/wajGMMWyC4zEZmwxQDv0loZnuq
 tIykCP7oRnsW9vivuRw9OXSa3UahnPMKhbmBia+4aS9l2gwW4UijXcr/6ZgcUmfWWtg8
 Hjv7+ixcMM8sygdi+FgXjv+6j5P+UrKxxcrSJ9Gj20pNGx2ojh1Ied84n8i3Nkb/3+cs
 U2HOVend+7QEI2G6F1ne43x7YIjJEwuHCMvBHT22ZkYtS5SK7SDMYuMnw6fP1dYuvsPT
 3OhXv2nnxW4RaiyVCq+RRPHR4VQLrOn1kdawHqRC5ixSezF/9hqdaCSCET7krYsPwoZN
 fI1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn2RmQTaQH/LMeYek2zWu+QX0xiSJy+jKZoWvsqYO47IXJH1+Awn3qv6mR91+AERmJFgztazzheI51ujM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHBg4a2I9wyYDVzEpjKZreUHaTY3flkmK3EpkAG6nL9BWZlwq
 I1M7s2OdWHk0RvNaDl2UcF/fCVnkJRB5MU7W12/gHdJS2hBDg7FBqjaQgHOHQhVVowIVHksrIx9
 ESVHOeFlOtACKhV/38S4pdNiRjtnWq3HZoeekBYInDSWDlx0KvcQ4bv088Iu91A==
X-Gm-Gg: ASbGncviOvWVpyWX243gn3t1zh0O0/bX1liI4JtX5Nb6k2XrDjxkl0uR2uD6/SDXf4g
 pqUUeFHV8xk/EZpjrWOIBeQAjuMBKaI7NvEPBS7873AIlFdoA4EjtwbUPFS+s8TsgWE+cbxC0pv
 S3fE9PMtDvR+JpV1CvSKCpFKJe29pJPMWKsMSLaqsGYcPBq1uv0n/RUdmnWGqEPfegq8QSCMWoS
 XSf79hIHhuZsM8iYnIEkxSTYfZwtIllwSxT71BCUe8UInILCaHM2L3R0t92uviP+Wi8TXGEpnf2
 VlvR445auAVN9fEYbreKbiLX4nkIrp0lNziNzqHl464OOM38fGgwBE0=
X-Received: by 2002:a05:600c:b4f:b0:43b:c638:3433 with SMTP id
 5b1f17b1804b1-43bc63837a3mr9723215e9.12.1740994932380; 
 Mon, 03 Mar 2025 01:42:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDYmizeCfEPwnub6ZUt8HoyBNoVBgCgnBfss7JKJMNfK/DcWCCY9SyISgPNOR5yKhrWm25LA==
X-Received: by 2002:a05:600c:b4f:b0:43b:c638:3433 with SMTP id
 5b1f17b1804b1-43bc63837a3mr9722845e9.12.1740994931899; 
 Mon, 03 Mar 2025 01:42:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6a6csm14062502f8f.30.2025.03.03.01.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 01:42:11 -0800 (PST)
Message-ID: <739acf08-6978-41f3-a4db-724acc03ba06@redhat.com>
Date: Mon, 3 Mar 2025 10:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250303093242.1011790-1-ojeda@kernel.org>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303093242.1011790-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6f3x6qCczFxqJ
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-SpamScore: ssss
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741705219.73229@HCXaAREAoxFS8wJImMGYTw
X-ITU-MailScanner-SpamCheck: spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On 03/03/2025 10:32, Miguel Ojeda wrote:
> Clippy warns:
> 
>      error: manual implementation of an assign operation
>         --> drivers/gpu/drm/drm_panic_qr.rs:418:25
>          |
>      418 |                         self.carry = self.carry % pow;
>          |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: replace it with: `self.carry %= pow`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#assign_op_pattern
> 
> Thus clean it up.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 62cb8a162483..3b0dd59781d4 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -415,7 +415,7 @@ fn next(&mut self) -> Option<Self::Item> {
>                           self.carry_len -= out_len;
>                           let pow = u64::pow(10, self.carry_len as u32);
>                           let out = (self.carry / pow) as u16;
> -                        self.carry = self.carry % pow;
> +                        self.carry %= pow;
>                           Some((out, NUM_CHARS_BITS[out_len]))
>                       }
>                   }
> 
> base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1


