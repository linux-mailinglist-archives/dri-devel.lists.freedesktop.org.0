Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEDB0249D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E2E10E26B;
	Fri, 11 Jul 2025 19:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PTKhuAvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BBA10E3C5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 19:30:48 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-60c01f70092so3939636a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752262247; x=1752867047;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W42wqNZ6CmAMcEVUi0DgirOnpBMSt1r3eJzW5nHOkPQ=;
 b=PTKhuAvzq4zb+WhmGKMAcay4sB/JssGzrIolV7SO5YjGLAKzPDtvLXtXRILJXSlFto
 /eeNcjobkxliyVp9/yGW3Vu0fwc6itBNQmacXuytLgYtBZ1CBMFHYOw988CyXhWKbNKs
 u40LHdD/r0WClcsybiefZ53vE0PNe+8FWaClI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752262247; x=1752867047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W42wqNZ6CmAMcEVUi0DgirOnpBMSt1r3eJzW5nHOkPQ=;
 b=TOqCCP09MZdeRuA1frgcq1IHmKC2UbiMw/absb7vP4CBDsri1QG8RhoeitKuCs6Wd1
 zs4HGjf5k5W+A/Nk5stDc861+X1MjOVgL1nXdI/USLSYbynLOnl43meHxKvYbdKeZlTy
 Q66AKj+4Vq5Lt8KEwwrl+a7PZ4dzNcwipC5U2DXbFi2fJpAqeVqu8P7Ue0gMo7ImCOg5
 jf2KnAxcFYVDHI+TSVc5aztDatZCpynDuLBbMJrXtT8i3wmfTQ5dVWirqhrwtjfF9/vY
 dAdT4ywioyozteD2zcwXDw9lkmPNTKuiCpJSrXYp8SzUwfaAzrcgF5hgDpAUe1UluIqQ
 0DtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsv/ADVkEsUChdHqjDcdgcrQbpW0G++w+z87ulfPnpPDt2XPAwzcnP4Y8ITMddsGrcnt9QmZwi9Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYVRcyg/bqpOy3r9qVv1sYXLCVH6bgxuRbA3lxg54NRiKaACRD
 zkOEjOXgX12tTWDsE2E6eo1qmKI+W8sUB8/R1qE0V4INp+YH7lVngG2egfv5lULN5je4lKHRk49
 QEX0yUFzD2Q==
X-Gm-Gg: ASbGncszYKtsggHB4h6XEGajgSzoWbQbyHhb6lzZfFt6/zuW4AoZMwjAJCPFAot3gSe
 LWU/FQjbW6RGUJto537SQ/JSsI7VfYOooTvvYuzn6yR2ifkGF9Ux305vtGaTRZJuQTUJyOKithd
 CLLV7XK+kpv68zlaRtv+nAZfLYG18WdlAPMs9WBPnV++H66Y/Iz/DQ3gtD9pQnoKo7WcSVUESH2
 UYnHmy0Oi2WOizFijD06mSb2H3s7JYOiBzG/OUcbWJELesYwj0ugjbyIDmUwLLfjoTFkk4DRAzA
 ce1lULc2R13321QBiWiEps8Jkd4OY2QmO3FjKUO7AOVZzSrGzgFoon9lNW34ki/rMagN+ailm9M
 EvZSTtRwJXyThJ5lvVA3XYP08maW4t0fXMyx8fisAxYJ3NU2wXxStScGqe263UvrMPbpsr5DI
X-Google-Smtp-Source: AGHT+IG0Xkt4DrW//Ai3tMxT1212hTSjT/CTH01znjvkVcXKIJodkbfAGgZo2WCY/NvoOX65bGf1Vg==
X-Received: by 2002:a05:6402:2684:b0:60c:3f77:3f4a with SMTP id
 4fb4d7f45d1cf-611e760d861mr3850607a12.4.1752262246780; 
 Fri, 11 Jul 2025 12:30:46 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c979893dsm2555666a12.81.2025.07.11.12.30.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 12:30:46 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso4809604a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWmjVZptOvWxz7jRrE9wXZNk5l4ZXqUonSObvERFdqe7X1rXM7Reel8mdmwSP7rLGISAw+AT+hDSCk=@lists.freedesktop.org
X-Received: by 2002:a05:6402:13d5:b0:601:e99c:9b19 with SMTP id
 4fb4d7f45d1cf-611eefbd8ccmr2998361a12.1.1752262244860; Fri, 11 Jul 2025
 12:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
In-Reply-To: <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 12:30:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
X-Gm-Features: Ac12FXz05ddJJmdKtsU0c732bvFnqaJPd5imXrgLsnwoQ6msxaZ9czwbq-1pfJM
Message-ID: <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
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

On Fri, 11 Jul 2025 at 12:18, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I spent several hours yesterday chasing all the wrong things (because
> I thought it was in drm), and often thought "Oh, that fixed it". Only
> to then realize that nope, the problem still happens.
>
> I will test the reverts. Several times.

Well, the first boot with those three commits reverted shows no problem at all.

But as mentioned, I've now had "Oh, that fixed it" about ten times.

So that "Oh, it worked this time" has been tainted by past experience.
Will do several more boots now in the hope that it's gone for good.

            Linus
