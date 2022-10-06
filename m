Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925535F6EB8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8207810E88B;
	Thu,  6 Oct 2022 20:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F2710E88B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 20:14:14 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-132b8f6f1b2so3438748fac.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 13:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LG5s7nbKTfHu5COP1QJvyeZv9l1qYTKLfGC/UV14PKk=;
 b=FT8jddiKZ/7hF9TxFucIVcyaA16ujYVO3dQv9YaW+7B5bMaN4nXWeK/7WZCA/gUQWS
 HKtQsJSGZT3kh3GPFl4gKcGPKW8loaE/0sZp1q93mD3ilQ2SgkyIevV0KEH8P85AAFQO
 Y6RzfJf6uTPgrhict9EuYcMyb1FrE3Tdq3RMDyhLNtmU1SHF4v9S+k4k/hTOKBQhwqAl
 IhOpwkPdC8VR4o5LxvlEqha+nNM/uJxr1o0wHfzUSRPxd97HYQhhx6F8SkmpcSgD7iB1
 q9qxKt1i0jsnNoZYTqXW4k0dMp4a52JupHZfKiRaNCFYkx9P8GPcDN/ePz5U8T6yVuii
 r9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LG5s7nbKTfHu5COP1QJvyeZv9l1qYTKLfGC/UV14PKk=;
 b=supDg2dIWyzBDjgPWt/87lwIXVFqFw7/3luYCuU2QYxD8nUUtOykSAiR3mwEvMHAIY
 GKMZEQezet9AcIlICa21ZW8wT4oo4/Y85d9VG7s5v++WgPJwBkE8W84lCj196TJcRtc8
 rh5xAiXRjhZrxXOoclpooD3/2tnL3KLct3BpxDpD4XyxULZIriqI04B9FOH9gVU3Rb69
 Y1QARjA0/oYOM9/9dnIBzqex1emqlk/PcpKBcKvWcVTumQ+HH+PmQ4P1h8XIEfiu1ik+
 uy4fu0E6/pA2akgimJKoyPxAdCvtbNUWj4YX+UtWkLXRosiFlWhzkvfcpeLASHk1m3xX
 J2bQ==
X-Gm-Message-State: ACrzQf1z0HIIiCvPd84Uq+dIgDnlJmfKloaE0tjmCJdpwIgoAb8ysTsA
 3U16Hd8p7bcIyIsETrLz25Eg32cEQt12ttzP1Tg=
X-Google-Smtp-Source: AMsMyM4z9WFuSSW3+LYClNwwgR9Bgu8QwYeUVIXfiqZc12CrE/fJUgscVA3p2Pvg9ze/0ZMUHo/Zuq3dM3JG4EzR470=
X-Received: by 2002:a05:6870:c5a4:b0:131:6edd:3955 with SMTP id
 ba36-20020a056870c5a400b001316edd3955mr830537oab.96.1665087253471; Thu, 06
 Oct 2022 13:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
In-Reply-To: <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Oct 2022 16:14:02 -0400
Message-ID: <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 3:48 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Oct 6, 2022 at 12:28 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Maybe you are seeing this which is an issue with GPU TLB flushes which
> > is kind of sporadic:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/2113
>
> Well, that seems to be 5.19, and while timing changes (or whatever
> other software updates) could have made it start trigger, this machine
> has been pretty solid otgerwise.
>
> > Are you seeing any GPU page faults in your kernel log?
>
> Nothing even remotely like that "no-retry page fault" in that issue
> report. Of course, if it happens just before the whole thing locks
> up...

Your chip is too old to support retry faults so it's likely you could
be just seeing a GPU page fault followed by a hang.  Your chip also
lacks a paging queue, so you would be affected by the TLB issue.

Alex
