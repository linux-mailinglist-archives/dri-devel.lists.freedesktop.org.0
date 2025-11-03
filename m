Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A28C2D7C7
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA94010E4AF;
	Mon,  3 Nov 2025 17:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tUx4q78T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA0610E4A7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:34:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E71F941B53
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C665CC4CEE7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762191264;
 bh=U+aH8lUB+El5hnIWJORr7k8qBwm8VSBJwZFvW25Fg/I=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=tUx4q78TJlms91B8kVH3OS4mBEXWsvYo6gIgV6Y0heRMq8vOm1cDId7gsHmz7W3tE
 7GiOz3MF6wlKLkRekNZ6ukVR+qYIJP7pj1+1I+C0fnW31LlA6+pgdgbsu1yqVjE6lO
 bvjS/eBSerrLyAuAqTfYt/Jm0i0W3o6czTZv7Ca+Eea98ojf4VLlcwUKvJpLKTQR+W
 n81B/gcvOWkCN1B1qUtJ1ul7lv3noAm5/SH0L9mrkqMLY/tBb/mPjuKZcG2t902EXh
 l4Xsnxt08jqN5XmqKhFuD5XCXr1TRB1nQaD8aChq4XcRvAOuYvyd3fS0LpCKAQlOPK
 kksI4DjMOPIUA==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3637d6e9923so41240551fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:34:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrM+t4m+K75jE0zZeqAaiWZkMauI5vTta13z9NvXwI1A8oj5wIvzbleNpQSKaWoAu9BTmGJtXhz5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWubPQ2+hiBRk+joR4VHDKsq/S7p1LctnkWfRp4nBgGPLrEzEq
 gGeKM2A1BTQ95n3hehBMnkZKBbuHX8hU4Qq52KfiMgk6YYbcF7IkZz14YvxVANAbD/7Th/f3Csy
 POi9+2LeDMwplUwXJMW+OT6WzRcCuOUI=
X-Google-Smtp-Source: AGHT+IEqIvI6roVKypuJ/8lmOG6ruLu/sT6I8PoGyCI0UGJODSsC0TE29OXF/Zmg59uD8vy8TPsUZtJtVFNrzZBQfWQ=
X-Received: by 2002:a2e:960f:0:b0:378:ec14:f79d with SMTP id
 38308e7fff4ca-37a18da804fmr30699451fa.22.1762191263229; Mon, 03 Nov 2025
 09:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-31-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-31-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:34:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65v3_uNohrH6PgDaRdVcKzEL0n824kqxGC+m_ZMOjLiNQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkqC2MlJ3l_GaAyIVAX7lpWibpo3rNv2SEIDf6NmFqmG-ysp_S5fUsi28A
Message-ID: <CAGb2v65v3_uNohrH6PgDaRdVcKzEL0n824kqxGC+m_ZMOjLiNQ@mail.gmail.com>
Subject: Re: [PATCH 30/30] drm/sun4i: Nuke mixer pointer from layer code
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> It's not used anymore, so remove it. This allows trully independent
> layer state from mixer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
