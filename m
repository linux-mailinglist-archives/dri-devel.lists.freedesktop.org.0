Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6841CD711
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87E46E433;
	Mon, 11 May 2020 11:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DA86E433
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:03:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so4475734wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f2UAiave+4C0yzTk4hyjUeeMrVJ2ok20QkX6BTAWcnk=;
 b=FNX2D5zWVGnnBlmc4Oo0SzmBoJG611Ho8o7b87QXAyfZdfSuYWU/wq7wd9PknSvltY
 Vq2E+4yJMSO/cloGGg1r1jR5dxTK77Vh1Cp5AREOzxPAUQjTMTzbqk9q8VyAYkoZg/2D
 SY0WWHLHI7pUiZM7b7UQSIfUnkj8hLT5HtVGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f2UAiave+4C0yzTk4hyjUeeMrVJ2ok20QkX6BTAWcnk=;
 b=qemBdwt/IUm18eS6gHwGwZVGXJaRtdy2z2z7Gr3aq6HFsDzpQkyoX+tX5z730EZZLb
 n3wcJzdTkFsf37de9VO4MP+HvbTuGobvNwYZgymJukDITYLOJte1eiAcFkblewP83r3T
 6n5xFM1byqFY0Q48Sk77Tpfma5wNa9OHxABIaks09VyPz7xYcrWVYPwvgKz6ukIQejb3
 Ids9Ceo0+NkYdGi25YQh2zkopZ/yA/+fe8Fg/ECUOjejvDHiGc+XymLn7a8M1CPLd2W+
 2wBEkp+4w05S8zQAw4e2mbOlj/x7Vk+wamDFxq7FLGEsTtaQ+3DTFeJfkeekP+20Hu7e
 cQVg==
X-Gm-Message-State: AGi0PuYOmmIYi/Amhwqx/9816t96Nes9Qx04O6vvmIXqi/K3ZyffLdpy
 FmK6GgXp3f6HDKUZWFqrtFYDUw==
X-Google-Smtp-Source: APiQypIU/wmV9sEfNkXiGps5GelhOeqDK0bu+lOqF9lumObpKw9FBzEdzOfKsYbcqcNn+7ummTLhPg==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr19154145wrq.280.1589195013059; 
 Mon, 11 May 2020 04:03:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g184sm11633864wmg.1.2020.05.11.04.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 04:03:31 -0700 (PDT)
Date: Mon, 11 May 2020 13:03:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
Message-ID: <20200511110329.GC206103@phenom.ffwll.local>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
 <158919237000.1729.13151635793333034320@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158919237000.1729.13151635793333034320@build.alporthouse.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 11:19:30AM +0100, Chris Wilson wrote:
> Quoting Daniel Vetter (2020-05-11 10:54:33)
> >   - worse, neither vk nor gl (to my knowledge) have a concept of events
> >     for when the gpu died. The only stuff you have is things like
> >     arb_robustness which says a) everything continues as if nothing
> >     happened b) there's a function where you can ask whether your gl
> >     context and all the textures/buffers are toast.
> 
> Vulkan/DX12 arrived after eGPU, and there is at least the concept of
> VK_ERROR_DEVICE_LOST. Mainly used at the moment after a GPU hang and
> loss of context.
> 
> https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#devsandqueues-lost-device

Ah cool, so -EIO on some ioctls, with silencing it in the gl driver and
passing it on for the vk driver should be ok. Assuming vk frameworks
bother to implement the *may* thing. I'm assuming if the validation
midlayer doesn't inject this, it's untested and firework will ensue.

But then more direct path to fireworks is what vk is all about :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
