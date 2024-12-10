Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82A9EBF12
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 00:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA7110E032;
	Tue, 10 Dec 2024 23:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Qyd+VYlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E409810E032
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 23:12:33 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3cfdc7e4fso937a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733872352; x=1734477152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ktWoM2RO50AIk62xE/mUhtdnzdqp6Qodwc9F6o3J3M=;
 b=Qyd+VYlpchlPPk4QO4eL9G4DfNmUwS0FXppFINOtR7SWxfjFLHkD79TpbAr48A7C3+
 3Tie7764LVWGiyLZIN4d7JOeP0hVNOfirXeTD4ymFgMWWKt1cXsfbC16sCNK71C4WjSQ
 IPKD1v6bi7HQD5HqbrJVKybQur9ftauCSr2HiVfV5ZRVnp+x1NJCliyfxL7NGJ+pMhbb
 0py4jGwRcoP3Ggk6wwi3074jasGk3yDkFMq6bBvQ1dsiOYBk5xFGh2eYUaVl/IRunha7
 8kda7pTxTJWqmPLns4iyVu26h7GQ5rRj2lBxjGq2daa/WpeCEtUtTwSdsC6yQ42Y2jgy
 BI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733872352; x=1734477152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ktWoM2RO50AIk62xE/mUhtdnzdqp6Qodwc9F6o3J3M=;
 b=YkADzhvimlBVj+9YWJoFpApxAcbrEoQJs88nEWHPduaD3RMWFAQhFU5G3f9GMRZSKW
 rEEleT2ahtnXVnPyjnE1dsCdrt9Drl6kVIkI9nM1XScvPgRSnjt5HG/nDyHxZR9Ci+KZ
 +8zk47TGgDfVg3F2xdAzZGeET70lvojbKWNrnCwtTR5oJcIoNaWtQXVy0MIeDOOLszMN
 ijWOhgA5sXfEtwdpNMG1c/KPWHNcnOLpirYfbAKjKu4QGWDI7e0t7MO34qO6aJRo8eBN
 YcLyv3ytEQKAl0BKPX8PpJQ0LxiB2VsxK+SAtjEWyagWkn8HMMuaqBmYb1SdqAwHU3sy
 IiuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy2J6GCcWzMtyS9gjX2sEnEIydYXgVkcB+wG74Zi835c7UcEMW+zt9Ukj7ercmS7peTfBc8PQ4B9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM2633XqCKbgmXdZqr4HR4ldTkBi/zrFFZtbmjvxhu/hn9Mdg3
 o8EPJSU92m2PDhcwOnHryY0cxHMSS5PNdOPDjkeeEWbA3SUL5paiB1er1MUb3axVJMhbFA+evGX
 lRMCDtJhKb+NwiK/9BTkcntdSRtzQ832CHo0a
X-Gm-Gg: ASbGncsqKX4/JMmp33sR9A+tA0AhCyc8zGuhGujbl8Dk+fO6JKq42XqDxEur/uTQYMc
 VVq+4Z82/oIp+LInCUwxAtok2Jc1ZaEuIbqC8qnYmBUvNAkHnrD3SXmNkJOH0MbKH
X-Google-Smtp-Source: AGHT+IFg93uOLvg+U0JqZTijgyGoPZEhO04pg5mVTz8T7IazCzxdGADHif0Wl3o6jYGRQnOjr9uTt6hydMk6lXR7lwc=
X-Received: by 2002:a05:6402:b8f:b0:5d1:10a4:de9 with SMTP id
 4fb4d7f45d1cf-5d43423be00mr11289a12.7.1733872351659; Tue, 10 Dec 2024
 15:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
 <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
 <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
In-Reply-To: <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 11 Dec 2024 00:11:54 +0100
Message-ID: <CAG48ez2cTrD2_4iKo3+zrPH=e29znYOKLBkC4OLA3yhsu5oMNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Julian Orth <ju.orth@gmail.com>,
 stable@vger.kernel.org
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

On Tue, Dec 10, 2024 at 11:51=E2=80=AFPM Joel Fernandes <joel@joelfernandes=
.org> wrote:
> On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wrot=
e:
> > The current check_memfd_seals() is racy: Since we first do
> > check_memfd_seals() and then udmabuf_pin_folios() without holding any
> > relevant lock across both, F_SEAL_WRITE can be set in between.
> > This is problematic because we can end up holding pins to pages in a
> > write-sealed memfd.
> >
> > Fix it using the inode lock, that's probably the easiest way.
> > In the future, we might want to consider moving this logic into memfd,
> > especially if anyone else wants to use memfd_pin_folios().
>
> I am curious, why is it not possible to have a reproducer for this
> issue, is it not reproducible and is theoretical?

Sorry, I think I must have forgotten about this part when I wrote the
cover letter: The original bug reporter (Julian) linked to a
reproducer that is linked in the bugzilla bug report, at
<https://github.com/mahkoh/udmabuf-seal>. I haven't tried running it
myself though.


> thanks,
>
>  - Joel
>
> >
> > Reported-by: Julian Orth <ju.orth@gmail.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219106
> > Closes: https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=3Do=
brimeTgpD+StkV9w@mail.gmail.com
> > Fixes: fbb0de795078 ("Add udmabuf misc device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>
