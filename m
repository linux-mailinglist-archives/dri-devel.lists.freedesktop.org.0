Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD180B1C251
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 10:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8B10E2F0;
	Wed,  6 Aug 2025 08:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OByNCURg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF45010E2F0;
 Wed,  6 Aug 2025 08:40:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-af93c3bac8fso743911566b.2; 
 Wed, 06 Aug 2025 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754469619; x=1755074419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQS17Gx8nIJNb+Eu5z6Nn4tpeVvUU+ssz+FqyUsLAP4=;
 b=OByNCURgdw2rQqqRxBEsuiJVpPjIkGv2XXyTjHGc1XqRh+pkU3VUeMR8LfKCafjcSV
 gk/GkIHtwpTBxTdhl+ecypreGgw4aXXiTRfGS8ELeXKuC1uyybJbJCN3d2eRLr+mwCf7
 /3URF5WPMo57lUd7i4GcR5nIkMbvcHQWcXTxHNLHYevO0ICEaT1OMmEClTx0JcFsMLen
 Cu0f5Teawc3YgiKu4l0Rs71evQjYbVpcSeAwzbLfe78btNUsCiDX77i9oY0ExMkbWYk+
 MSeyqewGgxOnphHGFRuHjZn8kozoJ0d0yWtWMUto1GfN6EJXPOwngrNJbsK2EgCptylw
 duxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754469619; x=1755074419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQS17Gx8nIJNb+Eu5z6Nn4tpeVvUU+ssz+FqyUsLAP4=;
 b=BlcJ0XfWCfQSjtjYdFpGBiKzMM+4HZcT3Hno/mzFf/r4lhQOVPEfsnLK/Ox9g4/bzj
 Ry5mvWEBgJlNo/6SASBFe9bupFj7zduqje7+PO5bFmtYAdAYWGd9lfybgBxGSw5rm9CX
 0tOokMbFvBwM0ANEPIBrIRcfr71uZmHd2+ijxBAzCiy5snFUP/FALVzQCU+ShRWzwGdy
 RwxoogWUSkO9JK2fErymueYIoqBu5+cidITrruFYG0/fm8BJjyJpZPCa0ki6RfCC8byp
 MBJa1epbRTIM8yCKrq9A8hgImk9RzyMNjOMLCAhDXqY9B3+AlXEFtN8ZOqqFE1NmYkM3
 ZDNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBdjLqflaYjOgL0Mym7vCRhtFIlERpeRKzpc39uAjK1HM/44xclbTtWBULf9QDW4JNQ6xKVjRgYc0=@lists.freedesktop.org,
 AJvYcCXrZ8sXXr4KXjElTei7NGZVA5HiHW9Q9+XN7ycb5KANhpI6zX9p3+vEGBYyoiEvNfdZsQvALJ8cTi2C@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxztQCymeDxKUN44O7Wse+tpWc+iiaBju3A7sP/CMGOxu2+hA8p
 1lT9V6cVXj5bt4Abpan6kJUcnajn+W69iei0w0SiMDj5lbyxUMjN8Bph3eODfW4E1gUwsQq8iQt
 nUB/nkphLfhH6I2GNGIteqr/3BL8YwdM=
X-Gm-Gg: ASbGncsu6xulKE7KSYBCc/eRVsyCp6sM0xA0jUE6bUUb3io9uygvy9OhEZlPNMYR8fe
 nIYiS985p1I0It9aEVdZ7BmvvA9GijQ9Wpmvyd4LI8uzb3wsVDpPF7qRw3dX1owjuulJpplJQSz
 qNLcEiz/eMMcycgyA6kWrJ98Yuq9FDXm3n6BRnD6bXGDWuzK80OHp1Np36v98NdotYnYdsFw9I4
 ngp9/9E
