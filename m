Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE294521257
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DD110F7BD;
	Tue, 10 May 2022 10:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1610F7BD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 10:38:09 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id m190so18355506ybf.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 03:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18Z/sTz+IhJS4WIQidF8Pkf7x0QFtzeGTd5zgt1XcsI=;
 b=mce5YmBbmq67J2zhZTHGEv91yobyh5mk7B2CT3fMjjAqcnjQubzRIntpwRppCEnqp+
 rmbixFACXH1Fa3+8SQbPTl8SgT/K4WNPHtxz5QmUUgQ0SUdbjb5qhG6im/W3dUulSp/u
 HJ+wUlbTR0YAU9r1YHMPQhrxD5BLUFa1TOZJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18Z/sTz+IhJS4WIQidF8Pkf7x0QFtzeGTd5zgt1XcsI=;
 b=7hFOyBpVneNZLbxf4NP9TLTmWyBIR/roOAqO3ifU3QIy4+cBIIAmWkZ+QttJWcGh0B
 f2aqux8mrDIIUVBycP/mQ+ruAV2UHuhgn3+htzU5wd6OBD3Oh0cg6PcxWmvaMyMagtms
 Iu9kd9QoJw6der5p8GfRTeJU2AKI2xi5lV6KEwz343Mux5JAxtES7JOYOvzduEtLFsHN
 RskcYydtDXrib549JuBr7BQog3G/iIKFX7oZsK0NAVsxjbNLdo7sfzHUFFS1AZ0vi55C
 nMGiBbCeJv3dTj6SUiSpIw3ZJAb7HWuvO+cHIMUTk4JymH3TWYpbVT/Y8e8TN9dn0WG0
 KY/w==
X-Gm-Message-State: AOAM532NOfYQfBrg52fp2YKoFIx2zvVMTZaYSgPtCTxp0ZDIa8gzGkkH
 kboAxoSmFvDlNsg1wWdNrn3LQB0w9PIphDglwkTx9w==
X-Google-Smtp-Source: ABdhPJydfNAKQMhJh5sK/HAXZvb2Kunl4GtH2wnKZ/ZK7z6LCCVG+1efFg9HYbdUR9Jq5koVxnXByhS4ux49LykcTBs=
X-Received: by 2002:a05:6902:1501:b0:649:ff91:5409 with SMTP id
 q1-20020a056902150100b00649ff915409mr17647450ybu.278.1652179088847; Tue, 10
 May 2022 03:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
 <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
In-Reply-To: <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 May 2022 18:37:57 +0800
Message-ID: <CAGXv+5EHFjqiVQbXgcJWCo+TmaTU_z4e0g85beMLCNjyx5qJcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 6:28 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/05/2022 10:45, Rex-BC Chen wrote:
> >>> +    soc {
> >>> +        #address-cells = <2>;
> >>> +        #size-cells = <2>;
> >>> +
> >>> +        vdo1_rdma0: mdp-rdma@1c104000 {
> >>
> >> Generic node name. dma-controller (if it does not conflict with
> >> dma-common.yaml schema)?
> >
> > We don't understand what dma-controller you are referring to? Can you
> > help explain more? Thanks!
>
> Use a generic node name, as Devicetree spec asks:
> "The name of a node should be somewhat generic, reflecting the function
> of the device and not its precise programming
>
> model. If appropriate, the name should be one of the following choices:"
>
> I proposed dma-controller, but feel free to find better generic node name.

dma-controller is covered by dma-controller.yaml, which references
dma-common.yaml in its entirety, so I don't think that would work.

What about "blitter"? I think that is a generic term that is/was commonly
used with display hardware and sort of describes the function of the RDMA
& WDMA blocks, and if only one side is memory and the other is the display
pipeline.


Regards
ChenYu
