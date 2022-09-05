Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8B95AD455
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052F310E19D;
	Mon,  5 Sep 2022 13:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8868891CC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:56:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id f15so6731167wrw.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=VT+d8Sbd5W8mLqa1j12zk4P3E6vPQDfHFgu8wV0c8kU=;
 b=KQBkL8+LUCINiBlGPu96tzFBLuXNzE4riXvwmM+vXKMQFcBgsRUtPqCEr9GTtspFfs
 2GF5jEmayQUJQJg9eZhXvVztrWbQwUI5ymbTWJRv/O3d+TSiX7ZNKIaW3/ceHMxkPsF+
 nLZHRLUkPdNIggmbms6AGxLyWIL5xj+U/us6OiPHqla1R0mfccSmG/8V0a66Uzc6Ls2y
 A9TtdU/FZDlF1KN8PcbU5Q8fI84vL2T1olUwRM4I6Mp0nzuUWLb9K9VTlZ3xoUmvTpY0
 k81vE2RyR8tTOpzuixJPQujvaN5jcNeRAlUv+wvr1mqpe5foFwM5+SB4CeRMCAuE8r8u
 PvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=VT+d8Sbd5W8mLqa1j12zk4P3E6vPQDfHFgu8wV0c8kU=;
 b=tnaVXwRTYQDPnLf4kYCEbTyLjXC+w419EaLs3h4Udm8M8eyKWLwgNGbuzPrN0J1rKY
 xCAQj9yeBtZcMTch/WtkIoVvXug6OHCfrYNVZnGZUTf7kEuyKozrBannJjeflYImvNe/
 JyJjJW9XDW6L4kSnaxc9uYQuwR+/y/5Zb77wZAay68dB3sCMJzBovIJQfDuuK6V4r7TT
 jfk32GXmoaR7hepKtmbyCnUjGJ2YbkIa8wkIKmv7x1nqr+o+8yIoOWcm/bJVVSlyh1nR
 AAms6Q+Gz/0arN4txPHoRq9k/TTqdSBkEYALWjEaBuI3PAWXucvPnDDbwvtnIN2gyQ8n
 vFXg==
X-Gm-Message-State: ACgBeo3kagesbk8Cuyxdq0q9cuV6WgJI6aldphPM0YHWLsYllA0N41yW
 OUUzPsFGdTtPmvRnDPSbLyzxtw==
X-Google-Smtp-Source: AA6agR7Emswl4TxFnmpI+2Jss4ARLU9twp2S5tGeirFuYf0ymQXCu5X1srK1xfcsCVgZNqNABJ8ABg==
X-Received: by 2002:a5d:48c2:0:b0:228:6226:381a with SMTP id
 p2-20020a5d48c2000000b002286226381amr5239315wrs.366.1662386195132; 
 Mon, 05 Sep 2022 06:56:35 -0700 (PDT)
Received: from google.com (ec2-18-168-47-91.eu-west-2.compute.amazonaws.com.
 [18.168.47.91]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4e08000000b002254b912727sm8820342wrt.26.2022.09.05.06.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 06:56:34 -0700 (PDT)
Date: Mon, 5 Sep 2022 14:56:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND] dt-bindings: leds: qcom-wled: fix number of
 addresses
Message-ID: <YxYACwJmo/FlbVgk@google.com>
References: <20220720163720.7099-1-krzysztof.kozlowski@linaro.org>
 <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5db5da26-3689-928b-433e-72c690014b64@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022, Krzysztof Kozlowski wrote:

> On 20/07/2022 19:37, Krzysztof Kozlowski wrote:
> > On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> > also fixes dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> 
> The resent was a month ago. I assume this won't go via LEDs tree, so I
> will resend (again) without Rob's review, so it could go via Rob's tree.

If you have not already done so, please resend this and Cc my
kernel.org address, as per MAINTAINERS.  Thanks Krzysztof.

-- 
DEPRECATED: Please use lee@kernel.org
