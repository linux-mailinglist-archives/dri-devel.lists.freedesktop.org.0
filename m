Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D8215D4DD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 10:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF996E0A1;
	Fri, 14 Feb 2020 09:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7786E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581672996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIMAdnyHb+mpi3dHHfo24nPsqKz5IuqUCtHSkMxioCE=;
 b=iMJdPRHm2LQaBd4hrL65BwsOQmMGDwpXL3anTitAR0a4H83HOJa2b0CgcF6aAipxhp+elG
 jsioHOHFLA54hIQCRDQ8dnWLOM7NqhCL66LbZfVzXr7MGhLcKnmrzUXubUTTaQxD69om8H
 /9NVnpg12NaKAzEGp+MzbfEntshRsRg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-P8l9vsYrPu2LqJLR--pahw-1; Fri, 14 Feb 2020 04:36:34 -0500
Received: by mail-wm1-f72.google.com with SMTP id y7so3567372wmd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 01:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIMAdnyHb+mpi3dHHfo24nPsqKz5IuqUCtHSkMxioCE=;
 b=LbeZyX5fH7/dwpkx0Gs/saHiWfAdWJ/wNE2VZGLs+mbh4fS5v0S/Whp+8ciQJvB1uC
 Ufh/Wc0bNeqyM0dNSbQxYVb9F9iI4ImbLIAmvt7TA/wKO2yAMlvTZjATjRjw48EvyxAg
 Soa3ULlysxu9Dt3HloNW40l71e/0VUdVrVbj60a4YtZ3VHrvbQ5dQSW0i08KWB12eriR
 i3T0dOAZ8kltFIhUx7DFB7kC6aCpka2arSHLtvG+xGNpJ4bKgB0PqJxFiDJlqs3xynUE
 4lXmPRIWBNZKOwQO1fYp2bnC/eoL+WrRXLuHFiEIDM8+4cTPm67Ii4/CJmXmnKrStIbH
 9FLw==
X-Gm-Message-State: APjAAAVkHhZuQQKorRBMbRLMhLE3Gy4v4Cu1q+atoMbdioRJyBdnT2Pb
 yYgZ0cTOOz41nKStxSQ9Pm3OtB/ERA0iBK25oe6NLY7Xy8yXT4lC4sr0mPYmWl3//D1GjOsdmR0
 dDAabmTEYk0UvmBlQDASocX4d1lbF
X-Received: by 2002:a7b:c084:: with SMTP id r4mr3458480wmh.99.1581672993320;
 Fri, 14 Feb 2020 01:36:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNZcix3cHuRjYKI4UKwC2S/8vtOCGijmMjz2EO20M/zYAAUIwVsI9Wr0fsg9Fqa2L+o1gceg==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr3458444wmh.99.1581672992936;
 Fri, 14 Feb 2020 01:36:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:59c7:c3ee:2dec:d2b4?
 ([2001:b07:6468:f312:59c7:c3ee:2dec:d2b4])
 by smtp.gmail.com with ESMTPSA id n3sm6677356wmc.27.2020.02.14.01.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 01:36:32 -0800 (PST)
Subject: Re: [RFC PATCH 1/3] KVM: vmx: rewrite the comment in vmx_get_mt_mask
To: Chia-I Wu <olvaffe@gmail.com>, kvm@vger.kernel.org
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <20200213213036.207625-2-olvaffe@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0d88beeb-f960-3d1e-c669-93abe877d8ab@redhat.com>
Date: Fri, 14 Feb 2020 10:36:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200213213036.207625-2-olvaffe@gmail.com>
Content-Language: en-US
X-MC-Unique: P8l9vsYrPu2LqJLR--pahw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: wanpengli@tencent.com, joro@8bytes.org, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, kraxel@redhat.com, vkuznets@redhat.com,
 jmattson@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/20 22:30, Chia-I Wu wrote:
> Better reflect the structure of the code and metion why we could not
> always honor the guest.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 3be25ecae145..266ef87042da 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6854,17 +6854,24 @@ static u64 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
>  	u8 cache;
>  	u64 ipat = 0;
>  
> -	/* For VT-d and EPT combination
> -	 * 1. MMIO: always map as UC
> -	 * 2. EPT with VT-d:
> -	 *   a. VT-d without snooping control feature: can't guarantee the
> -	 *	result, try to trust guest.
> -	 *   b. VT-d with snooping control feature: snooping control feature of
> -	 *	VT-d engine can guarantee the cache correctness. Just set it
> -	 *	to WB to keep consistent with host. So the same as item 3.
> -	 * 3. EPT without VT-d: always map as WB and set IPAT=1 to keep
> -	 *    consistent with host MTRR
> +	/* We wanted to honor guest CD/MTRR/PAT, but doing so could result in
> +	 * memory aliases with conflicting memory types and sometimes MCEs.
> +	 * We have to be careful as to what are honored and when.
> +	 *
> +	 * For MMIO, guest CD/MTRR are ignored.  The EPT memory type is set to
> +	 * UC.  The effective memory type is UC or WC depending on guest PAT.
> +	 * This was historically the source of MCEs and we want to be
> +	 * conservative.
> +	 *
> +	 * When there is no need to deal with noncoherent DMA (e.g., no VT-d
> +	 * or VT-d has snoop control), guest CD/MTRR/PAT are all ignored.  The
> +	 * EPT memory type is set to WB.  The effective memory type is forced
> +	 * WB.
> +	 *
> +	 * Otherwise, we trust guest.  Guest CD/MTRR/PAT are all honored.  The
> +	 * EPT memory type is used to emulate guest CD/MTRR.
>  	 */
> +
>  	if (is_mmio) {
>  		cache = MTRR_TYPE_UNCACHABLE;
>  		goto exit;
> 

This is certainly an improvement, especially the part that points out
how guest PAT still allows MMIO to be handled as WC.

Thanks,

Paolo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
