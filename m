Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4967EE632
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 18:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A7610E293;
	Thu, 16 Nov 2023 17:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD06B10E293
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 17:54:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so1541754e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700157270; x=1700762070;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/RDZxZXQw38fLxfRFujJZywNkog1jvLPlmbJYwotb9A=;
 b=R4m3RsHrLsg5pY9cy61U14lTxl/f7qcjrJP2unJymgmS6Pi88yGqHg69JnQHCOYgxG
 aPsqzNIj6KM6lT8wCeFa+8tMl/3fPDfd7ZtvKb4y8bioxM192q4hqQFkJeIdMFYelMre
 Z92XaoCUe12F6d8v0/qdUKbZdaDhx3M2KZ/Eo1XvPIlRDoBEpVwvsDEozegyfW6Ltydj
 47amH547NezzX5J5Nji/4tVcJRSV3pJlTYqgNJJ8QS5O27Vzkd6QEFYr/8gNmmUAWjLX
 hdnJJkShS0zjo0H11h79X2l2/gcWYz9309xZtxOmDtlBbs/X6VjqieqrNVFxwrX/XxJj
 m3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700157270; x=1700762070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/RDZxZXQw38fLxfRFujJZywNkog1jvLPlmbJYwotb9A=;
 b=Ton95UbytHhXainqnNRpwqhZrKL97yZ9eIa3prJq9fE8R9tmZ1/Ji+MLVxj7SVTXNr
 ogVAjilhsDnCSHbO+iTE3HJCpoG7BkjBvE/nazUJ2ke8zC2Q8S59hUT/Ycldsc0kI5Nx
 OWc/mQDMCenwTzeSaiaXL0YPFPkjMDuCpYRiXgHFttuat/r0jAjsbi2GdxstLv4me2Wh
 cLU8lc5VKV1wT12tYP2LP993E1wh8TKGWoHmneOp0+fo0zUNUSbABvs0MJiNNmlV35MS
 A5PrwXa0OxOZWCkvrEzrJfTrfLVcnNQee8W6bFwW3jVrhgMwhGJyMi42pv692bwyl8vS
 v5cg==
X-Gm-Message-State: AOJu0YwML2JVJxikKtlewWue6ZHBlQQUy3P93fZVfV5IdSuOZdFXkZFl
 sjzM04fS68IYK34oXVRSSoyhtGROda5UVKRuMzirx8XNkQg46NbBBxAWEQ==
X-Google-Smtp-Source: AGHT+IFz7zh+0ZdIqnz5ejz7YNssiuPxBYm4eGI90YO5NwzWRK1clM3tcLQ26ai2V0O4NIFX72Kok4ogLtDONoifRJg=
X-Received: by 2002:a05:6512:1243:b0:507:a001:792e with SMTP id
 fb3-20020a056512124300b00507a001792emr2974680lfb.46.1700157269663; Thu, 16
 Nov 2023 09:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20231114233859.274189-1-appsforartists@google.com>
 <70f12e96-0fcc-4954-8507-27cf5e15a3b2@redhat.com>
 <CAAL3-=9YYQBV-T-KhHdYrtGHH1RC29uzTuQ98roAY9GwrNrwmg@mail.gmail.com>
 <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
 <4570d94e-b446-4fd1-a24a-db11a87846c4@redhat.com>
 <CAAL3-=_p4waxpf9a6B0Yvno0dnakZ6f81-Kfjxwbw4jA_CrcSw@mail.gmail.com>
 <02ea9279-7bdc-43ca-bd7d-898dee14884e@redhat.com>
In-Reply-To: <02ea9279-7bdc-43ca-bd7d-898dee14884e@redhat.com>
From: Brenton Simpson <appsforartists@google.com>
Date: Thu, 16 Nov 2023 09:54:18 -0800
Message-ID: <CAAL3-=_y7T1ErkEj_QjDWc7svimA1tCSH=xZ0LPsMCWoi40s3g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Lenovo Legion Go
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Patrick Thompson <ptf@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jared Baldridge <jrb@expunge.us>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oh believe me, I tried.  I spent like 2 hours fighting with the CLI to
send it.  There are restrictions on what addresses it can send from
that don't line up with the identity I use for git.  Our corp setup
can be=E2=80=A6complicated.

My workflow for patching the kernel is actually a bit weird: I use the
GitHub web editor to make the patches, and then test them with Nix's
build system, which pulls them by URL.  Since it's a gaming console,
it's easier to use a real computer to write the patches, and then test
them by instigating a build over SSH.

Now that I know the format the email is supposed to take, it might be
easier for me to paste GitHub's .patch body into a plain text email
and add the Signed Off tag by hand.

I just CCed you on a patch created that way.  Does that look okay to
you (at least from a formatting point-of-view).

Thanks again for your patience and assistance.  Sorry for my weird setup.


  .matches =3D {
   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
