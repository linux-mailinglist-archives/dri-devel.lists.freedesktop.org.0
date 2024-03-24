Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D76D88818E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 00:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA39210E465;
	Sun, 24 Mar 2024 23:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFEDC3/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1340710E463;
 Sun, 24 Mar 2024 23:23:58 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6e6bee809b8so3249962b3a.1; 
 Sun, 24 Mar 2024 16:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711322637; x=1711927437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yr2Cf82o25fp9daEntXPX2qWzpAZqJg/jLy0faLOqfo=;
 b=HFEDC3/9BgvlkXygkRFkm6t8qjQ8BnzxydUfjvDBX/vD5G0Kj2wpq8hUJh2Rp4zHo/
 lA+WiQbPpwR0GJ1YIiysw5Mwht6cQYZgEfDKj9u6vbqz5EMc4vI9N44Chqv6k0NbX57R
 WTZr/kpMjHNvne2L4cA4sRt59O6ECCkCu6wHi/8x7OUpwMDg7u/csEjLfC7SNKJtgOMa
 IZJsGP4EChj5Wo8v8RfxLCBliTAfIci+uhyyJhvYghj5PxtL+ADDS8+LYygS6ODrAySD
 Zx8vcsoOrQZmhTG6jTHOMzzfMiZvMYPgPDZ3euojvee0wsKLytos89zOplOeyVutg5Hm
 INbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711322637; x=1711927437;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yr2Cf82o25fp9daEntXPX2qWzpAZqJg/jLy0faLOqfo=;
 b=NeBOrrZbs+qA2PyHHa/8cXwiinWFdhMBvPjRCDzHKLiYof/V/gXBNzikvGqy6IskVs
 UV0OPGXXCOtSSiWNfmYC4Y1/JGWa6U04AV6mlQfSfBoHbHgSwFcQ5aJwP2yLHEkV5AvK
 kpF5Zn074TauLaQhoKCSzZz1cFwwEksgB/e+d3n5qiwUUDx3NF5SBtZW7xk8KXs4YSW+
 Bg9iIgMVJ8MM5whL2bmAygMt4kLQFr4ayC89RnpQ5yw5tUx8DoHmBj7pni+2IHnpFqHI
 CwWEUvCLrPc5W6fiZb2S9baJQeGn6jFi1HXHAebI9F0cjIgC9/4fQ0Rsa3dEDqeggW6W
 McYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3BqNtlIc6mD7VBl1Ayy1BbeAUUu2shLn10wVtodnhxCd8yXD6eIiV8+pTtpH1D/Z2BwKQNl8LR7vIk3GdpI3JhTuXErJWkPPZLvuCn2r23YfRYLpB1+PVDr4SZnRVOVJcze840ZXSD4Cy+aQNiw==
X-Gm-Message-State: AOJu0YyfnNqgS0db0KWXTUDj8XEg6du2Pbyk04ltnFSvic8XSxq59Lu6
 zTsm+EUVTVV6dsiKhZpAmH6PC/9IWMY7+r5SbLObCmOdwupUdJMMO9gDng91XkapmhnVTHpm3ht
 s7s3G1vRnZHMa02YYplnNcMunv6j+ge28
X-Google-Smtp-Source: AGHT+IFMOMfeUxQyKzPFnUMoVWDwkbdGKmRMYPWEC+HKw+YXJ9EhRRfrd0ilgf+Tk07qVbRcktkVNSKiwlufFCxvaZ0=
X-Received: by 2002:a05:6a20:8ca7:b0:1a3:40e3:318a with SMTP id
 k39-20020a056a208ca700b001a340e3318amr5663622pzh.60.1711322637106; Sun, 24
 Mar 2024 16:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240307221609.7651-1-hannes@cmpxchg.org>
 <c411dce6-faaf-46c3-8bb6-8c4db871e598@gmail.com>
 <20240314170948.GA581298@cmpxchg.org> <20240323145247.GC448621@cmpxchg.org>
 <c8efae98-3cf8-c21c-bfa4-d5998ab92a0e@amd.com>
In-Reply-To: <c8efae98-3cf8-c21c-bfa4-d5998ab92a0e@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 24 Mar 2024 19:23:44 -0400
Message-ID: <CADnq5_OGSLpLLEJqh86_SAZcqv-Cv6AmZJRZyaFtSmTHJ8ybxg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
To: "Sharma, Shashank" <shashank.sharma@amd.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 23, 2024 at 4:47=E2=80=AFPM Sharma, Shashank
<shashank.sharma@amd.com> wrote:
>
>
> On 23/03/2024 15:52, Johannes Weiner wrote:
> > On Thu, Mar 14, 2024 at 01:09:57PM -0400, Johannes Weiner wrote:
> >> Hello,
> >>
> >> On Fri, Mar 08, 2024 at 12:32:33PM +0100, Christian K=C3=B6nig wrote:
> >>> Am 07.03.24 um 23:07 schrieb Johannes Weiner:
> >>>> Lastly I went with an open loop instead of a memcpy() as I wasn't
> >>>> sure if that memory is safe to address a byte at at time.
> >> Shashank pointed out to me in private that byte access would indeed be
> >> safe. However, after actually trying it it won't work because memcpy()
> >> doesn't play nice with mqd being volatile:
> >>
> >> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:=
 In function 'amdgpu_debugfs_mqd_read':
> >> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:=
550:22: warning: passing argument 1 of '__builtin_dynamic_object_size' disc=
ards 'volatil' qualifier from pointer target type [-Wdiscarded-qualifiers]
> >>    550 |         memcpy(kbuf, mqd, ring->mqd_size);
> >>
> >> So I would propose leaving the patch as-is. Shashank, does that sound
> >> good to you?
> > Friendly ping :)
> >
> > Shashank, is your Reviewed-by still good for this patch, given the
> > above?
>
> Ah, sorry I missed this due to some parallel work, and just realized the
> memcpy/volatile limitation.
>
> I also feel the need of protecting MQD read under a lock to avoid
> parallel change in MQD while we do byte-by-byte copy, but I will add
> that in my to-do list.
>
> Please feel free to use my R-b.

Shashank, if the patch looks good, can you pick it up and apply it?

Alex


>
> - Shashank
>
> > Thanks
