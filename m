Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C772CFB81
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 15:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591F6E41D;
	Sat,  5 Dec 2020 14:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF1B6E41D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 14:09:19 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Nicolas Chauvet <kwizart@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Peter Geis <pgwipeout@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Viresh Kumar <vireshk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v11 00/10] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Date: Sat,  5 Dec 2020 15:09:11 +0100
Message-Id: <160717730565.9414.18193998919736710677.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203192439.16177-1-digetx@gmail.com>
References: <20201203192439.16177-1-digetx@gmail.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Dec 2020 22:24:29 +0300, Dmitry Osipenko wrote:
> This series brings initial support for memory interconnect to Tegra20,
> Tegra30 and Tegra124 SoCs.
> 
> For the starter only display controllers and devfreq devices are getting
> interconnect API support, others could be supported later on. The display
> controllers have the biggest demand for interconnect API right now because
> dynamic memory frequency scaling can't be done safely without taking into
> account bandwidth requirement from the displays. In particular this series
> fixes distorted display output on T30 Ouya and T124 TK1 devices.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: memory: tegra20: emc: Document opp-supported-hw property
[02/10] memory: tegra20: Support hardware versioning and clean up OPP table initialization
[03/10] memory: tegra30: Support interconnect framework
        commit: 01a51facb74fb337ff9fe734caa85dd6e246ef48

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
