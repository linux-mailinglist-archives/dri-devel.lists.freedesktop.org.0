Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E50C69151D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 01:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A9C10EC01;
	Fri, 10 Feb 2023 00:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EFB10EC01
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 00:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675987723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSw5daY010qcHCZuSVoAgV58dbuNqE0exBdvxUMk52M=;
 b=XDYnExz+nQG4g8CfnqBtGLt+5HjtMAfffEiZhCW/yvorcyMz2ugt5ZDEYt981fBNIYvzaU
 U36ctmmVrfnXnRqNQr46bZpZRbW3vZoilE0uHQTyByNv+muhwBtPLH069Kig8+aYmquZ+H
 Po3YlVsb4Km2hppbd4VCsBld7be2i4Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-ccclSgSCOJmxcfrKZcwFMg-1; Thu, 09 Feb 2023 19:08:42 -0500
X-MC-Unique: ccclSgSCOJmxcfrKZcwFMg-1
Received: by mail-qv1-f72.google.com with SMTP id
 oo11-20020a056214450b00b0056c057f3f22so2213325qvb.18
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 16:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BSw5daY010qcHCZuSVoAgV58dbuNqE0exBdvxUMk52M=;
 b=NNeo/rWJek9q8QbGywn9KAwL3Yvub7erASBbEFHtLUwX6oIEZkqTQXUIhTHp6TeHTQ
 TmalH28dRgnFFuDjIQBdnIau0guxjiU3Q48f825A4KdS3DY7WoE3Ezql1mVoU7B4z4em
 dMSmmIllP2Amm4Kjp/dVwJ074rXmeSSjQcmYDQoYuB7Eve+Ku/CjtNE9K0re2p9eduI8
 ZfngftdVZEI4d/hAEXeTy9ZojvQ7QPhWSbsVuM/mBxwIAKNbDcVJLVCCLx8uzsLG8hg7
 4s0SXcD9oGfSZi0IfGTZk14lqp9YWw7/msxE1Krkim8HUOaTX7prbVoAfKK6IKIj6q3N
 5Ulg==
X-Gm-Message-State: AO0yUKWEqG/W/OQmZ0Kij7+vc0JbUPy4wRcEacZr38z6jIT+01g0eH28
 WBNpp4MNGwwP9t+DPZGajroD9ehSD+/hcC1KZ35SgSS4WqBdjO50o89XxvgSUxEjNe6IfIPwHZf
 srfg3qDPnER+mQPwLMXkSP77afPMYejsjGalsY1ail0nF5zooaA==
X-Received: by 2002:ac8:5dc6:0:b0:3ba:8c0:8f89 with SMTP id
 e6-20020ac85dc6000000b003ba08c08f89mr2003774qtx.89.1675987721133; 
 Thu, 09 Feb 2023 16:08:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/5wZzJKpTlmro2WCCkMZCDMF0ZKN/0KTX+DGUF/pDMJLqFMcVYxsSLUcdNimpD7Zma28DTdnHBiJyhmcXCLF8=
X-Received: by 2002:ac8:5dc6:0:b0:3ba:8c0:8f89 with SMTP id
 e6-20020ac85dc6000000b003ba08c08f89mr2003771qtx.89.1675987720917; Thu, 09 Feb
 2023 16:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20230210104720.365557d8@canb.auug.org.au>
In-Reply-To: <20230210104720.365557d8@canb.auug.org.au>
From: David Airlie <airlied@redhat.com>
Date: Fri, 10 Feb 2023 10:08:29 +1000
Message-ID: <CAMwc25r3EQG7hHkC7SU9omHWFGqto7RuUY9uVNkC6vXUF_hVtg@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the drm-misc-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 10, 2023 at 9:47 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> The following commit is also in the drm-fixes tree as a different commit
> (but the same patch):
>
>   94d8b6572a1f ("nvidiafb: detect the hardware support before removing console.")
>
> This is commit
>
>   04119ab1a49f ("nvidiafb: detect the hardware support before removing console.")
>
> in the drm-fixes tree.

Just FYI misc team, I've force pushed drm-misc-fixes to drop this
patch, please make sure any local misc fixes don't bring it back in if
we can avoid it.

Dave.

