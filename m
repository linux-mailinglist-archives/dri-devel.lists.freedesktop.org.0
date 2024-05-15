Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2318C6F4D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 01:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F1310E118;
	Wed, 15 May 2024 23:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CWR8f1yK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAD210E118
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 23:50:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51f72a29f13so168762e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 16:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715817021; x=1716421821; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M2DfTJMriRJWzY3I1fpbPSjPaLFHGawiOuysTImuRHI=;
 b=CWR8f1yK520FnQrCtGjWnLBwYgD0ZaFHl70Ncx4SenYPv8gmvdlYq35OzzgURESvom
 eHnTxP1hLyG8swmAsP6MCY8ptd+m/ExpJjDVAIKyPLrQOw67F908RBAfxe/Y7Au2lpg/
 3A5IfWPI8ouzOM3fPe9moMpGKe7OQqUDaL9yNu8mjlfp2KplhZoNM8c1mZTRlgy76MQH
 0zSVsUaZ6z+laJGOTGNF1hxzNPODEUj5z4+7mnMou+SB9mvALxAYKb7erXRAQmpV9rZA
 wjloTAisjTO+unPAY0pk8ZDuXGwT5fNWIU/ZxXOkOse47yIUl5Zv36uLrhV6GKG8U9eq
 jZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715817021; x=1716421821;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2DfTJMriRJWzY3I1fpbPSjPaLFHGawiOuysTImuRHI=;
 b=Hp3cWETMk/TXQSTRb5wy1u/eVIzYlNGtxVkreauIyLH6+/I9InGpzMHmnB0O1hcKA2
 3CBVdMfUP2uXVM66OKfdT8ilPvm/bdri8yZSXloJWm5QdTo+Zp4xzlR8CPw+viKdW2mi
 AIXZemBJ7zgRbP7AmzSvUhzdHVDMtFUy9wm6CekTJ2os8IotheV5aeJP6v1FGLW09xBY
 2w9ifgYnpuBWUMY6fNa4YZN/u7qRdFl/5yHEBECB/Isot5JqRXxK6xlAbA2S3I/qP5Fg
 VTB4OZRxavSHOmjdMiUPXAC3/n8cfXhzX+9XfYT8Im/0JMcVJqZQHCvj8Th1VXGifGbz
 Sz9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgbtI34ZIcujIqPFi6mrmQG92i6XqZHFuUTBJqPaSt/oObGLxxAi6zps5sH3J37svZJKRtJgwIMSWxllGsEVKIR6Bso/CeeuyBWT6B9kW8
X-Gm-Message-State: AOJu0YwMa6EhzuWVP1t/Q8r5Q6NFkoXcN+j8ddg1B7nTK++7vC+RtQx1
 T+q+wGsh30V4AZeP0nxYWDJwJMjRE70feQU8tgjfVFWxiB6SHlYkrhm2teL69jlp+PtNiZguOxq
 JEVNn+ZYhn1N7b2xzR+3vAGg37HM=
X-Google-Smtp-Source: AGHT+IEoFONe5600wbwpUr+t64TDVQ+GOCxXQFXKsCmO7k2TGzH3IpwLNHqr9mmoL9/Fry8O0asu6LZWp2AxedCnnNo=
X-Received: by 2002:a05:6512:234a:b0:523:b261:3dde with SMTP id
 2adb3069b0e04-523b2613eb1mr654437e87.41.1715817021013; Wed, 15 May 2024
 16:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
 <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
 <CAHk-=wgWJCcJRLBZ1xoAATFyvp6YKN+qzrePhxQbN1SFrno7pQ@mail.gmail.com>
 <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
In-Reply-To: <CAHk-=wjm4BcsMrvgXocATBVvZ7N6LAjSvLTzTXWg9EFzyip_cA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 May 2024 09:50:09 +1000
Message-ID: <CAPM=9twOiwquA7Zi_mr1vKFV4RQqhnbHv+c9Xz6BadF3tGEegw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000000a2d5c061886c829"
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

