Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6A9084A4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6B910EC4B;
	Fri, 14 Jun 2024 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CyvyL1iY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA4D10EBB0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:42:13 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6ad8243dba8so8177016d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718332932; x=1718937732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkn1Dqg/KvSsIEf4PMDdbgaHl7N3wpCE5dnCq2yPOs0=;
 b=CyvyL1iYvLz9UJZNVXscMF/fYdOOuE57GKMgIY1tl1rng7VqUhIYwrAPU0+PWQDSu6
 IfUM15Mu8XHH/c86sJHQbnLzxVw5p/jDlnvrE1F2bRce0ZMAAcCD1j7JG/UJkFfytwTG
 S1zYG7haJbStE3oMaC8S03zDLhn1V0pcMy1LUbQ4QghEGdpJD2FcXwB7lnedMxeYBmyv
 xid5wgmPgJUMQE1zbi3s08KExf2oRj22WhBhC5budycg/b2OnM1AsN0RzDzZF7BeZ0vk
 2Leu4GenSoM15CuqbfPXmgSJgLecysgEC9AL85yYLzf1c1lhNZkwahdLb+mkvd6UCFDx
 LubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718332932; x=1718937732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkn1Dqg/KvSsIEf4PMDdbgaHl7N3wpCE5dnCq2yPOs0=;
 b=R8QTpKegDQutd8Zgbtpv58zJL0UWN1ci8DiPHL7uPvwIgk5fQVIc3mS/wYXCrIRCmW
 EpLzgKCL5Nu98GiE100S80BkrP1TmUE3v/Pl7fmcUkLdxFsoMEJWvZ4UTE9FUutz6Km0
 Qb5M+TWWudY/yd6Me8SDeasvnI50qH9qTtWys2IxvCMlQYmhW4kaf6yB9cAYW+J+zQdo
 mDD92W7ntrXZCPltfgZlXyNlbZxbr+8BXArx29phZHvzWCE7pkalsXavUkiGYcnlbrxc
 TUij5BG3Wv0HZerXwnmQBURBt9qAxjAHUqZS3SF+5C99xkAt9jPA6DsBaX0dUuEdKy8V
 iT5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm2Zw+vh0qrny8qJKiAlC+YVutPf76WSM/X4bjjEbjznRxTWd87RDxkgS0BYakasf2hwajpfS1Bin83qQtTRtKrFmtlCIEKyr6MC15H0mQ
X-Gm-Message-State: AOJu0YwLYxyOkDuG0e7ujL13LzpJNjlw89JMo000rgk1Wra5Zw9rRIJM
 ykLLyxhjMIZ9FvOQ8uWnoi1uJscGv32VDg4rLla3YBWDD+AfQ3LiBrCqymAWVCfRh66wR0ybeos
 ou4Sh5U/S1hjNnxQS+ivtKyZmnTk=
X-Google-Smtp-Source: AGHT+IH2yJkDatqeZR2Ou1juwPDu1s/BD6Hx184YCW7utolqXQ5u8htp4butw/HzKwBNPXerjjKUWiJm/DxherGGPpI=
X-Received: by 2002:a0c:c581:0:b0:6b0:8ff6:7565 with SMTP id
 6a1803df08f44-6b2afd6e8a0mr14215336d6.49.1718332932181; Thu, 13 Jun 2024
 19:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240613023044.45873-1-laoar.shao@gmail.com>
 <20240613023044.45873-6-laoar.shao@gmail.com>
 <20240613141435.fad09579c934dbb79a3086cc@linux-foundation.org>
 <CAHk-=wgqrwFXK-CO8-V4fwUh5ymnUZ=wJnFyufV1dM9rC1t3Lg@mail.gmail.com>
In-Reply-To: <CAHk-=wgqrwFXK-CO8-V4fwUh5ymnUZ=wJnFyufV1dM9rC1t3Lg@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 14 Jun 2024 10:41:34 +0800
Message-ID: <CALOAHbCrZp2XV_zp0-mH2frW2Fk15Tz-A9J0K6gcJTbSXvTsPg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] mm/util: Fix possible race condition in kstrdup()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:52 +0000
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

On Fri, Jun 14, 2024 at 6:18=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 13 Jun 2024 at 14:14, Andrew Morton <akpm@linux-foundation.org> w=
rote:
> >
> > The concept sounds a little strange.  If some code takes a copy of a
> > string while some other code is altering it, yes, the result will be a
> > mess.  This is why get_task_comm() exists, and why it uses locking.
>
> The thing is, get_task_comm() is terminally broken.
>
> Nobody sane uses it, and sometimes it's literally _because_ it uses locki=
ng.
>
> Let's look at the numbers:
>
>  - 39 uses of get_task_comm()
>
>  - 2 uses of __get_task_comm() because the locking doesn't work
>
>  - 447 uses of raw "current->comm"
>
>  - 112 uses of raw 'ta*sk->comm' (and possibly
>
> IOW, we need to just accept the fact that nobody actually wants to use
> "get_task_comm()". It's a broken interface. It's inconvenient, and the
> locking makes it worse.
>
> Now, I'm not convinced that kstrdup() is what anybody should use
> should, but of the 600 "raw" uses of ->comm, four of them do seem to
> be kstrdup.
>
> Not great, I think they could be removed, but they are examples of
> people doing this. And I think it *would* be good to have the
> guarantee that yes, the kstrdup() result is always a proper string,
> even if it's used for unstable sources. Who knows what other unstable
> sources exist?
>
> I do suspect that most of the raw uses of 'xyz->comm' is for
> printouts. And I think we would be better with a '%pTSK' vsnprintf()
> format thing for that.

I will implement this change in the next step if no one else handles it.

>
> Sadly, I don't think coccinelle can do the kinds of transforms that
> involve printf format strings.

Yes, we need to carefully check them one by one.

>
> And no, a printk() string still couldn't use the locking version.
>
>                Linus



--=20
Regards
Yafang
