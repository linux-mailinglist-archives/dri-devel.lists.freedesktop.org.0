Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74452565AE7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C7510E592;
	Mon,  4 Jul 2022 16:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E2310E06A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:27 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-10bd4812c29so3083698fac.11
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VCyTfnH8NjSlB3wEmVmV8+vhbVUl0hOr4poBEopVoGU=;
 b=ziliVqzxy9/dOwyks9UKmfls7XduSVgh+N+IrqkD3A0u3sXMbzU3JczzX6OH1WaANo
 CB72tXVOYtCU+j1mqaWhM4IPQOq+14fuPISKLGGJkjyBQvngZPGhrTEqw6dt1fXm56LS
 aVWn3H3aIyZBk4nvM0s2cdauUBXh2PHECe0oC9UWmmR538VZB94H39VvxLf18YU0eRzI
 ykK6FW5hgOffY39yEUbCQwa5SOYPzYjVXvcsfUIZHYJ0wmIVkCedfNY4pD30gV/bXtST
 kSwRIZ4S6nx90lkm4dxVMCM2kOceLEbljBQhh60YXB+yDnHL2u3w5n4MSVlabNX0euIh
 LC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VCyTfnH8NjSlB3wEmVmV8+vhbVUl0hOr4poBEopVoGU=;
 b=HuI3q07rIj9bqKPLiXy57EaCaEWXJwINoIx00klQojmERrRYHfPu0iZftcQUGwrXiN
 gvJ0exVsh1fdyLQFTz0UAOzNLZulhqiAnMcgrtQdTYEj4jc2o3/pecz9DOF/4KMYZCLl
 9py3dQSrAoucplIq/CodQN8dlyXnpPuU5MoP8z3CafS3X3EFG4o0KvIOBL8ABc34VNM2
 oe/mRhiKWQ8xQsvu5k3VeU6H1/XzvdiyWx+0PAyAOqVXU4q1zvf1G30Utv+WldUizGTj
 kxDUQ6ry1OjK4t6Sj2zJ5JX7eYz9C/twLZxFx1JQ4/FHsCnda82Y0C53PwKlTCiB2JSx
 Hflg==
X-Gm-Message-State: AJIora9TkYoC23a3TV9RdAC6/sqL99ypHTqFplmm57yYB+rPZb9/OdyP
 fvG3F2ZtOl9lQOExxbujt4tfng==
X-Google-Smtp-Source: AGRyM1tUe+bpIIrEEtZ/9Nb0bCXCTN+7KLHFUmOrWnqm3jYRBvbR6skQvCorgt/Z+fIn6n4ArzIUHg==
X-Received: by 2002:a05:6870:7097:b0:101:229:eb1b with SMTP id
 v23-20020a056870709700b001010229eb1bmr14324564oae.121.1656820646368; 
 Sat, 02 Jul 2022 20:57:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:25 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-leds@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: qcom: correct SPMI WLED register
 range encoding
Date: Sat,  2 Jul 2022 22:56:22 -0500
Message-Id: <165682055968.445910.9322003122830573708.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
References: <20220505154702.422108-1-krzysztof.kozlowski@linaro.org>
 <20220505154702.422108-2-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 May 2022 17:47:02 +0200, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces and with
> size-cells=0, they should be encoded as two separate items.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: correct SPMI WLED register range encoding
      commit: d66b1d2e4afc0c8a9eb267740825240b67f6b1d1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