--0000000000000a2d5c061886c829
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 May 2024 at 06:29, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 15 May 2024 at 13:24, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I have to revert both
> >
> >   a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> >   e362b7c8f8c7 ("drm/amdgpu: Modify the contiguous flags behaviour")
> >
> > to make things build cleanly. Next step: see if it boots and fixes the
> > problem for me.
>
> Well, perhaps not surprisingly, the WARN_ON() no longer triggers with
> this, and everything looks fine.
>
> Let's see if the machine ends up being stable now. It took several
> hours for the "scary messages" state to turn into the "hung machine"
> state, so they *could* have been independent issues, but it seems a
> bit unlikely.

I think that should be fine to do for now.

I think it is also fine to do like I've attached, but I'm not sure if
I'd take that chance.

Two questions for Arunpravin (and Alex):

Is this fix correct, and can we get a good explanation of it?

Where did this error sneak in? Is the problem in the amdgpu tree, or
was it a drm-next only problem? If so perhaps we need to discuss
moving amdgpu more into drm-tip to catch this sort of problem.

Dave.

--0000000000000a2d5c061886c829
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-buddy-convert-WARN_ON-to-an-if-continue.patch"
Content-Disposition: attachment; 
	filename="0001-drm-buddy-convert-WARN_ON-to-an-if-continue.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lw8h2ndb0>
X-Attachment-Id: f_lw8h2ndb0

RnJvbSAwODViODkyNzhmMjk2YzQwZTg2ZjVkMWUxYmNjMTAxN2MzOWY0MDAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpEYXRl
OiBUaHUsIDE2IE1heSAyMDI0IDA5OjQ2OjM3ICsxMDAwClN1YmplY3Q6IFtQQVRDSF0gZHJtL2J1
ZGR5OiBjb252ZXJ0IFdBUk5fT04gdG8gYW4gaWYgKyBjb250aW51ZQoKVGhpcyBXQVJOX09OIHRy
aWdnZXJzIGEgbG90LCBidXQgSSBkb24ndCB0aGluayB0aGUgX19mb3JjZV9tZXJnZQpwYXRoIGFs
d2F5cyBoYXMgdG8gc3VjY2VlZCwgc28ganVzdCByZXR1cm4gYSBmYWlsdXJlIGhlcmUgaW5zdGVh
ZApvZiB3YXJuIG9uIHRvIGxldCBvdGhlciBwYXRocyBoYW5kbGUgdGhlIGFsbG9jYXRpb24uCgoo
Tm90IDEwMCUgc3VyZSBvbiB0aGlzIHBhdGNoIC0gYWlybGllZCkuCi0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9idWRkeS5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMKaW5kZXggMjg0ZWJhZTcxY2M0Li42Yjkw
ZWM2ZWVmYTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVkZHkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMKQEAgLTE5NSw4ICsxOTUsOSBAQCBzdGF0aWMgaW50
IF9fZm9yY2VfbWVyZ2Uoc3RydWN0IGRybV9idWRkeSAqbW0sCiAJCQlpZiAoIWRybV9idWRkeV9i
bG9ja19pc19mcmVlKGJ1ZGR5KSkKIAkJCQljb250aW51ZTsKIAotCQkJV0FSTl9PTihkcm1fYnVk
ZHlfYmxvY2tfaXNfY2xlYXIoYmxvY2spID09Ci0JCQkJZHJtX2J1ZGR5X2Jsb2NrX2lzX2NsZWFy
KGJ1ZGR5KSk7CisJCQlpZiAoZHJtX2J1ZGR5X2Jsb2NrX2lzX2NsZWFyKGJsb2NrKSAhPQorCQkJ
ICAgIGRybV9idWRkeV9ibG9ja19pc19jbGVhcihidWRkeSkpCisJCQkJY29udGludWU7CiAKIAkJ
CS8qCiAJCQkgKiBJZiB0aGUgcHJldiBibG9jayBpcyBzYW1lIGFzIGJ1ZGR5LCBkb24ndCBhY2Nl
c3MgdGhlCi0tIAoyLjQ0LjAKCg==
--0000000000000a2d5c061886c829--
