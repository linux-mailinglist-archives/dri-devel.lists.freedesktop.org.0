Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122724B5A85
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 20:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603D810E2C2;
	Mon, 14 Feb 2022 19:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE19210E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 19:23:22 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id c10so5340274pfv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 11:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=faMCUXgtmx+3AXg49JAI78UUXqy95249g9sm+/df9gg=;
 b=U1A+Bb18rPgucS1CdIquKO/KQlC0eR27NKxSUImY8Oiy7D1wNhaId2KoUHB4btYKEU
 4u9Zjg2eEAKHQ5kHwKidGlgPI8du5J16z8F+sJNHr6Uj2ZVwdwXJqvgp42B7LBkHCpLx
 fNsVnT2Gql7nO2NdBASFWTya/UuczDhwp9ARH9586d51DW8lEZyTnCfiXIfX1WYapWOE
 GeJhsm3lrs67uSDfIXrlZ1Pf7MRr5EXBs0AUNlNK+7KuWL5jxyEP+eaDXzmgQ6WOcWcS
 c73Yf/mPhRfRVhubGjsd9Yc1/pEuF8KVnxRvakBP5HkToeXTv1SCmGYbuc43TkrLsQRI
 zsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=faMCUXgtmx+3AXg49JAI78UUXqy95249g9sm+/df9gg=;
 b=nWev8ncijDLFzOcZ+f4eJAmBPrtM3nUINM02EvcKuG1ZKSeLYE/RmLVHf/16FStVZk
 jTFzzCdm0Hc7oNMedteLXIBjZaYsXBuzncmHRBl3+lpyyunx9jW1MYIIBdiTI9KfFe/B
 t2RE25KF/loHByDJXkVQMGAXkDvaaqoK071zl0IbikZ7cyaY+BGnN08ps5opLNDRx3zx
 bxsXbiuqbOzs4PC+KYHjAuTRFnhBlX690Jyfev/PrsbHnTl+ISJrkJAh6byGPqmKP+vJ
 8mx2dIJKnAnsMoLQeJqYgyks3Ih5MewJxDJ1tRIZitfRGlYWkTW17Rub3tfNYkscX1zZ
 MY5A==
X-Gm-Message-State: AOAM532mMj0o96Rupq2dlNuc6x3fzdojBd3fOMI8MWykcOWFIp2EjXq1
 SWkmyin8LLRFFornnpOc0js=
X-Google-Smtp-Source: ABdhPJzskEVgewovivQ93Yqm7pSL4EIc60jw8YJ4dfnBLxmZUnSxdbyKGDwkIVVRUcEgmSDV1Gt4LQ==
X-Received: by 2002:a05:6a00:1c42:: with SMTP id s2mr343232pfw.3.1644866602102; 
 Mon, 14 Feb 2022 11:23:22 -0800 (PST)
Received: from localhost
 (2603-800c-1a02-1bae-e24f-43ff-fee6-449f.res6.spectrum.com.
 [2603:800c:1a02:1bae:e24f:43ff:fee6:449f])
 by smtp.gmail.com with ESMTPSA id g19sm19524769pfc.109.2022.02.14.11.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 11:23:21 -0800 (PST)
Date: Mon, 14 Feb 2022 09:23:20 -1000
From: Tejun Heo <tj@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v2 0/6] Proposal for a GPU cgroup controller
Message-ID: <YgqsKHS0wbZFrDkO@slm.duckdns.org>
References: <20220211161831.3493782-1-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211161831.3493782-1-tjmercier@google.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Feb 11, 2022 at 04:18:23PM +0000, T.J. Mercier wrote:
> The GPU/DRM cgroup controller came into being when a consensus[1]
> was reached that the resources it tracked were unsuitable to be integrated
> into memcg. Originally, the proposed controller was specific to the DRM
> subsystem and was intended to track GEM buffers and GPU-specific
> resources[2]. In order to help establish a unified memory accounting model
> for all GPU and all related subsystems, Daniel Vetter put forth a
> suggestion to move it out of the DRM subsystem so that it can be used by
> other DMA-BUF exporters as well[3]. This RFC proposes an interface that
> does the same.
> 
> [1]: https://patchwork.kernel.org/project/dri-devel/cover/20190501140438.9506-1-brian.welty@intel.com/#22624705
> [2]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@intel.com/
> [3]: https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/

IIRC, the only consensus was that it needs to be a separate controller and
folks had trouble agreeing on resource types, control mechanism and
interface. Imma keep an eye on how the discussion develops among GPU folks.
Please feel free to ping if there's an area my input may be useful.

Thanks.

-- 
tejun
