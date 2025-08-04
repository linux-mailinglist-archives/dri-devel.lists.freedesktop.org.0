Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F862B1A9C9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 21:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730A810E44D;
	Mon,  4 Aug 2025 19:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VMrwfwkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296AC10E44D;
 Mon,  4 Aug 2025 19:49:57 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so689427566b.1; 
 Mon, 04 Aug 2025 12:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754336995; x=1754941795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNzexns6pcPBUTEkIeqnIu/h9x9Gke1nRAkCyAK2Td4=;
 b=VMrwfwkUCN27DXQZOCzZ/UYBPO9XZriylnsXGa9VC14LHzvK/AMwABYQiP6BIK7WJn
 RvbjjW+70V44zARn4Wir0lXOx0dGlpQY0CBGHHQt67Ba2DNHc0+Q/lR37c/GPV6XzoKi
 q5t8Ms2iy9X319g/mD//gHQVDFQAFJYeqE77DXPVAhQgKIc5ico7I1cg5L9PXTUMxhud
 662H64uR1Fcp9JSGuP3Kr1eDNWqHdocZ0y2fb8+OKnV44mir9BFAryKxwOou9lBbBt15
 yKV55SFBVljVykucOpW3IyncY5xexdeNnapobIOS/LPm8acbh9Gl3PiOJwnjZl/Z8Q+/
 qCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754336995; x=1754941795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNzexns6pcPBUTEkIeqnIu/h9x9Gke1nRAkCyAK2Td4=;
 b=mo3C6Y3oPKfYwzlAUlkN+aEmEdqlw6xAm72y1wVwzEr9UBePd6EooCBvwZSTdGdOb6
 keKKRl53L3So30XZj2TKmQkx0hkRIUTTU0t539eUsy/9Yi8ftAPOgNwXFQWnmmbwf4/K
 vDkv6Cht6c5HjYDxFg9FSYrpOsBp3/pa5rTu9Nho5gSWxOdi9/PWDVi3EOuPaW70xbvw
 rKbmF5O9JOLEcK55mi+K4AdJwRLUpbv8bTF4aV3/UWEZnjsmThyx9Qeow2WY3gW5BSL1
 cVhDwQRXygthz5/k2z4YUSj9el7qzc4w3IFPCuAND6UIMVCF2Yt8EemB+h7vK58z5dTo
 uYUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAn/ohrYqANqExA2OnfHJaCPDH7z4w3LJTwacctJzXsAcvhrq9zFxqfaCOlXcC48nV5KXTZDBV6gPy@lists.freedesktop.org,
 AJvYcCXzPBsCP3uoSqHKtuZ7aMqfCJCERNxUZ8nCI06NFGiIg+sgBQz4ItRozbHx/g8wJ6eZWHOH8TlznmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcKyJpm6WdKf3j6FAcBn372Hg7q9FQWWmQJ5Fi7fVIm7r2KGfR
 REcmWST0K241kl4XpV27GO2j/bAJO0ftdfpv2JlwwpS1LGCmmrtvD/QsJ0HoXcyF1WFfPsmUqmj
 76b9rPs0O9YEDgJFLGGrsm6L/7q6byxU=
X-Gm-Gg: ASbGnct/YJJw4yYSBMILcvy+kRh8sXGorWd8gigLw+9/DtY71j3E3xdQZrJ8bfhcCHK
 V/hyqtoVBGiz9hxqpbbe/UKbMyFXjApeiO2IQ2je84PEotItqLl9Os31E6fbNfA5tSF06lPEvzK
 qi3qqypmmONpEMWEDcRFzdLQ/4K5I/vBOtz7/DdtFh9TBJw4Ke3YOsf9P61r2lzyhvlehl4+Ccs
 39a//Q=
X-Google-Smtp-Source: AGHT+IGcMq3bxCdaYN7JTYB4ZRdZj5ChB4GQUWGwwN1A04vvH51/5tRA4ycCUTXjUODp6yMy5vQnnC3OMmCbWz5atD4=
X-Received: by 2002:a17:907:9407:b0:ae0:cc5f:88ef with SMTP id
 a640c23a62f3a-af9401af514mr1075474166b.32.1754336995289; Mon, 04 Aug 2025
 12:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
 <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
In-Reply-To: <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Mon, 4 Aug 2025 22:49:43 +0300
X-Gm-Features: Ac12FXwoncyyo3lMGdVFGmeOSercSw0CMzqTN4N7YKEyC89vLmt21SqpqVGopCE
Message-ID: <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
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

Can you please advise on how to bisect further?

andy@lenovo:~/linux-stable$ git bisect bad
The merge base 0dd3ee31125508cd67f7e7172247f05b7fd1753a is bad.
This means the bug has been fixed between
0dd3ee31125508cd67f7e7172247f05b7fd1753a and
[6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1].

andy@DESKTOP-0R165CF:~/linux-stable$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
# status: waiting for bad commit, 1 good commit known
# bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
# bad: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a

andy@lenovo:~/linux-stable$ git status
HEAD detached at 0dd3ee311255
You are currently bisecting, started from branch '6fc5460ed8dd'.
(use "git bisect reset" to get back to the original branch)

It is not moving further.

=D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 17:50=
 Paolo Bonzini <pbonzini@redhat.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Aug 4, 2025 at 12:57=E2=80=AFPM Andy Mindful <andy.mindful@gmail.=
com> wrote:
> > Double-checked bisect, looks like I've have found broken commit:
> >
> > > > git bisect bad
> > > > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > > > This means the bug has been fixed between
> > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > > > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > > > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > > > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
>
> This skip is messing up the results:
>
> # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
>
> and there are still 3858 commits in
> ba5afb9a84df2e6b26a1b6389b98849cd16ea757..{1b1934dbbdcf9aa2d507932ff488ce=
c47999cf3f,61da593f4458f25c59f65cfd9ba1bda570db5db7,ba5afb9a84df2e6b26a1b63=
89b98849cd16ea757}
>
> Any chance you can get 6.7 to work and restrict the range further?
>
> Thanks,
>
> Paolo
>
