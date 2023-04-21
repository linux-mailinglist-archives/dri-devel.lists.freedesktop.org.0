Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659486EAF4F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C40210E260;
	Fri, 21 Apr 2023 16:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9A710E260
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:37:31 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-74ab718c344so653059185a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682095048; x=1684687048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxiZElG3FNnEQroNi7gmZ1hDLL3MfyJcrVlb79fLJZ4=;
 b=Aa0pDkHkZudOPWgM4MEnzMw2i+wGJrdcNz3vrQaCbOk+42Mdf6NIyg/ZQAWhVf8e9E
 thx3R9zZYaPC6NuyZ0CzcJjUyLntLiCAgz2tA1IKJjoW1lYUrdt7E9BcA9dTLtFOGIko
 FGJHn4DTl/JDCHPAg1KIm9iDdn1G4yn+S6efQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095048; x=1684687048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxiZElG3FNnEQroNi7gmZ1hDLL3MfyJcrVlb79fLJZ4=;
 b=NFiK7YoVfjc+Wy+zNmOZ81+UA2jw17AwTYWWMEWrZ19RMzM8o7PkWMnM8BBY2Z+/I2
 qY0qOGzYHvhtqYI5UOgjyFuIKPK7E28VPN28yvdPnCSKOp4qKu6sM2C0uZCDWWruPeyi
 IBieR4qNg9yKa878BbsVHTwM7gDv48yGB2gjMxuz2MK4o2xJWw8gab7x2+6djzojFbbc
 Yb1YEHA7xuA4LBLej8jcSBwReEfgYRNzCWeXTibAvxvbqPOujouMqXpBiYWUqZwnMQck
 WZVL8pDiH+4eBYiPT2T26N9zSjbPgG8SNTMu6JeoO80GCELnc0KH4yHzoal2FhDDxBGC
 BFkA==
X-Gm-Message-State: AAQBX9ee3SEKiErPtSdZLBT89cAH4YA8/2JgrkPAGAivu6rulhCKHxYU
 o2y+F6C4XFinYC6ziztXg/JLSC3s50JD9i00oxY=
X-Google-Smtp-Source: AKy350bPMOqNjfav38OclRajpmzeVNrWNgh6elfoxs70jIioMoub0cWDDwd9Uj3dQc07RofvSnzn5A==
X-Received: by 2002:a05:6214:cc2:b0:5ef:5060:436c with SMTP id
 2-20020a0562140cc200b005ef5060436cmr13390296qvx.17.1682095048219; 
 Fri, 21 Apr 2023 09:37:28 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 x16-20020a0ce250000000b005ef6b124d39sm1288058qvl.5.2023.04.21.09.37.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:37:27 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-3e0965f70ecso1176181cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:37:27 -0700 (PDT)
X-Received: by 2002:ac8:7d45:0:b0:3ef:4319:c6c5 with SMTP id
 h5-20020ac87d45000000b003ef4319c6c5mr294065qtb.19.1682095046699; Fri, 21 Apr
 2023 09:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
 <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
 <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
 <fb93e95f-181f-917d-9216-a81dec1a2959@linaro.org>
In-Reply-To: <fb93e95f-181f-917d-9216-a81dec1a2959@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Apr 2023 09:37:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vs8UEfBZ56fYb3i1cmFbCSPrbgaedXB4+UvDTOyhzCzw@mail.gmail.com>
Message-ID: <CAD=FV=Vs8UEfBZ56fYb3i1cmFbCSPrbgaedXB4+UvDTOyhzCzw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: display: simple: add support
 for InnoLux G070ACE-L01
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, richard.leitner@linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 21, 2023 at 9:26=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/04/2023 18:15, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Mar 13, 2023 at 12:51=E2=80=AFAM <richard.leitner@linux.dev> wr=
ote:
> >>
> >> From: Richard Leitner <richard.leitner@skidata.com>
> >>
> >> Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
> >> string.
> >>
> >> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> >
> > nit: as I understand it, ordering of tags is usually supposed to be
> > chronological. You signed off on this patch before Krzysztof acked it,
> > so the SoB should be above. I'll fix that when applying.
>
> Some people agree with this... but b4 disagrees, so I would say the
> tools should implement the right process and right decisions. We should
> not be correcting the tools' output, unless the tools are not correct -
> then fix the tools.

Ah, interesting. I checked and as far as I could tell Richard had
manually added the tag when sending v2, so I didn't assume it as a
tool-added tag. I'm happy to let "b4" be the canonical thing that says
what the order should be.

OK, so I just tried this and I'm confused. I ran:

b4 am -P_ 20230201-innolux-g070ace-v2-2-2371e251dd40@skidata.com

...and when I check the patch that b4 spits out my "Reviewed-by" tag
is _after_ the "Signed-off-by" tag, just like I asked for.

Just in case Acked-by was somehow different than Reviewed-by, I went
back to the original version where you added the Acked-by:

 b4 am -P_ 20221118075856.401373-1-richard.leitner@linux.dev

...and, again, it matches the order that I thought was right. In other
words, the patch file generated says:

> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

My "b4" is from Dec 1 of last year, so maybe something changed? Let's
update! OK, I synced b4 and now I'm at v0.12.2 from Match 10 (MARIO
day!). The behavior is unchanged.

Did I get something wrong in the above?
