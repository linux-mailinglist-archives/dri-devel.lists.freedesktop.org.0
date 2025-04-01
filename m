Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF184A77FE3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347410E60A;
	Tue,  1 Apr 2025 16:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eSsxfE31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF4410E60A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:12:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so863896366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1743523938; x=1744128738;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R0cWPyIGalJTJpOn4sOHZYmIkTB2QC9Z2olFNCWNik4=;
 b=eSsxfE31kYHWymQh9FxVsP74IT5etC9nI/Mj5TzIh2CxBkv7zrpKmDM5DB1uZR/QwY
 zXfhDg8F3QKLq4AZq2Jv23wKkzf4C0G1BEhUJ17pN1Jt7eSqyR+Q8fW9D1rByuiVKeRb
 0WUTlzTCwzFmBZXuhcrcYZemhteJvFVABlXvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743523938; x=1744128738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R0cWPyIGalJTJpOn4sOHZYmIkTB2QC9Z2olFNCWNik4=;
 b=YvoN1Cz9AohvzKHkXw8kOA/0fg+Gme3wy/woYZxJZtl747btCN9S6NPNUcTjt996E4
 OcaVLRZkfMrqsF1wqGGh6sepyhyT0b3X94DtVtXxHtWvtFYVlT9WUKfnX/1R1GNTWScZ
 fa/8n8yFMKtm+kUfAQASoXnKvUMJnGMuTA2iDvndiuEfqHgJ+1lPOSrAszSQRe65Le4G
 E9HXxs7DSEpRkvsFZTlERG/SN53JQhBFQYY1imuRRiULMOHtHPmxVhO8oReOlr1IXtNG
 BRrWK1QZQxuNUF0sVvOteb2CbJnbJcogKhkiZ1fQUPSUoABh8qd04b0O3rwh0JMOWKYJ
 E8Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2KefLU5FwY8EXcaepSsxIJ4eGsHws0lVx4u8eSxtH0PEHF2am7fsO+P6OOhOYJEsmrFC8IUh9SRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1TCBmrXLHOi6ai2PdnrDO9ikTCBLSh7eiq7rBVTHVtQ+22sul
 wW1LpK56rHMpqq2BiM5bMDP1drEcZJtmnnkRgqUkP5hx9WXcoRI8XxGg+nxq/rRg8SJPVYYm9oY
 qfts=
X-Gm-Gg: ASbGncs/rggUJA3qJoIyVSza/jgia1j35LHcFrHZulGicKY53y3TzYGys80NGr78Ioq
 wNxehSeCf//T/ooMXCRoTVqdITbISIGkkgfGMHg6Hh5UNECYBpws17hvc/2q8J92vR968sWjSU3
 oyzm6f2UhE5CyBekNrVWPo1rGqyzQWW20Htw4089taIPpxzY+Mc3ob5GS4l/vpVYbduJEV602l+
 WVGsEFQoKDTaQdq33+DsthnPcYBjkT4cLic9SSdmAvC92cJOZZtpaqCSdW5gm0vHSvT7sIAMSgi
 jxNrgMfrXOf8f1azDXtauFl6CetepFigEYUs6Wi17TYolEMjXtEzYi4d7rcWeINP3DaHMoTn0Gh
 SPd7LlHM6dduS3AJWeGQ=
X-Google-Smtp-Source: AGHT+IG/8xnXxDDuJsaKLGYJH1lIgste+eteext8rvEtZ8rKSjToECwMWKHEPt63aXtl+31zHkQ9Mw==
X-Received: by 2002:a17:907:868a:b0:ac3:ad7b:5618 with SMTP id
 a640c23a62f3a-ac7389e6750mr1465181466b.3.1743523937731; 
 Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71927af39sm778885066b.44.2025.04.01.09.12.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e673822f76so9747687a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXOzmsqJsUBCQC92orByY9LaeBgGXkn6+oK3fRRMRLNXw0SSz2xeoGBohfPiH0JcJUsjCSIWs/d5gE=@lists.freedesktop.org
X-Received: by 2002:a17:907:60ca:b0:ac7:95b3:fbe2 with SMTP id
 a640c23a62f3a-ac795b40722mr84123166b.56.1743523936719; Tue, 01 Apr 2025
 09:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
In-Reply-To: <87tt782htn.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Apr 2025 09:12:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jrv7hzkHPbwtJqWz0Cd1SXHgUtjes9IRxVS7PrDi4g4uM9zP-lB0F8gOBM
Message-ID: <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Dave Airlie <airlied@gmail.com>, 
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

On Tue, 1 Apr 2025 at 05:21, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> The header checks have existed for uapi headers before, including the,
> uh, turds, but apparently adding them in drm broke the camel's back.

The uapi header test things never caused any problems for me [*],
because they don't actually pollute the source tree.

Why? Because they all end up in that generated 'usr/include/' directory.

So when I look at the source files, filename completion is entirely
unaffected, and it all works fine.

Look, I can complete something like

    include/uapi/asm-generic/poll.h

perfectly fine, because there is *not* some generated turd that affects it all.

Because for the uapi files those hdrtest files end up being in

    ./usr/include/asm-generic/poll.hdrtest

and I never have any reason to really look at that subdirectory at
all, since it's all generated.

Or put another way - if I _were_ to look at it, it would be exactly
because I want to see some generated file, in which case the 'hdrtest'
turd would be part of it.

(Although I cannot recall that ever having actually happened, to be
honest - but looking at various header files is common, and I hit the
drm case immediately)

Would you mind taking more of that uapi approach than creating that
hidden directory specific to the drm tree? Maybe this could *all* be
generalized?

           Linus

[*] I say "never caused any problems for me", but maybe it did way in
the past and it was fixed and I just don't recall. I have definitely
complained about pathname completion issues to people before.
