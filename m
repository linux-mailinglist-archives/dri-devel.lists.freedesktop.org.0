Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8636B730F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 10:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846A010E0FB;
	Mon, 13 Mar 2023 09:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5767610E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 09:47:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so545881wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678700833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iYmD5MsF3oIPjX0k1aZdNm+DBHk9Xc24//Dz7MF2Y9A=;
 b=wkmGW7wc2pdyPdIU+Nm357li92G76oKI9w/bmdVrHlXV/QG2Ez37OEMxc7dIJPLvMf
 Cu666skGNPCFLE5/XrAVnWCBWpeATwrtPxtYqPkwZ7qSYZU2rhOji0tKhTgkHycLKEuL
 v7QjibKtqqBPtrLnEj1UQxGdp0l2PXSStc1kJxIybIvQu/2WHL6Xn+SpM/UKVfKtSkpl
 V5XeMo7e470oKaYKCkS4XCIBlq7lddvBH2YR5DjE4bwVe+wpNAxWB1Vekz1n6u4cdYUd
 I/4RlJ2Uet6JsF8lP4cgafvyKliIrIk64Jkw1JYwRR2xMR0s+Urzuo/WrtGNSVdhgxju
 Dbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678700833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYmD5MsF3oIPjX0k1aZdNm+DBHk9Xc24//Dz7MF2Y9A=;
 b=XaYIyF+TKEmVhOaSkCXfp0t35pWhcKG8pwNfASWj8IYlobh8Q8XK48obvzf7QiCw1K
 Eh6T7UZ14jcKjz1V+KqIAK2AacxWGMP2Sya6A1AvGgES+sidQAvt61LUFaGor+veer3g
 adqwNh2OjSiGpZn2GSxD/OJlzV19eiZpqJXf09wq3Chd2aBvwvobC1+ogch8ws1rRSbI
 PpLFcuz4q6RViThORTkgCXeoqliQ3tXK6dGyZPd4iKSeHemO7M0Lxzdr9mwIrDh1gwkB
 G7EhWt8KIdk3Kl10PzXOM2Zip88y0MRrg7tHPyDpxDqo/4voaZs1/qYRktT4b913goP/
 +dWg==
X-Gm-Message-State: AO0yUKVWCCjaYTDKM35HK3z3wDB9KWJgF29Uw8EdphXaTTs8FB7g5or4
 FhdJDQo9Twrz+1M/tngWlkcAv0Vun1qBJDUNW4hqYw==
X-Google-Smtp-Source: AK7set9Sg80xuB9cO8VB2x2eShv9xTBr9GnHLZPdvslFpUZbRRXOJJT3ZkwrYl/Y1o84knGB9MDhow==
X-Received: by 2002:a05:600c:4fcb:b0:3eb:2e32:72c3 with SMTP id
 o11-20020a05600c4fcb00b003eb2e3272c3mr10209094wmq.22.1678700832758; 
 Mon, 13 Mar 2023 02:47:12 -0700 (PDT)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003ed25c0e124sm1907853wml.35.2023.03.13.02.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 02:47:12 -0700 (PDT)
Date: Mon, 13 Mar 2023 09:47:10 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] backlight: hx8357: Use of_property_present() for testing
 DT property presence
Message-ID: <20230313094710.GA55049@aspen.lan>
References: <20230310144730.1546101-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144730.1546101-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 08:47:30AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
