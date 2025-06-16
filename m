Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD5ADAD8B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57E610E322;
	Mon, 16 Jun 2025 10:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="lxlTsox0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1AA10E322
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 10:38:56 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so3690072f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 03:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750070335; x=1750675135; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LiqpqPQtrFsnbmqFYsDHbTcG5O1V7XPSXXU7AIcQykw=;
 b=lxlTsox0KUvXWPtpIyXMLlgYqP6P6dY9ghq+NkwwjaWrbZ5HMnHb9F0fyJLsJtYI//
 6Bi7J0UUba/L9AOeHHghYdy2tGE233QaQMXpdkV88fAJH8reCraUCENuC6nfWBZv4uW3
 wCi9DDwvHtVaq6UejueMSEvItOiwhy41Z2Qpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750070335; x=1750675135;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LiqpqPQtrFsnbmqFYsDHbTcG5O1V7XPSXXU7AIcQykw=;
 b=ppoT1Ss5MRhHY+1JF6U3rnfL9ZpO2BuAClqOorUVWQJygK/a1ifPRHwnBrg+8FBVox
 bbmqQ6jmRAdlrdvFRq7AVbUNXFPAInPTxOwsqwop/H7fKEJY7EK/QOyKC1vZQ6Fv7uHe
 074//nlrABsfST6ipfEmqdrPKBP9ZAwSZGIvVj6AG0WQD3uTTzcTv6GFg9wTTFo4B0/A
 c4PtP61VAOfSH8UmQrLsM8gOv63+hJlacv6iHgYYNAKNqu12Gud0XNjfu2ni+ydtFuOa
 +k3/GE7IuEZ3eO3wcvj4VzALheE+zstUM3vU4maT1uYbaM+29OIt4zw8XdtNf7MkFXkm
 wnQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHyBM2zECz57a81/h4nh0xyxPYiyiE2Dw3T3IBK8k0wTyE5bGU1ZBfNtO+eN0mkBiKvb2fo5ikzVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3py+wzgLHmKZwWtLmSroL0CqRt/DxRFvU22RFFXsAiELSja90
 hgVRr57W5Lc3j09gPuAn4FVp/AdnIlSxCDV7paMCUqOrOPE8c3a3gnsfHg0OLe8+rk8=
X-Gm-Gg: ASbGncv4YwMGjzRSJAPNflCNgWg2S6ay2UqKUg/7FdcEVC6l1brsPLxho5m4O4mfOOG
 juHSYnQdN1PXDqHsxo46N+RtdCPQ51iSuiAC5MZzMVQ8GGPZ9QfVMXYN1WHXUW8XXlM5ZMniE9e
 JBmKD2vcivvhcQD8nqlAcql7luK96fAs1zi7hHUVPZJfDBSS3362vvhVlvOKj3oF5mex5lP11Cd
 FqiQLGnXEaQQESIK8mdL3pK5XvrW2TG2kScuaZSFLzsobxKn7ImsQea4I4ZyIj93KjdVRsja+0C
 AmsZCfE0xv+HlK4Z/ixvd29gCDFOs5T9xUVJ8fPzqceBqy8vzd/AMLnXwT+Vkqh8IcC6jo1xDg=
 =
X-Google-Smtp-Source: AGHT+IHgWBleMuR1LhdIIySAqRh7zgcQH0Xx7TfDdQW7tKZ4tZM1eUDZcj35BU9TZV4w4Ap86q9ShA==
X-Received: by 2002:a5d:5f54:0:b0:3a5:1397:51a7 with SMTP id
 ffacd0b85a97d-3a56d7cd5b7mr8501162f8f.7.1750070334910; 
 Mon, 16 Jun 2025 03:38:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a5546asm10524502f8f.3.2025.06.16.03.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 03:38:54 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:38:52 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, jani.saarinen@intel.com,
 jani.nikula@linux.intel.com, tursulin@ursulin.net,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
Message-ID: <aE_0PLfh3h2IeTun@phenom.ffwll.local>
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
 <238ce166-2dd5-4599-865b-1c263f01a465@amd.com>
 <aEw3IRn565keDO6B@phenom.ffwll.local>
 <26705733-0c24-4f3b-a6ce-d5f2fd8c935d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26705733-0c24-4f3b-a6ce-d5f2fd8c935d@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jun 13, 2025 at 05:03:39PM +0200, Christian König wrote:
