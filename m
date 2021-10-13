Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF38742C161
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB736E053;
	Wed, 13 Oct 2021 13:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733576E053
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 13:26:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t2so8380603wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4ZBC969FVok1eY2w7nMmmgvhC6HvUOJiXWHVhHaFOwU=;
 b=SQ0Rp6hvlW7gN0NVEBBstW2sqB4by4Ckf7kjf5i337dhcKAKP3eMkso5odE6ceCR+k
 5YUwti+PFCzR2dzDtdtC21eNr5SMfNESb0MnJ4DmfoRDqWwRDLU5o3F2NxOH1Fhz6wd9
 F5oSY29oFS5nyChuGBjeNjvkIRcBATGB3hZbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4ZBC969FVok1eY2w7nMmmgvhC6HvUOJiXWHVhHaFOwU=;
 b=g+ph0SKrsu2bHz+glGo0w2HOryOPtnpnyikZf0M36jAt1PoUuByz1EAFom4U7NJCwE
 dCwZXu1eWAZxY0CLIPzNKB1VUmaA0ZLERTu5ManKYVuaWl6/b5A3tGPveM+vqnH1jC/i
 M+WO+NiwLuPfAGFPbmO2CCKjQ9lQmp0O2gTSIgGBNx2fD4IpkVfn0fKKtvWjzuzdVji6
 6hub2g3r+PKb6j6bWER6SmcjopUpeFloZHyL6wXrxtfnRACxx96nzxyHaFjzDmmgaQTR
 qhbXkiZHtQzTPX5Tvmbr9HdojXktwLrxj0eCSe9l2N1gwNvgAbxw+UhP4rbvRZuNBKdE
 M9qA==
X-Gm-Message-State: AOAM530rZHpBJ44H5R7lwI5yedwRBh1fyUFKOAzflKAhA39rA6mCEAnn
 CSBMYJ6msLkcJ5VaDtAzB6DJrw==
X-Google-Smtp-Source: ABdhPJxLknOsY+y5dglY3Mf+URYIj8Yvxtch0BAmgkFvyiT4UmA4TlWStXR+IldJYABbavd4nNE9fg==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr13368905wmd.20.1634131566597; 
 Wed, 13 Oct 2021 06:26:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y191sm5963420wmc.36.2021.10.13.06.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 06:26:05 -0700 (PDT)
Date: Wed, 13 Oct 2021 15:26:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <n@nfraprado.net>
Cc: Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Daniel Latypov <dlatypov@google.com>,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@riseup.net>,
 Leandro Ribeiro <leandrohr@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Pedro Sader Azevedo <pedro.saderazevedo@protonmail.com>,
 isinyaaa <isabellabdoamaral@gmail.com>, ~lkcamp/discussion@lists.sr.ht
Subject: Re: DRM KUnit hackathon
Message-ID: <YWbea0x7i+z3N3gC@phenom.ffwll.local>
References: <20211011152333.gm5jkaog6b6nbv5w@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211011152333.gm5jkaog6b6nbv5w@notapiano>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 11, 2021 at 10:23:33AM -0500, Nícolas F. R. A. Prado wrote:
> Hello,
> 
> We belong to a student group, LKCAMP [1], which is focused on sharing kernel and
> free software development knowledge and mentoring newcomers to become
> contributors to these projects.
> 
> As part of our efforts, we'll be organizing a hackathon to convert the drm
> selftests in drivers/gpu/drm/selftests/ (and possibly the ones in
> drivers/dma-buf too) to the KUnit framework. It will take place on October 30.
> 
> So please expect to receive some patches from our mentees on that date. It
> probably won't be a big volume (experience tells it'll be around half a dozen
> patches). We'll also make sure to do an internal review beforehand to catch
> common first-timer mistakes and teach the basics.
> 
> We're already working on making sure that the converted KUnit tests can still be
> run by IGT.
> 
> Please let us know if there's any issue with this date. Otherwise we look
> forward to helping a few newcomers get their patches in the kernel on the 30th
> :).

Welcome all, looking forward to cool stuff!

Cheers, Daniel

> 
> Thanks!
> 
> [1] - https://lkcamp.dev/

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
