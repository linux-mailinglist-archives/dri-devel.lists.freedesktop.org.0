Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD8675C69
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEAF10E126;
	Fri, 20 Jan 2023 18:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA82D10E126
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 18:04:56 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id k18so6018331pll.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 10:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2OuajGsQxBU53T1LkCzzlNc9v38dGdSuaz3Ry16782k=;
 b=cv4xGHqJsuZvK2ZarceReQkinlRWj2RKHI/IXlEeZ8KhlCt9vSO+50shUgMQe8U7Xo
 o/N48hI9fEfkAoRXatBZOk/BX0ATkFJL8snFudzFxL3kNQ9mKICA/iOJSXzXo2qLmZNF
 8twvT7FVamMuP5tkEBBz1tL29FrI4hkbo5KtFr9UgvArdoGmLJNRcJR9SXOwhW03BQNG
 VvQ5wv+icw52V1um0S2V9vmsnnONdVfyOW6vf7J6e74roX9rmFAD2M2mhIVkp66B3fmX
 EuRuzMryXhDtQSyIsM/pnUMX+I5wmG9EwAsk0P9XQZKaRKc/AhS07ScnQZ1vfJbrvcvr
 XJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2OuajGsQxBU53T1LkCzzlNc9v38dGdSuaz3Ry16782k=;
 b=NO4cfbJUVZKfQJyDD6lANFUNx6CkRpAtAeCO4x1oluWkPrqj34hShjYThSgudChdES
 vZm5J4XFpg2eLcB+OFKxlzuIFr+LXD3e/1CTzjqqu/SN9DF4q/KFb7ikSjtIyOejOMYl
 OyOpZoz4elFFitJgoY4Lwrxe78c29JaOazdyFeLywF4oeknpnug1HswJouLbYDOE3yxy
 V0e32Y2Oo6OhPTLO4057sE1NzU8XA3r0Ntxu6WHjlAOCzv1rMSPROmgdr4f1AItxLGTz
 q1mwfydNp6iOT/Yw7zIJf+XrFpXCkUjpyqjag0Bjh0TDz3WH4MgIbwFRFS21j6DQroXb
 mEKA==
X-Gm-Message-State: AFqh2kpdGGwFzFI3zlA04Wk5v6vcPfSaSPvh35FV0K1JnOJewokbI0Eu
 od/BEv6pUapo/E0cRnhr4vWX+A==
X-Google-Smtp-Source: AMrXdXuQhxYzud0iE3IRvL3V0n7Ork0xtZ6zEcwNtunFJm0FHpzqoz+cUMFDIt1LhNt+V+5xPvsjoQ==
X-Received: by 2002:a17:903:404c:b0:191:4367:7fde with SMTP id
 n12-20020a170903404c00b0019143677fdemr268549pla.0.1674237896052; 
 Fri, 20 Jan 2023 10:04:56 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 f5-20020a170902684500b0019488a36e2asm11100991pln.277.2023.01.20.10.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 10:04:55 -0800 (PST)
Date: Fri, 20 Jan 2023 18:04:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH linux-next 3/3] kvm: x86/pmu: Add blank line separator
 before KVM_CAP_PMU_EVENT_MASKED_EVENTS code path list
Message-ID: <Y8rXw6g8JZkajrZ5@google.com>
References: <20230120123534.137413-1-bagasdotme@gmail.com>
 <20230120123534.137413-4-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120123534.137413-4-bagasdotme@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Aaron Lewis <aaronlewis@google.com>,
 Linux KVM <kvm@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Freedesktop DRI List <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023, Bagas Sanjaya wrote:
> Stephen Rothwell reported htmldocs warning when merging kvm-x86 tree:
> 
> Documentation/virt/kvm/api.rst:5070: ERROR: Unexpected indentation.
> 
> Fix the warning by adding a blank line separator before
> KVM_CAP_PMU_EVENT_MASKED_EVENTS code path list to determine guest access.
> 
> Link: https://lore.kernel.org/linux-next/20230120130927.3100f935@canb.auug.org.au/
> Fixes: 651daa44b11c0e ("kvm: x86/pmu: Introduce masked events to the pmu event filter")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/virt/kvm/api.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index a477186c57c193..83e3acc9e3211d 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -5067,6 +5067,7 @@ An encoded event will follow this layout::
>  
>  When the guest attempts to program the PMU, these steps are followed in
>  determining if the guest should have access:
> +
>   1. Match the event select from the guest against the filter events.
>   2. If a match is found, match the guest's unit mask to the mask and match
>      values of the included filter events.
> -- 

Squashed this into the offending commit, thanks!
