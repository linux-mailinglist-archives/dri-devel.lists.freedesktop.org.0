Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580B3699487
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEDB10ED57;
	Thu, 16 Feb 2023 12:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913A10ED56
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:38:00 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id j22so732193qka.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 04:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JlAXMJ8vFOPSjC0ycO+qIAE3x1seHVU+RmVv9Ao2yj0=;
 b=yoy7I736Pga4GOkJJTznGpqK8yC/uuCKWEqPqV67qlBQHKeebvfqGTlI5esQkSrxHQ
 DW71SOR+kehDh2bIicd/sV7HzaOl6Lqdv0YxJJeWaOyxPILScw+lggh+dslT/fF3bAOH
 lDeOJh6bl+vQU/yZq+/LJrk+gqxf3O4cLPMYCa2pxJyqaSLs3G3G4+GIqMa8BVCJpsgR
 2sb+k8zjMovnToDhfxKUZMEgrqM3a74WagHZ6w5CbVC3SEMSPRgqdi473HkXYRZcmD+s
 RpNToU5fI67uuplAYk0HqdIKgW7fQ15OYnNdFXtrGndLJxNwF7CgfWOsGpZn+6Jn7+lt
 hfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JlAXMJ8vFOPSjC0ycO+qIAE3x1seHVU+RmVv9Ao2yj0=;
 b=e/jQxI4JykTVjqSj56a9CAu239vGyaGXgaDkyLbS0PDQhZCCkxgCbx2T7r6bCwk4HF
 QyBUmviphFDIL7nmKee179URqnIFLJZ+dpQuFUcbbZ2aZ86EHAWYBxyeeP7GXAeSXfRr
 /0Y3Cvcsqe4BjctJa+X/AvHGOzI/2yECneW32kYgL+f9fcPMe9wpy8csa/rNrgh+nSGB
 1IXMFcqeusd9Aiu6proDuLHUIkuUb5/21FUrAad3kgPcMtLwaeDj+u9TUaoI+tQGV6Gy
 9DJ5cvwOSy9rQeMXo9YoiFQmDIm6L/OT1u1MCvEzZBZGdKfeAlgUTRxd5d5wBR5KZJHj
 FARA==
X-Gm-Message-State: AO0yUKV9Jskps9XyZB0x9Ty6lRcpPPK9wa6uce6jcNI9U5qiKfGyym5B
 IC3J9xZxiHfyHeDiib13JvKbqOHPkrM4a34x0XT0Uw==
X-Google-Smtp-Source: AK7set/VqgwVvloXw4YYmBKSdMzrRfmMMAHyJhBLnNjILORHbpnFRESy6N7n+6P4vHS8+5hUFGL9gvXmjXaFcd1Yxi8=
X-Received: by 2002:a05:620a:141:b0:71b:637a:f549 with SMTP id
 e1-20020a05620a014100b0071b637af549mr326701qkn.225.1676551079006; Thu, 16 Feb
 2023 04:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20230215124152.101548-1-contact@emersion.fr>
 <20230215154123.3f9fefce@eldfell>
 <ia5oa4sV74Cq0n0T5yDytOheked1Uuxb8CHh7L_Hdi51oIWuWIwOuqWsidJz3LrNdpoQqT7wNBgvSxVfKV-ZbbHLIC6U0aRrae9rVqUUpYg=@emersion.fr>
 <20230216111110.5d1e8e7d@eldfell>
 <fDk5M2V_0bRfC6CucNJLDy971yxeJ6UrqzhaDHHp-jCBT16MQowi_i_grjeeHV1y2awJFyFwxolMbkWwcpM3hSKj3s9Jt91VJvQVMhgamao=@emersion.fr>
In-Reply-To: <fDk5M2V_0bRfC6CucNJLDy971yxeJ6UrqzhaDHHp-jCBT16MQowi_i_grjeeHV1y2awJFyFwxolMbkWwcpM3hSKj3s9Jt91VJvQVMhgamao=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 16 Feb 2023 12:37:48 +0000
Message-ID: <CAPj87rOj7VHib8Uu8pfNtbny6FhKfRN033SYOYWjbZz9WTg14w@mail.gmail.com>
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

Hi,

On Thu, 16 Feb 2023 at 09:25, Simon Ser <contact@emersion.fr> wrote:
> On Thursday, February 16th, 2023 at 10:11, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > Btw. does this also mean that if you use GETFB2 to get handle A, you
> > export that as dmabuf and import in the same open device instance, you
> > again get handle A?
>
> I haven't tested it, but I believe that is correct.
>
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

Yeah, I think either of those two are the most sensible. We did go
back and forth over the semantics a few times - part over mail and
part over IRC - and the eventual conclusion was to match GetFB to make
it easier for users to transition, but to de-duplicate the handles
_within_ the call for consistency with the rest of everything else.
It's not the most pleasant compromise, but eh.

Cheers,
Daniel
