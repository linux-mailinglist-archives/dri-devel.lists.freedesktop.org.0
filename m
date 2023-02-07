Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFA68E20B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 21:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C557C10E5E0;
	Tue,  7 Feb 2023 20:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0430310E5D9;
 Tue,  7 Feb 2023 20:41:20 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id p185so13753151oif.2;
 Tue, 07 Feb 2023 12:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FZ+1P8WzhPm5R/qji+G1l7GfRk18RmqyDa6li0PrvI=;
 b=A2ZfSftaVE4fslM1mNgEW9WLcq3q4HFe1b4sOsPdUZJrpu+Nddp9aQtuzoIskGXCeL
 H+I6nk5cl20Dz7bTP+JEUn09Dg4IPhdJv4YRLbYDPvc2M32GjY51XnG/srQMMtLXpRT7
 Ew1A1FWcBTqMGNichIRbTqT1RgtTE6qNGhMd4G0S8ZfNhQ3HCBBgWG/ffB0sqaFyBZ5T
 7wW2L1oZHqRAMPNFFofmwhZnOP+ZOjNPA+fNdFXXqY5UXvSsjRoZ8eKhmvmhYYstcZQa
 GxXcBzWqO4QGvfSprkJ2cpadOLmw02CUM3dcWk7b6o5U1rHOVUwQQTZ3gFwm5Xf+5FD3
 BG/A==
X-Gm-Message-State: AO0yUKW7aHWns4uRG1voOlQjZ/GxPyfabvjLjGuePx6fXclwoo6kGMlu
 ZVdAFK2liDNAlWYZiXRTJwGlmEd9pw==
X-Google-Smtp-Source: AK7set/ZzBfymzxPQ055ZgBNzCiGcWb2cKP1NDmXCNwf0UoZo2iTaxzmNRYE6FiS7CgQUUBIy2gS1g==
X-Received: by 2002:a54:468e:0:b0:371:fe1:8943 with SMTP id
 k14-20020a54468e000000b003710fe18943mr106451oic.6.1675802479102; 
 Tue, 07 Feb 2023 12:41:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a056808178c00b0035c21f1a570sm6128570oib.6.2023.02.07.12.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:41:18 -0800 (PST)
Received: (nullmailer pid 4119955 invoked by uid 1000);
 Tue, 07 Feb 2023 20:41:17 -0000
Date: Tue, 7 Feb 2023 14:41:17 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm/gmu: add Adreno 660
 support
Message-ID: <167580246437.4119306.9328093352336418931.robh@kernel.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206145707.122937-4-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 06 Feb 2023 16:57:02 +0200, Dmitry Baryshkov wrote:
> Add Adreno A660 to the A635 clause to define all version-specific
> properties. There is no need to add it to the top-level clause, since
> top-level compatible uses pattern to define compatible strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

