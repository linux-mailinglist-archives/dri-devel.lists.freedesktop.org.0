Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C6B1940D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 14:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20FA10E12B;
	Sun,  3 Aug 2025 12:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="la9SpDqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60DF10E12B;
 Sun,  3 Aug 2025 12:45:19 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-af8fd1b80e5so578724666b.2; 
 Sun, 03 Aug 2025 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754225118; x=1754829918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxXOv0H77qu3boXS8S20sjf3H+BGpeAjIG2LP7StaE4=;
 b=la9SpDqk8KdVzkRyQoKpSrWy0c2Ya4eWglFIo+R05DAfTwskJ25gl+/ghypt0lHZu2
 o01RrbpaHizlq/cDe/yovcERNmWyo529fy81dNe/5GgPqjVyhv3KIqy13wgJjuKxlvXi
 i/M9r+UG426HV9fLdc4tWN4CokBKuTBqP1a5Re5MeLimUZPK62/4NhGQmOAo51OGRxz6
 qdnABCNvZZNOAxRggcKBA4mqNGpmuC9ia8Is6LUzgwsYXe8m5h7G5emO3u047l9NWC3i
 AjWGSRr6/KyWyW3Xo6hZX9HvV3KZGbd8cL0H6TuWgOSdS4JJNiGTfT+NeDOK7Azro45v
 UzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754225118; x=1754829918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxXOv0H77qu3boXS8S20sjf3H+BGpeAjIG2LP7StaE4=;
 b=KxP/mnPw2UIXMFJ5wSieUY96VLy1vT6krKVnt9iVDUV0ZyANMhkr9ZcsXjB6hoobP7
 YJ2nZHFyME0USbq6q1ipRlUqPIrnZU1kzHJesHabtfOvKjuB9rJTb38Sgw12myH/T8kM
 oG5/hpxulik4MdqXKYTrWbeMcs5+MUTBKcAbPOrwCOSmF8WzT+ANZcV1dFqO+lSLgwDG
 YWRS7eR4QxiPjipvRHMmq6QmUUoUTt1RlpbIawRj+DBBAe9pU80QD6HAhvezHn8cEjGj
 8ZFIyF9CqvfA+YJ0PaKEmO7bQImoupWVffBPEDDlYAcMEED8uysmo63S37g3s9HE1ka0
 BPNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0KB4Ws8fXoxShx4/akK2IcJo/lC4sn5jLNANFnkrJqHXdumlfC9VlLkCpEyJVTV9Aif9YNyrledc9@lists.freedesktop.org,
 AJvYcCUha1aaPbsYzlWKi0hjNZhlrPpLcS1FvOPKoDURtjnQ5Av23QO1WEoAyXrJwgFGGsGxNxfurX4w78M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgUhBghSlXmjYuZzhN643iYjJld5kRLnGTPXezGkCGycG9r0YC
 0QJzYwejNCHnek3VwjvNfFX5ONO7714iBA53ExxZueefM38AWEE1wXlvrn+eFDUvEjRtxqdr0qd
 D1RlUO5N/cbntEdoIoDCzDjPhHPlR7zE=
X-Gm-Gg: ASbGncuuJtcH0jwcSW4QzNriSej2So/JnFtfxqZHuCa7qltMfGxJEajrwmpZnuqbUMx
 C1CRO5UWsgxNTwN/GwRyRo8sMg1A0omJotD9Jd3jg9EfOEAc8Reo1iEyPAiJ5rFRu5lghFYB/Bg
 MmPJCX6IUsJVN++xrOt/811TxewvSgvJX6MYA5+gw4hAIe/tYIeqVK0htOjJbSBwE09bILQOZNY
 fsdvMo=
X-Google-Smtp-Source: AGHT+IHFQr61biS993WpaTiLN314ukC/GGuYrmWFHzReiBI+xBUUZ2E1nmjUhmzhYsuLobiRAM+1bP/mpJx6eUe4McA=
X-Received: by 2002:a17:907:724a:b0:ae0:aa0d:7bfa with SMTP id
 a640c23a62f3a-af9402301f3mr558310866b.50.1754225117967; Sun, 03 Aug 2025
 05:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
In-Reply-To: <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Sun, 3 Aug 2025 15:45:06 +0300
X-Gm-Features: Ac12FXwQ1gQW4qwRV_K-3Velp0hCrjgNlIh5_C2All-wPbXiQ1zvu-N5hZpFRGU
Message-ID: <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 rafael@kernel.org, ville.syrjala@linux.intel.com, tglx@linutronix.de
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

Here what I have from bisecting, please let me know if it makes things
clearer or not.

git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
# status: waiting for bad commit, 1 good commit known
# bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
# skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
# good: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework
listmount() implementation
git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
# good: [61da593f4458f25c59f65cfd9ba1bda570db5db7] Merge tag
'media/v6.8-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
# bad: [e38f734add21d75d76dbcf7b214f4823131c1bae] Merge tag
'staging-6.8-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
# bad: [5d197e97fb106c09d3d013be341e5961fd70ec8a] Merge tag
'hsi-for-6.8' of
git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
# good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
'docs-6.8-2' of git://git.lwn.net/linux
git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
# good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
'docs-6.8-2' of git://git.lwn.net/linux
git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
# bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
# bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
missing "depends on KVM"
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
# bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
missing "depends on KVM"
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
# bad: [861deac3b092f37b2c5e6871732f3e11486f7082] Linux 6.7-rc7
git bisect bad 861deac3b092f37b2c5e6871732f3e11486f7082

# being on a 861deac3b092
git bisect bad
The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
This means the bug has been fixed between
ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
[1b1934dbbdcf9aa2d507932ff488cec47999cf3f
61da593f4458f25c59f65cfd9ba1bda570db5db7
6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
ba5afb9a84df2e6b26a1b6389b98849cd16ea757].

Thanks.

=D0=B2=D1=82, 29 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:20 Jani=
 Nikula <jani.nikula@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> > Please let me know if any further information or testing is required.
>
> Likely the quickest way to find the root cause is to bisect the issue.
>
>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel
