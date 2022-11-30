Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34163E2F5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 22:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A850410E08C;
	Wed, 30 Nov 2022 21:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2282E10E4DC;
 Wed, 30 Nov 2022 21:51:12 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id t62so28793oib.12;
 Wed, 30 Nov 2022 13:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ed0ydWV+6MGo0R7QavnrcUotFip+FDP5jOASQ/l4gg4=;
 b=gBC+MlSDIUjZruoCy5Z2sVoz4Nfvjq69y2svWVY1T1kPym8l++zsNRADAPxjztrhXo
 bd+g21Be0YfVBmGPOTSN+GBrVLnmMOJEBUjnEWUOXvoIoBAZVblTm5ttIWeV6SzyRwF0
 JR2yD8LB1HZgJCTk7aw4r8rUE4D91rwOeaUXSyXlUlhZ34xiuwzCKZX9IXOzBz6Z1Tw5
 Abt8l76sWT1AACdr/82ntjLRpE8x1Rr8B7ELDxjlfTG1RAd8Dtf0Yo8BLFP/v005xpuz
 FzrG2pUX4IM4qF20q28kvgtvRattXHDd34qcFdGJfATA11HvP9XXh6AjBiFsLJZncuIr
 fFfw==
X-Gm-Message-State: ANoB5pmmVhdkD+Vw9WP6SkT4OtKf/cSCzCBvmCeftC652EeP3olPGQCg
 qtNAxrjoI8ABjSiLDpDUrg==
X-Google-Smtp-Source: AA0mqf7J8e2oXFovz2VgTSEz3/EdPmTWw6BjtL7XC784CxAbJ1Z+zs/qpUiq5LLxHKDpZyxShWaJRA==
X-Received: by 2002:a05:6808:14d1:b0:35b:92a4:fcae with SMTP id
 f17-20020a05680814d100b0035b92a4fcaemr13100578oiw.102.1669845071240; 
 Wed, 30 Nov 2022 13:51:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 185-20020aca05c2000000b0035b7002af8csm1057826oif.56.2022.11.30.13.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 13:51:10 -0800 (PST)
Received: (nullmailer pid 2988879 invoked by uid 1000);
 Wed, 30 Nov 2022 21:51:09 -0000
Date: Wed, 30 Nov 2022 15:51:09 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 03/18] dt-bindings: msm: dsi-controller-main: Rename
 qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl
Message-ID: <20221130215109.GA2986716-robh@kernel.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-4-bryan.odonoghue@linaro.org>
 <dc5df66c-2e2b-14f1-ce88-705d831f37d9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc5df66c-2e2b-14f1-ce88-705d831f37d9@linaro.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 david@ixit.cz, dianders@chromium.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 swboyd@chromium.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 26, 2022 at 08:54:11PM +0200, Dmitry Baryshkov wrote:
> On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> > We will add in a number of compat strings to dsi-controller-main.yaml in
> > the format "qcom,socname-dsi-ctrl" convert the currently unused
> > qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> I'd say, as you are going to introduce new bindings using two compat
> strings, just leave this binding as is, marking it as deprecated.

But if it was unused, then it's okay to just change it.

Rob
