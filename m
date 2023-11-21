Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084207F3042
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 15:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15E110E02C;
	Tue, 21 Nov 2023 14:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DE610E02C;
 Tue, 21 Nov 2023 14:05:51 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso3134973fac.1; 
 Tue, 21 Nov 2023 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700575550; x=1701180350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JicfpEa3uNWDUz2NDkVsyh217wG6PJj7MozXv7sFA4w=;
 b=VnqrX9hZzzlnkcVS0uLxllOAsddAh/mM/8gqRibK7Npe91cpe9o7LHuT6yehTedqB/
 A1/6Fuzjq/5+rbZPMGrlhI9Kdwz7bFLUCfU+MtoPgLdTj3S8agyZVbqtabls+5lZtfPY
 6q7Eb9jLSTm8oNTXDR5HFzEu6jDeTXe+LZzYJGCHi5RpOzPcBENIXgdEkqhPQXE/oxJ4
 kpURjQ6bJLmdTrd2qyeJjRys1LajuCmRk+Rd71tbrF7lvQT6dEl9rh/cDOS300vzvgFg
 Yx/i6PQ7fCbZ7knQDSMgCQkdomF34BnmMXz2czseQlnGXnYjDhH76VDtoul5Zv2nejp7
 DAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700575550; x=1701180350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JicfpEa3uNWDUz2NDkVsyh217wG6PJj7MozXv7sFA4w=;
 b=U08pTa6BEzBoEoHeHrN5LF53LexUbhoHnmzS57qQDLdsSFXUsWEwOdn+Pv1UISsooE
 z4FkLGAqr3KyJhidLHQhOFn0jZ+IZlK11Dor+cSmptsEo3YjcIlf5h72fykXbGqGTNL7
 miNYLfs7iMyE+mgSa8rMzPeULiSROW87fbcP8VGW2guFjBF8oARz+56cKp5X8T9JKPM/
 4V2YqrUM9AWu8yoIEQVmyStFXUMuZ+FGp562bYZB8FlLgAKclXXtPw6AB6C3Wn6ILAXk
 QSIPXBnbpG3cuDTlDYY3Tm22KpHwh1T/sPby7NClEugL2FGnnUuUSQwU4T1H6mDG/oHL
 avGw==
X-Gm-Message-State: AOJu0YwhOGVIOhmqxbzjTBByqbQXkfh6x6vvTgjUXbz556MkB1PLSoWy
 JEvpDprkzam7imrGWPACVdVY4ZuTSGILgFxaht0=
X-Google-Smtp-Source: AGHT+IHKHQMKS3b1gLqqox30Lk4uUwKC52JYW8VCEcKNOaYp9uPK894sLiFLuA30J+s9SqYcbYaSE9jt5JVjnAUgiXE=
X-Received: by 2002:a05:6871:7398:b0:1f5:994:9853 with SMTP id
 na24-20020a056871739800b001f509949853mr13022151oac.22.1700575550741; Tue, 21
 Nov 2023 06:05:50 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87bkbodp51.fsf@vps.thesusis.net>
In-Reply-To: <87bkbodp51.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Nov 2023 09:05:39 -0500
Message-ID: <CADnq5_Nh4wCFY10Ha9dTGWvehPCdY2zxfERtFuoeF5_xA+P=QA@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Phillip Susi <phill@thesusis.net>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 5:40=E2=80=AFPM Phillip Susi <phill@thesusis.net> w=
rote:
>
> Alex Deucher <alexdeucher@gmail.com> writes:
>
> > Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> > misunderstanding what the original report was actually testing.  If it
> > was 6.7, then try reverting:
> > 56e449603f0ac580700621a356d35d5716a62ce5
> > b70438004a14f4d0f9890b3297cd66248728546c
>
> I had been running v6.6-rc5 before pulling.  It looks like that got me
> somewhere between v6.6 and v6.7-rc1.  Reverting those two commits fixes
> it.

Does reverting 56e449603f0ac580700621a356d35d5716a62ce5 alone fix it?
Can you also attach your full dmesg log for the failed suspend?

Alex
