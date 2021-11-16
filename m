Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AED453187
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 12:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942406EA71;
	Tue, 16 Nov 2021 11:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37C26EA51
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 11:56:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i5so37065773wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tykKfzZRZs8W8LB8dDzw5i3CD5rhrU5zWD1WHrFGu6I=;
 b=PdFx29zeOFtKWYfkjdFXu4FzngjheOfZFBdUnmdD06TBxqyhoP6ZiWipqG8zf5x9K5
 Zk/t5mwNF7kmhQ+x98VH6LWeOs4ba9wDFEdZQ4vAan0vTm4HNF+cH013ecdNxfv3/w2y
 Y/G/U+1hr4yNWe0jyu2HzBrH/b1OxP8Nw/r7bgQjDI3vq0eGP+tuYkgALS0YS7LiCsYv
 /4z7Oi7UR2jJs2oMtIIDa8MTnoL+UKxaoccn2YEkC3gXvBxL67XBhKJOc6yxemkZRcnN
 c24vxX82rD3hgOG4IxBEfTTcuVB/r/mUJvyZIsuMLNQDdFjNiFJbaq5WVtrksKSDpiAv
 DWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tykKfzZRZs8W8LB8dDzw5i3CD5rhrU5zWD1WHrFGu6I=;
 b=O1nxIQ4tIGhWQJvj9GAO1LCF2Vzx1jr7BrOK9nvJsIwwiWwAkJIcxVqnLMG+xP1RqM
 owiGHFD/1QHprUL+bNsGe/E3dJYaZMvIPE1pCfbK4WF1J9gKkmtkSIeHdf0C5jPsr7JF
 61gJWRAkCJX1Kz3aGo6ENv0p4xWi7HqtNT9BEQ64g00aURs0gmc6lPpf115hBIaf4hqh
 xFoCqjq7Ve8awtuKQteb91/aYbRYwSLRKOP0EtLWIor3sQHvbFJSNxFAVTmIgjsEnens
 7upiXDW8or+Zjch7ZtyjabibAD2slmR1ROeCk2uAZuvitP1gubHLa0+ro2P4vncYs2qf
 jW/w==
X-Gm-Message-State: AOAM531DtITrPFMzARbqM7NeDtUR8YCHEGlUCIof+ueLei6YG3fkB3qz
 fjIg+hLO6M9eUzMtAn5u0XwoA+i7IAhhUE6k
X-Google-Smtp-Source: ABdhPJx+DsVIlJi3qFUEgUdKvjqrCDE8LrH3TXHbTDv/qIgV8UK1fSvVa2mKOiRmfZXNdh/uzdkPpw==
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr8549336wrz.231.1637063800263; 
 Tue, 16 Nov 2021 03:56:40 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id m125sm2157270wmm.39.2021.11.16.03.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:56:39 -0800 (PST)
Date: Tue, 16 Nov 2021 11:56:37 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 3/9] backlight: qcom-wled: Use cpu_to_le16 macro to
 perform conversion
Message-ID: <20211116115637.22v2pluxkni36ehr@maple.lan>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-4-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115203459.1634079-4-marijn.suijten@somainline.org>
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

On Mon, Nov 15, 2021 at 09:34:53PM +0100, Marijn Suijten wrote:
> The kernel already provides appropriate primitives to perform endianness
> conversion which should be used in favour of manual bit-wrangling.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
