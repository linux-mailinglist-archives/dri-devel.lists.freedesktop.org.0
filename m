Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D964385E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 23:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE97E10E2B9;
	Mon,  5 Dec 2022 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D0A10E08C;
 Mon,  5 Dec 2022 22:49:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEF33611D5;
 Mon,  5 Dec 2022 22:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A49CC433D6;
 Mon,  5 Dec 2022 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670280573;
 bh=vtkCzJjaJz2NbCG4zHvNZrsu3+zbmbPfubvrskhvQBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhX4/H7ukZhrhq3B+SvY//EcSTOKrlc87WikbOP91kXi5/d/i7lhqXJuZOOwGP793
 Mq/V/RRiUjq1NJNe/7Zgg+GmY/GE7Z0+NAG/qlOBABZ+C46Gz0mkTJP4/7VispO9CP
 o2kATitKDlvHTbV7ENWP/NNF/lZZ+gtqO2E6ugeuz+ZtIFep4mDRc7RBLelT9LFzdR
 rVYEVWVQLNP/88/PAAe4RheFAQ7FCGvjJs+JtvtSpSNkaHZDuUUtVVzQElTqrckGk7
 QAxK9FYAq4zpGHbO5oMfXo7IvhD4JMUB3KEcdEiNIXQjzFHDUfymy1wwKd8Gfe4CYb
 6wcjeazDtR/vQ==
Date: Mon, 5 Dec 2022 16:49:29 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sm6115: Add WCN node.
Message-ID: <20221205224929.jlvrgrt4nth2bd7u@builder.lan>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-12-a39.skl@gmail.com>
 <382df687-c535-4dd6-125a-5f3b6022cbd2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <382df687-c535-4dd6-125a-5f3b6022cbd2@linaro.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 01, 2022 at 11:38:16AM +0100, Krzysztof Kozlowski wrote:
> On 30/11/2022 21:09, Adam Skladowski wrote:
> > Add WCN node to allow using wifi module.
> > 
> 
> A nit: Drop full stop from commit subject.
> 

Done. Thanks for pointing it out :)

Regards,
Bjorn

> Best regards,
> Krzysztof
> 
