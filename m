Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51870D1D7AC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B9910E5DE;
	Wed, 14 Jan 2026 09:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="GitTTAag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2E310E5DE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:22:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59b76844f89so5968102e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768382521; x=1768987321; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+TLqsVb+BwjF4lG8vt/DUf2U0UB8iRBHws2zuhJqE0=;
 b=GitTTAagiASRB8+XuQcGzgIEhGVSe15tBfwUBHHpm6TWgGJ+XWATW4cxLS8w6sik1l
 E3Xkvtxu0T5jwjA8QphII4efF8BV2N8nRaw8/ejznl9172PxNuUZWsHLjmMmWJHctXNq
 UsLzyhhmRV1yIAh67CSzf1nx9NJAFYDY7+gvO7WoR0yMaAcpi9E5mjNHpQCejRqbalQ4
 ttZBsclgWip19wIzsyw/kPGtEEftZCmpkTR6liaQ1BkJ1G9XLaCTQQx1R7R3lk19YAZB
 QdoPaM2rPQX1YBkZ6Nmeva58S8w1DcsDBHg5TSprcOMc7umlU7JJkuqf1cnH/ybb5DAZ
 seNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768382521; x=1768987321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B+TLqsVb+BwjF4lG8vt/DUf2U0UB8iRBHws2zuhJqE0=;
 b=UvwT+LdyPw04vvzd+ewP0KoCPfHrXlwxxlwLIpVk160HkdgYfJSbUVBry6dydOQF4G
 giJpYYnhCAgO2awyw4eD3mkur2nogC02eFecW8e6J7E1Ly1BSPIH6q+XKFtIX/e/0cD6
 1inkdX2u4KZryCZ+leST0kPYKvZquZJ9nnLog7S0Svd8i0kSmHRdj6M3EjnenQ7Euiwp
 ij0EUCdDChj3ZEMu7xtQ/icjcF0sJ9UF6g5ci5AEdA3SUBYhvKDBNR5PthOSRHxKe7s1
 Ni8XQ7r1ZFecdpXMy6lXLYMLkBMDZjn0HGnTh/8halIXLKMK/QlCelxDYRRFDi+bODcJ
 6+2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCwMpx4Nuq22tGYFabnkypcPrvW9BniQ13jJUoi6fq+dO2/EAyELQoUXUB5XFZxAlS1UaEg8pfgdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmd1+AQpTdOkDnyYHyxwLlSbpypJ6BrCZHPOJ8taYKNS58eD7l
 DWaNBePsGwhL+mnYkMpFQlnqi1ERaTqBFM/MroQFIWwpuDU0v4qJ6lfgpQCW/V9lx10gB9aBjlK
 vz9Da1XfKw450PgqR14sJQR646bwYfP7lIPhSkV+Tqw==
X-Gm-Gg: AY/fxX6X+m2gxZ0/4hE6QZ2jEW6jK0ChtMVAVc2WsirM16bFMLP1i2I32xedpj9HSmN
 cukXUCqJbGPCcD0Z8T+ZplYlTWDgfkQY2qx69SYuFmLpOZKJt+DS1UpAWEWm2Ge7COhw4WFvQEy
 5CHAn28eBe84n7A6O5GUq9rgdatGcmDoja3OZAuWMCnt1bcGWtCkbxWorCjYSWA2J8lTHxMExHf
 sQhKCOHVb8jLSvLDj60VWrFx7ekJvip+tedHm7B4vE6wMxVEhCOe5+pcD3VQwkxpwt6AXgIkX++
 llHFNTEJHWhmuSwMmKYcPQvpa1WU0bLYod5e94Y=
X-Received: by 2002:a05:6512:3d0f:b0:59a:183c:4863 with SMTP id
 2adb3069b0e04-59ba1523e7bmr438957e87.8.1768382521040; Wed, 14 Jan 2026
 01:22:01 -0800 (PST)
MIME-Version: 1.0
References: <20260112094406.82641-1-marco.crivellari@suse.com>
 <aWWz9pJ30Hxa0USG@lstrano-desk.jf.intel.com>
 <aWdKdllO8ZTRfYgp@lstrano-desk.jf.intel.com>
In-Reply-To: <aWdKdllO8ZTRfYgp@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 14 Jan 2026 10:21:50 +0100
X-Gm-Features: AZwV_Qhc6Bkk42aHGgyAMokWFyQuIbojktnom_cU3CoHLLk2SojYqiL1guAlJ4g
Message-ID: <CAAofZF5X97shEA6a8-v=Qu6QtWwKg44O7pqLKs1XHQYSn+_f1Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/xe: Replace use of system_wq with
 tlb_inval->timeout_wq
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Wed, Jan 14, 2026 at 8:49=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
> [...]
>
> Merged to drm-xe-next, thanks for the patch.

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer
