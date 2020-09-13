Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDCD268557
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691FB6E1D3;
	Mon, 14 Sep 2020 07:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07D56E13A
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 09:57:09 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id o8so19170344ejb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Gbv3T8O0xJ0qCU1qNd8Of6YIK0SU5dp95SQ3PtDWaO0=;
 b=Wy38gqJUeXaggqjLqI+pGJq8kU7x1t7zpokB4YzSRMZUvWco/F1t5xd0A6p8+/Hg5J
 kD5XAcuBo3dOejieIZrIzgITWoB0bpTnOPJKAD57voEwXtlgLFTVXG0MgwIh5womWalT
 PmN5m9gWb5QDscoT/7/9HnGnHUtqOsUHXVpvSfnO7MDrc1SFN4sYjTRPiBEVUti7+r5V
 fFHvKVyVuqWhZH9CKUIteCsG0cByIERnHKOqxrYjtclMorDRtZ01MVdgUq9bYnH5g5EE
 eyegwOWnCbZHhxIZzhE7ypQchJhlqVhM7OLjLBT+gP/hbgCQkoI9y2zIGRL4rw+qaMhR
 cLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Gbv3T8O0xJ0qCU1qNd8Of6YIK0SU5dp95SQ3PtDWaO0=;
 b=r4S1cZw50LLJ8/MeCtDnHlFGSEQGt28vV1nlwuJvMXqi0kpRkjFN7FtGxTM5SJ3mGG
 ago77FX1jj7WNbLqZ2DnDvFUyAOExrSpAhAce2Fj0S5L9Azg7/31S4IQpF6Ly4IzeM+w
 JCIZ7Eky+yeNlvkK2e3b/abvgY4EdS2eDXZJNd2aJ7Dm3SS9ODNre0fP6s20KMrwuevQ
 3RIC9iC22CcId1qxsKOwJv/VDpKcaCwJ8Z2h7zU9F0cWefDdsrKl5gJGnZqGz+Cf7a0N
 A4XbGWq+tLx8VFR37Q9pzD2dClMwTvAx7phpzucd1Nj1JLyBXJ0myh0QW3U3vWcb2nfn
 ZLiQ==
X-Gm-Message-State: AOAM531nY6RYfQlCY3Qn0pYj+TyTSASgV/aLXw4djKwFrY6c5/BInm7k
 XLScOuQGJzlWdicVyhTpBwo=
X-Google-Smtp-Source: ABdhPJzOcn6Rwbu13exfp1gYWilPlEYFx3hJ/rPNokplQtCfPNYNOKopygMfJTFKWFoYi5bB4a2BHQ==
X-Received: by 2002:a17:906:facb:: with SMTP id
 lu11mr10087536ejb.249.1599991028362; 
 Sun, 13 Sep 2020 02:57:08 -0700 (PDT)
Received: from felia ([2001:16b8:2dcc:7f00:79af:10ed:f757:91c8])
 by smtp.gmail.com with ESMTPSA id w1sm6408015eds.18.2020.09.13.02.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 02:57:07 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 13 Sep 2020 11:57:01 +0200 (CEST)
X-X-Sender: lukas@felia
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-aspeed list remarks consistent
In-Reply-To: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
Message-ID: <alpine.DEB.2.21.2009131156090.6163@felia>
References: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Joel Stanley <joel@jms.id.au>, Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Sat, 12 Sep 2020, Lukas Bulwahn wrote:

> Commit f15a3ea80391 ("MAINTAINERS: Add ASPEED BMC GFX DRM driver entry")
> does not mention that linux-aspeed@lists.ozlabs.org is moderated for
> non-subscribers, but the other three entries for
> linux-aspeed@lists.ozlabs.org do.
> 
> By 'majority vote' among entries, let us assume it was just missed here and
> adjust it to be consistent with others.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on master and next-20200911
> 
> Joel, please ack.
> David, Daniel, please pick this minor non-urgent clean-up patch.
> 
> This patch submission will also show me if linux-aspeed is moderated or
> not. I have not subscribed to linux-aspeed and if it shows up quickly in
> the archive, the list is probably not moderated; and if it takes longer,
> it is moderated, and hence, validating the patch.
>

I did quickly get back an moderation email that my email is being held 
back. So, that response validates my patch.

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
