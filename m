Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C8A81602
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 21:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AAD10E72F;
	Tue,  8 Apr 2025 19:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EdSt/1+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04CF10E141
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 19:48:33 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so9220266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 12:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1744141711; x=1744746511;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
 b=EdSt/1+YTZuswMjQgBU1m9PM2iEyUUA3lNVWuSaPDuRtJ48se7udiJ+5eWkySgFq5U
 gsO3e2uXItIXT8Q0LzWEjncHx8d2UGy+wffGNhCctI02v/snR6Zg+O+ZfKqo1CSEEhEi
 zTjFQCbgdqEu/3sEhN+uNm/i8CoY4jwuzMt8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744141711; x=1744746511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
 b=MIhu3tSGJnP5vZghKO8eYH8aAq1RColKo+/ooh325jCImJul7N7cIUj5rtbUEQWhkl
 cj1Lae0s7nt/ro2Aok/UR6yvBu98bhjZv2kakrCsYpIpDu8qQMNuo46xGQVuvCt2OE0t
 XtVT8ew1/I4q9U94oQxcMFJACGGoKNr+6gKSRjCBpVz5ksGVwqaJ/WV/EIluVtRlf4Wi
 pDQ4Eft2Bd6inpBqlY5DsWbhZ04MSCfIpPWOKJduWpCcAyKZm/EtjSgz2K+BAnDT4mwF
 9j07qhVYnUa8IKHfo2h8prvUHoL8EW7+Af31ZNeVz5EN/SQPea/p0bfmt0RTmrfd6h0i
 OdjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtM8v3bRxnFsp+JmWy/d5OvCw6nzPE26eFGHPpcC4HKxhoDTVIe2zF5GmdzJGhl4f3iMoVSVEsa/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyuu53V0pK5mY8szmUOGYux8zg3WGmn09VgnGYZGHYN1jdR94jk
 HmRMKV3KhreGtHaP1kJsUd9FZb1uzYstOVH8cNtRiL+bKTYWWjq5iHNtfXpTBodxEfxnEB7Yez7
 Qq6U=
X-Gm-Gg: ASbGncvk9YPIMleEQNnaJ6rctdzFPZfUCfuqs4uMHoIBOpyNKxxQc4UugZWEX2mJmW6
 q2cjkmw5DqxRa4UE0/fKAWASgSkxUO6O/FwjAEbrXNrBgqNsMiFCyHk9t46ubPAvLbkijrxrVV9
 nZ3fMOu2IqnUBwLGhUgwXlkb0Uo2tW+cUwE2uMJo6X1/gvq/FLSfrJTAbCU+0FiQ2cBtTdY6ZxF
 O9CH0qVMNvikxc8R/3dhOYkLyfgkWm4+k25BIUxOEcCPvzj+/XUDjE984lKmurTYjV2doyKKONw
 ZbJc9IsEZE9Na1xIipjABWEBqYqZVQeoBQoJOn+/+41ah0OO++TKbh+FVQXzSqcavjmVt33hg0R
 Id7zDfu5nCTOHXei3EUc=
X-Google-Smtp-Source: AGHT+IH1DikYBGHNY57Kl2SA7FV6RUcC2vtodCajN+7tf9WaE/7SUC5iM5KcHsHgyi0I4A40GP61Jg==
X-Received: by 2002:a17:907:2d89:b0:aca:95ed:b9d1 with SMTP id
 a640c23a62f3a-aca95edc220mr116868766b.21.1744141711233; 
 Tue, 08 Apr 2025 12:48:31 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfea0eadsm973073066b.67.2025.04.08.12.48.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso6237266b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUcuHDlHL6DpCGVWNp+qWcVefXN7DByd3VdX8LYfI9ISa8zgC8lihs0HAmIAqh3pWsSJg+neS8o3dY=@lists.freedesktop.org
X-Received: by 2002:a17:906:6a06:b0:ac7:3929:25f9 with SMTP id
 a640c23a62f3a-ac81a87912bmr311971566b.29.1744141709943; Tue, 08 Apr 2025
 12:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
 <871pu3ys4x.fsf@intel.com>
In-Reply-To: <871pu3ys4x.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 12:48:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
X-Gm-Features: ATxdqUEdLh_PIaVo8IEhaJ-xWVSdvij9xBxWmcQMsdyDiXQo9KjbMpRmjfCGH_0
Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
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

On Tue, 8 Apr 2025 at 01:28, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Your goal may be to make everything self-contained, but AFAICS there is
> no agreement on that goal.

Yeah, absolutely not.

I'm not interested in making some general rule that all headers should
be self-contained.

We already have some fairly obvious and clear exceptions to that, in
how some headers are special and get included early on and headers are
*not* supposed to include them themselves (ie things like
compiler-version.h and kconfig.h)

And while those are *really* special and end up being done
automatically by our compiler flags, they are by no means the only
special cases.

Quite a *lot* of our headers have things like

    # error "Please do not include this file directly."

because those headers are literally *designed* to not be
self-sufficient. And that is absolutely not a mistake. These are
headers that are meant to be included in very specific situations by
specific other header files.

So no. The whole "everything is going to be self-contained" is simply
not going to happen. It's not even worth discussing. It's a
no-starter, and limits our header file design much too much.

Honestly, I think the whole "headers have to be self-contained in
general" thing is a mistake. But I think it's fine for people to mark
their "generic" headers for some kind of checking.

I think it's a bad bad idea to make it a rule, though.

              Linus
