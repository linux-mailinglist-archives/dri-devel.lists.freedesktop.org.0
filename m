Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B31A6C5E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 21:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E979289C83;
	Mon, 13 Apr 2020 19:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED9789C83;
 Mon, 13 Apr 2020 19:11:39 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id v7so10702582qkc.0;
 Mon, 13 Apr 2020 12:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+lbubkUGFiM6VzQ+ueHXGQsXYs3AnJsTHepD8DGOyaE=;
 b=eaYLPoyRllFIIJ1rsXYKhFdiz0QqsdX7PAjZtRacsfQZqFUOOFeyjQ7vNX5brDMf82
 Uue5XZO8jlEiz9SQba87q5dC3SUCiD7k3LRm/w/0yX/UkQ2PzmEiC16wNMwL3/s5Fwyw
 HtsKhQjpjwegOtBIZ9HSjQH1YdNlbxSiPuzcLphimp2WqXJpyyvPRUNMWOUk7iixdixj
 Z/pbwzYJv+KRMY04nvZDKbtpp4CoiJ60W/HRsp/sdywWVD2JB6nKyxfHGPu8xDc5+MHT
 vVHbrbYqM5DBhz2tVz/4/rEmbjeV3PWxyENQFvkI4YdOpFxfCbmRFX2dFi+3WAbjEy6x
 19pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=+lbubkUGFiM6VzQ+ueHXGQsXYs3AnJsTHepD8DGOyaE=;
 b=VyI4yrr/ThL7t2F4WTXZ7ZDml2KJ47iPG+p/dKxrODnRQcV9iNcuGSgTJMKgoXQByq
 oKQ05l3BBrrhQ+F7WkmB9SSZpS4iOowfawNQpTWPEhflgv5L1zlZnC5GblO+9I88sCtQ
 IAMWco8RlyLJdawpydZ8PfUHDy1GrasurY+9BtbCgu0pfKQTsjRaeQyThRGusAy6/GL0
 jw7d/fmWq4ccKiGimXdWIi3ovo0Tr1huCoaP/CqvgLMp3eHDoIu3jGYCG40fLaYclpdD
 uwCo5dWqs20ePcWrcLUAOmKg7rDSGgM+bCqq43hryxwUaHi3EHbncjm3/2JBgcG4erX9
 HhmA==
X-Gm-Message-State: AGi0PuYfTwRIfa79f42kxVMSiCxEOkEKgPYcaemVhiSPGUe0Ttt+UfhQ
 U2VfhoOtNACIq2VzbUZH+o0=
X-Google-Smtp-Source: APiQypLnNJ8smZT+QChmfC/ZWvRkkCA+pg4ypBQGWrb47G+Spc86/Me8goNHAQjSvAJtsmuKIFHLmg==
X-Received: by 2002:a37:71c4:: with SMTP id m187mr6447160qkc.4.1586805098466; 
 Mon, 13 Apr 2020 12:11:38 -0700 (PDT)
Received: from localhost ([199.96.181.106])
 by smtp.gmail.com with ESMTPSA id d17sm9709606qtb.74.2020.04.13.12.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 12:11:37 -0700 (PDT)
Date: Mon, 13 Apr 2020 15:11:36 -0400
From: Tejun Heo <tj@kernel.org>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
Message-ID: <20200413191136.GI60335@mtj.duckdns.org>
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Kenny.

On Tue, Mar 24, 2020 at 02:49:27PM -0400, Kenny Ho wrote:
> Can you elaborate more on what are the missing pieces?

Sorry about the long delay, but I think we've been going in circles for quite
a while now. Let's try to make it really simple as the first step. How about
something like the following?

* gpu.weight (should it be gpu.compute.weight? idk) - A single number
  per-device weight similar to io.weight, which distributes computation
  resources in work-conserving way.

* gpu.memory.high - A single number per-device on-device memory limit.

The above two, if works well, should already be plenty useful. And my guess is
that getting the above working well will be plenty challenging already even
though it's already excluding work-conserving memory distribution. So, let's
please do that as the first step and see what more would be needed from there.

Thanks.

-- 
tejun
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
