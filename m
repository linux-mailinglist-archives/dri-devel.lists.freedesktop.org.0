Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5978B8017
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 20:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CB8112E4E;
	Tue, 30 Apr 2024 18:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c9oNAuFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB555112E4E;
 Tue, 30 Apr 2024 18:49:53 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-7ed38f80242so1939524241.2; 
 Tue, 30 Apr 2024 11:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714502992; x=1715107792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovRxnaBd6FTDXqV2H7WIeHH2Iv92ouqScbx2FXXHbgo=;
 b=c9oNAuFFGWgtB8PviX8vjvs7i64xGDXWWi8RmMYzHfWllZ/xNIvBHQcYz7gIkg2LwB
 C7Kfl3JWRBFGq0sSjO311qcwB+mxdu0U4B6bmByUgXkEKpBd69/VGmGpN3TLkULN2ig/
 XJ7T4TjFlMptivSyrOW9psWJDuQMANF33ysCjkHxxihshmqG9J2/Fcr/blPmgQeAld7t
 lkN3MSNaUUvxT4vHEBr6t5OQ0Zhi68x4VtkHaIrE3qZ9SzVGjmtq7FAtK5E7c4wf7dpV
 Z7OHH1l1PEfv7L4HGeVdfR4MXoRulwZ9awLd+vd46OmedytH6rV3qrHjhq3soZe0wRN/
 KreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714502992; x=1715107792;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovRxnaBd6FTDXqV2H7WIeHH2Iv92ouqScbx2FXXHbgo=;
 b=b7SF9eyj2LCpMyaqVO5hTZvJmZYBtwUfeDzVfrazwFGzSqc8nSKQ5A5yHmN+wVWek7
 QCsP6n0SUK7kgUG7wJpDFIpdPKdt7NrS3a1IfiMsxEJPv6XAO564nIRpgiWmq6gLIuU4
 xQGyPa+Iw1QAE7sPp2viLuhKsqTUkJbZ/mybCPeBskLOuIu4GcJW9isZQ/8aVA8ok6vA
 4p7Yo21QKsW+nttGeTodBfKxHyLXpJMKoLIrxbS2C2pEQsyxkHz6VhIoc6yXj91gFJh2
 0iGGqc3ah1ppwEQwSnhC3bCOo145+a6xi5RfhlHyrHtizYPHrK2XiZjXlflIvgWV//P5
 ZBig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPlKLAVg1tvDquJg5AnfLg2+cbuZFGXwS8yYqSWpZXuSL76KaPluY0c9O/BjNoscF6OptjPhU77UaBNuaqHC2iKR2D0d2IuP8FYOYD4feOc2/SdwUqk+kvA67DBIlndxnlr0Yi8oNdEzzxJKEVoZ3quDpDDU8JnQ+AVEEkCRPTwVcWCJO9J3nwgtQdlh4UePGqu5PKvTEy+PX0bLxQCQ9z4m/Zn++VBaLWp1MPieMYzYFBeEs=
X-Gm-Message-State: AOJu0Yy+4DtfsQCP6ha9eD6qtFYFHIm/8OTVge+bLLEUgDHyiFaP2Qut
 UE0mPjDa7D72MtY05QJ7Eq7KnzbAfJNhew6hSAG7HSrdDGQfOPj2vO8ztUwiyZJiXGQrYTunKT6
 2Sihnolj1JOjgsShxp13eWoVmAeg=
X-Google-Smtp-Source: AGHT+IEYrpal3QoBPRQ++rwUqDaIC9CmdEKHvVPwvAQ+vncPDFl0h7pwu+HmwYOWtzcwQ1PiHyzGG1EvQK6S81Uls4s=
X-Received: by 2002:a67:eed7:0:b0:47d:8561:99aa with SMTP id
 o23-20020a67eed7000000b0047d856199aamr661606vsp.4.1714502992443; Tue, 30 Apr
 2024 11:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240429193921.66648-1-jim.cromie@gmail.com>
 <20240429193921.66648-10-jim.cromie@gmail.com>
In-Reply-To: <20240429193921.66648-10-jim.cromie@gmail.com>
From: jim.cromie@gmail.com
Date: Tue, 30 Apr 2024 12:49:26 -0600
Message-ID: <CAJfuBxxdfaATOCvZ2giY1Y-KTP+65UarRqwcKsg9tKjyrNtBXw@mail.gmail.com>
Subject: Re: [PATCH v8 29/35] dyndbg: add __counted_by annotations
To: jbaron@akamai.com, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
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

On Mon, Apr 29, 2024 at 1:39=E2=80=AFPM Jim Cromie <jim.cromie@gmail.com> w=
rote:
>
> Tell the compiler about our vectors (array,length), in 2 places:
>

these are not flex-arrays,  using counted-by is wrong here.

Ive dropped this commit, series rebases clean wo it.


> h: struct _ddebug_info, which keeps refs to the __dyndbg_* ELF/DATA
> sections, these are all vectors with a length.
>
