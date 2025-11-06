Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606A8C3EDFD
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF1010EA3B;
	Fri,  7 Nov 2025 08:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SzF+hH2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3C810E9E6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 22:21:06 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-640f627d01dso237761a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 14:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762467665; x=1763072465; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ygoso68qxAo+I1gPqHR/S2bVV2Aj+Lzf1IsI2FGUc0=;
 b=SzF+hH2E9HywOAIoZS5xQwrZqecRY/H79JbUVpshRItJESElDRQ2XyH+60/w/3+UVB
 xcxixzp+QWxJjOwWBCJgPJ8GzkOaZb9Oq9fYZ/MYcwmW7K8M+/kJNQlYEWFqDt8xC+4q
 62uPrbkXKlOx1i3HxFyAHVgtJL26akc4/S+IWkp+3GjRTmydFojXJDJnISGp/N6MjW7U
 l5fGmvO41LeRjYEcTl3nLYxV75S0OaDA2EjkUW26vARMQJzVTvcucP2TudiYoxG8ixx9
 OxCMP+O1TZahqu7fcNjzyc9k0Q3AVh41ZZ7xiDM0MYZzyM3mXovLJMhT2OoPrEDY4qRT
 IAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762467665; x=1763072465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/ygoso68qxAo+I1gPqHR/S2bVV2Aj+Lzf1IsI2FGUc0=;
 b=cp6VNwfHzRlITcjQtknnQRvSFAofnwq4cuAkB1M4sNbnlg0OQLQuJw9s5tLJqJMPfP
 r9m6DUONoZNs9L8C+v67p9FI3oJFvuI4glv3BV5klps9n0X2j4shug2WdOKJQB6/honH
 L1JTOciiyPZV3WgeYwmBWXDOFYuUN7nIo7udkQbP/N2jil53/hPO+9s5VO9PkdBBj5Jv
 ek+OTg/pukf/pBCZ08ihoR2mUkWfF13XBuKQipQMyKUxPAzmGyAMlbJ9eVaJRqxw6rqY
 Wncr0e5Rr/mMoDfuEvWytJmgmQ4qKfrHD9Nh8xFliB+f50CuW1jfFpnxH26zniaJqUAv
 pC1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZCM8s422NdhkenrbGJK5fd+tvaX0ZqMqM9u+WVlbks9FzH3mycDTR/mPURm0R6EBQup499SVOxyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI7Jtw0soa7TU6hLSyOBFx+AMJTHm2YNDjBnBpvTy8cwI2qU1d
 czymiZnzWpLQBKznGniIO41GYhol2jZ9EX/fdFNja5pqVMFJE65pGfNA3fKdimj9jrGeTy2xliW
 SP6OXCSXm7LCpB3g4Id/z/cIdFSukEbY=
X-Gm-Gg: ASbGncsrBccqGEM1d9/8vnh32v26qFpAXEBSFP0CbpJNxh3AyjDgmzMRqvhNDqS0q0B
 KADJyuDaNWLNO1Eb6ofIsubuzvpkFnr+/tGbMU3LqPvu5H4I2002vSVQHp6sJ79Kg2HzmOs62Od
 GDP9ttVFh/HcZyuDl/rJARGmgW5hCoCWWJtpOl/axz1HKyZ1m/3lzKaKsOtqU8t6icFiHw0dUT/
 ElEkPMaVCeL8Pn4Y/7+keU/qUGJHhB+33+29sn7XfgZQVEZbg37EdS0eV6fXUK6jSgwsOEOu6Am
 RfIVjLA=
X-Google-Smtp-Source: AGHT+IG+TIAJ8IOua7l1mEprD2KTfqDGE+T9uMgK3wmEihVKudTfZaDUPZk/PP9mSw+jigEdELh8riemQen7Kc2izxY=
X-Received: by 2002:a17:907:60cd:b0:b70:68d7:ac0c with SMTP id
 a640c23a62f3a-b72c0ad942bmr82880966b.42.1762467665046; Thu, 06 Nov 2025
 14:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20251024034701.1673459-1-danisjiang@gmail.com>
In-Reply-To: <20251024034701.1673459-1-danisjiang@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 6 Nov 2025 23:20:53 +0100
X-Gm-Features: AWmQ_bkDYJ3Fr-1arvEyDEO1bXJ01gqbCdu39kZW9fG-2HstgXs4j71OYjmvDxQ
Message-ID: <CA+=Fv5REZNSH584Sy2cA2-iKqfRzV64=d4_nwOCT5vtH+1jX4Q@mail.gmail.com>
Subject: Re: [PATCH] agp/alpha: fix out-of-bounds write with negative pg_start
To: Yuhao Jiang <danisjiang@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, 
 David Airlie <airlied@redhat.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 07 Nov 2025 08:07:13 +0000
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

On Fri, Oct 24, 2025 at 5:48=E2=80=AFAM Yuhao Jiang <danisjiang@gmail.com> =
wrote:
>
> The code contains an out-of-bounds write vulnerability due to insufficien=
t
> bounds validation. Negative pg_start values and integer overflow in
> pg_start+pg_count can bypass the existing bounds check.
>
> For example, pg_start=3D-1 with page_count=3D1 produces a sum of 0, passi=
ng
> the check `(pg_start + page_count) > num_entries`, but later writes to
> ptes[-1]. Similarly, pg_start=3DLONG_MAX-5 with pg_count=3D10 overflows,
> bypassing the check.

I guess the bounds checking in the AGP code for Alpha has some limitations
as to how it's implemented. I spent some time looking at how bounds checkin=
g
in alpha_core_agp_insert_memory() is done on other architectures and I see
some of the same issues in for, example parisc_agp_insert_memory() as well
as amd64_insert_memory(), which even has a /* FIXME: could wrap */ line at
its bounds checking code. I guess even agp_generic_insert_memory() has
similar limitations. I'm wondering if this is the case, because at some
point, it was determined that this will never become a real problem and no
need to mess with old code that isn't really that broken, or just that no o=
ne
ever got around to fixing it properly?

If it needs fixing, should we try to fix it for all arch's that have
similar limitations?

Magnus
