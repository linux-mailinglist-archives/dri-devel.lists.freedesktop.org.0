Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3AFB1A53F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA20410E59A;
	Mon,  4 Aug 2025 14:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O7CmMmct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583BB10E592
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754319044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Th/zbNG2w/sGAVRFlv12HJ6Li/jSTJBgQ6X2ZZll/S0=;
 b=O7CmMmctRo8TFZp9kSQeC6rDb/zMSZ0HCHtbqtVv/qprOjythyKSwsXPkdGKeC+prscCG/
 iPvAZr3GrJvnAGlgdvZL1vLCszCYW18ffDvPJgI81KeCyUBP4qNSgYJg07OJPuAKMc/aCW
 n6sAfIZsr84pmte4/ictBb0pPG34+kQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-2hqens0YO3asLKE5yp0jfA-1; Mon, 04 Aug 2025 10:50:43 -0400
X-MC-Unique: 2hqens0YO3asLKE5yp0jfA-1
X-Mimecast-MFC-AGG-ID: 2hqens0YO3asLKE5yp0jfA_1754319042
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b7961b3c82so2074084f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754319042; x=1754923842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Th/zbNG2w/sGAVRFlv12HJ6Li/jSTJBgQ6X2ZZll/S0=;
 b=Ft5xY9j1CrUFIdxu6FF3udWPRr7gLMjHNekrEO8YSG6jT94LZIUj3Te6+O3xlpu7Ix
 /WOrbT++OpPzUPGaSq+n5gERlxf1pl/OYEkbQH20DtL+0+gEw+eaWrv+8AdHzStL9UF7
 TVTsMFzRtEm3DovPFpJEapHLVCIaVIV+Ds1C9O3vFf/DUwTtg4cwnhrt13Wp930cFz5I
 RlCSklkNe3AjaMVIbJR/RO1iPw4yEWCo/U3sUH9AkTSXQG0j3p0UtXtWE+mTcviXq2cf
 IV5lRJA/OFImZb+yMf9PMn8CjWMFz5Mbu2r9M24zObOG0Gmf77+y+UxzloXQdTGDsjtP
 wXjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUysqrLKL9VGEkted/NtA4Pp4EIyPbzM26DMHpLpX7qo4Yt3Ns59v1TUoeZD2D13SENot/HaX+4tlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmVLiyq1NW+x8ofmv9nwcAYUE0t5X5IPK34v9nGLglvP2+G420
 7EfFEF3P+8H9OzkQtQnILGFI80lYwbCrEpT2xWQHJQIxs11mQ1OiOXEdEhon2BCnuAkXXHN5LOR
 F5RmkS+vg5Wb6avcPJOdjuDd0OJ7XSLq8jq4bpN7Q6k9TxhX8MYKSC7IBOcqs0kCimWo+27xJxs
 puvTm8pGbipDNa1qedQHjaQ+58P1dC17+w8M0C51XIFMVC
X-Gm-Gg: ASbGnct2aDeEvijZP9VArLZjv6ScdzHXzVKNx9SgRGV+3jA10NzVo/ruZyxtlKT12OT
 +ldwR/xH2RVbqZFL7i92ttQHfzIM0hOiyrJ0A3y2FI8/bGfXrqytul896Nkto2Ai9hEb0x/rRKJ
 V9jYd3akbK+SMLD3H+cUvk
X-Received: by 2002:a05:6000:1788:b0:3b7:94c3:2786 with SMTP id
 ffacd0b85a97d-3b8d94c1c49mr6701548f8f.34.1754319041930; 
 Mon, 04 Aug 2025 07:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsw4pwEJUoqykoSclSWi0JkSR9VtvKkMXz/zduARm+hjzykjvBGRpvCt0a+Ds377veRWW/i7OVVOUhVwFvkM=
X-Received: by 2002:a05:6000:1788:b0:3b7:94c3:2786 with SMTP id
 ffacd0b85a97d-3b8d94c1c49mr6701520f8f.34.1754319041488; Mon, 04 Aug 2025
 07:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
 <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
 <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
In-Reply-To: <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 4 Aug 2025 16:50:28 +0200
X-Gm-Features: Ac12FXwltMgUzEEB8nqMLRA_D51YfOsfFkH1rt4nc_9cVgH_FR6V2EdEIAFZooc
Message-ID: <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: Andy Mindful <andy.mindful@gmail.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 rafael@kernel.org, ville.syrjala@linux.intel.com, tglx@linutronix.de, 
 Christian Brauner <brauner@kernel.org>, Jani Nikula <jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dKQ0SJktOwfQOfhQ2alwfKKce8tpbDRW-fipJfjAoYU_1754319042
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 4, 2025 at 12:57=E2=80=AFPM Andy Mindful <andy.mindful@gmail.co=
m> wrote:
> Double-checked bisect, looks like I've have found broken commit:
>
> > > git bisect bad
> > > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > > This means the bug has been fixed between
> > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].

This skip is messing up the results:

# skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a

and there are still 3858 commits in
ba5afb9a84df2e6b26a1b6389b98849cd16ea757..{1b1934dbbdcf9aa2d507932ff488cec4=
7999cf3f,61da593f4458f25c59f65cfd9ba1bda570db5db7,ba5afb9a84df2e6b26a1b6389=
b98849cd16ea757}

Any chance you can get 6.7 to work and restrict the range further?

Thanks,

Paolo

