Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B082D6994B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5010E15F;
	Thu, 16 Feb 2023 12:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D10B10E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:46:38 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u11so551173oiw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 04:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PmKeR3pToNxI0zV7xmVbGnwtsFHO6ZTTWWtBh0Q1Sc8=;
 b=a5ushVBy1AkQJ69PFda3PsYFuH0o8nUFmip+U9nkppbbrxJG1k3nbM7TofqUCT5XCo
 1BHLQRVlghadSANn+HmIzJ4JkBREeni9tKxa4krG34ohHHyNlzsz9iIMvViAs2BlqYq3
 A0wyWuQNTXiACKMQc/gyQbzx/RObYhST/Sswc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PmKeR3pToNxI0zV7xmVbGnwtsFHO6ZTTWWtBh0Q1Sc8=;
 b=RcWHX4ysKQR0nKFyzjkKzum3e4rzV/oAAIjbmrr2qpwkrunrsBkJm0s/0Ou/Ys97Ou
 1wTujrOnxXQMzUtYy0QGMimv0ngsCO+jI1uoeba4zC8zp5/XJVoL73Aywv1TV7qKcP+W
 jSUxC7IUBjZFC+fFsLpvOULsznVe1BRjwtRs3DiwxB5zRB0XAQ+SL/tLAz5VcdKuR9A1
 sHaGfkn5ZMkEjEkdu90OarL6jmKWCgBIuZQTgFoSVHScuG2hHgnPf1nPgpmQqyZYVrcr
 oMUGV52I6mpKsPzY65VsDF+e3Gs6H+UGG4GBtysggCjaK0KMgbjE7m6BJPezhkwDTU4Y
 QICQ==
X-Gm-Message-State: AO0yUKVEbjyWwJ7QFvyWAxYEeuhGxvesm3Ilas5pkduIdjIDUKs6C4Za
 Zh351nwr8d3r0+NY4/2FvQ2twa31HgO/lKZ24k5RWA==
X-Google-Smtp-Source: AK7set/NsSMz5aI4wuLMwBbJnWhu1Bxpdajvz0oNMXiDdsZuweZ6lxNa0kOKUSFW4I9eFyuDBo5ETFOdkvo8GKPiRWY=
X-Received: by 2002:a05:6808:3203:b0:368:ca97:3a2a with SMTP id
 cb3-20020a056808320300b00368ca973a2amr200996oib.261.1676551597981; Thu, 16
 Feb 2023 04:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20230215124152.101548-1-contact@emersion.fr>
 <20230215154123.3f9fefce@eldfell>
 <ia5oa4sV74Cq0n0T5yDytOheked1Uuxb8CHh7L_Hdi51oIWuWIwOuqWsidJz3LrNdpoQqT7wNBgvSxVfKV-ZbbHLIC6U0aRrae9rVqUUpYg=@emersion.fr>
 <20230216111110.5d1e8e7d@eldfell>
 <fDk5M2V_0bRfC6CucNJLDy971yxeJ6UrqzhaDHHp-jCBT16MQowi_i_grjeeHV1y2awJFyFwxolMbkWwcpM3hSKj3s9Jt91VJvQVMhgamao=@emersion.fr>
In-Reply-To: <fDk5M2V_0bRfC6CucNJLDy971yxeJ6UrqzhaDHHp-jCBT16MQowi_i_grjeeHV1y2awJFyFwxolMbkWwcpM3hSKj3s9Jt91VJvQVMhgamao=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 16 Feb 2023 13:46:27 +0100
Message-ID: <CAKMK7uGY61ry0kjpyAVywbru9Bzf3u8eNc6E0FttNh2S0G0STQ@mail.gmail.com>
Subject: Re: [PATCH] drm: document expectations for GETFB2 handles
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, daniels@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 at 10:25, Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, February 16th, 2023 at 10:11, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> > Btw. does this also mean that if you use GETFB2 to get handle A, you
> > export that as dmabuf and import in the same open device instance, you
> > again get handle A?
>
> I haven't tested it, but I believe that is correct.

Yup. If we haven't, we should probably document this in the FD2HANDLE ioctl.
-Daniel

> > IOW, you should never ever export a dmabuf of what you got with
> > GETFB2. If one did, one might import it oneself via GBM, breaking all
> > reference counting. But you also cannot "just leak" the handle A,
> > because if GBM happens to run on a different DRM device opened
> > instance, GBM would get a different handle to own.
> >
> > That's... err. How is a compositor supposed to do transition animation
> > from an old FB to its own thing? I guess mmap + glTexImage2D equivalent
> > to make a copy of the old FB so one can use it as a texture?
>
> I think the compositor can export the handle as DMA-BUF, then close the
> handle immediately. Then go about its business as usual.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