X-Google-Smtp-Source: AGHT+IHfJ9svIzWODa8rgbvEIq584AUL0oyBljvd+PygocMjYZHjM2aXI+fyfYg0JbEiFEnyH4qTbculH1RSbuT6U5U=
X-Received: by 2002:a17:907:980f:b0:aec:6600:dbe3 with SMTP id
 a640c23a62f3a-af992bc3acfmr138428466b.56.1754469619115; Wed, 06 Aug 2025
 01:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
 <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
 <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
In-Reply-To: <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Wed, 6 Aug 2025 11:40:07 +0300
X-Gm-Features: Ac12FXxTKMWG1pZklTF0P1qlwOqSdhMr6Q33eeVUrsVUud3FdPfuQWhVKcJIN3Y
Message-ID: <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, rafael@kernel.org, ville.syrjala@linux.intel.com, 
 tglx@linutronix.de, Christian Brauner <brauner@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
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

Hello,

Can somebody advise how to properly bisect issues in linux-stable
repository between v6.7.11 to v6.8-rc1 tags?

I tried two options:

1. No skip

git checkout v6.7.11
git bisect start
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a

Leads to:
The merge base 0dd3ee31125508cd67f7e7172247f05b7fd1753a is bad.
This means the bug has been fixed between
0dd3ee31125508cd67f7e7172247f05b7fd1753a and
[6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1].

What should be done next?

2. Skip
git checkout v6.7.11
git bisect start
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a
git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
git bisect bad 1c3c87d720cbd1ff86dc1bfc6df8ee9adce5879b
git bisect good 8d99e347c097ab3f9fb93d0f88dddf20051d7c88
git bisect bad 6c370dc65374db5afbc5c6c64c662f922a2555ad
git bisect good 43f623f350ce1c46c53b6b77f4dbe741af8c44f3
git bisect good 8a89efd43423cb3005c5e641e846184e292c1465
git bisect good 5d74316466f4aabdd2ee1e33b45e4933c9bc3ea1

Leads to:

# first bad commit: [6c370dc65374db5afbc5c6c64c662f922a2555ad] Merge
branch 'kvm-guestmemfd' into HEAD

Which is incorrect as per Paolo Bonzini comment.

I'd like to test this thing, because hibernation is quite crucial in a
multi-boot environment and may save a lot of time while working with
different systems.

Thank you in advance.

=D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 22:49=
 Andy Mindful <andy.mindful@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Can you please advise on how to bisect further?
>
> andy@lenovo:~/linux-stable$ git bisect bad
> The merge base 0dd3ee31125508cd67f7e7172247f05b7fd1753a is bad.
> This means the bug has been fixed between
> 0dd3ee31125508cd67f7e7172247f05b7fd1753a and
> [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1].
>
> andy@DESKTOP-0R165CF:~/linux-stable$ git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
> git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> # status: waiting for bad commit, 1 good commit known
> # bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
> git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
> # bad: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a
>
> andy@lenovo:~/linux-stable$ git status
> HEAD detached at 0dd3ee311255
> You are currently bisecting, started from branch '6fc5460ed8dd'.
> (use "git bisect reset" to get back to the original branch)
>
> It is not moving further.
>
> =D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 17:=
50 Paolo Bonzini <pbonzini@redhat.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Mon, Aug 4, 2025 at 12:57=E2=80=AFPM Andy Mindful <andy.mindful@gmai=
l.com> wrote:
> > > Double-checked bisect, looks like I've have found broken commit:
> > >
> > > > > git bisect bad
> > > > > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > > > > This means the bug has been fixed between
> > > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > > > > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > > > > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > > > > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
> >
> > This skip is messing up the results:
> >
> > # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> > git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> >
> > and there are still 3858 commits in
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757..{1b1934dbbdcf9aa2d507932ff488=
cec47999cf3f,61da593f4458f25c59f65cfd9ba1bda570db5db7,ba5afb9a84df2e6b26a1b=
6389b98849cd16ea757}
> >
> > Any chance you can get 6.7 to work and restrict the range further?
> >
> > Thanks,
> >
> > Paolo
> >
