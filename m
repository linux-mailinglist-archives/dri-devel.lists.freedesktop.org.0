Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E444E5D3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 12:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFA26ED84;
	Fri, 12 Nov 2021 11:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579BF6ECDE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 11:54:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i5so15089269wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xz6YO9tCi5FN4wwADc5RuSYXbQOxI0FfjZ6/8K/fqrM=;
 b=GasCN4JtdArIIS+5Qcq84OctFN9Jpn3uAD/FCH0Ygj+/MKZXblNqSGH+Zswh5qq5pV
 vl9VqzCF7wn1QPA5OxLualPg+dWN5hGHFNadLz023hDpSTa06QRyke2y/R/9nwgPf/lR
 WAVwVWPjDZTxvsKwciHcisC0Y1A69IjDTNsBGWnR0UXfmWeyPVBF5DadotRaJzsfzuff
 P9DfrJKJQ1JQwk6xtekeOJ+UrNdmNiVOzeBh4WWYLSyRB5BdY2CVvJqMduWGFkQVbuoI
 nv+PJiiyw494bYgAsQvevPDDFfkdQSo+JPrbKYRUzvvPMV7F74H/aeot0ChaCVHRMUPq
 LUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xz6YO9tCi5FN4wwADc5RuSYXbQOxI0FfjZ6/8K/fqrM=;
 b=ZKjiJK50WyRG1lyWTVlTluverp4oZnqL1fpYOqDGhGtJQIF0Z1jinjtaCvpQuoLxsv
 wIaLi7FhBrXcLlLbB9o/iBAg+GDitp87ffL1nH+7X4hKlHNa4zm136yV6ADk8NN89WA4
 rc73nO8xq3PKhzAsM7AamCnVv3Bt+7NCL8WspkM2CuOXModm1ci+l2pCZzNSPXVD2cQL
 2ResPDfmmOiX9OaE8G+OOkspYMnqBdKCAhxSLkANxmFzp8qivBF8/i6bOzNhJMNhzFp7
 87+Xtlw5N1Z361uXXPuDg/MX9DTxIRyk5vxkJoBWxuNsCRSkm2V3HX5ly/dsCSLpmjK7
 AOLw==
X-Gm-Message-State: AOAM531bF1naBjhrgexdU9+m9xin21CxU6rbsu3Y11XJz9xzHp41maJ7
 dYnENkyIwBJMR9fy3BEWPqCQvw==
X-Google-Smtp-Source: ABdhPJzKY1hxDEOL1WG7UNNqDzCOwMyQuKQTZu3mQhH9+LDBluzp2qvZX7JbowsrVOatJpuxV8ukdg==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr17459513wrs.270.1636718091828; 
 Fri, 12 Nov 2021 03:54:51 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id g13sm5191616wmk.37.2021.11.12.03.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:54:51 -0800 (PST)
Date: Fri, 12 Nov 2021 11:54:49 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [RESEND PATCH v2 01/13] backlight: qcom-wled: Validate enabled
 string indices in DT
Message-ID: <20211112115449.pg2h3gjzxok6dqho@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-2-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112002706.453289-2-marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 01:26:54AM +0100, Marijn Suijten wrote:
> The strings passed in DT may possibly cause out-of-bounds register
> accesses and should be validated before use.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
