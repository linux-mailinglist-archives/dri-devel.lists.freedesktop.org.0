Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB45CDC9BC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC2210FA96;
	Wed, 24 Dec 2025 14:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="J1EQHv9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D817210FA96
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:59:02 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37fccf7035aso48864261fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766588341; x=1767193141; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJSPxR8UhxFNBwyBL3D/8cFHFu7FlXsGZvFbeShmvQY=;
 b=J1EQHv9OjVT8zcgZgiZmIC6iQrt91Tsy6WX53UH+bY5n/JXd+nJB0tlVPbM8cuEZ3U
 ssFCWJ7dzjfL/crnEVX2ZfmF1c1j7A4oZ9WzaQ6yDKKyANCPPE4N2GUFmbiBo+FxVXTv
 U4jcDMBl6A2oqRXpWFZ5LjcBLraN7iKehJIUYi3POJziYquIz0hYDGZ4RZTPBsk/mr7O
 y3MAtOJXNc9tdzENY8ib3CtTdGIX9PvRrPZRMc7Rb6QByhqv/Enl0CXcS29G9pVt5Fky
 f6OXWtUYt5zxZf1aWxtmXWOQ5gWigI8r+nkHoeV9zvJL2rNlxSfzpOvkWUYgvP4lDz96
 5XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766588341; x=1767193141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJSPxR8UhxFNBwyBL3D/8cFHFu7FlXsGZvFbeShmvQY=;
 b=wi30MUiMdlA8sKbbmdvxNlFmrH5c1T3MMRQmJJmmHbFdh8I0v/f27avCBRxPU2AIXq
 bPnZ5pp/GsyuVUaJSxq/Bp8ZneCruRRALtifgKOs8tF6TDrx9WeRPG/kVR1GDZvvbITd
 iuVBsmmfsYltNHdPAqXHiVwJdNIAob4yDzXECbMZuvrzSEgq3/pEKzBlVtzJdpXqWWex
 XiPUI1i0vymR3o19JZkWYPXfTpo6BZqacvCn3q0rOawsuhyQoZN9t6huX3Z0ORrFDsVl
 qSKIjH8bQV2hK4NSbOXrHfVDU70OLXB6huAICYST6RSdgwYzIE1FRva2fL0TOwoqBUKd
 WpVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWSLQQ4DSqdkTNGdPNp1AmPoE269/y1Ue84Jb8Sff7q1nZHYs22snHuG/WBR4B27wGgjO8BSSLOVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEfPyVPEVhvibg3ByTgwyvt9picG5A8uBBYua2GelEzObtr3qt
 Rmx6d4tJ7iJ6lSGWMlZwzOK+TDW0QsbDiczjZ459CB+pYNGtXHk80tKhpKXNaJoSG4P4YRQADWz
 9vR1yb+kJA5EWzHxqiarhmq3Wzth9pA3w4qXU2z6SgA==
X-Gm-Gg: AY/fxX6ZthrBxZV4VNV7gLc8ms+VUVvsY0B1OwwwCoA8gR/hgfoIP2NTFVSj0XVeS37
 0dh+h1BKe1Xxk1H6nTU7DESmTqV48wHxDTk5WRs/9sLRlZKVbS/3Bi29PdV5Lee3VT6u8DALS7f
 04fFD3cRHN9dP06HuJSkXaXOgkV1iu5F3kgtRDX0KHVz2VtfHI8DQv7y95lNOKrHdJeKrzaTunr
 xond3f4oL4ogpPBt9O6mrVTTu9B1QBt5au6C9UUlWb2hioHfatdgXHdG2MxUfeU5DYxKu4bs6nv
 vJxKp/rWkLxckAIxAZvgKgGN2x2Z
X-Google-Smtp-Source: AGHT+IGQhEfiAp7epeD7nUp4t4mtwvjc6bbHXqjNCVzBykh1lZIpLFou6Qiz3Q2qvRK+dFrpCnKKTDTvhHUcv8/kB7s=
X-Received: by 2002:a05:651c:199e:b0:37b:af2d:13a3 with SMTP id
 38308e7fff4ca-38121552c00mr62822271fa.7.1766588341183; Wed, 24 Dec 2025
 06:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20251104165731.315074-1-marco.crivellari@suse.com>
In-Reply-To: <20251104165731.315074-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 15:58:50 +0100
X-Gm-Features: AQt7F2qU-bvs5vr-2qb_bO3KnERXTh-83dzfK1rp1UStTc6vL3BzlMtRZZoAF2g
Message-ID: <CAAofZF5c6ar0EY4dt_gpWyb_HPRF+uG2DVdC=+AY=31WfTJNxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tilcdc: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Tue, Nov 4, 2025 at 5:57=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!


--=20

Marco Crivellari

L3 Support Engineer
