Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3F170149
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 15:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DE66E995;
	Wed, 26 Feb 2020 14:34:07 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17196E995
 for <dri-devel@freedesktop.org>; Wed, 26 Feb 2020 14:34:05 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0CF724687
 for <dri-devel@freedesktop.org>; Wed, 26 Feb 2020 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582727645;
 bh=cSeb/7OP0qIGCqurmVCFUiuRZAbhfJ7k+1e0bkEwtGY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zJuOqIMIDAfRRIhLJkghYWtXK0gr2o3uClFKZ7g5RU4dv2idQTdXaBjJkBLLLV8Ah
 P/FU3qUG67jF/VGsL6nI0ARTmCtdhFOTZ67Y19gOyMRdf8dz4n4ncbbj1Eq42wwA2V
 k7aalkOtNybRZX6/n2x9CnQ1+9zotjPpSaXHeCEk=
Received: by mail-qk1-f175.google.com with SMTP id 11so2819493qkd.1
 for <dri-devel@freedesktop.org>; Wed, 26 Feb 2020 06:34:05 -0800 (PST)
X-Gm-Message-State: APjAAAV097+khavJ/tWfSyVhJM4A+Wm39p9/pwpAjmAFd9NUB9KDuqIw
 ZAepbwMR3R+uYtVdRkOc/P3zxg3tKW0CSNMVnQ==
X-Google-Smtp-Source: APXvYqxF1n1ezucAucxSMjTGsOoyu906lkDp/t3rDwiUT3lf64Vd7QDwncmsJhlHvgESuk6pwqSFVCNKXABjurrn7mU=
X-Received: by 2002:a37:a750:: with SMTP id q77mr5797388qke.119.1582727644756; 
 Wed, 26 Feb 2020 06:34:04 -0800 (PST)
MIME-Version: 1.0
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
 <20200220203509.GA14697@bogus>
 <6a7c1f39-a85f-4a99-fed3-71001bdb6128@codeaurora.org>
In-Reply-To: <6a7c1f39-a85f-4a99-fed3-71001bdb6128@codeaurora.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Feb 2020 08:33:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKVNENPZKbCy4FrGRO=D79hBL3keuE-U2tTwDVViCrdPQ@mail.gmail.com>
Message-ID: <CAL_JsqKVNENPZKbCy4FrGRO=D79hBL3keuE-U2tTwDVViCrdPQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 5:17 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
>
> On 2/21/2020 2:05 AM, Rob Herring wrote:
> > On Thu, 20 Feb 2020 13:42:22 +0530, Sharat Masetty wrote:
> >> This patch adds a clock definition needed for powering on the GPU TBUs
> >> and the GPU TCU.
> >>
> >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >> ---
> >>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clock-names: ['bus', 'iface'] is too short
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clocks: [[4294967295, 123], [4294967295, 124]] is too short
> >
> > See https://patchwork.ozlabs.org/patch/1241297
> > Please check and re-submit.
> Hi Rob, These issues seem to be from the original code and not related
> to my patch. Are these going to be blocking errors?

There are no errors in this binding in mainline. You've added a 3rd
clock when all the existing users have exactly 2 clocks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
