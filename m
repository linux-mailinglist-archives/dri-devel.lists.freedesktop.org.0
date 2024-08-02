Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A0945A2A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 10:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E82010E9C2;
	Fri,  2 Aug 2024 08:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Z+uZIRk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B6510E9C1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 08:43:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5a1b073d7cdso55824a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1722588232; x=1723193032;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GUhgmiRdApbQ1BMRxUcvp0LGjhPzUZ5wX8NNISAeoM=;
 b=Z+uZIRk4R8AiOH1bNFNnhJkzE8kAsixprQjiNPMiQvWIJoBy9P6Az6JWhcjqUzT6Gl
 o9X+ZsQKjFgVJDfLG8IrQsVd0v01lcvaXZ2ehz14bxI4MM2SncMOHUqVsxYfYwJzKIxs
 sWChsnt7SGmv030Jh5Ek/KbDsYvrgsb79hXpP7GgaD33Rwp+R901kJ/njgQwvuV/r0oi
 +MkwhknJDQfZGmgS1Q0GeU65xpkCiRBWbDCiu9QIW+hdC5dgfIEvj/sxIus1z+7C/flw
 S53kCJ6Mt40X6gy4ss+V6/ea8c032nCERullxpgYJnB9XajiG+EoYHEkuqESFawqh6uY
 MD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722588232; x=1723193032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8GUhgmiRdApbQ1BMRxUcvp0LGjhPzUZ5wX8NNISAeoM=;
 b=lBYe3k2bSbz54ZBHlbZdoN9Xt0aIAHgQjxhmb6uOxgLErqYP62bYfAGmlqcKY6g70b
 ySKO9VrNChdETuY3gSfZk+Iw6s5GWbvxYKisTy3rescAgQAfkcRZiaB1nBu/HnELU9jc
 WV5cisKHxFsw6qJ18aLTdt+YMJi8wsVIAUij5aSvGYjGWZ0ESAsfw/Them/+TDclza5p
 IkLjISIYaXJNMxXGe+gKPPw7gQXWQ7IvBLtz88S0PMHcJR45Juamrt6r7ybRjLOknbcm
 2Il6I1MhIb3+P5QcZ7+aabL4f8VS/QliwljrlF4vuXfBBWsBlKIUNYn8Exuk1w2zi+Dn
 qfPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmuynUhj5+axR8oKrLeMEoiAE+nqg5f+MkTT6L5uxRF5Dqe6gz4RLZMWdpWHlUmn8/ZiCj5x0dhmbi+bDw6itqiAtFrs5/KpekcYOf/GfI
X-Gm-Message-State: AOJu0Yy5hmgU4AZDdg8XjT2Aecz77GmjU7jUEHZvXbd8J9UdENnfoDrh
 fbGy6rfnJjEpnO8A/j1Yh2w8VVxVrwl8SoHc5a3M0161jNJlrdEAjX2uOAtV3TaQCmTvRqA75Uj
 GkLM7v3aMpBA238h2akUVMQ7u2dO5zSezrrJO
X-Google-Smtp-Source: AGHT+IHtct2y98/NLkN+xbps3gIOq2/m46xPn+4JR1tFzWhlYsU1Pt575JTMAwyRBk7RI6b032cKZPMCKlg4XYi/un4=
X-Received: by 2002:a05:6402:5109:b0:58b:15e4:d786 with SMTP id
 4fb4d7f45d1cf-5b870f709f6mr93520a12.5.1722588231655; Fri, 02 Aug 2024
 01:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240802083850.103694-1-andi.shyti@linux.intel.com>
 <20240802083850.103694-3-andi.shyti@linux.intel.com>
In-Reply-To: <20240802083850.103694-3-andi.shyti@linux.intel.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 Aug 2024 10:43:15 +0200
Message-ID: <CAG48ez2tCHUgaLxrF_qf7cdq2WUGmQMrhXWVHGOcjPAAL=HyVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915/gem: Fix Virtual Memory mapping boundaries
 calculation
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Jann Horn <jannh@chromium.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthew Auld <matthew.auld@intel.com>
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

On Fri, Aug 2, 2024 at 10:39=E2=80=AFAM Andi Shyti <andi.shyti@linux.intel.=
com> wrote:
> Calculating the size of the mapped area as the lesser value
> between the requested size and the actual size does not consider
> the partial mapping offset. This can cause page fault access.
>
> Fix the calculation of the starting and ending addresses, the
> total size is now deduced from the difference between the end and
> start addresses.
>
> Additionally, the calculations have been rewritten in a clearer
> and more understandable form.
>
> Fixes: c58305af1835 ("drm/i915: Use remap_io_mapping() to prefault all PT=
E in a single pass")
> Reported-by: Jann Horn <jannh@google.com>
> Co-developed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <stable@vger.kernel.org> # v4.9+

Reviewed-by: Jann Horn <jannh@google.com>
