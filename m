Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3C919E58
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 06:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7947310EA04;
	Thu, 27 Jun 2024 04:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C6C10EA04
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 04:46:42 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so101504691fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719463596; x=1720068396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKv2o+iwUcFccFiTIdN0pCkxYMcGxRiXtYwoj0O/Tas=;
 b=mtN4oY5bwQby5GFRcTQSANTaO/SgghG0q2ox0Aes7pd2j3ZR/CI2NswkJSKCt3mm2q
 I0fywYHzkQ+DsqPYMZFKmWpdDs7SdM+4TM0rwuAJBKc1js7SeiTBPE8AtkvSagjEZBj2
 WYlOdWbPGYlLakJRbuvtlQvsRHALSE8P8cCLywBVgQ5K17o/HX1Cvjj+GhfKa5D1d0y3
 9v1OKafZpJApoYJ7CbJtkc3PjyD720ArG/rrX96XeTU9F9/uT8XnNVdARPy48ES7lflQ
 nx1fICKexLk8h8sRpgMUVAACwMJ+lDm0Db7uLfe/be89tpA9X9G186zoa+DUB74387lD
 Y2yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZiUTZ/n7tbBGvNTsjyLmJk7KXQC+X4M1UFgbElhEjB9GtUlBeIwjUYrFzMb6AlnA3xLALaOxvvoktjVgJCthlRtzSsgKu7ugVAY9V1SGY
X-Gm-Message-State: AOJu0YxN44/Ry8esYYjXOlmXt9c0HQnZHtsjDGRrUAqRJNv5FQFPqw/l
 unpX4wT+R5ufllJMI4BPV4M0BEkN/ZiAVgp4fjfT8AJ+LFp8nrPSXSG7rrFT
X-Google-Smtp-Source: AGHT+IHeVFfmtMDHg4cWqzhY8W0gAsPn7t7OweAkMUMSuI2dPU860ZfHhNHSIpiudcUN4Eh1lLT0tA==
X-Received: by 2002:a2e:321a:0:b0:2ec:4d8a:785a with SMTP id
 38308e7fff4ca-2ec5b2c4e90mr101349951fa.4.1719463595569; 
 Wed, 26 Jun 2024 21:46:35 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a4bf5c8sm1060751fa.126.2024.06.26.21.46.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 21:46:34 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso99587731fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWgzEPeJjufUSqOFQ4PSw49ZOAX7PsRkRVmNg/S7IAQh96+Adx/daMlFMx1kJU8jWurg3DNqEhD+XJFkMfgPTs4b1IOPZaEZKHthDsC+g3k
X-Received: by 2002:a2e:7c07:0:b0:2ec:4f0c:36f9 with SMTP id
 38308e7fff4ca-2ec5b31d140mr101577061fa.36.1719463593379; Wed, 26 Jun 2024
 21:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
 <DM6PR01MB58047C810DDD5D0AE397CADFF7C22@DM6PR01MB5804.prod.exchangelabs.com>
 <87wmmjfxcj.fsf@oltmanns.dev>
 <DM6PR01MB58043A518B836D1CC3509554F7D62@DM6PR01MB5804.prod.exchangelabs.com>
 <1b359d7e-fe85-48ca-87aa-37ab7e34aaf6@oltmanns.dev>
 <CH2PR01MB57990FBF72970DECF96294E2F7D72@CH2PR01MB5799.prod.exchangelabs.com>
In-Reply-To: <CH2PR01MB57990FBF72970DECF96294E2F7D72@CH2PR01MB5799.prod.exchangelabs.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 27 Jun 2024 12:46:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v64hwUcU5QntuJgFi3mvBzbgTrG4_vuErDB8X1jKNMgvOA@mail.gmail.com>
Message-ID: <CAGb2v64hwUcU5QntuJgFi3mvBzbgTrG4_vuErDB8X1jKNMgvOA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and maximum
 rate
To: "Pafford, Robert J." <pafford.9@buckeyemail.osu.edu>
Cc: Frank Oltmanns <frank@oltmanns.dev>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 27, 2024 at 9:23=E2=80=AFAM Pafford, Robert J.
<pafford.9@buckeyemail.osu.edu> wrote:
>
> Frank Oltmanns <frank@oltmanns.dev> writes:
>
> > Hi Robert,
> >
> > 26.06.2024 18:03:24 Pafford, Robert J. <pafford.9@buckeyemail.osu.edu>:
> >
> >> Hi Frank,
> >>
> >> Moving to a new for loop makes sense. Let me know when you have a patc=
h
> >
> > The patch is here, strange you didn't receive it:
> > https://lore.kernel.org/all/20240623-sunxi-ng_fix_common_probe-v1-1-7c9=
7e32824a1@oltmanns.dev/
>
> Ah, this must have slipped through my inbox. I just applied it on my boar=
d and it is
> now cooperating with the min/max clock rates!

