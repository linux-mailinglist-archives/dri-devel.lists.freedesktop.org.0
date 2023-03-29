Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE4E6CF250
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 20:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1288910EBCA;
	Wed, 29 Mar 2023 18:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A088E10EBCA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 18:40:36 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id
 b1-20020a63d301000000b0050726979a86so4562415pgg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 11:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680115236;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=FZmyMVuYVU9o4ySSsDMWbfKCn4VbLsOEW12VyraFPoQ=;
 b=cdAY9KJ2xBNBOjB543rW8Ny1xCNNj02SVfffBErQYIFvsJkn30RZpvZENxBjGs4jye
 iabOF6JrNBL2cmuDt2wFYf7nQx1EIh0A1yDwrqsVNuIE3gzjQ8QrLV3iAVAAl23YOJKI
 YDhAw9W3YSjC0qi3v5r7QUqyGvIJF+BcDGwJijHCBEmfTUIOHLE4s+D7aph8vZPL+C50
 ac7Ykp10SaZt5Kqld9gBp8OiEPrxpbCWQjTRuKqZ4eoZDHLco+m/UOn4l3g/io2jUWi4
 oq9wflWdrXXcb1IoCfUNEEHlqJ9Tz6chAmGqyAZLKDL9zlBG0foXhjHBEheRyKiwCjl5
 exZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680115236;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FZmyMVuYVU9o4ySSsDMWbfKCn4VbLsOEW12VyraFPoQ=;
 b=hFm8xzRMDQ4zTDFZeTO7dADNzbt12H8Z7vMW9DZW0PonUoNg9Pf08veA9sU7GRwrhg
 o7BWmzu2kpmcJ35d7VJjGkT9WkbX0sTog8HR5mWDnsgrJaGoBZQqLqAMo3b6mEhAUEMz
 3WHS463LZuiOnmKhuiyx/7heLKZr8VLIlosPSL/Qk/S7wJuwqZGX58X5F7aLHgykR37E
 aKcf5jCnOCPTHaWamMYqRJRCQrViI83EuGvQPs4jHmlRg61jQsqutYZXr2FrX0S5S9/4
 +sYTKzJ/Z25t+CtCPOJ4TtJbjWaNOG9gGHXPh+USpT96fvCCr+ripjm59j+IW5HDnFE8
 oeaQ==
X-Gm-Message-State: AAQBX9d4ANDOwtbhrwd4gkExhJiwAmKhBmmHTri3Hh4JpJBuuyq+YZjM
 kWgED0hw3vyy82+Gt7tzKukd85yq4OU=
X-Google-Smtp-Source: AKy350YSb7EN8QABUxaxIub3wSULx5xoKi2HS51nka6skaJOxrFPLgVDWPosD2pJjff/UxdyeDrBLlK6V+c=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:c095:b0:234:acfd:c8da with SMTP id
 o21-20020a17090ac09500b00234acfdc8damr6341944pjs.2.1680115236189; Wed, 29 Mar
 2023 11:40:36 -0700 (PDT)
Date: Wed, 29 Mar 2023 11:40:34 -0700
In-Reply-To: <2f4fa309-8ea8-a68c-4f35-b527d7f17e2d@gmail.com>
Mime-Version: 1.0
References: <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
 <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
 <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
 <ZCRzzi7bmDyOra4X@google.com>
 <980e7a13-ea49-70de-700c-597ad7a4e103@gmail.com> <ZCR33FvKsvEmDLRQ@google.com>
 <2f4fa309-8ea8-a68c-4f35-b527d7f17e2d@gmail.com>
Message-ID: <ZCSGIhcbuDRUiiX6@google.com>
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
From: Sean Christopherson <seanjc@google.com>
To: "Christian =?iso-8859-1?Q?K=F6nig?=" <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, npiggin@gmail.com,
 David Stevens <stevensd@chromium.org>, dri-devel@lists.freedesktop.org,
 Pierre-eric.Pelloux-prayer@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023, Christian K=EF=BF=BDnig wrote:
> Am 29.03.23 um 19:39 schrieb Sean Christopherson:
> > On Wed, Mar 29, 2023, Christian K=EF=BF=BDnig wrote:
> > > Am 29.03.23 um 19:22 schrieb Sean Christopherson:
> > > > +David
> > > >=20
> > > > On Wed, Mar 29, 2023, Paolo Bonzini wrote:
> > > > > On 3/29/23 18:43, Christian K=EF=BF=BDnig wrote:
> > > > > > > 3) other uses of kmap() must switch to MMU-notifier protectio=
n.
> > > > > > I would rather suggest to return the page additionally to the p=
fn from
> > > > > > hva_to_pfn() when the function was able to grab a reference to =
it.
> > > > > >=20
> > > > > > When the page is then not available you can't call kmap() on th=
at either.
> > > > > >=20
> > > > > > > If the DRM people are okay with SetPageReserved() as a tempor=
ary
> > > > > > > hack, we can change or remove the WARN in kvm_is_zone_device_=
page(),
> > > > > > > since that is what you are referring to in the commit message=
.
> > > > > > Adding Daniel for additional comments on this, but essentially =
we have
> > > > > > changed quite some infrastructure to make sure that everybody u=
ses
> > > > > > VM_PFNMAP to prevent stuff like this from happening.
> > > > > >=20
> > > > > > I would really prefer a proper solution in KVM instead.
> > > > > Hmm... Now that I think about it that would be
> > > > >=20
> > > > > https://lore.kernel.org/kvm/Yc4H+dGfK83BaGpC@google.com/t/
> > > > >=20
> > > > > Time to resurrect that work.
> > > > Ya.  I had previously asked David to first eliminated the usage tha=
t isn't
> > > > protected by mmu_notifiers, but after seeing the resulting complexi=
ty, I had a
> > > > change of heart[2].  Can you weigh in on the latter thread, specifi=
cally my
> > > > proposal of using a module param to let the admin opt-in to "unsafe=
" kmap usage.
> > > I don't think that this is something an admin should be able to decid=
e.
> > Why not?  Assuming the admin has CAP_SYS_ADMIN, they can reboot the hos=
t in a
> > myriad of ways.  The idea with the KVM module param is to allow curated=
 setups
> > where the userspace VMM is trusted to a large extent, e.g. AWS' Nitro, =
to opt-in
> > to the unsafe behavior.  I.e. by enabling the flag, the admin is acknow=
ledging
> > that bad things can happen if untrusted/compromised userspace gets ahol=
d of
> > /dev/kvm.
>=20
> Well exactly that's the point, you don't need untrusted/compromised
> userspace the system could just go spontaneously into nirvana during norm=
al
> operation.

The proposal is that the module param is off by default, and the expectatio=
n is
that it would be turned on only by very specific setups.  I would not objec=
t to
making it even more difficult to enable, burying it behind a Kconfig, but I=
MO
that is unnecessary.

> This would result in very very hard to debug problems since the issues on=
ly
> happen rather rarely.
>=20
> On the other hand why do you need the kmap() in the first place?

The Nitro setup manages guest memory in userspace, and hides that memory fr=
om
the kernel, e.g. to avoid struct page overhead..  To enable KVM to access g=
uest
memory in select flows, e.g. for paravirtualization, without taking on too =
much
complexity, KVM supports kmap() of that memory.

For some uses, e.g. nested virtualization, switching to uaccess might be fe=
asible,
but the paravirt stuff, especially Xen support, would likely be insanely co=
mplex
to do without kmap().
