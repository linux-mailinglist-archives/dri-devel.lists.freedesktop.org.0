Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC481513BEB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 21:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4820910EA3C;
	Thu, 28 Apr 2022 19:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60210EA3C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 19:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651172457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGiqKM9imBvZdAO3FeOjyQEzvDONaHwBNubl45ThFrQ=;
 b=ebEoQ3lB0PFn4F6zuyXx1fIECufMjUKMix6usN5eLhlI2ATunHa1kVvYiJsGh/BzIXsiDX
 1Q6+C0/aq2RQpEAjNCj4u5cJDyJkWgdHSdkEUB+gwY50gvkh/sTcGNlnGstyDf93eeZM+X
 G1IyBq3V5+ydXOv/iFOH4rXvnzIQnus=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-di_jRbPJOJGakGFVImc1Wg-1; Thu, 28 Apr 2022 15:00:54 -0400
X-MC-Unique: di_jRbPJOJGakGFVImc1Wg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-e72e3aa904so2626821fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 12:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WGiqKM9imBvZdAO3FeOjyQEzvDONaHwBNubl45ThFrQ=;
 b=77Qf//WsoPtCpwyDNQOsnfuW55ANLSufHmVwOtqIH7JvFAVzCkqEZCb3QTxcvuSHmC
 LcbncUf8JV6UJWQzuUZ85DlNzM2+mPNIVbavPjxMqUJsbpO7Pf+26mwPe2Aqg3z3pm3A
 lvnLGsFEyPVevlJL4Iq9anRD4+0VjM8bU10CmpqUNELntUh4n4cbZQbT71LaIk1C51/a
 o/XxcAf0jLpypht94qDv0TG2ENF+aljdQoaHaOn4ETtbQVe8MBGy9TWb6mDJg0m8YcVT
 SoZb56st+z3u9Pvjr8vvLJTHIxh+IkO0WWwc0s49UzvM8zCE/5f/t8NU9nKn/aAIFm2W
 re4A==
X-Gm-Message-State: AOAM531tUTd1tck2OEszy0b3EKc/Hdc7ylAaLdyXhtXxh6GSnDlj3KJO
 BghVblIER3M5Lu5dRRvCsOTWNW0xmoNNkGfQWV4X5AK9bT2bL7UMir24Wqxh2yYJolRfGiYJxWU
 bwbahpFkicrFVDWuDVNkXqG4V0esiEPFINLXktqf7fmGh
X-Received: by 2002:aca:430b:0:b0:322:f961:5fa with SMTP id
 q11-20020aca430b000000b00322f96105famr19348778oia.78.1651172453128; 
 Thu, 28 Apr 2022 12:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOHTyieWRmzAHCjTBXj2d2tWFGlDcPTWNCOiVLtwQrgjyr+0Jw5GB+KDOcwqjWYKDuaYhR/K73RqMbZHXLi7k=
X-Received: by 2002:aca:430b:0:b0:322:f961:5fa with SMTP id
 q11-20020aca430b000000b00322f96105famr19348770oia.78.1651172452859; Thu, 28
 Apr 2022 12:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <20220427135259.5e615945@eldfell>
 <4ceca4d9-c58c-9e33-36a6-dbf0c4bb82a7@amd.com>
 <CA+hFU4ykm-8difozGJ5QtAYc=5RGQTUDiagBNmNccf06sGYGZQ@mail.gmail.com>
 <20220428105017.75d9aefe@eldfell>
 <LN_QB3Nb1GNVmbIVpDUJ4ZVnK3WVHlLKwEYxIqEMYJYc2BohK-7VrtEXJF7iDytYws4tiq2RnimS1QsqwERDdReixBshVTVzNyAMOcWsE3M=@emersion.fr>
 <YmqpmzBrJLX6Xowq@intel.com>
In-Reply-To: <YmqpmzBrJLX6Xowq@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 28 Apr 2022 21:00:41 +0200
Message-ID: <CA+hFU4wpPRLb3KcZOcmEZ2RxGEhggBM1UjJ90VC2DomJJkV-zg@mail.gmail.com>
Subject: Re: How should "max bpc" KMS property work?
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sewick@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 4:50 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Apr 28, 2022 at 07:52:58AM +0000, Simon Ser wrote:
> > On Thursday, April 28th, 2022 at 09:50, Pekka Paalanen <ppaalanen@gmail=
.com> wrote:
> >
> > > > > > Also like Alex said, the kernel does not know if the user prefe=
rs high
> > > > > > color depth or high refresh rate either. One way to solve that =
is to
> > > > > > light up the requested video mode any way the kernel can, and t=
hen
> > > > > > report what the resulting color depth is. Another way is to hav=
e
> > > > > > explicit "use this bpc or fail" KMS property, maybe in the form=
 of 'min
> > > > > > bpc' as I recall being discussed in the past, and let userspace=
 guess
> > > > > > what might work. The former is easier to light up, but probing =
requires
> > > > > > actually setting the modes. The latter may require a lot of
> > > > > > trial-and-error from userspace to find anything that works, but=
 it
> > > > > > takes only time and not blinking - as far as things can be dete=
cted
> > > > > > with TEST_ONLY commits. Then one still has to ask the user if i=
t
> > > > > > actually worked.
> > > > >
> > > > > min_bpc sounds like something we might want for HDR use-cases, un=
less
> > > > > the compositor has a way to confirm the output box (and format). =
min_bpc
> > > > > would allow the KMS driver to pick the lowest required bpc so the
> > > > > compositor always has a guarantee of quality.
> > > >
> > > > IMO that would be ideal. The driver should try to reduce bandwidth =
by lowering
> > > > the bpc down to the min_bpc if the hardware can't drive the selecte=
d mode at a
> > > > higher bpc. User space usually knows which bpc is sufficient for th=
e use case
> > > > but will never complain about too much bpc. Drivers which don't sup=
port
> > > > lowering the bpc dynamically can then still go with the min_bpc and=
 user space
> > > > still gets all the modes which work with the minimum required bpc.
> > >
> > >
> > > This would be nice, yes.
> > >
> > > I'm fairly sure 'min bpc' was discussed here on the dri-devel mailing
> > > list in the past, but I don't remember when or by whom.
> >
> > Yup. I explained there that I'd prefer "current bpc" + "user bpc" props
> > and let user-space deal with the fallback logic just like it does for
> > modes, modifiers, etc.
>
> The main problem is that the bpc is not really al that well defined.
> We have stuff like 4:2:0 subsampling, DSC (compression), etc. muddying
> the waters. Of course max_bpc already suffers a bit from those issues,
> but at least it can still claim to do what it says on the tin.
> Guaranteeing any kind of minimum bpc is not possible without first
> defining what that actually means.
>
> Oh and the various processing blocks in the pipeline might also have
> varying input/output precision. So those can also degrade the quality
> regardless of how many bits are coming out the end of the pipe.
>
> I suspect trying to exose all that explicitly would result in an API
> that just has too many knobs and interactions between the knobs. So
> likely no one would be able to succesfully use it.

I said something similar on IRC earlier today and I agree.

We have 3 options here:

1. Don't give user space any kind of information
2. Give user space all the information so that it can figure out the
effective bpc
3. Let the kernel figure out the effective bpc

We *need* the information in user space so 1. is not going to work.
Exposing all hardware details in the current KMS API just won't work
well. So that leaves the kernel having to estimate the effective bpc.

I also agree that we have to define what the effective bpc is and IMO
it should contain not only connector properties but also all the color
processing blocks, pipe limitations and dithering in between the
framebuffer and the connector.

(or we can burn KMS down and create a libcamera kind of thing :>)

>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

