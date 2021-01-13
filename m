Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4D2F53D4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 21:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC66A6E8B4;
	Wed, 13 Jan 2021 20:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B266E8B4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:08:04 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id m6so1936453pfk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=GvAOHyyN5kCSb4kRh6kQZkCrsdblAjjT4mfEiQcMWjs=;
 b=SRJDpTRoOnc/55yeZuX62rE09EfROrumcVxGsSu+cxj0OXOTsnzWramLoXqRGB8eCM
 Cr0sG6Nwerih/HfQSGX7qRIkN9AdkSQWoWDfusKgi7Di2QhGR7JY59FP0rea+YUAFShu
 POVeQWkvW+Lc/HJkTEBmPTZruw849rQIXeHQUfBQ1OIUjrh3p8GWeysJR2gNQG5kqZMG
 VhGoJ3lr3UkhxHOpCmuNHhirbAyYsIt4NWbQnGhdS0xOjGPIk/klKBT0FWjjVWtI9lRi
 LKP8AO1Y9BfQmTNDqOADZ5jCHoM5k0ICtR5UzKABdqDq+sFz3mu0zkLx0gD1dyHBFVHS
 M/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=GvAOHyyN5kCSb4kRh6kQZkCrsdblAjjT4mfEiQcMWjs=;
 b=gSAi99F28LOejlwDVCPL+jygfkYokxBpeujmVCzuEXt7RUH06b6IhZk4X7KXqi7ZOG
 wXNPQCxGOhkyjR7+CGl55JApQ1yyrDTsURwLp8sEDGxmWmM4LaaVaL+yliI2m/DN7PpU
 9porLPWRIr1U6jhs4UiS7X80sasrn6CH9dwLW8eW1iInWp+PwLBsDFlf9X89JZcoOqRQ
 yuAXaafUaEsjMTw4mq1xVBz2GwRl7v65y/ZXSagP+45HQ8Jxw8aIIw4n75uHi/c8mJrC
 gGFJP8lefz1HdNM/G3RTeAeoDR7sFMaqfEOsmRUpdWb39ULUxlxXzrTkgkhm6Ec5urFK
 95Uw==
X-Gm-Message-State: AOAM530XkMHAoGfTPaJ4qsxju5NlGT3R6wvsnSpHbHyLbaEBAA/Guj7t
 S/oixNO+JwuuKy8dPKw+QeM=
X-Google-Smtp-Source: ABdhPJz4GNVsIV8HRuAtlYRKV33MLDu80l1S3JbtW2/aUF32mW/+4BeeISwnc8RFWx7VccbvU31UXg==
X-Received: by 2002:a62:2946:0:b029:19e:6b80:669a with SMTP id
 p67-20020a6229460000b029019e6b80669amr4023104pfp.42.1610568484351; 
 Wed, 13 Jan 2021 12:08:04 -0800 (PST)
Received: from SLXP216MB0477.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:9::5])
 by smtp.gmail.com with ESMTPSA id x12sm3417591pfj.25.2021.01.13.12.08.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Jan 2021 12:08:03 -0800 (PST)
From: Jingoo Han <jingoohan1@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 24/31] video: fbdev: s3c-fb: Fix some kernel-doc
 misdemeanours
Thread-Topic: [PATCH 24/31] video: fbdev: s3c-fb: Fix some kernel-doc
 misdemeanours
Thread-Index: AQHW6buCNbupbwFtTUu1nVILhje9oaol/Bqf
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 13 Jan 2021 20:07:58 +0000
Message-ID: <SLXP216MB0477F22596BA2B6AB34CDF45AAA90@SLXP216MB0477.KORP216.PROD.OUTLOOK.COM>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
 <20210113145009.1272040-25-lee.jones@linaro.org>
In-Reply-To: <20210113145009.1272040-25-lee.jones@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
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
Cc: Ben Dooks <ben@simtec.co.uk>, Han Jingoo <jingoohan1@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/21, 9:50 AM, Lee Jones wrote:
> 
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/video/fbdev/s3c-fb.c:104: warning: Function parameter or member 'osd_stride' not described in 's3c_fb_variant'
>  drivers/video/fbdev/s3c-fb.c:174: warning: Function parameter or member 'variant' not described in 's3c_fb_win'
>  drivers/video/fbdev/s3c-fb.c:345: warning: Function parameter or member 'pixclk' not described in 's3c_fb_calc_pixclk'
>  drivers/video/fbdev/s3c-fb.c:345: warning: Excess function parameter 'pixclock' description in 's3c_fb_calc_pixclk'
>  drivers/video/fbdev/s3c-fb.c:742: warning: Function parameter or member 'transp' not described in 's3c_fb_setcolreg'
>  drivers/video/fbdev/s3c-fb.c:742: warning: Excess function parameter 'trans' description in 's3c_fb_setcolreg'
>  drivers/video/fbdev/s3c-fb.c:1142: warning: Function parameter or member 'sfb' not described in 's3c_fb_release_win'
>  drivers/video/fbdev/s3c-fb.c:1172: warning: Function parameter or member 'win_no' not described in 's3c_fb_probe_win'
>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Thank you.

> Cc: Ben Dooks <ben@simtec.co.uk>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/fbdev/s3c-fb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

[...]


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
