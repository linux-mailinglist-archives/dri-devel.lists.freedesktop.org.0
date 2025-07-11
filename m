Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2FB02596
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 22:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE110E3C7;
	Fri, 11 Jul 2025 20:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FnBwvj6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CC910E3C7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 20:08:09 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ae3b37207easo493371266b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752264488; x=1752869288;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3PEIy8sr1TZluoxMMwYFZHAXfdHvp21bOGwTcdKyt5g=;
 b=FnBwvj6yNm9WMF7Mil1zVn4t5Tn2Tv2JkXEcuJmdPmpROasEZjeLEuGVy8Xodu7Ozc
 WcjfTWoZOt85uhxVsPFvcSZRgw1SciCHi9a8BMJxs9aTaepQsVfUbnZcEdTb/zj6BeDw
 Cz7TowRQyU3zC0HZNOFBgHdIcghegJcLMl4gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752264488; x=1752869288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3PEIy8sr1TZluoxMMwYFZHAXfdHvp21bOGwTcdKyt5g=;
 b=itldVWnZoejy0ojy6lghygpf0cEvfJ7RstQJnyKh1TLhk1EZfNGXsmZAVKRiEYnsHI
 1JcCZV5mpjjRubvTJrjcSF4hz+1HL3Z2Hcso8xl8BgbmMKHpGSRfymFCB7CYV0rAYPEA
 NRQi7IIPf72nTPurlBOdRvIiW/CSDiZ8Z1rc9nQNaAtn//vf+dRD/in65v3y13RAVO4N
 YEGv8QqpcvvSlJ/0kLfDCWNeKreE71/mPkcpfVrZ3bAt4eZ2AXTkwvETKTtLSPDYzwpO
 jYJGlR6enmI/vWVupGLrAtrpemndLfhKDW0mdJZeW8O+Uz+wdeEtz8ArUXJxuO5p4xnY
 tAcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIWB/MyPSoNg2x7W8qxUVYm3Yds7edzsBgsmEhh6y31fm5uoIl+jMMPux8GYiI0KBjiMYEhQfcu2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfQMj2xVQ8DQgm0SSA+4gpzLtckBqI5uZsrsGjxFWnqql191nZ
 rb72tvqnXOKdi1Zd5/BDhPY74nmbWV5OyJ+gfCtioc/f/5QgZ6idfJrFSOuO5pgXOUI8rm0fiGs
 5lJRiJOHQpg==
X-Gm-Gg: ASbGncv/J8FLsgchDb62v0Ol9w9YNEPVSWMhUIfqzQvOwYqLc7jgWhC97i36xwO+0Bs
 B5oc5HzBDasn99dZXKpLP+6GzkX9H8GkqZankIcZLh9jdvPWyi6JPvMoM+AISvJBI01Wp4ZDNde
 ONtiy3XrlONX9N3DZkauJhSfe9BPJ5stHrHrrovmwsmfePOjkvLk3Y02FQSK8V0cNLGQM23YtIV
 fxi22xr9om23AaTmGIpPCDX2GQKvR86RYS+0GC+eJAiyrgl/T5T8mR4IGr+kkgadXPkEB1/Yzii
 EatWdM8y2RwvNQfAhJd0RLXbg5m8C8mTZtEUQoUeHTNP+Oi+t9NX9YZIML332izTOq2B4aGE4/8
 9yYDfjFKJo3C3rlfCIlqPPm5PWTG72NXTT7WNjxBV3aWQT25TAGHjetZuGZQZT7TjKz/AGvLE
X-Google-Smtp-Source: AGHT+IGhmocXSpWEZVFNiYiOlLC60uavIQIPcQVrf0dUXYZHMdKWoz1LBwT59xHvSPqdt/mHVslJoQ==
X-Received: by 2002:a17:906:ee85:b0:ae3:6cc8:e422 with SMTP id
 a640c23a62f3a-ae6fbf9e043mr484235866b.47.1752264487672; 
 Fri, 11 Jul 2025 13:08:07 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82dedf4sm352273366b.148.2025.07.11.13.08.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 13:08:07 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso4868418a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHcdJiJJzJ1Fm/WJZwM9f5wXxjHt2PxQ66iN4ymJwRJbbxSjZUObzrGvTDBhT+mu5muA4soBMZ8uY=@lists.freedesktop.org
X-Received: by 2002:a05:6402:518d:b0:60c:4521:aa54 with SMTP id
 4fb4d7f45d1cf-611e8490749mr4202220a12.17.1752264486410; Fri, 11 Jul 2025
 13:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
 <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
 <20250711125349.0ccc4ac0@kernel.org>
In-Reply-To: <20250711125349.0ccc4ac0@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 13:07:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjp9vnw46tJ_7r-+Q73EWABHsO0EBvBM2ww8ibK9XfSZg@mail.gmail.com>
X-Gm-Features: Ac12FXzjp4AGZ7WX6h51mZw8s-h9Pt8Rdamdc2UExJ4zq0chj2Qhdb4f4rcsT30
Message-ID: <CAHk-=wjp9vnw46tJ_7r-+Q73EWABHsO0EBvBM2ww8ibK9XfSZg@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 11 Jul 2025 at 12:53, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Let me keep digging but other than the netlink stuff the rest doesn't
> stand out..

Oh well. I think I'll just have to go back to bisecting this thing.
I've tried to do that several times, and it has failed due to being
too flaky, but I think I've learnt the signs to look out for better
too.

For example, the first few times I was just looking for "not able to
log in", because I hadn't caught on to the fact that sometimes the
failures simply didn't hit something very important.

This clearly is timing-sensitive, and it's presumably hardware-dependent too.

And it could easily be that some bootup process gets stuck on
something entirely unrelated. Some random driver change - sound, pin
control, whatever - might then just end up having odd interactions.

I don't see any issues on my laptop. And considering how random the
behavior problems are, it could have been going on for a while without
me ever realizing it (plus I was running a distro kernel for at least
a few days without even noticing that I wasn't running my own build
any more).

I was hoping it was some known problem, because I'm not sure how
successful a bisect will be.

I guess I had nothing better to do this weekend anyway....

                  Linus
