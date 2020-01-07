Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2531132FDE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 20:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7296E132;
	Tue,  7 Jan 2020 19:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263AA6E132
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 19:52:26 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBF98222D9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578426746;
 bh=2Rt8QBkwsT8hqHrj/Cy8k8w71wAL2Fyl80RFLWrMlDQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qbe4WB003BufWRMI4iq8w+Eqbb0/XzH/5VFJ4sUA2f6I46f+wJWlRs3m7PPnNmscu
 iYpIRQVE9zDpIqymWuqn6KX0x/H6fdTLf+TYLvytFj6CaKIzihHrrfFT32dIO+OCOz
 RGAwSYy24SQCRTSY9kHlwjzxSCGJQ9isHIqa05iA=
Received: by mail-qk1-f176.google.com with SMTP id 21so537473qky.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 11:52:25 -0800 (PST)
X-Gm-Message-State: APjAAAV9gwQqNpAhiYWF6/Ddhm8D6uSjtqLQn3ewtpB1L1ad5qWkClHG
 qrQ89r1cTNLbJWgDZmFO8vN6sk9cpVv1aNRt1g==
X-Google-Smtp-Source: APXvYqydWfBVAnZIKKmVTsP2BSuvkrTyEB6Wnb6j0Ux07qk+ik6JM+AXfglu7IoQ0c/w36bS6FRPyi67+RTkoOkatM0=
X-Received: by 2002:a05:620a:135b:: with SMTP id
 c27mr904157qkl.119.1578426745034; 
 Tue, 07 Jan 2020 11:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org>
 <20200102101712.5085-2-sam@ravnborg.org>
In-Reply-To: <20200102101712.5085-2-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Jan 2020 13:52:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLdbS5W0xZq_TfLmWh8J6+t1arvzov85rtj3UXuK0QRaQ@mail.gmail.com>
Message-ID: <CAL_JsqLdbS5W0xZq_TfLmWh8J6+t1arvzov85rtj3UXuK0QRaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: one binding file for all simple panels
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 2, 2020 at 4:17 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> There is an increasing number of new simple panels.
> Common for many of these simple panels are that they have one
> mandatory power-supply and some of them have backlight and / or
> an enable gpio.
>
> The binding file to describe these panels adds overhead
> that really do not add value.
> The binding are known and there is nothing gained from a
> dedicated binding file nor for any dedicated example.
>
> The following patch introduces a single panel-simple.yaml
> and converts two ampire bindings over to the new file.
>
> The conversion - if applied will have following effects:
>
> - The maintainer for the individual file will change
>     There is no need for many different maintainers for a simple binding.
>     We have the same situation with the panel-simple driver in the kernel.
>
> - The license will change to (GPL-2.0-only OR BSD-2-Clause)
>     There is usually only a single line copied from the original
>     file, a line that is often copied from a datasheet.
>     This license change should be acceptable considered what little
>     is copied.
>     If the license change is not OK we can use a dedicated binding
>     file in these cases.
>
> This is a follow-up on Rob's big patch converting a lot of panel bindings
> to individual files:
>
> "dt-bindings: display: Convert a bunch of panels to DT schema"
> https://patchwork.ozlabs.org/patch/1197683/
>
> The objectives with one file for the relevant simple panels are:
> - Make it simpler to add bindings for simple panels
> - Keep the number of bindings file lower and thus easier to find a
>   relevant file to copy from when adding new panels.
> - Keep the binding documentation for simple panels more consistent
> - Make it simpler to add support for new panels
>
> v2:
>   - spelling fixes (imirkin via irc, Rob)
>   - updated description (Rob)
>   - list properires in alphabetical order
>   - added power-supply to example (Rob)
>   - updated title
>   - reworded changelog a little
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 -------------
>  .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
>  .../bindings/display/panel/panel-simple.yaml  | 59 +++++++++++++++++++
>  3 files changed, 59 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
