Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94B1CD26C
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE866E243;
	Mon, 11 May 2020 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9AD6E105
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=6/MCkRWtzcFUtNLZ49gagwHv5OpUhZvNbxXE9ACJvY0=; b=s6abjmPBBdY+hDPJtRKrr9auaE
 S83tNLhAZ6Ixz/NLPj2wnUNOTFO2sWoRfovkwjMS2i1clHXm0+12TLRmJ/4mhOSUyx50H/WqQXKKv
 rtWE4ivpgi7rZMB6ckDpr3ql47mWn3JxMtLRP/bAMy0LR8WxFt2r9B7w9+VE6Z+f5grDUnHCmlELR
 FpV09CGI3hquCXMrbegb+yxINrav3Yofk4vOvbbNyJLV5bw7Ul3adds50vZMpKXgpHifCuIMdg2T5
 7cjLq5Ijx+BCJbhdpRa8vN3ShrJUrzMuB8PUbJDo0BpxKFHFQc7oF7h9BEfvVTohRf2O3Gz8ruacg
 pO3m6UEQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXzfm-0004qK-Nq; Mon, 11 May 2020 04:04:10 +0000
Subject: Re: linux-next: build warning after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20200511134711.4956a5d0@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ca5be4d7-2354-f1ea-45b3-357f82986d8f@infradead.org>
Date: Sun, 10 May 2020 21:04:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511134711.4956a5d0@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/20 8:47 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/panel/panel-visionox-rm69299.o
> 
> Introduced by commit
> 
>   c7f66d32dd43 ("drm/panel: add support for rm69299 visionox panel")
> 

I posted a patch last week:

https://lore.kernel.org/dri-devel/bbb7b3b3-9968-9a1f-8ef6-2e8e3be998f6@infradead.org/

-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
