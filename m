Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71EC52BEDC
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 17:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE3E10F987;
	Wed, 18 May 2022 15:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9B310F958
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 15:56:10 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id a19so2522037pgw.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qWXKTxpMjmn1u6F63OBGUz8tILVO6jaTHdWT2R8iYlg=;
 b=eBaghM2dqTUIVv/7a2pxqIjSQL1Ktx2k9P6YqlUuVPZm2g5J8JNomOwqnfQufns4XX
 EkbC6Ht6q3Fl76dyOSK61FlnvJDZJJyMXoICbSld7XnACBvxHAd3sZqXbyrOAUx8VxZV
 Wxp0k/pkWhPgpQTw3Nufa/nCelbz5bgxvtzTtcWYrNcyVbYiXUkjh++XNiw8AUHfJgqx
 uxRfBFqLeQoJxXExhfJpce/LhRiPIjwXFrlPOJlXMFRHFvXmwSoBfUWcNk0BQLh9litq
 S0uKGx7PYGr6wsD5SrY4WHHMRNu7wiTpqLvuKvgBGptl3Qve+CjsXQnx11zkp8MuBFMA
 NpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWXKTxpMjmn1u6F63OBGUz8tILVO6jaTHdWT2R8iYlg=;
 b=B6UUj6Gs4OSwqNbDewFE/7slLEGuzaE8vDTVPnI4djPJ/APG0NXLHedLMqmDuHMdx4
 hUcBPKNr3Xu+OYq8QJuRvEl4mqaY7pZ4XsFrTHx2kkpQp6W/e+1OLvw7MI++X4x0/wdD
 /QAjsB3LQpv0pSDRP602XCiLzO6dM3QbRWVXB/Uz6VfXWwZmhUurbXeJA33V65h580xR
 2FpAJ4QclemzWenFoSsZUQWM6p2n0BEgAH/IDSilrjG75uBN7B+QMFrVYG2C8lE76oT4
 as1mJPGlR8/hUvpluFDPclWJGs7aq4ZF380dAeYKrlmaNipPOW1MxjSErcfGN39H0qia
 BOug==
X-Gm-Message-State: AOAM532Lh2d9nguuOQJODUlgPySNAABMZ6lCEAnWJ6iR8+lcpEet5ZAL
 NvlsGpF/4Lk3nikU6VluEZaAlQ==
X-Google-Smtp-Source: ABdhPJxSEJX/gDr7F2yeujTeOEbh2dCd+3p9S2SawsVfH6UMPR5YU1kkRbp4HL/UBle/+eRE4D2uKA==
X-Received: by 2002:a05:6a00:2444:b0:4fd:db81:cbdd with SMTP id
 d4-20020a056a00244400b004fddb81cbddmr381800pfj.32.1652889370308; 
 Wed, 18 May 2022 08:56:10 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654688000000b003f60df4a5d5sm1449792pgr.54.2022.05.18.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 08:56:09 -0700 (PDT)
Date: Wed, 18 May 2022 15:56:06 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 01/19] KVM: x86: document AVIC/APICv inhibit reasons
Message-ID: <YoUXFmh9vef4CC+8@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-2-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-2-mlevitsk@redhat.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> These days there are too many AVIC/APICv inhibit
> reasons, and it doesn't hurt to have some documentation
> for them.

Please wrap at ~75 chars.

> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index f164c6c1514a4..63eae00625bda 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1046,14 +1046,29 @@ struct kvm_x86_msr_filter {
>  };
>  
>  enum kvm_apicv_inhibit {
> +	/* APICv/AVIC is disabled by module param and/or not supported in hardware */

Rather than tag every one as APICv vs. AVIC, what about reorganizing the enums so
that the common vs. AVIC flags are bundled together?  And then the redundant info
in the comments about "XYZ is inhibited" can go away too, i.e. the individual
comments can focus on explaining what triggers the inhibit (and for some, why that
action is incompatible with APIC virtualization).

E.g.
	/***************************************************************/
	/* INHIBITs are relevant to both Intel's APICv and AMD's AVIC. */
	/***************************************************************/

	/* APIC/AVIC is unsupported and/or disabled via module param. */
	APICV_INHIBIT_REASON_DISABLE,

	/* The local APIC is not in-kernel.  See KVM_CREATE_IRQCHIP. */
	APICV_INHIBIT_REASON_ABSENT,

	/*
	 * At least one IRQ vector is configured for HyperV's AutoEOI, which
	 * requires manually injecting the IRQ to do EOI on behalf of the guest.
	 */
	APICV_INHIBIT_REASON_HYPERV,
	

	/**********************************************/
	/* INHIBITs relevant only to AMD's AVIC. */
	/**********************************************/

>  	APICV_INHIBIT_REASON_DISABLE,
> +	/* APICv/AVIC is inhibited because AutoEOI feature is being used by a HyperV guest*/
>  	APICV_INHIBIT_REASON_HYPERV,
> +	/* AVIC is inhibited on a CPU because it runs a nested guest */
>  	APICV_INHIBIT_REASON_NESTED,
> +	/* AVIC is inhibited due to wait for an irq window (AVIC doesn't support this) */
>  	APICV_INHIBIT_REASON_IRQWIN,
> +	/*
> +	 * AVIC is inhibited because i8254 're-inject' mode is used
> +	 * which needs EOI intercept which AVIC doesn't support
> +	 */
>  	APICV_INHIBIT_REASON_PIT_REINJ,
> +	/* AVIC is inhibited because the guest has x2apic in its CPUID*/
>  	APICV_INHIBIT_REASON_X2APIC,
> +	/* AVIC/APICv is inhibited because KVM_GUESTDBG_BLOCKIRQ was enabled */
>  	APICV_INHIBIT_REASON_BLOCKIRQ,
> +	/*
> +	 * AVIC/APICv is inhibited because the guest didn't yet

s/guest/userspace

> +	 * enable kernel/split irqchip
> +	 */
>  	APICV_INHIBIT_REASON_ABSENT,
> +	/* AVIC is disabled because SEV doesn't support it */
>  	APICV_INHIBIT_REASON_SEV,
>  };
>  
> -- 
> 2.26.3
> 
