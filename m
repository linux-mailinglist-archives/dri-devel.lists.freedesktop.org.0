Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB64223B5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 12:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46436E3D0;
	Tue,  5 Oct 2021 10:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95026E3D0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 10:38:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r10so20024227wra.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H9PK5OVBJJh8Z07ZGNAQ/njfImaF/ljJYKuf9Kp7Cqs=;
 b=ALdOKXeOQWsAyarKfutyvCbCybKfyRWHwCFdpQIIag2dprgW9sMW4ZInIwcvqlEn0E
 J7CxsV5kMMZWpyajS3O+xSnIR2j4zWZl6YSb2ARmq3WUt8uX9qVdkefSYiVjZnatziTf
 5yb7MFMDb5jA8Bd/9EuE4kIuewjEZ6NUaLxI9Ni7YytmoX8XLKltlurxKILT/YRfFqBy
 eqbMyYbs468+5X3T7rfNDHAxGZ8Yec2ic6pUkCSR8tVinwUSROM8vOC+7Bgnb4JGye3Y
 zyY66eIBk1bHG3IhrCKBwTSDxqP/JKvXVFkCghsAlQ9MzkB/eVl8LWBm+/8pFx318NNC
 NXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H9PK5OVBJJh8Z07ZGNAQ/njfImaF/ljJYKuf9Kp7Cqs=;
 b=TqR7i0gCZnGMQzY2GeMvR1jwTjSlrNRTnyYE0uHwEg2t6BmlmK6+Ti+2Smu+sghbIe
 55KxySJWVqQpH1g7A+YeYMaZfP4IB5uT0Gg6VnRaCNRKIvk5rV6JcdPUFw+Xp8j6RVfR
 d55wUt0HlmIBREi9GAcwfmVnAZC9E5jNQ1MnlJEe/qiLxO7trn/+seEgLNA6k1yFJblT
 tgvM2iiE6dPGf8c+YvG3omBpLLRjoZboMtrlpG7ZGgJZjHca79IoZ+kk7sbxg9bK7ie4
 MoxdGSc2Bozw4tM1nINfpJc11B9E1vxj4aIMKuBsNXvM7gZI7rMQTTs47iGyojoRZxpF
 1PaQ==
X-Gm-Message-State: AOAM530UnNxsUMLHZ88qDUvA+JHvBUTQrvjWjMCeFaK8tSPkArYKouTh
 LWC3loJMrEfLd3BuvLf7MbRELg==
X-Google-Smtp-Source: ABdhPJzsbxS7Sgk4dlKMXvgUGEOt3+fcZUe+f2XcxzvViCSjyKDrehXfNrlJzGPcrJ24mbBQtcENCA==
X-Received: by 2002:adf:df91:: with SMTP id z17mr9383829wrl.434.1633430325318; 
 Tue, 05 Oct 2021 03:38:45 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id g21sm1393351wmk.10.2021.10.05.03.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:38:44 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:38:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <20211005103843.heufyonycnudxnzd@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-6-marijn.suijten@somainline.org>
 <20211005091947.7msztp5l554c7cy4@maple.lan>
 <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
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

On Tue, Oct 05, 2021 at 12:06:06PM +0200, Marijn Suijten wrote:
> On 2021-10-05 10:19:47, Daniel Thompson wrote:
> > On Mon, Oct 04, 2021 at 09:27:36PM +0200, Marijn Suijten wrote:
> > > When not specifying num-strings in the DT the default is used, but +1 is
> > > added to it which turns wled3 into 4 and wled4/5 into 5 strings instead
> > > of 3 and 4 respectively, causing out of bounds reads and register
> > > read/writes.  This +1 exists for a deficiency in the DT parsing code,
> > > and is simply omitted entirely - solving this oob issue - by allowing
> > > one extra iteration of the wled_var_cfg function parsing this particular
> > > property.
> > > 
> > > Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > ---
> > >  drivers/video/backlight/qcom-wled.c | 8 +++-----
> > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > index 27e8949c7922..66ce77ee3099 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c
> > > @@ -1255,17 +1255,17 @@ static const struct wled_var_cfg wled5_ovp_cfg = {
> > >  
> > >  static u32 wled3_num_strings_values_fn(u32 idx)
> > >  {
> > > -	return idx + 1;
> > > +	return idx;


> > >  }
> > >  
> > >  static const struct wled_var_cfg wled3_num_strings_cfg = {
> > >  	.fn = wled3_num_strings_values_fn,
> > > -	.size = 3,
> > > +	.size = 4, /* [0, 3] */
> > 
> > 0 is not a valid value for this property.
> 
> These comments represent the possible loop iterations the DT "cfg
> parser" runs through, starting at j=0 and running up until and including
> j=3.  Should I make that more clear or omit these comments entirely?

The role of wled3_num_strings_values_fn() is to enumerate the list of
legal values for the property [ 1, 2, 3 ]. Your changes cause the
enumeration to include a non-legal value so that you can have an
identity mapping between the symbol and the enumerate value.

An alternative approach would be to leave the enumeration logic
alone but set the num_string default to UINT_MAX in all cases:

-	cfg->num_strings = cfg->num_strings + 1;
+	if (cfg->num_strings == UINT_MAX)
+		cfg->num_strings = 
+	else
+               /* Convert from enumerated to numeric form */
+		cfg->num_strings = wled3_num_strings_values_fn(
+						cfg->num_strings);


Daniel.
