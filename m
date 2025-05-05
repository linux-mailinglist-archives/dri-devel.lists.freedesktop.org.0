Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6487CAA9276
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 13:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FF310E325;
	Mon,  5 May 2025 11:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OBaK1A2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D3A10E294;
 Mon,  5 May 2025 11:56:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B635D5C4808;
 Mon,  5 May 2025 11:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91311C4CEE4;
 Mon,  5 May 2025 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746446200;
 bh=bhylBd3wO/oU3H4pz2cS+C+DeqobvL/gAITFSoI+DlI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OBaK1A2ACY5mLHZc1RwNmwdp3qGVhRPpfBpIBc11MpDdTgvZjzJh9c2HqD1j/xbtF
 IE3axwUzyoBNXJJ9wLAZrwk/C5ae9vmLf+t52fKUMymHOy8rLX7A/TqYZDsgIjmxJO
 uqRWlNO0+YLXrPDFvUm39DtT/cGgYkARn3xxiCBrZ2IsI7xVrutO9LTBggxr7tyo3O
 Ew0kuk3bVIOPSA41viB1pvME5VT2HftocjkLZGxd/CD0ih9duJtfPjYxm7uyH2I3Y+
 LWBUIscuFZsWPeiYe6cTPw8irWThpkd0fbUAw29CUnAaOBvzQ70iM6xL28Uvz7HSBp
 JM6Z0txoM6w3w==
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso707186566b.3; 
 Mon, 05 May 2025 04:56:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV0SRps6QY6g44EBT3Ow28r0uF5qjYtUNswUKi+9fE7nSB+Irp3HKibYd/F/unVb3YP5/aD2/BZYt4f@lists.freedesktop.org,
 AJvYcCX/C4I46OjyOViWm2es0feKxifkdRLNhIibJTb/93ug7QfiARJ86L1QwYsRxs+PARdMpPPOAKSdynA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1prP4M4bNZFn5UP4eejKoCMOhZtw2MrVX9dEXIG4+AFuBw6kU
 m+lTQcVHKm6/ZkuMKCQft0TILmL8u/OKuMy40BPTQT0dLAPPBxJS07VqugGgTo3jh45mJtxcOD9
 4Ah031MQIhhUUkbtPjrXIqpbSDQ==
X-Google-Smtp-Source: AGHT+IFS+UYRYhqu0qLApsmsVcQPU5PxbnUTRMgU4A8cLFv9VbzJgVSFzBJ4TlrMHVGbrQpwwBTff7ATCPn82nTV/yU=
X-Received: by 2002:a17:907:97c7:b0:aca:d52d:b59b with SMTP id
 a640c23a62f3a-ad19084ec5fmr805337566b.47.1746446199152; Mon, 05 May 2025
 04:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
In-Reply-To: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 06:56:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
X-Gm-Features: ATxdqUFnhjeEjXeL57DSByQBGcanFON-MWfWdUb7FuuvpsF2gYXLeAeEkshoH0k
Message-ID: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

On Sun, May 4, 2025 at 11:13=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
>
> On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> > A set of not quite related bindings warnings fixes.
> >
> >
>
> Applied, thanks!
>
> [02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc =
path
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

And now there's a warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm8350-mdss.example.dtb:
display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names:
['mdp0-mem', 'mdp1-mem'] is too short
        from schema $id:
http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm8350-mdss.example.dtb:
display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects:
[[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295,
1, 0]] is too short
        from schema $id:
http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
