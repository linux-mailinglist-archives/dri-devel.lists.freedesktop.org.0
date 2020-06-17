Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2E1FD129
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 17:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192B06E0F2;
	Wed, 17 Jun 2020 15:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187A46E0F2;
 Wed, 17 Jun 2020 15:38:33 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D353D20CC7;
 Wed, 17 Jun 2020 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592408312;
 bh=Mmp7l8nOqzeof+dCZUf8iwFZM9Tbqs2liNaByHyvJTY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Pm9/vwvV1GYPSlFq1DtZ0h59xVMS3OQ4/rltEd2e8Tn+nL+i4hD5bkpMD883BeMFv
 ZQPg6rW6Auf7WQ2HpUrXvLIbfkl2E5ZDN7DrZlhuR45UEwy/jSKYxXIbFa2jw5RMY+
 lXOKyeJDeU5Wcun4hSDQlc5NzcJDystAwjhrDfCo=
Received: by mail-ot1-f51.google.com with SMTP id n6so1985188otl.0;
 Wed, 17 Jun 2020 08:38:32 -0700 (PDT)
X-Gm-Message-State: AOAM531iarxVIn1cbdzT1gethUxVJ9ytf6R/a5tOgjH5yw4XKBk9aHh4
 upo18iZSVxATKAp4MnGkOOZws6dT4fg26D9FXQ==
X-Google-Smtp-Source: ABdhPJx+PoYXKyeUx8MAjbYQ1LRx9EEpUKsbhPm2Dbg1Vw8A/V17ptpVa4zGODoB4OocpKHaH/C7MvTr0HCPXdlZSBA=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr7446929ots.192.1592408312183; 
 Wed, 17 Jun 2020 08:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200612015030.16072-1-tanmay@codeaurora.org>
 <20200612015030.16072-2-tanmay@codeaurora.org>
 <159230611219.62212.8262135380349283774@swboyd.mtv.corp.google.com>
In-Reply-To: <159230611219.62212.8262135380349283774@swboyd.mtv.corp.google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 17 Jun 2020 09:38:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLsp6gR_=nA36usk67n7+EJOoxt-87R5zc1_DXpap5cag@mail.gmail.com>
Message-ID: <CAL_JsqLsp6gR_=nA36usk67n7+EJOoxt-87R5zc1_DXpap5cag@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: devicetree@vger.kernel.org, aravindh@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 5:15 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Tanmay Shah (2020-06-11 18:50:26)
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> > new file mode 100644
> > index 000000000000..5fdb9153df00
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> > @@ -0,0 +1,142 @@
> > +        data-lanes = <0 1>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                dp_in: endpoint {
> > +                    remote-endpoint = <&dpu_intf0_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                dp_out: endpoint {
>
> Just curious what is eventually connected here? This is possibly a
> question for Rob Herring, but I can't figure out how we're supposed to
> connect this to the USB type-c connector that is receiving the DP
> signal. Does the type-c connector binding support connecting to this end
> of the graph? Or should this connect to the DP phy and then the phy
> connects to the USB type-c connector node? Right now it is empty which
> seems wrong.

It should connect to the Type-C connector perhaps thru some sort of
switching/muxing node, but that's not really flushed out though. See
'dt-bindings: chrome: Add cros-ec-typec mux props' discussion with
your CrOS colleagues.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
