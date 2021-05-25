Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC33901FB
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD1489C6E;
	Tue, 25 May 2021 13:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E66E6E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:18:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i17so32204179wrq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=DRKDlOVl+bKu72pveVUrMWJAxxqnosCy2u/tkJMsTCc=;
 b=LsPTnB6lZVF4LCyyvBq7yVd91qgIwLxGDcsVWgZTdakoCMyyfjgucUIupfvtIizB8N
 q20jJ6d2BBUHrnDxeGDY2cYDOPWJFGhPaNTltEBNSc7gsLeSeS8kfDMym6sWWATuJP0g
 38tsK+4ZevKY3RRF7juLn2JxoJIkjzBvaouhaz4gmrXGKO5AlDzx619MvJ1Pj7EmmRhz
 VFpJxj56PDAKmmEbiHByfiR2RsSezY004lrhr6iFkAg567UBfv/IE74Q5L6ZgWvHJx87
 oUSpLrI3gz1i+kqBdF7LuHDax+tzJXuZENuT1zo087SCU1Na7kAgcN3d+AYdStPvy8wx
 PWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DRKDlOVl+bKu72pveVUrMWJAxxqnosCy2u/tkJMsTCc=;
 b=piZC+H7KnUbuuMwea4RVwYluAChflzFdoHAg3kquepCYqz+m/CMd/FXxYT154epGYb
 jJ70vmW20memOXtJbSbhtmcuPWCZTJcRwQRaituJanVlaw4hFTP+7kdwSirxvyk3X+9M
 i2DIXPNuhINmheFpPy2mKuPt2AE6jDnE5dFOTxl9vW8BxLAhS43Ve2XqSed1I3U/OUJy
 JObPHcap/3Gl9aVtfqin87kTxNT1SMkbubx8txFq/vbmgiyh1Y3W30nUj0IOQ6jDM45M
 /+Ljy3l/0ZF2gCtalXBqGOzNfTNZv/op1Q+ERUOAq9SHp4jTgzC6FFSXs4XxpxjL3T6O
 HEfw==
X-Gm-Message-State: AOAM530wEN4DpINd4CsC2V/L6FHFcutEU1NWWRA7klcz4ajgjuAMmK13
 Ivo/5tQIT0pQWWLrBvdcRYxoxoR4lVI=
X-Google-Smtp-Source: ABdhPJx9RBEHdmk5EQfR2GHhgiD7w3JqRFFQqFFqbdcs/TnTvJPH1qKX9mqXwb9qfc2Qo7qpJCFFGg==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr26800672wru.186.1621948694977; 
 Tue, 25 May 2021 06:18:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1?
 ([2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1])
 by smtp.gmail.com with ESMTPSA id c206sm2777925wmf.12.2021.05.25.06.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:18:14 -0700 (PDT)
Subject: Re: dma-resv ongoing discussion
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
References: <CAPM=9txJQh31KE7v4YN4s9j-cYQEUSRPh7Qg5j2TyNCLNbDySQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f87d2645-0f07-cab5-c1a9-f015ae14dc2a@gmail.com>
Date: Tue, 25 May 2021 15:18:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPM=9txJQh31KE7v4YN4s9j-cYQEUSRPh7Qg5j2TyNCLNbDySQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi Dave and of course everybody else,

Am 24.05.21 um 04:03 schrieb Dave Airlie:
> I'd like to try and summarise where I feel we are all at with respect
> to the dma-buf discussions. I think I've gotten a fairly good idea of
> how things stand but I'm not sure we are really getting to the how to
> move things forward stage, where is probably when I need to step in.
> Thanks for keeping this as respectful as it has been I understand it
> can be difficult. I also think we are starting to find we moved the
> knob on driver development happening in company siloes too far with
> acceleration features and hopefully with this and TTM work etc we can
> start to push back to upstream first designs.
>
> I think Jason[1] summed up my feelings on this the best. We have a
> dma-buf inter-driver contract that has a design issue. We didn't fix
> that initially, now we have amdgpu as the outlier in a world where
> everyone else agreed to the contract.
>
> a) Christian wants to try and move forward with fixing the world of
> dma-buf design across all drivers, but hasn't come up with a plan for
> doing so apart from amdgpu/i915. I think one strength Daniel has here
> is that he's good at coming up with plans that change the ecosystem.
> I'd really like to see some concrete effort to work out how much work
> fixing this across the ecosystem is and whether it is possible. I
> expect Daniel's big huge monster commit message summary of the current
> drivers is a great place to start for this. That is if we can agree
> dma-buf is broken and what dma-buf should look like tomorrow.

Well to clarify I don't want to move forward to implement new features, 
but rather to fix existing shortcomings.

 From my point of view the main purpose of the dma_resv object is to 
provide a container for dma_fence objects for different use cases.

Those use cases are then.
1. Resource management.
2. Implicit synchronization.
3. Information about current operations.

Now I think I can summarize the problem I'm seeing in that the focus of 
the design is to much towards towards a single use case here.

For example, for resource management alone I need to be able to add any 
fence at any time to the resv object without any restriction.

> b) Daniel is coming from the side of let's bring amdgpu into the fold
> first, then if the problem exists we can move everything forward
> together. He intends on pointing out how alone amdgpu is here, and
> wants to try and create a uapi that at least mitigates the biggest
> problems with moving amdgpu to the common model first. I'd like to
> know if this is at least a possibility as an alternate route. I
> understand AMD have some goals to reach here but I think we've dug a
> massive hole here and paying off the tech debt is going to have to
> delay those goals if we are to keep upstream sane.

I don't think we can do this so easily without breaking uAPI.

Userspace in the form of both RADV as well as AMDVLK depend on that 
behavior and we still have the original video decode use case this was 
invented for.

> I'm slowly paging all of the technical details as I go, I'd like to
> see more thought around Daniel's idea of fixing the amdgpu oversync
> with TLB flushing, as it really doesn't make much sense to be that TLB
> flushing on process teardown is going to stall out other processes
> using the shared buffer, that it should only stall out moving the
> pages. If that then allows aligning amdgpu for now and we can work out
> how to fix (a) then that would rock.

Well this is exactly what I've been trying to do by adding those flags 
to the shared fences, but Daniel already convinced me that this is to 
invasive as a first step.

And while this over synchronization is annoying it's already there for a 
very long time and only affects the case when the BO is shared between 
devices.

So for the moment I'm pondering on the question what would be the 
absolutely minimum change necessary to get amdgpu to use the exclusive 
fence in the same way other drivers do.

And I think I can summarize this into two things:
1. We make it possible to add shared fences which are not synchronized 
to the explicit fence.
2. We make it possible to replace the explicit fence without removing 
all the shared fences.

With that in place I'm able to change amdgpu so that we can fill in the 
exclusive fence during CS with chain nodes and keep the synchronization 
model for existing amdgpu uAPI the same.

Regards,
Christian.

> Please correct me where I'm wrong here and definitely if I've
> misrepresented anyone's positions.
>
> Dave.
>
>
> [1] https://lore.kernel.org/dri-devel/a1925038-5c3c-0193-1870-27488caa2577@gmail.com/T/#md800f00476ca1869a81b02a28cb2fabc1028c6be

