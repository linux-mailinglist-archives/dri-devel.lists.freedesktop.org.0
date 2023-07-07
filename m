Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061FE74A867
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 03:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71ADF10E4EA;
	Fri,  7 Jul 2023 01:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49AB10E4EA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 01:20:57 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7659924cd9bso138085685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 18:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688692855; x=1691284855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2UKbsXjIV8t0bNo3+5XMu9R1qmCrIyv3QUJNj0OXNA=;
 b=ctLmSZEpEcHsA8HF3QPA3OqInZwbAZJXzU0OJ3YK/RcPJLE7NmUbpxsfsnWop9L+BT
 7FK8pLuBU51M4V8uXnZx0UnUFBByZ48cNxu4EZ4gGsECUKw6wrLRMtlHXRPta+RgcLFN
 rP2GPR4COtW9JcWdW+zPcszEDAAYs492W5qspxnAt5sHSO1LTQsP8QIMthdSLWv2IMgV
 T8Tvj1LiiBTk7wrDKOe7T3x0bVxZAtLaD9P5uEYV1WvI4EGP06NXtFvOUvgwz3H7EMFg
 PpMLx9gRl9PRGVLmuaB8XTmkHAqRiPQldNDJRSOk2JAvCoXI+KWnz3+GYZopUOI8ibSo
 pBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688692855; x=1691284855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2UKbsXjIV8t0bNo3+5XMu9R1qmCrIyv3QUJNj0OXNA=;
 b=BC0vmbWCTOzOQ/NfA/3zB9wLQxnKpk6eYuOk4ZdJNsX5V5BPh8secUmwhqL1Cjerss
 zRIZXWQUg3VEmgz6HThyk+jfXTpWPTFbiPtEZF12n2eU2k9BWoLwD6hJlmRrBMX2q51u
 PWIH0DX5xXkbtsddoUW8D8XKUH7A2kmWNCaxk8TSJk33xfoka3FWfuzX+2KAxlV1pTno
 Gqt3X1uuQAOoyRF2rVpg8BEthu/NBbZ8VLVZLfSqsVPZaueiiyreI5rzk0O4MSm6sfH9
 5gKqWm7gxenqQ11tqi9b1mTX/MDqcBjLKJuQJNh2JbLHHYaYlNMuBcEHgnnRiFecpZDN
 7r8Q==
X-Gm-Message-State: ABy/qLaOM/YLzfE+8ZuMPOAPJoul+NEIQ+yaWBKakmSuzixXtiJchwrs
 V4GK0QsmPNAuwF0gdZpNPLsXhGDhLm95qGtRaoyKUQ==
X-Google-Smtp-Source: APBJJlE4T4YIU8f3z0e/h2ykXYlpQ92wsSWXoQc9pkifXtirpugJMgP7Edi1IDhO+FGNLU62rrQW0P+SFbAz1NbW+m4=
X-Received: by 2002:a05:620a:2b24:b0:765:ab7c:895e with SMTP id
 do36-20020a05620a2b2400b00765ab7c895emr3870451qkb.24.1688692855395; Thu, 06
 Jul 2023 18:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230704050744.1196293-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WNLcw2JbMf7tfob2KgjB8eXTC0p1J4OYnQL4k3Mz3mgA@mail.gmail.com>
In-Reply-To: <CAD=FV=WNLcw2JbMf7tfob2KgjB8eXTC0p1J4OYnQL4k3Mz3mgA@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Fri, 7 Jul 2023 09:20:43 +0800
Message-ID: <CAHwB_NJbtvXNCFj5=NMBXWCt1S1_WrgGij2Kqdr1omno66kVUw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add avdd/avee delay for Starry-himax83102-j02
 and Starry-ili9882t panel
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 7, 2023 at 3:32=E2=80=AFAM Doug Anderson <dianders@google.com> =
wrote:
>
> Hi,
>
> On Mon, Jul 3, 2023 at 10:07=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > From power on/off sequence for panel data sheet[1], T2 timing VSP to VS=
N
> > needs 1ms delay when power on, and VSN to VSP also needs 1ms delay when
> > power off. Some pmic may not be able to adjust the delay internally, so
> > let's add a delay between avdd/avee regulator gpio to meet the timing o=
f
> > panel.
>
> Unless I'm mistaken, all of this is best handled via regulator
> constraints in the device tree. See the file:
>
> Documentation/devicetree/bindings/regulator/regulator.yaml
>
> Specifically, any delays related to actually ramping up / down the
> regulator can be specified in the device tree. Nominally, you could
> argue that the 1 ms delay actually _does_ belong in the driver, but
> IMO the 1 ms number there is really just there because someone thought
> it was weird to specify a delay of 0 ms. Given that you already need
> remp delays in the device tree, it feels OK to me to just include the
> 1 ms there.

The regulator device tree has only the power on attribute
"regulator-enable-ramp-delay",
not has power off attribute. The regulator delay looks more like the
HW voltage requirement
of the power ic itself, and I just want to meet the panel spec
requirement. I add regulator-enable-ramp-delay
in dts he can also meet my requirement, but I have no way to control
the power off delays.

Thanks Doug.

>
> -Doug
