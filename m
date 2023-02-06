Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6D68BBE5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 12:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F9810E17F;
	Mon,  6 Feb 2023 11:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E119E10E17F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 11:42:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z13so973004wmp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 03:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5mcLZp+bwHljE1RPuf6xDhCdiFhlDxm+3HKZwHetgGw=;
 b=S1/cNS9JWmRCZjJP0bvEApYHgfPv/5Mq/zmU04VMCzjhe03zfE/kTViHbevV8VeLFR
 VVZOmmsX8Vj+MgINVGGJ5zj1Xo/DQKz2nWCWBoMT0t1iiwlchcu4Aw8A2Y9YTE6o/FH2
 wL2NXNHmCI9o/ISJc8HzhjPHGlauMuGSNVUZN3ZrQLw/8cLzLL97c1R72iH+jaoxkJLV
 dzf96GbhIS+qtyumbaTEEvVjuhLwHUgQPwFwtD02wG59fmo7DHGzAJPwTbCCvkAmQniN
 RmQ3W3VoE3Z37TcraP0c5v4olmO01gXh3ukNu80/tDe/eg1VVi6VKhQjvs+tInOAAK/R
 5Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mcLZp+bwHljE1RPuf6xDhCdiFhlDxm+3HKZwHetgGw=;
 b=AfnN+OJac6pMQb1J1n5riHeXFk8pRsR1/3J788U+vkzEltQGeAQ/mGdzU2djOJocQ/
 dRVxBciX6PoyHoZ/+daBaNd6xATDlQnII1yhIedDdfVOYDkT7plXn8Hn6RCf83mc2e/S
 aOKe22H9ZqaM6bLb4EiuRQm2b1j19uikSftQ4MgUmN32Yjqvo/qO7gLigmFoC6YMasDE
 emOGKwDvzRfE4iYqE3YDQwBnAKBPH35haIsyMPHGaS84ni4TZFBNNXXhzvlHRmJ2uu1r
 GwijadacN50Pdxtn0dJVk+/DWxuq8h+u5hxBtYL8a/DTJ16/csHoLSsEUUWgZacNOtRf
 d7TA==
X-Gm-Message-State: AO0yUKWWLkXtLaEEj5y68xEeOsHlqRNVXVSOpvDpB5I7alZQ78KLdHjR
 3O2PfFgQUfsgZrwPG6A15Yq1xw==
X-Google-Smtp-Source: AK7set/0e8rb0pkCcbZULGmSmISHb9E98R7iG5wsZXc2LS2PbucXN5Ox8X2GEu4jmltN0YSmz+C+0g==
X-Received: by 2002:a05:600c:1d99:b0:3dc:d5c:76d9 with SMTP id
 p25-20020a05600c1d9900b003dc0d5c76d9mr20747824wms.0.1675683761383; 
 Mon, 06 Feb 2023 03:42:41 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003dc3f07c876sm16116888wmk.46.2023.02.06.03.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 03:42:40 -0800 (PST)
Date: Mon, 6 Feb 2023 11:42:39 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2] backlight: hx8357: stop using of-specific APIs
Message-ID: <Y+Dnr7bzJ7XDdXH1@aspen.lan>
References: <20230131225707.3599889-1-dmitry.torokhov@gmail.com>
 <20230131225707.3599889-2-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131225707.3599889-2-dmitry.torokhov@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 02:57:07PM -0800, Dmitry Torokhov wrote:
> There is no need for this driver to be OF-specific, so switch it to
> use device_get_match_data() and stop including various of-related
> headers.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