Please reply to the thread and give a Tested-by.

ChenYu

> >
> >> and I'll be glad to test it on my board. I do also wonder if this may
> >> have contributed to some of the HDMI issues seen in the other thread.
> >
> > My thought's exactly!
> >
> > Best regards,
> >   Frank
> >
> >>
> >> Best,
> >> Robert
> >>
> >>> Hi Robert,
> >>>
> >>> I'm truly sorry for the trouble the patch has caused you and for my l=
ate
> >>> reply!
> >>>
> >>> On 2024-06-14 at 23:52:08 +0000, "Pafford, Robert J." <pafford.9@buck=
eyemail.osu.edu> wrote:
> >>>>> The Allwinner SoC's typically have an upper and lower limit for the=
ir
> >>>>> clocks' rates. Up until now, support for that has been implemented
> >>>>> separately for each clock type.
> >>>>>
> >>>>> Implement that functionality in the sunxi-ng's common part making u=
se of
> >>>>> the CCF rate liming capabilities, so that it is available for all c=
lock
> >>>>> types.
> >>>>>
> >>>>> Suggested-by: Maxime Ripard <mripard@kernel.org>
> >>>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >>>>> Cc: stable@vger.kernel.org
> >>>>> ---
> >>>>>   drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
> >>>>>   drivers/clk/sunxi-ng/ccu_common.h |  3 +++
> >>>>>   2 files changed, 22 insertions(+)
> >>>>
> >>>> This patch appears to cause a buffer under-read bug due to the call =
to 'hw_to_ccu_common', which assumes all entries
> >>>> in the desc->hw_clocks->hws array are contained in ccu_common struct=
s.
> >>>>
> >>>> However, not all clocks in the array are contained in ccu_common str=
ucts. For example, as part
> >>>> of the "sun20i-d1-ccu" driver, the "pll-video0" clock holds the 'clk=
_hw' struct inside of a 'clk_fixed_factor' struct,
> >>>> as it is a fixed factor clock based on the "pll-video0-4x" clock, cr=
eated with the CLK_FIXED_FACTOR_HWS macro.
> >>>> This results in undefined behavior as the hw_to_ccu_common returns a=
n invalid pointer referencing memory before the
> >>>> 'clk_fixed_factor' struct.
> >>>>
> >>>
> >>> Great catch! At first glance, it seems to me that calling
> >>> clk_hw_set_rate_range() in sunxi_ccu_probe() should not have happenen=
d
> >>> in the loop that iterates over the hw_clks.
> >>>
> >>> Instead we should add one more loop that iterates over the ccu_clks.
> >>> Note, that there is already one such loop but, unfortunately, we can'=
t
> >>> use that as it happens before the hw_clks loop and we can only call
> >>> clk_hw_set_rate_range() after the hw_clk has been registered.
> >>>
> >>> Hence, I propose to move the offending code to a new loop:
> >>>         for (i =3D 0; i < desc->num_ccu_clks; i++) {
> >>>                 struct ccu_common *cclk =3D desc->ccu_clks[i];
> >>>
> >>>                 if (!cclk)
> >>>                         continue;
> >>>
> >>>                 if (cclk->max_rate)
> >>>                         clk_hw_set_rate_range(&cclk->hw, common->min_=
rate,
> >>>                                               common->max_rate);
> >>>                 else
> >>>                         WARN(cclk->min_rate,
> >>>                              "No max_rate, ignoring min_rate of clock=
 %d - %s\n",
> >>>                              i, cclk->hw.init->name);
> >>>         }
> >>>
> >>> I haven't tested (or even compiled) the above, but I'll test and send=
 a
> >>> patch within the next few days for you to test.
> >>>
> >>> Thanks again,
> >>>   Frank
> >>>
> >>>>
> >>>> I have attached kernel warnings from a system based on the "sun8i-t1=
13s.dtsi" device tree, where the memory contains
> >>>> a non-zero value for the min-rate but a zero value for the max-rate,=
 triggering the "No max_rate, ignoring min_rate"
> >>>> warning in the 'sunxi_ccu_probe' function.
> >>>>
> >>>> [...]
>
> Thanks,
> Robert
