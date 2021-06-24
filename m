Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBC3B2950
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 09:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586D6EA45;
	Thu, 24 Jun 2021 07:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DCF6EA32
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624519876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ummzXLEBVOW6zJVjd9RvyjdRwJ4z9g5ls7IEU8SqM4=;
 b=Y9EN46vlYv8dx7xo7zo/N+e35jQUwxm54WbN9oZLJcohYJhlj7Q1ZduFrIayWMoLH36Nfe
 Wy5E1JNH8nsLqI8kl6vAKJt8wDohtFajnpjH1JDCrZZVTRblOiNC5l/OsFBu8N8+fqfOKi
 o4CxUIcp2TEPRJNbIXsOftpxLma+YCw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-T4t9MRaNNFCMQwpAIUvuWA-1; Thu, 24 Jun 2021 03:31:15 -0400
X-MC-Unique: T4t9MRaNNFCMQwpAIUvuWA-1
Received: by mail-wr1-f69.google.com with SMTP id
 f9-20020a5d64c90000b029011a3c2a0337so1884595wri.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 00:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ummzXLEBVOW6zJVjd9RvyjdRwJ4z9g5ls7IEU8SqM4=;
 b=Sk7FNWv7g6OwpodtBZJ7M8ehDHzGlkaPoQoQUMlstOm7NIoC2m+JLjyEyX3zLH/ZCO
 g9JysPztJKkRv4mxTMwUw17vDAnV8MyzyoGvK6nnI6ByWO4RnlPsGPER8LOKLaYh8/l2
 0Kk/fOhxDfFl54i4BGBuKZu4hOxRDuNvrlXqROMtBG+LPKxI0TdoqOZK3PDGhhsJhMKA
 K0G58ZxAfV6v+O1MVnAny47QZpDAdEPtQ9MBrfoI43oEi7AtQcCVC1hYu0Zk63yQ7GuE
 rLbqJhwX9UbG2Jo0OEFS3f/XvS5ZwRLLiLc7go03lH7k+tf5l8KRuOCmZW8H4V+/x1eI
 BftA==
X-Gm-Message-State: AOAM531AMViJlzi0GmsLBldhSyd1l5bF3FQlukTtXttoqKt/dN7i3qEB
 Ud/nHKTWRir2B0oyUwOOs6cqL24PoetAeOik+QRsWzzQ+9DZopLh34nvaOwlf77A4J7OEumBYeL
 5IjlUbjHFLNSp/naU9a0zIMgm64GNitwb6y58Gb1FSaDXFFdPzVPpW+VMCF1cRAQ/zMYo7sJJ/w
 TJfrgl
X-Received: by 2002:adf:f88e:: with SMTP id u14mr2674314wrp.391.1624519873906; 
 Thu, 24 Jun 2021 00:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmU2A8muf7XixWmRWMn8O50eJCa1GKEjZYZIlN1VsKBfgiuuBfyX9v0BcxFt1KFEfxAoHypw==
X-Received: by 2002:adf:f88e:: with SMTP id u14mr2674272wrp.391.1624519873717; 
 Thu, 24 Jun 2021 00:31:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f19sm2269746wre.48.2021.06.24.00.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:31:13 -0700 (PDT)
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To: David Stevens <stevensd@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-4-stevensd@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <49504c79-2cd4-1707-a0a5-79b679a4b214@redhat.com>
Date: Thu, 24 Jun 2021 09:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624035749.4054934-4-stevensd@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gvt-dev@lists.freedesktop.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/21 05:57, David Stevens wrote:
>   static int __direct_map(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
> -			int map_writable, int max_level, kvm_pfn_t pfn,
> +			int map_writable, int max_level,
> +			const struct kvm_pfn_page *pfnpg,
>   			bool prefault, bool is_tdp)
>   {
>   	bool nx_huge_page_workaround_enabled = is_nx_huge_pa

So the main difference with my tentative patches is that here I was 
passing the struct by value.  I'll try to clean this up for 5.15, but 
for now it's all good like this.  Thanks again!

Paolo

