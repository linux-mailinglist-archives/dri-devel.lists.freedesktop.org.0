Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0ABB0ACC6
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 02:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D8010EA55;
	Sat, 19 Jul 2025 00:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="D9K3tmx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E53010EA55;
 Sat, 19 Jul 2025 00:23:17 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 358B93362BC;
 Sat, 19 Jul 2025 01:23:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1752884596; bh=kSJe9GvuVZ2j+MqxokllR6bnGIJDojVrjOlSpZrrF8M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D9K3tmx1hilOqzrEw1E/nTjLEp8yxMNr7UWvqycEUUAmvKt0wciJ5B/hAta1xXRvq
 HoPYLxLiCUKHk3wNVl6a9Yx2MNnKysAX5tD1PY57TE6mb/1T7FCfg9muiFHdHzEqOJ
 VnU2RPZfMeFfV21/XOVCNB5ZBOOI4/uffFc3xmBcAq5Teq8HK73TVpdg+9EQSkB5GH
 DfSacEiOnMJS2ZELTprUBTU2wpWTrW55EHOea1YR7h9Wn6Sjmerd9ojaQdThHz7r7c
 eTBJJgNDwaTUxeGPYrjyqzdP7SYAQo96XlFzZRT1Dmpsolr1VmqbawRF7iKNQ1pagr
 q2kaTENXnRFuw==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so504242266b.3; 
 Fri, 18 Jul 2025 17:23:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeQG7WKxSMrUyCD4xHduot3OTj64jZ1ETWZfbrBu9fv9OidI3h8e/UU314E0KlFKp/20FaIWzdBm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymbNZdpYInsBHp0lybtAVAzjGVwr4p9AxlBPozpOn0ZNqi6H7d
 nHZ2eUwqkx/Hsw4hhZc4hFmGVlab1fNp+C6s6d+n2lV3djKsTvuxCagMvTpzFavi+0tuXRgkonS
 2Kq5vHJclh7umTzHma9rglvsS0q94FkA=
X-Google-Smtp-Source: AGHT+IF632kN/iAb8XL6pp+tpt/8nOLg/oN3YozKqUXME50eVPq3ewtSdP0jEXnd371QZ/OcBQlYPv49+yY0NtZw+c4=
X-Received: by 2002:a17:906:6a17:b0:ae0:dfa5:3520 with SMTP id
 a640c23a62f3a-ae9ce0d2ce4mr1306716766b.31.1752884595837; Fri, 18 Jul 2025
 17:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250718192045.2091650-1-superm1@kernel.org>
 <20250718192045.2091650-2-superm1@kernel.org>
In-Reply-To: <20250718192045.2091650-2-superm1@kernel.org>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Sat, 19 Jul 2025 02:23:04 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwvu-aLC4j5+=oohT8qcF8y4gBCDfkKYy7V9t8HY9q-Fg@mail.gmail.com>
X-Gm-Features: Ac12FXz2jnkGip7zE74KPq0PWw4dYRM6_acTMejHwjwV8MlK484E6t10uT8EAJA
Message-ID: <CAFZQkGwvu-aLC4j5+=oohT8qcF8y4gBCDfkKYy7V9t8HY9q-Fg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] drm/amd: Re-introduce property to control adaptive
 backlight modulation
To: Mario Limonciello <superm1@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, 
 Harry Wentland <Harry.Wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
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

Looks like a reasonable approach to me. Thanks for following up on it!

I'll look into a KWin implementation soon.

- Xaver
