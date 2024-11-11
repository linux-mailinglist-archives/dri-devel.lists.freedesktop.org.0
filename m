Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAEE9C432D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 18:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441E710E0AD;
	Mon, 11 Nov 2024 17:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fPLqLaiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0BD10E0AD;
 Mon, 11 Nov 2024 17:06:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6EBB7A4175D;
 Mon, 11 Nov 2024 17:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27547C4CEDC;
 Mon, 11 Nov 2024 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731344813;
 bh=feWL9fgmmw9QG92svt4ITVSK7A6maEehKtjcSkF0SEQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fPLqLaizjJbk1Iwqs/BZnTbAdagLPzisXvNNbhWyaLKHrvoma1CBBYF7FS2u1c1mP
 fNo+21tb+XpqWV9rtA1eu3k+EXUI8oVtYBw4VUEqs6oQeP7TqMjRbXi3nmI4MKwl++
 GqYN0LNBrqpByijyayZtqlTrMS8b2c3aiLsrXo+0m4zDrCjnJ2ylKgbYSKn3AN0L/q
 RQGf5ZdjWBjOQk9Hk9KZyqPnQDfk6CqEQc/U/LSlvdnN8HzKdCKG321AOFGHWToTIT
 XefUPtjAP5ftbSDo9XtJ98BzT8jON61E2gHMiFOfTITNSsLHNrVZ8KaylrOobLQNIF
 zP7ygysk+2nDg==
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e33a8c84b9aso1144103276.0; 
 Mon, 11 Nov 2024 09:06:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+BIz6nzPRqJARuQd8V7UBg1UHyT6Z7AG7Z3LSZ/0lcoaCe2DuyZXBQov7avrkl89PWtDDpTaOU9r2@lists.freedesktop.org,
 AJvYcCXqGVWayqLwaze10f1RUQVE29SNmh65JceUju0PSaaKTjIeDVUbkGvIViLRoQ3VaRM3Tdg2oZ19c48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpDNm6p0SXRXd8YMn3gDzbOg1fZ/imO4hxzYdT9HJ5py5rf+OA
 cJ7D3k8d8JQSA0H7KbySLsBy++ScVIltwSiz9i/V4NoPb/45ZutGiPWa6JRUrkJftOAJV5gE1CO
 x0WbtCl8JrAuL1qw7jYJmsPcUdQ==
X-Google-Smtp-Source: AGHT+IEg+ZdXyhSVjowIdMTiFtczDqq6/O1NAD+xe1ZO9PXm0V/eW6I+PrJSsMZu5rrCYy4oAydNqSZhcQKsejZ/zxs=
X-Received: by 2002:a05:690c:6b11:b0:6e2:ab93:8c68 with SMTP id
 00721157ae682-6eadddaf35cmr116692697b3.25.1731344812198; Mon, 11 Nov 2024
 09:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
 <20241009-patchv3_1-v4-1-cd683a9ca554@quicinc.com>
 <ugkiv4m3etpydvosjkyzwr4qus74xnwccow7xrpvr77kzcx6bv@odlz7dzldqc5>
In-Reply-To: <ugkiv4m3etpydvosjkyzwr4qus74xnwccow7xrpvr77kzcx6bv@odlz7dzldqc5>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Nov 2024 11:06:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
Message-ID: <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Fri, Oct 18, 2024 at 6:00=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Oct 09, 2024 at 08:02:01PM +0530, Mahadevan wrote:
> > Document the MDSS hardware found on the Qualcomm SA8775P platform.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > ---
> >  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 +++++++++++++=
++++++++
> >  1 file changed, 241 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p=
-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mds=
s.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..37c04ae6876f873c2cddc51=
b5160b1f54e2b5118
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.y=
aml
>
> [...]
>
> > +
> > +        display-controller@ae01000 {
> > +            compatible =3D "qcom,sa8775p-dpu";
> > +            reg =3D <0x0ae01000 0x8f000>,
> > +                  <0x0aeb0000 0x2008>;
> > +            reg-names =3D "mdp", "vbif";
> > +
> > +            clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                     <&dispcc_ahb_clk>,
> > +                     <&dispcc_mdp_lut_clk>,
> > +                     <&dispcc_mdp_clk>,
> > +                     <&dispcc_mdp_vsync_clk>;
> > +            clock-names =3D "bus",
> > +                          "iface",
> > +                          "lut",
> > +                          "core",
> > +                          "vsync";
> > +
>
> It's been more than a week since Rob reported issues with the bindings.
> Any updates? Obviously I can not pick up patches with binding errors.

Well, someone picked up this version rather than v5 which appears to
have fixed it. So, probably need an incremental patch to fix the
warning in linux-next.

Rob
