Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC2A7CC26
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 00:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0153710E056;
	Sat,  5 Apr 2025 22:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RblrJISV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701E310E056
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 22:34:51 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso243960066b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Apr 2025 15:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1743892486; x=1744497286;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tT2mm+ItL4N6xmscnWjjPD3E7M42LVXxM6kDybYeTbg=;
 b=RblrJISVraempWnrVR7W8urbiowHVNnpfBtI+E094WJP6mySnB1EJAh4vyLH2FbZ3k
 IGB/rIl6ehj2a+p9sdwC8RBB+kDtN0bipKhqy0QQIdJ6CjYcbL8LfbI4JKjWnQwHcb+B
 iXMy/ETJGbryW+mAyk43TJkJNPhE7VGfjuXNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743892486; x=1744497286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tT2mm+ItL4N6xmscnWjjPD3E7M42LVXxM6kDybYeTbg=;
 b=mypJ+UD0ojVaCwh5cOKzj8WFFXTY0nX9ImMaRzTCAkNWPOhB4d+/n0Lb+n28OnnczQ
 0zkKdONHIxoMUqOq9Tm9OTn/Ln38+Jx7kfCK+v2NImucutEYY7US+fDsMRD1svmwEBuu
 LXGrY//F6ts4nNHfgRjAMwPsWAN8DoZdBn+k04UmjPPMhbvChur3Cuphesu3HcDdPLSx
 CB5yy3rglQ+UplsKhrT78dkZ2rO4s0El9YG7CdV5Av4XtkvyFR+md7CZCOQnzHQ0fM7T
 T3tGs4IO/HCfNgl4T5yqV7ZcEtEf2MMBZrvYVmdTMyvSGxq5mwyGX1UPqsGHkdFZihY6
 wFpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuCFP7qWdbwCCUSKz8gYdIS0pL3LTgdJYWZjgcz1VRP/aF7c3CkwWW/dbqYX1E/gSMGNFEsFV1SYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXnG0hNZjV8/Mhuu+1ib4jIf0UbHTA4eWtMpBOOTCkR7WEYEwO
 hx88f4HzLN/cXOwy3LZH6GnIt0plYXSUW0Poy1ihhf4tPxkE6PEPtrDPRMckhkG1122w0doJxeg
 EF+0=
X-Gm-Gg: ASbGncvtdUbi9LSAaoBiKVSGvGx5pzwB80YYK5E3qg/69Sq5LiuO/ozr8KOCUef8G7u
 Rzu4JqOvV/FdNxR2Fsd1Vz3EiiTfW/73kJAlxk9RRLQo2mNOOpjxE4tOhqavqrxcsGJi+GbO+hi
 q5FSc4BoROj7W8EgHL1P9qeGEuuWRws8teYph4Iz6pxP0us4eyFFqY19jWfQBAMQ4MycCBJyeK7
 mLmJSSkwcEhslaua+SZ7o4aoklp9y8faLi7EheKIUoorSRjoo/Ta6/luJ873SR0njapyfVh6JqZ
 SH35v76pW4GVGBoCBp0iqPLGqiVyeJD7NAnGdtYem/S8XQUtIoDGZpXd/UYylxNbrQ3z268yddl
 b9Jt1i1N1/6hhJrzVnlo=
X-Google-Smtp-Source: AGHT+IF21/Xs0+Dt8HkOdmX+BHJBSYR/HNTs9J5PduGldDGfDe4WQOEqvfYvJuwjMpGYGxePQl+DlA==
X-Received: by 2002:a17:907:7eaa:b0:ac2:b826:1e6b with SMTP id
 a640c23a62f3a-ac7d1820cb2mr763306466b.4.1743892486280; 
 Sat, 05 Apr 2025 15:34:46 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c013f363sm489020266b.105.2025.04.05.15.34.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 15:34:45 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso211907166b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Apr 2025 15:34:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUI+W5hS0nxHkYI3etW8z1ji7uUg7jFTPRs2TczX9tWCKDzg7mnVvnqNT8vJLj7joo+lFy9jyG3w1I=@lists.freedesktop.org
X-Received: by 2002:a17:906:dc8f:b0:abf:8f56:fe76 with SMTP id
 a640c23a62f3a-ac7d18bbd79mr666317166b.25.1743892484382; Sat, 05 Apr 2025
 15:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
 <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
In-Reply-To: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Apr 2025 15:34:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
X-Gm-Features: ATxdqUEiA6LOTMVfYZDKtw0Uy6wB6ERJBodsv9nW5wea49PdH9NSkRvjU3sFM0w
Message-ID: <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc1
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

I was going to report this separately, but then the pull came in, so
I'm just replying to that one instead...

On Sat, 5 Apr 2025 at 14:51, Dave Airlie <airlied@gmail.com> wrote:
>
> amdgpu:

Does any of this happen to fix this (repeated a couple of hundred
times each time):

  [drm] scheduler comp_1.1.1 is not ready, skipping
  [drm] scheduler comp_1.3.0 is not ready, skipping
  [drm] scheduler comp_1.0.1 is not ready, skipping

which seems to happen on my machine when the display goes to sleep and
then comes back from low-power state.

It also seems to make the power resume quite a bit slower. Everything
still seems to *work*, just annoying messages and an extra several
seconds of black screen...

This is on my threadripper with the same ancient "Sapphire Pulse RX
580 8GB" or whatever it is. lspci calls it "Ellesmere [Radeon RX
470/480/570/570X/580/580X/590] (rev e7)"

I will be pulling and testing, but I thought I'd mention this issue regardless.

                Linus