> On 6/13/25 16:35, Simona Vetter wrote:
> > On Fri, Jun 13, 2025 at 04:12:47PM +0200, Christian König wrote:
> >> On 6/13/25 16:04, Simona Vetter wrote:
> >>> On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian König wrote:
> >>>> It is possible through flink or IOCTLs like MODE_GETFB2 to create
> >>>> multiple handles for the same underlying GEM object.
> >>>>
> >>>> But in prime we explicitely don't want to have multiple handles for the
> >>>> same DMA-buf. So just ignore it if a DMA-buf is exported with another
> >>>> handle.
> >>>>
> >>>> This was made obvious by removing the extra check in
> >>>> drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
> >>>> find it in the housekeeping structures.
> >>>>
> >>>> Signed-off-by: Christian König <christian.koenig@amd.com>
> >>>> ---
> >>>>  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
> >>>>  1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >>>> index 1d93b44c00c4..f5f30d947b61 100644
> >>>> --- a/drivers/gpu/drm/drm_prime.c
> >>>> +++ b/drivers/gpu/drm/drm_prime.c
> >>>> @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> >>>>  
> >>>>  		rb = *p;
> >>>>  		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> >>>> +
> >>>> +		/*
> >>>> +		 * Just ignore the new handle if we already have an handle for
> >>>> +		 * this DMA-buf.
> >>>> +		 */
> >>>> +		if (dma_buf == pos->dma_buf) {
> >>>> +			dma_buf_put(dma_buf);
> >>>> +			kfree(member);
> >>>> +			return 0;
> >>>
> >>> This feels a bit brittle, because this case should only be possible when
> >>> called from drm_gem_prime_handle_to_dmabuf and not from
> >>> drm_gem_prime_fd_to_handle() (where it would indicate a real race and
> >>> hence bug in our code).
> >>>
> >>> I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this case. 
> >>>
> >>> Otherwise yes this is the functional change that I've missed :-/ Note that
> >>> there's no race in the original code, because it's all protected by the
> >>> file_priv->prime.lock. Which means I think you're claim that you've only
> >>> widened the race with your patch is wrong.
> >>
> >> Yeah, agree. I'm always confused that there are two locks to protect the data structures.
> >>
> >> But there is indeed a problem in the existing code. What happens if a
> >> GEM handle duplicate is exported with drm_prime_add_buf_handle()? E.g.
> >> something created by GETFB2? 
> > 
> > The uniqueness guarantee only extends to FB2HANDLE, because that's the
> > case userspace cannot figure out any other way.
> 
> Well that sounds like you didn't understood what I meant.
> 
> The problem here is that we mess up FD2HANDLE if I'm not completely mistaken.
> 
> > For flink import you can
> > compare the flink name (those are global), and for other ioctl like
> > GETFB(2) you just always get a new name that you need to close() yourself.
> > 
> > I guess if you want a unique name for these others you could do a
> > rount-trip through a dma-buf :-P

I guess I should have elaborated what I mean here with this off-hand
remark, see below.

> I advised that before as well, but exactly that's what is not working as far as I can see.
> 
> Let's go over this example:
> 1. We have GEM handle 8.
> 2. Export GEM handle 8 as DMA-buf and get an FD.
> 3. Import the DMA-buf FD again with FD2HANDLE and get 8.
> 4. Now 8 is used in a FB config.
> 5. Somebody calls GETFB2 and gets 10 instead 8 for the same BO.
> 
> 6. Now FD2HANDLE is called with 10 and here is what happens:
> 
> 	drm_prime_lookup_buf_by_handle() is called for handle 10, so we
> 	don't find anything.
> 
> 	obj->dma_buf is true so we branch into the if and call
> 	drm_prime_add_buf_handle() with handle 10.
> 
> Now we have called drm_prime_add_buf_handle() both for handle 8 and
> handle 10 and so we have both 8 and 10 for the same DMA-buf in our tree.

So this is the case that broke, and which the various igt prime tests
actually had testcases for. Unless I'm completely confused here now.

> So FD2HANDLE could return either 8 or 10 depending on which is looked up
> first.
> 
> I'm not 100% sure if that has any bad consequences, but I'm pretty sure
> that this is not intentional.
> 
> Should we fix that? If yes than how?

I dont think there's an issue, all we guarantee is that if you call
FD2HANDLE or HANDLE2FD, then you get something consistent back. From a
userspace pov there's two cases:

1. We've already seen this buffer, it got handle 8, that's the one we've
stored in the lookup caches. If you then do GETFB2 you get handle 10,
which could be confusing. So you do

	temp_dmabuf_fd = ioctl(HANDLE2FD, 10);
	new_id = ioctl(FD2HANDLE, temp_dmabuf_fd);
	close(temp_dma_buf_fd);
	ioctl(GEM_CLOSE, 10);

At this point new_id is 8, and you already have that in your userspace
cache, so all is good.

2. Userspace doesn't have the buffer already, but it doesn't know that. It
does the exact dance as above, except this time around it gets back the
same gem_handle as it got from GETFB2 and knows that it does not have to
close that handle (since it's the only one), and that it should add that
handle to the userspace-side dma-buf import/export side.

It's a bit a contrived dance, but I don't think we have an issue here.

Cheers, Sima

> 
> Regards,
> Christian.
> 
> 
> > > But the reaons dma-buf import was special was that before we had a real
> > inode or the KMP syscall there was just no way to compare dma-buf for
> > identity, and so we needed a special guarantee. Probably the funniest
> > piece of uapi we have :-/
> > 
> >> IIRC AMD once had a test case which exercised exactly that. I'm not 100%
> >> sure what would happen here, but it looks not correct to me.
> > 
> > Yeah I think the real-world GETFB are only for when you know it's not one
> > of your own buffers, so all fine. Or we haven't tested this stuff enough
> > yet ... Either way, userpace can fix it with a round-trip through
> > FD2HANDLE.
> > 
> > Cheers, Sima
> > 
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Cheers, Sima
> >>>
> >>>> +
> >>>> +		}
> >>>>  		if (dma_buf > pos->dma_buf)
> >>>>  			p = &rb->rb_right;
> >>>>  		else
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>>
> >>
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
