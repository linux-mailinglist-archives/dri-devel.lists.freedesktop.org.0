Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A6A9F663
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F2710E219;
	Mon, 28 Apr 2025 17:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aVkh4DHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8450E10E219
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 17:00:41 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-223fd89d036so63261085ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745859639; x=1746464439;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqa3pUCCBhc/8XYYDK50VJ8Kh8SjO9GYpSwwxAaDr8Y=;
 b=aVkh4DHDh7NJGeFerZfdGrJdU+8h1NHpz0zl8XNkuG0h/xLma8kCZ/GFQ2Yd9oZ+vs
 x64DddGzsN5OmFTfGlOmQ2arNrehMsfKoZtSnW/k5FDNEDfC7rT6JWgG5ExiHXbyFznM
 U0NLe3UW3bioCgMM944qd+2Y/pjx2PA8bbhoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745859639; x=1746464439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqa3pUCCBhc/8XYYDK50VJ8Kh8SjO9GYpSwwxAaDr8Y=;
 b=MVPg5Kpr3y6xNhBdGeBzmmT540Ja1spMZ0e2e0gCuI/8FT41Bbl5ifayUufdLg2mXF
 bG1Rb+3kwO1IZvloBenCWqPetg6HhAqxqFv6NsMcVivc4AtIr8zdNHqJVC9MoU5nhYhd
 ZufuqgrwhwieFep6Qlpv7CuPI+vLzrXamcymeUq4v1zzMkoNjoJTx8cnEsT3HZKBMhGh
 av2dNm6wNtywY/UrloR/qkB1efzVoFrTlS9kevJQvtgI7S9q9X4TkxyfZlevKfzRCQEI
 qIPRG0jDs9IAJLznyK9Ylv/oJtf13xsd8c/snGk2xB76Y+co4ft7Qt6TJWEAdkScQSbM
 FK4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyVkDRGJM7x7X+ydKqFBUENO1rvKmMIHF02K1/pC9KbrF+8sZ8iaa3+RsUqrWMdXQLfqaamseXgyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlDQnYujiUKN9o8+vMnTaThSn2tco87BYl5YF38mmnZbou+ioa
 GmrnM3me0KXGGECAniX56BfkFuU/Qm/Vm3DRrH3I6o6cfuQrGSAO6Flnq4ZTvzotc1nixglcS/k
 =
X-Gm-Gg: ASbGncvm4ed5xw97JZ2eabopDljwwuTzm5/4IIeyvwF0xbHFPc1Mrh6FqAHUxau1YFC
 ruMvYMRHWLEVsgj10aniZYCV7YkOvV70OyMkhKplHY9D5Um7N4BGjuegxP/KHN8xJp9woQZ8dJD
 O/owFfD2x+VtmaAZSM+9FpVx5dyB1stMbWKbavCpVxs/FBOrukJEEAGqyBjPmJXV9WyWLYILtd0
 NIozD//cltKnI/jzVht2xPWLyErhaW/Pn+2qs8Sx0CHo6xGTPxVgY62uZu8nn5Wh/EUiZAiQWJi
 XX0XXGPm5GglvtjnmMYHOkxUPEncUAbmbTJcQjrNtHyxTuIPIfKGpN9/D/vXa06oGmzDVHAOFuz
 rYxlC
X-Google-Smtp-Source: AGHT+IEziXpZtNTeqD68eoHEHj9gpuefblqVXo3kX55fR1D02JXOIGcoqwzTKL3W21UcmyJoeM1AJQ==
X-Received: by 2002:a17:902:d512:b0:21f:6a36:7bf3 with SMTP id
 d9443c01a7336-22dc69ff694mr158216725ad.12.1745859636873; 
 Mon, 28 Apr 2025 10:00:36 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com.
 [209.85.216.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d76d4bsm85359185ad.29.2025.04.28.10.00.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 10:00:35 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3081fe5987eso4781229a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxZbS4ECvpro2RKBQG+CNs8oV27Rc/G97zSP4ekLxjZ5uP/BHSNGHp9ubqNkttKpPEk6EzMJVm60Q=@lists.freedesktop.org
X-Received: by 2002:a17:90b:58cd:b0:2fa:15ab:4de7 with SMTP id
 98e67ed59e1d1-30a01329af0mr17554015a91.12.1745859632801; Mon, 28 Apr 2025
 10:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250411092307.238398-1-j-choudhary@ti.com>
 <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
 <d6e864d9-53ea-44d3-832c-55a6e58ac6d3@ti.com>
 <526c1714-95f1-49ea-9bf1-a778e00ad6bf@ti.com>
In-Reply-To: <526c1714-95f1-49ea-9bf1-a778e00ad6bf@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 10:00:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqKawr-e4riTPYfaOOW=pfsFQ9emQSqr=OB=hYNV9EQg@mail.gmail.com>
X-Gm-Features: ATxdqUENHvp3B6JI9Rchu8sHVmpuke2Fbz8JeoXha2ori6afQDg1Oe3Ku5_NCjU
Message-ID: <CAD=FV=WqKawr-e4riTPYfaOOW=pfsFQ9emQSqr=OB=hYNV9EQg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Add necessary DSI flags
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 linux-kernel@vger.kernel.org
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

Hi,

On Thu, Apr 24, 2025 at 3:47=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Hello Doug,
>
> On 17/04/25 02:40, Jayesh Choudhary wrote:
> > Hello Doug,
> >
> > On 13/04/25 07:22, Doug Anderson wrote:
> >> Hi,
> >>
> >> On Fri, Apr 11, 2025 at 2:23=E2=80=AFAM Jayesh Choudhary <j-choudhary@=
ti.com>
> >> wrote:
> >>>
> >>> Enable NO_EOT and SYNC flags for DSI to use VIDEO_SYNC_PULSE_MODE
> >>> with EOT disabled.
> >>
> >> Any chance you could add some details to this commit message? Your
> >> subject says that these flags are "necessary", but people have been
> >> using this driver successfully for many years now. Why did these flags
> >> suddenly become necessary and why were things working before?
> >>
> >> I'm not saying that we shouldn't use these flags, just trying to
> >> understand. I actually don't know a ton about these details in MIPI,
> >> so it would help me :-).
> >>
> >
> > Definitely.
> > I will add more details for the commit message.
> >
> > For more context here, I was working with cadence dsi driver for TI
> > SoCs. So to be more accurate, this is required for CDNS_DSI
> >
> > I observed other bridges like lt-9211, where I have seen such flags
> > being set for dsi-controller by vendors.
>
> Upon testing with modes other than video sync pulse mode,
> I found that with the upcoming fixes in cdns-dsi-core driver made by
> Tomi[0], this patch is no longer necessary.
>
> [0]:
> https://lore.kernel.org/all/20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ide=
asonboard.com/
>
> I apologies for the noise in the mailing list.

No worries. If folks are convinced that adding these flags makes
things "more correct" I still don't have an objection to landing the
patch, though the commit message would still need to be clear about
why these flags make things more correct. I'll leave it up to you. ;-)

-Doug
