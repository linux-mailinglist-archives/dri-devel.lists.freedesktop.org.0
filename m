Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2303A792A6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF15310E820;
	Wed,  2 Apr 2025 16:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JpcpZ3ID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D2910E81E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:06:30 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so1124906966b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1743609989; x=1744214789;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
 b=JpcpZ3IDulNOelRpsOh3/2EWfVuuE1eHzK/dBPToE6QrU/Od9+8x+mxp5EwSipNbEw
 Pv85f3N63V1ORiyo7F83F5abpSvOV995Ropz4lEOEh9WpenMFZ9zRBv4MCyFYyeWiFgM
 VXb8hQ/iRy4+a2oF9WalyR8KhO4K90e75w7Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743609989; x=1744214789;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
 b=w9XLvOs4spwW4AMYGllww/4bIVDlgbZIT9eJaIKje9DSp7wjyqicQPBVHxnfqyBWOU
 ASs+qyNN+T425bWFctqwfmmVpqFIOeoQe56Ws+0HjEZTmB7sBcWUDZt6Et/w0ALWnQqA
 IQIWg6V3EbI0ohIuom9aJQ4cM5mamrpjJS1Rpkv4DqtIFZSLzrH3iOCXAyn/M/QXOz7G
 FgsUQySaVRjpdbm8EFxodOeaHGz7GVpjL42Zr3Foxva2912EdkaYS/MSs7PqEcb0HDRx
 SdkWpphI9jp6pwotF9d8qiAqmSSnQOgyzPZ3uB+BkXcgtvtEYVAkJAEETMQTgTm8wjhh
 1DCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLugDcrPG4ZMGEjd7NuA/RraIN81iGPtj7fxFpYcFHQoubwVe2v6QVPm/Zs4ArdgtZHjkVI7g3Va4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEt553oOy9WO++w96CC48Pa71WZRPns2VejS+04HSazobPMMwZ
 qw/vg6rxPLeeVMgECkzhiHMt5neT/JQ66U7yXEqo6MWID00tOvnexoyxw/tALFp7ClMJYKQMB4m
 pBYo=
X-Gm-Gg: ASbGncvN9CJu0XcfS1C0m9PXY6eHYyweuHg4E9EXQzVkhVzRfaxpuk4jkT/WzG1Onug
 /0l+GRC0uOoYje/dQfKCuhO0Xwnf5QigJ5nfEVZrFxkCvweA+oObFGj6m7Nx9wBwqhVDpau4SU/
 iaDbD8NNNSp9i+uhdY82ddfzxade3+2e1bJanxjPkIrv/3lnU7lG/QXRsckTEqKXALJwFf6h0Ed
 j7+l1OKzkN1JVXONkAedmfg0k4wHb9lX62p8eECswn92F827BQmv9auMPJuYEbaHsPNpXd3JdJ1
 +Ei6trRwZygu2iBYeMFwm+Du09gGvESED6tYcqCY5FcWDE1+RAfNrs2CCrFFT0TeYjzhYtKcYdE
 4KT6AmbsQdjGGxMU3UfA=
X-Google-Smtp-Source: AGHT+IEXHgrJKlYQbDUdU+xf92+xuhViA51foOz7emClG6m1/5Zce6yNAraQwX6I40i7TAVD8zC0zA==
X-Received: by 2002:a17:907:7216:b0:ac6:b729:9285 with SMTP id
 a640c23a62f3a-ac738bf66a5mr1461169166b.55.1743609988566; 
 Wed, 02 Apr 2025 09:06:28 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71967fd33sm947161666b.142.2025.04.02.09.06.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so1124900266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXnR3ZoXmeYYliO3fSnev83FjTdIg5g97BFN9NThtVeuIJuL3b/bXtOcY1ZW4Umg8V7e1PjOEG5IMY=@lists.freedesktop.org
X-Received: by 2002:a17:906:dc95:b0:ac7:36c2:aed5 with SMTP id
 a640c23a62f3a-ac738a5aa5amr1649611366b.28.1743609986968; Wed, 02 Apr 2025
 09:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
In-Reply-To: <20250402124656.629226-1-jani.nikula@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 09:06:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqd6jCqv34VGPiVcJowK6E-xTG9BBy-7Ow_2MxO0m2aPE5XhfB34p0FnyE
Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, 
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

On Wed, 2 Apr 2025 at 05:47, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Another go at hiding the turds.

The patches look sane to me.

I didn't _test_ them - because that's not how I roll - but they look
like they would do the right thing and not interfere with my odd TAB
lifestyle (I say "odd", because apparently I'm the only one who lives
and dies by auto-complete, but obviously my way is never really odd.
By definition).

         Linus
