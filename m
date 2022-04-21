Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEBC50A231
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE6810E66A;
	Thu, 21 Apr 2022 14:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700F10E6A0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 14:27:16 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e604f712ecso5523496fac.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDgsoi129ZtoHuQ+rTXyXieKhhLblR7vzAhQBtHIUe0=;
 b=ZIujzzy08rxn0hfngK4WStnikFn+g7Y8IzH1/N6IlT+2UI9W380Cf+t8Q+6Un919it
 IFdejc4ql+StqfsY5urY6KtTu7RWIaGVZeK6VS3LHBru9TsebkCz+ztAVsczd089Y9dv
 6ewSdb4cH7QP4DrKkyHOb+vvlyccxOQuig3OHiFiMjZ12Kr5SYfNS8ETIYGLb3KqT4Cp
 7vG3o7Z6mwBvqbPCBXjeLgP0KLb+6NmBqpW/Oy8GwsNGVtN21g5zpPRn5oyJ1ObGiNgT
 LH2GnTWQ5oJQEBVvUWOAHjSWMjlN64UAFe8KZoF1p1loY6kTYs7UKsbDj7DW/cuSDMN3
 Bb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDgsoi129ZtoHuQ+rTXyXieKhhLblR7vzAhQBtHIUe0=;
 b=UxZGOlg3PzTGyruMO/7R6DQYhdZehvyVOMrj+DMAWroB6rZXTMFeWx1+W72I+jmIhd
 FvtQczqQSn6Q5aQaq4PiWf0AmWAPolpmCz1wNu9BR+/i4cFcvjtvrycMu5Ytb5DGuTQ7
 WcDU0Lq83czH2E5mM6xcIPNa4d8cw2S7BxUIgCnku3Fda/Wd1K6S8zNaLyhYHwGzo7MT
 ECViVnGlpWmhZVdG344caooFzoXx0pP67gjDO3H4q1nG3HdSS5nw4nYwr8Y7FdklfBrV
 xwkdODUVfbmAzeOE2S63N0LnOYGx9wxRg+gLYHYGe33Y3SThkS681R7XC/f9GNp5+8TU
 idsg==
X-Gm-Message-State: AOAM533kWgCLNqc1q1lwO3ip5Mf3hFKjEUTde3KiCYL72rLUxw1oZ5Dv
 0n2wJVXAEp8UJEFkiPU48PAhyg==
X-Google-Smtp-Source: ABdhPJzFW2dvWtIYFaaUj9JjINzXku3Vpzgn41MrM2kzsQSPJ4N6pSKOBN+zj2v9kPJ78IJW/RTSRg==
X-Received: by 2002:a05:6870:b427:b0:d3:5044:db1b with SMTP id
 x39-20020a056870b42700b000d35044db1bmr3815973oap.2.1650551236061; 
 Thu, 21 Apr 2022 07:27:16 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 07:27:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Andy Gross <agross@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: (subset) [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
Date: Thu, 21 Apr 2022 09:26:53 -0500
Message-Id: <165055095990.2574292.8144216013869218124.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
References: <20220401001810.81507-1-jo@jsfamily.in>
 <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Apr 2022 05:48:08 +0530, Joel Selvaraj wrote:
> Add support for backlight. This panel supports backlight control
> through the QCOM WLED driver in Xiaomi Poco F1 device.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom wled backlight and link to panel
      commit: 89561886191c0dcb6ce1491f14552eac16e14a80

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
