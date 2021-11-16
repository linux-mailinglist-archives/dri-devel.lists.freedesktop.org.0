Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368294531AD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 13:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7B86EA51;
	Tue, 16 Nov 2021 12:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE516EA51
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 12:02:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso2217871wmf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 04:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lDB8txmndiyc2KBELD6n3DhmgYu8EUzPVuapNCQo1zs=;
 b=mldJEOu5NnmqmiMKzPY9mz4IDbBaAR8ZcKLbG0mHBR1p/bymyHk4A4WmkcwvmMlC49
 QXby76RujpVem0BcrrnMrZl6V/5ovityJgIR9R7IPEF0w0lN9nfNaFvG0ZcaH+odLMrV
 BLXG0Gj43otjSUslxvnTqFnMIdf5lgrLEgxMaJF7BAnLMjfYaLV9ccYKHnkaHna67Tc3
 f+NUSLHyELqD+EhXH//cGilrC5xyNQn+yfKIGQYlMBCY4T69ZIUyZOXC7PX9sLQuUUkd
 3TE726MkaJFV+JTdlj8n3RWk/IG/usYTIma6oaI5FhMfjDY0uR1acYx+8yBvUL03L8zj
 xviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lDB8txmndiyc2KBELD6n3DhmgYu8EUzPVuapNCQo1zs=;
 b=IGAq/WnatZ8TGMjsiGNRwyO0UIy0qeq1NooK7YZkS8xVRKvuJ8PvgBu1bjasjcmdnu
 QEpwCqp81BrGUJAh4hK+YD0HNF3gJVgSXSCDr4vv6DuTqNWUJLVguMhGaOWJfQe8kk8M
 T9I1Ub6t7SZmSddGwpv+4vM/DFPVdG9nH+rxLUE4rtCmqCyopvjyFOXM+Bb8ODmjDD33
 +aUpfiDlLNpbRbv8rFRPfgTW1wpQE0ljmVGC0lzaQ9ugFKdG3gI/lvaTCqZHuNn4T3ZM
 +evD5dKeKmR9ZoL5gRAZLTHQlY+e65xoNExHf/+DOx6W0014GKZ2Rkba5jaokrVC+cpl
 OkNw==
X-Gm-Message-State: AOAM531A50jqALC/rz6gLZaLy9c4oNzT8Mz1A1TxDzmHCDLNF5chRi2i
 SC3es3BLh+yLteTj38kHTOmJHaS4eGJ8lp5E
X-Google-Smtp-Source: ABdhPJy0s8g4BijfftlxD/F7elVGNq4pmmk3Cu5+zRpMwyxjgqhMYGMoZqI1RiG+YUAJq6W28VKZIg==
X-Received: by 2002:a05:600c:a0b:: with SMTP id
 z11mr70111480wmp.147.1637064136454; 
 Tue, 16 Nov 2021 04:02:16 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id l124sm2298443wml.8.2021.11.16.04.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 04:02:15 -0800 (PST)
Date: Tue, 16 Nov 2021 12:02:13 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/9] backlight: qcom-wled: fix and solidify handling
 of enabled-strings
Message-ID: <20211116120213.n7qxqfi62lrxhyl7@maple.lan>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115203459.1634079-1-marijn.suijten@somainline.org>
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
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee

On Mon, Nov 15, 2021 at 09:34:50PM +0100, Marijn Suijten wrote:
> This patchset fixes WLED's handling of enabled-strings: besides some
> cleanup it is now actually possible to specify a non-contiguous array of
> enabled strings (not necessarily starting at zero) and the values from
> DT are now validated to prevent possible unexpected out-of-bounds
> register and array element accesses.
> Off-by-one mistakes in the maximum number of strings, also causing
> out-of-bounds access, have been addressed as well.

They have arrived piecemeal (during v1, v2 and v3) but all patches on
the set should now have my R-b: attached to them.


Daniel.
