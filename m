Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164BEB0FEA1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 04:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11D310E1BA;
	Thu, 24 Jul 2025 02:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YczZvaB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7A610E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:05:30 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-60c6fea6742so1071747a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753322728; x=1753927528; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qoxO/t2HqqWgt0wqaYNeB6LybJXDl4DsUk2bcFlF3Lg=;
 b=YczZvaB6zJV3bXk/6h8la5gRx3HysP+spaoffw694zPTHnf4PXq84tCTkMYHk3T4md
 uE0Fbp0tgunmUC/i5cho1wrwgmZPJe6Vj7/3Y3azAml1NSTrYt74G5pq0c7N4wpJsJCc
 +7OwOCzE83hD6Y1n+ox/v8W24t+gK99VWEi1QCuTSueKca/YqQAh8o+DUVWX6mTPGffe
 7IfYsrUeYWz5wiJnGk9mBJKlbeoBeICCkb/oy2FdhcZD+wx/Jc6GLfRQK3q8PA3SV30H
 s/Nfz3Wzb88LS1TP8ToZK5QtNGioF1N3wVRn8+KJnzJ/hjl0Q1xFMmPfrLYtKdwcRQra
 AQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753322728; x=1753927528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qoxO/t2HqqWgt0wqaYNeB6LybJXDl4DsUk2bcFlF3Lg=;
 b=Ak6cB4xbNbClaGtBO862EvxVs34GDleFhGLaBrIRolwqqDq4inpjMqxpq+qyLqng+P
 hT0K3QplHpe6Py1VVaAE1+mNW5v4NarGJc/rD//G3mGFn8tHf9HOtqNk1/WQ1FD1boBG
 RrFqbCed9x22neI1b6FMMnWvhs2FbRgVLNp4FBg+Qz6eguda75MgNfPpR4trM4qisx9K
 m3dD30iIHiKb57SGkd1qm+s+peXrYKoVTD+9kLkeocV5Am3QKH4BiJi50fH34EEdfOBf
 /RJs7zT27UTrNanEjEpjEPVf8gSifbo2dTpKXujEL50d+C47wYEFfiQjCaNunT8/scLF
 8h4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/+bNkLgwASJIONzXgEuZUNe1BE4AUNYD42dOuj1L+/tSFV8GNmNmOKy5L4I7MQzZchBPP/pfaoAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/rGoZ4063OZxmrQYgleDnnrXZ+bgaKFnLvQ5tRtBpcZtEpK7T
 DCMfXwGa3bU+1EebCK3WrQr6YU138LQUTqY17vIA1IwCQ+5JTzSP1MRuCWih3OjETd1hrz4By7i
 afttIU89GDAkgVTDV0tDH06BhN4S3aJ0=
X-Gm-Gg: ASbGncudMzEH8ocLWLlVi/gsFK17Mf926Zv02UPAbvp6/yJWiHdbRx8um9678EIzkd3
 wgGRkmj4IM1G+EKzyROYpv/qRXzOiNYoUnIgNyu7zRs8dH4tuCZKF6XwK4MtdpIiUvEm0iNUy3t
 VrL+cn3/JaWzvQxL50lrKby2rGf6Ukucp2zVhc2ZWNwdAKh/EhWrmTNWzHG+5cCCRUNd61E4rSv
 XFp1A==
X-Google-Smtp-Source: AGHT+IHgT1htUDvnyjVtLqLDcTFKVHnNusF2fxhRiQSaqrcP2J0p2sXCbdzkDOVUVWIgORWkxZdDOuLiMVaW0R7k24s=
X-Received: by 2002:a17:907:608f:b0:ad8:9466:3344 with SMTP id
 a640c23a62f3a-af2f8d53bd3mr564341966b.43.1753322728253; Wed, 23 Jul 2025
 19:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
 <CAHk-=wgLQ+EPeV+JzrvkPWt2jeteqwsRkf-X61jjfV8pefgXeg@mail.gmail.com>
In-Reply-To: <CAHk-=wgLQ+EPeV+JzrvkPWt2jeteqwsRkf-X61jjfV8pefgXeg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Jul 2025 12:05:17 +1000
X-Gm-Features: Ac12FXwgacPq_LmQOaqm7vLoci_B1iQ_12PFAOVERPpyC75eR6ZSArprlhiTSYw
Message-ID: <CAPM=9tyCq9kLeYD71oxzvkRzcAEqHjaLKKras_cottvZOogOGw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.16-rc8/final (resend in txt for sure)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jul 2025 at 11:59, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 23 Jul 2025 at 17:40, Dave Airlie <airlied@gmail.com> wrote:
> >
> > (this time for sure, plain text).
>
> I knew you could do it! Third time's the charm!
>
> I hope I don't need to worry about the branch contents as much as I
> apparently need to worry about your email sending capabilities?

Should be pretty safe, whatever muscle memory I have to send fixes
pull requests, only seems to work on the weekends.

Dave.
